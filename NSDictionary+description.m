//
//  NSDictionary+description.m
//  WhiteDragon
//
//  Created by 久远的回忆 on 15/10/23.
//  Copyright © 2015年 YongLibao. All rights reserved.
//

#import "NSDictionary+description.h"



@implementation NSDictionary (description)



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
    [strM appendString:@"{\n"];
    
    for (id obj in [self allKeys]) {
        for (int i = 0; i < count + 1; i++) {
            [strM appendFormat:@"%@",@"  "];
        }
        if ([self[obj] isKindOfClass:[NSString class]]) {
            [strM appendFormat:@"%@ = \"%@\"\n", obj,self[obj]];
        }else{
        [strM appendFormat:@"%@ = %@\n", obj,self[obj]];
        }
    }
    
    for (int i = 0; i < count; i++) {
        [strM appendFormat:@"%@",@"  "];
    }

    [strM appendString:@"}"];
    count--;
    [users setInteger:count forKey:@"nslogCount"];
    [users synchronize];
    
    return strM;
}

//计算@"{"出现的次数:
- (NSUInteger)number:(NSMutableString *)str
{
    NSInteger count = 0;
    for (int i = 0; i < [str length]; i++) {
        char a = [str characterAtIndex:i];
        if (a == '{') {
            count++;
        }
    }
    return count;
}

- (NSUInteger)number1:(NSMutableString *)str
{
    NSInteger count = 0;
    for (int i = 0; i < [str length]; i++) {
        char a = [str characterAtIndex:i];
        if (a == '}') {
            count++;
        }
    }
    return count;
}



    
    
    
    






@end
