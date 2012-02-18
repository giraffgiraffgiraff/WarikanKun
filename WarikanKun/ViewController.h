//
//  ViewController.h
//  WarikanKun
//
//  Created by 直野 公紀 on 12/02/11.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextFieldDelegate>
{
    IBOutlet UILabel *results;
    
    IBOutlet UITextField *amount;
    
    IBOutlet UITextField *num;
    
    IBOutlet UITextField *unit;

}

-(IBAction)calcButton;

-(IBAction)converseStringFromInt;

-(IBAction)hideKeyBoard;

-(NSString *)getStringThreeDigit:(int)argInt;

-(BOOL)IsNumeric:(NSString *)str;

@end
