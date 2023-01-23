Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F187F6789C9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jan 2023 22:39:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231538AbjAWVj6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Jan 2023 16:39:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229956AbjAWVj5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Jan 2023 16:39:57 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C3A317CD1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jan 2023 13:39:55 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id tz11so34242563ejc.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jan 2023 13:39:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+m2DorGiAzX07nhbKkoDqdKm/qT7fI7EegRa/16DqAc=;
        b=pcstfNA6Q7+kMFjybltqfK5V5cdtGCKu6I0WtsgOr1a3IHu55rxTRo8aNRPUaawh1h
         6VwUEd4q1NsktDwGJzt6UTXkgz+bLv5P+jjzcWNS9uNZW8dGyWLhqUO4qqkEz+t8kjA4
         I74ykZlUFo8pDh+wbaXStFrXm7HCdech9MW1BoN/NDe4JNmDzeYIBD4xRbZX2LtFclCP
         3wlaiuYG6uBrGwY9C0a4oPuzsiGiXv6V4BYhQzgV254rK9wa5tOiqixBDImnvneVAwT+
         EIVBnCWlZN4E9XE1yqGFDb6i3kwiVAYFx5RqNZVVqyPAyP1gTlvbec0bqpI38G/d7C2N
         Cm5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+m2DorGiAzX07nhbKkoDqdKm/qT7fI7EegRa/16DqAc=;
        b=RimYOegPhNaDB1LJ8qJ7izxp+H5SwuDpGpDDwizAd29nn/xChCu1xQN/QU8aNfPZ8A
         /YCC/FeL7n9mX0erSU5oYpWCELMfHBQbroBJPkrhBgU7/MTkQaCiqzOoLIk2KDLFQ8Pu
         eFCkghn4Qj3MbQDTG5yn6EmHOWWqOe0Lvy6Lk+RS1h3uYbqgPLDuzm49J0aGrV7UoFir
         l7joDovfYDqIjNCcqqHT1uVtBknRkAgSWTBusp/JMkpuWR0dW8bhiEs9mbStTSauG3zT
         Cg7OKFMDbOG0RT1gg5/MZDLzce/2vB51olDYIbUUKQOyhxoWZneON5td/oKhPKWYD3+o
         jvgA==
X-Gm-Message-State: AFqh2kpresnv6QOax5dL37uFTZSdCoaGDA1ppXF+d0NooLijmWTpx2+Z
        YjmOpPVtV43mpTl+xEJj85Ea7rq1O8Sm7LWfVVA=
X-Google-Smtp-Source: AMrXdXs8vpu3MvYIqubmLU6AOJ6d1avIIa6dm7HOycBsnHdN90Se43nWk7UvjibEBqRDD/TXNdwCkA==
X-Received: by 2002:a17:907:629c:b0:86e:9345:e701 with SMTP id nd28-20020a170907629c00b0086e9345e701mr35780664ejc.2.1674509993518;
        Mon, 23 Jan 2023 13:39:53 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id bs3-20020a170906d1c300b008490dcae01asm22639616ejb.214.2023.01.23.13.39.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 13:39:53 -0800 (PST)
Message-ID: <52023c54-946a-4890-f8c7-ac5c7e6c3315@linaro.org>
Date:   Mon, 23 Jan 2023 23:39:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v1 12/14] drm/msm/disp/dpu1: revise timing engine
 programming to work for DSC
Content-Language: en-GB
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>,
        dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        sean@poorly.run, swboyd@chromium.org, dianders@chromium.org,
        vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
        agross@kernel.org, andersson@kernel.org
Cc:     quic_abhinavk@quicinc.com, quic_sbillaka@quicinc.com,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1674498274-6010-1-git-send-email-quic_khsieh@quicinc.com>
 <1674498274-6010-13-git-send-email-quic_khsieh@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1674498274-6010-13-git-send-email-quic_khsieh@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 23/01/2023 20:24, Kuogee Hsieh wrote:
> Current implementation timing engine programming does not consider
> compression factors. This patch add consideration of DSC factors
> while programming timing engine.
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |   2 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |  14 ++-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        | 132 +++++++++++++--------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h        |  10 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h         |   6 +-
>   5 files changed, 110 insertions(+), 54 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> index 2d864f9..3330e185 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> @@ -279,6 +279,8 @@ static void dpu_encoder_phys_vid_setup_timing_engine(
>   	if (phys_enc->hw_pp->merge_3d)
>   		intf_cfg.merge_3d = phys_enc->hw_pp->merge_3d->idx;
>   
> +	phys_enc->hw_intf->hw_rev = phys_enc->dpu_kms->core_rev;
> +
>   	spin_lock_irqsave(phys_enc->enc_spinlock, lock_flags);
>   	phys_enc->hw_intf->ops.setup_timing_gen(phys_enc->hw_intf,
>   			&timing_params, fmt);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 7b0b092..c6ee789 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -43,16 +43,22 @@
>   #define DPU_HW_VER_500	DPU_HW_VER(5, 0, 0) /* sm8150 v1.0 */
>   #define DPU_HW_VER_501	DPU_HW_VER(5, 0, 1) /* sm8150 v2.0 */
>   #define DPU_HW_VER_510	DPU_HW_VER(5, 1, 1) /* sc8180 */
> -#define DPU_HW_VER_600	DPU_HW_VER(6, 0, 0) /* sm8250 */
> +#define DPU_HW_VER_600	DPU_HW_VER(6, 0, 0) /* sm8250, kona */
>   #define DPU_HW_VER_620	DPU_HW_VER(6, 2, 0) /* sc7180 v1.0 */
>   #define DPU_HW_VER_630	DPU_HW_VER(6, 3, 0) /* sm6115|sm4250 */
>   #define DPU_HW_VER_650	DPU_HW_VER(6, 5, 0) /* qcm2290|sm4125 */
> -#define DPU_HW_VER_700	DPU_HW_VER(7, 0, 0) /* sm8350 */
> +#define DPU_HW_VER_700	DPU_HW_VER(7, 0, 0) /* sm8350, lahaina */
>   #define DPU_HW_VER_720	DPU_HW_VER(7, 2, 0) /* sc7280 */
>   #define DPU_HW_VER_800	DPU_HW_VER(8, 0, 0) /* sc8280xp */
> -#define DPU_HW_VER_810	DPU_HW_VER(8, 1, 0) /* sm8450 */
> +#define DPU_HW_VER_810	DPU_HW_VER(8, 1, 0) /* sm8450, waipio */
>   #define DPU_HW_VER_900	DPU_HW_VER(9, 0, 0) /* sm8550 */

No.

>   
> +/* Avoid using below IS_XXX macros outside catalog, use feature bit instead */
> +#define IS_DPU_MAJOR_SAME(rev1, rev2)   \
> +		(DPU_HW_MAJOR((rev1)) == DPU_HW_MAJOR((rev2)))
> +#define IS_DPU_MAJOR_MINOR_SAME(rev1, rev2)   \
> +		(DPU_HW_MAJOR_MINOR((rev1)) == DPU_HW_MAJOR_MINOR((rev2)))
> +
>   #define IS_MSM8996_TARGET(rev) IS_DPU_MAJOR_MINOR_SAME((rev), DPU_HW_VER_170)
>   #define IS_MSM8998_TARGET(rev) IS_DPU_MAJOR_MINOR_SAME((rev), DPU_HW_VER_300)
>   #define IS_SDM845_TARGET(rev) IS_DPU_MAJOR_MINOR_SAME((rev), DPU_HW_VER_400)
> @@ -240,6 +246,7 @@ enum {
>    * @DPU_INTF_INPUT_CTRL         Supports the setting of pp block from which
>    *                              pixel data arrives to this INTF
>    * @DPU_INTF_TE                 INTF block has TE configuration support
> + * @DPU_INTF_TE_ALIGN_VSYNC     INTF block has POMS Align vsync support
>    * @DPU_DATA_HCTL_EN            Allows data to be transferred at different rate
>                                   than video timing
>    * @DPU_INTF_MAX
> @@ -247,6 +254,7 @@ enum {
>   enum {
>   	DPU_INTF_INPUT_CTRL = 0x1,
>   	DPU_INTF_TE,
> +	DPU_INTF_TE_ALIGN_VSYNC,
>   	DPU_DATA_HCTL_EN,
>   	DPU_INTF_MAX
>   };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> index 7ce66bf..238efdb 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> @@ -1,6 +1,6 @@
>   // SPDX-License-Identifier: GPL-2.0-only
>   /*
> - * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2022-2023, Qualcomm Innovation Center, Inc. All rights reserved.
>    * Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
>    */
>   
> @@ -44,6 +44,7 @@
>   #define   INTF_DEFLICKER_STRNG_COEFF    0x0F4
>   #define   INTF_DEFLICKER_WEAK_COEFF     0x0F8
>   
> +#define   INTF_REG_SPLIT_LINK           0x080
>   #define   INTF_DSI_CMD_MODE_TRIGGER_EN  0x084
>   #define   INTF_PANEL_FORMAT             0x090
>   #define   INTF_TPG_ENABLE               0x100
> @@ -65,9 +66,9 @@
>   
>   #define INTF_CFG_ACTIVE_H_EN	BIT(29)
>   #define INTF_CFG_ACTIVE_V_EN	BIT(30)
> -
>   #define INTF_CFG2_DATABUS_WIDEN	BIT(0)
>   #define INTF_CFG2_DATA_HCTL_EN	BIT(4)
> +#define INTF_CFG2_ALIGN_VSYNC_TO_TE BIT(16)
>   
>   #define INTF_MISR_CTRL			0x180
>   #define INTF_MISR_SIGNATURE		0x184
> @@ -91,6 +92,16 @@ static const struct dpu_intf_cfg *_intf_offset(enum dpu_intf intf,
>   	return ERR_PTR(-EINVAL);
>   }
>   
> +static inline void _check_and_set_comp_bit(struct dpu_hw_intf *ctx,
> +		bool dsc_4hs_merge, bool compression_en, u32 *intf_cfg2)
> +{
> +	if (((DPU_HW_MAJOR(ctx->hw_rev) >= DPU_HW_MAJOR(DPU_HW_VER_700)) && compression_en)
> +		|| (IS_DPU_MAJOR_SAME(ctx->hw_rev, DPU_HW_VER_600) && dsc_4hs_merge))
> +		(*intf_cfg2) |= BIT(12);
> +	else if (!compression_en)
> +		(*intf_cfg2) &= ~BIT(12);

NAK. Make this into a sensible API rather than poking at DPU revision. 
Not to mention that this BIT(12) should be defined somewhere.

> +}
> +
>   static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
>   		const struct intf_timing_params *p,
>   		const struct dpu_format *fmt)
> @@ -113,82 +124,96 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
>   	/* read interface_cfg */
>   	intf_cfg = DPU_REG_READ(c, INTF_CONFIG);
>   
> -	if (ctx->cap->type == INTF_DP)
> +	if (ctx->cap->type == INTF_EDP || ctx->cap->type == INTF_DP)

You remember, we have been here. INTF_EDP is for old (msm8974,  apq8084) 
eDP.

>   		dp_intf = true;
>   
>   	hsync_period = p->hsync_pulse_width + p->h_back_porch + p->width +
> -	p->h_front_porch;
> +			p->h_front_porch;
>   	vsync_period = p->vsync_pulse_width + p->v_back_porch + p->height +
> -	p->v_front_porch;
> +			p->v_front_porch;
>   
>   	display_v_start = ((p->vsync_pulse_width + p->v_back_porch) *
> -	hsync_period) + p->hsync_skew;
> +			hsync_period) + p->hsync_skew;
>   	display_v_end = ((vsync_period - p->v_front_porch) * hsync_period) +
> -	p->hsync_skew - 1;
> +			p->hsync_skew - 1;

As usual. A mixture of formatting changes and data changes. Please turn 
this into reviewable changes. Split them into atomic commits. Rewriting 
the whole function is not revieweable and has no way to go in.

> +
> +	hsync_ctl = (hsync_period << 16) | p->hsync_pulse_width;
>   
>   	hsync_start_x = p->h_back_porch + p->hsync_pulse_width;
>   	hsync_end_x = hsync_period - p->h_front_porch - 1;
>   
> -	if (p->width != p->xres) { /* border fill added */
> -		active_h_start = hsync_start_x;
> -		active_h_end = active_h_start + p->xres - 1;
> -	} else {
> -		active_h_start = 0;
> -		active_h_end = 0;
> -	}
> -
> -	if (p->height != p->yres) { /* border fill added */
> -		active_v_start = display_v_start;
> -		active_v_end = active_v_start + (p->yres * hsync_period) - 1;
> -	} else {
> -		active_v_start = 0;
> -		active_v_end = 0;
> -	}
> -
> -	if (active_h_end) {
> -		active_hctl = (active_h_end << 16) | active_h_start;
> -		intf_cfg |= INTF_CFG_ACTIVE_H_EN;
> -	} else {
> -		active_hctl = 0;
> -	}
> -
> -	if (active_v_end)
> -		intf_cfg |= INTF_CFG_ACTIVE_V_EN;
> -
> -	hsync_ctl = (hsync_period << 16) | p->hsync_pulse_width;
> -	display_hctl = (hsync_end_x << 16) | hsync_start_x;
> -
>   	/*
>   	 * DATA_HCTL_EN controls data timing which can be different from
>   	 * video timing. It is recommended to enable it for all cases, except
>   	 * if compression is enabled in 1 pixel per clock mode
>   	 */
> +	if (!p->compression_en || p->wide_bus_en)
> +		intf_cfg2 |= INTF_CFG2_DATA_HCTL_EN;
> +
>   	if (p->wide_bus_en)
> -		intf_cfg2 |= INTF_CFG2_DATABUS_WIDEN | INTF_CFG2_DATA_HCTL_EN;
> +		intf_cfg2 |= INTF_CFG2_DATABUS_WIDEN;
>   
> +	/*
> +	 * If widebus is disabled:
> +	 * For uncompressed stream, the data is valid for the entire active
> +	 * window period.
> +	 * For compressed stream, data is valid for a shorter time period
> +	 * inside the active window depending on the compression ratio.
> +	 *
> +	 * If widebus is enabled:
> +	 * For uncompressed stream, data is valid for only half the active
> +	 * window, since the data rate is doubled in this mode.
> +	 * p->width holds the adjusted width for DP but unadjusted width for DSI
> +	 * For compressed stream, data validity window needs to be adjusted for
> +	 * compression ratio and then further halved.
> +	 */
>   	data_width = p->width;
>   
> +	if (p->compression_en) {
> +		if (p->wide_bus_en)
> +			data_width = DIV_ROUND_UP(p->dce_bytes_per_line, 6);
> +		else
> +			data_width = DIV_ROUND_UP(p->dce_bytes_per_line, 3);
> +	} else if (!dp_intf && p->wide_bus_en) {
> +		data_width = p->width >> 1;
> +	} else {
> +		data_width = p->width;
> +	}
> +
>   	hsync_data_start_x = hsync_start_x;
>   	hsync_data_end_x =  hsync_start_x + data_width - 1;
>   
> +	display_hctl = (hsync_end_x << 16) | hsync_start_x;
>   	display_data_hctl = (hsync_data_end_x << 16) | hsync_data_start_x;
>   
>   	if (dp_intf) {
>   		/* DP timing adjustment */
>   		display_v_start += p->hsync_pulse_width + p->h_back_porch;
>   		display_v_end   -= p->h_front_porch;
> +	}
> +
> +	intf_cfg |= INTF_CFG_ACTIVE_H_EN;
> +	intf_cfg |= INTF_CFG_ACTIVE_V_EN;
> +	active_h_start = hsync_start_x;
> +	active_h_end = active_h_start + p->xres - 1;
> +	active_v_start = display_v_start;
> +	active_v_end = active_v_start + (p->yres * hsync_period) - 1;
>   
> -		active_h_start = hsync_start_x;
> -		active_h_end = active_h_start + p->xres - 1;
> -		active_v_start = display_v_start;
> -		active_v_end = active_v_start + (p->yres * hsync_period) - 1;
> +	active_hctl = (active_h_end << 16) | active_h_start;
>   
> -		active_hctl = (active_h_end << 16) | active_h_start;
> +	if (dp_intf) {
>   		display_hctl = active_hctl;
>   
> -		intf_cfg |= INTF_CFG_ACTIVE_H_EN | INTF_CFG_ACTIVE_V_EN;
> +		if (p->compression_en) {
> +			active_data_hctl = (hsync_start_x + p->extra_dto_cycles) << 16;
> +			active_data_hctl += hsync_start_x;
> +
> +			display_data_hctl = active_data_hctl;
> +		}
>   	}
>   
> +	_check_and_set_comp_bit(ctx, p->dsc_4hs_merge, p->compression_en, &intf_cfg2);
> +
>   	den_polarity = 0;
>   	if (ctx->cap->type == INTF_HDMI) {
>   		hsync_polarity = p->yres >= 720 ? 0 : 1;
> @@ -202,7 +227,7 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
>   	}
>   	polarity_ctl = (den_polarity << 2) | /*  DEN Polarity  */
>   		(vsync_polarity << 1) | /* VSYNC Polarity */
> -		(hsync_polarity << 0);  /* HSYNC Polarity */
> +		 (hsync_polarity << 0);  /* HSYNC Polarity */
>   
>   	if (!DPU_FORMAT_IS_YUV(fmt))
>   		panel_format = (fmt->bits[C0_G_Y] |
> @@ -216,6 +241,17 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
>   				(COLOR_8BIT << 4) |
>   				(0x21 << 8));
>   
> +	if (p->wide_bus_en)
> +		intf_cfg2 |= INTF_CFG2_DATABUS_WIDEN;
> +
> +	/* Synchronize timing engine enable to TE */
> +	if ((ctx->cap->features & BIT(DPU_INTF_TE_ALIGN_VSYNC))
> +			&& p->poms_align_vsync)
> +		intf_cfg2 |= INTF_CFG2_ALIGN_VSYNC_TO_TE;
> +
> +	if (ctx->cfg.split_link_en)
> +		DPU_REG_WRITE(c, INTF_REG_SPLIT_LINK, 0x3);
> +
>   	DPU_REG_WRITE(c, INTF_HSYNC_CTL, hsync_ctl);
>   	DPU_REG_WRITE(c, INTF_VSYNC_PERIOD_F0, vsync_period * hsync_period);
>   	DPU_REG_WRITE(c, INTF_VSYNC_PULSE_WIDTH_F0,
> @@ -233,11 +269,9 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
>   	DPU_REG_WRITE(c, INTF_FRAME_LINE_COUNT_EN, 0x3);
>   	DPU_REG_WRITE(c, INTF_CONFIG, intf_cfg);
>   	DPU_REG_WRITE(c, INTF_PANEL_FORMAT, panel_format);
> -	if (ctx->cap->features & BIT(DPU_DATA_HCTL_EN)) {
> -		DPU_REG_WRITE(c, INTF_CONFIG2, intf_cfg2);
> -		DPU_REG_WRITE(c, INTF_DISPLAY_DATA_HCTL, display_data_hctl);
> -		DPU_REG_WRITE(c, INTF_ACTIVE_DATA_HCTL, active_data_hctl);
> -	}
> +	DPU_REG_WRITE(c, INTF_CONFIG2, intf_cfg2);
> +	DPU_REG_WRITE(c, INTF_DISPLAY_DATA_HCTL, display_data_hctl);
> +	DPU_REG_WRITE(c, INTF_ACTIVE_DATA_HCTL, active_data_hctl);
>   }
>   
>   static void dpu_hw_intf_enable_timing_engine(
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> index 643dd10..57be86d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> @@ -1,6 +1,6 @@
>   /* SPDX-License-Identifier: GPL-2.0-only */
>   /*
> - * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2022-2023, Qualcomm Innovation Center, Inc. All rights reserved.
>    * Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
>    */
>   
> @@ -10,6 +10,7 @@
>   #include "dpu_hw_catalog.h"
>   #include "dpu_hw_mdss.h"
>   #include "dpu_hw_util.h"
> +#include "dpu_hw_top.h"
>   
>   struct dpu_hw_intf;
>   
> @@ -33,6 +34,11 @@ struct intf_timing_params {
>   	u32 hsync_skew;
>   
>   	bool wide_bus_en;
> +	bool compression_en;
> +	u32 extra_dto_cycles;   /* for DP only */
> +	bool dsc_4hs_merge;     /* DSC 4HS merge */
> +	bool poms_align_vsync;  /* poms with vsync aligned */
> +	u32 dce_bytes_per_line;
>   };
>   
>   struct intf_prog_fetch {
> @@ -86,11 +92,13 @@ struct dpu_hw_intf_ops {
>   
>   struct dpu_hw_intf {
>   	struct dpu_hw_blk_reg_map hw;
> +	u32 hw_rev;	/* mdss hw_rev */
>   
>   	/* intf */
>   	enum dpu_intf idx;
>   	const struct dpu_intf_cfg *cap;
>   	const struct dpu_mdss_cfg *mdss;
> +	struct split_pipe_cfg cfg;
>   
>   	/* ops */
>   	struct dpu_hw_intf_ops ops;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h
> index a1a9e44..1212fa2 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h
> @@ -1,5 +1,7 @@
>   /* SPDX-License-Identifier: GPL-2.0-only */
> -/* Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
> +/*
> + * Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
>    */
>   
>   #ifndef _DPU_HW_TOP_H
> @@ -34,12 +36,14 @@ struct traffic_shaper_cfg {
>    * @intf      : Interface id for main control path
>    * @split_flush_en: Allows both the paths to be flushed when master path is
>    *              flushed
> + * @split_link_en:  Check if split link is enabled
>    */
>   struct split_pipe_cfg {
>   	bool en;
>   	enum dpu_intf_mode mode;
>   	enum dpu_intf intf;
>   	bool split_flush_en;
> +	bool split_link_en;
>   };
>   
>   /**

-- 
With best wishes
Dmitry

