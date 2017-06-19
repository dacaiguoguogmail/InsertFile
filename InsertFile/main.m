//
//  main.m
//  InsertFile
//
//  Created by yanguo sun on 19/06/2017.
//  Copyright © 2017 Lvmama. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *path1 = [NSString stringWithUTF8String:argv[1]];
        if ([path1 isEqualToString:@"--help"]||[path1 isEqualToString:@"help"] || [path1 isEqualToString:@"-h"] || argc < 4 || argc > 4) {
            printf("InsertFile file1 file2; if file2 start with file1, do nothing; else insert file1 to file2 begin\n");
            return 1;
        }
        NSString *str1 = [NSString stringWithContentsOfFile:path1 encoding:NSUTF8StringEncoding error:nil];
        NSString *path2 = [NSString stringWithUTF8String:argv[2]];
        NSString *index = [NSString stringWithUTF8String:argv[3]];
        NSString *str2 = [NSString stringWithContentsOfFile:path2 encoding:NSUTF8StringEncoding error:nil];
        if (![str2 hasPrefix:str1]) {
            NSMutableArray *mutArray = [[str2 componentsSeparatedByString:@"\n"] mutableCopy];
            [mutArray insertObject:[str1 componentsSeparatedByString:@"\n"] atIndex:[index integerValue]];
            NSString *cat = [mutArray componentsJoinedByString:@"\n"];
            [cat writeToFile:[NSString stringWithUTF8String:argv[2]] atomically:YES encoding:NSUTF8StringEncoding error:nil];
        }
        NSLog(@"\n%@",[NSString stringWithContentsOfFile:path2 encoding:NSUTF8StringEncoding error:nil]);

    }
    return 0;
}
