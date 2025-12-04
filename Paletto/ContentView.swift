//
//  ContentView.swift
//  Paletto
//
//  Created by Gina Mahaz on 11/24/25.
//

import SwiftUI

struct ContentView: View {
@State private var currentColor: Color = .white
@State private var accessibilityOn: Bool = true
@State private var WordRandomizer = ""
    
    let rows = 7
    let columns = 4
    let colors: [Color] = [
        .red, .pink, .orange, .yellow, .green, .blue, .indigo, .purple
    ]
    let sounds: [String] = [
        "sound_0_0", "sound_0_1", "sound_0_2",
        "sound_1_0", "sound_1_1", "sound_1_2",
        "sound_2_0", "sound_2_1", "sound_2_2",
        "sound_3_0", "sound_3_1", "sound_3_2",
        "sound_4_0", "sound_4_1", "sound_4_2",
        "sound_5_0", "sound_5_1", "sound_5_2",
        "sound_6_0", "sound_6_1", "sound_6_2"
    ]
    let accessibilityLabels: [String] = [
        "Red", "Pink", "Orange", "Yellow", "Green", "Blue", "Indigo", "Purple"
    ]
    var allWords =
    [
     "Authentic", "Aware", "Balance", "Bliss", "Bold", "Clever", "Connected", "Dazzling", "Diligent", "Eager", "Energetic", "Enticing", "Fine", "Fortunate", "Glamorous", "Great", "Happy", "Healthy", "Inspiring", "Inviting", "Keen", "Kind", "Lovely", "Lucky", "Luminous", "Magical", "Melancholy", "Natural", "Neat", "Radiant", "Relaxing", "Rewarding", "Safe", "Serene", "Thrilling", "Thriving", "Tranquility", "Vigorous", "Vivid", "Warm"
    ]
    
    var body: some View {
        ZStack {
            Color(UIColor.systemBackground)
                .ignoresSafeArea()
            VStack {
        
                HStack {
                    ZStack {
                        MorphingCircle()
                            .frame(width: 120, height: 120)
                            .opacity(0.5)
//                            .glassEffect(.clear)
//                            .glassEffectTransition(.materialize)
                            
                        MorphingCircle(morphingRange: 55, color: currentColor)
                            .frame(width: 120, height: 120)
                            .opacity(0.55)
//                            .glassEffect(.clear)
//                            .glassEffectTransition(.matchedGeometry)
                            
                        VStack {
                            Text("A#")
                                .font(Font.custom("Silom", size: 30))
                                .foregroundColor(Color.white)
                                .shadow(radius: 7)
                        
                        Text(WordRandomizer)
                            .font(Font.custom("Silom", size: 25))
                            .foregroundColor(.white)
                        Button(action: {
                            WordRandomizer = allWords.randomElement() ?? "No Words"
                        }) {
                            Image(systemName: "arrow.trianglehead.2.clockwise")
                                .font(Font.custom("Silom", size: 20))
                                .foregroundColor(.white)
                        }
                        }
                    }
                }
// Developer Reset Toggle for welcome page troubleshooting
//                Toggle("Developer Reset", isOn: $hasSeenWelcome)
                Spacer()
                Grid(horizontalSpacing: 3, verticalSpacing: 3) {
                    ForEach(0..<rows, id: \.self) { row in
                        GridRow {
                            ForEach(0..<columns, id: \.self) { column in
                                
                                let index = (row * columns + column) % colors.count
                                let color = colors[index]
                                let soundName = sounds[index]
                                let accessibilityLabel = accessibilityLabels[index]
                                
                                Button {
                                    currentColor = colors[index]
                                    SoundManager.shared.playSound(named: soundName)
                                } label: {
                                    if accessibilityOn {
                                        Text("\(accessibilityLabel)")
                                            .frame(width: 85, height: 85)
                                            .background(color)
                                            .foregroundColor(.white)
                                    } else {
                                        Text("")
                                            .frame(width: 85, height: 85)
                                            .background(color)
                                            .foregroundColor(.white)
                                    }
                                }
                                .buttonStyle(.plain)
                            }
                        }
                    }
                }
                        .padding(16)
            }
        }
    }
}

#Preview {
    ContentView()
}
