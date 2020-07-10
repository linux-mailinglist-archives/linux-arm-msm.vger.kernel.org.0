Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1977421BCC4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2020 20:04:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728248AbgGJSD7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Jul 2020 14:03:59 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:26807 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728129AbgGJSD4 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Jul 2020 14:03:56 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1594404235; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=ZQQMH0O09IKSJFL8FajJSP1V0zPU96pA8pCKynU0tJI=; b=RJF7a2RCUgZSKbzNFmvXjQfNkDrQCn6d/ukL/9+eXoP9BG1+xhAT9x5HLDGHX0uVG/6lv/aU
 msDPUOFumJI9Qgg4WPOIMJ+l5R7FPBhebxr43qym0tfQTimoFuwH0vSqmYmZ0vk9mMHgKJQa
 D2rqvyyrUvO6SFxRsr/a470ifoY=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n18.prod.us-west-2.postgun.com with SMTP id
 5f08ad5f512812c0706cbf6d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 10 Jul 2020 18:03:11
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 39A6AC43391; Fri, 10 Jul 2020 18:03:11 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1456EC433C8;
        Fri, 10 Jul 2020 18:03:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1456EC433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date:   Fri, 10 Jul 2020 12:03:04 -0600
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <freedreno@lists.freedesktop.org>,
        Jonathan Marek <jonathan@marek.ca>,
        David Airlie <airlied@linux.ie>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Eric Anholt <eric@anholt.net>,
        Ben Dooks <ben.dooks@codethink.co.uk>,
        Daniel Vetter <daniel@ffwll.ch>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Sean Paul <sean@poorly.run>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [Freedreno] [PATCH 2/2] drm/msm/adreno: un-open-code some packets
Message-ID: <20200710180304.GG21059@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
        dri-devel@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
        Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Eric Anholt <eric@anholt.net>,
        Ben Dooks <ben.dooks@codethink.co.uk>,
        Daniel Vetter <daniel@ffwll.ch>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Sean Paul <sean@poorly.run>,
        open list <linux-kernel@vger.kernel.org>
References: <20200707203529.2098979-1-robdclark@gmail.com>
 <20200707203529.2098979-3-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200707203529.2098979-3-robdclark@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jul 07, 2020 at 01:35:00PM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>

Might need a commit log here, but otherwise makes sense.

Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>

> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c |  5 +++--
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 11 +++++++----
>  2 files changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> index d95970a73fb4..7f4526b3283d 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> @@ -186,7 +186,8 @@ static void a5xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit,
>  	 * timestamp is written to the memory and then triggers the interrupt
>  	 */
>  	OUT_PKT7(ring, CP_EVENT_WRITE, 4);
> -	OUT_RING(ring, CACHE_FLUSH_TS | (1 << 31));
> +	OUT_RING(ring, CP_EVENT_WRITE_0_EVENT(CACHE_FLUSH_TS) |
> +		CP_EVENT_WRITE_0_IRQ);
>  	OUT_RING(ring, lower_32_bits(rbmemptr(ring, fence)));
>  	OUT_RING(ring, upper_32_bits(rbmemptr(ring, fence)));
>  	OUT_RING(ring, submit->seqno);
> @@ -730,7 +731,7 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
>  	 */
>  	if (adreno_is_a530(adreno_gpu)) {
>  		OUT_PKT7(gpu->rb[0], CP_EVENT_WRITE, 1);
> -		OUT_RING(gpu->rb[0], 0x0F);
> +		OUT_RING(gpu->rb[0], CP_EVENT_WRITE_0_EVENT(STAT_EVENT));
>  
>  		gpu->funcs->flush(gpu, gpu->rb[0]);
>  		if (!a5xx_idle(gpu, gpu->rb[0]))
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 7768557cdfb2..1ed325bea430 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -74,7 +74,9 @@ static void get_stats_counter(struct msm_ringbuffer *ring, u32 counter,
>  		u64 iova)
>  {
>  	OUT_PKT7(ring, CP_REG_TO_MEM, 3);
> -	OUT_RING(ring, counter | (1 << 30) | (2 << 18));
> +	OUT_RING(ring, CP_REG_TO_MEM_0_REG(counter) |
> +		CP_REG_TO_MEM_0_CNT(2) |
> +		CP_REG_TO_MEM_0_64B);
>  	OUT_RING(ring, lower_32_bits(iova));
>  	OUT_RING(ring, upper_32_bits(iova));
>  }
> @@ -102,10 +104,10 @@ static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit,
>  
>  	/* Invalidate CCU depth and color */
>  	OUT_PKT7(ring, CP_EVENT_WRITE, 1);
> -	OUT_RING(ring, PC_CCU_INVALIDATE_DEPTH);
> +	OUT_RING(ring, CP_EVENT_WRITE_0_EVENT(PC_CCU_INVALIDATE_DEPTH));
>  
>  	OUT_PKT7(ring, CP_EVENT_WRITE, 1);
> -	OUT_RING(ring, PC_CCU_INVALIDATE_COLOR);
> +	OUT_RING(ring, CP_EVENT_WRITE_0_EVENT(PC_CCU_INVALIDATE_COLOR));
>  
>  	/* Submit the commands */
>  	for (i = 0; i < submit->nr_cmds; i++) {
> @@ -139,7 +141,8 @@ static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit,
>  	 * timestamp is written to the memory and then triggers the interrupt
>  	 */
>  	OUT_PKT7(ring, CP_EVENT_WRITE, 4);
> -	OUT_RING(ring, CACHE_FLUSH_TS | (1 << 31));
> +	OUT_RING(ring, CP_EVENT_WRITE_0_EVENT(CACHE_FLUSH_TS) |
> +		CP_EVENT_WRITE_0_IRQ);
>  	OUT_RING(ring, lower_32_bits(rbmemptr(ring, fence)));
>  	OUT_RING(ring, upper_32_bits(rbmemptr(ring, fence)));
>  	OUT_RING(ring, submit->seqno);
> -- 
> 2.26.2
> 
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
