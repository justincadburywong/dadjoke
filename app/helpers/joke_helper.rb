require 'net/http'
require 'json'

helpers do
  # def read_joke(category)
  #   # Joke.order("RANDOM()").first.joke  # is slow
  #   # Joke.offset(rand(Joke.count)).first.joke # is better/faster
  #   # Joke.where('categories LIKE ?', '%' + "#{category}" + '%').order("random()").first.joke
  #   Joke.where('categories LIKE ?', '%' + "#{category}" + '%').offset(rand(Joke.where('categories LIKE ?', '%' + "#{category}" + '%').count)).first.joke
  # end

  # def clean_joke(string)
  #   string.gsub("&quot;", "'")
  # end

  def fetch_joke
    uri = URI(@url)
    response = Net::HTTP.get_response(uri)
    response.add_field "accept", "text/plain"
    if response.code == "200"
      # joke = JSON.parse(response.body)['value']['joke']
      # return clean_joke(joke)
      return response.body
    # else
    #   clean_joke(read_joke(params[:Body]))
    end
  end

  # # As a contingency to back up all of the jokes
  # def save_joke(response)
  #   if !Joke.find_by(joke: response['joke'])
  #     Joke.create(joke: response['value']['joke'], categories: response['value']['categories'])
  #     @counter +=1
  #   end
  # end
  #
  # def scrape_api
  #   url_counter = Joke.last.id || 1
  #   @counter = 0
  #   100.times do
  #     @url = "http://api.icndb.com/jokes/#{url_counter}"
  #     uri = URI(@url)
  #     response = Net::HTTP.get_response(uri)
  #     if JSON.parse(response.body)['type'] == "success"
  #       save_joke(JSON.parse(response.body))
  #     end
  #     url_counter +=1
  #   end
  #   p @counter
  # end
end
