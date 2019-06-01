require 'razorpay'
class RazorpayController < ApplicationController
  def index
    @orders_list = Razorpay::Order.all.items
    @orders_list.each do | item |
      item['payments'] = getOrderDetail(item['id'])
    end
  end

  def makepayment
    @order_status = Razorpay::Order.create amount: 1000, currency: 'INR', receipt: 'TEST'
    # binding.pry
    redirect_to '/razorpay/index'
  end

  def getOrderDetail(order_id)
    # order_id = params[:id]
    @order_status = Razorpay::Order.fetch(order_id)
  end

  def captureAmount
    # payment_id = "pay_CbnTdDjEqgp86k"
    @refund_status = Razorpay::Payment.fetch("pay_Cbp4JSmrjlEUjX").capture({amount:1000})

    # refund = Razorpay::Payment.fetch(payment_id: payment_id).capture({amount:1})
    # @refund_status = Razorpay::Refund.fetch(refund.id)
    redirect_to '/razorpay/index'
  end

  def refund
    payment_id = params[:id]
    refund = Razorpay::Payment.fetch("pay_Cbp4JSmrjlEUjX").refund({amount:1000})
    redirect_to '/razorpay/index'
    # refund = Razorpay::Refund.create(payment_id: payment_id)
    # @refund_status = Razorpay::Refund.fetch(refund.id)
  end

  def create_customer
    # Create a customer
    customer = Razorpay::Customer.create email: 'test@razorpay.com', contact: '9876543210'
    puts customer.id #cust_6vRXClWqnLhV14
  end

  def create_invoice
    invoice = Razorpay::Invoice.create customer_id: "1", amount: 100, currency: 'INR', description: 'Test description', type: 'link'
  end
end
