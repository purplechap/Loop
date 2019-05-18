//
//  BadgeDataManager
//  Loop
//
//  Created by Mike Why 5/11/2019.
//  Copyright © 2019 Mike Why. All rights reserved.
//

import Foundation
import HealthKit
import LoopKit


final class BadgeManager {

    unowned let deviceManager: DeviceDataManager
    
    init(deviceDataManager: DeviceDataManager) {
        self.deviceManager = deviceDataManager

//        NotificationCenter.default.addObserver(self, selector: #selector(loopDataUpdated(_:)), name: .LoopDataUpdated, object: deviceDataManager.loopManager)
    }
    
//    @objc func loopDataUpdated(_ note: Notification) {
//        guard
//            let rawContext = note.userInfo?[LoopDataManager.LoopUpdateContextKey] as? LoopDataManager.LoopUpdateContext.RawValue,
//            let context = LoopDataManager.LoopUpdateContext(rawValue: rawContext),
//            case .tempBasal = context
//        else {
//            return
//        }
//        if let glucose = self.deviceManager.cgmManager?.rawValue {
//            NSLog("Badge Update: \(glucose)")
//        }
//    }
// 
    // MARK: MW Custom - set badge icon value to current glucose value
    func updateBadge(_ values: [GlucoseValue], sensorState: SensorDisplayable?) {
        var glucoseMGDL = 0
        if sensorState != nil && sensorState!.isStateValid {
            if let actualGlucose = values.first {
                glucoseMGDL = Int(actualGlucose.quantity.doubleValue(for: .milligramsPerDeciliter))
            }
        }
        updateBadgeCount(glucoseMGDL)
    }
    
    fileprivate func updateBadgeCount(_ count: Int) {
        // If on the main thread update the badge count, otherwise we're in the background so set
        // using a dispatch queue on the main thread
        if Thread.isMainThread {
            UIApplication.shared.applicationIconBadgeNumber = count
        } else {
            DispatchQueue.main.async {
                UIApplication.shared.applicationIconBadgeNumber = count
            }
        }
    }
}

