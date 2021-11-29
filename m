Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B91B460C9F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Nov 2021 03:22:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229574AbhK2CZd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 28 Nov 2021 21:25:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234414AbhK2CXd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 28 Nov 2021 21:23:33 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66286C06174A
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Nov 2021 18:20:16 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id bu18so40611574lfb.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Nov 2021 18:20:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=gbXpy3X0fAtXtWiERTMiFnq4YzMw3Gn4MO7+9HVk0zs=;
        b=riAko6cxL5ZRupe3kDzYS9nBBKhba4A6hHLKSoFDDF+P8MBGCyx6NPjh403sXAhz6o
         KCqji0QzueFYRrss2xQVIuIHaQoKMSCTnzAQtWtNdncRyYy9x76We7lAYt4rFhIGsP0i
         KAYIumBQ5ylYOnEq83R1VUC/NSk2DerWqfBtbNE3Xx9kpJNvRFxCSQI6Pujlj30B3Mna
         zy2xFYiwyJgA7IowgAklqEDDYVJ1shDXTjbjXn7QLSkpvqir9jOz68W2ksxMWAxuNLsx
         16ozAdUWv/iNS3A70mahCg593ikXS+uwSURxQ9vGzRT6T2A5wuts7oBqcgLfEgbRA2EC
         wMqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gbXpy3X0fAtXtWiERTMiFnq4YzMw3Gn4MO7+9HVk0zs=;
        b=7Ra1XDRoibLzp244rEVqvGMD9GrEAC8ZZXzsoBm3mD4FLLWhHBTurfq8/AiaYaYI5U
         h5Cqk+E9MTXa3ojJxiBpAcTa+Zo2YX0ae6OcX/qUrURbf0ZxNSkBe83HRPKupOOw646Z
         KEyUoz/ZFaf/gM0EUrjzhG7AolKZuw4Pxv0cP8v+iUwvLURJxlcmJWfFe+2HwthpYc6w
         pdEz9tZVFPJI7QCbgKACXK9eqsqxIs6B6AY9PznA36YSBZE7SF9rxpThdYC8Qpn5i37E
         xP1xUtzziM7GBZCipZ2HJ8l3nbjdlwP8CcMc0MnU63Sa5DKZCGx0i5MTWIzUphY+bpkA
         D9pQ==
X-Gm-Message-State: AOAM530KO6nNe26MM6emh7jXK6BwV6eZa9RE6aZR/Usjyo71p10dTEfE
        ydLkQO1j3VnfStR5egDF2PbdiA==
X-Google-Smtp-Source: ABdhPJxIwWo/bewpFBzWHTwOtHdrqRrm9GQlZeon4gRuwO5aydkPs6ToAAYp/JHEnm84xRrVcMGrBw==
X-Received: by 2002:a05:6512:3251:: with SMTP id c17mr43171055lfr.440.1638152414615;
        Sun, 28 Nov 2021 18:20:14 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id d18sm1336482lfl.30.2021.11.28.18.20.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Nov 2021 18:20:14 -0800 (PST)
Subject: Re: [PATCH] drm/msm: Initialize MDSS irq domain at probe time
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>, robdclark@gmail.com
Cc:     sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
        maxime@cerno.tech, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, kernel@collabora.com,
        konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        jami.kettunen@somainline.org
References: <20211125150947.354076-1-angelogioacchino.delregno@collabora.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <bf1540f1-4a9f-a9d6-d487-929107c487fd@linaro.org>
Date:   Mon, 29 Nov 2021 05:20:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211125150947.354076-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 25/11/2021 18:09, AngeloGioacchino Del Regno wrote:
> Since commit 8f59ee9a570c ("drm/msm/dsi: Adjust probe order"), the
> DSI host gets initialized earlier, but this caused unability to probe
> the entire stack of components because they all depend on interrupts
> coming from the main `mdss` node (mdp5, or dpu1).
> 
> To fix this issue, also anticipate probing mdp5 or dpu1 by initializing
> them at msm_pdev_probe() time: this will make sure that we add the
> required interrupt controller mapping before dsi and/or other components
> try to initialize, finally satisfying the dependency.
> 
> While at it, also change the allocation of msm_drm_private to use the
> devm variant of kzalloc().
> 
> Fixes: 8f59ee9a570c ("drm/msm/dsi: Adjust probe order")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

I have been thinking about this. I do not feel that this is the correct 
approach. Currently DRM device exists only when all components are 
bound. If any of the subdevices is removed, corresponding component is 
delteted (and thus all components are unbound), the DRM device is taken 
down. This results in the state cleanup, userspace notifications, etc.

With your changes, DRM device will continue to exist even after one of 
subdevices is removed. This is not an expected behaviour, since 
subdrivers do not perform full cleanup, delegating that to DRM device 
takedown.

I suppose that proper solution would be to split msm_drv.c into into:
- generic components & drm code to be called from mdp4/mdp5/dpu driver 
(making mdp4, mdp5 or dpu1 the components master)

- bare mdss driver, taking care only about IRQs, OF devices population - 
calling proper mdss_init/mdss_destroy functions. Most probably we can 
drop this part altogether and just make md5_mdss.c/dpu_mdss.c proper 
platform drivers.

> ---
>   drivers/gpu/drm/msm/msm_drv.c | 81 ++++++++++++++++-------------------
>   1 file changed, 38 insertions(+), 43 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 7936e8d498dd..790acf4993c0 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -512,45 +512,12 @@ static int msm_init_vram(struct drm_device *dev)
>   static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
>   {
>   	struct platform_device *pdev = to_platform_device(dev);
> -	struct drm_device *ddev;
> -	struct msm_drm_private *priv;
> -	struct msm_kms *kms;
> -	struct msm_mdss *mdss;
> +	struct drm_device *ddev = platform_get_drvdata(pdev);
> +	struct msm_drm_private *priv = ddev->dev_private;
> +	struct msm_kms *kms = priv->kms;
> +	struct msm_mdss *mdss = priv->mdss;
>   	int ret, i;
>   
> -	ddev = drm_dev_alloc(drv, dev);
> -	if (IS_ERR(ddev)) {
> -		DRM_DEV_ERROR(dev, "failed to allocate drm_device\n");
> -		return PTR_ERR(ddev);
> -	}
> -
> -	platform_set_drvdata(pdev, ddev);
> -
> -	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
> -	if (!priv) {
> -		ret = -ENOMEM;
> -		goto err_put_drm_dev;
> -	}
> -
> -	ddev->dev_private = priv;
> -	priv->dev = ddev;
> -
> -	switch (get_mdp_ver(pdev)) {
> -	case KMS_MDP5:
> -		ret = mdp5_mdss_init(ddev);
> -		break;
> -	case KMS_DPU:
> -		ret = dpu_mdss_init(ddev);
> -		break;
> -	default:
> -		ret = 0;
> -		break;
> -	}
> -	if (ret)
> -		goto err_free_priv;
> -
> -	mdss = priv->mdss;
> -
>   	priv->wq = alloc_ordered_workqueue("msm", 0);
>   	priv->hangcheck_period = DRM_MSM_HANGCHECK_DEFAULT_PERIOD;
>   
> @@ -685,11 +652,6 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
>   err_destroy_mdss:
>   	if (mdss && mdss->funcs)
>   		mdss->funcs->destroy(ddev);
> -err_free_priv:
> -	kfree(priv);
> -err_put_drm_dev:
> -	drm_dev_put(ddev);
> -	platform_set_drvdata(pdev, NULL);
>   	return ret;
>   }
>   
> @@ -1382,12 +1344,42 @@ static const struct component_master_ops msm_drm_ops = {
>   static int msm_pdev_probe(struct platform_device *pdev)
>   {
>   	struct component_match *match = NULL;
> +	struct msm_drm_private *priv;
> +	struct drm_device *ddev;
>   	int ret;
>   
> +	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	ddev = drm_dev_alloc(&msm_driver, &pdev->dev);
> +	if (IS_ERR(ddev)) {
> +		DRM_DEV_ERROR(&pdev->dev, "failed to allocate drm_device\n");
> +		return PTR_ERR(ddev);
> +	}
> +
> +	platform_set_drvdata(pdev, ddev);
> +	ddev->dev_private = priv;
> +	priv->dev = ddev;
> +
> +	switch (get_mdp_ver(pdev)) {
> +	case KMS_MDP5:
> +		ret = mdp5_mdss_init(ddev);
> +		break;
> +	case KMS_DPU:
> +		ret = dpu_mdss_init(ddev);
> +		break;
> +	default:
> +		ret = 0;
> +		break;
> +	}
> +	if (ret)
> +		goto err_put_drm_dev;
> +
>   	if (get_mdp_ver(pdev)) {
>   		ret = add_display_components(pdev, &match);
>   		if (ret)
> -			return ret;
> +			goto fail;
>   	}
>   
>   	ret = add_gpu_components(&pdev->dev, &match);
> @@ -1409,6 +1401,9 @@ static int msm_pdev_probe(struct platform_device *pdev)
>   
>   fail:
>   	of_platform_depopulate(&pdev->dev);
> +err_put_drm_dev:
> +	drm_dev_put(ddev);
> +	platform_set_drvdata(pdev, NULL);
>   	return ret;
>   }
>   
> 


-- 
With best wishes
Dmitry
