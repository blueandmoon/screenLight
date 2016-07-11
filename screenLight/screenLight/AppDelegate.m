//
//  AppDelegate.m
//  screenLight
//
//  Created by 李根 on 16/7/6.
//  Copyright © 2016年 ligen. All rights reserved.
//

#import "AppDelegate.h"
#import <notify.h>
//#import "Test.h"

@interface AppDelegate ()
@property(nonatomic, assign)uint64_t tempNum;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(observerBg:) name:@"bg" object:nil];
//    while (YES) {
//        
//        if ([UIApplication sharedApplication].applicationState == UIApplicationStateBackground) {
//            [[NSNotificationCenter defaultCenter] postNotificationName:@"bg" object:nil userInfo:@{@"state": @"bg"}];
//        }
//        
//        sleep(1);
//    }
    

    
    return YES;
}

- (void)observerBg:(NSNotification *)notice {
    NSLog(@"%@", notice.userInfo[@"state"]);
}

- (void)applicationDidFinishLaunching:(UIApplication *)application {
    
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
//    NSLog(@"applicationWillResignActive");
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
   
    
    
    NSLog(@"后台");

    
    while (YES) {

        if ([UIApplication sharedApplication].applicationState == UIApplicationStateBackground) {
            NSLog(@"当前处于后台");
        }
            
            //在定时器中使用如下代码实时监听屏幕状态
            uint64_t locked;
            __block int token = 0;
            _tempNum = locked;
            
        @synchronized (self) {
            notify_register_dispatch("com.apple.springboard.hasBlankedScreen",&token,dispatch_get_main_queue(),^(int t){
                //            NSLog(@"收到注册通知啦, 哇咔咔");
                //            NSLog(@"notify_register_dispatch: %d", t);
                //            NSLog(@"%ld", i++);
//                return ;
            });
            //        NSLog(@"status: %d", statuss);
            notify_get_state(token, &locked);
        }
            //如果屏幕变暗 直接不走更新方法 lock为1则为变暗关闭状态 0则为点亮状态
        
            NSLog(@"_tempNum: %llu, locked: %llu", _tempNum, locked);
        
            if (_tempNum == 1 && locked == 0) {
                NSLog(@"屏幕点亮啦~~~");
                
//                if ([UIApplication sharedApplication].applicationState == UIApplicationStateBackground) {
//                    [self applicationDidEnterBackground:[UIApplication sharedApplication]];
//                }
                
                return;
            }
        
        sleep(1);

    }

}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
//    NSLog(@"applicationDidBecomeActive");
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
