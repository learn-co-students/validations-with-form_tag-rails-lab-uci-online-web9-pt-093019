Rails.application.routes.draw do
  resources :authors, only: [:show, :new, :edit, :create, :update]
  resources :posts, only: [:show, :new, :edit, :create, :update]
end
