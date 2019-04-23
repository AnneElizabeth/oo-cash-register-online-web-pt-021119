class CashRegister
  attr_accessor :total, :ee_discount, :item_price, :items_in_cart

  def initialize(ee_discount = 0)
    @total = 0
    @ee_discount = ee_discount
    @items_in_cart = []
  end

  def add_item(item, item_price, item_quantity = 1)
    @item_price = item_price
    @total += item_price * item_quantity
    if item_quantity > 1
      counter = 0
      while counter < item_quantity
        @items_in_cart << item
        counter += 1
      end
    else
      @items_in_cart << item
    end
  end

  def apply_discount
    if @ee_discount > 0
      @take_off = (item_price * ee_discount)/100
      @total -= @take_off
      return "After the discount, the total comes to $#{total}."
    else
      return "There is no discount to apply."
    end
  end

  def void_last_transaction
    @total -= @item_price
  end

end
