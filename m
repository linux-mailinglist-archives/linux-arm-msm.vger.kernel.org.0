Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3752A429B46
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Oct 2021 04:02:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231575AbhJLCD7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Oct 2021 22:03:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229556AbhJLCD6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Oct 2021 22:03:58 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89DAAC061570
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Oct 2021 19:01:56 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id p16so10384526lfa.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Oct 2021 19:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=kIdlboAq4CrCJEOoLmlRhi1FqMabufhGD3xSgHAwCbM=;
        b=YS/xZzn1QJh4/TNtnILpm2mDhRw00uiN94QbBplkNsEMfMXbg5sEafZhWEjajTbkfA
         eq5ie7e5O1nkSWjnPzvVPUUklIHRHzvB9/XdBecuXpFTb1jU+KUhjh4IOj6Trhb3MJql
         7PYbzLHi6d3VhuU9pGpczo50SdR9PUnJk/jJbgwHyXouaDWlK1pM/IxYUe8U1laqfZRq
         5aP2L7cW3LhBryB1RJslhjTHMRB/7RQ3QFKrfY4yTikShMlMxu5/Fo9Mwi1FDUxb5HrC
         rxEx0lzP4NJT6jZFYj9kEM8AT+6x+KVRC5DbCpJpnLgs6OP6YmWqWwbOvta2PHyJ8xcE
         fMew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=kIdlboAq4CrCJEOoLmlRhi1FqMabufhGD3xSgHAwCbM=;
        b=Wb3FWwZQqmLbuqh+gf/oQmzeapjLIYXXhqgbNXYIxEs22nK4A6fjxxMhSaPfMPQmPJ
         m1N3rayamAqrawBsDrjj2v5FcbFTW9RZIeuYaHIVqY/1tfZ4Cycpxo/sD6Qn364ermLL
         tu3YWSyO0OMSFvWVNDH3pWjIZTJ/yQCDLlBraaHIoocTQPxE+b0Untz3OZ+bmseXG1f2
         LNSq89J3jQSRO+8RyGVM34lnkB0z8U1eLRxH8D9hT9e7wVMkAHbillRTUymuMVLkACyG
         sgNOCkO5T/E+5xT+0o4/x6Q9hZ67BlDhBOgpEirJsvhqhcqkbaEk2afAUq/ObAFUJnA0
         e68A==
X-Gm-Message-State: AOAM5338njdySbfQ1qEzJgD5c0ZoS8JNQcK2BrsQiNMAlRB1ttKwFDI5
        gE04fFGBlmoCnfqBnLg1sqBPcw==
X-Google-Smtp-Source: ABdhPJzfCSTZ8drqY/hU4eKHZqZ1hD/5O95Ag7GG4V8uB8rnmuTBEqEWEYp73P2fGbgNzj0ER3KxAw==
X-Received: by 2002:a05:6512:3408:: with SMTP id i8mr11569602lfr.16.1634004111877;
        Mon, 11 Oct 2021 19:01:51 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id c3sm1010317ljh.58.2021.10.11.19.01.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Oct 2021 19:01:51 -0700 (PDT)
Subject: Re: [PATCH] drm/msm/dpu: Add CRC support for DPU
To:     Jessica Zhang <jesszhan@codeaurora.org>,
        freedreno@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org,
        nganji@codeaurora.org, aravindh@codeaurora.org,
        khsieh@codeaurora.org, abhinavk@codeaurora.org,
        markyacoub@google.com
References: <20211011234123.1033-1-jesszhan@codeaurora.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <554749ae-dc23-a729-89b7-7ea553817010@linaro.org>
Date:   Tue, 12 Oct 2021 05:01:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211011234123.1033-1-jesszhan@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/10/2021 02:41, Jessica Zhang wrote:
> Add CRC support to DPU, which is currently not supported by
> this driver. Only supports CRC for CRTC for now, but will extend support
> to other blocks later on.
> 
> Tested on Qualcomm RB3 (debian, sdm845)
> 
> Signed-off-by: Jessica Zhang <jesszhan@codeaurora.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 169 +++++++++++++++++++-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h    |  20 ++-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c   |  46 +++++-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h   |  13 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h |   9 +-
>   5 files changed, 251 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 768012243b44..6ebf989c4e67 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1,6 +1,6 @@
>   // SPDX-License-Identifier: GPL-2.0-only
>   /*
> - * Copyright (c) 2014-2018 The Linux Foundation. All rights reserved.
> + * Copyright (c) 2014-2021 The Linux Foundation. All rights reserved.
>    * Copyright (C) 2013 Red Hat
>    * Author: Rob Clark <robdclark@gmail.com>
>    */
> @@ -70,6 +70,121 @@ static struct drm_encoder *get_encoder_from_crtc(struct drm_crtc *crtc)
>   	return NULL;
>   }
>   
> +static enum dpu_crtc_crc_source dpu_crtc_parse_crc_source(const char *src_name)
> +{
> +	if (!src_name || !strcmp(src_name, "none"))
> +		return DPU_CRTC_CRC_SOURCE_NONE;

Newlines after || please. this would improve readability.

> +	if (!strcmp(src_name, "auto") || !strcmp(src_name, "lm"))
> +		return DPU_CRTC_CRC_SOURCE_LAYER_MIXER;
> +
> +	return DPU_CRTC_CRC_SOURCE_INVALID;
> +}
> +
> +static bool dpu_crtc_is_valid_crc_source(enum dpu_crtc_crc_source source)
> +{
> +	return (source > DPU_CRTC_CRC_SOURCE_NONE &&
> +		source < DPU_CRTC_CRC_SOURCE_MAX);
> +}
> +
> +int dpu_crtc_verify_crc_source(struct drm_crtc *crtc, const char *src_name, size_t *values_cnt)
> +{
> +	enum dpu_crtc_crc_source source = dpu_crtc_parse_crc_source(src_name);
> +	struct dpu_crtc_state *crtc_state = to_dpu_crtc_state(crtc->state);
> +
> +	if (source < 0) {

Just use dpu_crtc_is_valid_crtc_source() here.

> +		DRM_DEBUG_DRIVER("Invalid source %s for CRTC%d\n", src_name, crtc->index);
> +		return -EINVAL;
> +	}
> +
> +	if (source == DPU_CRTC_CRC_SOURCE_LAYER_MIXER)
> +		*values_cnt = crtc_state->num_mixers;
> +
> +	return 0;
> +}
> +
> +int dpu_crtc_set_crc_source(struct drm_crtc *crtc, const char *src_name)
> +{
> +	enum dpu_crtc_crc_source source = dpu_crtc_parse_crc_source(src_name);
> +	enum dpu_crtc_crc_source current_source;
> +	struct drm_crtc_commit *commit;
> +	struct dpu_crtc_state *crtc_state;
> +	struct drm_device *drm_dev = crtc->dev;
> +	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
> +	struct dpu_crtc_mixer *m;
> +
> +	bool was_enabled;
> +	bool enable = false;
> +	int i, ret = 0;
> +
> +	if (source < 0) {
> +		DRM_DEBUG_DRIVER("Invalid CRC source %s for CRTC%d\n", src_name, crtc->index);
> +		return -EINVAL;
> +	}
> +
> +	ret = drm_modeset_lock(&crtc->mutex, NULL);
> +
> +	if (ret)
> +		return ret;
> +
> +	/* Wait for any pending commits to finish */
> +	spin_lock(&crtc->commit_lock);
> +	commit = list_first_entry_or_null(&crtc->commit_list, struct drm_crtc_commit, commit_entry);
> +
> +	if (commit)
> +		drm_crtc_commit_get(commit);
> +	spin_unlock(&crtc->commit_lock);
> +
> +	if (commit) {
> +		ret = wait_for_completion_interruptible_timeout(&commit->hw_done, 10 * HZ);
> +
> +		if (ret)
> +			goto cleanup;
> +	}

AMD drivers waits for the commit to finish, because it's commit tail can 
modify CRC-related registers. It unique, no other drivers seem to do 
this kind of wait. Why do we need to do it? And if we really need, I'd 
prefer to have this code in some kind of DRM helper function.


> +	enable = dpu_crtc_is_valid_crc_source(source);
> +	crtc_state = to_dpu_crtc_state(crtc->state);
> +
> +	spin_lock_irq(&drm_dev->event_lock);
> +	current_source = dpu_crtc->crc_source;
> +	spin_unlock_irq(&drm_dev->event_lock);
> +
> +	was_enabled = !(current_source == DPU_CRTC_CRC_SOURCE_NONE);

current_source != DPU_CRTC_CRC_SOURCE_NONE would be easier.

> +
> +	if (!was_enabled && enable) {
> +		ret = drm_crtc_vblank_get(crtc);
> +
> +		if (ret)
> +			goto cleanup;
> +
> +	} else if (was_enabled && !enable) {
> +		drm_crtc_vblank_put(crtc);
> +	}
> +
> +	spin_lock_irq(&drm_dev->event_lock);
> +	dpu_crtc->crc_source = source;
> +	spin_unlock_irq(&drm_dev->event_lock);
> +
> +	crtc_state->skip_count = 0;
> +
> +	for (i = 0; i < crtc_state->num_mixers; ++i) {
> +		m = &crtc_state->mixers[i];
> +
> +		if (!m->hw_lm || !m->hw_lm->ops.collect_misr || !m->hw_lm->ops.setup_misr)
> +			continue;

No need to check for collect_misr here, it is not used.

> +
> +		/* Calculate MISR over 1 frame */
> +		m->hw_lm->ops.setup_misr(m->hw_lm, true, 1);
> +	}
> +
> +
> +cleanup:
> +	if (commit)
> +		drm_crtc_commit_put(commit);
> +	drm_modeset_unlock(&crtc->mutex);
> +
> +	return ret;
> +}
> +
>   static u32 dpu_crtc_get_vblank_counter(struct drm_crtc *crtc)
>   {
>   	struct drm_encoder *encoder;
> @@ -83,6 +198,52 @@ static u32 dpu_crtc_get_vblank_counter(struct drm_crtc *crtc)
>   	return dpu_encoder_get_frame_count(encoder);
>   }
>   
> +
> +static void dpu_crtc_get_crc(struct drm_crtc *crtc)
> +{
> +	struct dpu_crtc *dpu_crtc;
> +	struct dpu_crtc_state *crtc_state;
> +	struct dpu_crtc_mixer *m;
> +	u32 *crcs;
> +
> +	int i = 0;
> +	int rc = 0;
> +
> +	if (!crtc) {
> +		DPU_ERROR("Invalid crtc\n");
> +		return;
> +	}
> +
> +	crtc_state = to_dpu_crtc_state(crtc->state);
> +	dpu_crtc = to_dpu_crtc(crtc);
> +	crcs = kcalloc(crtc_state->num_mixers, sizeof(*crcs), GFP_KERNEL);

This would be constantly leaking the memory. You missed kfree in all 
return paths (both error and non-error). Since you are limited by the 
max amount of mixers in the crtc (which is 2 currently and can be 4 at 
max IIRC), I'd use the on-stack array rather than calling into memory 
allocator.

> +
> +	/* Skip first 2 frames in case of "uncooked" CRCs */
> +	if (crtc_state->skip_count < 2) {
> +		crtc_state->skip_count++;

You see, missing kfree() here.

> +		return;
> +	}
> +
> +	for (i = 0; i < crtc_state->num_mixers; ++i) {
> +
> +		m = &crtc_state->mixers[i];
> +
> +		if (!m->hw_lm || !m->hw_lm->ops.collect_misr
> +			|| !m->hw_lm->ops.setup_misr)

And here we do not use setup_misr, do we?

> +			continue;
> +
> +		rc = m->hw_lm->ops.collect_misr(m->hw_lm, &crcs[i]);
> +
> +		if (rc) {
> +			DRM_DEBUG_DRIVER("MISR read failed\n");

And here

> +			return;
> +		}
> +	}
> +
> +	drm_crtc_add_crc_entry(crtc, true,
> +			drm_crtc_accurate_vblank_count(crtc), crcs);

And even here.

Also I'd propagate the erorr code here. We might not care later, but 
let's not ignore it if we can.

> +}
> +
>   static bool dpu_crtc_get_scanout_position(struct drm_crtc *crtc,
>   					   bool in_vblank_irq,
>   					   int *vpos, int *hpos,
> @@ -389,6 +550,10 @@ void dpu_crtc_vblank_callback(struct drm_crtc *crtc)
>   		dpu_crtc->vblank_cb_time = ktime_get();
>   	else
>   		dpu_crtc->vblank_cb_count++;
> +
> +	if (dpu_crtc_is_valid_crc_source(dpu_crtc->crc_source))
> +		dpu_crtc_get_crc(crtc);
> +
>   	drm_crtc_handle_vblank(crtc);
>   	trace_dpu_crtc_vblank_cb(DRMID(crtc));
>   }
> @@ -1332,6 +1497,8 @@ static const struct drm_crtc_funcs dpu_crtc_funcs = {
>   	.atomic_destroy_state = dpu_crtc_destroy_state,
>   	.late_register = dpu_crtc_late_register,
>   	.early_unregister = dpu_crtc_early_unregister,
> +	.verify_crc_source = dpu_crtc_verify_crc_source,
> +	.set_crc_source = dpu_crtc_set_crc_source,
>   	.enable_vblank  = msm_crtc_enable_vblank,
>   	.disable_vblank = msm_crtc_disable_vblank,
>   	.get_vblank_timestamp = drm_crtc_vblank_helper_get_vblank_timestamp,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> index cec3474340e8..e9940f1d5d15 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> @@ -1,6 +1,6 @@
>   /* SPDX-License-Identifier: GPL-2.0-only */
>   /*
> - * Copyright (c) 2015-2018 The Linux Foundation. All rights reserved.
> + * Copyright (c) 2015-2021 The Linux Foundation. All rights reserved.
>    * Copyright (C) 2013 Red Hat
>    * Author: Rob Clark <robdclark@gmail.com>
>    */
> @@ -69,6 +69,19 @@ struct dpu_crtc_smmu_state_data {
>   	uint32_t transition_error;
>   };
>   
> +/**
> + * enum dpu_crtc_crc_source: CRC source
> + * @DPU_CRTC_CRC_SOURCE_NONE: no source set
> + * @DPU_CRTC_CRC_SOURCE_LAYER_MIXER: CRC in layer mixer
> + * @DPU_CRTC_CRC_SOURCE_INVALID: Invalid source
> + */
> +enum dpu_crtc_crc_source {
> +	DPU_CRTC_CRC_SOURCE_NONE = 0,
> +	DPU_CRTC_CRC_SOURCE_LAYER_MIXER,
> +	DPU_CRTC_CRC_SOURCE_MAX,
> +	DPU_CRTC_CRC_SOURCE_INVALID = -1
> +};
> +
>   /**
>    * struct dpu_crtc_mixer: stores the map for each virtual pipeline in the CRTC
>    * @hw_lm:	LM HW Driver context
> @@ -139,6 +152,7 @@ struct dpu_crtc_frame_event {
>    * @event_lock    : Spinlock around event handling code
>    * @phandle: Pointer to power handler
>    * @cur_perf      : current performance committed to clock/bandwidth driver
> + * @crc_source    : CRC source
>    */
>   struct dpu_crtc {
>   	struct drm_crtc base;
> @@ -171,8 +185,8 @@ struct dpu_crtc {
>   	spinlock_t event_lock;
>   
>   	struct dpu_core_perf_params cur_perf;
> -

Unrelated

>   	struct dpu_crtc_smmu_state_data smmu_state;
> +	enum dpu_crtc_crc_source crc_source;

I think it would find a better place at the dpu_crtc_state, wouldn't it?

>   };
>   
>   #define to_dpu_crtc(x) container_of(x, struct dpu_crtc, base)
> @@ -210,6 +224,8 @@ struct dpu_crtc_state {
>   
>   	u32 num_ctls;
>   	struct dpu_hw_ctl *hw_ctls[CRTC_DUAL_MIXERS];
> +
> +	int skip_count;

What are we skipping? Could you please rename it so that usage is clearer.

>   };
>   
>   #define to_dpu_crtc_state(x) \
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
> index cb6bb7a22c15..679b3728e891 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
> @@ -1,5 +1,6 @@
>   // SPDX-License-Identifier: GPL-2.0-only
> -/* Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
> +/*
> + * Copyright (c) 2015-2021, The Linux Foundation. All rights reserved.
>    */
>   
>   #include "dpu_kms.h"
> @@ -24,6 +25,9 @@
>   #define LM_BLEND0_FG_ALPHA               0x04
>   #define LM_BLEND0_BG_ALPHA               0x08
>   
> +#define LM_MISR_CTRL                     0x310
> +#define LM_MISR_SIGNATURE                0x314
> +
>   static const struct dpu_lm_cfg *_lm_offset(enum dpu_lm mixer,
>   		const struct dpu_mdss_cfg *m,
>   		void __iomem *addr,
> @@ -96,6 +100,44 @@ static void dpu_hw_lm_setup_border_color(struct dpu_hw_mixer *ctx,
>   	}
>   }
>   
> +static void dpu_hw_lm_setup_misr(struct dpu_hw_mixer *ctx, bool enable, u32 frame_count)
> +{
> +	struct dpu_hw_blk_reg_map *c = &ctx->hw;
> +	u32 config = 0;
> +
> +	DPU_REG_WRITE(c, LM_MISR_CTRL, MISR_CTRL_STATUS_CLEAR);
> +
> +	/* Clear MISR data */
> +	wmb();

Do we need wmb here? Maybe it would be more logical to setup 
LM_MISR_CTRL and clear the status afterwards?

> +
> +	if (enable)
> +		config = (frame_count & MISR_FRAME_COUNT_MASK) |
> +			MISR_CTRL_ENABLE | INTF_MISR_CTRL_FREE_RUN_MASK;
> +
> +	DPU_REG_WRITE(c, LM_MISR_CTRL, config);

I think the following might be better:

if (enable)
    DPU_REG_WRITE(c, LM_MISR_CTRL, config);
else
    DPU_REG_WRITE(c, LM_MISR_CTRL, 0);

> +}
> +
> +static int dpu_hw_lm_collect_misr(struct dpu_hw_mixer *ctx, u32 *misr_value)
> +{
> +	struct dpu_hw_blk_reg_map *c = &ctx->hw;
> +	u32 ctrl = 0;
> +
> +	if (!misr_value)
> +		return -EINVAL;
> +
> +	ctrl = DPU_REG_READ(c, LM_MISR_CTRL);
> +
> +	if (!(ctrl & MISR_CTRL_ENABLE))
> +		return -EINVAL;
> +
> +	if (!(ctrl & MISR_CTRL_STATUS))
> +		return -EINVAL;
> +
> +	*misr_value = DPU_REG_READ(c, LM_MISR_SIGNATURE);
> +
> +	return 0;
> +}
> +
>   static void dpu_hw_lm_setup_blend_config_sdm845(struct dpu_hw_mixer *ctx,
>   	u32 stage, u32 fg_alpha, u32 bg_alpha, u32 blend_op)
>   {
> @@ -158,6 +200,8 @@ static void _setup_mixer_ops(const struct dpu_mdss_cfg *m,
>   		ops->setup_blend_config = dpu_hw_lm_setup_blend_config;
>   	ops->setup_alpha_out = dpu_hw_lm_setup_color3;
>   	ops->setup_border_color = dpu_hw_lm_setup_border_color;
> +	ops->setup_misr = dpu_hw_lm_setup_misr;
> +	ops->collect_misr = dpu_hw_lm_collect_misr;
>   }
>   
>   struct dpu_hw_mixer *dpu_hw_lm_init(enum dpu_lm idx,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h
> index 4a6b2de19ef6..d8052fb2d5da 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h
> @@ -1,5 +1,6 @@
>   /* SPDX-License-Identifier: GPL-2.0-only */
> -/* Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
> +/*
> + * Copyright (c) 2015-2021, The Linux Foundation. All rights reserved.
>    */
>   
>   #ifndef _DPU_HW_LM_H
> @@ -53,6 +54,16 @@ struct dpu_hw_lm_ops {
>   	void (*setup_border_color)(struct dpu_hw_mixer *ctx,
>   		struct dpu_mdss_color *color,
>   		u8 border_en);
> +
> +	/**
> +	 * setup_misr: Enable/disable MISR
> +	 */
> +	void (*setup_misr)(struct dpu_hw_mixer *ctx, bool enable, u32 frame_count);
> +
> +	/**
> +	 * collect_misr: Read MISR signature
> +	 */
> +	int (*collect_misr)(struct dpu_hw_mixer *ctx, u32 *misr_value);
>   };
>   
>   struct dpu_hw_mixer {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
> index ff3cffde84cd..506d4af7d018 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
> @@ -1,5 +1,6 @@
>   /* SPDX-License-Identifier: GPL-2.0-only */
> -/* Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
> +/*
> + * Copyright (c) 2015-2021, The Linux Foundation. All rights reserved.
>    */
>   
>   #ifndef _DPU_HW_UTIL_H
> @@ -309,6 +310,12 @@ int dpu_reg_read(struct dpu_hw_blk_reg_map *c, u32 reg_off);
>   #define DPU_REG_WRITE(c, off, val) dpu_reg_write(c, off, val, #off)
>   #define DPU_REG_READ(c, off) dpu_reg_read(c, off)
>   
> +#define MISR_FRAME_COUNT_MASK           0xFF
> +#define MISR_CTRL_ENABLE                BIT(8)
> +#define MISR_CTRL_STATUS                BIT(9)
> +#define MISR_CTRL_STATUS_CLEAR          BIT(10)
> +#define INTF_MISR_CTRL_FREE_RUN_MASK    BIT(31)
> +

This seems totally unrelated to dpu_hw_util.h  Please move to 
dpu_hw_lm.c where they belong. And please fix the prefixes.

>   void *dpu_hw_util_get_dir(void);
>   
>   void dpu_hw_setup_scaler3(struct dpu_hw_blk_reg_map *c,
> 


-- 
With best wishes
Dmitry
