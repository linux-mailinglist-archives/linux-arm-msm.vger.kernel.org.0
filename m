Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 363EED7F86
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2019 21:04:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729709AbfJOTEJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Oct 2019 15:04:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:52698 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729457AbfJOTEI (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Oct 2019 15:04:08 -0400
Received: from localhost (unknown [38.98.37.135])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1F0C020663;
        Tue, 15 Oct 2019 19:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571166247;
        bh=uZgAp1ozuyx2WfOSBNpCU+1Pb4y1LkDwehrcM2jObWg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WrpblMneMwYQrznHuUqCh+WSGHmMfbtf/PcLb6PMbKFhymrKpvJGy5AGL0NQKWWq0
         UxNbgxoa7hcMIj9OW4dNZBGseOYnahpyqXjqbAGKalx3x2myR3J7kRUOAdjsL2Agil
         GAbZ/0qrCbMlsOzjRyEl6AwCCgmgwsjjfkwLjVHk=
Date:   Tue, 15 Oct 2019 20:58:06 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Akash Asthana <akashast@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        mgautam@codeaurora.org, bjorn.andersson@linaro.org,
        swboyd@chromium.org, msavaliy@codeaurora.org
Subject: Re: [PATCH v3 1/2] tty: serial: qcom_geni_serial: IRQ cleanup
Message-ID: <20191015185806.GA1139790@kroah.com>
References: <1571119863-14105-1-git-send-email-akashast@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1571119863-14105-1-git-send-email-akashast@codeaurora.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Oct 15, 2019 at 11:41:03AM +0530, Akash Asthana wrote:
> Move ISR registration from startup to probe function to avoid registering
> it everytime when the port open is called for driver.
> 
> Signed-off-by: Akash Asthana <akashast@codeaurora.org>
> ---
> Changes in v3:
>  - Address review comments on v2 patch.
>  - Using devm_kasprintf instead of scnprintf API.
> 
>  drivers/tty/serial/qcom_geni_serial.c | 30 +++++++++++++++++++-----------
>  1 file changed, 19 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
> index 14c6306..12dc007 100644
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
> @@ -1297,11 +1291,25 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
>  	port->rx_fifo_depth = DEF_FIFO_DEPTH_WORDS;
>  	port->tx_fifo_width = DEF_FIFO_WIDTH_BITS;
>  
> +	port->name = devm_kasprintf(uport->dev, GFP_KERNEL,
> +			"qcom_geni_serial_%s%d",
> +			uart_console(uport) ? "console" : "uart", uport->line);
> +	if (!port->name)
> +		return ERR_PTR(-ENOMEM);

Why are you returning a pointer when the return type of this function is
int?  Did the compiler not complain?  Shouldn't this just be -ENOMEM?


> +
>  	irq = platform_get_irq(pdev, 0);
>  	if (irq < 0)
>  		return irq;
>  	uport->irq = irq;
>  
> +	irq_set_status_flags(uport->irq, IRQ_NOAUTOEN);
> +	ret = devm_request_irq(uport->dev, uport->irq, qcom_geni_serial_isr,
> +			IRQF_TRIGGER_HIGH, port->name, uport);
> +	if (ret) {
> +		dev_err(uport->dev, "Failed to get IRQ ret %d\n", ret);

Why print this out?  Doesn't the function print an error if it fails?

> +		return ret;

See, an int return value :)

thanks,

greg k-h
