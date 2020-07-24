Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FE8A22C889
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jul 2020 16:56:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726890AbgGXO4B (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Jul 2020 10:56:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726535AbgGXO4A (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Jul 2020 10:56:00 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 296F0C0619E6
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2020 07:56:00 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id c80so8220424wme.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2020 07:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Tn0xV71BdxHqqdeiVwu0NskWrwlLub68mratHXXmGoY=;
        b=y0Ar8Nd1SOUY6XTfiucrpoakRsTb13Zv0fp3nEkhFP4wndNFt7tnbYAbrduY5ah9Qp
         RzWL69KmddC+HH6Cj42f29VzqWgkSloKkeOunoXW8tovZhyUpP5WDCMxIzrPgNNKnvz5
         NXaA1Wl+fW9Jdgtp82ZwiSUTDdxEwRj3ecq47VlyjP/ODjNisHFIqtpPAJFLCfuV2E5l
         65/0qPV9DL064uOLdPr4Z+Vz1nqu3RAG+VD+wCPC4yKM/ICuZN8+0Se9U0B/RKFxGKJz
         +jnFxa+Yxr+9Uea+3UYcElGCb053VRZXJENyZMWmRQ68IG9ZQVW9JnYq/7sD7wpU2xfO
         Xv9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Tn0xV71BdxHqqdeiVwu0NskWrwlLub68mratHXXmGoY=;
        b=QbKURroZwBYKTxvdqniboWZKBiLxb3UZM2yMHmK/CWP0QqwXGTG6sJ2tfvUAyJD2p0
         MjGxSodWKVDjPsaNPiQr1iXIeOAiu5kM79PJ9nXZGiNb0piHaBPlPepkYBrsq9/mBbJ5
         GfXDkCn7kAv39UzzVfxHXYebi8DRrbQjHIt4okkyZwRQfDpqeEZaK74V/e9xQJ/wFq3w
         KDvfyqV1sgXTcRDO5w9XhjSw2HIob2IdS7PWOHAMzkGO76zQTKMd4JTU03GPYJ+3TtVk
         CMDRYaQeT0eDtQH+GRkj2ixuVPE9K9T3/eki/HVUIsd5Il1sVpqwZhCn/CNlx60/gaVh
         Dp7g==
X-Gm-Message-State: AOAM532rPFT6wHPEdP8gjMUcwMV1OJKAUsXWNyjGkKcMNKcaP2vzF5oC
        1I+Nc3vNmrY6ZhcKdfi9QB/0NQ==
X-Google-Smtp-Source: ABdhPJy2vBTyHXgc0SdIUGd9i2IIAA4tJrpQpHruxxap4iQehB3h4JswktfeLnkt9mZEjdWf7ZZE6A==
X-Received: by 2002:a1c:9994:: with SMTP id b142mr8748915wme.141.1595602558827;
        Fri, 24 Jul 2020 07:55:58 -0700 (PDT)
Received: from [192.168.1.4] ([195.24.90.54])
        by smtp.googlemail.com with ESMTPSA id n5sm7512960wmi.34.2020.07.24.07.55.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2020 07:55:58 -0700 (PDT)
Subject: Re: [PATCH v4 2/5] media: venus: core: Fix error handling in probe
To:     Rajendra Nayak <rnayak@codeaurora.org>, robh+dt@kernel.org,
        agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mka@chromium.org
References: <1595503612-2901-1-git-send-email-rnayak@codeaurora.org>
 <1595503612-2901-3-git-send-email-rnayak@codeaurora.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <08c2fec5-47a7-9a31-12a6-bae56d18b37c@linaro.org>
Date:   Fri, 24 Jul 2020 17:55:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1595503612-2901-3-git-send-email-rnayak@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 7/23/20 2:26 PM, Rajendra Nayak wrote:
> Post a successful pm_ops->core_get, an error in probe
> should exit by doing a pm_ops->core_put which seems
> to be missing. So fix it.
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---
>  drivers/media/platform/qcom/venus/core.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)

Acked-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>

> 
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index 203c653..bfcaba3 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -224,13 +224,15 @@ static int venus_probe(struct platform_device *pdev)
>  
>  	ret = dma_set_mask_and_coherent(dev, core->res->dma_mask);
>  	if (ret)
> -		return ret;
> +		goto err_core_put;
>  
>  	if (!dev->dma_parms) {
>  		dev->dma_parms = devm_kzalloc(dev, sizeof(*dev->dma_parms),
>  					      GFP_KERNEL);
> -		if (!dev->dma_parms)
> -			return -ENOMEM;
> +		if (!dev->dma_parms) {
> +			ret = -ENOMEM;
> +			goto err_core_put;
> +		}
>  	}
>  	dma_set_max_seg_size(dev, DMA_BIT_MASK(32));
>  
> @@ -242,11 +244,11 @@ static int venus_probe(struct platform_device *pdev)
>  					IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
>  					"venus", core);
>  	if (ret)
> -		return ret;
> +		goto err_core_put;
>  
>  	ret = hfi_create(core, &venus_core_ops);
>  	if (ret)
> -		return ret;
> +		goto err_core_put;
>  
>  	pm_runtime_enable(dev);
>  
> @@ -302,6 +304,9 @@ static int venus_probe(struct platform_device *pdev)
>  	pm_runtime_set_suspended(dev);
>  	pm_runtime_disable(dev);
>  	hfi_destroy(core);
> +err_core_put:
> +	if (core->pm_ops->core_put)
> +		core->pm_ops->core_put(dev);
>  	return ret;
>  }
>  
> 

-- 
regards,
Stan
