Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32FA61F2111
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2020 22:58:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726227AbgFHU6H (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Jun 2020 16:58:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726756AbgFHU6G (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Jun 2020 16:58:06 -0400
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com [IPv6:2607:f8b0:4864:20::741])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E85EFC08C5C3
        for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2020 13:58:04 -0700 (PDT)
Received: by mail-qk1-x741.google.com with SMTP id c12so18716377qkk.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2020 13:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=gAhxsPhFzj8ko5Ff5RM8OuwLL2KNe1g6ry7IsPK4YPM=;
        b=16CZH6v6kmNHVqda0GleO/jK9emlQUk0HrH+pniwLB19gv2DmUZedX1TBvRssaAQi6
         FGLFcjSQVlbS8QQ2KtMP2HBxTZ7HnxctjxHPpdhwsW40BsmSTmMCHVfVeXtdWN4Bi6Ju
         s+mVt/z45r8Mr7kJ6O0XzcviuZmsZireLMRgl7efhjzxbZmm+hf8KRPbS+jgUqo9MVjn
         3Rg3QTG2S6ZhEVm+RMyhY+gsy5ErZOIcQxerJHb/KfJJtY+0M3R//ych0Dy5ctAu0GIc
         87PQeTQSEoRWGK8v6p/MG7KKuVW+ITxTJv7h828VKy28xF/sgTJebb9iesq6h7mzki59
         WG6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gAhxsPhFzj8ko5Ff5RM8OuwLL2KNe1g6ry7IsPK4YPM=;
        b=DKWJAffX4dIUXM5gb8YSq86CBQOJfIZbFQg9V8sdMTf5ZB4FnVRVlbwxIG0fopCSnB
         XrADiJ+5AXbdxGqhzT4FH+I+yx/W53REVPLNQ1F9TLUn3c2k8zmq/gjVL4TuhjWTwdZc
         WJ4sg3DT/+hvmSTJqCoDaEzRm/rDrE0oBz7f0ZhNE31i5eO5psPcMikN8m05UZVHMLbN
         im/bTvRcGDeYCrIwNghL8VuWbCiO3ixDUJ8lp4jJlaywyGu6A4WaFbosgufUiOQkShYr
         dLgFLHQHUyp1QfLSifbatdm33cnVAXk/ERxTrZxxG/7RM+FyKblm1OHzPn28Af1zBKCX
         9qWA==
X-Gm-Message-State: AOAM533ngSCgvmSnl0JCrMk9CTzBpePL/IFxGh6m16OFN1yIcIujeFF0
        L14moSQjrt+74G/Nkn83VvT9b2l0n5o=
X-Google-Smtp-Source: ABdhPJxI8g/kaTI+YUdB4Xk1DMGdnAx4W0tVDym/m03YVgr8CP0pb9duFQuz7lWNGN7rE3IPJPeIXw==
X-Received: by 2002:a37:ac03:: with SMTP id e3mr24122797qkm.350.1591649883869;
        Mon, 08 Jun 2020 13:58:03 -0700 (PDT)
Received: from [192.168.0.189] ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id d193sm7950035qke.124.2020.06.08.13.58.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2020 13:58:03 -0700 (PDT)
Subject: Re: [PATCH 4/5] soundwire: qcom: avoid dependency on CONFIG_SLIMBUS
From:   Jonathan Marek <jonathan@marek.ca>
To:     alsa-devel@alsa-project.org
Cc:     Vinod Koul <vkoul@kernel.org>,
        Sanyog Kale <sanyog.r.kale@intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>
References: <20200608204347.19685-1-jonathan@marek.ca>
 <20200608204347.19685-5-jonathan@marek.ca>
Message-ID: <931e8e36-63b5-2a29-1b0c-ee7f8ffbea64@marek.ca>
Date:   Mon, 8 Jun 2020 16:58:25 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200608204347.19685-5-jonathan@marek.ca>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 6/8/20 4:43 PM, Jonathan Marek wrote:
> The driver may be used without slimbus, so don't depend on slimbus.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>   drivers/soundwire/Kconfig | 1 -
>   drivers/soundwire/qcom.c  | 5 +++++
>   2 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soundwire/Kconfig b/drivers/soundwire/Kconfig
> index fa2b4ab92ed9..d121cf739090 100644
> --- a/drivers/soundwire/Kconfig
> +++ b/drivers/soundwire/Kconfig
> @@ -33,7 +33,6 @@ config SOUNDWIRE_INTEL
>   
>   config SOUNDWIRE_QCOM
>   	tristate "Qualcomm SoundWire Master driver"
> -	depends on SLIMBUS
>   	depends on SND_SOC
>   	help
>   	  SoundWire Qualcomm Master driver.
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index 14334442615f..ac81c64768ea 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -769,13 +769,18 @@ static int qcom_swrm_probe(struct platform_device *pdev)
>   	if (!ctrl)
>   		return -ENOMEM;
>   
> +#ifdef CONFIG_SLIMBUS
>   	if (dev->parent->bus == &slimbus_bus) {
> +#else
> +	if (false) {
> +#endif
>   		ctrl->reg_read = qcom_swrm_ahb_reg_read;
>   		ctrl->reg_write = qcom_swrm_ahb_reg_write;
>   		ctrl->regmap = dev_get_regmap(dev->parent, NULL);
>   		if (!ctrl->regmap)
>   			return -EINVAL;
>   	} else {
> +

Oops, ended up with a stray whitespace here, will fix for v2.

>   		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>   
>   		ctrl->reg_read = qcom_swrm_cpu_reg_read;
> 
