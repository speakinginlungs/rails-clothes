Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get "men", to: 'pages#men', as: :men
  get 'men/:category/', to: "pages#index"
  get "men/:category/:id", to: 'pages#show', as: :men_item

  get '/women', to: 'pages#women', as: :women
  get 'women/:category', to: 'pages#index'
  get '/women/:category/:id', to: 'pages#show', as: :women_item

  resources :items, only: %i[new create edit update] do
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
