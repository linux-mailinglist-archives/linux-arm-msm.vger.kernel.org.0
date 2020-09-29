Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C8FF27C059
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Sep 2020 11:02:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727761AbgI2JCD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Sep 2020 05:02:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725776AbgI2JCC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Sep 2020 05:02:02 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F03DFC0613D0
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2020 02:02:00 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id k10so4452947wru.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2020 02:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=kRWnM0ioVvz9IYrqqipklykFed9uM/70cGkF4NfDI6c=;
        b=ZVlc6lz1lRWD181DSCDkpTiNShg+lHhaTwBVu+ELTyiTBT7MU0ukZYxVCcfWOuJY4Y
         BpvdtzVpzo9Oa8APHUiJWh8Qx4a4MRhch7jFDndojo6lNS35N1q7v5M4cS6xV95QJDcd
         M2tUrPiYXhGxuKHGX80ZOoGOCpzXXSNc+limBg/DXhUzdkDcpdsjEEdgw6MufgRcTBMs
         C6kPMtcP5VqnNVoo2QtYq3yTBjqc6aIFB75HqaBMHznDDjlIB6YuBU/B0pMyXsHnuAVC
         d6AhiFLmhv6YFToktSC1hm9xxZOrQiogAJ2kMy1fVNTcKMbCBZEvplnvizwgXLlxHkLM
         l/1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=kRWnM0ioVvz9IYrqqipklykFed9uM/70cGkF4NfDI6c=;
        b=MQnjElDgBg+PfSWAyGWm6pAs5msZs3SCgZivtJlzqTAtFL7lnqWDWL+dJn6tZv26Qm
         dbdOQHWJkAZM18wozh+5kSLXbDoP/Bvpta46+FcccjDvB0rS1z6LkTtq4wnHzj4Cd3Jk
         Vf7+ZejdT1/O//sflgaYEpOmjgsVY31eXzxiQ0/yvOzRX1loe0o5ciE/vX/ouO6qIgLF
         Bxoyb4AZIWmpxIbRB3YZByA9ya8dfAwHRVfewVzmG/lQ6/9U907MTLseEdTw9oI2Lk01
         2hHih1+QQ6vwigWih0mMUbfOhkaElltKT3Sf750MXi3TXQ1/SH2MgKyNct0zMErOqM0J
         KX7A==
X-Gm-Message-State: AOAM531dpkz383I/3y+CxDWrtETsto6ThvNyTXG8lEOXgFVGloPFoZrK
        PCT8WNCG0n49BxfI/i9RKPf2pQ==
X-Google-Smtp-Source: ABdhPJwZicjZDLbOWmiv+ukHp013tXKjN5yDxyYYzf/JDr3i/5KjO9tElHCliFTkyxx2amCO41MEuA==
X-Received: by 2002:adf:a49d:: with SMTP id g29mr3250832wrb.219.1601370119519;
        Tue, 29 Sep 2020 02:01:59 -0700 (PDT)
Received: from [192.168.86.34] (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.googlemail.com with ESMTPSA id v204sm4754038wmg.20.2020.09.29.02.01.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 29 Sep 2020 02:01:58 -0700 (PDT)
Subject: Re: [PATCH v7 3/6] Asoc:qcom:lpass-cpu:Update dts property read API
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        rohitkr@codeaurora.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     V Sujith Kumar Reddy <vsujithk@codeaurora.org>
References: <1601286811-25962-1-git-send-email-srivasam@codeaurora.org>
 <1601286811-25962-4-git-send-email-srivasam@codeaurora.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <4ee2a9ad-e252-0f80-0f50-6192f9d20876@linaro.org>
Date:   Tue, 29 Sep 2020 10:01:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1601286811-25962-4-git-send-email-srivasam@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 28/09/2020 10:53, Srinivasa Rao Mandadapu wrote:
> From: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
> 
> Update dts property read API call with platform get property
> by name, as it make code more readable and avoid conflicts
> when array of properties to be used.
> 
> Signed-off-by: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
> Signed-off-by: Srinivasa Rao <srivasam@codeaurora.org>

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

> ---
>   sound/soc/qcom/lpass-cpu.c      | 2 +-
>   sound/soc/qcom/lpass-platform.c | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
> index 0718a0f..12950d2 100644
> --- a/sound/soc/qcom/lpass-cpu.c
> +++ b/sound/soc/qcom/lpass-cpu.c
> @@ -575,7 +575,7 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
>   
>   	of_lpass_cpu_parse_dai_data(dev, drvdata);
>   
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "lpass-lpaif");
>   
>   	drvdata->lpaif = devm_ioremap_resource(dev, res);
>   	if (IS_ERR((void const __force *)drvdata->lpaif)) {
> diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
> index 7ac2629..e7cf4e5 100644
> --- a/sound/soc/qcom/lpass-platform.c
> +++ b/sound/soc/qcom/lpass-platform.c
> @@ -621,7 +621,7 @@ int asoc_qcom_lpass_platform_register(struct platform_device *pdev)
>   	struct lpass_variant *v = drvdata->variant;
>   	int ret;
>   
> -	drvdata->lpaif_irq = platform_get_irq(pdev, 0);
> +	drvdata->lpaif_irq = platform_get_irq_byname(pdev, "lpass-irq-lpaif");
>   	if (drvdata->lpaif_irq < 0)
>   		return -ENODEV;
>   
> 
