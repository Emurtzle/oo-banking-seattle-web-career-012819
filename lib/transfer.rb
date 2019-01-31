class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if @status == "pending"
      @sender.balance = @sender.balance - amount
      @receiver.deposit(amount)
      @status = "complete"
    end
  end
end
