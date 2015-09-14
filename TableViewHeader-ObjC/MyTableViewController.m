//
//  MyTableViewController.m
//  TableViewHeader-ObjC
//
//  Created by Duc DoBa on 9/15/15.
//  Copyright © 2015 Ducky Duke. All rights reserved.
//

#import "MyTableViewController.h"

@interface MyTableViewController()
@property (nonatomic, strong) NSMutableArray *rows;
@end

@implementation MyTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.rows = [NSMutableArray array];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.rows.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    cell.textLabel.text = self.rows[indexPath.row];
    return cell;
}

- (IBAction)newButtonTouched:(id)sender {
    [self.rows addObject:[NSString stringWithFormat:@"Row %ld", (long)(self.rows.count + 1)]];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:(self.rows.count - 1) inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationTop];
}

@end
