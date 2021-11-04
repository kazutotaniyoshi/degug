Rails.application.routes.draw do
  devise_for :users
  resources :books do
    resource :favorites, only: [:create, :destroy,]
    resources :post_comments, only: [:create, :destroy]

  end
  resources :users,only: [:show,:index,:edit,:update]do
  resource :relationship,only: [:create,:destroy]
   member do
     get :followings
     get :followers
   end

  end

  root to: 'homes#top'
  get 'home/about' => 'homes#about'
end