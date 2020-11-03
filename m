Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 346592A4CD9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Nov 2020 18:30:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728715AbgKCRaQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Nov 2020 12:30:16 -0500
Received: from m42-4.mailgun.net ([69.72.42.4]:55450 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727688AbgKCRaQ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Nov 2020 12:30:16 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1604424615; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=C4CMFwI1HM31pHkchZgqYiU+8s6XN3zv2mGhUlUukhY=; b=czHLboZy0Y8v5aLQt6JbeqVxn0GMSf2OOXwu9+nK0erVzrQp1HZWLv2F6GXuydvZ+9O/itRh
 6c4h0AsilpSIhkJWnBI+z5BLruf4ULWfXte17cvGXmVFo+PmiX9ql77QiE/J6+0QwyszYsJc
 o0H4DWUva/jNLOG+c2hyHJMCsVQ=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 5fa19396fcec43b7830a3836 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 03 Nov 2020 17:29:58
 GMT
Sender: jcrouse=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 8A03EC433FE; Tue,  3 Nov 2020 17:29:57 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2239EC433C6;
        Tue,  3 Nov 2020 17:29:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2239EC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jcrouse@codeaurora.org
Date:   Tue, 3 Nov 2020 10:29:52 -0700
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     robdclark@gmail.com, konrad.dybcio@somainline.org,
        martin.botka@somainline.org, phone-devel@vger.kernel.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Konrad Dybcio <konradybcio@gmail.com>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Eric Anholt <eric@anholt.net>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm: a5xx: Make preemption reset case reentrant
Message-ID: <20201103172951.GB5934@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Marijn Suijten <marijn.suijten@somainline.org>,
        robdclark@gmail.com, konrad.dybcio@somainline.org,
        martin.botka@somainline.org, phone-devel@vger.kernel.org,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Konrad Dybcio <konradybcio@gmail.com>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Eric Anholt <eric@anholt.net>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20201102200227.8876-1-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201102200227.8876-1-marijn.suijten@somainline.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Nov 02, 2020 at 09:02:25PM +0100, Marijn Suijten wrote:
> nr_rings is reset to 1, but when this function is called for a second
> (and third!) time nr_rings > 1 is false, thus the else case is entered
> to set up a buffer for the RPTR shadow and consequently written to
> RB_RPTR_ADDR, hanging platforms without WHERE_AM_I firmware support.
> 
> Restructure the condition in such a way that shadow buffer setup only
> ever happens when has_whereami is true; otherwise preemption is only
> finalized when the number of ring buffers has not been reset to 1 yet.
> 
> Fixes: 8907afb476ac ("drm/msm: Allow a5xx to mark the RPTR shadow as privileged")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>

Way better. Thanks for doing this.

Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>

> ---
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> index d6804a802355..9a202a7da131 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> @@ -755,12 +755,8 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
>  	gpu_write(gpu, REG_A5XX_CP_RB_CNTL,
>  		MSM_GPU_RB_CNTL_DEFAULT | AXXX_CP_RB_CNTL_NO_UPDATE);
>  
> -	/* Disable preemption if WHERE_AM_I isn't available */
> -	if (!a5xx_gpu->has_whereami && gpu->nr_rings > 1) {
> -		a5xx_preempt_fini(gpu);
> -		gpu->nr_rings = 1;
> -	} else {
> -		/* Create a privileged buffer for the RPTR shadow */
> +	/* Create a privileged buffer for the RPTR shadow */
> +	if (a5xx_gpu->has_whereami) {
>  		if (!a5xx_gpu->shadow_bo) {
>  			a5xx_gpu->shadow = msm_gem_kernel_new(gpu->dev,
>  				sizeof(u32) * gpu->nr_rings,
> @@ -774,6 +770,10 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
>  
>  		gpu_write64(gpu, REG_A5XX_CP_RB_RPTR_ADDR,
>  			REG_A5XX_CP_RB_RPTR_ADDR_HI, shadowptr(a5xx_gpu, gpu->rb[0]));
> +	} else if (gpu->nr_rings > 1) {
> +		/* Disable preemption if WHERE_AM_I isn't available */
> +		a5xx_preempt_fini(gpu);
> +		gpu->nr_rings = 1;
>  	}
>  
>  	a5xx_preempt_hw_init(gpu);
> -- 
> 2.29.2
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
