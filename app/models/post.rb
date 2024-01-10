class Post < ApplicationRecord
  validates :title, presence: true
  validates :title, length: {maximum: 20}
  validates :start_at, presence: true
  validates :finish_at, presence: true
  validate :finish_at_should_be_after_start_at

  def finish_at_should_be_after_start_at
    return unless start_at.present? && finish_at.present?

    if finish_at < start_at
    errors.add(:finish_at, "は開始日以降の日付にしてください") 
    end
  end
end
