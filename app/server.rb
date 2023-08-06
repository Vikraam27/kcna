require 'sinatra'

get '/' do
  ENV['HELLO_MESSAGE'] || 'Hello brow!!'
end