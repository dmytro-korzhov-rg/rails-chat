# frozen_string_literal: true

Rails.application.routes.draw do
  resource :sessions, only: %i[new create destroy]
  resources :rooms, only: %i[index show create] do
    resources :messages, only: :create
  end
  resources :users
  root 'rooms#index'
end
