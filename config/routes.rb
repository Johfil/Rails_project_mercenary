Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :offers do
    resources :reservations
  end

  resources :reservations

  resources :profils, only: [:show, :edit, :update]
  resources :profils do
    get 'bookings_received', on: :member
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  delete 'logout', to: 'devise/sessions#destroy', as: :logout

  # Defines the root path route ("/")
  # root "posts#index"
end
