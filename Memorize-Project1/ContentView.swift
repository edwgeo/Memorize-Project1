//
//  ContentView.swift
//  Memorize-Project1
//
//  Created by Edwin George on 8/25/22.
//

import SwiftUI

struct ContentView: View {
    @State
    var vehicleEmojis = ["🛸", "🚀", "🚗", "⛽", "🛶", "🚘", "🚙", "🏎", "🛵", "🏍", "🚐", "🚛", "🛳", "🚑", "🚜", "🛴", "🚂", "🚁", "🚟", "🛺", "🚄", "🛥"]
    let column = GridItem(.adaptive(minimum:60), spacing: 20)
    
    var body: some View {
        ScrollView {
            LazyVGrid (columns: [column, column, column], spacing: 20.0) {
                ForEach(vehicleEmojis, id: \.self) { emoji in
                    CardView(input: emoji)
                }
            }
            .foregroundColor(Color.pink)
            .padding(.horizontal, 20.0)
        }
    }
}

struct CardView: View {
    var content: String
    @State
    var hidden = true
    
    init (input: String) {
        content = input
    }
    
    var body: some View {
        ZStack {
            Text(content)
                .font(.largeTitle)
            if hidden == true {
                RoundedRectangle(cornerRadius: 20)
                    .strokeBorder(lineWidth: 5.0)
                    .frame(minHeight:90)
            } else {
                RoundedRectangle(cornerRadius: 20)
                    .frame(minHeight:90)
            }
        }
        .onTapGesture {
            hidden = !hidden
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
