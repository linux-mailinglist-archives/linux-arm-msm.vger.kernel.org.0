Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9ABD12734C5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Sep 2020 23:20:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728276AbgIUVU0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Sep 2020 17:20:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727171AbgIUVU0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Sep 2020 17:20:26 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C523AC0613D0
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2020 14:20:25 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id a17so14406253wrn.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2020 14:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=kIlLYItMEH57/OIqphwHXbMgNacdFFxpGWnfPMYalYM=;
        b=xCdO1gRcr6I9/MbCD0uw5F/eP5g5juh4KmwgJ74QrZi7bp9XafkV52CkCDZyuPvywJ
         klFDm00snWt05m5t0d6GVartPTQnXWWgSeVqT0GLO42aNW4NaSU2qlr4iAIO8nAcwav9
         Kd6FnvQtYG/wDbGoxOEL/k7OvVlLsAtPNpMyXxgLufJmto4gi9VtkwXbCVCd8mZ+iOBW
         y+iDOd8TImm7iFI9b9o2WEkK+x81XTI8f9sa3lpdPV/0oAyLeGhy2JAYNKG4j5YwJ6PJ
         CVho83FUl9DcMa0mWLy5Adn9Dkzorkkyh9P65qDGGkEAb4F5AT5yL74NYtt6LT5v5UGB
         9ajA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=kIlLYItMEH57/OIqphwHXbMgNacdFFxpGWnfPMYalYM=;
        b=WoNhW4pt/LoaHu+Jh3TiXzxVL/QPTBudohguKzfu6JI540G1I4XtlyMDICczGszW/G
         /iYVG6U2gIjDLAxjlzHRpMzAIHMBD5vEsM1X8sr/4P1AjhjuoPnHPJcDCLCtOxjSMfCw
         +fuuj9r6xUvnEWInM6h3QAOFj46aHGj+SWshxHiLOjRfhn6Zbjba2A09aOsb19rZHKai
         nbEljXyJrswMfX6dNs5kLbFqkcPu8ktJcH+eP6Hp7WsyEeVvk/qcxZwPZNO/2aSzb84i
         GBloo36BTqydiZLSMt3GBWuluaFBXqhk/QILqDpxoXibnR040VMHL9Zl8Cp0OOOMpV6D
         sbiA==
X-Gm-Message-State: AOAM532/QhyfIf5Pz8p6Xr/FKMbNyUNB7DplmOHDoody8D+jB86UeHni
        eDRzY8bxXxr07S0MDGCK2bF0JA==
X-Google-Smtp-Source: ABdhPJyF0BsM1hu0mJu+3NmgGTwLh8BB1+qR4UB77Xt7FosUKuVI2AExucUuS/VzfoNIEgGOPKDDPw==
X-Received: by 2002:a5d:4d48:: with SMTP id a8mr1722763wru.318.1600723224330;
        Mon, 21 Sep 2020 14:20:24 -0700 (PDT)
Received: from [192.168.86.34] (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.googlemail.com with ESMTPSA id i83sm1202081wma.22.2020.09.21.14.20.22
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 Sep 2020 14:20:23 -0700 (PDT)
Subject: Re: [PATCH v6 3/5] Asoc:qcom:lpass-cpu:Update dts property read API
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        rohitkr@codeaurora.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     V Sujith Kumar Reddy <vsujithk@codeaurora.org>
References: <1600409084-29093-1-git-send-email-srivasam@codeaurora.org>
 <1600409084-29093-4-git-send-email-srivasam@codeaurora.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <040290a8-26a3-ab9c-04dc-beb23ee827e8@linaro.org>
Date:   Mon, 21 Sep 2020 22:20:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1600409084-29093-4-git-send-email-srivasam@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 18/09/2020 07:04, Srinivasa Rao Mandadapu wrote:
> From: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
> 
> Signed-off-by: Srinivasa Rao <srivasam@codeaurora.org>
> Signed-off-by: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
> ---
>   sound/soc/qcom/lpass-cpu.c      | 2 +-
>   sound/soc/qcom/lpass-platform.c | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
> index 1ee6d8b..5d84f63 100644
> --- a/sound/soc/qcom/lpass-cpu.c
> +++ b/sound/soc/qcom/lpass-cpu.c
> @@ -575,7 +575,7 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
>   
>   	of_lpass_cpu_parse_dai_data(dev, drvdata);
>   
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "lpass-lpaif");

Interesting!! this patch 
https://lore.kernel.org/alsa-devel/1597402388-14112-11-git-send-email-rohitkr@codeaurora.org/ 
just took it out and you add it back in!

Index is always preferred over name w.r.t device tree bindings, so lets 
stick with that for now!
Unless you have any strong reason to lookup resource by name?

--srini


>   
>   	drvdata->lpaif = devm_ioremap_resource(dev, res);
>   	if (IS_ERR((void const __force *)drvdata->lpaif)) {
> diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
> index df692ed..35aead1 100644
> --- a/sound/soc/qcom/lpass-platform.c
> +++ b/sound/soc/qcom/lpass-platform.c
> @@ -638,7 +638,7 @@ int asoc_qcom_lpass_platform_register(struct platform_device *pdev)
>   	struct lpass_variant *v = drvdata->variant;
>   	int ret;
>   
> -	drvdata->lpaif_irq = platform_get_irq(pdev, 0);
> +	drvdata->lpaif_irq = platform_get_irq_byname(pdev, "lpass-irq-lpaif");
>   	if (drvdata->lpaif_irq < 0)
>   		return -ENODEV;
>   
> 
