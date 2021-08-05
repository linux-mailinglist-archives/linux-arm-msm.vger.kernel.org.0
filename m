Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BD243E10C5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Aug 2021 11:05:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238889AbhHEJFs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Aug 2021 05:05:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231865AbhHEJFr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Aug 2021 05:05:47 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AB53C061765
        for <linux-arm-msm@vger.kernel.org>; Thu,  5 Aug 2021 02:05:33 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id b21so6095657ljo.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Aug 2021 02:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=5vTGasZl7PnPp0SXYS1aJUXhqUIJE0dOsjTw6yM2pVs=;
        b=pumne5xgkS/vaAiILRe0IiVIKXCWEHr8wSCCU0/DCPrsIt+K4m5IRrrL0q7tr/r8zj
         uUL9HH1M2XzAKGYicVTLkgdP2Cu3L1xB8DTjIn/ah0H3Xa5mPKFUcP+y52zkm6YmMcrS
         tunju7CNYHcZWI3HmYRZi4vntL40ABt+pNr1X2RDaILs/P9423QHKV3PajjmSk8RbxQk
         aFWK3fQJhoMz0v9QYejI05W1JXDg2WJubuv5QeFUCU4vsYfi5jQF5wNzUdmx0/1p/KMX
         Of9vIS6pfE4Zu2nByTBW/UEuNaQaUlzaRq6m6/lPP6GHvLNTRKpczfVBJGtZsgY7Is1M
         ud7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5vTGasZl7PnPp0SXYS1aJUXhqUIJE0dOsjTw6yM2pVs=;
        b=tgTMChpPyrg5lYQEA/hAPl8NroPvu4KXczzjpJ/nvDE/oQXyV9Y5YCbJQX2XueP/+W
         oc59+JSZnYI8eQUqZYblX4WXZndgJFmS+3JlIbD0PDK4IDxABkD5RoL5PpBaBxMUXNf6
         3bjaJJsOBzvSa80gYo35hRMUq+LvY+7JDrBp7d0wAPbz8ejHP8Uk8UEXOkXIR6EZMhga
         iFewMQ6IS8UfZLYXKQBZk4l+M82GjpxI5CVd+zg+NybrR+7dA6UheFJFFrgmwTtOUKG7
         05J/foXOA9l+w2WOhbDvT/BSW7SKKh9h5LlPPIvPbLrAnsNaBMxXRZryGuJVsJj6g6n+
         kcsQ==
X-Gm-Message-State: AOAM530/53H8hUGF64+bLd5RjUCbFhudQ4SlNZSUFixbRVSdFT7FgMea
        yZh+wU5BhgxZLBAz4F9OK0ADn04NBaLoug==
X-Google-Smtp-Source: ABdhPJwAKvMp7MZAmeQqRaIZVdeMrRexXq477qnwq54YJ2lG+7ZS34CiIb6/Thf6bE9AkKFv9XM+9Q==
X-Received: by 2002:a2e:81d1:: with SMTP id s17mr2458334ljg.272.1628154331602;
        Thu, 05 Aug 2021 02:05:31 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id t30sm448320lfg.289.2021.08.05.02.05.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Aug 2021 02:05:31 -0700 (PDT)
Subject: Re: [PATCH 2/2] drm/msm/mdp4: move HW revision detection to earlier
 phase
To:     David Heidelberg <david@ixit.cz>,
        Jonathan Marek <jonathan@marek.ca>,
        robdclark <robdclark@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org
References: <20210705231641.315804-1-david@ixit.cz>
 <20210705231641.315804-2-david@ixit.cz>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <3ce263c3-cda8-5070-2c32-7a3ac467853b@linaro.org>
Date:   Thu, 5 Aug 2021 12:05:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210705231641.315804-2-david@ixit.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 06/07/2021 02:16, David Heidelberg wrote:
> Fixes if condition, which never worked inside mdp4_kms_init, since
> HW detection has been done later in mdp4_hw_init.
> 
> Fixes: eb2b47bb9a03 ("drm/msm/mdp4: only use lut_clk on mdp4.2+")
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 45 ++++++++++++------------
>   1 file changed, 22 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> index 3a7a01d801aa..0712752742f4 100644
> --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> @@ -19,23 +19,12 @@ static int mdp4_hw_init(struct msm_kms *kms)
>   {
>   	struct mdp4_kms *mdp4_kms = to_mdp4_kms(to_mdp_kms(kms));
>   	struct drm_device *dev = mdp4_kms->dev;
> -	u32 major, minor, dmap_cfg, vg_cfg;
> +	u32 dmap_cfg, vg_cfg;
>   	unsigned long clk;
>   	int ret = 0;
>   
>   	pm_runtime_get_sync(dev->dev);
>   
> -	read_mdp_hw_revision(mdp4_kms, &major, &minor);
> -
> -	if (major != 4) {
> -		DRM_DEV_ERROR(dev->dev, "unexpected MDP version: v%d.%d\n",
> -				major, minor);
> -		ret = -ENXIO;
> -		goto out;
> -	}
> -
> -	mdp4_kms->rev = minor;
> -
>   	if (mdp4_kms->rev > 1) {
>   		mdp4_write(mdp4_kms, REG_MDP4_CS_CONTROLLER0, 0x0707ffff);
>   		mdp4_write(mdp4_kms, REG_MDP4_CS_CONTROLLER1, 0x03073f3f);
> @@ -81,7 +70,6 @@ static int mdp4_hw_init(struct msm_kms *kms)
>   	if (mdp4_kms->rev > 1)
>   		mdp4_write(mdp4_kms, REG_MDP4_RESET_STATUS, 1);
>   
> -out:
>   	pm_runtime_put_sync(dev->dev);
>   
>   	return ret;
> @@ -428,6 +416,7 @@ struct msm_kms *mdp4_kms_init(struct drm_device *dev)
>   	struct msm_kms *kms = NULL;
>   	struct msm_gem_address_space *aspace;
>   	int irq, ret;
> +	u32 major, minor;
>   
>   	mdp4_kms = kzalloc(sizeof(*mdp4_kms), GFP_KERNEL);
>   	if (!mdp4_kms) {
> @@ -488,15 +477,6 @@ struct msm_kms *mdp4_kms_init(struct drm_device *dev)
>   	if (IS_ERR(mdp4_kms->pclk))
>   		mdp4_kms->pclk = NULL;
>   
> -	if (mdp4_kms->rev >= 2) {
> -		mdp4_kms->lut_clk = devm_clk_get(&pdev->dev, "lut_clk");
> -		if (IS_ERR(mdp4_kms->lut_clk)) {
> -			DRM_DEV_ERROR(dev->dev, "failed to get lut_clk\n");
> -			ret = PTR_ERR(mdp4_kms->lut_clk);
> -			goto fail;
> -		}
> -	}
> -
>   	mdp4_kms->axi_clk = devm_clk_get(&pdev->dev, "bus_clk");
>   	if (IS_ERR(mdp4_kms->axi_clk)) {
>   		DRM_DEV_ERROR(dev->dev, "failed to get axi_clk\n");
> @@ -505,8 +485,27 @@ struct msm_kms *mdp4_kms_init(struct drm_device *dev)
>   	}
>   
>   	clk_set_rate(mdp4_kms->clk, config->max_clk);
> -	if (mdp4_kms->lut_clk)
> +
> +	read_mdp_hw_revision(mdp4_kms, &major, &minor);
> +
> +	if (major != 4) {
> +		DRM_DEV_ERROR(dev->dev, "unexpected MDP version: v%d.%d\n",
> +			      major, minor);
> +		ret = -ENXIO;
> +		goto fail;
> +	}
> +
> +	mdp4_kms->rev = minor;
> +
> +	if (mdp4_kms->rev >= 2) {
> +		mdp4_kms->lut_clk = devm_clk_get(&pdev->dev, "lut_clk");
> +		if (IS_ERR(mdp4_kms->lut_clk)) {
> +			DRM_DEV_ERROR(dev->dev, "failed to get lut_clk\n");
> +			ret = PTR_ERR(mdp4_kms->lut_clk);
> +			goto fail;
> +		}
>   		clk_set_rate(mdp4_kms->lut_clk, config->max_clk);
> +	}
>   
>   	pm_runtime_enable(dev->dev);
>   	mdp4_kms->rpm_enabled = true;
> 


-- 
With best wishes
Dmitry
