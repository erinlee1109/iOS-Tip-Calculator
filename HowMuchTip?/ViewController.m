//
//  ViewController.m
//  HowMuchTip?
//
//  Created by Yujeong Lee on 5/20/21.
//

#import "ViewController.h"

// class definition is split into 2 things, definition & implementation
// so this is the definition
@interface ViewController ()
// make the name of outlets intuitive, like what it is + what component it is
@property (weak, nonatomic) IBOutlet UITextField *billField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

// minus is an instance method
// plus means its a class method

// IBAction is return value
//
- (IBAction)onTap:(id)sender {
    // NSLog(@"Hello");
    [self.view endEditing:YES];
}

- (IBAction)onEdit:(id)sender {
    // outlet is like an ID of an element in HTML
    double bill = [self.billField.text doubleValue];
    
    // square bracket is a shortcut for creating an array
    // @paranthesis is a shortcut for NSNumber, like boxing & unboxing in Java
    NSArray * percentages = @[@(0.15), @(0.18), @(0.20)];
    
    // NSNumbers wrapping double
    double tipPercentage = [percentages[(self.tipControl.selectedSegmentIndex)] doubleValue];
    
    double tip = tipPercentage * bill;
    double total = bill + tip;
    
    // self.tipLabel.text = @"10.00";
    self.tipLabel.text = [NSString stringWithFormat:@"$%.2f", tip];
    //self.totalLabel.text = @"$10.00";
    self.totalLabel.text = [NSString stringWithFormat:@"$%.2f", total];
}


- (IBAction)onEditingBegin:(id)sender {
    // I can't change struct directly
    self.billField.frame = CGRectMake(self.billField.frame.origin.x, self.billField.frame.origin.y + 30, self.billField.frame.size.width, self.billField.frame.size.height);
    
    [UIView animateWithDuration:1 animations:^{
        //on begin, make it invisible; on end, bring it back
        self.tipLabel.alpha = 0;
    }];
    
    
}

- (IBAction)onEditingEnd:(id)sender {
    CGRect newFrame = self.billField.frame;
    newFrame.origin.y -= 30;
    
    // class method on UIView called animate
    // 0.2 sec is pretty normal
    [UIView animateWithDuration:0.2 animations:^{
        self.billField.frame = newFrame;
    }];
    
    [UIView animateWithDuration:1 animations:^{
        //on begin, make it invisible; on end, bring it back
        self.tipLabel.alpha = 1;
    }];
}


@end
