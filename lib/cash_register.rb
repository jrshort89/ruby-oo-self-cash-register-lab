require 'pry'

class CashRegister
    

    def initialize(discount = nil) 
        @total = 0
        @discount = discount
        @items = []
        @last_price = 0
    end

    attr_accessor :total, :discount, :items

    def add_item(title, price, qty = 1)
        # CashRegister #add_item accepts a title and a price and increases the total
        total_qty_price = price * qty
        self.total += total_qty_price
        @last_price = total_qty_price
        qty.times { self.items << title }
    end

    def apply_discount
        # CashRegister #apply_discount the cash register was initialized with an employee discount applies the discount to the total price
        # CashRegister #apply_discount the cash register was not initialized with an employee discount returns a string error message that there is no discount to apply
        if self.discount 
        self.total = (self.total - (self.discount.to_f / 100) * self.total).to_i
        return "After the discount, the total comes to $#{self.total}."
        end
        return "There is no discount to apply."
    end
    # CashRegister #void_last_transaction subtracts the last item from the total
    def void_last_transaction
        self.total -= @last_price
        # self.items.pop
    end
end