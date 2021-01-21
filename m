Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 220772FE2CC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Jan 2021 07:27:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727075AbhAUG0U (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Jan 2021 01:26:20 -0500
Received: from a1.mail.mailgun.net ([198.61.254.60]:39403 "EHLO
        a1.mail.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727035AbhAUG0I (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Jan 2021 01:26:08 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1611210344; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=pJq/ux+uNougAFTA98Ujww3oEURPxlPExUtHDMCMge8=;
 b=vMJ2VWd1wiuyCM+boSyJZiUF6A7QPqpXPJZv2VGyEZ3GKfmo/FTSKeCawLz2YQQcWfGNgTb/
 PMsla6rjJFy7RB5I2uilGYkzSoUGsCGGwJtMIBwBfQ6l/62d/6bQY6vDy6Yyn84/aGbHR+0A
 nAW/kX0G/bb5nhm65x/rCBKtKqA=
X-Mailgun-Sending-Ip: 198.61.254.60
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 60091e4abeacd1a252c1389b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 21 Jan 2021 06:25:13
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D9A25C43469; Thu, 21 Jan 2021 06:25:12 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 38338C43462;
        Thu, 21 Jan 2021 06:25:11 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 21 Jan 2021 11:55:11 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Cc:     Rob Clark <robdclark@gmail.com>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-arm-msm@vger.kernel.org,
        freedreno <freedreno@lists.freedesktop.org>,
        linux-kernel@vger.kernel.org,
        Kristian H Kristensen <hoegsberg@google.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 2/2] drm/msm/a6xx: Create an A6XX GPU specific address
 space
In-Reply-To: <1120efd2-151b-4643-9a57-c15c46ab6e16@somainline.org>
References: <cover.1610366113.git.saiprakash.ranjan@codeaurora.org>
 <c5848b1c15765c8d6db7de2305baac856e818f12.1610366113.git.saiprakash.ranjan@codeaurora.org>
 <1120efd2-151b-4643-9a57-c15c46ab6e16@somainline.org>
Message-ID: <fa15ea8d634bad2f7ec1654416fc5776@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Angelo,

On 2021-01-20 16:34, AngeloGioacchino Del Regno wrote:
> Il 11/01/21 13:04, Sai Prakash Ranjan ha scritto:
>> A6XX GPUs have support for last level cache(LLC) also known
>> as system cache and need to set the bus attributes to
>> use it. Currently we use a generic adreno iommu address space
>> implementation which are also used by older GPU generations
>> which do not have LLC and might introduce issues accidentally
>> and is not clean in a way that anymore additions of GPUs
>> supporting LLC would have to be guarded under ifdefs. So keep
>> the generic code separate and make the address space creation
>> A6XX specific. We also have a helper to set the llc attributes
>> so that if the newer GPU generations do support them, we can
>> use it instead of open coding domain attribute setting for each
>> GPU.
>> 
> 
> Hello!
> 
>> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>> ---
>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 46 
>> ++++++++++++++++++++++++-
>>   drivers/gpu/drm/msm/adreno/adreno_gpu.c | 23 +++++--------
>>   drivers/gpu/drm/msm/adreno/adreno_gpu.h |  7 ++--
>>   3 files changed, 55 insertions(+), 21 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c 
>> b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> index 3b798e883f82..3c7ad51732bb 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> @@ -1239,6 +1239,50 @@ static unsigned long a6xx_gpu_busy(struct 
>> msm_gpu *gpu)
>>   	return (unsigned long)busy_time;
>>   }
>>   +static struct msm_gem_address_space *
>> +a6xx_create_address_space(struct msm_gpu *gpu, struct platform_device 
>> *pdev)
>> +{
>> +	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>> +	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>> +	struct iommu_domain *iommu;
>> +	struct msm_mmu *mmu;
>> +	struct msm_gem_address_space *aspace;
>> +	u64 start, size;
>> +
>> +	iommu = iommu_domain_alloc(&platform_bus_type);
>> +	if (!iommu)
>> +		return NULL;
>> +
>> +	/*
>> +	 * This allows GPU to set the bus attributes required to use system
>> +	 * cache on behalf of the iommu page table walker.
>> +	 */
>> +	if (!IS_ERR_OR_NULL(a6xx_gpu->htw_llc_slice))
>> +		adreno_set_llc_attributes(iommu);
>> +
>> +	mmu = msm_iommu_new(&pdev->dev, iommu);
>> +	if (IS_ERR(mmu)) {
>> +		iommu_domain_free(iommu);
>> +		return ERR_CAST(mmu);
>> +	}
>> +
>> +	/*
>> +	 * Use the aperture start or SZ_16M, whichever is greater. This will
>> +	 * ensure that we align with the allocated pagetable range while 
>> still
>> +	 * allowing room in the lower 32 bits for GMEM and whatnot
>> +	 */
>> +	start = max_t(u64, SZ_16M, iommu->geometry.aperture_start);
>> +	size = iommu->geometry.aperture_end - start + 1;
>> +
>> +	aspace = msm_gem_address_space_create(mmu, "gpu",
>> +		start & GENMASK_ULL(48, 0), size);
>> +
>> +	if (IS_ERR(aspace) && !IS_ERR(mmu))
>> +		mmu->funcs->destroy(mmu);
>> +
>> +	return aspace;
>> +}
>> +
> 
> I get what you're trying to do - yes the intentions are good, 
> however...
> you are effectively duplicating code 1:1, as this *is* the same as
> function adreno_iommu_create_address_space.
> 
> I don't see adding two lines to a function as a valid justification to
> duplicate all the rest: perhaps, you may want to find another way to do
> this;
> 
> Here's one of the many ideas, perhaps you could:
> 1. Introduce a "generic feature" to signal LLCC support (perhaps in
>    struct adreno_info ?)
> 2. If LLCC is supported, and LLCC slices are initialized, set the LLCC
>    attributes on the IOMMU. Of course this would mean passing the init
>    state of the slices (maybe just a bool would be fine) back to the
>    generic adreno_gpu.c
> 
> This, unless you tell me that the entire function is going to be a6xx
> specific, but that doesn't seem to be the case at all.
> 
> Concerns are that when an hypotetical Adreno A7XX comes and perhaps 
> also
> uses the LLCC slices, this function will be duplicated yet another 
> time.
> 

As Rob mentioned in other reply, this was more of a point to not break
older gen gpus when we add some feature which is specific to a6xx.
So there are a{3,4,5}xx using adreno_iommu_create_address_space and
any addition to a6xx or let's say in future a7xx(assuming we do not
have its own address space impl and use this generic one), then all
these older gens need to be taken care of either via some conditions
and test on those so that they won't break. IMO, rather than keep
adding ifs in the generic code, it is better to have a separate
address space impl.

>>   static struct msm_gem_address_space *
>>   a6xx_create_private_address_space(struct msm_gpu *gpu)
>>   {
>> @@ -1285,7 +1329,7 @@ static const struct adreno_gpu_funcs funcs = {
>>   		.gpu_state_get = a6xx_gpu_state_get,
>>   		.gpu_state_put = a6xx_gpu_state_put,
>>   #endif
>> -		.create_address_space = adreno_iommu_create_address_space,
>> +		.create_address_space = a6xx_create_address_space,
>>   		.create_private_address_space = a6xx_create_private_address_space,
>>   		.get_rptr = a6xx_get_rptr,
>>   	},
>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c 
>> b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>> index b35914de1b27..0f184c3dd9d9 100644
>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>> @@ -186,11 +186,18 @@ int adreno_zap_shader_load(struct msm_gpu *gpu, 
>> u32 pasid)
>>   	return zap_shader_load_mdt(gpu, adreno_gpu->info->zapfw, pasid);
>>   }
>>   +void adreno_set_llc_attributes(struct iommu_domain *iommu)
> 
> Since this function is relative to the iommu part of this driver, I
> think that it would be appropriate to give it the same prefix as all
> the other functions that are "working in this context".
> Hint: adreno_iommu_set_llc_attributes

Yes, I will change the name to adreno_iommu_set_llc_attributes.

> Alternatively, this two lines function may just be a static inline in
> the header....
> 
> 
> But then, what are we talking about, here?
> Since you should stop code duplication and bring everything back in
> here (in a generic way!!!), then this helper would be of no use, at 
> all,
> because then you would be just "throwing" these two lines back in the
> function adreno_iommu_create_address_space....
> 
> 

See above reply. Thanks for taking a look.

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
