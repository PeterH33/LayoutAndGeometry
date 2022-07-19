//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Peter Hartnett on 5/14/22.
//
//Day 94 Challenge.
//This is just a slightly creative use of views and animations to make a fun animation.

import SwiftUI


struct ContentView: View {
    let colors: [Color] = [.red, .green, .blue, .orange, .pink, .purple, .yellow]

    var body: some View {
        GeometryReader { fullView in
            ScrollView(.vertical) {
                ForEach(0..<50) { index in
                    GeometryReader { geo in
                        Text("Row #\(index)")
                            .font(.title)
                            .frame(maxWidth: .infinity)
                        //challenge 3
                            .background(Color(hue: (geo.frame(in: .global).minY / (fullView.frame(in: .global).maxY)), saturation: 0.75, brightness: 1))
                        //Challenge 1
                            .opacity(geo.frame(in: .global).minY / 300)
                        //Challenge 2
                            .scaleEffect((geo.frame(in: .global).minY < (fullView.frame(in: .global).maxY - 50) ? max(geo.frame(in: .global).minY / 450 , 0.5) : 1))
                            .rotation3DEffect(.degrees(geo.frame(in: .global).minY - fullView.size.height / 2) / 5, axis: (x: 0, y: 1, z: 0))
                    }
                    .frame(height: 40)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portraitUpsideDown)
    }
}
