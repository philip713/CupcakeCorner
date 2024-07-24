//
//  Order.swift
//  CupcakeCorner
//
//  Created by Philip Janzel Paradeza on 2024-07-23.
//

import Foundation
@Observable
class Order: Codable{
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    var type = 0
    var quantity = 3
    
    var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    var extraFrosting = false
    var addSprinkles = false
    
////    var name = ""
//    var streetAddress = ""
//    var city = ""
//    var zip = ""
    var name : String {
        get{
            let defaults = UserDefaults.standard
            return defaults.string(forKey: "name") ?? ""
        }
        set{
            let defaults = UserDefaults.standard
            defaults.setValue(newValue, forKey: "name")
        }
    }
    var streetAddress : String{
        get{
            let defaults = UserDefaults.standard
            return defaults.string(forKey: "streetAddress") ?? ""
        }
        set{
            let defaults = UserDefaults.standard
            defaults.setValue(newValue, forKey: "streetAddress")
        }
    }
    
    var city : String{
        get{
            let defaults = UserDefaults.standard
            return defaults.string(forKey: "city") ?? ""
        }
        set{
            let defaults = UserDefaults.standard
            defaults.setValue(newValue, forKey: "city")
        }
    }
    
    var zip : String{
        get{
            let defaults = UserDefaults.standard
            return defaults.string(forKey: "zip") ?? ""
        }
        set{
            let defaults = UserDefaults.standard
            defaults.setValue(newValue, forKey: "zip")
        }
    }
    
    var hasValidAddress: Bool{

        if name.isNotAllWhitespace || streetAddress.isNotAllWhitespace || city.isNotAllWhitespace || zip.isNotAllWhitespace{
            return false
        }
        return true
    }
    
    var cost : Decimal{
        var cost = Decimal(quantity)*2
        
        cost += Decimal(type)/2
        
        if extraFrosting{
            cost += Decimal(quantity)
        }
        
        if addSprinkles{
            cost += Decimal(quantity)/2
        }
        return cost
    }
    
}

enum CodingKeys: String, CodingKey{
    case _type = "type"
    case _quantity = "quantity"
    case _specialRequestEnables = "specialRequestEnabled"
    case _extraFrosting = "extraFrosting"
    case _addSprinkles = "addSprinkles"
    case _name = "name"
    case _city = "city"
    case _streetAddress = "streetAddress"
    case _zip = "zip"
}

extension String {
    var isNotAllWhitespace: Bool {
        trimmingCharacters(in: .whitespaces).isEmpty
    }
}
