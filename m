Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6BD8FD7F88
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2019 21:04:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730271AbfJOTEd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Oct 2019 15:04:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:52728 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729457AbfJOTEd (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Oct 2019 15:04:33 -0400
Received: from localhost (unknown [38.98.37.135])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0CA7D20663;
        Tue, 15 Oct 2019 19:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571166272;
        bh=K7xNQLQA+mhuDrqZwSj0dBgL8l1Jp0kaDwE7auZnmPc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gn8L/qwoi2dHAj+fVbcrSephZh9G6J13mZU+rU2wSfgSsS7jno1foS9UCpC3c1WaH
         XWRklGbSxdSZhXDToUPztdJWsyqXHxJal+hRHFxT5Pk5VqaCOocq1SKdvNuiqRSGrU
         KAwaCrM4R7xOv2ka0iOHXuYFh7MDtfXUSGpMh3tc=
Date:   Tue, 15 Oct 2019 20:59:55 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Akash Asthana <akashast@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        mgautam@codeaurora.org, bjorn.andersson@linaro.org,
        swboyd@chromium.org, msavaliy@codeaurora.org
Subject: Re: [PATCH v3 2/2] tty: serial: qcom_geni_serial: Wakeup over UART RX
Message-ID: <20191015185955.GB1139790@kroah.com>
References: <1571119902-14169-1-git-send-email-akashast@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1571119902-14169-1-git-send-email-akashast@codeaurora.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Oct 15, 2019 at 11:41:42AM +0530, Akash Asthana wrote:
> Add system wakeup capability over UART RX line for wakeup capable UART.
> When system is suspended, RX line act as an interrupt to wakeup system
> for any communication requests from peer.
> 
> Signed-off-by: Akash Asthana <akashast@codeaurora.org>
> ---
> Changes in V3:
>  - Address review comments on v2 patch.

That's horribly vague, please be specific as to what you changed.


> 
>  drivers/tty/serial/qcom_geni_serial.c | 44 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 43 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
> index 12dc007..bc828e49 100644
> --- a/drivers/tty/serial/qcom_geni_serial.c
> +++ b/drivers/tty/serial/qcom_geni_serial.c
> @@ -14,6 +14,7 @@
>  #include <linux/of.h>
>  #include <linux/of_device.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm_wakeirq.h>
>  #include <linux/qcom-geni-se.h>
>  #include <linux/serial.h>
>  #include <linux/serial_core.h>
> @@ -116,6 +117,7 @@ struct qcom_geni_serial_port {
>  	bool brk;
>  
>  	unsigned int tx_remaining;
> +	int wakeup_irq;
>  };
>  
>  static const struct uart_ops qcom_geni_console_pops;
> @@ -755,6 +757,15 @@ static void qcom_geni_serial_handle_tx(struct uart_port *uport, bool done,
>  		uart_write_wakeup(uport);
>  }
>  
> +static irqreturn_t qcom_geni_serial_wakeup_isr(int isr, void *dev)
> +{
> +	struct uart_port *uport = dev;
> +
> +	pm_wakeup_event(uport->dev, 2000);
> +
> +	return IRQ_HANDLED;
> +}
> +
>  static irqreturn_t qcom_geni_serial_isr(int isr, void *dev)
>  {
>  	u32 m_irq_en;
> @@ -1310,6 +1321,29 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> +	if (!console) {
> +		port->wakeup_irq = platform_get_irq_optional(pdev, 1);
> +		if (port->wakeup_irq < 0) {
> +			dev_err(&pdev->dev, "Failed to get wakeup IRQ %d\n",
> +					port->wakeup_irq);

Is this error message needed?

> +		} else {
> +			irq_set_status_flags(port->wakeup_irq, IRQ_NOAUTOEN);
> +			ret = devm_request_irq(uport->dev, port->wakeup_irq,
> +				qcom_geni_serial_wakeup_isr,
> +				IRQF_TRIGGER_FALLING, "uart_wakeup", uport);
> +			if (ret) {
> +				dev_err(uport->dev, "Failed to register wakeup IRQ ret %d\n",
> +						ret);

Same here.

> +				return ret;
> +			}
> +
> +			device_init_wakeup(&pdev->dev, true);
> +			ret = dev_pm_set_wake_irq(&pdev->dev, port->wakeup_irq);
> +			if (unlikely(ret))

ONLY ever use likely/unlikely if you can benchmark the difference.
Otherwise don't use it, as you will get it wrong and cpus and compliers
know how to do this much better than we do.

> +				dev_err(uport->dev, "%s:Failed to set IRQ wake:%d\n",
> +						__func__, ret);

Again, is this needed?  And why the function name if it is, the other
error messages you created didn't have that in it.

Consistancy is key.

thanks,

greg k-h
