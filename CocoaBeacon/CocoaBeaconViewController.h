//
//  CocoaBeaconViewController.h
//  CocoaBeacon
//
//  Created by George Villasboas on 5/15/14.
//  Copyright (c) 2014 CocoaHeads. All rights reserved.
//

#import <UIKit/UIKit.h>

#define BEACON_UUID @"5A4BCFCE-174E-4BAC-A814-092E77F6B7E5" // UUID do iBeacon

@interface CocoaBeaconViewController : UIViewController

///---------------------------------------
/// @name Outlets
///---------------------------------------
@property (weak, nonatomic) IBOutlet UISwitch *swtich;
@property (weak, nonatomic) IBOutlet UILabel *distanciaLabel;

@end
