require 'faker'

100.times do
  User.create!(
    email: Faker::Internet.unique.email,
    name: Faker::Alphanumeric.alphanumeric(number: 10),
    password: 'password',
    password_confirmation: 'password'
  )
end

posts = 10.times.map do
  users = User.first(10)
  users.each do |user|
    user.posts.create!(content: Faker::Lorem.sentence)
  end
end

User.find_each do |user|
  liked_posts = Post.last(10)
  liked_posts.each do |post|
    Like.create!(user: user, post: post)
  end
end
