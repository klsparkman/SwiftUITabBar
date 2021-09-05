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
    @State var shouldShowModal = false
    
    let tabBarImageNames = ["person", "gear", "plus.app.fill", "pencil", "lasso"]
    
    var body: some View {
        
        VStack(spacing: 0) {
            ZStack {
                
                Spacer()
                    .fullScreenCover(isPresented: $shouldShowModal, content: {
                        Button(action: {shouldShowModal.toggle()}, label: {
                            Text("Full Screen Cover")
                        })
                    })
                
                switch selectedIndex {
                case 0:
                        NavigationView {
                            ZStack {
                            Color.red.edgesIgnoringSafeArea(.all)
                            Text("First")
                                .navigationTitle("First Tab")
                        }
                    }
                case 1:
                    NavigationView {
                        ZStack {
                        Color.blue.edgesIgnoringSafeArea(.all)
                        Text("Second")
                            .navigationTitle("Second Tab")
                    }
                }
                case 3:
                    NavigationView {
                        ZStack {
                        Color.green.edgesIgnoringSafeArea(.all)
                        Text("Fourth")
                            .navigationTitle("Fourth Tab")
                    }
                }
                default:
                    // We add navigation views by default will take up the entire span of the actual screen space
                    NavigationView {
                        ZStack {
                            Color.orange.edgesIgnoringSafeArea(.all)
                            Text("Remaining Tabs")
                                .navigationTitle("Remaining Tabs")
                        }
                    }
                }
                
            }
            
            Divider()
                .padding(.bottom, 12)
            
            HStack {
                ForEach(0..<5) { num in
                    Button(action: {
                        if num == 2 {
                            shouldShowModal.toggle()
                            return
                        }
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
