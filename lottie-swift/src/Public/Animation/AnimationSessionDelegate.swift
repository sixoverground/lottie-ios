//
//  AnimationSessionDelegate.swift
//  lottie-swift
//
//  Created by Craig Phares on 8/5/20.
//  Copyright © 2020 YurtvilleProds. All rights reserved.
//

import Foundation

public class AnimationSessionDelegate: NSObject {
    
    /// List of trusted host strings
    public var trustedHosts: [String] = []

}

extension AnimationSessionDelegate: URLSessionDelegate {

    /// If challenged by a trusted host, allow credential
    public func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        if challenge.protectionSpace.authenticationMethod == NSURLAuthenticationMethodServerTrust {
            if trustedHosts.contains(challenge.protectionSpace.host) {
                let credential = URLCredential(trust: challenge.protectionSpace.serverTrust!)
                completionHandler(.useCredential, credential)
            }
        }
    }
    
}
