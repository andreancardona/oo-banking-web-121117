require "pry"
require_relative "bank_account"

class Transfer
  # your code here
  attr_accessor :sender, :receiver, :amount, :status

 def initialize(sender, receiver, amount)
   @sender = sender
   @receiver = receiver
   @amount = amount
   @status = "pending"
 end


def valid?
  self.sender.valid? && receiver.valid?
 # @status == "open" && @balance > 0
 end

 def execute_transaction
     if self.status == 'pending' && sender.valid? && amount <= sender.balance
       #binding.pry
       @sender.balance -= amount
       @receiver.balance += amount
       @status = "complete"
     else
       @status = "rejected"
       "Transaction rejected. Please check your account balance."
     end
   end

  def reverse_transfer
      if self.status == "complete"
      self.sender.balance += amount
      self.receiver.balance -= amount
      self.status = "reversed"
    end
  end



end
