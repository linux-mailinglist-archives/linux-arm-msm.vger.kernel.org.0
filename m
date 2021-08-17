Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33DE93EF114
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Aug 2021 19:48:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230515AbhHQRtI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Aug 2021 13:49:08 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:40089 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230311AbhHQRtH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Aug 2021 13:49:07 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1629222514; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=XBtQo/a+e5NB19WIOi/LVxJedsfU596PScMqe8VQa4k=;
 b=BztMZYmWE6vfYRL9/rk8caFTzQJpkW9v8lDEeA4lNlDE5GRkPhtb2TNsdjbT8346so6PG+sT
 UHI8UIDpqz8zLG8xM/9Cq1Si+VBckJltl0pMcbnYcw7ir3ceIoVdirAqdsY55CSPPy9ybjju
 fwSFLndSJs229FY/jQU3YICr2D0=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 611bf6702892f803bc939a8e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 17 Aug 2021 17:48:32
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A0ED9C4361B; Tue, 17 Aug 2021 17:48:31 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3B1B9C4360C;
        Tue, 17 Aug 2021 17:48:30 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 17 Aug 2021 10:48:30 -0700
From:   abhinavk@codeaurora.org
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        freedreno@lists.freedesktop.org
Subject: Re: [Freedreno] [PATCH] drm/msm/dpu: add support for alpha blending
 properties
In-Reply-To: <20210628191958.2754731-1-dmitry.baryshkov@linaro.org>
References: <20210628191958.2754731-1-dmitry.baryshkov@linaro.org>
Message-ID: <34ee522aa37172099dac9f686f0196ec@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-06-28 12:19, Dmitry Baryshkov wrote:
> Add support for alpha blending properties. Setup the plane blend state
> according to those properties.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

I think this has already been picked up by Rob but just had a couple of 
comments
below.

Also, how has this been validated? On RB boards i dont think all the 
paths get
executed.

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  | 43 ++++++++++++++++-------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 10 ++++--
>  2 files changed, 37 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 9a5c70c87cc8..768012243b44 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -30,12 +30,6 @@
>  #include "dpu_core_perf.h"
>  #include "dpu_trace.h"
> 
> -#define DPU_DRM_BLEND_OP_NOT_DEFINED    0
> -#define DPU_DRM_BLEND_OP_OPAQUE         1
> -#define DPU_DRM_BLEND_OP_PREMULTIPLIED  2
> -#define DPU_DRM_BLEND_OP_COVERAGE       3
> -#define DPU_DRM_BLEND_OP_MAX            4
> -
>  /* layer mixer index on dpu_crtc */
>  #define LEFT_MIXER 0
>  #define RIGHT_MIXER 1
> @@ -146,20 +140,43 @@ static void _dpu_crtc_setup_blend_cfg(struct
> dpu_crtc_mixer *mixer,
>  {
>  	struct dpu_hw_mixer *lm = mixer->hw_lm;
>  	uint32_t blend_op;
> +	uint32_t fg_alpha, bg_alpha;
> 
> -	/* default to opaque blending */
> -	blend_op = DPU_BLEND_FG_ALPHA_FG_CONST |
> -		DPU_BLEND_BG_ALPHA_BG_CONST;
> +	fg_alpha = pstate->base.alpha >> 8;
> +	bg_alpha = 0xff - fg_alpha;
> 
> -	if (format->alpha_enable) {
> +	/* default to opaque blending */
> +	if (pstate->base.pixel_blend_mode == DRM_MODE_BLEND_PIXEL_NONE ||
> +	    !format->alpha_enable) {
> +		blend_op = DPU_BLEND_FG_ALPHA_FG_CONST |
> +			DPU_BLEND_BG_ALPHA_BG_CONST;
> +	} else if (pstate->base.pixel_blend_mode == DRM_MODE_BLEND_PREMULTI) 
> {
> +		blend_op = DPU_BLEND_FG_ALPHA_FG_CONST |
> +			DPU_BLEND_BG_ALPHA_FG_PIXEL;
> +		if (fg_alpha != 0xff) {
> +			bg_alpha = fg_alpha;
> +			blend_op |= DPU_BLEND_BG_MOD_ALPHA |
> +				    DPU_BLEND_BG_INV_MOD_ALPHA;
> +		} else {
> +			blend_op |= DPU_BLEND_BG_INV_ALPHA;
> +		}
> +	} else {
>  		/* coverage blending */
>  		blend_op = DPU_BLEND_FG_ALPHA_FG_PIXEL |
> -			DPU_BLEND_BG_ALPHA_FG_PIXEL |
> -			DPU_BLEND_BG_INV_ALPHA;
> +			DPU_BLEND_BG_ALPHA_FG_PIXEL;
> +		if (fg_alpha != 0xff) {
> +			bg_alpha = fg_alpha;
> +			blend_op |= DPU_BLEND_FG_MOD_ALPHA |
> +				    DPU_BLEND_FG_INV_MOD_ALPHA |
comparing this with the blend rule downstream, is this inversion 
necessary?
I only see below rule downstream:

628 			if (fg_alpha != 0xff) {
629 				bg_alpha = fg_alpha;
630 				blend_op |= SDE_BLEND_FG_MOD_ALPHA |
631 					SDE_BLEND_BG_MOD_ALPHA |
632 					SDE_BLEND_BG_INV_MOD_ALPHA;

> +				    DPU_BLEND_BG_MOD_ALPHA |
> +				    DPU_BLEND_BG_INV_MOD_ALPHA;
> +		} else {
> +			blend_op |= DPU_BLEND_BG_INV_ALPHA;
> +		}
>  	}
> 
>  	lm->ops.setup_blend_config(lm, pstate->stage,
> -				0xFF, 0, blend_op);
> +				fg_alpha, bg_alpha, blend_op);
> 
>  	DRM_DEBUG_ATOMIC("format:%p4cc, alpha_en:%u blend_op:0x%x\n",
>  		  &format->base.pixel_format, format->alpha_enable, blend_op);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index ec4a6f04394a..c989621209aa 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -1339,9 +1339,7 @@ static void dpu_plane_reset(struct drm_plane 
> *plane)
>  		return;
>  	}
> 
> -	pstate->base.plane = plane;
> -
> -	plane->state = &pstate->base;
> +	__drm_atomic_helper_plane_reset(plane, &pstate->base);
>  }
> 
>  #ifdef CONFIG_DEBUG_FS
> @@ -1647,6 +1645,12 @@ struct drm_plane *dpu_plane_init(struct 
> drm_device *dev,
>  	if (ret)
>  		DPU_ERROR("failed to install zpos property, rc = %d\n", ret);
> 
> +	drm_plane_create_alpha_property(plane);
> +	drm_plane_create_blend_mode_property(plane,
> +			BIT(DRM_MODE_BLEND_PIXEL_NONE) |
> +			BIT(DRM_MODE_BLEND_PREMULTI) |
> +			BIT(DRM_MODE_BLEND_COVERAGE));
> +
>  	drm_plane_create_rotation_property(plane,
>  			DRM_MODE_ROTATE_0,
>  			DRM_MODE_ROTATE_0 |
