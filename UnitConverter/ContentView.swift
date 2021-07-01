//
//  ContentView.swift
//  UnitConverter
//
//  Created by YunShou Chao on 7/1/21.
//

import SwiftUI

enum Units: Int {
    case meter = 0
    case kilometer = 1
    case feet = 2
    case yard = 3
    case mile = 4
}

struct ContentView: View {
    @State private var input = ""
    @State private var selectedInputUnit = 0
    @State private var selectedOutputUnit = 1
    
    var meter: Double {
        let inputValue = Double(input) ?? 0
        
        switch selectedInputUnit {
        case Units.meter.rawValue:
            return inputValue
        case Units.kilometer.rawValue:
            return inputValue*1000
        case Units.feet.rawValue:
            return inputValue*0.3048
        case Units.yard.rawValue:
            return inputValue*0.9144
        case Units.mile.rawValue:
            return inputValue*1609.3
        default:
            return 0
        }
    }
    var kilometer: Double { return meter*0.001 }
    var feet: Double { return meter/0.3048 }
    var yard: Double { return meter/0.9144 }
    var mile: Double { return meter/1609.3 }
    var output: Double {
        switch selectedOutputUnit {
        case Units.meter.rawValue:
            return meter
        case Units.kilometer.rawValue:
            return kilometer
        case Units.feet.rawValue:
            return feet
        case Units.yard.rawValue:
            return yard
        case Units.mile.rawValue:
            return mile
        default:
            return 0
        }
    }
    
    
    let units = ["m", "km", "ft", "yd", "mi"]
    
    var body: some View {
        Form {
            Section(header: Text("Input")) {
                TextField("Value", text: $input)
                    .keyboardType(.decimalPad)
                Picker("Input unit", selection: $selectedInputUnit) {
                    ForEach(0 ..< units.count) {
                        Text("\(units[$0])")
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            Section(header: Text("Output")) {
                Text("\(self.output, specifier: "%.2f")")
                Picker("Output unit", selection: $selectedOutputUnit) {
                    ForEach(0 ..< units.count) {
                        Text("\(units[$0])")
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
