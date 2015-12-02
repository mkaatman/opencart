<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" id="button-shipping" form="form-order" formaction="<?php echo $shipping; ?>" data-toggle="tooltip" title="<?php echo $button_shipping_print; ?>" class="btn btn-info"><i class="fa fa-truck"></i></button>
        <button type="submit" id="button-invoice" form="form-order" formaction="<?php echo $invoice; ?>" data-toggle="tooltip" title="<?php echo $button_invoice_print; ?>" class="btn btn-info"><i class="fa fa-print"></i></button>
        <a href="<?php echo $add; ?>" data-toggle="tooltip" title="<?php echo $button_add; ?>" class="btn btn-primary"><i class="fa fa-plus"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>

  <div class="container-fluid">
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-info-circle"></i> Product <?php echo "<a href='/admin/index.php?route=catalog/product/edit&token=$token&product_id=".$product['product_id']."'> (#" . $product['product_id']. ') '.$product['name']; ?></a></h3>
      </div>
      <div class="panel-body">
        <table class="table  table-responsive">
            <?php if(count($orders) == 0 && count($ordersBreakdown) == 0) {
            echo "No Orders found!";
            } ?>
            <?php foreach ($ordersBreakdown as $order) { ?>
            <thead>
            <tr>
            <td>Order</td>
            <td>Customer</td>
            </tr>
            </thead>
            <tbody><tr>
            <td style="width:50px;"><a href="<?php echo $order['view']; ?>" data-toggle="tooltip" title="" class="btn btn-info" data-original-title="View"><?php echo $order['order']['order_id']; ?></a></td>
            <td class="text-left"><a href="<?php echo $order['customer']; ?>"><?php echo $order['order']['customer']; ?></a></td>
            </tr>
            <tr><td colspan="2"><table class="table table-bordered  table-striped table-responsive">
            
            
            <thead>
                <tr>
                  <td class="text-left">Qty</td>
                  <td class="text-left">Option</td>
                </tr>
            </thead>
            <tbody>
            <?php if(count($order['breakdown']) != 0 ){ ?>
                <?php foreach ($order['breakdown'] as $option) {?>
                <?php //echo "<pre>"; var_dump($option); echo "</pre>"; ?>
                <tr>
                  <td style="width:50px;" class="text-right"><?php echo $option['quantity']; ?></td>
                  <td class="text-left"><small><?php echo $option['name'] ?> : <?php echo $option['value'] ?></small></td>
                  
                </tr>
                <?php } ?>
            <?php } else { ?>
                <tr>
                  <td style="width:50px;" class="text-right"><?php echo $order['order']['quantity']; ?></td>
                  <td class="text-left"><small>N/A</small></td>
                </tr>
            <?php } ?>
            
            </tbody>
            </table></td></tr></tbody>
            
            <?php } ?>
          
        </table>
      </div>
    </div>
  </div>
</div>
<?php echo $footer; ?>
