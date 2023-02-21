class CashRegister
    attr_reader :discount
    attr_accessor :total

    def initialize(discount=0)
        @discount = discount
        @total = 0.0
        @items = Array.new
    end
    def add_item(title, price, quantity=1)
        @items << {title: title, price: price, quantity:quantity}
        self.total += price * quantity
    end

    def apply_discount
        if(@discount > 0)
            self.total = @total*(100-@discount)/100
            "After the discount, the total comes to $#{@total.to_i}."
        else
            "There is no discount to apply."
        end
    end
    def items
        name_array = Array.new
        @items.each do |item|
            item[:quantity].times {|| name_array << item[:title]}
        end

        name_array
    end

    def void_last_transaction
        @items.delete(-1)
        self.total -= (@items[-1][:price]).to_f*(@items[-1][:quantity]).to_f
        @total
    end
end
