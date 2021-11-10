Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 179A744B99E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Nov 2021 01:31:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231132AbhKJAdn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Nov 2021 19:33:43 -0500
Received: from so254-9.mailgun.net ([198.61.254.9]:61599 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230484AbhKJAdm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Nov 2021 19:33:42 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1636504256; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=riQLO85yIpD4XnF2cVveAsrWXW/y1r+/wm2BI5Zf3UQ=;
 b=gTgqv8P6v7Q3hgVtNl+j7mdqz58Z5stz8OcQJyQ3ssRUMh/pfoMaYTgDR1m3BkKaPIBWWPeW
 Z1sZU7v1rjIGnW6NFI9ajBpbwgpyPVxbEcftuvViQ/opF0ZKG9/SlSxKWIvQEL2gr+L9dbiK
 Kd/WNzy8HdX76Xxjuzff6UXPwTU=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 618b12a2facd20d795ba067d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 10 Nov 2021 00:30:26
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id DB42AC4361A; Wed, 10 Nov 2021 00:30:25 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A7F31C4360C;
        Wed, 10 Nov 2021 00:30:23 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 09 Nov 2021 16:30:23 -0800
From:   abhinavk@codeaurora.org
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        freedreno@lists.freedesktop.org
Subject: Re: [Freedreno] [PATCH v2 17/22] drm/msm/dpu: add support for SSPP
 allocation to RM
In-Reply-To: <20210705012115.4179824-18-dmitry.baryshkov@linaro.org>
References: <20210705012115.4179824-1-dmitry.baryshkov@linaro.org>
 <20210705012115.4179824-18-dmitry.baryshkov@linaro.org>
Message-ID: <7e23a6de417871cfbdc8cd30ec439939@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-07-04 18:21, Dmitry Baryshkov wrote:
> Add support for handling and allocting SSPP blocks through the resource
> manager. Handling code is not converted to use it though.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Conceptually this is identical to the previous attempt from QC on this:

https://patchwork.kernel.org/project/dri-devel/patch/1529499020-8499-5-git-send-email-skolluku@codeaurora.org/

So I wanted to get your comments on the foll questions:

1) Originally the idea was that to add 4K support to DPU, we will expand 
on top of your series.
 From our prior discussion on why the previous QC attempt was not taken 
over to add multirect support, the reason
was that it removed mutirect support which is was actually the end goal 
of this series. The end goal of the previous
attempt was to add 4K support hence looks like multirect was given lower 
priority and removed that time and not added
back.

But overall idea is the same which is to allocate hw sspps for drm 
planes to suit the requirement needed in the dpu_rm.

So to add 4K support on top of this series, we would just have to tweak 
dpu_rm_get_sspp to allocate 2x hw sspps right?


2) If the sspps are going to be iterated over a loop potentially every 
frame in the atomic check, wouldnt there be
a performance hit due to this?

> +retry_loop:
> +	for (i = 0; i < ARRAY_SIZE(rm->sspp_blks) && pipe == SSPP_NONE; i++) 
> {

This is where some help from usermode will help to optimize number of 
atomic_checks coming in.
If usermode tries atomic_checks too many times there can be potential 
glitches with this. Is that something
factored into this design?



> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h | 10 +++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h     |  1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 18 ++---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      | 81 +++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h      |  6 ++
>  5 files changed, 104 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> index 00098e33391e..c5ac8defa073 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> @@ -387,6 +387,16 @@ struct dpu_hw_pipe {
>  	struct dpu_hw_sspp_ops ops;
>  };
> 
> +/**
> + * to_dpu_hw_pipe - convert base object dpu_hw_base to container
> + * @hw: Pointer to base hardware block
> + * return: Pointer to hardware block container
> + */
> +static inline struct dpu_hw_pipe *to_dpu_hw_pipe(struct dpu_hw_blk 
> *hw)
> +{
> +	return container_of(hw, struct dpu_hw_pipe, base);
> +}
> +
>  /**
>   * dpu_hw_sspp_init - initializes the sspp hw driver object.
>   * Should be called once before accessing every pipe.
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> index ab65c817eb42..04a2ab548f54 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> @@ -159,6 +159,7 @@ struct dpu_global_state {
>  	uint32_t ctl_to_enc_id[CTL_MAX - CTL_0];
>  	uint32_t intf_to_enc_id[INTF_MAX - INTF_0];
>  	uint32_t dspp_to_enc_id[DSPP_MAX - DSPP_0];
> +	uint32_t pipe_to_plane_id[SSPP_MAX - SSPP_NONE];
>  };
> 
>  struct dpu_global_state
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 3850f2714bf3..61008e8afb0a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -1234,8 +1234,6 @@ static void dpu_plane_destroy(struct drm_plane 
> *plane)
>  		/* this will destroy the states as well */
>  		drm_plane_cleanup(plane);
> 
> -		dpu_hw_sspp_destroy(pdpu->pipe_hw);
> -
>  		kfree(pdpu);
>  	}
>  }
> @@ -1389,14 +1387,13 @@ struct drm_plane *dpu_plane_init(struct 
> drm_device *dev,
>  	pdpu->pipe = pipe;
> 
>  	/* initialize underlying h/w driver */
> -	pdpu->pipe_hw = dpu_hw_sspp_init(pipe, kms->mmio, kms->catalog);
> -	if (IS_ERR(pdpu->pipe_hw)) {
> -		DPU_ERROR("[%u]SSPP init failed\n", pipe);
> -		ret = PTR_ERR(pdpu->pipe_hw);
> +	if (!kms->rm.sspp_blks[pipe - SSPP_NONE])
>  		goto clean_plane;
> -	} else if (!pdpu->pipe_hw->cap || !pdpu->pipe_hw->cap->sblk) {
> +	pdpu->pipe_hw = to_dpu_hw_pipe(kms->rm.sspp_blks[pipe - SSPP_NONE]);
> +
> +	if (!pdpu->pipe_hw->cap || !pdpu->pipe_hw->cap->sblk) {
>  		DPU_ERROR("[%u]SSPP init returned invalid cfg\n", pipe);
> -		goto clean_sspp;
> +		goto clean_plane;
>  	}
> 
>  	format_list = pdpu->pipe_hw->cap->sblk->format_list;
> @@ -1406,7 +1403,7 @@ struct drm_plane *dpu_plane_init(struct 
> drm_device *dev,
>  				format_list, num_formats,
>  				supported_format_modifiers, type, NULL);
>  	if (ret)
> -		goto clean_sspp;
> +		goto clean_plane;
> 
>  	pdpu->catalog = kms->catalog;
> 
> @@ -1432,9 +1429,6 @@ struct drm_plane *dpu_plane_init(struct 
> drm_device *dev,
>  					pipe, plane->base.id);
>  	return plane;
> 
> -clean_sspp:
> -	if (pdpu && pdpu->pipe_hw)
> -		dpu_hw_sspp_destroy(pdpu->pipe_hw);
>  clean_plane:
>  	kfree(pdpu);
>  	return ERR_PTR(ret);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index f9c83d6e427a..21c9e513f1f6 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -8,6 +8,7 @@
>  #include "dpu_hw_lm.h"
>  #include "dpu_hw_ctl.h"
>  #include "dpu_hw_pingpong.h"
> +#include "dpu_hw_sspp.h"
>  #include "dpu_hw_intf.h"
>  #include "dpu_hw_dspp.h"
>  #include "dpu_hw_merge3d.h"
> @@ -35,6 +36,14 @@ int dpu_rm_destroy(struct dpu_rm *rm)
>  {
>  	int i;
> 
> +	for (i = 0; i < ARRAY_SIZE(rm->sspp_blks); i++) {
> +		struct dpu_hw_pipe *hw;
> +
> +		if (rm->sspp_blks[i]) {
> +			hw = to_dpu_hw_pipe(rm->sspp_blks[i]);
> +			dpu_hw_sspp_destroy(hw);
> +		}
> +	}
>  	for (i = 0; i < ARRAY_SIZE(rm->pingpong_blks); i++) {
>  		struct dpu_hw_pingpong *hw;
> 
> @@ -166,6 +175,24 @@ int dpu_rm_init(struct dpu_rm *rm,
>  		rm->pingpong_blks[pp->id - PINGPONG_0] = &hw->base;
>  	}
> 
> +	for (i = 0; i < cat->sspp_count; i++) {
> +		struct dpu_hw_pipe *hw;
> +		const struct dpu_sspp_cfg *sspp = &cat->sspp[i];
> +
> +		if (sspp->id <= SSPP_NONE || sspp->id >= SSPP_MAX) {
> +			DPU_ERROR("skip sspp %d with invalid id\n", sspp->id);
> +			continue;
> +		}
> +		hw = dpu_hw_sspp_init(sspp->id, mmio, cat);
> +		if (IS_ERR_OR_NULL(hw)) {
> +			rc = PTR_ERR(hw);
> +			DPU_ERROR("failed sspp object creation: err %d\n",
> +				rc);
> +			goto fail;
> +		}
> +		rm->sspp_blks[sspp->id - SSPP_NONE] = &hw->base;
> +	}
> +
>  	for (i = 0; i < cat->intf_count; i++) {
>  		struct dpu_hw_intf *hw;
>  		const struct dpu_intf_cfg *intf = &cat->intf[i];
> @@ -660,3 +687,57 @@ int dpu_rm_get_assigned_resources(struct dpu_rm 
> *rm,
> 
>  	return num_blks;
>  }
> +
> +enum dpu_sspp dpu_rm_get_sspp(struct dpu_rm *rm, struct
> dpu_global_state *global_state, uint32_t plane_id, bool yuv, bool
> scale)
> +{
> +	int i;
> +	enum dpu_sspp pipe = SSPP_NONE;
> +	struct dpu_hw_pipe *pipe_hw;
> +	bool retry = false;
> +
> +retry_loop:
> +	for (i = 0; i < ARRAY_SIZE(rm->sspp_blks) && pipe == SSPP_NONE; i++) 
> {
> +		if (!rm->sspp_blks[i])
> +			continue;
> +		if (reserved_by_other(global_state->pipe_to_plane_id, i, plane_id))
> +			continue;
> +
> +		pipe_hw = to_dpu_hw_pipe(rm->sspp_blks[i]);
> +
> +		/* skip incompatible planes */
> +		if (scale && !(pipe_hw->cap->features & DPU_SSPP_SCALER))
> +			continue;
> +
> +		if (yuv && (!(pipe_hw->cap->features & DPU_SSPP_SCALER) ||
> +			    !(pipe_hw->cap->features & DPU_SSPP_CSC_ANY)))
> +			continue;
> +
> +		/* For non-yuv, non-scaled planes try to find simple (DMA)
> +		 * plane, fallback to VIG on a second try.
> +		 *
> +		 * This way we'd leave VIG pipes to be later used for YUV formats.
> +		 */
> +
> +		if (!scale && !yuv && !retry &&
> +		    (pipe_hw->cap->features & (DPU_SSPP_SCALER | DPU_SSPP_CSC_ANY)))
> +			continue;
> +
> +		pipe = i + SSPP_NONE;
> +	};
> +
> +	if (!scale && !yuv && !retry && pipe == SSPP_NONE) {
> +		retry = true;
> +		goto retry_loop;
> +	}
> +
> +	if (pipe != SSPP_NONE)
> +		global_state->pipe_to_plane_id[pipe - SSPP_NONE] = plane_id;
> +
> +	return pipe;
> +}
> +
> +void dpu_rm_release_sspp(struct dpu_rm *rm, struct dpu_global_state
> *global_state, uint32_t plane_id)
> +{
> +	_dpu_rm_clear_mapping(global_state->pipe_to_plane_id,
> +			ARRAY_SIZE(global_state->pipe_to_plane_id), plane_id);
> +}
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> index 1f12c8d5b8aa..b759fe39f6d6 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> @@ -16,6 +16,7 @@ struct dpu_global_state;
>  /**
>   * struct dpu_rm - DPU dynamic hardware resource manager
>   * @pingpong_blks: array of pingpong hardware resources
> + * @sspp_blks: array of sspp hardware resources
>   * @mixer_blks: array of layer mixer hardware resources
>   * @ctl_blks: array of ctl hardware resources
>   * @intf_blks: array of intf hardware resources
> @@ -25,6 +26,7 @@ struct dpu_global_state;
>   */
>  struct dpu_rm {
>  	struct dpu_hw_blk *pingpong_blks[PINGPONG_MAX - PINGPONG_0];
> +	struct dpu_hw_blk *sspp_blks[SSPP_MAX - SSPP_NONE];
>  	struct dpu_hw_blk *mixer_blks[LM_MAX - LM_0];
>  	struct dpu_hw_blk *ctl_blks[CTL_MAX - CTL_0];
>  	struct dpu_hw_blk *intf_blks[INTF_MAX - INTF_0];
> @@ -88,5 +90,9 @@ void dpu_rm_release(struct dpu_global_state 
> *global_state,
>  int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
>  	struct dpu_global_state *global_state, uint32_t enc_id,
>  	enum dpu_hw_blk_type type, struct dpu_hw_blk **blks, int blks_size);
> +
> +enum dpu_sspp dpu_rm_get_sspp(struct dpu_rm *rm, struct
> dpu_global_state *global_state, uint32_t plane_id, bool yuv, bool
> scale);
> +void dpu_rm_release_sspp(struct dpu_rm *rm, struct dpu_global_state
> *global_state, uint32_t plane_id);
> +
>  #endif /* __DPU_RM_H__ */
