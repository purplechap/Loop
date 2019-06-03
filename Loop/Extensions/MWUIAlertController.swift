//
//  MWUIAlertAction.swift
//  Loop
//
//  Created by Michael Why on 5/12/19.
//  Copyright © 2019 LoopKit Authors. All rights reserved.
//

import UIKit
import LoopKit
import LoopKitUI

extension UIAlertController {
    convenience init(mwCancelBolusHandler handler: @escaping () -> Void) {
        self.init(
            title: nil,
            message: "Are you sure you want to cancel the bolus?",
            preferredStyle: .actionSheet
        )
        
        addAction(UIAlertAction(
            title: "Cancel Bolus",
            style: .destructive,
            handler: { _ in handler() }
        ))
        
        addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
    }

    convenience init(mwRecommendedTempBasalHandler handler: @escaping () -> Void) {
        self.init(
            title: nil,
            message: "Are you sure you want to apply the recommended temp basal?",
            preferredStyle: .actionSheet
        )
        
        addAction(UIAlertAction(
            title: "Apply Bolus",
            style: .destructive,
            handler: { _ in handler() }
        ))
        
        addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
    }

    convenience init(mwTogglePreMealHandler handler: @escaping () -> Void) {
        self.init(
            title: nil,
            message: "Are you sure you want to toggle the pre-meal button?",
            preferredStyle: .actionSheet
        )
        
        addAction(UIAlertAction(
            title: "Toggle Pre-Meal Button",
            style: .destructive,
            handler: { _ in handler() }
        ))
        
        addAction(UIAlertAction(title: "Cancel Toggle", style: .cancel, handler: nil))
    }
}
