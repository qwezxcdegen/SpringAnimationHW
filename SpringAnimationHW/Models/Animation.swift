//
//  Animation.swift
//  SpringAnimationHW
//
//  Created by Степан Фоминцев on 02.05.2023.
//

import Foundation

struct Animation {
    let name: String
    let curve: String
    let force: CGFloat
    let duration: CGFloat
    let delay: CGFloat
    
    static func getRandomAnimation() -> Animation {
        let dataStore = DataStore.shared
        let name = dataStore.animations.randomElement() ?? ""
        let curve = dataStore.curves.randomElement() ?? ""
        let force = CGFloat.random(in: 0...2)
        let duration = CGFloat.random(in: 0...2)
        let delay = 0.0
        
        return Animation(
            name: name,
            curve: curve,
            force: force,
            duration: duration,
            delay: delay
        )
    }
}
