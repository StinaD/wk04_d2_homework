require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('./models/game')


also_reload('./models/*')

get '/check_win/:hand1/:hand2' do
  hand1 = params[:hand1]
  hand2 = params[:hand2]
  rps = Game.new(hand1, hand2)
  @result = rps.check_win
  erb( :result )
end

get "/welcome" do
  erb (:welcome)
end
