Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18EAF242BE1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Aug 2020 17:06:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726567AbgHLPGa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Aug 2020 11:06:30 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:34545 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726447AbgHLPG1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Aug 2020 11:06:27 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1597244786; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=he48vNhB/H7o1FXWZlCjSNh7DZeQpxJ6JMe+OQtpTL4=; b=BJrQwIxIrPieCkOmHYqRUXU0gy6puxUbf1R51vNCtYxeKfN/jYaF3+I4mxlvPl1zWwBa/YQ0
 gMOr3Ycn4tWJmvjcUzdBMLVG6pcclLoJcedU7vJfAMjf0vskIy5x7uI8pJdYHv/jdFL+8W2e
 1RV58IK0w/2qkb6ntl27vN//quk=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 5f3405222b87d66049349722 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 12 Aug 2020 15:05:06
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id BDB3EC433AD; Wed, 12 Aug 2020 15:05:05 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 676D4C433C6;
        Wed, 12 Aug 2020 15:05:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 676D4C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date:   Wed, 12 Aug 2020 09:05:00 -0600
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Shawn Guo <shawn.guo@linaro.org>,
        Wambui Karuga <wambui.karugax@gmail.com>,
        Brian Masney <masneyb@onstation.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <freedreno@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/msm/a6xx: add module param to enable debugbus
 snapshot
Message-ID: <20200812150459.GB3221@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
        dri-devel@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Shawn Guo <shawn.guo@linaro.org>,
        Wambui Karuga <wambui.karugax@gmail.com>,
        Brian Masney <masneyb@onstation.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20200811233702.580744-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200811233702.580744-1-robdclark@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Aug 11, 2020 at 04:36:57PM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> For production devices, the debugbus sections will typically be fused
> off and empty in the gpu device coredump.  But since this may contain
> data like cache contents, don't capture it by default.

Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>

> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 3 ++-
>  drivers/gpu/drm/msm/adreno/adreno_device.c  | 4 ++++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h     | 2 ++
>  3 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> index 959656ad6987..b12f5b4a1bea 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> @@ -938,7 +938,8 @@ struct msm_gpu_state *a6xx_gpu_state_get(struct msm_gpu *gpu)
>  		msm_gem_kernel_put(dumper.bo, gpu->aspace, true);
>  	}
>  
> -	a6xx_get_debugbus(gpu, a6xx_state);
> +	if (snapshot_debugbus)
> +		a6xx_get_debugbus(gpu, a6xx_state);
>  
>  	return  &a6xx_state->base;
>  }
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> index 4e84f3c76f4f..9eeb46bf2a5d 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -14,6 +14,10 @@ bool hang_debug = false;
>  MODULE_PARM_DESC(hang_debug, "Dump registers when hang is detected (can be slow!)");
>  module_param_named(hang_debug, hang_debug, bool, 0600);
>  
> +bool snapshot_debugbus = false;
> +MODULE_PARM_DESC(snapshot_debugbus, "Include debugbus sections in GPU devcoredump (if not fused off)");
> +module_param_named(snapshot_debugbus, snapshot_debugbus, bool, 0600);
> +
>  static const struct adreno_info gpulist[] = {
>  	{
>  		.rev   = ADRENO_REV(2, 0, 0, 0),
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index 99bb468f5f24..e55abae365b5 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -21,6 +21,8 @@
>  #define REG_SKIP ~0
>  #define REG_ADRENO_SKIP(_offset) [_offset] = REG_SKIP
>  
> +extern bool snapshot_debugbus;
> +
>  /**
>   * adreno_regs: List of registers that are used in across all
>   * 3D devices. Each device type has different offset value for the same
> -- 
> 2.26.2
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
