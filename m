Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 041434C09F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2019 20:15:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729670AbfFSSPe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Jun 2019 14:15:34 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:38980 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726197AbfFSSPe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Jun 2019 14:15:34 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 06BEA609D4; Wed, 19 Jun 2019 18:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1560968132;
        bh=m+jhB6capUsffdvv9hXxYT4fdNrNak+XzVzEYa3hStE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Gb99iCF6QWyNwRR+3An1xtp+k0r5/S+Dca4sg7TvFwzs76Bai43P6kosZB6z+XIcH
         Gkf+bQY+75800FndQXKRALFkRBZ6DJsQX+RODyLqkJVjAsNWuBWOP9kgMlgxs5rLaT
         krlbZ+8NAFzQiNQkdMgK3V7S8WM6XY8CU0f0Uf6I=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 82866602A9;
        Wed, 19 Jun 2019 18:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1560968129;
        bh=m+jhB6capUsffdvv9hXxYT4fdNrNak+XzVzEYa3hStE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UxVqLj3qKpPJin3/aVggwzCNLbqpCWWNRS1LH+KXq5hVmSPuvzCdZIDHw/9eGX+s2
         hzupxA415ZyRKLC8em+SwfUdEWE8N2p/ly9Ylyp5Vd9LY5lPDFN6gWA8K0NanXdyMh
         9sGf+OAPK5w54Gq4KaUzSfKGRYAAjJmfwg9QTnV0=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 82866602A9
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date:   Wed, 19 Jun 2019 12:15:26 -0600
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     Brian Masney <masneyb@onstation.org>
Cc:     agross@kernel.org, david.brown@linaro.org, robdclark@gmail.com,
        sean@poorly.run, robh+dt@kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org, jonathan@marek.ca, airlied@linux.ie,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
        daniel@ffwll.ch, freedreno@lists.freedesktop.org
Subject: Re: [Freedreno] [PATCH 6/6] drm/msm/gpu: add ocmem init/cleanup
 functions
Message-ID: <20190619181526.GC17590@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Brian Masney <masneyb@onstation.org>, agross@kernel.org,
        david.brown@linaro.org, robdclark@gmail.com, sean@poorly.run,
        robh+dt@kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org, jonathan@marek.ca, airlied@linux.ie,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
        daniel@ffwll.ch, freedreno@lists.freedesktop.org
References: <20190616132930.6942-1-masneyb@onstation.org>
 <20190616132930.6942-7-masneyb@onstation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190616132930.6942-7-masneyb@onstation.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Jun 16, 2019 at 09:29:30AM -0400, Brian Masney wrote:
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

a3xx_destroy is going to have to be able to cleanup the ocmem anyway, so you
might as well stick it in there instead of having a second goto label.

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

And same.

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

You won't need a ifdef here if the rest of the support is merged too.

> +#  include <soc/qcom/ocmem.h>
> +#endif
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

Same. It should be assumed that the generic ocmem functions will be properly
stubbed. I suppose you have an argument for wanting to not compile in this
extra code if it isn't needed, but if so you'll want to #ifdef the entire
function(s) and use stubs in the include file instead.

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

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
