//
//  ContentView.swift
//  TempAtlas
//
//  Created by Justin Hatin on 6/12/19.
//  Copyright © 2019 Justin Hatin. All rights reserved.
//

import SwiftUI
import MapKit

struct Landing : View {
    @EnvironmentObject var state: WeatherState
    @State var showModal: Bool = false
    
    var body: some View {
        VStack {
            SearchBar(state: $state.current, coordinate: $state.coordinates)
            MapView(coordinate: $state.coordinates, state: $state.current)
                .padding(.top, -8)
            ControlsView(units: $state.units)
            Divider()
            InfoView()
                .environmentObject(state)
            Divider()
            HStack {
                Button(action: {
                    self.showModal = true
                }) {
                    Text("See All Favorites")
                }
                Spacer()
            }
            .padding()
        }
        .presentation(
            showModal ? Modal(
                ForecastList(showModal: $showModal)
                    .environmentObject(state),
                onDismiss: {
                    self.showModal = false
                })
            : nil)
    }
}

#if DEBUG
struct Landing_Previews : PreviewProvider {
    static var previews: some View {
        Landing().environmentObject(WeatherState())
    }
}
#endif
