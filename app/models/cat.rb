# == Schema Information
#
# Table name: cats
#
#  id          :bigint(8)        not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Cat < ApplicationRecord
  COLORS = %w(blue red yellow green brown lilac pokadot)
  GENDER = %w(M F)

  validates :birth_date, :name, presence: true
  validates :color, presence: true, inclusion: { in: COLORS, message: "%{value} is not a valid color"}
  validates :sex, presence: true, inclusion: { in: GENDER, message: "%{value} is not a valid gender (M or F)"}

  def age
    bday_month = birth_date.mon
    bday_year = birth_date.year
    bday_day = birth_date.mday

    today = DateTime.now

    if bday_month > today.mon
      today.year - bday_year - 1
    elsif bday_month < today.mon
      today.year - bday_year
    elsif bday_day > today.mday
      today.year - bday_year - 1
    else
      today.year - bday_year
    end

  end
end
