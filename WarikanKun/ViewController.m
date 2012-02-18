//
//  ViewController.m
//  WarikanKun
//
//  Created by 直野 公紀 on 12/02/11.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    num.text = @"5";
    amount.text = @"19800";
    unit.text = @"100";
    
    num.delegate = self;
    amount.delegate = self;
    unit.delegate = self;
}

- (void)viewDidUnload
{
    // unit = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    /*if ([self IsNumeric:textField.text])
    {
        int intTextField = [textField.text intValue];
        NSString *str = [self getStringThreeDigit:intTextField];
        textField.text = str;
    }*/    
    return YES;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    
    return YES;    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

-(BOOL)IsNumeric:(NSString *)str
{
    BOOL b = false;
    NSError *error   = nil;
    NSRegularExpression *regexp =
    [NSRegularExpression regularExpressionWithPattern:@"^[0-9]+$"
                                              options:0
                                                error:&error];    
    if (error != nil) {
        NSLog(@"%@", error);
    } else {
        NSTextCheckingResult *match =
        [regexp firstMatchInString:str options:0 range:NSMakeRange(0, str.length)];
        NSInteger i = match.numberOfRanges;        
        if (i > 0)
        {
            b = true;
        } else
        {
            b = false;
        }
    }
    return b;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [amount resignFirstResponder];
    [num resignFirstResponder];
    [unit resignFirstResponder];
}

-(NSString *)getStringThreeDigit:(int)argInt;
{
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    NSString* str = [formatter stringFromNumber:[NSNumber numberWithInt:argInt]];
    return str;
}

-(IBAction)calcButton
{
    [amount resignFirstResponder];
    [num resignFirstResponder];
    [unit resignFirstResponder];
 
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"注意" message:@"" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];    
    
    if ([self IsNumeric:amount.text] && [self IsNumeric:num.text] && [self IsNumeric:unit.text])
    {
        double amt = [amount.text doubleValue];
        double nm = [num.text doubleValue];
        double unt = [unit.text doubleValue];
        double x = floor(((amt/nm) / unt)) * unt;
        double y = amt - (x*nm);
        double _x = ceil(((amt/nm) / unt)) * unt;
        double _y = (_x*nm) - amt;        
        if(0 == nm)
        {
            alert.message = @"友達を作りましょう！";
            [alert show];
        }
        else
        {
            if (0 == y) {
                results.text = [NSString stringWithFormat:@"1人%d円ぴったりです。",(int)x, (int)y];
            } else {
                results.text = [NSString stringWithFormat:@"1人%d円だと%d円足りません。\n1人%d円だと%d円余ります。",(int)x, (int)y, (int)_x, (int)_y];
            }
        }    
    }
    else
    {
        alert.message = @"数値じゃないのが入ってます。";
        [alert show];
    }
}

@end
