Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root :to => 'users#top'

get 'top' => 'users#top'
get 'about' => 'users#about'
get 'mypage' => 'users#mypage'

resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy]
resources :users, only: [:show, :index, :edit, :update]

end
