Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA13E436D77
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Oct 2021 00:30:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229935AbhJUWco (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Oct 2021 18:32:44 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:54235 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229567AbhJUWcm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Oct 2021 18:32:42 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1634855426; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=E4FlMrRofoJfOfRjLa/P/6CL3IX9SB4XRDs3or4KY9Q=;
 b=W/PwfdmvmhaZo1UEbi1U3a5wOTQMtlfdg6KeT7kTGw9hENURE+SjdD8eZcg9I1KnT7x97KYF
 F4siNtrMr94uHSmYFbtan0iaYO43TwY10H8Mkm4lN1RvkfM0uvz/xxHizcTP+SOCjJOCSzcD
 O/z1sL3JQSsVaFocW2AU7vXWKqU=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 6171e9f514914866fa959410 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 21 Oct 2021 22:30:13
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 82CC2C4360D; Thu, 21 Oct 2021 22:30:12 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 87725C4338F;
        Thu, 21 Oct 2021 22:30:11 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 21 Oct 2021 15:30:11 -0700
From:   abhinavk@codeaurora.org
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [Freedreno] [PATCH 04/11] drm/msm/dpu: remove stage_cfg from
 struct dpu_crtc
In-Reply-To: <20210930140002.308628-5-dmitry.baryshkov@linaro.org>
References: <20210930140002.308628-1-dmitry.baryshkov@linaro.org>
 <20210930140002.308628-5-dmitry.baryshkov@linaro.org>
Message-ID: <4496a4f97ce112726c31bc05aa173cd5@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-09-30 06:59, Dmitry Baryshkov wrote:
> The stage_cfg is not used outside of _dpu_crtc_blend_setup(), so remove
> the temporary config from global struct.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 11 ++++++-----
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h |  2 --
>  2 files changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 768012243b44..19f0715a4089 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -207,7 +207,8 @@ static void _dpu_crtc_program_lm_output_roi(struct
> drm_crtc *crtc)
>  }
> 
>  static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
> -	struct dpu_crtc *dpu_crtc, struct dpu_crtc_mixer *mixer)
> +	struct dpu_crtc *dpu_crtc, struct dpu_crtc_mixer *mixer,
> +	struct dpu_hw_stage_cfg *stage_cfg)
>  {
>  	struct drm_plane *plane;
>  	struct drm_framebuffer *fb;
> @@ -216,7 +217,6 @@ static void _dpu_crtc_blend_setup_mixer(struct
> drm_crtc *crtc,
>  	struct dpu_plane_state *pstate = NULL;
>  	struct dpu_format *format;
>  	struct dpu_hw_ctl *ctl = mixer->lm_ctl;
> -	struct dpu_hw_stage_cfg *stage_cfg = &dpu_crtc->stage_cfg;
> 
>  	u32 flush_mask;
>  	uint32_t stage_idx, lm_idx;
> @@ -292,6 +292,7 @@ static void _dpu_crtc_blend_setup(struct drm_crtc 
> *crtc)
>  	struct dpu_crtc_mixer *mixer = cstate->mixers;
>  	struct dpu_hw_ctl *ctl;
>  	struct dpu_hw_mixer *lm;
> +	struct dpu_hw_stage_cfg stage_cfg;
>  	int i;
> 
>  	DRM_DEBUG_ATOMIC("%s\n", dpu_crtc->name);
> @@ -305,9 +306,9 @@ static void _dpu_crtc_blend_setup(struct drm_crtc 
> *crtc)
>  	}
> 
>  	/* initialize stage cfg */
> -	memset(&dpu_crtc->stage_cfg, 0, sizeof(struct dpu_hw_stage_cfg));
> +	memset(&stage_cfg, 0, sizeof(struct dpu_hw_stage_cfg));
> 
> -	_dpu_crtc_blend_setup_mixer(crtc, dpu_crtc, mixer);
> +	_dpu_crtc_blend_setup_mixer(crtc, dpu_crtc, mixer, &stage_cfg);
> 
>  	for (i = 0; i < cstate->num_mixers; i++) {
>  		ctl = mixer[i].lm_ctl;
> @@ -328,7 +329,7 @@ static void _dpu_crtc_blend_setup(struct drm_crtc 
> *crtc)
>  			mixer[i].flush_mask);
> 
>  		ctl->ops.setup_blendstage(ctl, mixer[i].hw_lm->idx,
> -			&dpu_crtc->stage_cfg);
> +			&stage_cfg);
>  	}
>  }
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> index cec3474340e8..30535acec670 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> @@ -116,7 +116,6 @@ struct dpu_crtc_frame_event {
>   * @drm_requested_vblank : Whether vblanks have been enabled in the 
> encoder
>   * @property_info : Opaque structure for generic property support
>   * @property_defaults : Array of default values for generic property 
> support
> - * @stage_cfg     : H/w mixer stage configuration
>   * @debugfs_root  : Parent of debugfs node
>   * @vblank_cb_count : count of vblank callback since last reset
>   * @play_count    : frame count between crtc enable and disable
> @@ -147,7 +146,6 @@ struct dpu_crtc {
>  	struct drm_pending_vblank_event *event;
>  	u32 vsync_count;
> 
> -	struct dpu_hw_stage_cfg stage_cfg;
>  	struct dentry *debugfs_root;
> 
>  	u32 vblank_cb_count;
