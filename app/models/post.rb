class Post < ApplicationRecord
  #validates :content,  presence: true
  validates :content, length: {in: 1..140, 
            too_long: "内容は140文字以下で記述してください",
            too_short: "内容は1文字以上で記述してください"          
          }
end
