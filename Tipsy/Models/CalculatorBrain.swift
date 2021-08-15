//
//  CalculatorBrain.swift
//  Tipsy
//
//  Created by Michal on 11/08/2021.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct CalculatorBrain{
    var total: TOTAL!
    var numberOfPeople: TOTAL!
    var tip: TOTAL!

    func calculateBil(billTotal: Double, tip: Double, numberOfPeople: Double){
        let result = billTotal * (1 + tip) / numberOfPeople
        let resultTo2DecimalPlaces = String(format: "%.2f", result)
        print(resultTo2DecimalPlaces)
    }
    
    func getPeople(numberOfPeople: Double) -> Double {
        return numberOfPeople
    }
    
    func getTotal(resultTo2DecimalPlaces: Double) -> Double{
        return resultTo2DecimalPlaces
    }
}
