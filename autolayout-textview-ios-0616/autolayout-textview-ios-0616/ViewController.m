//
//  ViewController.m
//  autolayout-textview-ios-0616
//
//  Created by Kenneth Cooke on 6/27/16.
//  Copyright © 2016 kencooke. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *leftButton;
@property (weak, nonatomic) IBOutlet UIButton *rightButton;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) NSLayoutConstraint *textBottom;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.view.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view removeConstraints:self.view.constraints];
    
    self.leftButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.leftButton removeConstraints:self.leftButton.constraints];
    
    [self.leftButton.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant:10.0].active = YES;
    [self.leftButton.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:-10.0].active = YES;
    
    
    self.rightButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.rightButton removeConstraints:self.rightButton.constraints];
    
    [self.rightButton.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant:-10.0].active = YES;
    [self.rightButton.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:-10.0].active = YES;
    
    self.textView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.textView removeConstraints:self.textView.constraints];
    
    [self.textView.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:20].active = YES;
    self.textBottom = [self.textView.bottomAnchor constraintEqualToAnchor:self.leftButton.topAnchor constant: -20];
    self.textBottom.active = YES;
    
    [self.textView.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant:10].active = YES;
    [self.textView.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant:-10].active = YES;
    
    NSLog(@"%ld", (long)self.traitCollection.displayScale);
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) traitCollectionDidChange: (UITraitCollection *) previousTraitCollection {
    [super traitCollectionDidChange: previousTraitCollection];
    if (self.traitCollection.verticalSizeClass == 2 && self.traitCollection.displayScale == 2)
    {
        self.textBottom.constant = -20;
        NSLog(@"%ld", (long)self.traitCollection.verticalSizeClass);
        
        
    } if (self.traitCollection.verticalSizeClass == 1 && self.traitCollection.displayScale == 2) {
        self.textBottom.constant = -10;
        NSLog(@"%ld", (long)self.traitCollection.verticalSizeClass);
        
    } if (self.traitCollection.displayScale == 3) {
        self.textBottom.constant = -30;
        NSLog(@"%ld", (long)self.traitCollection.verticalSizeClass);
    }
}

@end
