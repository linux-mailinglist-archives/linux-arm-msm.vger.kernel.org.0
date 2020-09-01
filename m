Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E089258772
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Sep 2020 07:30:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726117AbgIAFaz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Sep 2020 01:30:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725930AbgIAFax (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Sep 2020 01:30:53 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD0C7C061290
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2020 22:30:52 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id c10so122866otm.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2020 22:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=3bQbJ1MgVxqfRx6wQTvDAx4UH6bM5q59KkuatLbzk4Q=;
        b=EyLH6/8lTL8tRjy57PK77UKsuw/GI4mHWlZW3NfzdSJiksHmEt7i0AcALGBNfFnKLq
         wut/6XY7pp2SF4k4CERx3auDlwTMEPva/jiYhB1dSxfJdgp1RmI+/7zEIqVxF8D38Aah
         LT3IvIhhTpv/jD4EHBxeiiLsli8PBTvq3rtanxAmndQoTA+J+vH8FdaAQ1sXpUW+7wHu
         BqMh+cS7gcD/BI3IiTvKE/sQTyn9uAs5+Smh1Nsfay+IJRE43IgulF+phRD9vaWdIMvk
         YQoDFUIrAQR1WrccH64OI7gGCng52cddpKYz1NNJ3OXYcdny0UqMshidqmMkyuElMEWa
         AV+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3bQbJ1MgVxqfRx6wQTvDAx4UH6bM5q59KkuatLbzk4Q=;
        b=ldpKesZyNL7uBj+ShcjiaIOGC0ez3bL9TvrCtoz6DuHOUwXl06uzl/ZFC2ndH/60O+
         ClwLnP2RCMgY/HWbBLib/69V3hT3SqWiTiw7v48AKDbkOyyv+8WT2SatacarVCROMl30
         RkkBjT8JIwqVUyY1/Epb8uHHclF1bpxtgI/cnHOCsgFCPDD2EHTtCvaci74asZfDsJnl
         70LUXIQZdFJPYbBSG8WSLNTKbMd8gA5M/LCYUb7EhYhwH1bLsZb071+bxM97Q2/NC7a4
         AGUhgBZV4hdxXR2zs4VCgfNtX0TTHT6iqq1btgD/p0myXlVLbo3ZyzQpWCljwOeKSYoV
         IjfQ==
X-Gm-Message-State: AOAM533L1odI4rXSbTOvxyW6cXgIg0KDfhMm1FfXsiUushlT0ew6DEOn
        skDULD97u+Exkg6lJY1vCcJGiw==
X-Google-Smtp-Source: ABdhPJxg1JFA4u445ylEbw3QrlOB7WkbXj2mOBGSI1Rj8kIR5ol1ujEOECLgvFYGyi5+IjeYzHmLgA==
X-Received: by 2002:a9d:4e9a:: with SMTP id v26mr217600otk.106.1598938252120;
        Mon, 31 Aug 2020 22:30:52 -0700 (PDT)
Received: from yoga ([2605:6000:e5cb:c100:8898:14ff:fe6d:34e])
        by smtp.gmail.com with ESMTPSA id k1sm45479oot.20.2020.08.31.22.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2020 22:30:51 -0700 (PDT)
Date:   Tue, 1 Sep 2020 00:30:47 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
        linux-arm-msm@vger.kernel.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Will Deacon <will@kernel.org>, freedreno@lists.freedesktop.org,
        Sibi Sankar <sibis@codeaurora.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        linux-arm-kernel@lists.infradead.org,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 15/19] drm/msm: Add support for private address space
 instances
Message-ID: <20200901053047.GW3715@yoga>
References: <20200810222657.1841322-1-jcrouse@codeaurora.org>
 <20200814024114.1177553-16-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200814024114.1177553-16-robdclark@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 13 Aug 21:41 CDT 2020, Rob Clark wrote:

> From: Jordan Crouse <jcrouse@codeaurora.org>
> 
> Add support for allocating private address space instances. Targets that
> support per-context pagetables should implement their own function to
> allocate private address spaces.
> 
> The default will return a pointer to the global address space.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/msm_drv.c     | 13 +++++++------
>  drivers/gpu/drm/msm/msm_drv.h     |  5 +++++
>  drivers/gpu/drm/msm/msm_gem_vma.c |  9 +++++++++
>  drivers/gpu/drm/msm/msm_gpu.c     | 22 ++++++++++++++++++++++
>  drivers/gpu/drm/msm/msm_gpu.h     |  5 +++++
>  5 files changed, 48 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 01845a3b8d52..8e70d220bba8 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -597,7 +597,7 @@ static int context_init(struct drm_device *dev, struct drm_file *file)
>  	kref_init(&ctx->ref);
>  	msm_submitqueue_init(dev, ctx);
>  
> -	ctx->aspace = priv->gpu ? priv->gpu->aspace : NULL;
> +	ctx->aspace = msm_gpu_create_private_address_space(priv->gpu);
>  	file->driver_priv = ctx;
>  
>  	return 0;
> @@ -780,18 +780,19 @@ static int msm_ioctl_gem_cpu_fini(struct drm_device *dev, void *data,
>  }
>  
>  static int msm_ioctl_gem_info_iova(struct drm_device *dev,
> -		struct drm_gem_object *obj, uint64_t *iova)
> +		struct drm_file *file, struct drm_gem_object *obj,
> +		uint64_t *iova)
>  {
> -	struct msm_drm_private *priv = dev->dev_private;
> +	struct msm_file_private *ctx = file->driver_priv;
>  
> -	if (!priv->gpu)
> +	if (!ctx->aspace)
>  		return -EINVAL;
>  
>  	/*
>  	 * Don't pin the memory here - just get an address so that userspace can
>  	 * be productive
>  	 */
> -	return msm_gem_get_iova(obj, priv->gpu->aspace, iova);
> +	return msm_gem_get_iova(obj, ctx->aspace, iova);
>  }
>  
>  static int msm_ioctl_gem_info(struct drm_device *dev, void *data,
> @@ -830,7 +831,7 @@ static int msm_ioctl_gem_info(struct drm_device *dev, void *data,
>  		args->value = msm_gem_mmap_offset(obj);
>  		break;
>  	case MSM_INFO_GET_IOVA:
> -		ret = msm_ioctl_gem_info_iova(dev, obj, &args->value);
> +		ret = msm_ioctl_gem_info_iova(dev, file, obj, &args->value);
>  		break;
>  	case MSM_INFO_SET_NAME:
>  		/* length check should leave room for terminating null: */
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index 4561bfb5e745..2ca9c3c03845 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -249,6 +249,10 @@ int msm_gem_map_vma(struct msm_gem_address_space *aspace,
>  void msm_gem_close_vma(struct msm_gem_address_space *aspace,
>  		struct msm_gem_vma *vma);
>  
> +
> +struct msm_gem_address_space *
> +msm_gem_address_space_get(struct msm_gem_address_space *aspace);
> +
>  void msm_gem_address_space_put(struct msm_gem_address_space *aspace);
>  
>  struct msm_gem_address_space *
> @@ -434,6 +438,7 @@ static inline void __msm_file_private_destroy(struct kref *kref)
>  	struct msm_file_private *ctx = container_of(kref,
>  		struct msm_file_private, ref);
>  
> +	msm_gem_address_space_put(ctx->aspace);
>  	kfree(ctx);
>  }
>  
> diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
> index 5f6a11211b64..29cc1305cf37 100644
> --- a/drivers/gpu/drm/msm/msm_gem_vma.c
> +++ b/drivers/gpu/drm/msm/msm_gem_vma.c
> @@ -27,6 +27,15 @@ void msm_gem_address_space_put(struct msm_gem_address_space *aspace)
>  		kref_put(&aspace->kref, msm_gem_address_space_destroy);
>  }
>  
> +struct msm_gem_address_space *
> +msm_gem_address_space_get(struct msm_gem_address_space *aspace)
> +{
> +	if (!IS_ERR_OR_NULL(aspace))
> +		kref_get(&aspace->kref);
> +
> +	return aspace;
> +}
> +
>  /* Actually unmap memory for the vma */
>  void msm_gem_purge_vma(struct msm_gem_address_space *aspace,
>  		struct msm_gem_vma *vma)
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> index e1a3cbe25a0c..951850804d77 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -823,6 +823,28 @@ static int get_clocks(struct platform_device *pdev, struct msm_gpu *gpu)
>  	return 0;
>  }
>  
> +/* Return a new address space for a msm_drm_private instance */
> +struct msm_gem_address_space *
> +msm_gpu_create_private_address_space(struct msm_gpu *gpu)
> +{
> +	struct msm_gem_address_space *aspace = NULL;
> +
> +	if (!gpu)
> +		return NULL;
> +
> +	/*
> +	 * If the target doesn't support private address spaces then return
> +	 * the global one
> +	 */
> +	if (gpu->funcs->create_private_address_space)
> +		aspace = gpu->funcs->create_private_address_space(gpu);
> +
> +	if (IS_ERR_OR_NULL(aspace))
> +		aspace = msm_gem_address_space_get(gpu->aspace);
> +
> +	return aspace;
> +}
> +
>  int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>  		struct msm_gpu *gpu, const struct msm_gpu_funcs *funcs,
>  		const char *name, struct msm_gpu_config *config)
> diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
> index 1f96ac0d9049..4052a18e18c2 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.h
> +++ b/drivers/gpu/drm/msm/msm_gpu.h
> @@ -65,6 +65,8 @@ struct msm_gpu_funcs {
>  	void (*gpu_set_freq)(struct msm_gpu *gpu, struct dev_pm_opp *opp);
>  	struct msm_gem_address_space *(*create_address_space)
>  		(struct msm_gpu *gpu, struct platform_device *pdev);
> +	struct msm_gem_address_space *(*create_private_address_space)
> +		(struct msm_gpu *gpu);
>  };
>  
>  struct msm_gpu {
> @@ -295,6 +297,9 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>  		struct msm_gpu *gpu, const struct msm_gpu_funcs *funcs,
>  		const char *name, struct msm_gpu_config *config);
>  
> +struct msm_gem_address_space *
> +msm_gpu_create_private_address_space(struct msm_gpu *gpu);
> +
>  void msm_gpu_cleanup(struct msm_gpu *gpu);
>  
>  struct msm_gpu *adreno_load_gpu(struct drm_device *dev);
> -- 
> 2.26.2
> 
