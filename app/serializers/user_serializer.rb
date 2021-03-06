class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :username, :email, :billing_address
  has_one :checking
  has_one :saving
  # has_many :transactions, through: :checking
  # has_many :transactions, through: :saving

  # has_one checking will render out the following method instead.
  def checking
    # If current user does have a checking account opened.
    if self.object.checking
    {
      # anyKey: 'kkkk', this will also get rendered out.
      status: self.object.checking.status,
      id: self.object.checking.id,
      balance: self.object.checking.balance,
      acc_num: self.object.checking.acc_num,
      transactions: self.object.checking.transactions
    }
    
    end
  end
  
  def saving
    # If current user does have a saving account opened.
     if self.object.saving
        {
          status: self.object.saving.status,
          id: self.object.saving.id,
          balance: self.object.saving.balance,
          acc_num: self.object.saving.acc_num,
          transactions: self.object.saving.transactions
        }
    end
  end

end
