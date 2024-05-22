# Using a single puts statement build the following
# sentence using only data from the carl hash and the
# sagan array along with some string interpolation.
#
# We are a way for the cosmos to know itself.

#1. Copy and past the following Ruby code into a file called carl_sagan.rb and follow the self-contained instructions.

carl  = {
  :toast => 'cosmos',
  :punctuation => [ ',', '.', '?' ],
  :words => [ 'know', 'for', 'we']
}

sagan = [
  { :are => 'are', 'A' => 'a' },
  { 'waaaaaay' => 'way', :th3 => 'the' },
  'itself',
  { 2 => ['to']}
]

puts "#{carl[:words][2].capitalize} #{sagan[0][:are]} #{sagan[0]['A']} #{sagan[1]['waaaaaay']} #{carl[:words][1]} #{sagan[1][:th3]} #{carl[:toast]} #{sagan[3][2][0]} #{carl[:words][0]} #{sagan[2]}."

# 2) Create an array of hashes named ‘ghosts’ to hold the following information:
ghosts = [
  { name: 'Inky', age: 4, loves: 'reindeers', net_worth: 25 },
  { name: 'Pinky', age: 5, loves: 'garden tools', net_worth: 14 },
  { name: 'Blinky', age: 7, loves: 'ninjas', net_worth: 18.03 },
  { name: 'Clyde', age: 6, loves: 'yarn', net_worth: 0 }
]

ghosts.each do |ghost|
  ghost_info  = "#{ghost[:name]} is #{ghost[:age]} years old, "
  ghost_info += "loves #{ghost[:loves]} and "
  ghost_info += "has #{'%.2f' % ghost[:net_worth]} dollars in the bank."
  puts ghost_info
end


#  3) Write a script that uses the JSON provided by the dog.ceo API to print out a nicely formatted list of dog breeds and sub-breeds.
require 'net/http'
require 'json'

url = 'https://dog.ceo/api/breeds/list/all'
uri = URI(url)
response = Net::HTTP.get(uri)
dog_breeds = JSON.parse(response)

dog_breeds['message'].each do |breed, sub_breeds|
  puts "* #{breed}"
  if sub_breeds.any?
    sub_breeds.each do |sub_breed|
      puts "  * #{sub_breed}"
    end
  end
end


# 4) Using data from the city's open data set figure out how many of our trees may die now that the Emerald Ash Borer has been found here. In other words, how many Ash trees do we have in the city?
require 'net/http'
require 'json'

# URL of the tree dataset
url = 'https://data.winnipeg.ca/resource/d3jk-hb6j.json?$limit=306000'

# Function to fetch and parse JSON data
def fetch_and_parse_data(url)
  uri = URI(url)
  response = Net::HTTP.get(uri)
  JSON.parse(response)
end

# Function to count Ash trees
def count_ash_trees(data)
  ash_count = 0
  data.each do |tree|
    if tree['common_name']&.downcase&.include?('ash')
      ash_count += 1
    end
  end
  ash_count
end

# Fetch and parse data
tree_data = fetch_and_parse_data(url)

# Count Ash trees
ash_count = count_ash_trees(tree_data)

puts "Number of Ash trees in the dataset: #{ash_count}"
