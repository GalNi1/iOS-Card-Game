//
//  ContentView.swift
//  cardGameIOS
//
//  Created by Gal Nissan on 11/15/25.
//

import SwiftUI

struct ContentView: View {
    @State var playerCard = "card7"
    @State var cpuCard = "card13"
    
    @State var playerScore = 0
    @State var cpuScore = 0
    
    @State private var showResetMessage = false
    @State private var showStartupAlert = false

    var body: some View {

        ZStack{
            Image("background-plain")
                .resizable()
                .ignoresSafeArea()
            
                .onAppear {
                    showStartupAlert = true
                }
            
            VStack{
                Spacer()
                Button {
                    reset()
                } label: {
                    Image("logo")
                }

                HStack{
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(cpuCard)
                    Spacer()
                }
                Spacer()
                
                Button {
                    deal()
                } label: {
                    Image("button")
                }

                
                
                Spacer()
                HStack{
                    Spacer()
                    VStack{
                        Text("Player")
                            .font(.headline)
                            .padding(.bottom, 10.0)
                            
                            
                        Text(String(playerScore))
                            .font(.largeTitle)
                            
                    }
                    Spacer()
                    VStack{
                        Text("CPU")
                            .font(.headline)
                            .padding(.bottom, 10.0)
                        Text(String(cpuScore))
                            .font(.largeTitle)
                    }
                    Spacer()
                }
                .foregroundStyle(.white)
                Spacer()
                    .alert("To reset score, click the logo", isPresented: $showStartupAlert) {
                        Button("OK", role: .cancel) { }
                    }
            }
            .overlay(
                Group {
                    if showResetMessage {
                        Text("Scores Reset!")
                            .padding()
                            .background(Color.black.opacity(0.7))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .transition(.opacity)
                            .animation(.easeInOut(duration: 0.3), value: showResetMessage)
                    }
                }
            )
        }
        
        }
    
    func deal(){
        let randomPlayer = Int.random(in: 2...14)
        let randomCPU = Int.random(in: 2...14)
        // Randomize the players cards
        playerCard = "card" + String(randomPlayer)
        //Randomize the CPU cards
        cpuCard = "card" + String(randomCPU)
        //update score
        if randomPlayer > randomCPU{
            playerScore += 1
        }
        else if randomCPU > randomPlayer{
            cpuScore += 1
        }
        
    }
    
    func reset(){
        playerScore = 0
        cpuScore = 0
        
        showResetMessage = true
           
           // Hide after 2 seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
        showResetMessage = false
           }
    }
    }

#Preview {
    ContentView()
}

