require 'api_constraints'


Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api, defaults: { format: :json }, constraints: { subdomain: /.+/ }, path:  '/' do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do

      resources :packages,  except: [:new, :edit]
      post '/search', to: 'packages#search'
    end
  end


end
