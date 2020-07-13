Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C195A21E3F1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2020 01:49:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727788AbgGMXtC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Jul 2020 19:49:02 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:11705 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727114AbgGMXs5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Jul 2020 19:48:57 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1594684136; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=PrpIt2QwllJBDPtjCKM+xDBX1KSoof1+57+Ty/g11Zw=; b=bGEz41QgyvjC8b0LaBsoeoG6vjea/1lVVi7eRmIwZ+S6oyHVrMB1qI0uS5mMbn5te9QWnTyj
 /7+LNnROQDeBBWCROUHUsefitmtHG/s37cy+h5+zMHQYi62ryXFferrIvOudttLH2HSLIdS4
 XCDXZsimj4Gw83WfLquGQnTkehM=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 5f0cf2e02991e765cd790ed8 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 13 Jul 2020 23:48:48
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 6FF92C433B1; Mon, 13 Jul 2020 23:48:47 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 60308C433CA;
        Mon, 13 Jul 2020 23:48:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 60308C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date:   Mon, 13 Jul 2020 17:48:42 -0600
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Brian Masney <masneyb@onstation.org>,
        Fabio Estevam <festevam@gmail.com>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <dri-devel@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 3/3] drm/msm: handle for EPROBE_DEFER for of_icc_get
Message-ID: <20200713234842.GC24345@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Jonathan Marek <jonathan@marek.ca>,
        freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Brian Masney <masneyb@onstation.org>,
        Fabio Estevam <festevam@gmail.com>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20200713225345.20556-1-jonathan@marek.ca>
 <20200713225345.20556-4-jonathan@marek.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200713225345.20556-4-jonathan@marek.ca>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jul 13, 2020 at 06:53:42PM -0400, Jonathan Marek wrote:
> Check for errors instead of silently not using icc if the msm driver
> probes before the interconnect driver.
> 
> Allow ENODATA for ocmem path, as it is optional and this error
> is returned when "gfx-mem" path is provided but not "ocmem".
> 
> Because msm_gpu_cleanup assumes msm_gpu_init has been called, the icc path
> init needs to be after msm_gpu_init for the error path to work.

A possible future improvement would be to move the ocmem check to the target
specific code for 3xx and 4xx where you could be a bit more demanding that the
ocmem path actually exist.

Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>

> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 65 +++++++++++++++----------
>  1 file changed, 38 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index ad64d4b7e8d7..3f1ecc1de965 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -895,7 +895,7 @@ static int adreno_get_legacy_pwrlevels(struct device *dev)
>  	return 0;
>  }
>  
> -static int adreno_get_pwrlevels(struct device *dev,
> +static void adreno_get_pwrlevels(struct device *dev,
>  		struct msm_gpu *gpu)
>  {
>  	unsigned long freq = ULONG_MAX;
> @@ -930,24 +930,6 @@ static int adreno_get_pwrlevels(struct device *dev,
>  	}
>  
>  	DBG("fast_rate=%u, slow_rate=27000000", gpu->fast_rate);
> -
> -	/* Check for an interconnect path for the bus */
> -	gpu->icc_path = of_icc_get(dev, "gfx-mem");
> -	if (!gpu->icc_path) {
> -		/*
> -		 * Keep compatbility with device trees that don't have an
> -		 * interconnect-names property.
> -		 */
> -		gpu->icc_path = of_icc_get(dev, NULL);
> -	}
> -	if (IS_ERR(gpu->icc_path))
> -		gpu->icc_path = NULL;
> -
> -	gpu->ocmem_icc_path = of_icc_get(dev, "ocmem");
> -	if (IS_ERR(gpu->ocmem_icc_path))
> -		gpu->ocmem_icc_path = NULL;
> -
> -	return 0;
>  }
>  
>  int adreno_gpu_ocmem_init(struct device *dev, struct adreno_gpu *adreno_gpu,
> @@ -993,9 +975,11 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>  		struct adreno_gpu *adreno_gpu,
>  		const struct adreno_gpu_funcs *funcs, int nr_rings)
>  {
> -	struct adreno_platform_config *config = pdev->dev.platform_data;
> +	struct device *dev = &pdev->dev;
> +	struct adreno_platform_config *config = dev->platform_data;
>  	struct msm_gpu_config adreno_gpu_config  = { 0 };
>  	struct msm_gpu *gpu = &adreno_gpu->base;
> +	int ret;
>  
>  	adreno_gpu->funcs = funcs;
>  	adreno_gpu->info = adreno_info(config->rev);
> @@ -1007,15 +991,42 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>  
>  	adreno_gpu_config.nr_rings = nr_rings;
>  
> -	adreno_get_pwrlevels(&pdev->dev, gpu);
> +	adreno_get_pwrlevels(dev, gpu);
>  
> -	pm_runtime_set_autosuspend_delay(&pdev->dev,
> +	pm_runtime_set_autosuspend_delay(dev,
>  		adreno_gpu->info->inactive_period);
> -	pm_runtime_use_autosuspend(&pdev->dev);
> -	pm_runtime_enable(&pdev->dev);
> +	pm_runtime_use_autosuspend(dev);
> +	pm_runtime_enable(dev);
>  
> -	return msm_gpu_init(drm, pdev, &adreno_gpu->base, &funcs->base,
> +	ret = msm_gpu_init(drm, pdev, &adreno_gpu->base, &funcs->base,
>  			adreno_gpu->info->name, &adreno_gpu_config);
> +	if (ret)
> +		return ret;
> +
> +	/* Check for an interconnect path for the bus */
> +	gpu->icc_path = of_icc_get(dev, "gfx-mem");
> +	if (!gpu->icc_path) {
> +		/*
> +		 * Keep compatbility with device trees that don't have an
> +		 * interconnect-names property.
> +		 */
> +		gpu->icc_path = of_icc_get(dev, NULL);
> +	}
> +	if (IS_ERR(gpu->icc_path)) {
> +		ret = PTR_ERR(gpu->icc_path);
> +		gpu->icc_path = NULL;
> +		return ret;
> +	}
> +
> +	gpu->ocmem_icc_path = of_icc_get(dev, "ocmem");
> +	if (IS_ERR(gpu->ocmem_icc_path)) {
> +		ret = PTR_ERR(gpu->ocmem_icc_path);
> +		gpu->ocmem_icc_path = NULL;
> +		/* allow -ENODATA, ocmem icc is optional */
> +		if (ret != -ENODATA)
> +			return ret;
> +	}
> +	return 0;
>  }
>  
>  void adreno_gpu_cleanup(struct adreno_gpu *adreno_gpu)
> @@ -1029,8 +1040,8 @@ void adreno_gpu_cleanup(struct adreno_gpu *adreno_gpu)
>  
>  	pm_runtime_disable(&priv->gpu_pdev->dev);
>  
> +	msm_gpu_cleanup(&adreno_gpu->base);
> +
>  	icc_put(gpu->icc_path);
>  	icc_put(gpu->ocmem_icc_path);
> -
> -	msm_gpu_cleanup(&adreno_gpu->base);
>  }
> -- 
> 2.26.1
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
