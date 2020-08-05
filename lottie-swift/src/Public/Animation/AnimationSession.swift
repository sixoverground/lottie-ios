//
//  AnimationSession.swift
//  lottie-swift
//
//  Created by Craig Phares on 8/5/20.
//  Copyright © 2020 YurtvilleProds. All rights reserved.
//

import Foundation

class AnimationSession: NSObject {
    
    /// Delegate to handle challenges
    var sessionDelegate = AnimationSessionDelegate()
    /// Hold a custom session
    var session: URLSession!

    static let shared: AnimationSession = {
        let instance = AnimationSession()
        instance.session = URLSession(configuration: URLSessionConfiguration.default, delegate: instance.sessionDelegate, delegateQueue: nil)
        return instance
    }()
    
}
