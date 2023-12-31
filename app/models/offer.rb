class Offer < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy
  has_one_attached :photo

  validates :title, presence: true, length: { maximum: 255 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :description, presence: true, length: { maximum: 1000 }
  validates :address, presence: true, length: { maximum: 255 }

  include PgSearch::Model
  pg_search_scope :search_by_title_and_description,
    against: [ :title, :description, :address, :job, :rank ],
    using: {
      tsearch: { prefix: true }
    }


  def self.jobs
    ["Guerrier", "Mage", "Voleur", "Archer", "Ninja"]
  end

  RANKS =  ["S", "A", "B", "C", "F"]
  def self.ranks
    ["S", "A", "B", "C", "F"]
  end
end
