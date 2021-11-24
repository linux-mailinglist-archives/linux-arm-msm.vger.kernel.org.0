Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7F5945C954
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Nov 2021 16:58:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347426AbhKXQBr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Nov 2021 11:01:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242495AbhKXQBp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Nov 2021 11:01:45 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47BBBC061714
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Nov 2021 07:58:35 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id 13so6390399ljj.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Nov 2021 07:58:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=e6NuXPMluDvkxfvWYiZIcn5H+GL3tgluY+HmVCZ5Ru4=;
        b=VaUv2vGOaITxJRfKf+oKJ+6ERe3bCWFxRwJztAbL3RmC+FQnPt4h4lPRbo5Sn/6Dnk
         lAIa8ArZEtzoRZe26RNyS8jjp1QO+wUqKtC2Qz1qn4GGgHi/4JT4322xXZ7qG3EnAG6L
         Wh7US3AlkJoymWyaAt3WldD4DHsnrjVPit0UY97GMXwaWnZRQydWCMhdSI5dzy7racS/
         DCpNuXuHceTQiudoAck1J51gGR/WTVs47HdJsYhaTdBN3rAWwBx51ZjJRcNK00aM/m2x
         D+pdjWz30bzeguJ7xJclxZGSxz+VHnfwYU5zmjWRi1wkzwTLZMM6uNNOWC9ZzjY4njpX
         Tp6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=e6NuXPMluDvkxfvWYiZIcn5H+GL3tgluY+HmVCZ5Ru4=;
        b=gBhZx2cFbz5dzNTGFdmPuqSOME5Etb4o43zYDxxR0HGxHxNDsKTnXxKFSUOJy7Hv57
         6C+EmpQM8KD+7ihMx8p25TZHAW4JjyvkkqPNzekKwuNs//9DbPj6Zczj2mJMKCJZhCqK
         QavfJkIwb+cX+XG8AZ6idW6jJ/5ysUZjh/1J/fZSoSR6ooX6fbOuL2M4APi6p1D2Vkki
         lnU1DwYUlWUglHVWjdbL39FHDoFCkAcpSfDfNzA0ooBu+gF/KEuze1mQPzMU6GEIp7VS
         kz3jPjH6h7mmse7Z77umJYkAi1c8MNaQyIrJYusJjLHKs2ABUgHCAh9iSXIt17jRciG2
         BVfQ==
X-Gm-Message-State: AOAM532OSlr7lnZmNxlDdA4tqwL69pgPPq6UD2tNF/iOBtJDBthWORrP
        +4M23zbx4xCPKYJcXQPuBO7ljQ==
X-Google-Smtp-Source: ABdhPJwtlGsSH9QEGaL2TRvwE5Z3ioHSzm9eQkgi3zKWkaDwhJAIKbxXrz91M3cghU+agLTtuBd+Mg==
X-Received: by 2002:a2e:86cc:: with SMTP id n12mr16561301ljj.275.1637769513526;
        Wed, 24 Nov 2021 07:58:33 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id r14sm17537lfp.305.2021.11.24.07.58.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Nov 2021 07:58:33 -0800 (PST)
Subject: Re: [PATCH v3 07/13] drm/msm/disp/dpu1: Add support for DSC in
 encoder
To:     Vinod Koul <vkoul@kernel.org>, Rob Clark <robdclark@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20211116062256.2417186-1-vkoul@kernel.org>
 <20211116062256.2417186-8-vkoul@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <e5c1a93f-8e9b-9423-b005-0d5e791fcda4@linaro.org>
Date:   Wed, 24 Nov 2021 18:58:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211116062256.2417186-8-vkoul@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 16/11/2021 09:22, Vinod Koul wrote:
> We need to configure the encoder for DSC configuration and calculate DSC
> parameters for the given timing so this patch adds that support by
> adding dpu_encoder_prep_dsc() which is invoked when DSC is enabled.
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 140 +++++++++++++++++++-
>   1 file changed, 139 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index e7ee4cfb8461..f2ff8a504918 100644
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
> @@ -136,6 +137,7 @@ enum dpu_enc_rc_states {
>    * @cur_slave:		As above but for the slave encoder.
>    * @hw_pp:		Handle to the pingpong blocks used for the display. No.
>    *			pingpong blocks can be different than num_phys_encs.
> + * @hw_dsc:		Handle to the DSC blocks used for the display.
>    * @intfs_swapped:	Whether or not the phys_enc interfaces have been swapped
>    *			for partial update right-only cases, such as pingpong
>    *			split where virtual pingpong does not generate IRQs
> @@ -182,6 +184,7 @@ struct dpu_encoder_virt {
>   	struct dpu_encoder_phys *cur_master;
>   	struct dpu_encoder_phys *cur_slave;
>   	struct dpu_hw_pingpong *hw_pp[MAX_CHANNELS_PER_ENC];
> +	struct dpu_hw_dsc *hw_dsc[MAX_CHANNELS_PER_ENC];
>   
>   	bool intfs_swapped;
>   
> @@ -972,7 +975,8 @@ static void dpu_encoder_virt_mode_set(struct drm_encoder *drm_enc,
>   	struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
>   	struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_ENC];
>   	struct dpu_hw_blk *hw_dspp[MAX_CHANNELS_PER_ENC] = { NULL };
> -	int num_lm, num_ctl, num_pp;
> +	struct dpu_hw_blk *hw_dsc[MAX_CHANNELS_PER_ENC];
> +	int num_lm, num_ctl, num_pp, num_dsc;
>   	int i, j;
>   
>   	if (!drm_enc) {
> @@ -1030,6 +1034,14 @@ static void dpu_encoder_virt_mode_set(struct drm_encoder *drm_enc,
>   		dpu_enc->hw_pp[i] = i < num_pp ? to_dpu_hw_pingpong(hw_pp[i])
>   						: NULL;
>   
> +	if (priv->dsc) {
> +		num_dsc = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> +							drm_enc->base.id, DPU_HW_BLK_DSC,
> +							hw_dsc, ARRAY_SIZE(hw_dsc));
> +		for (i = 0; i < MAX_CHANNELS_PER_ENC; i++)
> +			dpu_enc->hw_dsc[i] = i < num_dsc ? to_dpu_hw_dsc(hw_dsc[i]) : NULL;
> +	}
> +
>   	cstate = to_dpu_crtc_state(drm_crtc->state);
>   
>   	for (i = 0; i < num_lm; i++) {
> @@ -1772,10 +1784,132 @@ static void dpu_encoder_vsync_event_work_handler(struct kthread_work *work)
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
>   	struct dpu_encoder_phys *phys;
> +	struct msm_drm_private *priv;
>   	bool needs_hw_reset = false;
>   	unsigned int i;
>   
> @@ -1803,6 +1937,10 @@ void dpu_encoder_prepare_for_kickoff(struct drm_encoder *drm_enc)
>   			dpu_encoder_helper_hw_reset(dpu_enc->phys_encs[i]);
>   		}
>   	}
> +
> +	priv = drm_enc->dev->dev_private;
> +	if (priv->dsc)
> +		dpu_encoder_prep_dsc(dpu_enc, priv->dsc);

Only if the DSC is to be used for this encoder.

>   }
>   
>   void dpu_encoder_kickoff(struct drm_encoder *drm_enc)
> 


-- 
With best wishes
Dmitry
