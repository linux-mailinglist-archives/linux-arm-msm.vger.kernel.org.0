Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D08E2146FC5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2020 18:32:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728803AbgAWRcy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Jan 2020 12:32:54 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:40775 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727453AbgAWRcx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Jan 2020 12:32:53 -0500
Received: by mail-pj1-f68.google.com with SMTP id bg7so1623110pjb.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2020 09:32:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Cn2kDStsAggWDVeBBXF5FEcvF6C1Xy8Sn1IsJbRSZpQ=;
        b=R/b7Clp2J+T/A56VYmhp5pO07BPp9f4ap3hcckjzvXsFPBAnt5kOIkdHpR4Tjhsan+
         IIMulA4tlWvPMdz9A8iFJ+UjsaC3m7/PTQfviOI1rIKbydKZbM9QJJN+WjQMBrYQU35d
         L38ojc0zwdcey5hY1awXwvGNgnskBm0LxNRoE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Cn2kDStsAggWDVeBBXF5FEcvF6C1Xy8Sn1IsJbRSZpQ=;
        b=Of5H8ElE2bLRD2dqsY+ksSC17DAcU2LMiyHJsN3rXEaKYvn+r5GHGqtUZk4CE61xm4
         aCHPqQf2WrHeV/NRHuhnsfhlGUuF7bBFR8FobUQxV6tYvm3qBL6OypxH4hDD+iEea45h
         yok9Q5Ni6yKQ6bI9p+EnbXhko5jyPQIvNYI/6mGZtXEexWz1UECA1vqvAAXCoHVJ8M6/
         pyQam6RaPZ1ZaD04J4YWFXDhEn7UqAit1M18RgEU+mpFa/xud1QsNftwkTDt8gdsYXzk
         KvX+JsiWjDTQEMDqTevjhNUO/MQkBAkIQfI6l/1d9bJ3SYtormuu0VIieCq+gVxhaBh7
         jtvQ==
X-Gm-Message-State: APjAAAUxEHmeMVgVRmwNjajARwa7i/I4+mWxrJLYU49B88e/UT8ADb7t
        V573sEO5fvsNMnfbbCHRNqbycQ==
X-Google-Smtp-Source: APXvYqzQTSHmkg4ULZgug15BPjQThRPOX+QNUcDexASCQIbIXIYZLBu+6TAU8pQlmQZrNjTotZlMlQ==
X-Received: by 2002:a17:90a:eb14:: with SMTP id j20mr5678665pjz.95.1579800773170;
        Thu, 23 Jan 2020 09:32:53 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id x18sm3504185pfr.26.2020.01.23.09.32.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jan 2020 09:32:52 -0800 (PST)
Date:   Thu, 23 Jan 2020 09:32:50 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Roja Rani Yarubandi <rojay@codeaurora.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        akashast@codeaurora.org, msavaliy@qti.qualcomm.com,
        mgautam@codeaurora.org, skakit@codeaurora.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jiri Slaby <jslaby@suse.com>, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2 1/1] tty: serial: qcom_geni_serial: Configure
 UART_IO_MACRO_CTRL register
Message-ID: <20200123173250.GX89495@google.com>
References: <20200123124802.24862-1-rojay@codeaurora.org>
 <20200123124802.24862-2-rojay@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200123124802.24862-2-rojay@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Roja,

On Thu, Jan 23, 2020 at 06:18:02PM +0530, Roja Rani Yarubandi wrote:

> subject: tty: serial: qcom_geni_serial: Configure UART_IO_MACRO_CTRL register

Something like 'Support pin swapping' would be more useful.

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
> +	if (!ret)
> +		writel(val, uport->membase + SE_UART_IO_MACRO_CTRL);
> +

Which pins are/can be inversed only RX/TX or also CTS/RTS? If both pairs can be
inversed individually it would be nice to support that.

As Bjorn commented, it's probably better to have boolean properties and keep the
magic values in the driver.
