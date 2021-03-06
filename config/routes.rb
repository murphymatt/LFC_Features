Rails.application.routes.draw do

  devise_for :farms, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :farms

  # define api get for json data
  scope '/api' do
    scope '/v1' do
      scope '/farms' do
        post '/' => 'farms#farm_json'
      end
    end
  end

  root :to => redirect('/admin')

  get 'farms/review'
  get 'farms/submission'
  get 'farms/approved'

  post 'approve/(:item_id)', to: 'farms#approve', as: :approve
  post 'reject/(:item_id)', to: "farms#reject", as: :reject

end
