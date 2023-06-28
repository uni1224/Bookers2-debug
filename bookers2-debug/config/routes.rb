Rails.application.routes.draw do
  get 'relationships/followings'
  get 'relationships/followers'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 devise_for :users
  root to: "home#top"
  get "home/about"=>"home#about"
  get "search" => "searches#search"

  resources :books, only: [:index,:show,:edit,:create,:destroy,:update] do
  resources :book_comments, only: [:create, :destroy]
   resource :favorites, only: [:create, :destroy]
   
   
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 end
  resources :users, only: [:index,:show,:edit,:update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
  resources :messages, only: [:create]
  resources :rooms, only: [:create,:show]
  resources :groups, only: [:new, :index, :show, :create, :edit, :update]
  get 'tagsearches/search', to: 'tagsearches#search'
 end