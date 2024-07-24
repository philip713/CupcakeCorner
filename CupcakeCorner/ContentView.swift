//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Philip Janzel Paradeza on 2024-07-23.
//
import SwiftUI

struct ContentView: View {
    @State private var order = Order()
    var body: some View {
        NavigationStack{
            Form{
                Section{
                    Picker("Select your cake type", selection: $order.type){
                        ForEach(Order.types.indices, id: \.self){
                            Text(Order.types[$0])
                        }
                    }
                    
                    Stepper("Number of Cakes: \(order.quantity)", value: $order.quantity, in: 3...20)
                }
                
                Section{
                    Toggle("Any Special Requests?", isOn: $order.specialRequestEnabled)
                    if order.specialRequestEnabled {
                        Toggle("Extra Frosting", isOn: $order
                            .extraFrosting)
                        Toggle("Add extra sprinkles", isOn: $order.addSprinkles)
                    }
                }
                
                Section{
                    NavigationLink("Delivery details"){
                        AddressView(order: order)
                    }
                }
            }
            .navigationTitle("Cupcake Corner")
        }
    }
}

#Preview {
    ContentView()
}
