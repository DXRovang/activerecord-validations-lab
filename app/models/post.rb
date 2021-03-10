class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w("Fiction" "Non-Fiction")}
 

  CLICKBAIT = [
    "Won't Believe", 
    "Secret", 
    "Top", 
    "Guess"
  ]

  def custom
    unless self.title.include?(CLICKBAIT)
      errors.add(:title, "Nope")
    end
  end
end
