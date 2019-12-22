class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/recipes' do #loads index page
    @recipes = Recipe.all
    erb :index
  end
  
end
