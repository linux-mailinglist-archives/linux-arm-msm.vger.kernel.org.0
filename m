Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5756045E399
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Nov 2021 01:09:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234463AbhKZAMt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Nov 2021 19:12:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237656AbhKZAKs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Nov 2021 19:10:48 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A1DBC061759
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Nov 2021 16:06:05 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id b1so19774991lfs.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Nov 2021 16:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=gFiDE23LtSP8Xw8ZCiJ3tYxoqVMmHqaafglT7gNk0Lo=;
        b=dyoxbiQIKR8IWogmRA1l3tmsX/gdu9NDn/gmpqTqE8nEj70fpPUyoWAv4mOqe2eOZM
         +Y148UCLu2suLHpQZ3JU6rRxR7KBgQ9WEaeWo+Jl4yk3wUiKlOUmUTo5FbPXZ5wKlKVS
         S1p/kY9ivOnrhJtYnqXjbVZafd9+da5AvdcFbJTiXbwfBozCNR1ucsH1Xy918zkFI89I
         dBJ5vnpzuWDftg4xqUCXFSWFd/SZlqAag8QOn2nLsH9xvt5M0tdKw+N6/LF3wA+KHjHd
         Wl+21ujthzkrdjDYDri1/zTOshdMd7S5xDMM5thqlvh/Fkv8bRJUaUNArFJKfqQZAraJ
         xjTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gFiDE23LtSP8Xw8ZCiJ3tYxoqVMmHqaafglT7gNk0Lo=;
        b=CR8VF4nYuwi8LpAhF88mSLwQrneQzK3P67hhNJxPWiJAZr7xqnPmlG3oyLTaObIR0Q
         FoKcrjkwriD9uDQfOXzotkYolXCzmEM07fMpSVFaRNgWV2XXfgWSPCgUyG+3dyFs6u8M
         sghgq/e/75Xya+kGT4iK5ElgYkCC6uxGPIiVlXvB43+02hoBabJaeKSkYA0jVWlm/B+l
         UDKHrOyPUizBbjkDRYkIvmFw/14vlV7yicCDSIjxs/IWWebF1O1V5dR2Kma0tG1zvC6w
         mjQ5ZkwhdYWyNtJ4RHzbdzMOElsyI17BBeQnBMwLKNjMJD7hDfe5eY9WgLSUx4bPdncD
         /B2A==
X-Gm-Message-State: AOAM533z+1eKeSVV9TEIfuTi/TGZKhA/PVhBgRvyXkgUxDWaPs87EcyW
        8nGxwZcnOTMEgJ75TfU0wfgEmw==
X-Google-Smtp-Source: ABdhPJxg1zQpTb19QmrH/PpXgKZ/pbr0V52ar3ywQRcg1DU+Jr+Q5rMxHAIY6ot/xtVGZLDntjaETQ==
X-Received: by 2002:a05:6512:228a:: with SMTP id f10mr26077082lfu.463.1637885163433;
        Thu, 25 Nov 2021 16:06:03 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id be25sm358109ljb.114.2021.11.25.16.06.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Nov 2021 16:06:03 -0800 (PST)
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
Message-ID: <32cdade5-1487-9182-e939-4d93f8a27ad6@linaro.org>
Date:   Fri, 26 Nov 2021 03:06:02 +0300
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

Another issue (or a pack of issues):
Now the msm_drm_init() is unbalanced with msm_drm_uninit(). Bits of code 
(putting the drm dev, removing the IRQ domain, etc) have to be called 
now from the msm_pdev_remove() function rather than from the unbind path.

The following changes fix the observed issues here, however additional 
care should be taken.

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 5a92417d21d0..0abb16256b61 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -342,7 +342,6 @@ static int msm_drm_uninit(struct device *dev)
         struct drm_device *ddev = platform_get_drvdata(pdev);
         struct msm_drm_private *priv = ddev->dev_private;
         struct msm_kms *kms = priv->kms;
-       struct msm_mdss *mdss = priv->mdss;
         int i;

         /*
@@ -402,14 +401,7 @@ static int msm_drm_uninit(struct device *dev)

         component_unbind_all(dev, ddev);

-       if (mdss && mdss->funcs)
-               mdss->funcs->destroy(ddev);
-
-       ddev->dev_private = NULL;
-       drm_dev_put(ddev);
-
         destroy_workqueue(priv->wq);
-       kfree(priv);

         return 0;
  }
@@ -515,7 +507,6 @@ static int msm_drm_init(struct device *dev, const
         struct drm_device *ddev = platform_get_drvdata(pdev);
         struct msm_drm_private *priv = ddev->dev_private;
         struct msm_kms *kms = priv->kms;
-       struct msm_mdss *mdss = priv->mdss;
         int ret, i;

         priv->wq = alloc_ordered_workqueue("msm", 0);
@@ -538,12 +529,12 @@ static int msm_drm_init(struct device *dev, const

         ret = msm_init_vram(ddev);
         if (ret)
-               goto err_destroy_mdss;
+               return ret;

         /* Bind all our sub-components: */
         ret = component_bind_all(dev, ddev);
         if (ret)
-               goto err_destroy_mdss;
+               return ret;

         dma_set_max_seg_size(dev, UINT_MAX);

@@ -649,10 +640,6 @@ static int msm_drm_init(struct device *dev, const
  err_msm_uninit:
         msm_drm_uninit(dev);
         return ret;
-err_destroy_mdss:
-       if (mdss && mdss->funcs)
-               mdss->funcs->destroy(ddev);
-       return ret;
  }

  /*
@@ -1424,9 +1411,20 @@ static int msm_pdev_probe(struct platform_device

  static int msm_pdev_remove(struct platform_device *pdev)
  {
+       struct drm_device *ddev = platform_get_drvdata(pdev);
+       struct msm_drm_private *priv = ddev->dev_private;
+       struct msm_mdss *mdss = priv->mdss;
+
         component_master_del(&pdev->dev, &msm_drm_ops);
+
         of_platform_depopulate(&pdev->dev);

+       if (mdss && mdss->funcs)
+               mdss->funcs->destroy(ddev);
+
+       ddev->dev_private = NULL;
+       drm_dev_put(ddev);
+
         return 0;
  }



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
