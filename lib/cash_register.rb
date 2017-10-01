require 'pry'
class CashRegister
  @@items = []
  attr_accessor :discount, :total, :items, :last_item
  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
    @last_item = {cost: nil, amount: nil}
  end
  def add_item(title, price, qty=0)
    @last_item[:cost] = price
    if qty > 0
      qty.times do
        @items << title
      end
    else
      @items << title
    end
    add_qty = qty * price

    if qty > 0
      @total += add_qty
    else
      @total += price
    end
  end
  def apply_discount
    percentage = @discount * 0.01
    amount_with_float = @total - @total * percentage
    @total = amount_with_float.to_i
    if @discount > 0
      "After the discount, the total comes to $#{@total}."
    elsif @discount == 0
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    @total -= @last_item[:cost]
  end
end
