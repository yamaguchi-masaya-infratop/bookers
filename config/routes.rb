Rails.application.routes.draw do
  #get 'books/new'
  #get 'books/index'
  #get 'books/show'
  #get 'books/edit'
  root to: 'homes#top'
  resources :books
  #patch 'books/:id' => 'books#update', as: 'update_book'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
