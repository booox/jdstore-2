Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :orders

  namespace :account do
    resources :orders
  end

  resource :cart do
    collection do
      post :clean
      post :checkout
    end
  end

  resources :cart_items

  resources :products do
    member do
      post :add_to_cart
    end
  end

  # scope :module => "admin", :as => "admin", :path => "admin" do
  namespace :admin do
    resources :products
  end

  root "products#index"

end
