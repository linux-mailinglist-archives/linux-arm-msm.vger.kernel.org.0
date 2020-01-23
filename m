Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 483CE146DD1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2020 17:08:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729008AbgAWQIo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Jan 2020 11:08:44 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:33330 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729138AbgAWQIo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Jan 2020 11:08:44 -0500
Received: by mail-pf1-f196.google.com with SMTP id z16so1756169pfk.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2020 08:08:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=td46G8H/xG3KwKZVoWzOjjmv0BfVbkqqajOdOX1P7gY=;
        b=lM+qRMYpFmvxGN+/4LhnZq4sqRW6FLBBMnhUm0cU5iKquVddBZxPgV/elfaSzzEO77
         vj3MsgXT9yuc/fP9pFOrTf+q0gQHGhRPHkoxFOhYkHqF6sCKpolIG+LqdkLSXFxQCh1c
         uLBvwDYe69yYr5Ab8NL9YcTU4dIQjwq7ctGUR/RKZ8jvjJddtbHpZFaK9eGVsAF+AsXR
         ZUOoCLEmDSHw6KuwivGzgSEpCB0BUXPv8GON4AkN/4lDqw2T8ObUpfi+vM5qE9uACjGh
         i7BKwexFGTKGtAhOgr6n6x6fd81CcOhuUpv+RrLuEz/wUcmxPEbQciYeMCw5jyTgIA5p
         ZFrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=td46G8H/xG3KwKZVoWzOjjmv0BfVbkqqajOdOX1P7gY=;
        b=e34fQ3q8FtoHXLla+DXG650kaZ3x2VBEZP1b7uPRFhAu8/xpwnM4q9EnswBfnePCtN
         bpSjpEJ1ut/yv6f6Aq+RleWoZWpRz0Q64hEqGo8jz3m/ZYbEs4UxJzYPrGqlX5ed8kcJ
         z4QdPc5mh5nFvVPzcI2hlJrr4XaIUpdnSWKIzsWn4nYx4iD1xyn+j4BVhxhGrone8ciS
         Iz7E2JDw4FlfBvoucebi0jreTWlyHnIhjTfNosr9Mt8zCNtLMRxNMFVgJnqQTrhOQ9Mr
         bKxPQRfg1rIpAKclkmQMKqsy7Tqc2xZzexq3X0xfvFmB59D1qX3Mu+Rchn5W0k7lY3Mu
         LlxQ==
X-Gm-Message-State: APjAAAX6+RS0GacWfxTOxStZaWAxy2kFEsZ84O0ESUB30DmA8wk8UgFQ
        qCB/2aK/RKAL2ue9Ly8G8zqCAA==
X-Google-Smtp-Source: APXvYqyWFE/06GhooYKazl6pIep62Iz/i5wyCJpTVPsFAFVDTHngEfFdHOY7P3gqOAl2IQhW45vjSw==
X-Received: by 2002:a63:4006:: with SMTP id n6mr4591570pga.139.1579795722829;
        Thu, 23 Jan 2020 08:08:42 -0800 (PST)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id u12sm3214680pfm.165.2020.01.23.08.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2020 08:08:42 -0800 (PST)
Date:   Thu, 23 Jan 2020 08:08:39 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Roja Rani Yarubandi <rojay@codeaurora.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        akashast@codeaurora.org, msavaliy@qti.qualcomm.com,
        mgautam@codeaurora.org, skakit@codeaurora.org,
        Andy Gross <agross@kernel.org>, Jiri Slaby <jslaby@suse.com>,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] tty: serial: qcom_geni_serial: Configure
 UART_IO_MACRO_CTRL register
Message-ID: <20200123160839.GB3888@tuxbook-pro>
References: <20200123124802.24862-1-rojay@codeaurora.org>
 <20200123124802.24862-2-rojay@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200123124802.24862-2-rojay@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 23 Jan 04:48 PST 2020, Roja Rani Yarubandi wrote:

> Configure UART_IO_MACRO_CTRL register if UART lines are swapped.
> 
> Signed-off-by: Roja Rani Yarubandi <rojay@codeaurora.org>
> ---
>  drivers/tty/serial/qcom_geni_serial.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
> index ff63728a95f4..24b862937c1e 100644
> --- a/drivers/tty/serial/qcom_geni_serial.c
> +++ b/drivers/tty/serial/qcom_geni_serial.c
> @@ -24,6 +24,7 @@
>  
>  /* UART specific GENI registers */
>  #define SE_UART_LOOPBACK_CFG		0x22c
> +#define SE_UART_IO_MACRO_CTRL		0x240
>  #define SE_UART_TX_TRANS_CFG		0x25c
>  #define SE_UART_TX_WORD_LEN		0x268
>  #define SE_UART_TX_STOP_BIT_LEN		0x26c
> @@ -1260,6 +1261,7 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
>  	int irq;
>  	bool console = false;
>  	struct uart_driver *drv;
> +	u32 val;
>  
>  	if (of_device_is_compatible(pdev->dev.of_node, "qcom,geni-debug-uart"))
>  		console = true;
> @@ -1309,6 +1311,10 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
>  		return irq;
>  	uport->irq = irq;
>  
> +	ret = of_property_read_u32(pdev->dev.of_node, "qcom,pin_inverse", &val);

This needs to be documented in the DT binding document. And I assume
it's better suited as a bool property to be read using
of_property_read_bool().

Also avoid '_' in property names and make it a '-'.

Regards,
Bjorn

> +	if (!ret)
> +		writel(val, uport->membase + SE_UART_IO_MACRO_CTRL);
> +
>  	irq_set_status_flags(uport->irq, IRQ_NOAUTOEN);
>  	ret = devm_request_irq(uport->dev, uport->irq, qcom_geni_serial_isr,
>  			IRQF_TRIGGER_HIGH, port->name, uport);
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of the Code Aurora Forum, hosted by The Linux Foundation
> 
