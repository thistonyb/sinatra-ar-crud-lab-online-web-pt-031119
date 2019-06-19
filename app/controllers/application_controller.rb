require 'pry'
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/articles/new' do
    erb :new
  end

  post '/articles' do
    article = Article.new(title: params[:title], content: params[:content])
    article.save

    redirect to "/articles/#{article.id}"
  end

  get '/articles/:id' do
    @article = Article.find(params[:id].to_i)
    erb :show
  end

  get '/articles' do
    @articles = Article.all

    erb :index
  end

  get '/articles/:id/edit' do
    @article = Article.find(params[:id].to_i)
    erb :edit
  end

  patch '/articles/:id' do
    article = Article.find(params[:id].to_i)
    article.update(title: params[:title])
    article.update(content: params[:content])
    article.save

    redirect to "/articles/#{article.id}"
  end

  delete '/articles/:id' do
    article = Article.find(params[:id].to_i)
    article.destroy

  end



end
