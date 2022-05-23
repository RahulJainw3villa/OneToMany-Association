Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'authors#index'
  get 'authors/new'
  post 'authors', to: 'authors#create' 
  get 'books/index'
  get 'new_book',to:'books#new'
  post 'books', to: 'books#create'


  resources :authors do
    resources :books
  end
end
