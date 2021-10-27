//
//  walletcardApp.swift
//  walletcard
//
//  Created by Fei Yun on 2021-10-27.
//

import SwiftUI

@main
struct walletcardApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
