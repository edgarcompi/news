#require "sinatra"
#require "sinatra/reloader"
require "httparty"
# def view(template); erb template.to_sym; end

# get "/" do
  ### Get the weather
  # Evanston, Kellogg Global Hub... replace with a different location if you want
  lat = 42.0574063
  long = -87.6722787

  units = "metric" # or imperial, whatever you like
  key = "83ec5ec6e6381230f14912693e7494e8" # replace this with your real OpenWeather API key

  # construct the URL to get the API data (https://openweathermap.org/api/one-call-api)
  url = "https://api.openweathermap.org/data/2.5/onecall?lat=#{lat}&lon=#{long}&units=#{units}&appid=#{key}"
 

  # make the call
  @forecast = HTTParty.get(url).parsed_response.to_hash

  day_number = 1

puts "It is currently #{@forecast["current"]["temp"]} degrees and there is #{@forecast["current"]["weather"][0]["description"]}"
puts "Extended forecast:"
    for day in @forecast["daily"]    
    puts "In the next #{day_number} days, temperature will be #{day["temp"]["day"]} celsius with maximum of #{day["temp"]["max"]}, minimum of #{day["temp"]["min"]} and there will be #{day["weather"][0]["description"]}"
    day_number = day_number + 1
end

  ### Get the news API Key: f73238e5d6334ca982f17a6ae2c74d08

    #url = "https://newsapi.org/v2/top-headlines?country=us&apiKey=f73238e5d6334ca982f17a6ae2c74d08"
    #@news = HTTParty.get(url).parsed_response.to_hash.inspect
# news is now a Hash you can pretty print (pp) and parse for your output

# end
