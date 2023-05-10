//
//  SearchBarView.swift
//  AnimatedSearchBar
//
//  Created by Rahul R on 09/05/23.
//

import Foundation
import SwiftUI

import SwiftUI

struct SearchBarView: View {
    @State private var searchText = ""
    @State private var isEditing = false
    @State private var currentPlaceholderIndex = 0
    let placeholders = ["Search for Books", "Search for Dress", "Search for Place", "Search for Food"]
    
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .foregroundColor(Color(UIColor.systemGray6))
                .frame(height: 40)
                .cornerRadius(10)
            
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(Color(UIColor.systemGray2))
                
                TextField(placeholders[currentPlaceholderIndex], text: $searchText, onEditingChanged: { isEditing in
                    self.isEditing = isEditing
                })
                .foregroundColor(.primary)
                .onReceive(timer) { _ in
                    withAnimation {
                        currentPlaceholderIndex = (currentPlaceholderIndex + 1) % placeholders.count
                    }
                }
            }
            .padding(.horizontal, 24)
        }
        .padding(.horizontal)
    }
}
