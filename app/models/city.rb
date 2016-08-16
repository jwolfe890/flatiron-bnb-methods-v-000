class City < ActiveRecord::Base
  has_many :neighborhoods
  has_many :listings, :through => :neighborhoods

# def city_openings(start_date, end_date)
#   Listing.all.each do |reserv|
#       reservation_objects = []
#       reservation_objects << reserv.reservations
#       reservation_objects[0].each do |list|
#         open_reservations = []
#         if list.checkin > Time.parse(start_date) && list.checkout < Time.parse(end_date)
#           open_reservations << list
#         end
#           listings = []
#           open_reservations.each do |res|
#           listings << res.listing
#         end 
#         listings
#       end 
#       end  
# end

def city_openings(start_date, end_date)
  if self.listings.joins(:reservations).where('reservations.checkin > ?', Time.parse(start_date)) && self.listings.joins(:reservations).where('reservations.checkout < ?', Time.parse(end_date))
    listings = self.listings 
  end
end

# def self.highest_ratio_res_to_listings
#   value = []
#   City.all.each do |city| 
#     value << city.joins(:listings).where('reservations.count / ?', city.listings.count)
#       binding.pry
#   end 
# end
  # joins(:listings).where(self.listings.reservations.count/self.listings).max

# def self.highest_ratio_res_to_listings
#   value = 0
#   City.all.each do |city|
#       city.listings.each do |listing|
#       if value < (listing.reservations.count / city.listings.count)
#           value = (listing.reservations.count / city.listings.count)
#         binding.pry
#     end
#   end 
# end 
# end


def self.highest_ratio_res_to_listings
  value = 0
  collection = []
  City.all.each do |city|
      city.listings.each do |listing|
      while value < (listing.reservations.count / city.listings.count)
           collection = city
          value = (listing.reservations.count / city.listings.count)
      value += 1
    end
  end 
end 
collection
end

  # def self.most_res
  #   binding.pry
  #   self.all.collect do |city|
  #     city.listings.max { |a, b| a.reservations.count <=> b.reservations.count }
  #     end 
  # end  


  def self.most_res
      Listings.all.max { |a, b| a.reservations.count <=> b.reservations.count }
  end 


end



 




