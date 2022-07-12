//
//  ContentView.swift
//  swiftui-material-style
//
//  Created by Zac Snider on 7/11/22.
//

import SwiftUI

struct ContentView: View {
    
    var materials: [Material] = [.ultraThinMaterial, .thinMaterial, .regularMaterial, .thickMaterial, .ultraThickMaterial]
    @State private var materialIndex = 0
    @State private var saturation = 1.0
    
    var body: some View {
        NavigationView{
            VStack {
                ZStack {
                    GeometryReader { geometry in
                        Image("bg")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .edgesIgnoringSafeArea(.all)
                            .frame(maxWidth: geometry.size.width, maxHeight: geometry.size.height)
                            .cornerRadius(32)
                    }
                    VStack {
                        Spacer()
                        VStack(alignment: .leading) {
                            //Image(systemName: "play.fill")
                            //.imageScale(.large)
                            Text("Taking on a challenge is a lot like riding a horse, isn't it? If you're comfortable while you're doing it, you're probably doing it wrong.")
                                .font(.headline)
                                .fontWeight(.heavy)
                                .padding(.bottom, 4)
                        }
                        .frame(maxWidth: .infinity)
                        .padding(32)
                        .foregroundStyle(.primary)
                        .background(materials[materialIndex])
                        .saturation(saturation)
                        //.preferredColorScheme(isDarkMode ? .dark : .light)
                        .cornerRadius(16)
                    }
                    .padding()
                }
                Spacer()
                VStack(alignment: .leading) {
                    Text(String(format: "Saturation: %.1f", saturation))
                    Slider(
                        value: $saturation,
                        in: 0...10)
                }
                .padding()
                VStack(alignment: .leading) {
                    Text("Material")
                    Picker("Select Material", selection: $materialIndex) {
                        Text("xThin").tag(0)
                        Text("Thin").tag(1)
                        Text("Regular").tag(2)
                        Text("Thick").tag(3)
                        Text("xThick").tag(4)
                    }
                    .pickerStyle(.segmented)
                }
                .padding()
            }
            .edgesIgnoringSafeArea(.top)
            .navigationTitle(Text("Ted Lasso").font(.title))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
