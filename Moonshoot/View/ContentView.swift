//
//  ContentView.swift
//  Moonshoot
//
//  Created by Massa Antonio on 14/05/21.
//

import SwiftUI

struct ContentView: View {
    
    let astronaut: [Astronaut] = Bundle.main.decode("astronauts.json")
    let mission: [Mission] = Bundle.main.decode("missions.json")
    
    var body: some View {
        NavigationView {
            List(mission) { mission in
                NavigationLink(destination: MissionView(mission: mission, astronaut: self.astronaut)) {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 44, height: 44)
                    
                    VStack(alignment: .leading) {
                        Text(mission.displayName)
                            .font(.headline)
                        Text(mission.formattedLaunchDate)
                    }
                }
            }
            .navigationBarTitle("Moonshot")
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
