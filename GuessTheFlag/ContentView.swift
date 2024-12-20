//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Kyrylo Polovko on 2024/08/17.
//

import SwiftUI

struct FlagImage: View {
    var imgName: String
    var body: some View {
        Image(imgName)
            .clipShape(.capsule)
            .shadow(radius: 5)
    }
}

struct ContentView: View {
    @State var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"]
    @State var correctAnswer = Int.random(in: 0...2)
    @State var score = 0
    @State var questionsNumber = 0
    @State var isGameOver = false
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var animationAmount = 0.0
    @State private var selectedButtonIndex: Int? = nil
    @State private var opacity = 1.0
    var body: some View {
        ZStack{
            RadialGradient(stops: [.init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                                   .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)],
                           center: .top, startRadius: 200, endRadius: 700)
                .ignoresSafeArea()
            
            VStack{
                Spacer()
                Text("Question: \(questionsNumber)")
                    .font(.title)
                    .foregroundStyle(.white)
                Spacer()
                
                Text("Guess the Flag")
                        .font(.largeTitle.bold())
                        .foregroundStyle(.white)
                VStack(spacing: 15){
                    
                    VStack{
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer])
                            .foregroundStyle(.white)
                            .font(.largeTitle.weight(.semibold))
                        
                        ForEach(0..<3){ number in
                            Button{
                                withAnimation{
                                    selectedButtonIndex = number
                                    opacity = 0.25
                                    animationAmount += 360
                                }
                                flagTapped(number)
                            } label: {
                                FlagImage(imgName: countries[number])
                            }.rotation3DEffect(
                                .degrees(selectedButtonIndex == number ? animationAmount : 0),
                                axis: /*@START_MENU_TOKEN@*/(x: 0.0, y: 1.0, z: 0.0)/*@END_MENU_TOKEN@*/)
                            .opacity( selectedButtonIndex == number ? 1 : opacity)
                        }
                    }
                }.frame(maxWidth: .infinity)
                    .padding(.vertical, 20)
                    .background(.regularMaterial)
                    .clipShape(.rect(cornerRadius: 20))
                Spacer()
                Spacer()
                Text("Score: \(score)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                Spacer()
            }.padding()
        }
        .alert(scoreTitle, isPresented: $showingScore){
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is \(score)")
        }
        .alert("Game Over!", isPresented: $isGameOver){
            Button("Continue", action: reset)
        } message: {
            Text("Your final score is \(score)")
        }
        
        
    }
    func flagTapped(_ number:Int){
        if number == correctAnswer{
            scoreTitle = "Correct"
            score += 1
            
        } else {
            scoreTitle = "Wrong! It is flag of \(countries[number])"
        }
        questionsNumber += 1
        showingScore = true
        if questionsNumber == 8{
            isGameOver = true
        }
    }
    func askQuestion(){
        selectedButtonIndex = nil
        opacity = 1
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    func reset(){
        questionsNumber = 0
        score = 0
    }
}

#Preview {
    ContentView()
}
