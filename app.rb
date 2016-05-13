require 'sinatra/base'

class Thermostat < Sinatra::Base
  enable :sessions

  set :public_folder, proc{ File.join(root)}

  get "/" do
    File.read('thermostat.html')
  end

  post '/temperature' do
    headers 'Access-Control-Allow-Origin' => '*'
  	@json = request.body.read
  	File.open('status.json', 'w') do |f|
  		f.write(@json)
  	end
  end

  get '/temperature' do
    headers 'Access-Control-Allow-Origin' => '*'
      @json = File.read('status.json')
  end

  run! if app_file == $0
end
