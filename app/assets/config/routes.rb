Rails.application.route.draw do
    root to: "tasks#index"
    
    resources :tasks
end