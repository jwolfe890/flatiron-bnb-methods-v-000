class Listing < ActiveRecord::Base

  belongs_to :neighborhood
  belongs_to :host, :class_name => "User"
  has_many :reservations
  has_many :reviews, :through => :reservations
  has_many :guests, :class_name => "User", :through => :reservations


  validates :address, presence: true 
  validates :listing_type, presence: true
  validates :title, presence: true
  validates :description, presence: true 
  validates :price, presence: true
  validates :neighborhood, presence: true

  before_save :set_host  

  private

  def set_host 
    self.host.host = true
  end 

end
