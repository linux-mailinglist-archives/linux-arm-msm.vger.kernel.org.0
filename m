Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C554F24747D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Aug 2020 21:10:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730806AbgHQTKf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Aug 2020 15:10:35 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:25748 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730749AbgHQPlg (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Aug 2020 11:41:36 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1597678895; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=VYK3lYSXyLSuNZtDJEqONO4W2R+VnVrEGPnXZiROXgU=; b=Q4yxLyW83bPdT01EQHDBoryHp5QbtnZqQAfOnuKKSAz/e2xsVRlTY6p6OM6e0yPz0I27dEJv
 qkHlVly3Z+M+QCEBSAeK/5MWX+V3+Nfx68aGqTDJBgPD+ueqX+nE5l46hkdIp2ZN7eS9EXrT
 Fm3sCgZoUkDU1o1R/anopTTHKfQ=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n10.prod.us-east-1.postgun.com with SMTP id
 5f3aa50b61f1d41834b5419c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 17 Aug 2020 15:40:59
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id AE41FC433B2; Mon, 17 Aug 2020 15:40:58 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=2.0 tests=ALL_TRUSTED,NICE_REPLY_A,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.1.7] (unknown [117.217.239.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akhilpo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7AE34C43391;
        Mon, 17 Aug 2020 15:40:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7AE34C43391
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akhilpo@codeaurora.org
Subject: Re: [PATCH 16/19] drm/msm/a6xx: Add support for per-instance
 pagetables
To:     Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org,
        iommu@lists.linux-foundation.org, linux-arm-msm@vger.kernel.org
Cc:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Will Deacon <will@kernel.org>, freedreno@lists.freedesktop.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
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
        Jonathan Marek <jonathan@marek.ca>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Eric Anholt <eric@anholt.net>,
        open list <linux-kernel@vger.kernel.org>
References: <20200810222657.1841322-1-jcrouse@codeaurora.org>
 <20200814024114.1177553-17-robdclark@gmail.com>
From:   Akhil P Oommen <akhilpo@codeaurora.org>
Message-ID: <7c130df7-c7f4-8694-c7be-ce3debe01662@codeaurora.org>
Date:   Mon, 17 Aug 2020 21:10:46 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200814024114.1177553-17-robdclark@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 8/14/2020 8:11 AM, Rob Clark wrote:
> From: Jordan Crouse <jcrouse@codeaurora.org>
> 
> Add support for using per-instance pagetables if all the dependencies are
> available.
> 
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 70 +++++++++++++++++++++++++++
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.h |  1 +
>   drivers/gpu/drm/msm/msm_ringbuffer.h  |  1 +
>   3 files changed, 72 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 5eabb0109577..9653ac9b3cb8 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -81,6 +81,56 @@ static void get_stats_counter(struct msm_ringbuffer *ring, u32 counter,
>   	OUT_RING(ring, upper_32_bits(iova));
>   }
>   
> +static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
> +		struct msm_ringbuffer *ring, struct msm_file_private *ctx)
> +{
> +	phys_addr_t ttbr;
> +	u32 asid;
> +	u64 memptr = rbmemptr(ring, ttbr0);
> +
> +	if (ctx == a6xx_gpu->cur_ctx)
> +		return;
> +
> +	if (msm_iommu_pagetable_params(ctx->aspace->mmu, &ttbr, &asid))
> +		return;
> +
> +	/* Execute the table update */
> +	OUT_PKT7(ring, CP_SMMU_TABLE_UPDATE, 4);
> +	OUT_RING(ring, CP_SMMU_TABLE_UPDATE_0_TTBR0_LO(lower_32_bits(ttbr)));
> +
> +	/*
> +	 * For now ignore the asid since the smmu driver uses a TLBIASID to
> +	 * flush the TLB when we use iommu_flush_tlb_all() and the smmu driver
> +	 * isn't aware that the asid changed.  Instead, keep the default asid
> +	 * (0, same as the context bank) to make sure the TLB is properly
> +	 * flushed.
> +	 */
> +	OUT_RING(ring,
> +		CP_SMMU_TABLE_UPDATE_1_TTBR0_HI(upper_32_bits(ttbr)) |
> +		CP_SMMU_TABLE_UPDATE_1_ASID(0));
> +	OUT_RING(ring, CP_SMMU_TABLE_UPDATE_2_CONTEXTIDR(0));
> +	OUT_RING(ring, CP_SMMU_TABLE_UPDATE_3_CONTEXTBANK(0));
> +
> +	/*
> +	 * Write the new TTBR0 to the memstore. This is good for debugging.
> +	 */
> +	OUT_PKT7(ring, CP_MEM_WRITE, 4);
> +	OUT_RING(ring, CP_MEM_WRITE_0_ADDR_LO(lower_32_bits(memptr)));
> +	OUT_RING(ring, CP_MEM_WRITE_1_ADDR_HI(upper_32_bits(memptr)));
> +	OUT_RING(ring, lower_32_bits(ttbr));
> +	OUT_RING(ring, (0 << 16) | upper_32_bits(ttbr));
why (0 << 16) is required here?
> +
> +	/*
> +	 * And finally, trigger a uche flush to be sure there isn't anything
> +	 * lingering in that part of the GPU
> +	 */
> +
> +	OUT_PKT7(ring, CP_EVENT_WRITE, 1);
> +	OUT_RING(ring, 0x31);
This may be unnecessary, but no harm in keeping it. SMMU_TABLE_UPDATE is 
supposed to do a UCHE flush.

-Akhil
> +
> +	a6xx_gpu->cur_ctx = ctx;
> +}
> +
>   static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>   {
>   	unsigned int index = submit->seqno % MSM_GPU_SUBMIT_STATS_COUNT;
> @@ -90,6 +140,8 @@ static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>   	struct msm_ringbuffer *ring = submit->ring;
>   	unsigned int i;
>   
> +	a6xx_set_pagetable(a6xx_gpu, ring, submit->queue->ctx);
> +
>   	get_stats_counter(ring, REG_A6XX_RBBM_PERFCTR_CP_0_LO,
>   		rbmemptr_stats(ring, index, cpcycles_start));
>   
> @@ -696,6 +748,8 @@ static int a6xx_hw_init(struct msm_gpu *gpu)
>   	/* Always come up on rb 0 */
>   	a6xx_gpu->cur_ring = gpu->rb[0];
>   
> +	a6xx_gpu->cur_ctx = NULL;
> +
>   	/* Enable the SQE_to start the CP engine */
>   	gpu_write(gpu, REG_A6XX_CP_SQE_CNTL, 1);
>   
> @@ -1008,6 +1062,21 @@ static unsigned long a6xx_gpu_busy(struct msm_gpu *gpu)
>   	return (unsigned long)busy_time;
>   }
>   
> +static struct msm_gem_address_space *
> +a6xx_create_private_address_space(struct msm_gpu *gpu)
> +{
> +	struct msm_gem_address_space *aspace = NULL;
> +	struct msm_mmu *mmu;
> +
> +	mmu = msm_iommu_pagetable_create(gpu->aspace->mmu);
> +
> +	if (!IS_ERR(mmu))
> +		aspace = msm_gem_address_space_create(mmu,
> +			"gpu", 0x100000000ULL, 0x1ffffffffULL);
> +
> +	return aspace;
> +}
> +
>   static const struct adreno_gpu_funcs funcs = {
>   	.base = {
>   		.get_param = adreno_get_param,
> @@ -1031,6 +1100,7 @@ static const struct adreno_gpu_funcs funcs = {
>   		.gpu_state_put = a6xx_gpu_state_put,
>   #endif
>   		.create_address_space = adreno_iommu_create_address_space,
> +		.create_private_address_space = a6xx_create_private_address_space,
>   	},
>   	.get_timestamp = a6xx_get_timestamp,
>   };
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> index 03ba60d5b07f..da22d7549d9b 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> @@ -19,6 +19,7 @@ struct a6xx_gpu {
>   	uint64_t sqe_iova;
>   
>   	struct msm_ringbuffer *cur_ring;
> +	struct msm_file_private *cur_ctx;
>   
>   	struct a6xx_gmu gmu;
>   };
> diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.h b/drivers/gpu/drm/msm/msm_ringbuffer.h
> index 7764373d0ed2..0987d6bf848c 100644
> --- a/drivers/gpu/drm/msm/msm_ringbuffer.h
> +++ b/drivers/gpu/drm/msm/msm_ringbuffer.h
> @@ -31,6 +31,7 @@ struct msm_rbmemptrs {
>   	volatile uint32_t fence;
>   
>   	volatile struct msm_gpu_submit_stats stats[MSM_GPU_SUBMIT_STATS_COUNT];
> +	volatile u64 ttbr0;
>   };
>   
>   struct msm_ringbuffer {
> 

