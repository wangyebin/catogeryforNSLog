//
//  NSArray+description.m
//  WhiteDragon
//
//  Created by 久远的回忆 on 15/10/23.
//  Copyright © 2015年 YongLibao. All rights reserved.
//

#import "NSArray+description.h"

@implementation NSArray (description)

-(NSString *)descriptionWithLocale:(id)locale
{
    
    NSUserDefaults * users = [NSUserDefaults standardUserDefaults];
    NSInteger count = [users integerForKey:@"nslogCount"];
    count++;
    [users setInteger:count forKey:@"nslogCount"];
    [users synchronize];
    
    
    NSMutableString *strM = [NSMutableString string];
    [strM appendFormat:@"\n"];
    for (int i = 0; i < count; i++) {
        [strM appendFormat:@"%@",@"  "];
    }
    [strM appendString:@"(\n"];
    
    for (id obj in self) {
        for (int i = 0; i < count + 1; i++) {
            [strM appendFormat:@"%@",@"  "];
        }
        if ([obj isKindOfClass:[NSString class]]) {
            [strM appendFormat:@"\"%@\"\n", obj];
        } else {
        [strM appendFormat:@"%@\n", obj];
        }
    }
    
    for (int i = 0; i < count; i++) {
        [strM appendFormat:@"%@",@"  "];
    }
    
    [strM appendString:@")"];
    count--;
    [users setInteger:count forKey:@"nslogCount"];
    [users synchronize];
    
    return strM;
}


@end
