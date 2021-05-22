Rails.application.routes.draw do
  root "homes#top"
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books, only: [:new, :create, :index, :show, :destroy, :edit, :update]
  get "home/about" => "homes#about"
  get "/users/sign_up" => "registrations#new"

  resources :users, only: [:index, :edit, :show, :update]
  resources :post_images, only: [:index]
end
