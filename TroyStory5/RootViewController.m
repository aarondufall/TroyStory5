//
//  RootViewController.m
//  TroyStory5
//
//  Created by Aaron Dufall on 1/04/2014.
//  Copyright (c) 2014 Aaron Dufall. All rights reserved.
//

#import "RootViewController.h"
#import "Trojan.h"


@interface RootViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UIBarButtonItem *prowessTextfield;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *nameTextField;
@property NSArray *trojans;
@end

@implementation RootViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	self.trojans = @[@"bob the trojan", @"cynthia"];
    [self load];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)load
{
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"Trojan"];
    NSArray *trojans = [self.managedObjectContext executeFetchRequest:request error:nil];
    
    if (trojans.count) {
        self.trojans = trojans;
    }
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.trojans.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCellID"];
    cell.textLabel.text = self.trojans[indexPath.row];
    return cell;
}

@end
