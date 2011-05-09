//
//  MenuViewController.m
//  SlidingView
//
//  Created by Reefaq on 2/24/11.
//  Copyright 2011 Rêve Interiors . All rights reserved.
//

#import "MenuViewController.h"
#import "DataViewController.h"
#import "SlidingViewAppDelegate.h"
#import "RootViewController.h"
#import "SlideViewController.h"

@implementation MenuViewController
@synthesize tableView = _tableView;


#pragma mark -
#pragma mark View lifecycle

- (id)initWithFrame:(CGRect)frame {
    if (self = [super init]) {
		[self.view setFrame:frame]; 
		
		_tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
		[_tableView setDelegate:self];
		[_tableView setDataSource:self];
		[_tableView setBackgroundColor:[UIColor clearColor]];
		_tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 1)];
				
		[self.view addSubview:_tableView];
		
	}
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}



- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
	if (![self.view viewWithTag:99]) {
		UIView* verticalLineView = [[UIView alloc] initWithFrame:CGRectMake(self.view.frame.size.width, 0, 1, self.view.frame.size.height+10)];
		[verticalLineView setBackgroundColor:[UIColor whiteColor]];
		[verticalLineView setTag:99];
		[self.view addSubview:verticalLineView];
		[self.view bringSubviewToFront:[self.view viewWithTag:99]];		
	}
}


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration{
	[super willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];
	[[[self view] viewWithTag:99] setFrame:CGRectMake([self view].frame.size.width, -5, 1, [self view].frame.size.height+10)];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Override to allow orientations other than the default portrait orientation.
    return YES;
}


#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 10;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
		UIView* bgView = [[[UIView alloc] init] autorelease];
		[bgView setBackgroundColor:[UIColor colorWithWhite:2 alpha:0.2]];
		[cell setSelectedBackgroundView:bgView];
    }
    
    // Configure the cell...
	cell.textLabel.text = [NSString stringWithFormat:@"Menu %d", indexPath.row +1];
	[cell.textLabel setTextColor:[UIColor whiteColor]];


    return cell;
}


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DataViewController *dataViewController = [[DataViewController alloc] initWithFrame:CGRectMake(0, 0, 477, self.view.frame.size.height)];
	[[SlidingViewAppDelegate instance].rootViewController.slideViewController addViewInSlider:dataViewController invokeByController:self isSlideStartView:TRUE];
}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
}


- (void)dealloc {
    [super dealloc];
}


@end

