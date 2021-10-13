Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8662242C9BA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Oct 2021 21:16:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229941AbhJMTS1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Oct 2021 15:18:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237740AbhJMTST (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Oct 2021 15:18:19 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 649ECC06174E
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Oct 2021 12:16:15 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id i24so15748865lfj.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Oct 2021 12:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=u/texRWtJ2KbD0oQrB97AzLXUWEuY++oRPe+Tjc/3gA=;
        b=OiLv79C5RwizCegkjzE//+3Rb0Uzvw8wtC/+DjFOYjoMOwuIWUQF341uXNSbDJwlpl
         n+6o1ogkumsOLxhD1Gj/HwBtAg0Ynvpovk94twIeNuf5ufmJup+Cl5H9mWuvDNl0TPZ1
         uFn4IkQpCSQR5qWrRGmdAZZEMeIQvsbwPiwVzX2OGVSX5Fs1FNenppvyGngvBBnnN7b4
         Vq5nnXfZIk/xbmk/cPFstKNJlTl1QjSYmev9KxOFVxQX7WCXUng1G6p+jPQTgx3KRit/
         /Py5u0uKDyav9WI5DO1kh6S8T+qF/u1D5mSzWsviKdAtav0/0pGNHqbxwamqV/BZB2qQ
         rZOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=u/texRWtJ2KbD0oQrB97AzLXUWEuY++oRPe+Tjc/3gA=;
        b=IbiXa9GqS3vx9EeR2nIiorPOtxUdlsMfjAF0P0vztuxgvNnWgN2eoTOYyvWN494xOe
         VtaZryAOms8oYzgdtd6kLXIX9I0xb8iu5CQ/nu4v/ie4rC3s/aIM33pAn57+83B02doE
         RZ54MRszFnnmk9ENuobRRsxAKKjK252KCOQ87/Hy/EgyfkRPk6gEC/npDYLP0fayD0ev
         U7N0JvvCDCq6NJFKcopQ2Rf4KuT5P0FjrmNyTTa55kXjXWxYTNR/MYWrwNN3NCMaWwCr
         57aWUIUsb5TFBToFtbQwjMAA5/nshDUS1D8RecUZZm66JxpKCz7eG6vlZ034sIepYvkQ
         3isQ==
X-Gm-Message-State: AOAM530ma4SdWJ0N1E1ZK8IHlu1j04YY8rME/3irej+KImNrqaSOWuBP
        5/zs3dZPRtk8+nRXoQRkxkyuYQ==
X-Google-Smtp-Source: ABdhPJzzY0eVMSGVG8XPuoef9sBLmgKFgZrRE0vF81n9m20q0PBBM+njve8V91z6kQGhiJ2hnCpFkw==
X-Received: by 2002:a2e:4e01:: with SMTP id c1mr1271836ljb.460.1634152573513;
        Wed, 13 Oct 2021 12:16:13 -0700 (PDT)
Received: from [192.168.1.102] (62-248-207-242.elisa-laajakaista.fi. [62.248.207.242])
        by smtp.gmail.com with ESMTPSA id v5sm30716lfo.49.2021.10.13.12.16.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Oct 2021 12:16:13 -0700 (PDT)
Subject: Re: [PATCH v4 13/20] dma: qcom: bam_dma: Add support to initialize
 interconnect path
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org
Cc:     bhupesh.linux@gmail.com, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org, agross@kernel.org,
        herbert@gondor.apana.org.au, davem@davemloft.net,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
References: <20211013105541.68045-1-bhupesh.sharma@linaro.org>
 <20211013105541.68045-14-bhupesh.sharma@linaro.org>
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Message-ID: <f7d038b0-4e31-5f81-387b-91fc5328372e@linaro.org>
Date:   Wed, 13 Oct 2021 22:15:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20211013105541.68045-14-bhupesh.sharma@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bhupesh, Thara,

On 10/13/21 1:55 PM, Bhupesh Sharma wrote:
> From: Thara Gopinath <thara.gopinath@linaro.org>
> 
> BAM dma engine associated with certain hardware blocks could require
> relevant interconnect pieces be initialized prior to the dma engine
> initialization. For e.g. crypto bam dma engine on sm8250. Such requirement
> is passed on to the bam dma driver from dt via the "interconnects"
> property.  Add support in bam_dma driver to check whether the interconnect
> path is accessible/enabled prior to attempting driver intializations.
> 
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> [Make header file inclusion alphabetical]
> Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>
> ---
>   drivers/dma/qcom/bam_dma.c | 16 +++++++++++++++-
>   1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
> index c8a77b428b52..fc84ef42507d 100644
> --- a/drivers/dma/qcom/bam_dma.c
> +++ b/drivers/dma/qcom/bam_dma.c
> @@ -26,6 +26,7 @@
>   #include <linux/kernel.h>
>   #include <linux/io.h>
>   #include <linux/init.h>
> +#include <linux/interconnect.h>
>   #include <linux/slab.h>
>   #include <linux/module.h>
>   #include <linux/interrupt.h>
> @@ -392,6 +393,7 @@ struct bam_device {
>   	const struct reg_offset_data *layout;
>   
>   	struct clk *bamclk;
> +	struct icc_path *mem_path;
>   	int irq;
>   
>   	/* dma start transaction tasklet */
> @@ -1284,9 +1286,18 @@ static int bam_dma_probe(struct platform_device *pdev)
>   		return ret;
>   	}
>   
> +	/* Ensure that interconnects are initialized */
> +	bdev->mem_path = of_icc_get(bdev->dev, "memory");

I suppose devm_of_icc_get() usage could leave the error path and
bam_dma_remove() intact.

> +
> +	if (IS_ERR(bdev->mem_path)) {
> +		ret = PTR_ERR(bdev->mem_path);
> +		dev_err(bdev->dev, "failed to acquire icc path %d\n", ret);
> +		goto err_disable_clk;
> +	}
> +
>   	ret = bam_init(bdev);
>   	if (ret)
> -		goto err_disable_clk;
> +		goto err_icc_path_put;
>   
>   	tasklet_setup(&bdev->task, dma_tasklet);
>   
> @@ -1371,6 +1382,8 @@ static int bam_dma_probe(struct platform_device *pdev)
>   		tasklet_kill(&bdev->channels[i].vc.task);
>   err_tasklet_kill:
>   	tasklet_kill(&bdev->task);
> +err_icc_path_put:
> +	icc_put(bdev->mem_path);
>   err_disable_clk:
>   	clk_disable_unprepare(bdev->bamclk);
>   
> @@ -1406,6 +1419,7 @@ static int bam_dma_remove(struct platform_device *pdev)
>   
>   	tasklet_kill(&bdev->task);
>   
> +	icc_put(bdev->mem_path);
>   	clk_disable_unprepare(bdev->bamclk);
>   
>   	return 0;
> 

--
Best wishes,
Vladimir
