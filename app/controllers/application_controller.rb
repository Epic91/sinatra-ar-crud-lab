
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect '/articles'
  end

  #index this is a READ action
  get '/articles' do
    @articles = Article.all
    erb :index
  end

  #new, you'll also need a POST. This is a CREATE action
  get '/articles/new' do
    @article = Article.new
    erb :new
  end

  #create, 
  post '/articles' do
    #insert code that extracts the form data from the params 
    @article = Article.create(params)
    redirect "/articles/#{ @article.id }"
  end

  #show, this is a READ action
  get "/articles/:id" do
    @article = Article.find(params[:id])
    erb :show
  end
  #edit, this is an UPDATE action
  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :edit
  end

  #update, this is an UPDATE action
  patch "/articles/:id" do
    @article = Article.find(params[:id])
    @article.update(params[:article])
    redirect  "/articles/#{ @article.id }"
  end

  delete '/articles/:id' do
    Article.destroy(params[:id])
    redirect '/articles'
  end

end
