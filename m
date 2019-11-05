Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C9C7F03EB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2019 18:17:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390369AbfKERRL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Nov 2019 12:17:11 -0500
Received: from mail.kernel.org ([198.145.29.99]:48018 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388860AbfKERRL (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Nov 2019 12:17:11 -0500
Received: from localhost (unknown [62.119.166.9])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D6041214D8;
        Tue,  5 Nov 2019 17:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572974230;
        bh=9YzAebsFkiZYSL1sOxXS3D9D0ldP6eryrhISUy5LQ5o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DTjmCIEqoHxzqXcRFGRXBE6nDQe1UJHPKawojEKCpBYIdNSwiE2HIQJ4ODzjAeJE3
         fyf/ZmAijh9L/rV6t3ZHbuLzvwJHODkac0qDJ9IIPV3+aXy5VfOk++nMBy4zxOXv7o
         0wtB7DY7s6tEjrGN0fsjW9jvZ9w3MYBdzv/70eac=
Date:   Tue, 5 Nov 2019 18:17:05 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Akash Asthana <akashast@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        mgautam@codeaurora.org, swboyd@chromium.org
Subject: Re: [PATCH v4 1/2] tty: serial: qcom_geni_serial: IRQ cleanup
Message-ID: <20191105171705.GB2815774@kroah.com>
References: <1572947835-30600-1-git-send-email-akashast@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1572947835-30600-1-git-send-email-akashast@codeaurora.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Nov 05, 2019 at 03:27:15PM +0530, Akash Asthana wrote:
> Move ISR registration from startup to probe function to avoid registering
> it everytime when the port open is called for driver.
> 
> Signed-off-by: Akash Asthana <akashast@codeaurora.org>
> ---
> Changes in v4:
>  - As per Stephen's comment, move ISR registration(later in probe) after
>    registering uart port with serial core.
>  - As per Greg's comment, corrected returning of PTR value from integer type
>    function(probe).
> 
> Changes in v3:
>  - As per Stephen's comment, using devm_kasprintf instead of scnprintf API.
> 
>  drivers/tty/serial/qcom_geni_serial.c | 38 ++++++++++++++++++++++++-----------
>  1 file changed, 26 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
> index 14c6306..634054a 100644
> --- a/drivers/tty/serial/qcom_geni_serial.c
> +++ b/drivers/tty/serial/qcom_geni_serial.c
> @@ -9,6 +9,7 @@
>  #include <linux/console.h>
>  #include <linux/io.h>
>  #include <linux/iopoll.h>
> +#include <linux/irq.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/of_device.h>
> @@ -101,7 +102,7 @@
>  struct qcom_geni_serial_port {
>  	struct uart_port uport;
>  	struct geni_se se;
> -	char name[20];
> +	const char *name;
>  	u32 tx_fifo_depth;
>  	u32 tx_fifo_width;
>  	u32 rx_fifo_depth;
> @@ -830,7 +831,7 @@ static void qcom_geni_serial_shutdown(struct uart_port *uport)
>  	if (uart_console(uport))
>  		console_stop(uport->cons);
>  
> -	free_irq(uport->irq, uport);
> +	disable_irq(uport->irq);
>  	spin_lock_irqsave(&uport->lock, flags);
>  	qcom_geni_serial_stop_tx(uport);
>  	qcom_geni_serial_stop_rx(uport);
> @@ -890,21 +891,14 @@ static int qcom_geni_serial_startup(struct uart_port *uport)
>  	int ret;
>  	struct qcom_geni_serial_port *port = to_dev_port(uport, uport);
>  
> -	scnprintf(port->name, sizeof(port->name),
> -		  "qcom_serial_%s%d",
> -		(uart_console(uport) ? "console" : "uart"), uport->line);
> -
>  	if (!port->setup) {
>  		ret = qcom_geni_serial_port_setup(uport);
>  		if (ret)
>  			return ret;
>  	}
> +	enable_irq(uport->irq);
>  
> -	ret = request_irq(uport->irq, qcom_geni_serial_isr, IRQF_TRIGGER_HIGH,
> -							port->name, uport);
> -	if (ret)
> -		dev_err(uport->dev, "Failed to get IRQ ret %d\n", ret);
> -	return ret;
> +	return 0;
>  }
>  
>  static unsigned long get_clk_cfg(unsigned long clk_freq)
> @@ -1297,6 +1291,12 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
>  	port->rx_fifo_depth = DEF_FIFO_DEPTH_WORDS;
>  	port->tx_fifo_width = DEF_FIFO_WIDTH_BITS;
>  
> +	port->name = devm_kasprintf(uport->dev, GFP_KERNEL,
> +			"qcom_geni_serial_%s%d",
> +			uart_console(uport) ? "console" : "uart", uport->line);
> +	if (!port->name)
> +		return -ENOMEM;
> +
>  	irq = platform_get_irq(pdev, 0);
>  	if (irq < 0)
>  		return irq;
> @@ -1307,7 +1307,21 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
>  	port->handle_rx = console ? handle_rx_console : handle_rx_uart;
>  	if (!console)
>  		device_create_file(uport->dev, &dev_attr_loopback);
> -	return uart_add_one_port(drv, uport);
> +
> +	ret = uart_add_one_port(drv, uport);
> +	if (ret)
> +		return ret;

What is going to remove the sysfs file you just created above (in a racy
way, it's broken and needs to be fixed, but that's a different issue
here...)?


> +
> +	irq_set_status_flags(uport->irq, IRQ_NOAUTOEN);
> +	ret = devm_request_irq(uport->dev, uport->irq, qcom_geni_serial_isr,
> +			IRQF_TRIGGER_HIGH, port->name, uport);
> +	if (ret) {
> +		dev_err(uport->dev, "Failed to get IRQ ret %d\n", ret);
> +		uart_remove_one_port(drv, uport);
> +		return ret;

Does this remove the sysfs file?

thanks,

greg k-h
