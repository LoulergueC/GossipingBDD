# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'faker'

# Create cities
10.times do |i|
    City.create!(
    name: Faker::Address.city, 
    zip_code: Faker::Address.zip_code
    )
end

# Create users associated with cities
10.times do |i|
    User.create!(
        first_name: Faker::Name.first_name, 
        last_name: Faker::Name.last_name, 
        email: Faker::Internet.email, 
        age: Faker::Number.between(from: 10, to: 30),
        city_id: City.all.sample.id
    )
end

# Create gossips associated with a user
20.times do |i|
    Gossip.create!(
        title: Faker::Lorem.sentence(word_count: 3),
        content: Faker::Lorem.paragraph(sentence_count: 3),
        user_id: User.all.sample.id
    )
end

# Create tags
10.times do |i|
    Tag.create!(
        title: Faker::Lorem.word
    )
end

# Add tags to gossips
Gossip.all.each do |gossip|
    rand(1..10).times do
        gossip.tags = Tag.all.sample(rand(1..10))
    end
    gossip.save!
end

# Create some private message
50.times do |i|
    PrivateMessage.create!(
        content: Faker::Lorem.paragraph(sentence_count: 3),
        sender_id: User.all.sample.id
    )
end

# Send thoses messages to one or multiple random user
PrivateMessage.all.each do |message|
    rand(1..5).times do
        JoinPrivateMessageReceiver.create!(
            private_message_id: message.id,
            receiver_id: User.all.sample.id
        )
    end
end