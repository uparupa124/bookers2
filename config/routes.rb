Rails.application.routes.draw do
  get 'users/show'
  get 'users/index'
  devise_for :users
  root  "homes#top"
  get "/home/about" => "homes#about"
  resources :books, only: [:index, :show, :create, :edit, :update, :destroy]
  resources :users, only: [:index, :show, :edit, :update]
end
