Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 508F8139823
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2020 18:55:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728558AbgAMRz1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Jan 2020 12:55:27 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:35441 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726435AbgAMRz1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Jan 2020 12:55:27 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1578938126; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=hhV7louupacu1XrOTKOPtlsP0IGei6JTdzbFTbyzEUI=; b=iHUNqDUg3EfjGP6GZCgVS5lSankoeBxxYM49PipPfpO7MV6/DJd1pCI6ELCNaTK3vNIn2wvN
 lg3VSDZaOtAZf9ZSPcz1lVmGWrdBdX6MrVIaydXE+8y6Z52IgSygQ8cCsx2ldLbWPENYcak/
 lof6FvhUqm99dPiwTBCWLOAYkWY=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e1caf0d.7f7049bdf308-smtp-out-n02;
 Mon, 13 Jan 2020 17:55:25 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id AE89AC433CB; Mon, 13 Jan 2020 17:55:25 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1DE4FC447A2;
        Mon, 13 Jan 2020 17:55:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1DE4FC447A2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date:   Mon, 13 Jan 2020 10:55:22 -0700
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     Brian Ho <brian@brkho.com>
Cc:     freedreno@lists.freedesktop.org, robdclark@chromium.org,
        David Airlie <airlied@linux.ie>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <dri-devel@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, hoegsberg@chromium.org,
        Sean Paul <sean@poorly.run>
Subject: Re: [Freedreno] [PATCH 1/2] drm/msm: Add a GPU-wide wait queue
Message-ID: <20200113175522.GD26711@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Brian Ho <brian@brkho.com>,
        freedreno@lists.freedesktop.org, robdclark@chromium.org,
        David Airlie <airlied@linux.ie>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
        Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        hoegsberg@chromium.org, Sean Paul <sean@poorly.run>
References: <20200113153605.52350-1-brian@brkho.com>
 <20200113153605.52350-2-brian@brkho.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200113153605.52350-2-brian@brkho.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jan 13, 2020 at 10:36:04AM -0500, Brian Ho wrote:
> This wait queue is signaled on all IRQs for a given GPU and will be
> used as part of the new MSM_WAIT_IOVA ioctl so userspace can sleep
> until the value at a given iova reaches a certain condition.
> 
> Signed-off-by: Brian Ho <brian@brkho.com>
> ---
>  drivers/gpu/drm/msm/msm_gpu.c | 4 ++++
>  drivers/gpu/drm/msm/msm_gpu.h | 3 +++
>  2 files changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> index a052364a5d74..d7310c1336e5 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -779,6 +779,8 @@ void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit,
>  static irqreturn_t irq_handler(int irq, void *data)
>  {
>  	struct msm_gpu *gpu = data;
> +	wake_up_all(&gpu->event);
> +

I suppose it is intentional to have this happen on *all* interrupts because you
might be using the CP interrupts for fun and profit and you don't want to plumb
in callbacks?  I suppose it is okay to do this for all interrupts (including
errors) but if we're spending a lot of time here we might want to only trigger
on certain IRQs.


>  	return gpu->funcs->irq(gpu);
>  }
>  
> @@ -871,6 +873,8 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>  
>  	spin_lock_init(&gpu->perf_lock);
>  
> +	init_waitqueue_head(&gpu->event);
> +
>  
>  	/* Map registers: */
>  	gpu->mmio = msm_ioremap(pdev, config->ioname, name);
> diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
> index ab8f0f9c9dc8..60562f065dbc 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.h
> +++ b/drivers/gpu/drm/msm/msm_gpu.h
> @@ -104,6 +104,9 @@ struct msm_gpu {
>  
>  	struct msm_gem_address_space *aspace;
>  
> +	/* GPU-wide wait queue that is signaled on all IRQs */
> +	wait_queue_head_t event;
> +
>  	/* Power Control: */
>  	struct regulator *gpu_reg, *gpu_cx;
>  	struct clk_bulk_data *grp_clks;
> -- 
> 2.25.0.rc1.283.g88dfdc4193-goog
> 
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
