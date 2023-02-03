//
//  ContentView.swift
//  MonteCarlo
//
//  Created by IIT PHYS 440 on 2/3/23.
//

import SwiftUI

struct ContentView: View {
    let nValues = [10, 20, 50, 100, 200, 500, 10000, 20000, 50000]
    let exactAnswer = -1 + exp(1.0)
    
    var body: some View {
        VStack {
            ForEach(nValues, id: \.self) { n in
                MonteCarloIntegrationView(n: n, exactAnswer: self.exactAnswer)
            }
        }
    }
}

struct MonteCarloIntegrationView: View {
    let n: Int
    let exactAnswer: Double
    
    var estimate: Double {
        var sum = 0.0
        for _ in 0..<n {
            let x = Double.random(in: 0...1)
            sum += exp(-x)
        }
        return sum / Double(n)
    }
    
    var error: Double {
        return abs(exactAnswer - estimate)
    }
    
    var body: some View {
        HStack {
            Text("n = \(n)")
                .padding()
            Text("Estimate: \(estimate)")
                .padding()
            Text("Error: \(error)")
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
