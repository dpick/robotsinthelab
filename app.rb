require 'rubygems'
require 'sinatra'

$in_lab = false

get '/' do
  @string = "Robots have taken over the lab, find somewhere else to study"if $in_lab
  @string = "The lab is robot free, enjoy the docks in peace" if not $in_lab

  haml :robots
end

post '/toggle' do
  $in_lab = !$in_lab

  redirect '/'
end
