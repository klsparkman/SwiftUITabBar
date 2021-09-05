//
//  ContentView.swift
//  SwiftUITabBar
//
//  Created by Kelsey Sparkman on 9/4/21.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        UITabBar.appearance().tintColor = .cyan
    }
    
    @State var selectedIndex = 0
    
    let tabBarImageNames = ["person", "gear", "plus.app.fill", "pencil", "lasso"]
    
    var body: some View {
        
        VStack {
            ZStack {
                
                switch selectedIndex {
                case 0:
                    NavigationView {
                        Text("First")
                            .navigationTitle("First Tab")
                    }
                case 1:
                    ScrollView {
                        Text("Test")
                    }
                default:
                    Text("Remaining Tabs")
                }
                
            }
            Spacer()
            
            HStack {
                ForEach(0..<5) { num in
                    Button(action: {
                        selectedIndex = num
                    }, label: {
                        Spacer()
                        
                        if num == 2 {
                            Image(systemName: tabBarImageNames[num])
                                .font(.system(size: 30, weight: .bold))
                                .foregroundColor(.red)
                        } else {
                            Image(systemName: tabBarImageNames[num])
                                .font(.system(size: 24, weight: .bold))
                                .foregroundColor(selectedIndex == num ? Color(.label) : .init(white: 0.8))
                        }
                        Spacer()
                        
                    })
                }
            }
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//TabView {
//    Text("First")
//        .tabItem {
//            Image(systemName: "person")
//            Text("First")
//        }
//    Text("Second")
//        .tabItem {
//            Image(systemName: "house")
//            Text("Second")
//        }
//    Text("Third")
//        .tabItem {
//            Image(systemName: "gear")
//            Text("Third")
//        }
//    Text("Fourth")
//        .tabItem {
//            Image(systemName: "book")
//            Text("Fourth")
//        }
//}
