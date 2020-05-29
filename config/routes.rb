Rails.application.routes.draw do
  devise_for :users
	root 'posts#index'
 	resources :posts
 	resources :tags, only: [:show]
 	resources :pictures, only: [:create, :destroy]
 end
