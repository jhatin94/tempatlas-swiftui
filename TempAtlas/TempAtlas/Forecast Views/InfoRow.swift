//
//  InfoRow.swift
//  TempAtlas
//
//  Created by Justin Hatin on 6/14/19.
//  Copyright © 2019 Justin Hatin. All rights reserved.
//

import SwiftUI

struct InfoRow : View {
    var label: String
    var value: String
    
    var body: some View {
        HStack {
            Text(label)
                .font(.headline)
                .lineLimit(nil)
            
            Text(value)
                .lineLimit(nil)
            Spacer()
        }
    }
}

#if DEBUG
struct InfoRow_Previews : PreviewProvider {
    static var previews: some View {
        InfoRow(label: "Location:", value: "Charlottesville")
            .previewLayout(.sizeThatFits)
    }
}
#endif
