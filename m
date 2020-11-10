Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C0FB2ADEAE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Nov 2020 19:46:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726467AbgKJSqp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Nov 2020 13:46:45 -0500
Received: from m42-4.mailgun.net ([69.72.42.4]:25940 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726179AbgKJSqp (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Nov 2020 13:46:45 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1605034004; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=YLcdxeCasqNEXg1KAsdy2Xe/sm4z0ubzkMfFT7hdJBs=; b=AYNLxrWHgEgWm33Sn9hYjs6hIOTerOOjgx5QXa5/SXq1dX2yAOGrEWuCwqi3yyxKBFLeqpaS
 lZLSkwECgZYs6197LICTPWGnLgribr9BD+zJMRqWhQX045QXT97Ryw8wmGrOk5+dhz3GWOdf
 A0De6YR4m/QOoegvKOTHxTg+2TQ=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 5faae006b8c6a84a5c6b4c18 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 10 Nov 2020 18:46:30
 GMT
Sender: jcrouse=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id CE5B5C43385; Tue, 10 Nov 2020 18:46:29 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B80D2C433C8;
        Tue, 10 Nov 2020 18:46:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B80D2C433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jcrouse@codeaurora.org
Date:   Tue, 10 Nov 2020 11:46:24 -0700
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        "Kristian H. Kristensen" <hoegsberg@google.com>,
        Eric Anholt <eric@anholt.net>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Emil Velikov <emil.velikov@collabora.com>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <freedreno@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] drm/msm/a5xx: Clear shadow on suspend
Message-ID: <20201110184624.GB2661@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
        dri-devel@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        "Kristian H. Kristensen" <hoegsberg@google.com>,
        Eric Anholt <eric@anholt.net>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Emil Velikov <emil.velikov@collabora.com>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20201110184401.282982-1-robdclark@gmail.com>
 <20201110184401.282982-2-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201110184401.282982-2-robdclark@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Nov 10, 2020 at 10:44:00AM -0800, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Similar to the previous patch, clear shadow on suspend to avoid timeouts
> waiting for ringbuffer space.
> 
> Fixes: 8907afb476ac ("drm/msm: Allow a5xx to mark the RPTR shadow as privileged")
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> index b0005ccd81c6..8fa5c917d017 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> @@ -1206,7 +1206,9 @@ static int a5xx_pm_resume(struct msm_gpu *gpu)
>  static int a5xx_pm_suspend(struct msm_gpu *gpu)
>  {
>  	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> +	struct a5xx_gpu *a5xx_gpu = to_a5xx_gpu(adreno_gpu);
>  	u32 mask = 0xf;
> +	int i, ret;
>  
>  	/* A510 has 3 XIN ports in VBIF */
>  	if (adreno_is_a510(adreno_gpu))
> @@ -1226,7 +1228,15 @@ static int a5xx_pm_suspend(struct msm_gpu *gpu)
>  	gpu_write(gpu, REG_A5XX_RBBM_BLOCK_SW_RESET_CMD, 0x003C0000);
>  	gpu_write(gpu, REG_A5XX_RBBM_BLOCK_SW_RESET_CMD, 0x00000000);
>  
> -	return msm_gpu_pm_suspend(gpu);
> +	ret = msm_gpu_pm_suspend(gpu);
> +	if (ret)
> +		return ret;
> +
> +	if (a5xx_gpu->has_whereami)
> +		for (i = 0; i < gpu->nr_rings; i++)
> +			a5xx_gpu->shadow[i] = 0;
> +
> +	return 0;
>  }
>  
>  static int a5xx_get_timestamp(struct msm_gpu *gpu, uint64_t *value)
> -- 
> 2.28.0
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
