//
//  ContentView.swift
//  X-O SwiftUI
//
//  Created by Abdullah Almunaikh on 1/3/21.
//

import SwiftUI

enum Players {
    case b1, b2, b3, b4, b5, b6, b7, b8, b9
    var title: String {
        switch self {
        case .b1:
            return ""
        case .b2:
            return ""
        case .b3:
            return ""
        case .b4:
            return ""
        case .b5:
            return ""
        case .b6:
            return ""
        case .b7:
            return ""
        case .b8:
            return ""
        case .b9:
            return ""
        }
    }
    
}

struct ContentView: View {
     var buttons: [[Players]] = [
        [.b1, .b2, .b3,],
        [.b4, .b5, .b6,],
        [.b7, .b8, .b9,],
    ]
    @State var b1 = ""
    @State var b2 = ""
    @State var b3 = ""
    @State var b4 = ""
    @State var b5 = ""
    @State var b6 = ""
    @State var b7 = ""
    @State var b8 = ""
    @State var b9 = ""
    @State var counter = 0
    @State var isDisabled = false
    @State var showingAlert = false
    var body: some View {
        ZStack(alignment: .center){
            Color.black.ignoresSafeArea()
            VStack(spacing: 12){
                HStack (spacing: 12){
                    Text("X-O Game")
                        .foregroundColor(.white)
                        .font(.system(size: 40))
                }.padding()
                ForEach(buttons, id: \.self){ row in
                    HStack{
                        ForEach(row, id: \.self) {button in
                            Button(action: {
                                //isDisabled = false
                                if counter % 2 == 0{
                                    switch button{
                                    
                                    case .b1:
                                        b1 = "X"
                                    case .b2:
                                        b2 = "X"
                                    case .b3:
                                        b3 = "X"
                                    case .b4:
                                        b4 = "X"
                                    case .b5:
                                        b5 = "X"
                                    case .b6:
                                        b6 = "X"
                                    case .b7:
                                        b7 = "X"
                                    case .b8:
                                        b8 = "X"
                                    case .b9:
                                        b9 = "X"
                                    }
                                }else {
                                    switch button{
                                    
                                    case .b1:
                                        b1 = "O"
                                    case .b2:
                                        b2 = "O"
                                    case .b3:
                                        b3 = "O"
                                    case .b4:
                                        b4 = "O"
                                    case .b5:
                                        b5 = "O"
                                    case .b6:
                                        b6 = "O"
                                    case .b7:
                                        b7 = "O"
                                    case .b8:
                                        b8 = "O"
                                    case .b9:
                                        b9 = "O"
                                    }
                                }
                                checkWinner()
                                counter += 1
                                //isDisabled = true
                            }, label: {
                                switch button{
                                case .b1:
                                    ButtonStyle(player: b1)
                                case .b2:
                                    ButtonStyle(player: b2)
                                case .b3:
                                    ButtonStyle(player: b3)
                                case .b4:
                                    ButtonStyle(player: b4)
                                case .b5:
                                    ButtonStyle(player: b5)
                                case .b6:
                                    ButtonStyle(player: b6)
                                case .b7:
                                    ButtonStyle(player: b7)
                                case .b8:
                                    ButtonStyle(player: b8)
                                case .b9:
                                    ButtonStyle(player: b9)
                                    
                                }
                                
                            }).disabled(disable(button: button))
                            .alert(isPresented: $showingAlert) {
                                Alert(title: Text("Game over"), message: Text(""), dismissButton: .default(Text("Got it!")))
                            }
                            
                        }
                    }
                }
                
            }.padding(.bottom)
        }
        
    }
    func disable(button: Players) -> Bool {
        switch button{
        
        case .b1:
            return b1 != ""
        case .b2:
            return b2 != ""
        case .b3:
            return b3 != ""
        case .b4:
            return b4 != ""
        case .b5:
            return b5 != ""
        case .b6:
            return b6 != ""
        case .b7:
            return b7 != ""
        case .b8:
            return b8 != ""
        case .b9:
            return b9 != ""
        }
    }
    func checkWinner(){
        let case1 = b1 == b2 && b1 == b3 && b1 != ""
        let case2 = b4 == b5 && b4 == b6 && b4 != ""
        let case3 = b7 == b8 && b7 == b9 && b7 != ""
        let case4 = b1 == b4 && b1 == b7 && b1 != ""
        let case5 = b2 == b5 && b2 == b8 && b2 != ""
        let case6 = b3 == b6 && b3 == b9 && b3 != ""
        let case7 = b1 == b5 && b1 == b9 && b1 != ""
        let case8 = b3 == b5 && b3 == b7 && b3 != ""
        if case1 || case2 || case3 || case4 || case5 || case6 || case6 || case7 || case8{
            showingAlert = true
            b1 = ""
            b2 = ""
            b3 = ""
            b4 = ""
            b5 = ""
            b6 = ""
            b7 = ""
            b8 = ""
            b9 = ""
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct ButtonStyle: View {
    var player: String
    var body: some View {
        Text(player)
            .font(.system(size: 50))
            .frame(width: 100, height: 100)
            .foregroundColor(.white)
            .background(Color(.darkGray))
            .cornerRadius(15)
    }
}


struct ShowAlert: View {
    @State private var showingAlert = false

    var body: some View {
        Button(action: {
            self.showingAlert = true
        }) {
            Text("Show Alert")
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Important message"), message: Text("Wear sunscreen"), dismissButton: .default(Text("Got it!")))
        }
    }
}
