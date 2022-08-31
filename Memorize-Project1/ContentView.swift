//
//  ContentView.swift
//  Memorize-Project1
//
//  Created by Edwin George on 8/25/22.
//

import SwiftUI

struct ContentView: View {
    let column = GridItem(.adaptive(minimum:60), spacing: 20)
    
    @State
    var cardCount = 10
    
    @State
    var vehicleEmojis = ["🛸", "🚀", "🚗", "⛽", "🛶", "🚘", "🚙", "🏎", "🛵", "🏍", "🚐", "🚛", "🛳", "🚑", "🚜", "🛴", "🚂", "🚁", "🚟", "🛺", "🚄", "🛥"]
    @State
    var faceEmojis = ["🥰", "😇", "😣", "😤", "😘", "🥳", "🤠", "🤯", "🤑", "🤢", "😎", "🥺", "🥵", "🥶", "😈", "🤡", "👹", "👽", "😰", "😱", "🥴", "🤐"]
    @State
    var foodEmojis = ["🍇", "🍈", "🍉", "🍊", "🍋", "🍌", "🍍", "🥭", "🍎", "🍏", "🍐", "🍑", "🍒", "🍓", "🧄", "🥝", "🍅", "🌶", "🥥", "🥑", "🍆", "🥔"]
    
    //this is the same as the vehicleEmojis
    @State var emojis = ["🛸", "🚀", "🚗", "⛽", "🛶", "🚘", "🚙", "🏎", "🛵", "🏍", "🚐", "🚛", "🛳", "🚑", "🚜", "🛴", "🚂", "🚁", "🚟", "🛺", "🚄", "🛥"]
    
    var body: some View {
        VStack {
            Text("Memorize!").font(.title).foregroundColor(Color.red)
            HStack {
                vehicleButton
                faceButton
                foodButton
            }
            .padding(.vertical, 10)
            
            
            ScrollView {
                LazyVGrid (columns: [column, column, column], spacing: 20.0) {
                    ForEach((emojis[..<cardCount]), id: \.self) { emoji in
                        CardView(input: emoji)
                    }
                }
                .foregroundColor(Color.pink)
                .padding(.horizontal, 20.0)
            }
            
            HStack {
                Button (action: {
                    if cardCount > 1 {
                            cardCount -= 1
                    }
                }, label: {
                    VStack {
                        Image(systemName: "minus.circle").font(.title)
                        Text("Remove")
                    }
                })
                Spacer()
                Button (action: {
                    if cardCount < emojis.count {
                            cardCount += 1
                    }
                }, label: {
                    VStack {
                        Image(systemName: "plus.circle").font(.title)
                        Text("Add")
                    }
                })
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
        }
    }
    var vehicleButton: some View {
        Button {
            emojis = vehicleEmojis.shuffled()
        } label: {
            VStack {
                Text("Vehicles")
                Image(systemName: "car")
            }
        }
        .padding(/*@START_MENU_TOKEN@*/.horizontal/*@END_MENU_TOKEN@*/)
    }
    
    var faceButton: some View {
        Button {
            emojis = faceEmojis.shuffled()
        } label: {
            VStack {
                Text("Faces")
                Image(systemName: "face.smiling")
            }
        }
        .padding(/*@START_MENU_TOKEN@*/.horizontal/*@END_MENU_TOKEN@*/)
    }
    
    var foodButton: some View {
        Button {
            emojis = foodEmojis.shuffled()
        } label: {
            VStack {
                Text("Food")
                Image(systemName: "fork.knife")
            }
        }
        .padding(/*@START_MENU_TOKEN@*/.horizontal/*@END_MENU_TOKEN@*/)
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
            .previewInterfaceOrientation(.portrait)
    }
}
