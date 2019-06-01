Rails.application.routes.draw do
  root 'razorpay#index'
  
  get 'razorpay/index'
  get 'razorpay/makepayment'
  # get 'getOrderDetail/:id', action: :getOrderDetail, controller: 'razorpay'
  get 'razorpay/getOrderDetail/:id', to: 'razorpay#getOrderDetail'
  # get 'razorpay/getOrderDetail'
  get 'razorpay/refund/:id', to: 'razorpay#refund'
  # get 'razorpay/refund'
  get 'razorpay/create_customer'
  get 'razorpay/create_invoice'

  get 'razorpay/captureAmount'
  # resources :razorpay
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
