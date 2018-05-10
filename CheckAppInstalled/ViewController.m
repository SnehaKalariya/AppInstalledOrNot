//
//  ViewController.m
//  CheckAppInstalled
//
//  Created by kamal saboo on 10/05/18.
//  Copyright © 2018 kamal saboo. All rights reserved.
//

#import "ViewController.h"
#import "SSKeychain.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *str = [self getUniqueDeviceIdentifier];
    
}
-(NSString *)getUniqueDeviceIdentifier
{
    
    NSString *yourAppName=[[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString*)kCFBundleNameKey];
    
    NSString *applicationUUIDStr = [SSKeychain passwordForService:yourAppName account:@"Your_App_Name"];
    if (applicationUUIDStr == nil)
    {
        applicationUUIDStr  = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
        [SSKeychain setPassword:applicationUUIDStr forService:yourAppName account:@"Your_App_Name"];
    }
    NSLog(@"app uuid %@",applicationUUIDStr);
    return applicationUUIDStr;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
