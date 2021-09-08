class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }

    validate :title_must_be_clickbait

    def title_must_be_clickbait
        if !title
        elsif !title.match?(/Won't Believe|Secret|Top.\d|Guess/)
            errors.add(:title, "must be clickbait")
            puts "Oh no!"
        end
    end
        
end
