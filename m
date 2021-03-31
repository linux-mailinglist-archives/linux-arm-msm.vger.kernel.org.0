Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D82CB350411
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Mar 2021 18:04:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233613AbhCaQD7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Mar 2021 12:03:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233600AbhCaQDl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Mar 2021 12:03:41 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FE19C06175F
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Mar 2021 09:03:40 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id u10so24493151lju.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Mar 2021 09:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=5LKuJHnY2f7qCpjih2QE7ExZcNPVTuCmCBGxBDXYgbA=;
        b=H3yc9Ow/ee4WAZarDtEWtUCZjqJ2SsXmt5AUo6HL+JLKuGQxZAWs5dwlRHZWTgWIyE
         qIHARj0BQ+BN6WS2RunvcHWbffg7rKWEWYDEUvOKK/e8fru/jZSNMN6F1AcPS9J4/Pp3
         t/KQVAuIlkvsQLmw8YTBhTu71k0LsD/R5mNNOWMQd0K6831G1F5fd1MF8MffRN9MkfJR
         AoJzWhXyUyfYK8I/LUpSYbH9/SnRPzKrfF5M2U0zmG/aI65iqLMq6KiOkh9n2wZ7OdG3
         FnqTsGDRQapooMou/IFxYGZhwP76g05ijTbBSlqWJIAisj4NICDMOWoFjp9XG3ozj5b3
         j2Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5LKuJHnY2f7qCpjih2QE7ExZcNPVTuCmCBGxBDXYgbA=;
        b=dkwJFyFH/n3VaWjSNNUSKJgaDX59haOzbO33K6zfVsYzRE6MnduukVB+Jyo4DbniSL
         kQYpjgkgswpq2cTqaJ/znv0kSqIhTPF6FeTv1eNU1egA6oO9mYxoYMsXcxmTd/xGEpPk
         7CjMjn0yNeL6A3sZnZHeAdU9R4Swh+LhwHyq6S7PP60GFUoXsADi14st8tE/CeK5BVaF
         Zmk3Y1WdosiRcCaO3su4qEdkpo93E2W3rCn8DzJUvNOZdycwkJdDhOdHydtD52pmdDnD
         5SJnxbp+0I+aDlmxyYWJX+9JPkFUqlPW2gnGZpNDeplYJWnCcGaSZWvbia0SPJ+QrN6K
         QTlw==
X-Gm-Message-State: AOAM532QqZ976vlVv8PK62iYIL2rdtQVJFgUGLNUltmXIzOTqIgNixTM
        DJRbZL2Mhyjzk742e6sYZqRThg==
X-Google-Smtp-Source: ABdhPJydM4JPcYVS7QzSGSky5qgWKHISfXYt6rm2VK8r6Cgr3stz9azQ5jlBswpvlvj3bbx4cWCWsw==
X-Received: by 2002:a2e:5c47:: with SMTP id q68mr2607391ljb.314.1617206618828;
        Wed, 31 Mar 2021 09:03:38 -0700 (PDT)
Received: from [192.168.43.7] ([94.25.228.171])
        by smtp.gmail.com with ESMTPSA id d34sm268115lfv.102.2021.03.31.09.03.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Mar 2021 09:03:38 -0700 (PDT)
Subject: Re: [v1] drm/msm/disp/dpu1: fix warn stack reported during dpu resume
To:     Kalyan Thota <kalyan_t@codeaurora.org>, y@qualcomm.com,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, robdclark@gmail.com,
        dianders@chromium.org, mkrishn@codeaurora.org, hywu@google.com,
        mka@google.com, midean@google.com, steev@kali.org
References: <y> <1617190020-7931-1-git-send-email-kalyan_t@codeaurora.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <84fdbdc7-7890-965a-bc6b-a19bd0ca4937@linaro.org>
Date:   Wed, 31 Mar 2021 19:03:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <1617190020-7931-1-git-send-email-kalyan_t@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 31/03/2021 14:27, Kalyan Thota wrote:
> WARN_ON was introduced by the below commit to catch runtime resumes
> that are getting triggered before icc path was set.
> 
> "drm/msm/disp/dpu1: icc path needs to be set before dpu runtime resume"
> 
> For the targets where the bw scaling is not enabled, this WARN_ON is
> a false alarm. Fix the WARN condition appropriately.

Should we change all DPU targets to use bw scaling to the mdp from the 
mdss nodes? The limitation to sc7180 looks artificial.

> 
> Reported-by: Steev Klimaszewski <steev@kali.org>
> Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  |  8 +++++---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h  |  9 +++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c | 11 ++++++-----
>   3 files changed, 20 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index cab387f..0071a4d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -294,6 +294,9 @@ static int dpu_kms_parse_data_bus_icc_path(struct dpu_kms *dpu_kms)
>   	struct icc_path *path1;
>   	struct drm_device *dev = dpu_kms->dev;
>   
> +	if (!dpu_supports_bw_scaling(dev))
> +		return 0;
> +
>   	path0 = of_icc_get(dev->dev, "mdp0-mem");
>   	path1 = of_icc_get(dev->dev, "mdp1-mem");
>   
> @@ -934,8 +937,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>   		DPU_DEBUG("REG_DMA is not defined");
>   	}
>   
> -	if (of_device_is_compatible(dev->dev->of_node, "qcom,sc7180-mdss"))
> -		dpu_kms_parse_data_bus_icc_path(dpu_kms);
> +	dpu_kms_parse_data_bus_icc_path(dpu_kms);
>   
>   	pm_runtime_get_sync(&dpu_kms->pdev->dev);
>   
> @@ -1198,7 +1200,7 @@ static int __maybe_unused dpu_runtime_resume(struct device *dev)
>   
>   	ddev = dpu_kms->dev;
>   
> -	WARN_ON(!(dpu_kms->num_paths));
> +	WARN_ON((dpu_supports_bw_scaling(ddev) && !dpu_kms->num_paths));
>   	/* Min vote of BW is required before turning on AXI clk */
>   	for (i = 0; i < dpu_kms->num_paths; i++)
>   		icc_set_bw(dpu_kms->path[i], 0, Bps_to_icc(MIN_IB_BW));
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> index d6717d6..f7bcc0a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> @@ -154,6 +154,15 @@ struct vsync_info {
>   
>   #define to_dpu_global_state(x) container_of(x, struct dpu_global_state, base)
>   
> +/**
> + * dpu_supports_bw_scaling: returns true for drivers that support bw scaling.
> + * @dev: Pointer to drm_device structure
> + */
> +static inline int dpu_supports_bw_scaling(struct drm_device *dev)
> +{
> +	return of_device_is_compatible(dev->dev->of_node, "qcom,sc7180-mdss");
> +}
> +
>   /* Global private object state for tracking resources that are shared across
>    * multiple kms objects (planes/crtcs/etc).
>    */
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
> index cd40788..8cd712c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
> @@ -41,6 +41,9 @@ static int dpu_mdss_parse_data_bus_icc_path(struct drm_device *dev,
>   	struct icc_path *path0 = of_icc_get(dev->dev, "mdp0-mem");
>   	struct icc_path *path1 = of_icc_get(dev->dev, "mdp1-mem");
>   
> +	if (dpu_supports_bw_scaling(dev))
> +		return 0;
> +
>   	if (IS_ERR_OR_NULL(path0))
>   		return PTR_ERR_OR_ZERO(path0);
>   
> @@ -276,11 +279,9 @@ int dpu_mdss_init(struct drm_device *dev)
>   
>   	DRM_DEBUG("mapped mdss address space @%pK\n", dpu_mdss->mmio);
>   
> -	if (!of_device_is_compatible(dev->dev->of_node, "qcom,sc7180-mdss")) {
> -		ret = dpu_mdss_parse_data_bus_icc_path(dev, dpu_mdss);
> -		if (ret)
> -			return ret;
> -	}
> +	ret = dpu_mdss_parse_data_bus_icc_path(dev, dpu_mdss);
> +	if (ret)
> +		return ret;
>   
>   	mp = &dpu_mdss->mp;
>   	ret = msm_dss_parse_clock(pdev, mp);
> 


-- 
With best wishes
Dmitry
