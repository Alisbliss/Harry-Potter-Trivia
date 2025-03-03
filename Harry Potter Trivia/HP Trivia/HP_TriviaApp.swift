//
//  HP_TriviaApp.swift
//  HP Trivia
//
//  Created by Алеся Афанасенкова on 10.12.2024.
//

import SwiftUI

@main
struct HP_TriviaApp: App {
    @StateObject private var store = Store()
    @StateObject private var game = Game()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(store)
                .environmentObject(game)
                .task {
                    await store.loadProducts()
                    game.loadScores()
                    store.loadStatus()
                }
        }
    }
}
