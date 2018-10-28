class Functionary < ApplicationRecord

  has_many :cars
  has_many :addresses
  belongs_to :user, inverse_of: :functionary, optional: true
  accepts_nested_attributes_for :user, reject_if: :all_blank
  
  validates :name, :matriculation, :function, 
            :leader,  presence: true

  enum function: [ :leader, :tecnical ]

  scope :with_functionary, ->(user){where("id = ? OR leader = ?", user.functionary, user.functionary).order(:name)}

end
