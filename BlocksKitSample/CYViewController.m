//
//  CYViewController.m
//  BlocksKitSample
//
//  Created by Christine Yen on 5/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CYViewController.h"
#import "UIGestureRecognizer+BlocksKit.h"

@implementation CYViewController
@synthesize targetView;
@synthesize targetViewWithDelay;
@synthesize targetViewStandard;

- (void)handleTap:(UIGestureRecognizer *)gestureRecognizer {
	NSLog(@"tapped, without BlocksKit");
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	UITapGestureRecognizer *tapGestureRecognizer = [UITapGestureRecognizer recognizerWithHandler:^(UIGestureRecognizer *sender, UIGestureRecognizerState state, CGPoint location) {
		NSLog(@"tapped");
	}];
	[self.targetView addGestureRecognizer:tapGestureRecognizer];
	
	UITapGestureRecognizer *tapWithDelayGestureRecognizer = [UITapGestureRecognizer recognizerWithHandler:^(UIGestureRecognizer *sender, UIGestureRecognizerState state, CGPoint location) {
		NSLog(@"tappedWithDelay");
	} delay:0.1];
	[self.targetViewWithDelay addGestureRecognizer:tapWithDelayGestureRecognizer];
	
	UITapGestureRecognizer *tapStandardGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
	[self.targetViewStandard addGestureRecognizer:tapStandardGestureRecognizer];
}

- (void)viewDidUnload
{
	[self setTargetView:nil];
	[self setTargetViewWithDelay:nil];
	[self setTargetViewStandard:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
