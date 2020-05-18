require "sinatra"
require "sinatra/reloader"
require "httparty"
def view(template); erb template.to_sym; end

 get "/" do
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

  @day_number = 1




  ### Get the news API Key: f73238e5d6334ca982f17a6ae2c74d08
  # news is now a Hash you can pretty print (pp) and parse for your output


url2 = "https://newsapi.org/v2/top-headlines?country=us&apiKey=f73238e5d6334ca982f17a6ae2c74d08"

@news = HTTParty.get(url2).parsed_response.to_hash

@topnews = @news["articles"][0, 6]

  
view "news"

 end
