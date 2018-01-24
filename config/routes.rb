Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cats
  get  "/",     to: "cats#index"
  get  "/cats/show/:id", to: "cats#show"
  get "/cats/upvote/:id",  to: "cats#upvote"
  get "/cats/downvote/:id",  to: "cats#downvote"
end
