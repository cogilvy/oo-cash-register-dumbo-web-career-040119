class CashRegister
  # We want to return the current total, but also be able to manipulate it so
  # add :total to the attr_accessor's. Same for all listed as accessors.
  attr_accessor :discount, :total, :items, :last_transaction

  # To make an optional parameter/argument set it = to a default value so if you
  # arent passed in anything it will still work.
  def initialize(discount = 0)
    # Sets an instance variable @total on initialization to zero.
    @total = 0
    # Discount is optional, but if passed one in we need to store its value.
    @discount = discount
    # Make empty items array to keep track of all the items in the cart.
    @items = []
  end

  # Needs to accept a title and price with optional quantity
  def add_item(title, price, quantity=1)
    # increases the total by (price * quantity)
    self.total += (price * quantity)
    # For the amount of items aka quantity, add the title of each item
    # to the items array
    quantity.times do
      items << title
    end
    # We need to keep track of what the last transaction was in case we need
    # to void it with the void_last_transaction method later.
    self.last_transaction = price * quantity
  end

  def apply_discount
    # If a discount was passed in...
    if discount > 0
      # Take the current total and multiply it by the amount left after the
      # discount as a decimal. aka 20% would be 20/100 so multiply total by
      # 80/100 or 0.80 then round to get rid of decimals like in tests.
      self.total = (total * ((100 - discount.to_f)/100)).round
      # Display a successful message
      "After the discount, the total comes to $#{self.total}."
    # If no discount was passed in...
    else
      # Display a non-successful message
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    # Subtract the last transaction from the current total and make that number
    # the current total.
    self.total = self.total - self.last_transaction
  end


end
