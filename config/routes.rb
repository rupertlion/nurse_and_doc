Rails.application.routes.draw do

  scope '(:locale)', locale: /en|sv/ do
    devise_for :users, path: :authentication, controllers: {
      registrations: :registrations,
      sessions: :sessions
    }
    root controller: :jobs, action: :index
    resources :jobs, only: [:new, :create]
    resources :users, only: [:create, :new]
    resources :staffcos, only: [:create, :index, :new]
    resources :hospitals, only: [:index, :create, :new]
  end
end
