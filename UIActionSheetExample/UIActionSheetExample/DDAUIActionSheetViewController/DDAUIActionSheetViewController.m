//
//  DDAUIActionSheetViewController.m
//  UIActionSheetExample
//
//  Created by Dulio Denis on 3/23/14.
//  Copyright (c) 2014 ddApps. All rights reserved.
//

#import "DDAUIActionSheetViewController.h"

@interface DDAUIActionSheetViewController () <UIGestureRecognizerDelegate>

@property(nonatomic) IBOutlet UIView *actionSheetView;

@end

@implementation DDAUIActionSheetViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                           action:@selector(handleTapFromView:)];
    [self.view addGestureRecognizer:tapGestureRecognizer];
    tapGestureRecognizer.delegate = self;
    [self slideIn];
}


#pragma mark - Custom ActionSheet Methods

- (void)slideOut {
    [UIView beginAnimations:@"removeFromSuperviewWithAnimation" context:nil];
    
    // Set delegate and selector to remove from superview when animation completes
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:context:)];
    
    // Move this view to bottom of superview
    CGRect frame = self.actionSheetView.frame;
    frame.origin = CGPointMake(0.0, self.view.bounds.size.height);
    self.actionSheetView.frame = frame;
    
    [UIView commitAnimations];
}

- (void)animationDidStop:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context {
    if ([animationID isEqualToString:@"removeFromSuperviewWithAnimation"]) {
        [self.view removeFromSuperview];
    }
}

- (void)slideIn {
    //set initial location at bottom of view
    CGRect frame = self.actionSheetView.frame;
    frame.origin = CGPointMake(0.0, self.view.bounds.size.height);
    self.actionSheetView.frame = frame;
    [self.view addSubview:self.actionSheetView];
    
    // set up an animation for the transition between the views
	CATransition *animation = [CATransition animation];
	[animation setDuration:0.5];
	[animation setType:kCATransitionPush];
	[animation setSubtype:kCATransitionFromTop];
	[animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    self.view.alpha=1.0f;
	
	[[self.actionSheetView layer] addAnimation:animation forKey:@"TransitionToActionSheet"];
}


#pragma mark - Tap Gesture Recognizer Method

- (void) handleTapFromView: (UITapGestureRecognizer *)recognizer
{
    [self slideOut];
}

@end
