//
//  MakeChocolate.m
//  iFit
//
//  Created by Brady Randall on 1/31/14.
//
//

#import "MakeChocolate.h"

@implementation MakeChocolate

/********************************
 * We want make a package of goal kilos of chocolate. We have
 * small bars (1 kilo each) and big bars (5 kilos each).
 * Return the number of small bars to use, assuming we always
 * use big bars before small bars. Return -1 if it can't be done.
 *
 * See the verify lines below for examples of input
 * and expected output.
 *
 * Run this class, If you see errors, it is because the tests below
 * did not pass. Once the tests do pass, you will see a log of `Success!`
 ********************************/
+(void)runTests {
    @try {
        // These are the tests that will run against your code
        // vars = small, big, goal, expected answer
        [self verifyWithSmall:4 big:1 goal:9 expected:4];
        [self verifyWithSmall:4 big:1 goal:10 expected:-1];
        [self verifyWithSmall:4 big:1 goal:7 expected:2];
        [self verifyWithSmall:6 big:2 goal:7 expected:2];
        [self verifyWithSmall:4 big:1 goal:5 expected:0];
        [self verifyWithSmall:4 big:1 goal:4 expected:4];
        [self verifyWithSmall:5 big:4 goal:9 expected:4];
        [self verifyWithSmall:9 big:3 goal:18 expected:3];
        [self verifyWithSmall:3 big:1 goal:9 expected:-1];
        [self verifyWithSmall:1 big:2 goal:7 expected:-1];
        [self verifyWithSmall:1 big:2 goal:6 expected:1];
        [self verifyWithSmall:1 big:2 goal:5 expected:0];
        [self verifyWithSmall:6 big:1 goal:10 expected:5];
        [self verifyWithSmall:6 big:1 goal:11 expected:6];
        [self verifyWithSmall:6 big:1 goal:12 expected:-1];
        [self verifyWithSmall:6 big:1 goal:13 expected:-1];
        [self verifyWithSmall:6 big:2 goal:10 expected:0];
        [self verifyWithSmall:6 big:2 goal:11 expected:1];
        [self verifyWithSmall:6 big:2 goal:12 expected:2];
        [self verifyWithSmall:60 big:100 goal:550 expected:50];
        [self verifyWithSmall:1000 big:1000000 goal:5000006 expected:6];
        [self verifyWithSmall:7 big:1 goal:12 expected:7];
        [self verifyWithSmall:7 big:1 goal:13 expected:-1];
        [self verifyWithSmall:7 big:2 goal:13 expected:3];
        NSLog(@"runTests - Success!");
    } @catch (NSException *exc) {
        NSLog(@"runTests - exception: %@", [exc reason]);
    }
}

/********************************
 * YOUR CODE BELOW HERE
 ********************************/
+(int)makeWithSmall:(int)small big:(int)big goal:(int)goal {
    
    NSLog(@"--------------------------------------------------");
    NSLog(@"small: %zd / big: %zd / goal: %zd",small,big,goal);
    
    int answer = -1;
    
    int currentBigBars = big;
    
    while (currentBigBars >= 0) {
        
        NSLog(@"currentBigBars: %zd",currentBigBars);
        
        int currentSmallBars = small;
        while (currentSmallBars > 0) {
            
            NSLog(@"currentSmallBars: %zd",currentSmallBars);
            
            if (goal == (currentBigBars * 5) + currentSmallBars) {
                answer = currentSmallBars;
                break;
            }
            
            currentSmallBars--;
        }
        
        if (goal == (currentBigBars * 5) + currentSmallBars) {
            answer = currentSmallBars;
            break;
        }
        
        currentBigBars--;

    }
    
    return answer;
}
/********************************
 * YOUR CODE ABOVE HERE
 ********************************/

+(void)verifyWithSmall:(int)small big:(int)big goal:(int)goal expected:(int)expected {
    int answer = [self makeWithSmall:small big:big goal:goal];
    if (answer != expected) {
        @throw [NSException exceptionWithName:@"Wrong answer" reason:[NSString stringWithFormat:@"wrong answer, expected %d to equal %d", answer, expected] userInfo:nil];
    }
}

@end
