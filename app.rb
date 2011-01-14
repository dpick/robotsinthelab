require 'rubygems'
require 'sinatra'

$in_lab = false

get '/stylesheet.css' do
  sass :stylesheet
end

get '/' do
  if $in_lab
    @string = "Robots have taken over the lab, find somewhere else to study"
    @button_string = "The freshman have left, enjoy the labs while you can"
  else
    @string = "The lab is robot free, enjoy the docks in peace"
    @button_string = "The freshman are back, to the library!"
  end

  haml :robots
end

post '/toggle' do
  $in_lab = !$in_lab

  redirect '/'
end
