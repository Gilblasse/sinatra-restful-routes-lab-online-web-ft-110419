class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/recipes' do 
    @recipes = Recipe.all
    erb :index
  end
   
  get '/recipes/new' do 
    erb :new 
  end 
  
  post '/recipes' do 
    Recipe.create(params)
    redirect '/recipes'
  end 
  
  get '/recipes/:id' do 
    @recipe = Recipe.find_by_id(params[:id])
    erb :show
  end
  
  delete '/recipes/:id' do 
    recipe = Recipe.find_by_id(params[:id])
    recipe.delete
    redirect '/recipes'
  end
  
  get '/recipes/:id/edit' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :edit
  end
  
  
end
