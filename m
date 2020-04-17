Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B76ED1AE42E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2020 20:00:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730033AbgDQSAp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Apr 2020 14:00:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730308AbgDQSAp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Apr 2020 14:00:45 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59912C061A0F
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2020 11:00:45 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id d1so1426762pfh.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2020 11:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=UOMj1CMTwdnMbS+z4qVkFuhDs1cGdfp1YT34y+yBusk=;
        b=OvckqUd4ZmienArBUa8jPpxgm7tQccflIrBwirJ78gUp7uqVrx3mfTAwv0UxSmRrya
         Lz37ElSMIolopvUjumNLuYbbvVA4PsZnQqyMCyd+rnrVNMnGSZf6nmpiwan6L7M+FLkl
         4wJt5ZteoqCNiPJ+z8t2Nl9Y0ShW0V/x9H4ZI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=UOMj1CMTwdnMbS+z4qVkFuhDs1cGdfp1YT34y+yBusk=;
        b=P4OX9zI6dPjvvBS2wyxoCuoGt715R+xctGCIQJNJVVaBKZ6SqCU9CEm2Gx9t6pumqf
         1xA1TedxlYoHY1E5PQpFR4pMf8W7FtZn0m2kEq4NcPMWI2yn7Uw+GKB3s9L1SbbGErYC
         xBR2iz+hhsViuZwgXdm9O0wYL7yc++ebsU2qClzCt0ofoOzWIB4Qtb94rf6+HLn8W7TC
         FhCDcgVPsjyjU1D1Xgdl5l7cKhe0hKMRjy00SaRib0NKKZnL4zujEO7ysJCoqLB25rgp
         5h2VbJQ4u/395d7jWrzxM6cCKJyWcRlrwUfbJmW+PdgOqGQ89g6Tm+NN9oazMBlpTU0/
         x5zA==
X-Gm-Message-State: AGi0PuYXLjNhQbMycgWejDNr6+CMPRqE9MZObmLz6EbwbARtuuZkPX/G
        24tCKjb7g0aAn2Mpp1bJh7+piA==
X-Google-Smtp-Source: APiQypK9eg7Gq7tr1Oc+DzJ0VwRSWi/rb9t3MDel9BaZ7Cw8P2/BSa0rmeULMt3F00M6mVyVdqN1Dw==
X-Received: by 2002:a62:1a54:: with SMTP id a81mr4490224pfa.122.1587146443888;
        Fri, 17 Apr 2020 11:00:43 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id w13sm5101109pfn.192.2020.04.17.11.00.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2020 11:00:42 -0700 (PDT)
Date:   Fri, 17 Apr 2020 11:00:41 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     viresh.kumar@linaro.org, sboyd@kernel.org,
        bjorn.andersson@linaro.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Akash Asthana <akashast@codeaurora.org>,
        linux-serial@vger.kernel.org
Subject: Re: [PATCH v2 01/17] tty: serial: qcom_geni_serial: Use OPP API to
 set clk/perf state
Message-ID: <20200417180041.GD199755@google.com>
References: <1587132279-27659-1-git-send-email-rnayak@codeaurora.org>
 <1587132279-27659-2-git-send-email-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1587132279-27659-2-git-send-email-rnayak@codeaurora.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Rajendra,

On Fri, Apr 17, 2020 at 07:34:23PM +0530, Rajendra Nayak wrote:
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
>  drivers/tty/serial/qcom_geni_serial.c | 30 +++++++++++++++++++++++++-----
>  include/linux/qcom-geni-se.h          |  2 ++
>  2 files changed, 27 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
> index 6119090..151012c 100644
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
> @@ -128,6 +129,7 @@ struct qcom_geni_serial_port {
>  	int wakeup_irq;
>  	bool rx_tx_swap;
>  	bool cts_rts_swap;
> +	bool opp_table;

The name of the variable suggests that it holds a OPP table, something
like 'has_opp_table' would be clearer.

>  };
>  
>  static const struct uart_ops qcom_geni_console_pops;
> @@ -961,7 +963,7 @@ static void qcom_geni_serial_set_termios(struct uart_port *uport,
>  		goto out_restart_rx;
>  
>  	uport->uartclk = clk_rate;
> -	clk_set_rate(port->se.clk, clk_rate);
> +	dev_pm_opp_set_rate(uport->dev, clk_rate);
>  	ser_clk_cfg = SER_CLK_EN;
>  	ser_clk_cfg |= clk_div << CLK_DIV_SHFT;
>  
> @@ -1198,8 +1200,11 @@ static void qcom_geni_serial_pm(struct uart_port *uport,
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
> @@ -1318,13 +1323,20 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
>  	if (of_property_read_bool(pdev->dev.of_node, "cts-rts-swap"))
>  		port->cts_rts_swap = true;
>  
> +	port->se.opp = dev_pm_opp_set_clkname(&pdev->dev, "se");
> +	if (IS_ERR(port->se.opp))
> +		return PTR_ERR(port->se.opp);
> +	/* OPP table is optional */
> +	if (!dev_pm_opp_of_add_table(&pdev->dev))

Even if the OPP table is optional you probably want to fail if the error
is anything other than -ENODEV ("'operating-points' property is not found
or is invalid data in device node.").

> diff --git a/include/linux/qcom-geni-se.h b/include/linux/qcom-geni-se.h
> index dd46494..737e713 100644
> --- a/include/linux/qcom-geni-se.h
> +++ b/include/linux/qcom-geni-se.h
> @@ -24,6 +24,7 @@ enum geni_se_protocol_type {
>  
>  struct geni_wrapper;
>  struct clk;
> +struct opp_table;
>  
>  /**
>   * struct geni_se - GENI Serial Engine
> @@ -39,6 +40,7 @@ struct geni_se {
>  	struct device *dev;
>  	struct geni_wrapper *wrapper;
>  	struct clk *clk;
> +	struct opp_table *opp;

This name suggests that the variable holds a single OPP ('struct
dev_pm_opp'). Most other code uses the name 'opp_table', which
also seems a good candidate here.
