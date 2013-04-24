require 'rubygems'
require 'sinatra'
require 'doodler'
require 'haml'


get "/" do
  "hello world"
  haml :index
end

post "/image" do
  image = image_source_from_form
  strategy = strategy_source_from_form

  # PNG image
  image = ChunkyPNG::Image.from_file(image_path)
  Doodler.draw(image, strategy)

  haml :show
end