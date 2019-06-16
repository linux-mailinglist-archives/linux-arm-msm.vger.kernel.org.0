Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B4004764D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Jun 2019 20:05:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725920AbfFPSFu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 16 Jun 2019 14:05:50 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:42908 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726016AbfFPSFt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 16 Jun 2019 14:05:49 -0400
Received: by mail-pf1-f195.google.com with SMTP id q10so4368553pff.9
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Jun 2019 11:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=u35gclse1baa2lop6heiT2CDZ1NDng4DHhokpLnPOxc=;
        b=Pu/hO6k7PPffAUQFy+SNuxWmWpe29U9fKC4udp6oYWkxri3v3BFd+bJDJamixnMRzI
         5EqnWcNx7gdNJW6JXfXn0sye/l2kiOkSexDCviECyyJ9bvr5xqFz6dAZm51D0oOx9sEt
         CVPJ9EZwRzY9Bq9AZ4XTMZOmnm3eh7/4rlEiA5elBKJpSJDzEQ570GRcSQv0sOvICIBO
         1nIHFjrhk9HW/xJUweN3nkU6Q/uUtEdhB0F8XMl+/r9kgQwUGVvWwTNNkf3wG9MLR7JY
         KAS4/rFYdZElXOdn9xn4rsm3OfT555TgDRG003LuJ6JJ0F1PYZyk4p3xQKPzJMDCARPK
         D7mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=u35gclse1baa2lop6heiT2CDZ1NDng4DHhokpLnPOxc=;
        b=WMar9/3jnLkm/iB8QIqdy6MjVbrG8P2BmCU9ygVZB7j1voKAFi+m19DadZb5qkbTzO
         prOvLSU4wsIPeiOboy5K8MYnpcBIawtOM2OIxbJSZP+Ii7PDhXKTJXsMgqs4U9vkF2+G
         FDLefOhsc8vlGvuCHJmrh5pIMpKNa+jbW6EmEwC3wDrqdwI0dwSz1oTK8uzUZqk4t2En
         oE/k6Au5rPjy/gV7vn4sF5KNzFexS5kXyLevAaADzLUhzyyyCoDtuTEED3xMNxDs8RHH
         //mQfaBPsR1Nj+GewKbr0OWrDo59vODcjsn2+OIjiwFs9VRXlfPqORNV416QVHIyLbeN
         Yfjw==
X-Gm-Message-State: APjAAAUWtSeQSZteXbXZimeQjwRv2ffnd+fJZOhxGq7iT5gbjpb0ybeo
        kauOdxTSMobgx669csdnDvCxrA==
X-Google-Smtp-Source: APXvYqyCWmCwz42MjjqVugwCxFCSzIixh58X3n1GpdHNKlXXhC4ONFMYcjyuJteJpw2I6D2fsRFqiQ==
X-Received: by 2002:a62:e315:: with SMTP id g21mr61941613pfh.225.1560708347505;
        Sun, 16 Jun 2019 11:05:47 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id l68sm5258599pjb.8.2019.06.16.11.05.45
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 16 Jun 2019 11:05:46 -0700 (PDT)
Date:   Sun, 16 Jun 2019 11:06:33 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Brian Masney <masneyb@onstation.org>
Cc:     agross@kernel.org, david.brown@linaro.org, robdclark@gmail.com,
        sean@poorly.run, robh+dt@kernel.org, airlied@linux.ie,
        daniel@ffwll.ch, mark.rutland@arm.com, jonathan@marek.ca,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 6/6] drm/msm/gpu: add ocmem init/cleanup functions
Message-ID: <20190616180633.GS22737@tuxbook-pro>
References: <20190616132930.6942-1-masneyb@onstation.org>
 <20190616132930.6942-7-masneyb@onstation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190616132930.6942-7-masneyb@onstation.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun 16 Jun 06:29 PDT 2019, Brian Masney wrote:

> The files a3xx_gpu.c and a4xx_gpu.c have ifdefs for the OCMEM support
> that was missing upstream. Add two new functions (adreno_gpu_ocmem_init
> and adreno_gpu_ocmem_cleanup) that removes some duplicated code. We also
> need to change the ifdef check for CONFIG_MSM_OCMEM to CONFIG_QCOM_OCMEM
> now that OCMEM support is upstream.
> 
> Signed-off-by: Brian Masney <masneyb@onstation.org>
> ---
>  drivers/gpu/drm/msm/adreno/a3xx_gpu.c   | 33 +++++++-------------
>  drivers/gpu/drm/msm/adreno/a3xx_gpu.h   |  3 +-
>  drivers/gpu/drm/msm/adreno/a4xx_gpu.c   | 30 ++++++------------
>  drivers/gpu/drm/msm/adreno/a4xx_gpu.h   |  3 +-
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 41 +++++++++++++++++++++++++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h | 10 ++++++
>  6 files changed, 74 insertions(+), 46 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
> index c3b4bc6e4155..72720bb2aca1 100644
> --- a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
> @@ -17,10 +17,6 @@
>   * this program.  If not, see <http://www.gnu.org/licenses/>.
>   */
>  
> -#ifdef CONFIG_MSM_OCMEM
> -#  include <mach/ocmem.h>
> -#endif
> -
>  #include "a3xx_gpu.h"
>  
>  #define A3XX_INT0_MASK \
> @@ -206,9 +202,9 @@ static int a3xx_hw_init(struct msm_gpu *gpu)
>  		gpu_write(gpu, REG_A3XX_RBBM_GPR0_CTL, 0x00000000);
>  
>  	/* Set the OCMEM base address for A330, etc */
> -	if (a3xx_gpu->ocmem_hdl) {
> +	if (a3xx_gpu->ocmem.hdl) {
>  		gpu_write(gpu, REG_A3XX_RB_GMEM_BASE_ADDR,
> -			(unsigned int)(a3xx_gpu->ocmem_base >> 14));
> +			(unsigned int)(a3xx_gpu->ocmem.base >> 14));

This blindly requires that the ocmem allocator will return entries
allocated to 16kB. Please ensure that a future implementation of the
actual ocmem allocator maintains this (comments? checks?). 

>  	}
>  
>  	/* Turn on performance counters: */
> @@ -329,10 +325,7 @@ static void a3xx_destroy(struct msm_gpu *gpu)
>  
>  	adreno_gpu_cleanup(adreno_gpu);
>  
> -#ifdef CONFIG_MSM_OCMEM
> -	if (a3xx_gpu->ocmem_base)
> -		ocmem_free(OCMEM_GRAPHICS, a3xx_gpu->ocmem_hdl);
> -#endif
> +	adreno_gpu_ocmem_cleanup(&a3xx_gpu->ocmem);
>  
>  	kfree(a3xx_gpu);
>  }
> @@ -507,17 +500,10 @@ struct msm_gpu *a3xx_gpu_init(struct drm_device *dev)
>  
>  	/* if needed, allocate gmem: */
>  	if (adreno_is_a330(adreno_gpu)) {
> -#ifdef CONFIG_MSM_OCMEM
> -		/* TODO this is different/missing upstream: */
> -		struct ocmem_buf *ocmem_hdl =
> -				ocmem_allocate(OCMEM_GRAPHICS, adreno_gpu->gmem);
> -
> -		a3xx_gpu->ocmem_hdl = ocmem_hdl;
> -		a3xx_gpu->ocmem_base = ocmem_hdl->addr;
> -		adreno_gpu->gmem = ocmem_hdl->len;
> -		DBG("using %dK of OCMEM at 0x%08x", adreno_gpu->gmem / 1024,
> -				a3xx_gpu->ocmem_base);
> -#endif
> +		ret = adreno_gpu_ocmem_init(&adreno_gpu->base.pdev->dev,
> +					    adreno_gpu, &a3xx_gpu->ocmem);
> +		if (ret)
> +			goto fail;
>  	}
>  
>  	if (!gpu->aspace) {
> @@ -530,11 +516,14 @@ struct msm_gpu *a3xx_gpu_init(struct drm_device *dev)
>  		 */
>  		DRM_DEV_ERROR(dev->dev, "No memory protection without IOMMU\n");
>  		ret = -ENXIO;
> -		goto fail;
> +		goto fail_cleanup_ocmem;
>  	}
>  
>  	return gpu;
>  
> +fail_cleanup_ocmem:
> +	adreno_gpu_ocmem_cleanup(&a3xx_gpu->ocmem);
> +
>  fail:
>  	if (a3xx_gpu)
>  		a3xx_destroy(&a3xx_gpu->base.base);
> diff --git a/drivers/gpu/drm/msm/adreno/a3xx_gpu.h b/drivers/gpu/drm/msm/adreno/a3xx_gpu.h
> index ab60dc9e344e..727c34f38f9e 100644
> --- a/drivers/gpu/drm/msm/adreno/a3xx_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/a3xx_gpu.h
> @@ -30,8 +30,7 @@ struct a3xx_gpu {
>  	struct adreno_gpu base;
>  
>  	/* if OCMEM is used for GMEM: */
> -	uint32_t ocmem_base;
> -	void *ocmem_hdl;
> +	struct adreno_ocmem ocmem;
>  };
>  #define to_a3xx_gpu(x) container_of(x, struct a3xx_gpu, base)
>  
> diff --git a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
> index ab2b752566d8..b8f825107796 100644
> --- a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
> @@ -2,9 +2,6 @@
>  /* Copyright (c) 2014 The Linux Foundation. All rights reserved.
>   */
>  #include "a4xx_gpu.h"
> -#ifdef CONFIG_MSM_OCMEM
> -#  include <soc/qcom/ocmem.h>
> -#endif
>  
>  #define A4XX_INT0_MASK \
>  	(A4XX_INT0_RBBM_AHB_ERROR |        \
> @@ -188,7 +185,7 @@ static int a4xx_hw_init(struct msm_gpu *gpu)
>  			(1 << 30) | 0xFFFF);
>  
>  	gpu_write(gpu, REG_A4XX_RB_GMEM_BASE_ADDR,
> -			(unsigned int)(a4xx_gpu->ocmem_base >> 14));
> +			(unsigned int)(a4xx_gpu->ocmem.base >> 14));
>  
>  	/* Turn on performance counters: */
>  	gpu_write(gpu, REG_A4XX_RBBM_PERFCTR_CTL, 0x01);
> @@ -318,10 +315,7 @@ static void a4xx_destroy(struct msm_gpu *gpu)
>  
>  	adreno_gpu_cleanup(adreno_gpu);
>  
> -#ifdef CONFIG_MSM_OCMEM
> -	if (a4xx_gpu->ocmem_base)
> -		ocmem_free(OCMEM_GRAPHICS, a4xx_gpu->ocmem_hdl);
> -#endif
> +	adreno_gpu_ocmem_cleanup(&a4xx_gpu->ocmem);
>  
>  	kfree(a4xx_gpu);
>  }
> @@ -578,17 +572,10 @@ struct msm_gpu *a4xx_gpu_init(struct drm_device *dev)
>  
>  	/* if needed, allocate gmem: */
>  	if (adreno_is_a4xx(adreno_gpu)) {
> -#ifdef CONFIG_MSM_OCMEM
> -		/* TODO this is different/missing upstream: */
> -		struct ocmem_buf *ocmem_hdl =
> -				ocmem_allocate(OCMEM_GRAPHICS, adreno_gpu->gmem);
> -
> -		a4xx_gpu->ocmem_hdl = ocmem_hdl;
> -		a4xx_gpu->ocmem_base = ocmem_hdl->addr;
> -		adreno_gpu->gmem = ocmem_hdl->len;
> -		DBG("using %dK of OCMEM at 0x%08x", adreno_gpu->gmem / 1024,
> -				a4xx_gpu->ocmem_base);
> -#endif
> +		ret = adreno_gpu_ocmem_init(dev->dev, adreno_gpu,
> +					    &a4xx_gpu->ocmem);
> +		if (ret)
> +			goto fail;
>  	}
>  
>  	if (!gpu->aspace) {
> @@ -601,11 +588,14 @@ struct msm_gpu *a4xx_gpu_init(struct drm_device *dev)
>  		 */
>  		DRM_DEV_ERROR(dev->dev, "No memory protection without IOMMU\n");
>  		ret = -ENXIO;
> -		goto fail;
> +		goto fail_cleanup_ocmem;
>  	}
>  
>  	return gpu;
>  
> +fail_cleanup_ocmem:
> +	adreno_gpu_ocmem_cleanup(&a4xx_gpu->ocmem);
> +
>  fail:
>  	if (a4xx_gpu)
>  		a4xx_destroy(&a4xx_gpu->base.base);
> diff --git a/drivers/gpu/drm/msm/adreno/a4xx_gpu.h b/drivers/gpu/drm/msm/adreno/a4xx_gpu.h
> index d506311ee240..a01448cba2ea 100644
> --- a/drivers/gpu/drm/msm/adreno/a4xx_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/a4xx_gpu.h
> @@ -16,8 +16,7 @@ struct a4xx_gpu {
>  	struct adreno_gpu base;
>  
>  	/* if OCMEM is used for GMEM: */
> -	uint32_t ocmem_base;
> -	void *ocmem_hdl;
> +	struct adreno_ocmem ocmem;
>  };
>  #define to_a4xx_gpu(x) container_of(x, struct a4xx_gpu, base)
>  
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index 6f7f4114afcf..e0a9409c8a32 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -29,6 +29,10 @@
>  #include "msm_gem.h"
>  #include "msm_mmu.h"
>  
> +#ifdef CONFIG_QCOM_OCMEM
> +#  include <soc/qcom/ocmem.h>
> +#endif

This file exists (after the previous patch), so no need to make its
inclusion conditional.

> +
>  static bool zap_available = true;
>  
>  static int zap_shader_load_mdt(struct msm_gpu *gpu, const char *fwname,
> @@ -897,6 +901,43 @@ static int adreno_get_pwrlevels(struct device *dev,
>  	return 0;
>  }
>  
> +int adreno_gpu_ocmem_init(struct device *dev, struct adreno_gpu *adreno_gpu,
> +			  struct adreno_ocmem *adreno_ocmem)
> +{
> +#ifdef CONFIG_QCOM_OCMEM

No need to make this conditional.

> +	struct ocmem_buf *ocmem_hdl;
> +	struct ocmem *ocmem;
> +
> +	ocmem = of_get_ocmem(dev);
> +	if (!ocmem) {
> +		/* This is an optional property so return success. */
> +		return 0;
> +	}
> +
> +	ocmem_hdl = ocmem_allocate(ocmem, OCMEM_GRAPHICS, adreno_gpu->gmem);
> +	if (IS_ERR(ocmem_hdl))
> +		return PTR_ERR(ocmem_hdl);
> +
> +	adreno_ocmem->ocmem = ocmem;
> +	adreno_ocmem->base = ocmem_hdl->addr;
> +	adreno_ocmem->hdl = ocmem_hdl;
> +	adreno_gpu->gmem = ocmem_hdl->len;
> +	DBG("using %dK of OCMEM at 0x%08x", adreno_gpu->gmem / 1024,
> +	    adreno_ocmem->base);
> +#endif
> +
> +	return 0;
> +}
> +
> +void adreno_gpu_ocmem_cleanup(struct adreno_ocmem *adreno_ocmem)
> +{
> +#ifdef CONFIG_QCOM_OCMEM
> +	if (adreno_ocmem->base)

It would be nice to have ocmem_free() accept NULL, similar to kfree() et
al.

> +		ocmem_free(adreno_ocmem->ocmem, OCMEM_GRAPHICS,
> +			   adreno_ocmem->hdl);
> +#endif
> +}
> +
>  int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>  		struct adreno_gpu *adreno_gpu,
>  		const struct adreno_gpu_funcs *funcs, int nr_rings)
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index 0925606ec9b5..1cd11570323b 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -136,6 +136,12 @@ struct adreno_gpu {
>  };
>  #define to_adreno_gpu(x) container_of(x, struct adreno_gpu, base)
>  
> +struct adreno_ocmem {
> +	struct ocmem *ocmem;
> +	uint32_t base;

By ocmem being physically fixed this is sufficient, but unsigned long is
a nicer type for carrying memory addresses.

Regards,
Bjorn

> +	void *hdl;
> +};
> +
>  /* platform config data (ie. from DT, or pdata) */
>  struct adreno_platform_config {
>  	struct adreno_rev rev;
> @@ -241,6 +247,10 @@ void adreno_dump(struct msm_gpu *gpu);
>  void adreno_wait_ring(struct msm_ringbuffer *ring, uint32_t ndwords);
>  struct msm_ringbuffer *adreno_active_ring(struct msm_gpu *gpu);
>  
> +int adreno_gpu_ocmem_init(struct device *dev, struct adreno_gpu *adreno_gpu,
> +			  struct adreno_ocmem *ocmem);
> +void adreno_gpu_ocmem_cleanup(struct adreno_ocmem *ocmem);
> +
>  int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>  		struct adreno_gpu *gpu, const struct adreno_gpu_funcs *funcs,
>  		int nr_rings);
> -- 
> 2.20.1
> 
