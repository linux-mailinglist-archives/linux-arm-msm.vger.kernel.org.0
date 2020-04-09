Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F00DD1A3918
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2020 19:45:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726470AbgDIRpQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Apr 2020 13:45:16 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:44734 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726521AbgDIRpO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Apr 2020 13:45:14 -0400
Received: by mail-pg1-f194.google.com with SMTP id n13so3860020pgp.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2020 10:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=b+KIwr8FsoUEl5I61MG+GNUlmWOmQgoJsz4NKGh8sQE=;
        b=EM/IsWR2Q4BGmlK6wbm+C7xuN2DSW8OQJW1orjgIBlgjy0CCTWo8wTZ6MClTNKQqLp
         tVaDV8+7xResGkEmZtYgBgxI3CFN6b/lj3gI2CoS+tXf453fTunv3/JymQBHTVptNcCR
         TAV/5tE6KonpppwiPpyriF0/79D39SGsi2PG0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=b+KIwr8FsoUEl5I61MG+GNUlmWOmQgoJsz4NKGh8sQE=;
        b=tTS9kb07wkuwJurz7FXWn18AgMWrY79rXePAgj/pjyw7og7Vx7EY6mGtero9eH56xN
         +vHVWhGi/4JmPX19IbQnnJSWF+wxPX4fRVxw/G81TtA6YDLIVSo7dAFCZQ1kMfaBH5zZ
         v4k8muV1f3SCLMdAiWZNTdic0pYz54jrKqcU7Q+FPA3oh9/B8JYuVqv+Mi3UITBPQoj6
         x3LsiTVUA0fboV+yKEqBkMnrO5x/32rLB20VNYgg2iHBWG1dGolf8Tzu7nen43TCh97c
         CIGkcxqNYQ85mqx8HnTDwofco/oMijF70ZsiB2ycGPZ3g59fhrFHAD3+XBUzCGGYPGGR
         AgBw==
X-Gm-Message-State: AGi0Pua1FgTFCa5VgZXldM6b1WnA+nVaeYhavJsey6MJJU4gMHA6p5Fv
        7jE+ExYAEHPjL7HD0l2tyIVXbg==
X-Google-Smtp-Source: APiQypJAsRbKPh0K6LiNYiCgKXswiTofC5ZsRFTIpusxNBV1Bh4vrjByqBMUCjyy8FkeZllE6nnfkw==
X-Received: by 2002:a62:2684:: with SMTP id m126mr650534pfm.153.1586454313469;
        Thu, 09 Apr 2020 10:45:13 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id k12sm6010790pgj.33.2020.04.09.10.45.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2020 10:45:12 -0700 (PDT)
Date:   Thu, 9 Apr 2020 10:45:11 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     viresh.kumar@linaro.org, sboyd@kernel.org,
        bjorn.andersson@linaro.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Akash Asthana <akashast@codeaurora.org>,
        linux-serial@vger.kernel.org
Subject: Re: [PATCH 02/21] tty: serial: qcom_geni_serial: Use OPP API to set
 clk/perf state
Message-ID: <20200409174511.GS199755@google.com>
References: <1586353607-32222-1-git-send-email-rnayak@codeaurora.org>
 <1586353607-32222-3-git-send-email-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1586353607-32222-3-git-send-email-rnayak@codeaurora.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Rajendra,

On Wed, Apr 08, 2020 at 07:16:28PM +0530, Rajendra Nayak wrote:
> geni serial needs to express a perforamnce state requirement on CX
> depending on the frequency of the clock rates. Use OPP table from
> DT to register with OPP framework and use dev_pm_opp_set_rate() to
> set the clk/perf state.
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> Cc: Akash Asthana <akashast@codeaurora.org>
> Cc: linux-serial@vger.kernel.org
> ---
>  drivers/tty/serial/qcom_geni_serial.c | 20 +++++++++++++++-----
>  include/linux/qcom-geni-se.h          |  2 ++
>  2 files changed, 17 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
> index 6119090..754eaf6 100644
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
> @@ -1198,8 +1199,10 @@ static void qcom_geni_serial_pm(struct uart_port *uport,
>  	if (new_state == UART_PM_STATE_ON && old_state == UART_PM_STATE_OFF)
>  		geni_se_resources_on(&port->se);
>  	else if (new_state == UART_PM_STATE_OFF &&
> -			old_state == UART_PM_STATE_ON)
> +			old_state == UART_PM_STATE_ON) {
> +		dev_pm_opp_set_rate(uport->dev, 0);
>  		geni_se_resources_off(&port->se);
> +	}
>  }
>  
>  static const struct uart_ops qcom_geni_console_pops = {
> @@ -1318,13 +1321,16 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
>  	if (of_property_read_bool(pdev->dev.of_node, "cts-rts-swap"))
>  		port->cts_rts_swap = true;
>  
> +	port->se.opp = dev_pm_opp_set_clkname(&pdev->dev, "se");

dev_pm_opp_set_clkname() can fail for multiple reasons, it seems an error
check would be warranted.

Is it actually necessary to save the OPP table in 'struct geni_se'? Both
the serial and the SPI driver save the table, but don't use it later (nor
does the SE driver).
