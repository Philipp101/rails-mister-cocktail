# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'
puts "clearing data"
Cocktail.delete_all
puts "generating ingredients"

url = "https://www.thecocktaildb.com/api/json/v1/1/search.php?f=a"


drinks_serialized = open(url).read
drinks = JSON.parse(drinks_serialized)
drinks["drinks"].each do |drink|
  Cocktail.create(name: drink["strDrink"])
end
puts "done"
