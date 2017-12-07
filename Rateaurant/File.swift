//
//  File.swift
//  Rateaurant
//
//  Created by Alessio Perrotti on 28/11/2017.
//  Copyright © 2017 Alessio Perrotti. All rights reserved.
//
public var iDCount = 1
//enum Rating
public enum Rating: Int{
    case oneStar = 1
    case twoStars = 2
    case threeStars
    case fourStars
    case fiveStars
    public func visualRate() -> String{
        switch self {
        case .oneStar:
            return "✭⭐︎⭐︎⭐︎⭐︎"
        case .twoStars:
            return "✭✭⭐︎⭐︎⭐︎"
        case .threeStars:
            return "✭✭✭⭐︎⭐︎"
        case .fourStars:
            return "✭✭✭✭⭐︎"
        case .fiveStars:
            return "✭✭✭✭✭"
//        default:
//            return "No rating"
        }
    }
}

public enum FoodType{
    case starters
    case pizza
    case beverages
}
import Foundation

public class Product{
    //static let shared = Product()
        public var iD: Int = 0
        var name = ""
        var price = 0.0
        var ingredients : Set<String>
        public var rate: Rating?{
            
            willSet{
                print("The star rate for \(name) now is: \(newValue!.visualRate())")
                //newValue is forced wrapped because is impossible to not have a value in it
            }
            didSet{
                if let oldV = oldValue{
                    print("Before the star rate for \(name) was: \(oldV.visualRate())")
                }else{
                    print("Before there was no rate for \(name)")
                }
                
            }
        }
    init(name: String, price: Double, ingr: Set<String>){
        self.name = name
        self.price = price
        ingredients = ingr
        
    }
        var comments: [String]?//This is for premium version
        var rateCount = 0
        var sumRate = 0
        
    
        public func addRate(rt: Int){
            //rt can be only a number from 0 to 5
            rateCount += 1
            sumRate += rt
            rate = Rating(rawValue: sumRate/rateCount)
        }
        
    }
//creating the menu and putting some rating





//class Menu contains all the food
public class Menu{
    static let shared = Menu()
    public var starters: [Product] = [Product(name: "Onion rings", price: 2.5, ingr: ["Onions","Onions"]), Product(name: "Mozzarella sticks", price:6, ingr: ["Mozzarella", "Oil"]), Product(name: "Nachos", price:6.9, ingr: ["Cheese","Guacamole", "Chili", "Cream"])]
    public var pizza: [Product] = [Product(name: "Margarita", price:4.5, ingr: ["Tomato","Mozzarella", "Oil", "Basil"]), Product(name: "Marinara", price:5, ingr: ["Mozzarella","Potato", "Oil","Wurstel"]),Product(name: "Sausages and pistachios", price:4, ingr: ["Sausages","Pistachios", "Oil", "Mozzarella"])]
    public var beverages: [Product] = [Product(name: "Coca cola", price:1.5, ingr: ["Sugar"]),Product(name: "Coffee", price: 0.8, ingr: ["Coffe", "Sugar"]), Product(name: "Still water", price:1, ingr: ["Water"])]

    var acepted = false
    //var acepted is true when the restaurant confirmed costumer presence, because some functions can be done only if the customer is in the restaurant
    
    public init(){
        self.addID()
        
        
    }
    //when you add a product this func create an ID for that product
    public func addID(){
        addIDGeneric(types: self.starters)
        addIDGeneric(types: self.pizza)
        addIDGeneric(types: self.beverages)
        
    }
    func addIDGeneric(types: [Product]){
        for type in types{
            if type.iD == 0 {
                type.iD = iDCount
                iDCount += 1
            }
        }
    }
    
    //func showSpecific shows only one kind of product
    func showSpecific(food: FoodType){
        var type: [Product]
        switch food {
        case .starters:
            type = self.starters
            break
        case .beverages:
            type = self.beverages
            break
        case .pizza:
            type = self.pizza
            break
        default:
            print("no food")
        }
        for prod in type
        {
            print("ID: \(prod.iD)")
            print("Name: " + prod.name)
            print("Price: \(prod.price) $")
            print("Those are the ingredients: ", terminator: (" "))
            
            
            for ing in prod.ingredients{
                print(ing + ". ", terminator: (" "))
                
            }
            
            print("\nRate: ", terminator: (" "))
            if let rated = prod.rate{
                print(rated.visualRate() + " average by \(prod.rateCount) costumers")
            }else
            {
                print("Not rated")
            }
            print("")
            //            }
        }
        
    }
    //func showAll shows the entire menu
    public func showAll(){
        showSpecific(food: .starters)
        showSpecific(food: .pizza)
        showSpecific(food: .beverages)
    }
    
    
    //add vote
    public func addRate(food: FoodType, prodID: Int, vote : Int){
        var found = false
        if acepted{
            var types: [Product]
            switch food {
            case .starters:
                types = self.starters
                break
            case .beverages:
                
                types = self.beverages
                break
            case .pizza:
                types = self.pizza
                break
            default:
                print("No food")
                break
            }
            for type in types{
                
                
                if (type.iD == prodID){
                    found = true
                    type.addRate(rt: vote)
                }
            }
        }else{
            print("Not allowed\n")
            return
        }
        if !found {
            print("Wrong ID!")
        }
        
    }
    
}
