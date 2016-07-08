//
//  Test.m
//  screenLight
//
//  Created by 李根 on 16/7/6.
//  Copyright © 2016年 ligen. All rights reserved.
//

#import "Test.h"
//#import <notify.h>

@implementation Test

+ (instancetype)shareTest {
    static Test *tst;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tst = [[Test alloc] init];
    });
    return tst;
}

- (void)observer {
    
//    @synchronized (self) {
//    }
        //在定时器中使用如下代码实时监听屏幕状态
        uint64_t locked;
//        __block int token = 0;
    
//        dispatch_queue_t queue = dispatch_queue_create("daf", NULL);
//        notify_register_dispatch("com.apple.springboard.hasBlankedScreen",&token,dispatch_get_main_queue(),^(int t){
//        });
//        notify_get_state(token, &locked);
        //如果屏幕变暗 直接不走更新方法 lock为1则为变暗关闭状态 0则为点亮状态
    
//        if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"screenLight"] isEqualToString:@"1"] && locked == 0) {
//            NSLog(@"屏幕点亮啦");
//        }
//        [[NSUserDefaults standardUserDefaults] setObject:[NSString stringWithFormat:@"%llu", locked] forKey:@"screenLight"];
//        [[NSUserDefaults standardUserDefaults] synchronize];
    
        if (locked) {
            return;
        }
    
//        dispatch_release(queue);
    
    
        sleep(0.5);
    
}

@end
