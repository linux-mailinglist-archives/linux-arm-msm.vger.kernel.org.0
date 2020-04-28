Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DAFC1BD028
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2020 00:49:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726345AbgD1Wtd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Apr 2020 18:49:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726042AbgD1Wtc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Apr 2020 18:49:32 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B89C4C03C1AD
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2020 15:49:32 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id n24so55503plp.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2020 15:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=eJnAlqksatEHIST9lZG2+gAOgyHcm2ZZEAuU4doQ9ac=;
        b=J7O+4qOIfeyYpfaKAdtp9OUVue2BhqJFJmQEH1X+REMbqOMLIVyZ+0jvDnAmTLyoHn
         e4TmmJOi3PuorckIKaU+Z/6V1OFUTtehYGpvvPYZfRXEKDleMD+Zus8cQfp1Gv2RHpqL
         s4BnHn9B3oF60yqXkLwV9RgZQy2c4QJtsXR1M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eJnAlqksatEHIST9lZG2+gAOgyHcm2ZZEAuU4doQ9ac=;
        b=ONO+Xd84eBNRMPOZkFg+sh63PaNvLZGJUYDhIEEmDfOkDjDCh4vw3uIUmBK0izRif0
         kkeHtyH+sGWcfEbsIdJqhrLtmGPrX32GgtO8Ye9vCdvNKz8U9YPzUjgkvlyOPWidgu60
         cSwM3BTLTZf2EnsOHEAjIYKjBIilLrUrPmEqebkq/IhOLkp8oIfHLWEVZ9ydWYdeYxv0
         M2VuePjHdzEJZhRCKD2hrIi63dDIooupnJuyBhbRcoawOFr8GZQmeI/st8yqEHX28mVH
         ehO9t7SdhLJjfOowI1Et90SE28c2UKP17W3NmBxE+la6BmxxNnxCNHPsBmhF866vmHSd
         3MUA==
X-Gm-Message-State: AGi0PuZzkerx7vqbD6LQujNdk6baAsf/cwPG8JevV3gF3iaf+ddXbR5T
        SH6JET+r4PMfXQ9fAqNEoDHhaw==
X-Google-Smtp-Source: APiQypIQ5jCs/L6Z9oSlBgqQyVA0pVA5OF/ygSl4g2VWHZq3oQc1umzyJXLzgRrlSkDPDoPXhgGN6A==
X-Received: by 2002:a17:90a:24ea:: with SMTP id i97mr7864651pje.189.1588114171970;
        Tue, 28 Apr 2020 15:49:31 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id h8sm2505525pfo.143.2020.04.28.15.49.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2020 15:49:30 -0700 (PDT)
Date:   Tue, 28 Apr 2020 15:49:29 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     viresh.kumar@linaro.org, sboyd@kernel.org,
        bjorn.andersson@linaro.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Akash Asthana <akashast@codeaurora.org>,
        linux-serial@vger.kernel.org
Subject: Re: [PATCH v3 01/17] tty: serial: qcom_geni_serial: Use OPP API to
 set clk/perf state
Message-ID: <20200428224929.GI4525@google.com>
References: <1588080785-6812-1-git-send-email-rnayak@codeaurora.org>
 <1588080785-6812-2-git-send-email-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1588080785-6812-2-git-send-email-rnayak@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Apr 28, 2020 at 07:02:49PM +0530, Rajendra Nayak wrote:
> geni serial needs to express a perforamnce state requirement on CX
> powerdomain depending on the frequency of the clock rates.
> Use OPP table from DT to register with OPP framework and use
> dev_pm_opp_set_rate() to set the clk/perf state.
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Akash Asthana <akashast@codeaurora.org>
> Cc: linux-serial@vger.kernel.org
> ---
>  drivers/tty/serial/qcom_geni_serial.c | 34 +++++++++++++++++++++++++++++-----
>  include/linux/qcom-geni-se.h          |  4 ++++
>  2 files changed, 33 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
> index 6119090..c4de3ff 100644
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
> @@ -961,7 +962,7 @@ static void qcom_geni_serial_set_termios(struct uart_port *uport,
>  		goto out_restart_rx;
>  
>  	uport->uartclk = clk_rate;
> -	clk_set_rate(port->se.clk, clk_rate);
> +	dev_pm_opp_set_rate(uport->dev, clk_rate);
>  	ser_clk_cfg = SER_CLK_EN;
>  	ser_clk_cfg |= clk_div << CLK_DIV_SHFT;
>  
> @@ -1198,8 +1199,11 @@ static void qcom_geni_serial_pm(struct uart_port *uport,
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
> @@ -1318,13 +1322,25 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
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
> +		dev_err(&pdev->dev, "Invalid OPP table in Device tree\n");
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
> @@ -1332,7 +1348,7 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
>  	if (ret) {
>  		dev_err(uport->dev, "Failed to get IRQ ret %d\n", ret);
>  		uart_remove_one_port(drv, uport);
> -		return ret;
> +		goto err;
>  	}
>  
>  	/*
> @@ -1349,11 +1365,16 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
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
> @@ -1361,6 +1382,9 @@ static int qcom_geni_serial_remove(struct platform_device *pdev)
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
> index dd46494..cce71f3 100644
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

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
