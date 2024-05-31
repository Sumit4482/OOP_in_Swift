class BankAccount{
  //Properties
  var accountNumber: String
  // Computed Property
  var balance : Double {
    didSet{
      print("Balance is \(balance)")
    }
  }
  //Initializer
  init(accountNumber: String, initialBalance: Double){
    self.accountNumber = accountNumber;
    self.balance = initialBalance;
  }
  // Methods
  func depoist(amount: Double)-> Void{
    balance += amount;
  }
  func withdraw(amount: Double)-> Void{
    balance -= amount;
  }
  // Deinitializer
   deinit{
     print(accountNumber + " is being Closed ")
   }
}

class SavingsAccount : BankAccount{
  //Properties
  var interestRate: Double
  //Initiailizer
  init(accountNumber: String, initialBalance: Double, interestRate: Double){
    self.interestRate = interestRate;
    super.init(accountNumber: accountNumber, initialBalance:initialBalance)
  }
  //Methods
  func applyInterest()-> Void{
    balance += balance * interestRate;
    print("Interest Applied")
  }
  //Overrideing Withdraw Method 
 override func withdraw(amount: Double)-> Void{
    if(balance - amount < 100 ){
      print("Insufficient Balance");
    }else{
      balance -= amount;
      print("Withdrawal Successful");
    }
  }
}

class CurrentAccount : BankAccount{
  //Properties
  var overdraftLimit: Double
  //Initiailizer
  init(accountNumber: String, initialBalance: Double, overdraftLimit: Double){
    self.overdraftLimit = overdraftLimit;
    super.init(accountNumber: accountNumber, initialBalance:initialBalance)
  }
  //Overridding Withdraw Method
  override func withdraw(amount: Double)-> Void{
    if(balance - amount < overdraftLimit){
      print("Insufficient Balance");
    }else{
      balance -= amount;
      print("Withdrawal Successful");
    }
  }
}

//To Demonstrate the Working
class Customer{
  var name: String
  var account: BankAccount
  init(name: String, account: BankAccount){
    self.name = name;
    self.account = account;
  }
}

let cust1 = Customer(name: "Sumit", account: SavingsAccount(accountNumber: "838306572115", initialBalance: 1000, interestRate: 0.05));
let cust2 = Customer(name: "Atharva", account: CurrentAccount(accountNumber:"1234556", initialBalance: 2000, overdraftLimit: 500));

cust1.account.depoist(amount: 500);
cust1.account.withdraw(amount: 1000);

cust2.account.depoist(amount: 500);
cust2.account.withdraw(amount: 1000);


