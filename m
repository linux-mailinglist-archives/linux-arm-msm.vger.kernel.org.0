Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 272554B0BFF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Feb 2022 12:13:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240666AbiBJLNx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Feb 2022 06:13:53 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:48148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235688AbiBJLNw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Feb 2022 06:13:52 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96AEFCCA
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Feb 2022 03:13:53 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id 13so9716006lfp.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Feb 2022 03:13:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=oJDCoiutr8vf5YbaLkWj3Md5jRXFjDATVFVc73zTlO4=;
        b=tqTWjE0emnnEVVDqkiruTk9iUuvpPKmh3E0rPYH8TtvlVptcSmIUhw7brCsf/fNXgR
         Dhpg+T/bYw8m+eFKQdLpp8u8YkOmwOT9Zz3ZIV1PtSdMOb0r5fcgigNVam8QOQfOYXRQ
         +6QB/6iFXsqPUnev0XQROsvj5RNJSC5EMmf10C9/sSb07mlr+1FyD10qlAnLLJfzGdsI
         8ARUsIL535nFmO/iUNQ1bnsrJcW+Up60nUVWClXGtXKyrXA6trGQZuji2aXPs9/K7vqa
         EnaMazKitqvb1rKqBY0Y4NJ9P1Fm1iY7gDjOhcbmJA/0Uu0VaD9btwMi4pqgrZFWpJ5r
         80mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=oJDCoiutr8vf5YbaLkWj3Md5jRXFjDATVFVc73zTlO4=;
        b=Y8R0v1Oc2WsFjrS1t2SZGbXBfIqWfkyKVeTcfA1ZsX72kwIocjx2Oju3qxMkcga3rH
         HB5JSOUUVXy8KeskyjoXxtMjxqyl46nKM0rD6bhYXqt8KyTZJql3BDXKj/S0dw7RsnNf
         qOTZkokoBf5mJWGqHSWf1criTO3S/FNdNbZoIPNGvwh7kFPBtO7jmeH8ryFN0yGY3kko
         H7n37tIdsX/wUBrF+A2x9fq3/Yl9J3k0WuQHGoV554qaf7w05FMnQAKt6zCDi2UFOH6O
         3AVt1rwam1I5nxcBPshaEDMbmYZhnixRHSRcpGIFR2S9D9fq5SXrDaWW4YlrXNoZ58Nk
         CL5w==
X-Gm-Message-State: AOAM530rtI4ySz6bDEkOcaU4cjz4fIH5WVDO4tEsomiqpM0T3NYazsq+
        6xXLE9Ckl6nXHOaXnpY0eXs4UROMHSec1g==
X-Google-Smtp-Source: ABdhPJwXrWVvUCG7QjcWH2MIZavnkxCAKl/OfkTpOtukGvVRaDApv/WHbFo9GFzCxrZXpAJ4inv7zQ==
X-Received: by 2002:a05:6512:1191:: with SMTP id g17mr4892062lfr.55.1644491631877;
        Thu, 10 Feb 2022 03:13:51 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id f26sm2752418lfm.251.2022.02.10.03.13.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Feb 2022 03:13:51 -0800 (PST)
Message-ID: <470a42b0-4b9e-33d4-37f4-0d7700207a18@linaro.org>
Date:   Thu, 10 Feb 2022 14:13:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [REPOST PATCH v4 07/13] drm/msm/disp/dpu1: Add support for DSC in
 encoder
Content-Language: en-GB
To:     Vinod Koul <vkoul@kernel.org>, Rob Clark <robdclark@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20220210103423.271016-1-vkoul@kernel.org>
 <20220210103423.271016-8-vkoul@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220210103423.271016-8-vkoul@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/02/2022 13:34, Vinod Koul wrote:
> We need to configure the encoder for DSC configuration and calculate DSC
> parameters for the given timing so this patch adds that support by
> adding dpu_encoder_prep_dsc() which is invoked when DSC is enabled.
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 164 +++++++++++++++++-
>   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |   8 +
>   2 files changed, 171 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 1e648db439f9..95a7bf362e81 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -21,6 +21,7 @@
>   #include "dpu_hw_intf.h"
>   #include "dpu_hw_ctl.h"
>   #include "dpu_hw_dspp.h"
> +#include "dpu_hw_dsc.h"
>   #include "dpu_formats.h"
>   #include "dpu_encoder_phys.h"
>   #include "dpu_crtc.h"
> @@ -136,6 +137,8 @@ enum dpu_enc_rc_states {
>    * @cur_slave:		As above but for the slave encoder.
>    * @hw_pp:		Handle to the pingpong blocks used for the display. No.
>    *			pingpong blocks can be different than num_phys_encs.
> + * @hw_dsc:		Handle to the DSC blocks used for the display.
> + * @dsc_mask:		The bitmask of used DSC blocks.
>    * @intfs_swapped:	Whether or not the phys_enc interfaces have been swapped
>    *			for partial update right-only cases, such as pingpong
>    *			split where virtual pingpong does not generate IRQs
> @@ -169,6 +172,7 @@ enum dpu_enc_rc_states {
>    * @topology:                   topology of the display
>    * @idle_timeout:		idle timeout duration in milliseconds
>    * @dp:				msm_dp pointer, for DP encoders
> + * @dsc:			msm_display_dsc_config pointer, for DSC-enabled encoders
>    */
>   struct dpu_encoder_virt {
>   	struct drm_encoder base;
> @@ -182,6 +186,9 @@ struct dpu_encoder_virt {
>   	struct dpu_encoder_phys *cur_master;
>   	struct dpu_encoder_phys *cur_slave;
>   	struct dpu_hw_pingpong *hw_pp[MAX_CHANNELS_PER_ENC];
> +	struct dpu_hw_dsc *hw_dsc[MAX_CHANNELS_PER_ENC];
> +
> +	unsigned int dsc_mask;
>   
>   	bool intfs_swapped;
>   
> @@ -209,6 +216,9 @@ struct dpu_encoder_virt {
>   	u32 idle_timeout;
>   
>   	struct msm_dp *dp;
> +
> +	/* DSC configuration */
> +	struct msm_display_dsc_config *dsc;
>   };
>   
>   #define to_dpu_encoder_virt(x) container_of(x, struct dpu_encoder_virt, base)
> @@ -972,7 +982,8 @@ static void dpu_encoder_virt_mode_set(struct drm_encoder *drm_enc,
>   	struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
>   	struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_ENC];
>   	struct dpu_hw_blk *hw_dspp[MAX_CHANNELS_PER_ENC] = { NULL };
> -	int num_lm, num_ctl, num_pp;
> +	struct dpu_hw_blk *hw_dsc[MAX_CHANNELS_PER_ENC];
> +	int num_lm, num_ctl, num_pp, num_dsc;
>   	int i, j;
>   
>   	if (!drm_enc) {
> @@ -1027,6 +1038,23 @@ static void dpu_encoder_virt_mode_set(struct drm_encoder *drm_enc,
>   		dpu_enc->hw_pp[i] = i < num_pp ? to_dpu_hw_pingpong(hw_pp[i])
>   						: NULL;
>   
> +	dpu_enc->dsc_mask = 0;
> +
> +	if (dpu_enc->dsc) {
> +		unsigned int dsc_mask = 0;
> +
> +		num_dsc = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> +							drm_enc->base.id, DPU_HW_BLK_DSC,
> +							hw_dsc, ARRAY_SIZE(hw_dsc));
> +		for (i = 0; i < MAX_CHANNELS_PER_ENC; i++)
> +			dpu_enc->hw_dsc[i] = i < num_dsc ? to_dpu_hw_dsc(hw_dsc[i]) : NULL;
> +
> +		for (i = 0; i < num_dsc; i++)
> +			dsc_mask |= BIT(dpu_enc->hw_dsc[i]->idx - DSC_0);
> +
> +		dpu_enc->dsc_mask = dsc_mask;
> +	}
> +
>   	cstate = to_dpu_crtc_state(drm_crtc->state);
>   
>   	for (i = 0; i < num_lm; i++) {
> @@ -1739,6 +1767,127 @@ static void dpu_encoder_vsync_event_work_handler(struct kthread_work *work)
>   			nsecs_to_jiffies(ktime_to_ns(wakeup_time)));
>   }
>   
> +static void
> +dpu_encoder_dsc_pclk_param_calc(struct msm_display_dsc_config *dsc, u32 width)
> +{
> +	int slice_count, slice_per_intf;
> +	int bytes_in_slice, total_bytes_per_intf;
> +
> +	if (!dsc || !dsc->drm->slice_width || !dsc->drm->slice_count) {
> +		DPU_ERROR("Invalid DSC/slices\n");
> +		return;
> +	}
> +
> +	slice_count = dsc->drm->slice_count;
> +	slice_per_intf = DIV_ROUND_UP(width, dsc->drm->slice_width);
> +
> +	/*
> +	 * If slice_count is greater than slice_per_intf then default to 1.
> +	 * This can happen during partial update.
> +	 */
> +	if (slice_count > slice_per_intf)
> +		slice_count = 1;
> +
> +	bytes_in_slice = DIV_ROUND_UP(dsc->drm->slice_width *
> +				      dsc->drm->bits_per_pixel, 8);
> +	total_bytes_per_intf = bytes_in_slice * slice_per_intf;
> +
> +	dsc->eol_byte_num = total_bytes_per_intf % 3;
> +	dsc->pclk_per_line =  DIV_ROUND_UP(total_bytes_per_intf, 3);
> +	dsc->bytes_in_slice = bytes_in_slice;
> +	dsc->bytes_per_pkt = bytes_in_slice * slice_count;
> +	dsc->pkt_per_line = slice_per_intf / slice_count;
> +}
> +
> +static void
> +dpu_encoder_dsc_initial_line_calc(struct msm_display_dsc_config *dsc,
> +				  u32 enc_ip_width)
> +{
> +	int ssm_delay, total_pixels, soft_slice_per_enc;
> +
> +	soft_slice_per_enc = enc_ip_width / dsc->drm->slice_width;
> +
> +	/*
> +	 * minimum number of initial line pixels is a sum of:
> +	 * 1. sub-stream multiplexer delay (83 groups for 8bpc,
> +	 *    91 for 10 bpc) * 3
> +	 * 2. for two soft slice cases, add extra sub-stream multiplexer * 3
> +	 * 3. the initial xmit delay
> +	 * 4. total pipeline delay through the "lock step" of encoder (47)
> +	 * 5. 6 additional pixels as the output of the rate buffer is
> +	 *    48 bits wide
> +	 */
> +	ssm_delay = ((dsc->drm->bits_per_component < 10) ? 84 : 92);
> +	total_pixels = ssm_delay * 3 + dsc->drm->initial_xmit_delay + 47;
> +	if (soft_slice_per_enc > 1)
> +		total_pixels += (ssm_delay * 3);
> +	dsc->initial_lines = DIV_ROUND_UP(total_pixels, dsc->drm->slice_width);
> +}
> +
> +static void dpu_encoder_dsc_pipe_cfg(struct dpu_hw_dsc *hw_dsc,
> +				     struct dpu_hw_pingpong *hw_pp,
> +				     struct msm_display_dsc_config *dsc,
> +				     u32 common_mode)
> +{
> +	if (hw_dsc->ops.dsc_config)
> +		hw_dsc->ops.dsc_config(hw_dsc, dsc, common_mode);
> +
> +	if (hw_dsc->ops.dsc_config_thresh)
> +		hw_dsc->ops.dsc_config_thresh(hw_dsc, dsc);
> +
> +	if (hw_pp->ops.setup_dsc)
> +		hw_pp->ops.setup_dsc(hw_pp);
> +
> +	if (hw_pp->ops.enable_dsc)
> +		hw_pp->ops.enable_dsc(hw_pp);
> +}
> +
> +static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
> +				 struct msm_display_dsc_config *dsc)
> +{
> +	/* coding only for 2LM, 2enc, 1 dsc config */
> +	struct dpu_encoder_phys *enc_master = dpu_enc->cur_master;
> +	struct dpu_hw_dsc *hw_dsc[MAX_CHANNELS_PER_ENC];
> +	struct dpu_hw_pingpong *hw_pp[MAX_CHANNELS_PER_ENC];
> +	int this_frame_slices;
> +	int intf_ip_w, enc_ip_w;
> +	int dsc_common_mode;
> +	int pic_width;
> +	int i;
> +
> +	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++) {
> +		hw_pp[i] = dpu_enc->hw_pp[i];
> +		hw_dsc[i] = dpu_enc->hw_dsc[i];
> +
> +		if (!hw_pp[i] || !hw_dsc[i]) {
> +			DPU_ERROR_ENC(dpu_enc, "invalid params for DSC\n");
> +			return;
> +		}
> +	}
> +
> +	dsc_common_mode = 0;
> +	pic_width = dsc->drm->pic_width;
> +
> +	dsc_common_mode = DSC_MODE_MULTIPLEX | DSC_MODE_SPLIT_PANEL;
> +	if (enc_master->intf_mode == INTF_MODE_VIDEO)
> +		dsc_common_mode |= DSC_MODE_VIDEO;
> +
> +	this_frame_slices = pic_width / dsc->drm->slice_width;
> +	intf_ip_w = this_frame_slices * dsc->drm->slice_width;
> +
> +	dpu_encoder_dsc_pclk_param_calc(dsc, intf_ip_w);
> +
> +	/*
> +	 * dsc merge case: when using 2 encoders for the same stream,
> +	 * no. of slices need to be same on both the encoders.
> +	 */
> +	enc_ip_w = intf_ip_w / 2;
> +	dpu_encoder_dsc_initial_line_calc(dsc, enc_ip_w);
> +
> +	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++)
> +		dpu_encoder_dsc_pipe_cfg(hw_dsc[i], hw_pp[i], dsc, dsc_common_mode);
> +}
> +
>   void dpu_encoder_prepare_for_kickoff(struct drm_encoder *drm_enc)
>   {
>   	struct dpu_encoder_virt *dpu_enc;
> @@ -1770,6 +1919,9 @@ void dpu_encoder_prepare_for_kickoff(struct drm_encoder *drm_enc)
>   			dpu_encoder_helper_hw_reset(dpu_enc->phys_encs[i]);
>   		}
>   	}
> +
> +	if (dpu_enc->dsc)
> +		dpu_encoder_prep_dsc(dpu_enc, dpu_enc->dsc);
>   }
>   
>   void dpu_encoder_kickoff(struct drm_encoder *drm_enc)
> @@ -2015,6 +2167,8 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
>   		dpu_enc->idle_pc_supported =
>   				dpu_kms->catalog->caps->has_idle_pc;
>   
> +	dpu_enc->dsc = disp_info->dsc;
> +
>   	mutex_lock(&dpu_enc->enc_lock);
>   	for (i = 0; i < disp_info->num_of_h_tiles && !ret; i++) {
>   		/*
> @@ -2244,3 +2398,11 @@ enum dpu_intf_mode dpu_encoder_get_intf_mode(struct drm_encoder *encoder)
>   
>   	return INTF_MODE_NONE;
>   }
> +
> +unsigned int dpu_encoder_helper_get_dsc(struct dpu_encoder_phys *phys_enc)
> +{
> +	struct drm_encoder *encoder = phys_enc->parent;
> +	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(encoder);
> +
> +	return dpu_enc->dsc_mask;
> +}
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> index e7270eb6b84b..7b90d644a41b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> @@ -332,6 +332,14 @@ static inline enum dpu_3d_blend_mode dpu_encoder_helper_get_3d_blend_mode(
>   	return BLEND_3D_NONE;
>   }
>   
> +/**
> + * dpu_encoder_helper_get_dsc - get DSC blocks mask for the DPU encoder
> + *   This helper function is used by physical encoder to get DSC blocks mask
> + *   used for this encoder.
> + * @phys_enc: Pointer to physical encoder structure
> + */
> +unsigned int dpu_encoder_helper_get_dsc(struct dpu_encoder_phys *phys_enc);
> +
>   /**
>    * dpu_encoder_helper_split_config - split display configuration helper function
>    *	This helper function may be used by physical encoders to configure


-- 
With best wishes
Dmitry
