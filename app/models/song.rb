class Song < ApplicationRecord
  validates :title, presence: true
  validates :artist_name, presence: true
  validates :title, uniqueness: { scope: :release_year,
    message: "should happen once per year" }
    validates :release_year, presence: true, if: :released?
    validates :release_year, numericality: {less_than_or_equal_to: Date.current.year }, if: :released?

#  def release_year_must_be_in_the_past
#    if release_year.present? && release_year > Date.today
#      errors.add(:expiration_date, "can't be in the past")
#    end
#  end


end
