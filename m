Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1342F403588
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Sep 2021 09:37:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349531AbhIHHgO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Sep 2021 03:36:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348815AbhIHHgN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Sep 2021 03:36:13 -0400
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B68F1C061757
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Sep 2021 00:35:05 -0700 (PDT)
Received: by mail-oi1-x22d.google.com with SMTP id y128so2007233oie.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Sep 2021 00:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=VTlV0r9DqE6PwDWOv/JOGBgJvUyj2qI11VGu77nKwQQ=;
        b=gbJ9Azo7Wxxmx+grxaEcQJZQcdqDbYOMOl0YN65r/1hgKwv9xKB9npmAWXnlVCNVAC
         PeUxKvpQ4QbkXPQZ1ddViN+kFmKa+UWdo3CfQC/8ksg+njg1+yg1SGhAyHSXjFqmsa8o
         wHEWIjoInxkviAnR6oslj6JBgyU5tUlHaWxffjRGrC7drQybsG5TzzP4Ccm9UvFkrNPl
         cb7nmTGkjb3jTcZbYRDM+YVc7GlIy8ZzA0UVo0L2OqGXc58SpXWGaHyKrKya/9WKT18v
         5ysmXVvtUaxHAMp1q2X8oAwe/aWFJ4l3Jg6YCT7xi458m98Tp9ZC3T/GdrglHMtR0HWJ
         TZmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=VTlV0r9DqE6PwDWOv/JOGBgJvUyj2qI11VGu77nKwQQ=;
        b=qc/iNNnWdiu0EiEnd0tkD++UPxdtI9J+teO5L0j3G2EMdjuuFtmnnX2I1qCDt5KSAT
         53ig/l+TSYXzsDVFBHpBH7wXyIK6OdFrQfpqTtrjQOkdoainWxs7y0JJXxr1utO5Izww
         V62TKIvYVmm4W1fk65g6NwtLiK6Lj6pkZ9vgrAHk0f80ETg1OYWDxwDk7OZyEEHtPJxm
         29LlkosxsIhnBN/j+Wxto7tEbJrdBYNPNOZYdqiOGvb6bIPXeNUaF+sP318PI0b1NsaP
         y/qdxIV9zna3bVZFUcbWA2I6urHU+UYX7/vIL+AA5UNkhjB32wCd/qd2amdX3Zm9Xpxe
         5GKQ==
X-Gm-Message-State: AOAM530mcQxii2uSbIL23xtXChzdluJlYLstueZ3fxHcfJ0zaX3XTFIT
        VaXgyuBwwb8a2ehCoBfqOTnq8g==
X-Google-Smtp-Source: ABdhPJxeW5pRsYxtOCmBr/YR/lRxJV7htMMq5ZmjuZKhyjyQ+QejO3RqX2S1juzUmAi9pyo5t7OyAw==
X-Received: by 2002:aca:b6d5:: with SMTP id g204mr1452030oif.29.1631086505120;
        Wed, 08 Sep 2021 00:35:05 -0700 (PDT)
Received: from MacBook-Pro.hackershack.net (cpe-173-173-107-246.satx.res.rr.com. [173.173.107.246])
        by smtp.gmail.com with ESMTPSA id v19sm314970oic.31.2021.09.08.00.35.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Sep 2021 00:35:04 -0700 (PDT)
Subject: Re: [PATCH 6/6] soc: qcom: rpmh-rsc: Make use of the helper function
 devm_platform_ioremap_resource_byname()
To:     Cai Huoqing <caihuoqing@baidu.com>
Cc:     Niklas Cassel <nks@flawful.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210908070930.214-1-caihuoqing@baidu.com>
 <20210908070930.214-6-caihuoqing@baidu.com>
From:   Steev Klimaszewski <steev@kali.org>
Message-ID: <40708b67-9362-aa5d-5f03-d940ff6bac45@kali.org>
Date:   Wed, 8 Sep 2021 02:35:00 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210908070930.214-6-caihuoqing@baidu.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 9/8/21 2:09 AM, Cai Huoqing wrote:
> Use the devm_platform_ioremap_resource_byname() helper instead of
> calling platform_get_resource_byname() and devm_ioremap_resource()
> separately
>
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
> ---
>  drivers/soc/qcom/rpmh-rsc.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
> index e749a2b285d8..2834c6efc16b 100644
> --- a/drivers/soc/qcom/rpmh-rsc.c
> +++ b/drivers/soc/qcom/rpmh-rsc.c
> @@ -910,7 +910,6 @@ static int rpmh_rsc_probe(struct platform_device *pdev)
>  {
>  	struct device_node *dn = pdev->dev.of_node;
>  	struct rsc_drv *drv;
> -	struct resource *res;
>  	char drv_id[10] = {0};
>  	int ret, irq;
>  	u32 solver_config;
> @@ -941,8 +940,7 @@ static int rpmh_rsc_probe(struct platform_device *pdev)
>  		drv->name = dev_name(&pdev->dev);
>  
>  	snprintf(drv_id, ARRAY_SIZE(drv_id), "drv-%d", drv->id);
> -	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, drv_id);
> -	base = devm_ioremap_resource(&pdev->dev, res);
> +	base = devm_platform_ioremap_resource_byname(pdev, dri_id);

dri_id -> drv_id no?


>  	if (IS_ERR(base))
>  		return PTR_ERR(base);
>  
