//
//  DDAMainViewController.m
//  UIActionSheetExample
//
//  Created by Dulio Denis on 3/23/14.
//  Copyright (c) 2014 ddApps. All rights reserved.
//

#import "DDAMainViewController.h"
#import "DDAUIActionSheetViewController.h"

@interface DDAMainViewController () <UIActionSheetDelegate>

@property (nonatomic) DDAUIActionSheetViewController *customActionSheet;

@end

@implementation DDAMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.customActionSheet = [[DDAUIActionSheetViewController alloc] init];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]
                                              initWithBarButtonSystemItem:UIBarButtonSystemItemAction
                                              target:self
                                              action:@selector(showNonCustomView)];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]
                                               initWithBarButtonSystemItem:UIBarButtonSystemItemAction
                                               target:self
                                               action:@selector(showCustomView)];
}


#pragma mark - show an Apple UIActionSheet

- (void)showNonCustomView {
    UIActionSheet *popup = [[UIActionSheet alloc] initWithTitle:@"UIActionSheet"
                                                       delegate:self cancelButtonTitle:@"Cancel"
                                         destructiveButtonTitle:nil
                                              otherButtonTitles:@"Button to do an action", nil];
    popup.tag = 1;
    [popup showInView:[UIApplication sharedApplication].keyWindow];
}

- (void)actionSheet:(UIActionSheet *)popup clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    switch (popup.tag) {
        case 1: {
            switch (buttonIndex) {
                case 0:
                    NSLog(@"Button to do an action");
                    break;
            }
        }
    }
}


#pragma mark - show the custom ActionSheet

- (void)showCustomView {
    [self.navigationController.view addSubview:self.customActionSheet.view];
    [self.customActionSheet viewWillAppear:NO];
}

@end
