Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9D9144DADF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Nov 2021 17:58:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234261AbhKKRB3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Nov 2021 12:01:29 -0500
Received: from so254-9.mailgun.net ([198.61.254.9]:20540 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229710AbhKKRB1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Nov 2021 12:01:27 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1636649918; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: From: References: Cc: To: Subject: MIME-Version: Date:
 Message-ID: Sender; bh=Fm+8CbAWSdAcP/8qZCXokIpOIPGShPhL8uLwQhrTmh8=; b=h2yy9UmzLTQJGN0GbnDqjVQUIyGMXZphw8fmAWYzfh2N7sdRF8pAWYIMI9UHLjfvJ71NKrqL
 qLvcGPjKcivSSFe2UClV7P9FMht7P2/al5VMg+BnS4Ket0gDMbQhJGsoKjWOpAUq3BFpLFu4
 KFWLE0e+DaSDo+mlhMywBSNQpGI=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 618d4bb01b212dbdbde1f31c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 11 Nov 2021 16:58:24
 GMT
Sender: akhilpo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9C41AC4360D; Thu, 11 Nov 2021 16:58:23 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
        version=3.4.0
Received: from [192.168.1.16] (unknown [117.210.184.103])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akhilpo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 158DFC4338F;
        Thu, 11 Nov 2021 16:58:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 158DFC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Message-ID: <ce362bf0-3fac-79d9-41c0-05920cdbbd9e@codeaurora.org>
Date:   Thu, 11 Nov 2021 22:28:16 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [PATCH 4/5] drm/msm: Handle fence rollover
Content-Language: en-US
To:     Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
References: <20211109181117.591148-1-robdclark@gmail.com>
 <20211109181117.591148-5-robdclark@gmail.com>
From:   Akhil P Oommen <akhilpo@codeaurora.org>
In-Reply-To: <20211109181117.591148-5-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/9/2021 11:41 PM, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Add some helpers for fence comparision, which handle rollover properly,
> and stop open coding fence seqno comparisions.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/gpu/drm/msm/msm_fence.h | 12 ++++++++++++
>   drivers/gpu/drm/msm/msm_gpu.c   |  6 +++---
>   drivers/gpu/drm/msm/msm_gpu.h   |  2 +-
>   3 files changed, 16 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_fence.h b/drivers/gpu/drm/msm/msm_fence.h
> index 4783db528bcc..17ee3822b423 100644
> --- a/drivers/gpu/drm/msm/msm_fence.h
> +++ b/drivers/gpu/drm/msm/msm_fence.h
> @@ -60,4 +60,16 @@ void msm_update_fence(struct msm_fence_context *fctx, uint32_t fence);
>   
>   struct dma_fence * msm_fence_alloc(struct msm_fence_context *fctx);
>   
> +static inline bool
> +fence_before(uint32_t a, uint32_t b)
> +{
> +   return (int32_t)(a - b) < 0;

This is good enough when a and b have close values. And that is a good 
assumption for KMD generated seqno.

Reviewed-by: Akhil P Oommen <akhilpo@codeaurora.org>

-Akhil.

> +}
> +
> +static inline bool
> +fence_after(uint32_t a, uint32_t b)
> +{
> +   return (int32_t)(a - b) > 0;
> +}
> +
>   #endif
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> index 13de1241d595..0f78c2615272 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -172,7 +172,7 @@ static void update_fences(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
>   
>   	spin_lock_irqsave(&ring->submit_lock, flags);
>   	list_for_each_entry(submit, &ring->submits, node) {
> -		if (submit->seqno > fence)
> +		if (fence_after(submit->seqno, fence))
>   			break;
>   
>   		msm_update_fence(submit->ring->fctx,
> @@ -509,7 +509,7 @@ static void hangcheck_handler(struct timer_list *t)
>   	if (fence != ring->hangcheck_fence) {
>   		/* some progress has been made.. ya! */
>   		ring->hangcheck_fence = fence;
> -	} else if (fence < ring->seqno) {
> +	} else if (fence_before(fence, ring->seqno)) {
>   		/* no progress and not done.. hung! */
>   		ring->hangcheck_fence = fence;
>   		DRM_DEV_ERROR(dev->dev, "%s: hangcheck detected gpu lockup rb %d!\n",
> @@ -523,7 +523,7 @@ static void hangcheck_handler(struct timer_list *t)
>   	}
>   
>   	/* if still more pending work, reset the hangcheck timer: */
> -	if (ring->seqno > ring->hangcheck_fence)
> +	if (fence_after(ring->seqno, ring->hangcheck_fence))
>   		hangcheck_timer_reset(gpu);
>   
>   	/* workaround for missing irq: */
> diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
> index 0dcc31c27ac3..bd4e0024033e 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.h
> +++ b/drivers/gpu/drm/msm/msm_gpu.h
> @@ -258,7 +258,7 @@ static inline bool msm_gpu_active(struct msm_gpu *gpu)
>   	for (i = 0; i < gpu->nr_rings; i++) {
>   		struct msm_ringbuffer *ring = gpu->rb[i];
>   
> -		if (ring->seqno > ring->memptrs->fence)
> +		if (fence_after(ring->seqno, ring->memptrs->fence))
>   			return true;
>   	}
>   
> 

