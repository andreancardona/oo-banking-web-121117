require "pry"
require_relative "transfer"


class BankAccount
    attr_reader :name #can't make any changes to that attribute in the current instance
    attr_accessor :balance, :status

  def initialize(name) #initializes an instance variable
    @name = name
    @balance = 1000 # always initializes with balance of 1000
    @status = "open"
  end

  def deposit(money)
    @balance += money
  end

  def display_balance
    "Your balance is $#{@balance}."
  end

  def valid?
     self.status == "open" && @balance > 0
     #is valid with an open status and a balance greater than 0
  end

  def close_account
    @status = "closed"
    @status
  end


end
