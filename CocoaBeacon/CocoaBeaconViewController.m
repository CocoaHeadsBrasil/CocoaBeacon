//
//  CocoaBeaconViewController.m
//  CocoaBeacon
//
//  Created by George Villasboas on 5/15/14.
//  Copyright (c) 2014 CocoaHeads. All rights reserved.
//

#import "CocoaBeaconViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface CocoaBeaconViewController () <CLLocationManagerDelegate>
@property (strong, nonatomic) CLLocationManager *_locationManager;
@property (strong, nonatomic) CLBeaconRegion *_beaconRegion;
@end

@implementation CocoaBeaconViewController

#pragma mark -
#pragma mark Getters overriders
#pragma mark -

#pragma mark -
#pragma mark Setters overriders
#pragma mark -

#pragma mark -
#pragma mark Designated initializers
#pragma mark -

#pragma mark -
#pragma mark Public methods
#pragma mark -

#pragma mark -
#pragma mark Private methods
#pragma mark -

/**
 *  Utilizado para ativar a busca por iBeacons
 */
- (void)ligar
{
    NSUUID *regionUUID = [[NSUUID alloc] initWithUUIDString:BEACON_UUID];
    self._beaconRegion = [[CLBeaconRegion alloc] initWithProximityUUID:regionUUID identifier:@"Run Tenis iBeacons"];
    self._beaconRegion.notifyEntryStateOnDisplay = NO;
    self._beaconRegion.notifyOnEntry = NO;
    self._beaconRegion.notifyOnExit = NO;
    
    [self._locationManager startRangingBeaconsInRegion:self._beaconRegion];
}

/**
 *  Utilizado para desativar a busca por iBeacons
 */
- (void)desligar
{
    [self._locationManager stopRangingBeaconsInRegion:self._beaconRegion];
    self.view.backgroundColor = [UIColor redColor];
    self.distanciaLabel.text = @"???";
}

#pragma mark -
#pragma mark ViewController life cycle
#pragma mark -

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self._locationManager = [[CLLocationManager alloc] init];
    self._locationManager.delegate = self;
    
    self.view.backgroundColor = [UIColor redColor];
    self.distanciaLabel.text = @"???";
    
}

#pragma mark -
#pragma mark Overriden methods
#pragma mark -

#pragma mark -
#pragma mark Storyboards Segues
#pragma mark -

#pragma mark -
#pragma mark Target/Actions
#pragma mark -

- (IBAction)ligarDesligarBusca:(UISwitch *)sender
{
    if (sender.on) [self ligar];
    else [self desligar];
}

#pragma mark -
#pragma mark Delegates
#pragma mark -

#pragma mark CLLocationDelegates

- (void)locationManager:(CLLocationManager *)manager didRangeBeacons:(NSArray *)beacons inRegion:(CLBeaconRegion *)region
{
    // Se algum iBeacon for encontrado, ele vira no NSArray.
    if (beacons.count > 0) {
        // o array possui registros, portanto, iBeacons.
        // iBeacon encontrado!
        CLBeacon *beacon = beacons[0];                      // neste exemplo estamos interessados em apenas 1 iBeacon.
        self.view.backgroundColor = [UIColor greenColor];   // Muda cor
        self.distanciaLabel.text = [NSString stringWithFormat:@"%.2fm", beacon.accuracy];   // muda texto da label
        
        NSLog(@"%@", beacon);   // log apenas para ler os outros valores (Major, Minor e Power)
    }
    else{
        // Nenhum iBeacon informado no array.
        // Retorna cor para vermelhor
        self.view.backgroundColor = [UIColor redColor];
        self.distanciaLabel.text = @"???";
    }
}

#pragma mark -
#pragma mark Notification center
#pragma mark -

@end
