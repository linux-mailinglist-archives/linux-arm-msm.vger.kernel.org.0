Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49F2C1FD0B9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2020 17:19:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726883AbgFQPS5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Jun 2020 11:18:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726925AbgFQPSz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Jun 2020 11:18:55 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7686CC061755
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2020 08:18:54 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id r7so2785782wro.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2020 08:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=nOG0UtY2za22TlTsW6IA1FmIm57v4naVYZ9ilTcx5CM=;
        b=fsMfiiibuqG6akdSQnzrD4GC6gUPfpTZDDI52tTMqnj5bM2I1kerXDP14X/ts9aqvE
         TIdcw3a+5spAFtXSrwI3cD72XgQDRLpl716Iv9t0xeYELa8CQiNFElHaCIog6LNHAuUQ
         D9rDbplRVr9J7UdP+DNWn3g11Bqu5DVuan4Ivs25AqII5eaTOzefmkTWzyYzMappin2Z
         LZVqW5/ZiIAiTTjzGqdL9yM2HEFbM14K7gimyIXkVdCR17FPSvXT4PchjuheItKSxWQ7
         XmV25d06zC5vjCZcFB6nCMaMYHeoGnNwR2yr+RJMbxxASTjdA72m6raA6Lk61BDnhT65
         Ul8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=nOG0UtY2za22TlTsW6IA1FmIm57v4naVYZ9ilTcx5CM=;
        b=WxexxMgNqGVLkoqLYvsql6KTE/q1HOZxrnCBKtAGiJZg44ZOAKrrfAyX3KrES2zKM9
         vT0EplUUMOA/dFf0orysVkvxIU0rAm4UcwngOJizhZU5kMCqN3ayuE/ydyDZko8a3dKO
         bDKeQMYyeQPKgteevtup5JAJW3Axk/7vTNhnzAVKCsI1MrPi6q19G1+NOZsXbsEsDxfM
         hun5ucp96JT0Ol0s+OdF2Cuy/zYQYe3b6Qz3rmwKxpkANqXAonpK7gPqGCWFFV4pWdyr
         NVqep6eeYkZmfxHtCkUdUP+ZxVA1EJ9ar8yhO7geJRBFsUGygp2DewE3CTIOJms1gKnC
         /XHw==
X-Gm-Message-State: AOAM5333TLHHg5vHQUUfz1gGybZA8uvmSCN6DfNaxWaLg+9eoYalcl3F
        eg+zUG33f9HqJfaCwSWnAKt8Lw==
X-Google-Smtp-Source: ABdhPJxvnLZaqv9dijqUO1+TxOJ98HoKGLjmUk5Y1yky55Wvx/EeQvVMbgNEeMFa+Nm3e87FZQYlVQ==
X-Received: by 2002:a5d:4f0d:: with SMTP id c13mr9582813wru.357.1592407133117;
        Wed, 17 Jun 2020 08:18:53 -0700 (PDT)
Received: from [192.168.86.34] (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.googlemail.com with ESMTPSA id c143sm7671498wmd.1.2020.06.17.08.18.51
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 17 Jun 2020 08:18:52 -0700 (PDT)
Subject: Re: [PATCH v3 3/4] nvmem: qfprom: Add fuse blowing support
To:     Douglas Anderson <dianders@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>
Cc:     dhavalp@codeaurora.org, mturney@codeaurora.org,
        rnayak@codeaurora.org, Ravi Kumar Bokka <rbokka@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, saiprakash.ranjan@codeaurora.org,
        sparate@codeaurora.org, mkurumel@codeaurora.org,
        linux-kernel@vger.kernel.org
References: <20200617145116.247432-1-dianders@chromium.org>
 <20200617074930.v3.3.I68222d0b5966f652f29dd3a73ab33551a6e3b7e0@changeid>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <ca00ca5c-eb8b-5662-d73a-e222735347eb@linaro.org>
Date:   Wed, 17 Jun 2020 16:18:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200617074930.v3.3.I68222d0b5966f652f29dd3a73ab33551a6e3b7e0@changeid>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Thanks Doug,
Overall the patch is looking good, I have few minor comments below!

On 17/06/2020 15:51, Douglas Anderson wrote:
> From: Ravi Kumar Bokka <rbokka@codeaurora.org>
> 
> This patch adds support for blowing fuses to the qfprom driver if the
> required properties are defined in the device tree.
> 
> Signed-off-by: Ravi Kumar Bokka <rbokka@codeaurora.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> Please double-check that I got the major/minor version logic right
> here.  I don't have documentation for this, but Srinivas mentioned
> that it was at address 0x6000 and I happened to find an "8" and a "7"
> on sc7180 so I assumed that was the major and minor version.
> 
> Changes in v3:
> - Don't provide "reset" value for things; just save/restore.
> - Use the major/minor version read from 0x6000.
> - Reading should still read "corrected", not "raw".
> - Added a sysfs knob to allow you to read "raw" instead of "corrected"
> - Simplified the SoC data structure.
> - No need for quite so many levels of abstraction for clocks/regulator.
> - Don't set regulator voltage.  Rely on device tree to make sure it's right.
> - Properly undo things in the case of failure.
> - Don't just keep enabling the regulator over and over again.
> - Enable / disable the clock each time
> - Polling every 100 us but timing out in 10 us didn't make sense; swap.
> - No reason for 100 us to be SoC specific.
> - No need for reg-names.
> - We shouldn't be creating two separate nvmem devices.
> 
>   drivers/nvmem/qfprom.c | 314 +++++++++++++++++++++++++++++++++++++++--
>   1 file changed, 303 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/nvmem/qfprom.c b/drivers/nvmem/qfprom.c
> index 8a91717600be..486202860f84 100644
> --- a/drivers/nvmem/qfprom.c
> +++ b/drivers/nvmem/qfprom.c
> @@ -3,57 +3,349 @@
>    * Copyright (C) 2015 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>    */
>   
> +#include <linux/clk.h>
>   #include <linux/device.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +#include <linux/kernel.h>
>   #include <linux/module.h>
>   #include <linux/mod_devicetable.h>
> -#include <linux/io.h>
>   #include <linux/nvmem-provider.h>
>   #include <linux/platform_device.h>
> +#include <linux/regulator/consumer.h>
> +
> +/* Blow timer clock frequency in Mhz */
> +#define QFPROM_BLOW_TIMER_OFFSET 0x03c
> +
> +/* Amount of time required to hold charge to blow fuse in micro-seconds */
> +#define QFPROM_FUSE_BLOW_POLL_US	10
> +#define QFPROM_FUSE_BLOW_TIMEOUT_US	100
> +
> +#define QFPROM_BLOW_STATUS_OFFSET	0x048
> +#define QFPROM_BLOW_STATUS_BUSY		0x1
> +#define QFPROM_BLOW_STATUS_READY	0x0
> +
> +#define QFPROM_ACCEL_OFFSET		0x044
> +
> +#define QFPROM_VERSION_OFFSET		0x0
> +#define QFPROM_MAJOR_VERSION_SHIFT	28
> +#define QFPROM_MAJOR_VERSION_MASK	0xf
> +#define QFPROM_MINOR_VERSION_SHIFT	16
> +#define QFPROM_MINOR_VERSION_MASK	0xf

Using GENMASK here makes it much readable!

...

>   
>   static int qfprom_probe(struct platform_device *pdev)
>   {
> +	struct nvmem_config econfig = {
> +		.name = "qfprom",
> +		.stride = 1,
> +		.word_size = 1,
> +		.reg_read = qfprom_reg_read,
> +	};
>   	struct device *dev = &pdev->dev;
>   	struct resource *res;
>   	struct nvmem_device *nvmem;
>   	struct qfprom_priv *priv;
> +	int ret;
>   
>   	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>   	if (!priv)
>   		return -ENOMEM;
>   
> +	/* The corrected section is always provided */
>   	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	priv->base = devm_ioremap_resource(dev, res);
> -	if (IS_ERR(priv->base))
> -		return PTR_ERR(priv->base);
> +	priv->qfpcorrected = devm_ioremap_resource(dev, res);
> +	if (IS_ERR(priv->qfpcorrected))
> +		return PTR_ERR(priv->qfpcorrected);
>   
>   	econfig.size = resource_size(res);
>   	econfig.dev = dev;
>   	econfig.priv = priv;
>   
> +	priv->dev = dev;
> +
> +	/*
> +	 * If more than one region is provided then the OS has the ability
> +	 * to write.
> +	 */
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
> +	if (res) {
> +		u32 version;
> +		int major_version, minor_version;
> +
> +		priv->qfpraw = devm_ioremap_resource(dev, res);
> +		if (IS_ERR(priv->qfpraw))
> +			return PTR_ERR(priv->qfpraw);
> +		res = platform_get_resource(pdev, IORESOURCE_MEM, 2);
> +		priv->qfpconf = devm_ioremap_resource(dev, res);
> +		if (IS_ERR(priv->qfpconf))
> +			return PTR_ERR(priv->qfpconf);
> +		res = platform_get_resource(pdev, IORESOURCE_MEM, 3);
> +		priv->qfpsecurity = devm_ioremap_resource(dev, res);
> +		if (IS_ERR(priv->qfpsecurity))
> +			return PTR_ERR(priv->qfpsecurity);
> +
> +		version = readl(priv->qfpsecurity + QFPROM_VERSION_OFFSET);
> +		major_version = (version >> QFPROM_MAJOR_VERSION_SHIFT) &
> +				QFPROM_MAJOR_VERSION_MASK;
> +		minor_version = (version >> QFPROM_MINOR_VERSION_SHIFT) &
> +				QFPROM_MINOR_VERSION_MASK;
> +
> +		if (major_version == 7 && minor_version == 8)
> +			priv->soc_data = &qfprom_7_8_data;
> +
> +		/* Only enable writing if we have SoC data. */
> +		if (priv->soc_data)
> +			econfig.reg_write = qfprom_reg_write;
> +	}
> +

<----------snip
> +	priv->vcc = devm_regulator_get(&pdev->dev, "vcc");
> +	if (IS_ERR(priv->vcc))
> +		return PTR_ERR(priv->vcc);
> +
> +	priv->secclk = devm_clk_get_optional(dev, "sec");
> +	if (IS_ERR(priv->secclk)) {
> +		ret = PTR_ERR(priv->secclk);
> +		if (ret != -EPROBE_DEFER)
> +			dev_err(dev, "sec error getting : %d\n", ret);
> +		return ret;
> +	}
> +
----------->
should you move both clk and regulator into the previous if (res) {} 
block? As I don't see them marked as optional for write cases.



>   	nvmem = devm_nvmem_register(dev, &econfig);
>   
>   	return PTR_ERR_OR_ZERO(nvmem);
> 
