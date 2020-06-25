Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 682CE209951
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2020 07:10:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389600AbgFYFKu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Jun 2020 01:10:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726619AbgFYFKu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Jun 2020 01:10:50 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CECCC061573
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2020 22:10:50 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id p11so2475499pff.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2020 22:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=twHYEL28RSB7nrL+ruqMdlBzxEkTRj4lNzrxw+cOEt4=;
        b=uljrt8x4AHWARrLtDndGxwyVlHQmW6fv17x4sT2pqF6AhLUu1z/biSPQdsGaxdi17/
         8kRreIXf+02P/nRxxYJCskrbXWtmavcB/2kpwhsMNMoKXcrw6AmMmEmMZM0MeSfzZSkg
         xBzPENpGigE2BVZNw0edDGuHN6gS6pmpTZgeR4/of5MtqtaCGdESFbltJQYNr57EM+ST
         aqMAbzOQVTJlTjFr9Uol7/DNQsBSFsX9wP/djztnv6SNJUcYObWCqTIxc6cmhdlWi2ey
         jj1WMHrwDe8zNf45UmxwgQFJWQZCHBc9Xzyn4oRlu8M9PGrVrp8VTNbi4N6QPXIHku8p
         KYbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=twHYEL28RSB7nrL+ruqMdlBzxEkTRj4lNzrxw+cOEt4=;
        b=sjwyPeiGo469LAl5EW14mKSCsXnzbHuHLbznql+fQFpciNY+vNTWXLYE2dDmDWmTu/
         3QEoDZZ11r7C7gmsp6Q5+XmN62ivq3+eG2WCoE1FngCwYrOVXl4rDgw1nWz81p14UWb7
         r9jegczbpkZyt9KfKpFTgKeXLTcamaBCS8mxii6YL6zCWXD+zyJ7b6yqpC4OtIAkUKHI
         5rC2igvhp22vGmR/tKwD6km2gh3zgrwOpcIsG+Cn9DCu2nP54P40W3MXJ3607cY8BU4F
         Y82r431MQ0X9/+vLqQYT/UlD8Otc6ExGSBOco0nj6LVFsnIlrjn0lEmOdn7CXELJv+hY
         9s3w==
X-Gm-Message-State: AOAM533rDzJCNrvgBWgHL83VqiSTq97a5KxYk6mflccZ4ooXDctF9ok1
        vYqmC9gQjmUfIcIfuc4LOsQc7Q==
X-Google-Smtp-Source: ABdhPJxmyHbvxgYqduXojNhoOf8yIMJ+DD4lRyU/ljozL6pxnhVYfKfG6yiIu5iv5xUuEv2PVaT+wg==
X-Received: by 2002:a62:8096:: with SMTP id j144mr10052296pfd.78.1593061849345;
        Wed, 24 Jun 2020 22:10:49 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id y12sm4103863pfo.182.2020.06.24.22.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2020 22:10:48 -0700 (PDT)
Date:   Wed, 24 Jun 2020 22:08:08 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     agross@kernel.org, robdclark@gmail.com, robdclark@chromium.org,
        stanimir.varbanov@linaro.org, viresh.kumar@linaro.org,
        sboyd@kernel.org, mka@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Akash Asthana <akashast@codeaurora.org>,
        linux-serial@vger.kernel.org
Subject: Re: [PATCH v6 1/6] tty: serial: qcom_geni_serial: Use OPP API to set
 clk/perf state
Message-ID: <20200625050808.GW128451@builder.lan>
References: <1592222564-13556-1-git-send-email-rnayak@codeaurora.org>
 <1592222564-13556-2-git-send-email-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1592222564-13556-2-git-send-email-rnayak@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 15 Jun 05:02 PDT 2020, Rajendra Nayak wrote:

> geni serial needs to express a perforamnce state requirement on CX
> powerdomain depending on the frequency of the clock rates.
> Use OPP table from DT to register with OPP framework and use
> dev_pm_opp_set_rate() to set the clk/perf state.
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Akash Asthana <akashast@codeaurora.org>
> Cc: linux-serial@vger.kernel.org

Picked up patch 1 and 2 through the qcom tree.

As Mark requested, please don't lump together patches that doesn't
actually depend on each other in the same series - it's quite confusing
to know what to pick and not.

Regards,
Bjorn

> ---
> This patch needs to land via the msm tree. Greg had this already pulled in,
> but later dropped it on my request.
> No change in v6, just resposting it here so Bjorn/Andy can pull it in.
> 
>  drivers/tty/serial/qcom_geni_serial.c | 34 +++++++++++++++++++++++++++++-----
>  include/linux/qcom-geni-se.h          |  4 ++++
>  2 files changed, 33 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
> index 457c0bf..a90f8ec 100644
> --- a/drivers/tty/serial/qcom_geni_serial.c
> +++ b/drivers/tty/serial/qcom_geni_serial.c
> @@ -9,6 +9,7 @@
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/of_device.h>
> +#include <linux/pm_opp.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/pm_wakeirq.h>
> @@ -962,7 +963,7 @@ static void qcom_geni_serial_set_termios(struct uart_port *uport,
>  		goto out_restart_rx;
>  
>  	uport->uartclk = clk_rate;
> -	clk_set_rate(port->se.clk, clk_rate);
> +	dev_pm_opp_set_rate(uport->dev, clk_rate);
>  	ser_clk_cfg = SER_CLK_EN;
>  	ser_clk_cfg |= clk_div << CLK_DIV_SHFT;
>  
> @@ -1231,8 +1232,11 @@ static void qcom_geni_serial_pm(struct uart_port *uport,
>  	if (new_state == UART_PM_STATE_ON && old_state == UART_PM_STATE_OFF)
>  		geni_se_resources_on(&port->se);
>  	else if (new_state == UART_PM_STATE_OFF &&
> -			old_state == UART_PM_STATE_ON)
> +			old_state == UART_PM_STATE_ON) {
> +		/* Drop the performance state vote */
> +		dev_pm_opp_set_rate(uport->dev, 0);
>  		geni_se_resources_off(&port->se);
> +	}
>  }
>  
>  static const struct uart_ops qcom_geni_console_pops = {
> @@ -1351,13 +1355,25 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
>  	if (of_property_read_bool(pdev->dev.of_node, "cts-rts-swap"))
>  		port->cts_rts_swap = true;
>  
> +	port->se.opp_table = dev_pm_opp_set_clkname(&pdev->dev, "se");
> +	if (IS_ERR(port->se.opp_table))
> +		return PTR_ERR(port->se.opp_table);
> +	/* OPP table is optional */
> +	ret = dev_pm_opp_of_add_table(&pdev->dev);
> +	if (!ret) {
> +		port->se.has_opp_table = true;
> +	} else if (ret != -ENODEV) {
> +		dev_err(&pdev->dev, "invalid OPP table in device tree\n");
> +		return ret;
> +	}
> +
>  	uport->private_data = drv;
>  	platform_set_drvdata(pdev, port);
>  	port->handle_rx = console ? handle_rx_console : handle_rx_uart;
>  
>  	ret = uart_add_one_port(drv, uport);
>  	if (ret)
> -		return ret;
> +		goto err;
>  
>  	irq_set_status_flags(uport->irq, IRQ_NOAUTOEN);
>  	ret = devm_request_irq(uport->dev, uport->irq, qcom_geni_serial_isr,
> @@ -1365,7 +1381,7 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
>  	if (ret) {
>  		dev_err(uport->dev, "Failed to get IRQ ret %d\n", ret);
>  		uart_remove_one_port(drv, uport);
> -		return ret;
> +		goto err;
>  	}
>  
>  	/*
> @@ -1382,11 +1398,16 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
>  		if (ret) {
>  			device_init_wakeup(&pdev->dev, false);
>  			uart_remove_one_port(drv, uport);
> -			return ret;
> +			goto err;
>  		}
>  	}
>  
>  	return 0;
> +err:
> +	if (port->se.has_opp_table)
> +		dev_pm_opp_of_remove_table(&pdev->dev);
> +	dev_pm_opp_put_clkname(port->se.opp_table);
> +	return ret;
>  }
>  
>  static int qcom_geni_serial_remove(struct platform_device *pdev)
> @@ -1394,6 +1415,9 @@ static int qcom_geni_serial_remove(struct platform_device *pdev)
>  	struct qcom_geni_serial_port *port = platform_get_drvdata(pdev);
>  	struct uart_driver *drv = port->uport.private_data;
>  
> +	if (port->se.has_opp_table)
> +		dev_pm_opp_of_remove_table(&pdev->dev);
> +	dev_pm_opp_put_clkname(port->se.opp_table);
>  	dev_pm_clear_wake_irq(&pdev->dev);
>  	device_init_wakeup(&pdev->dev, false);
>  	uart_remove_one_port(drv, &port->uport);
> diff --git a/include/linux/qcom-geni-se.h b/include/linux/qcom-geni-se.h
> index dd46494..6b78094 100644
> --- a/include/linux/qcom-geni-se.h
> +++ b/include/linux/qcom-geni-se.h
> @@ -33,6 +33,8 @@ struct clk;
>   * @clk:		Handle to the core serial engine clock
>   * @num_clk_levels:	Number of valid clock levels in clk_perf_tbl
>   * @clk_perf_tbl:	Table of clock frequency input to serial engine clock
> + * @opp_table:		Pointer to the OPP table
> + * @has_opp_table:	Specifies if the SE has an OPP table
>   */
>  struct geni_se {
>  	void __iomem *base;
> @@ -41,6 +43,8 @@ struct geni_se {
>  	struct clk *clk;
>  	unsigned int num_clk_levels;
>  	unsigned long *clk_perf_tbl;
> +	struct opp_table *opp_table;
> +	bool has_opp_table;
>  };
>  
>  /* Common SE registers */
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
> 
