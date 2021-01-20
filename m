Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B08F12FD059
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Jan 2021 13:58:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388579AbhATMiL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Jan 2021 07:38:11 -0500
Received: from relay01.th.seeweb.it ([5.144.164.162]:47413 "EHLO
        relay01.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388802AbhATLFQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Jan 2021 06:05:16 -0500
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id B0A541F648;
        Wed, 20 Jan 2021 12:04:17 +0100 (CET)
Subject: Re: [PATCH 2/2] drm/msm/a6xx: Create an A6XX GPU specific address
 space
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     linux-arm-msm@vger.kernel.org,
        freedreno <freedreno@lists.freedesktop.org>,
        linux-kernel@vger.kernel.org,
        Kristian H Kristensen <hoegsberg@google.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>
References: <cover.1610366113.git.saiprakash.ranjan@codeaurora.org>
 <c5848b1c15765c8d6db7de2305baac856e818f12.1610366113.git.saiprakash.ranjan@codeaurora.org>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Message-ID: <1120efd2-151b-4643-9a57-c15c46ab6e16@somainline.org>
Date:   Wed, 20 Jan 2021 12:04:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <c5848b1c15765c8d6db7de2305baac856e818f12.1610366113.git.saiprakash.ranjan@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Il 11/01/21 13:04, Sai Prakash Ranjan ha scritto:
> A6XX GPUs have support for last level cache(LLC) also known
> as system cache and need to set the bus attributes to
> use it. Currently we use a generic adreno iommu address space
> implementation which are also used by older GPU generations
> which do not have LLC and might introduce issues accidentally
> and is not clean in a way that anymore additions of GPUs
> supporting LLC would have to be guarded under ifdefs. So keep
> the generic code separate and make the address space creation
> A6XX specific. We also have a helper to set the llc attributes
> so that if the newer GPU generations do support them, we can
> use it instead of open coding domain attribute setting for each
> GPU.
> 

Hello!

> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 46 ++++++++++++++++++++++++-
>   drivers/gpu/drm/msm/adreno/adreno_gpu.c | 23 +++++--------
>   drivers/gpu/drm/msm/adreno/adreno_gpu.h |  7 ++--
>   3 files changed, 55 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 3b798e883f82..3c7ad51732bb 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1239,6 +1239,50 @@ static unsigned long a6xx_gpu_busy(struct msm_gpu *gpu)
>   	return (unsigned long)busy_time;
>   }
>   
> +static struct msm_gem_address_space *
> +a6xx_create_address_space(struct msm_gpu *gpu, struct platform_device *pdev)
> +{
> +	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> +	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> +	struct iommu_domain *iommu;
> +	struct msm_mmu *mmu;
> +	struct msm_gem_address_space *aspace;
> +	u64 start, size;
> +
> +	iommu = iommu_domain_alloc(&platform_bus_type);
> +	if (!iommu)
> +		return NULL;
> +
> +	/*
> +	 * This allows GPU to set the bus attributes required to use system
> +	 * cache on behalf of the iommu page table walker.
> +	 */
> +	if (!IS_ERR_OR_NULL(a6xx_gpu->htw_llc_slice))
> +		adreno_set_llc_attributes(iommu);
> +
> +	mmu = msm_iommu_new(&pdev->dev, iommu);
> +	if (IS_ERR(mmu)) {
> +		iommu_domain_free(iommu);
> +		return ERR_CAST(mmu);
> +	}
> +
> +	/*
> +	 * Use the aperture start or SZ_16M, whichever is greater. This will
> +	 * ensure that we align with the allocated pagetable range while still
> +	 * allowing room in the lower 32 bits for GMEM and whatnot
> +	 */
> +	start = max_t(u64, SZ_16M, iommu->geometry.aperture_start);
> +	size = iommu->geometry.aperture_end - start + 1;
> +
> +	aspace = msm_gem_address_space_create(mmu, "gpu",
> +		start & GENMASK_ULL(48, 0), size);
> +
> +	if (IS_ERR(aspace) && !IS_ERR(mmu))
> +		mmu->funcs->destroy(mmu);
> +
> +	return aspace;
> +}
> +

I get what you're trying to do - yes the intentions are good, however...
you are effectively duplicating code 1:1, as this *is* the same as
function adreno_iommu_create_address_space.

I don't see adding two lines to a function as a valid justification to
duplicate all the rest: perhaps, you may want to find another way to do
this;

Here's one of the many ideas, perhaps you could:
1. Introduce a "generic feature" to signal LLCC support (perhaps in
    struct adreno_info ?)
2. If LLCC is supported, and LLCC slices are initialized, set the LLCC
    attributes on the IOMMU. Of course this would mean passing the init
    state of the slices (maybe just a bool would be fine) back to the
    generic adreno_gpu.c

This, unless you tell me that the entire function is going to be a6xx
specific, but that doesn't seem to be the case at all.

Concerns are that when an hypotetical Adreno A7XX comes and perhaps also
uses the LLCC slices, this function will be duplicated yet another time.

>   static struct msm_gem_address_space *
>   a6xx_create_private_address_space(struct msm_gpu *gpu)
>   {
> @@ -1285,7 +1329,7 @@ static const struct adreno_gpu_funcs funcs = {
>   		.gpu_state_get = a6xx_gpu_state_get,
>   		.gpu_state_put = a6xx_gpu_state_put,
>   #endif
> -		.create_address_space = adreno_iommu_create_address_space,
> +		.create_address_space = a6xx_create_address_space,
>   		.create_private_address_space = a6xx_create_private_address_space,
>   		.get_rptr = a6xx_get_rptr,
>   	},
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index b35914de1b27..0f184c3dd9d9 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -186,11 +186,18 @@ int adreno_zap_shader_load(struct msm_gpu *gpu, u32 pasid)
>   	return zap_shader_load_mdt(gpu, adreno_gpu->info->zapfw, pasid);
>   }
>   
> +void adreno_set_llc_attributes(struct iommu_domain *iommu)

Since this function is relative to the iommu part of this driver, I
think that it would be appropriate to give it the same prefix as all
the other functions that are "working in this context".
Hint: adreno_iommu_set_llc_attributes
Alternatively, this two lines function may just be a static inline in
the header....


But then, what are we talking about, here?
Since you should stop code duplication and bring everything back in
here (in a generic way!!!), then this helper would be of no use, at all,
because then you would be just "throwing" these two lines back in the
function adreno_iommu_create_address_space....


> +{
> +	struct io_pgtable_domain_attr pgtbl_cfg;
> +
> +	pgtbl_cfg.quirks = IO_PGTABLE_QUIRK_ARM_OUTER_WBWA;
> +	iommu_domain_set_attr(iommu, DOMAIN_ATTR_IO_PGTABLE_CFG, &pgtbl_cfg);
> +}
> +
>   struct msm_gem_address_space *
>   adreno_iommu_create_address_space(struct msm_gpu *gpu,
>   		struct platform_device *pdev)
>   {
> -	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>   	struct iommu_domain *iommu;
>   	struct msm_mmu *mmu;
>   	struct msm_gem_address_space *aspace;
> @@ -200,20 +207,6 @@ adreno_iommu_create_address_space(struct msm_gpu *gpu,
>   	if (!iommu)
>   		return NULL;
>   
> -	if (adreno_is_a6xx(adreno_gpu)) {
> -		struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> -		struct io_pgtable_domain_attr pgtbl_cfg;
> -
> -		/*
> -		 * This allows GPU to set the bus attributes required to use system
> -		 * cache on behalf of the iommu page table walker.
> -		 */
> -		if (!IS_ERR_OR_NULL(a6xx_gpu->htw_llc_slice)) {
> -			pgtbl_cfg.quirks = IO_PGTABLE_QUIRK_ARM_OUTER_WBWA;
> -			iommu_domain_set_attr(iommu, DOMAIN_ATTR_IO_PGTABLE_CFG, &pgtbl_cfg);
> -		}
> -	}
> -
>   	mmu = msm_iommu_new(&pdev->dev, iommu);
>   	if (IS_ERR(mmu)) {
>   		iommu_domain_free(iommu);
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index b3d9a333591b..2a3d049b46b5 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -212,11 +212,6 @@ static inline int adreno_is_a540(struct adreno_gpu *gpu)
>   	return gpu->revn == 540;
>   }
>   
> -static inline bool adreno_is_a6xx(struct adreno_gpu *gpu)
> -{
> -	return ((gpu->revn < 700 && gpu->revn > 599));
> -}
> -
>   static inline int adreno_is_a618(struct adreno_gpu *gpu)
>   {
>          return gpu->revn == 618;
> @@ -278,6 +273,8 @@ struct msm_gem_address_space *
>   adreno_iommu_create_address_space(struct msm_gpu *gpu,
>   		struct platform_device *pdev);
>   
> +void adreno_set_llc_attributes(struct iommu_domain *iommu);
> +
>   /*
>    * For a5xx and a6xx targets load the zap shader that is used to pull the GPU
>    * out of secure mode
> 

Regards,
- Angelo
