Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3917B3FF71B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Sep 2021 00:25:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347560AbhIBW0P (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Sep 2021 18:26:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240849AbhIBW0N (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Sep 2021 18:26:13 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 697CFC061760
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Sep 2021 15:25:14 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id m4so6374316ljq.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Sep 2021 15:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=EkwVO2hD2hB+9MTyqfmSUkIn5V/zyHvYi/fydwkQZ5g=;
        b=HpSU1ds5TX0apiWOuZqDz7DHH9eYIJ4/OojAy7FF6JO/CP1lVBDlF9hvDCyBWgCCHx
         CPKIkrcoh35A4F5mgG3XXnBHNAsrm4ObGkD3rJ48nJ2m8Zr4FQavyfA0CZzHZAhwcHRU
         wxDX+EHSDpVUan9Ji9gxRTM+DNuZCzyiqb1D557UvIq01z19MpQov6SN2UoU9SrDAix3
         96B07qksyw74A7hcGH/A4P3UjBExwV98sBYLA3pM2ZQubIa2+dyEJVBTQd10UFA9/DLR
         7I/MTcziEAunCRziiebUQpLvJGw8U4t4KLD7EaagTw0cC2johu0hxp4z8j25o1ighJuZ
         zZVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=EkwVO2hD2hB+9MTyqfmSUkIn5V/zyHvYi/fydwkQZ5g=;
        b=e2KGNHXMbyZMeoZWeQtfMiY9p+ZHha+6HdrV000or0YRa15BY04wq+WnLOIYalsz5G
         ZfHRjHC8IcF7GvTUM3FkJ+bSOcDAn87HZpKyDJrAeFQZ3tUZlhiZoB2Fp7/RkRh3TZKp
         WVEp+SfvXBcxbupCjyRpXjvFY/VnVSMm+lS0uND1uw7dkoHfPGsd+qqqpD1VSpsKR0dD
         2InkleLuwi3gsoiux/BlKf8XaX7d5J0zrhl1tB0AyxZ19bcxGXTP8a0ouymfbBnVt5yQ
         N+csnygeto9B/Q3/Ktn0esZeeADf7adDTecgEuEhCY8Qo/lVmAjsVSFdgHrmeBDP46NO
         lcsw==
X-Gm-Message-State: AOAM5324RhXaNQ0TI9fgeFo2Pa5wfeVHYbIIAWtnUqPM7nvj710k9VAK
        1TCGAqzLppnbufadIze2TxqPRQ==
X-Google-Smtp-Source: ABdhPJzCJ8Chz6X60FdhrpAL2k3xb2VvaC3xqaYHVlHY3VrOj5u4F306oNSOA+BMiF++g5WWuGCORQ==
X-Received: by 2002:a05:651c:894:: with SMTP id d20mr392983ljq.483.1630621512647;
        Thu, 02 Sep 2021 15:25:12 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id i12sm374207ljm.116.2021.09.02.15.25.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Sep 2021 15:25:12 -0700 (PDT)
Subject: Re: [PATCH 2/3] drm/msm/dpu1: Add MSM8998 to hw catalog
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>, robdclark@gmail.com
Cc:     sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
        abhinavk@codeaurora.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, paul.bouchara@somainline.org,
        devicetree@vger.kernel.org
References: <20210901181138.1052653-1-angelogioacchino.delregno@somainline.org>
 <20210901181138.1052653-2-angelogioacchino.delregno@somainline.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <ded3641e-605f-a6db-5c86-795f8686b319@linaro.org>
Date:   Fri, 3 Sep 2021 01:25:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210901181138.1052653-2-angelogioacchino.delregno@somainline.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01/09/2021 21:11, AngeloGioacchino Del Regno wrote:
> Bringup functionality for MSM8998 in the DPU, driver which is mostly
> the same as SDM845 (just a few variations).
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 335 +++++++++++++++++-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   1 +
>   drivers/gpu/drm/msm/msm_drv.c                 |   1 +
>   3 files changed, 326 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index b131fd376192..f2cc715af782 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -16,6 +16,9 @@
>   	BIT(DPU_SSPP_CSC_10BIT) | BIT(DPU_SSPP_CDP) |\
>   	BIT(DPU_SSPP_TS_PREFILL) | BIT(DPU_SSPP_EXCL_RECT))
>   
> +#define VIG_MSM8998_MASK \
> +	(VIG_MASK | BIT(DPU_SSPP_SCALER_QSEED3))
> +
>   #define VIG_SDM845_MASK \
>   	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3))
>   
> @@ -25,6 +28,11 @@
>   #define VIG_SM8250_MASK \
>   	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3LITE))
>   
> +#define DMA_MSM8998_MASK \
> +	(BIT(DPU_SSPP_SRC) | BIT(DPU_SSPP_QOS) |\
> +	BIT(DPU_SSPP_TS_PREFILL) | BIT(DPU_SSPP_TS_PREFILL_REC1) |\
> +	BIT(DPU_SSPP_CDP) | BIT(DPU_SSPP_EXCL_RECT))
> +
>   #define DMA_SDM845_MASK \
>   	(BIT(DPU_SSPP_SRC) | BIT(DPU_SSPP_QOS) | BIT(DPU_SSPP_QOS_8LVL) |\
>   	BIT(DPU_SSPP_TS_PREFILL) | BIT(DPU_SSPP_TS_PREFILL_REC1) |\
> @@ -33,6 +41,9 @@
>   #define DMA_CURSOR_SDM845_MASK \
>   	(DMA_SDM845_MASK | BIT(DPU_SSPP_CURSOR))
>   
> +#define DMA_CURSOR_MSM8998_MASK \
> +	(DMA_MSM8998_MASK | BIT(DPU_SSPP_CURSOR))
> +
>   #define MIXER_SDM845_MASK \
>   	(BIT(DPU_MIXER_SOURCESPLIT) | BIT(DPU_DIM_LAYER))
>   
> @@ -49,6 +60,8 @@
>   
>   #define MERGE_3D_SM8150_MASK (0)
>   
> +#define DSPP_MSM8998_MASK (BIT(DPU_DSPP_PCC) | BIT(DPU_DSPP_GC))
> +
>   #define DSPP_SC7180_MASK BIT(DPU_DSPP_PCC)
>   
>   #define INTF_SDM845_MASK (0)
> @@ -181,6 +194,22 @@ static const uint32_t plane_formats_yuv[] = {
>    * DPU sub blocks config
>    *************************************************************/
>   /* DPU top level caps */
> +static const struct dpu_caps msm8998_dpu_caps = {
> +	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
> +	.max_mixer_blendstages = 0x7,
> +	.qseed_type = DPU_SSPP_SCALER_QSEED3,
> +	.smart_dma_rev = DPU_SSPP_SMART_DMA_V1,
> +	.ubwc_version = DPU_HW_UBWC_VER_10,
> +	.has_src_split = true,
> +	.has_dim_layer = true,
> +	.has_idle_pc = true,
> +	.has_3d_merge = true,
> +	.max_linewidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
> +	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
> +	.max_hdeci_exp = MAX_HORZ_DECIMATION,
> +	.max_vdeci_exp = MAX_VERT_DECIMATION,
> +};
> +
>   static const struct dpu_caps sdm845_dpu_caps = {
>   	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
>   	.max_mixer_blendstages = 0xb,
> @@ -251,6 +280,35 @@ static const struct dpu_caps sc7280_dpu_caps = {
>   	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>   };
>   
> +static const struct dpu_mdp_cfg msm8998_mdp[] = {
> +	{
> +	.name = "top_0", .id = MDP_TOP,
> +	.base = 0x0, .len = 0x458,
> +	.features = 0,
> +	.highest_bank_bit = 0x2,
> +	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
> +			.reg_off = 0x2AC, .bit_off = 0},
> +	.clk_ctrls[DPU_CLK_CTRL_VIG1] = {
> +			.reg_off = 0x2B4, .bit_off = 0},
> +	.clk_ctrls[DPU_CLK_CTRL_VIG2] = {
> +			.reg_off = 0x2BC, .bit_off = 0},
> +	.clk_ctrls[DPU_CLK_CTRL_VIG3] = {
> +			.reg_off = 0x2C4, .bit_off = 0},
> +	.clk_ctrls[DPU_CLK_CTRL_DMA0] = {
> +			.reg_off = 0x2AC, .bit_off = 8},
> +	.clk_ctrls[DPU_CLK_CTRL_DMA1] = {
> +			.reg_off = 0x2B4, .bit_off = 8},
> +	.clk_ctrls[DPU_CLK_CTRL_DMA2] = {
> +			.reg_off = 0x2C4, .bit_off = 8},
> +	.clk_ctrls[DPU_CLK_CTRL_DMA3] = {
> +			.reg_off = 0x2C4, .bit_off = 12},
> +	.clk_ctrls[DPU_CLK_CTRL_CURSOR0] = {
> +			.reg_off = 0x3A8, .bit_off = 15},
> +	.clk_ctrls[DPU_CLK_CTRL_CURSOR1] = {
> +			.reg_off = 0x3B0, .bit_off = 15},
> +	},
> +};
> +
>   static const struct dpu_mdp_cfg sdm845_mdp[] = {
>   	{
>   	.name = "top_0", .id = MDP_TOP,
> @@ -339,6 +397,39 @@ static const struct dpu_mdp_cfg sc7280_mdp[] = {
>   /*************************************************************
>    * CTL sub blocks config
>    *************************************************************/
> +static const struct dpu_ctl_cfg msm8998_ctl[] = {
> +	{
> +	.name = "ctl_0", .id = CTL_0,
> +	.base = 0x1000, .len = 0x94,
> +	.features = BIT(DPU_CTL_SPLIT_DISPLAY),
> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
> +	},
> +	{
> +	.name = "ctl_1", .id = CTL_1,
> +	.base = 0x1200, .len = 0x94,
> +	.features = 0,
> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
> +	},
> +	{
> +	.name = "ctl_2", .id = CTL_2,
> +	.base = 0x1400, .len = 0x94,
> +	.features = BIT(DPU_CTL_SPLIT_DISPLAY),
> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
> +	},
> +	{
> +	.name = "ctl_3", .id = CTL_3,
> +	.base = 0x1600, .len = 0x94,
> +	.features = 0,
> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
> +	},
> +	{
> +	.name = "ctl_4", .id = CTL_4,
> +	.base = 0x1800, .len = 0x94,
> +	.features = 0,
> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
> +	},
> +};
> +
>   static const struct dpu_ctl_cfg sdm845_ctl[] = {
>   	{
>   	.name = "ctl_0", .id = CTL_0,
> @@ -497,6 +588,15 @@ static const struct dpu_ctl_cfg sc7280_ctl[] = {
>   	.virt_num_formats = ARRAY_SIZE(plane_formats), \
>   	}
>   
> +static const struct dpu_sspp_sub_blks msm8998_vig_sblk_0 =
> +				_VIG_SBLK("0", 0, DPU_SSPP_SCALER_QSEED3);
> +static const struct dpu_sspp_sub_blks msm8998_vig_sblk_1 =
> +				_VIG_SBLK("1", 0, DPU_SSPP_SCALER_QSEED3);
> +static const struct dpu_sspp_sub_blks msm8998_vig_sblk_2 =
> +				_VIG_SBLK("2", 0, DPU_SSPP_SCALER_QSEED3);
> +static const struct dpu_sspp_sub_blks msm8998_vig_sblk_3 =
> +				_VIG_SBLK("3", 0, DPU_SSPP_SCALER_QSEED3);
> +
>   static const struct dpu_sspp_sub_blks sdm845_vig_sblk_0 =
>   				_VIG_SBLK("0", 5, DPU_SSPP_SCALER_QSEED3);
>   static const struct dpu_sspp_sub_blks sdm845_vig_sblk_1 =
> @@ -523,6 +623,25 @@ static const struct dpu_sspp_sub_blks sdm845_dma_sblk_3 = _DMA_SBLK("11", 4);
>   	.clk_ctrl = _clkctrl \
>   	}
>   
> +static const struct dpu_sspp_cfg msm8998_sspp[] = {
> +	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_MSM8998_MASK,
> +		msm8998_vig_sblk_0, 0,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
> +	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, VIG_MSM8998_MASK,
> +		msm8998_vig_sblk_1, 4,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
> +	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, VIG_MSM8998_MASK,
> +		msm8998_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
> +	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, VIG_MSM8998_MASK,
> +		msm8998_vig_sblk_3, 12,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
> +	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_MSM8998_MASK,
> +		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
> +	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_MSM8998_MASK,
> +		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
> +	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  DMA_CURSOR_MSM8998_MASK,
> +		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR0),
> +	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000,  DMA_CURSOR_MSM8998_MASK,
> +		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),
> +};
> +
>   static const struct dpu_sspp_cfg sdm845_sspp[] = {
>   	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SDM845_MASK,
>   		sdm845_vig_sblk_0, 0,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
> @@ -599,17 +718,6 @@ static const struct dpu_sspp_cfg sc7280_sspp[] = {
>    * MIXER sub blocks config
>    *************************************************************/
>   
> -/* SDM845 */
> -
> -static const struct dpu_lm_sub_blks sdm845_lm_sblk = {
> -	.maxwidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
> -	.maxblendstages = 11, /* excluding base layer */
> -	.blendstage_base = { /* offsets relative to mixer base */
> -		0x20, 0x38, 0x50, 0x68, 0x80, 0x98,
> -		0xb0, 0xc8, 0xe0, 0xf8, 0x110
> -	},
> -};
> -
>   #define LM_BLK(_name, _id, _base, _fmask, _sblk, _pp, _lmpair, _dspp) \
>   	{ \
>   	.name = _name, .id = _id, \
> @@ -621,6 +729,43 @@ static const struct dpu_lm_sub_blks sdm845_lm_sblk = {
>   	.dspp = _dspp \
>   	}
>   
> +/* MSM8998 */
> +
> +static const struct dpu_lm_sub_blks msm8998_lm_sblk = {
> +	.maxwidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
> +	.maxblendstages = 7, /* excluding base layer */
> +	.blendstage_base = { /* offsets relative to mixer base */
> +		0x20, 0x50, 0x80, 0xb0, 0x230,
> +		0x260, 0x290
> +	},
> +};
> +
> +static const struct dpu_lm_cfg msm8998_lm[] = {
> +	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK,
> +		&msm8998_lm_sblk, PINGPONG_0, LM_2, DSPP_0),
> +	LM_BLK("lm_1", LM_1, 0x45000, MIXER_SDM845_MASK,
> +		&msm8998_lm_sblk, PINGPONG_1, LM_5, DSPP_1),
> +	LM_BLK("lm_2", LM_2, 0x46000, MIXER_SDM845_MASK,
> +		&msm8998_lm_sblk, PINGPONG_2, LM_0, 0),
> +	LM_BLK("lm_3", LM_3, 0x47000, MIXER_SDM845_MASK,
> +		&msm8998_lm_sblk, PINGPONG_MAX, 0, 0),
> +	LM_BLK("lm_4", LM_4, 0x48000, MIXER_SDM845_MASK,
> +		&msm8998_lm_sblk, PINGPONG_MAX, 0, 0),
> +	LM_BLK("lm_5", LM_5, 0x49000, MIXER_SDM845_MASK,
> +		&msm8998_lm_sblk, PINGPONG_3, LM_1, 0),
> +};
> +
> +/* SDM845 */
> +
> +static const struct dpu_lm_sub_blks sdm845_lm_sblk = {
> +	.maxwidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
> +	.maxblendstages = 11, /* excluding base layer */
> +	.blendstage_base = { /* offsets relative to mixer base */
> +		0x20, 0x38, 0x50, 0x68, 0x80, 0x98,
> +		0xb0, 0xc8, 0xe0, 0xf8, 0x110
> +	},
> +};
> +
>   static const struct dpu_lm_cfg sdm845_lm[] = {
>   	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK,
>   		&sdm845_lm_sblk, PINGPONG_0, LM_1, 0),
> @@ -682,6 +827,13 @@ static const struct dpu_lm_cfg sc7280_lm[] = {
>   /*************************************************************
>    * DSPP sub blocks config
>    *************************************************************/
> +static const struct dpu_dspp_sub_blks msm8998_dspp_sblk = {
> +	.pcc = {.id = DPU_DSPP_PCC, .base = 0x1700,
> +		.len = 0x90, .version = 0x10007},
> +	.gc = { .id = DPU_DSPP_GC, .base = 0x17c0,
> +		.len = 0x90, .version = 0x10007},
> +};
> +
>   static const struct dpu_dspp_sub_blks sc7180_dspp_sblk = {
>   	.pcc = {.id = DPU_DSPP_PCC, .base = 0x1700,
>   		.len = 0x90, .version = 0x10000},
> @@ -700,6 +852,13 @@ static const struct dpu_dspp_sub_blks sm8150_dspp_sblk = {
>   		.sblk = _sblk \
>   		}
>   
> +static const struct dpu_dspp_cfg msm8998_dspp[] = {
> +	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_MSM8998_MASK,
> +		 &msm8998_dspp_sblk),
> +	DSPP_BLK("dspp_1", DSPP_1, 0x56000, DSPP_MSM8998_MASK,
> +		 &msm8998_dspp_sblk),
> +};
> +
>   static const struct dpu_dspp_cfg sc7180_dspp[] = {
>   	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
>   		 &sc7180_dspp_sblk),
> @@ -836,6 +995,13 @@ static const struct dpu_pingpong_cfg sc7280_pp[] = {
>   	.intr_vsync = DPU_IRQ_IDX(_reg, _vsync_bit), \
>   	}
>   
> +static const struct dpu_intf_cfg msm8998_intf[] = {
> +	INTF_BLK("intf_0", INTF_0, 0x6A000, INTF_DP, 0, 25, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> +	INTF_BLK("intf_1", INTF_1, 0x6A800, INTF_DSI, 0, 25, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> +	INTF_BLK("intf_2", INTF_2, 0x6B000, INTF_DSI, 1, 25, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
> +	INTF_BLK("intf_3", INTF_3, 0x6B800, INTF_HDMI, 0, 25, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
> +};
> +
>   static const struct dpu_intf_cfg sdm845_intf[] = {
>   	INTF_BLK("intf_0", INTF_0, 0x6A000, INTF_DP, 0, 24, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
>   	INTF_BLK("intf_1", INTF_1, 0x6A800, INTF_DSI, 0, 24, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> @@ -865,9 +1031,55 @@ static const struct dpu_intf_cfg sc7280_intf[] = {
>    * VBIF sub blocks config
>    *************************************************************/
>   /* VBIF QOS remap */
> +static const u32 msm8998_rt_pri_lvl[] = {1, 2, 2, 2};
> +static const u32 msm8998_nrt_pri_lvl[] = {1, 1, 1, 1};
>   static const u32 sdm845_rt_pri_lvl[] = {3, 3, 4, 4, 5, 5, 6, 6};
>   static const u32 sdm845_nrt_pri_lvl[] = {3, 3, 3, 3, 3, 3, 3, 3};
>   
> +static const struct dpu_vbif_dynamic_ot_cfg msm8998_ot_rdwr_cfg[] = {
> +	{
> +		.pps = 1088 * 1920 * 30,
> +		.ot_limit = 2,
> +	},
> +	{
> +		.pps = 1088 * 1920 * 60,
> +		.ot_limit = 6,
> +	},
> +	{
> +		.pps = 3840 * 2160 * 30,
> +		.ot_limit = 16,
> +	},
> +};
> +
> +static const struct dpu_vbif_cfg msm8998_vbif[] = {
> +	{
> +	.name = "vbif_0", .id = VBIF_0,
> +	.base = 0, .len = 0x1040,
> +	.default_ot_rd_limit = 32,
> +	.default_ot_wr_limit = 32,
> +	.features = BIT(DPU_VBIF_QOS_REMAP) | BIT(DPU_VBIF_QOS_OTLIM),
> +	.xin_halt_timeout = 0x4000,
> +	.dynamic_ot_rd_tbl = {
> +		.count = ARRAY_SIZE(msm8998_ot_rdwr_cfg),
> +		.cfg = msm8998_ot_rdwr_cfg,
> +		},
> +	.dynamic_ot_wr_tbl = {
> +		.count = ARRAY_SIZE(msm8998_ot_rdwr_cfg),
> +		.cfg = msm8998_ot_rdwr_cfg,
> +		},
> +	.qos_rt_tbl = {
> +		.npriority_lvl = ARRAY_SIZE(msm8998_rt_pri_lvl),
> +		.priority_lvl = msm8998_rt_pri_lvl,
> +		},
> +	.qos_nrt_tbl = {
> +		.npriority_lvl = ARRAY_SIZE(msm8998_nrt_pri_lvl),
> +		.priority_lvl = msm8998_nrt_pri_lvl,
> +		},
> +	.memtype_count = 14,
> +	.memtype = {2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2},
> +	},
> +};
> +
>   static const struct dpu_vbif_cfg sdm845_vbif[] = {
>   	{
>   	.name = "vbif_0", .id = VBIF_0,
> @@ -908,6 +1120,22 @@ static const struct dpu_reg_dma_cfg sm8250_regdma = {
>    *************************************************************/
>   
>   /* SSPP QOS LUTs */
> +static const struct dpu_qos_lut_entry msm8998_qos_linear[] = {
> +	{.fl = 4,  .lut = 0x1b},
> +	{.fl = 5,  .lut = 0x5b},
> +	{.fl = 6,  .lut = 0x15b},
> +	{.fl = 7,  .lut = 0x55b},
> +	{.fl = 8,  .lut = 0x155b},
> +	{.fl = 9,  .lut = 0x555b},
> +	{.fl = 10, .lut = 0x1555b},
> +	{.fl = 11, .lut = 0x5555b},
> +	{.fl = 12, .lut = 0x15555b},
> +	{.fl = 13, .lut = 0x55555b},
> +	{.fl = 14, .lut = 0},
> +	{.fl = 1,  .lut = 0x1b},
> +	{.fl = 0,  .lut = 0}
> +};
> +
>   static const struct dpu_qos_lut_entry sdm845_qos_linear[] = {
>   	{.fl = 4, .lut = 0x357},
>   	{.fl = 5, .lut = 0x3357},
> @@ -923,6 +1151,15 @@ static const struct dpu_qos_lut_entry sdm845_qos_linear[] = {
>   	{.fl = 0, .lut = 0x11222222223357}
>   };
>   
> +static const struct dpu_qos_lut_entry msm8998_qos_macrotile[] = {
> +	{.fl = 10, .lut = 0x1aaff},
> +	{.fl = 11, .lut = 0x5aaff},
> +	{.fl = 12, .lut = 0x15aaff},
> +	{.fl = 13, .lut = 0x55aaff},
> +	{.fl = 1,  .lut = 0x1aaff},
> +	{.fl = 0,  .lut = 0},
> +};
> +
>   static const struct dpu_qos_lut_entry sc7180_qos_linear[] = {
>   	{.fl = 0, .lut = 0x0011222222335777},
>   };
> @@ -944,6 +1181,10 @@ static const struct dpu_qos_lut_entry sc7180_qos_macrotile[] = {
>   	{.fl = 0, .lut = 0x0011223344556677},
>   };
>   
> +static const struct dpu_qos_lut_entry msm8998_qos_nrt[] = {
> +	{.fl = 0, .lut = 0x0},
> +};
> +
>   static const struct dpu_qos_lut_entry sdm845_qos_nrt[] = {
>   	{.fl = 0, .lut = 0x0},
>   };
> @@ -952,6 +1193,48 @@ static const struct dpu_qos_lut_entry sc7180_qos_nrt[] = {
>   	{.fl = 0, .lut = 0x0},
>   };
>   
> +static const struct dpu_perf_cfg msm8998_perf_data = {
> +	.max_bw_low = 6700000,
> +	.max_bw_high = 6700000,
> +	.min_core_ib = 2400000,
> +	.min_llcc_ib = 800000,
> +	.min_dram_ib = 800000,
> +	.core_ib_ff = "6.0",
> +	.core_clk_ff = "1.0",
> +	.comp_ratio_rt =
> +	"NV12/5/1/1.23 AB24/5/1/1.23 XB24/5/1/1.23",
> +	.comp_ratio_nrt =
> +	"NV12/5/1/1.25 AB24/5/1/1.25 XB24/5/1/1.25",
> +	.undersized_prefill_lines = 2,
> +	.xtra_prefill_lines = 2,
> +	.dest_scale_prefill_lines = 3,
> +	.macrotile_prefill_lines = 4,
> +	.yuv_nv12_prefill_lines = 8,
> +	.linear_prefill_lines = 1,
> +	.downscaling_prefill_lines = 1,
> +	.amortizable_threshold = 25,
> +	.min_prefill_lines = 25,
> +	.danger_lut_tbl = {0xf, 0xffff, 0x0},
> +	.safe_lut_tbl = {0xfffc, 0xff00, 0xffff},
> +	.qos_lut_tbl = {
> +		{.nentry = ARRAY_SIZE(msm8998_qos_linear),
> +		.entries = msm8998_qos_linear
> +		},
> +		{.nentry = ARRAY_SIZE(msm8998_qos_macrotile),
> +		.entries = msm8998_qos_macrotile
> +		},
> +		{.nentry = ARRAY_SIZE(msm8998_qos_nrt),
> +		.entries = msm8998_qos_nrt
> +		},
> +	},
> +	.cdp_cfg = {
> +		{.rd_enable = 1, .wr_enable = 1},
> +		{.rd_enable = 1, .wr_enable = 0}
> +	},
> +	.clk_inefficiency_factor = 200,
> +	.bw_inefficiency_factor = 120,
> +};
> +
>   static const struct dpu_perf_cfg sdm845_perf_data = {
>   	.max_bw_low = 6800000,
>   	.max_bw_high = 6800000,
> @@ -1112,6 +1395,34 @@ static const struct dpu_perf_cfg sc7280_perf_data = {
>    * Hardware catalog init
>    *************************************************************/
>   
> +/*
> + * msm8998_cfg_init(): populate sdm845 dpu sub-blocks reg offsets
> + * and instance counts.
> + */
> +static void msm8998_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
> +{
> +	*dpu_cfg = (struct dpu_mdss_cfg){
> +		.caps = &msm8998_dpu_caps,
> +		.mdp_count = ARRAY_SIZE(msm8998_mdp),
> +		.mdp = msm8998_mdp,
> +		.ctl_count = ARRAY_SIZE(msm8998_ctl),
> +		.ctl = msm8998_ctl,
> +		.sspp_count = ARRAY_SIZE(msm8998_sspp),
> +		.sspp = msm8998_sspp,
> +		.mixer_count = ARRAY_SIZE(msm8998_lm),
> +		.mixer = msm8998_lm,
> +		.pingpong_count = ARRAY_SIZE(sdm845_pp),
> +		.pingpong = sdm845_pp,
> +		.intf_count = ARRAY_SIZE(msm8998_intf),
> +		.intf = msm8998_intf,
> +		.vbif_count = ARRAY_SIZE(msm8998_vbif),
> +		.vbif = msm8998_vbif,
> +		.reg_dma_count = 0,
> +		.perf = msm8998_perf_data,
> +		.mdss_irqs = IRQ_SM8250_MASK,
> +	};
> +}
> +
>   /*
>    * sdm845_cfg_init(): populate sdm845 dpu sub-blocks reg offsets
>    * and instance counts.
> @@ -1262,6 +1573,8 @@ static void sc7280_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
>   }
>   
>   static const struct dpu_mdss_hw_cfg_handler cfg_handler[] = {
> +	{ .hw_rev = DPU_HW_VER_300, .cfg_init = msm8998_cfg_init},
> +	{ .hw_rev = DPU_HW_VER_301, .cfg_init = msm8998_cfg_init},
>   	{ .hw_rev = DPU_HW_VER_400, .cfg_init = sdm845_cfg_init},
>   	{ .hw_rev = DPU_HW_VER_401, .cfg_init = sdm845_cfg_init},
>   	{ .hw_rev = DPU_HW_VER_500, .cfg_init = sm8150_cfg_init},
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index ae48f41821cf..c3305f10ca13 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -1270,6 +1270,7 @@ static const struct dev_pm_ops dpu_pm_ops = {
>   };
>   
>   static const struct of_device_id dpu_dt_match[] = {
> +	{ .compatible = "qcom,msm8998-dpu", },
>   	{ .compatible = "qcom,sdm845-dpu", },
>   	{ .compatible = "qcom,sc7180-dpu", },
>   	{ .compatible = "qcom,sc7280-dpu", },
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 2e6fc185e54d..22da51b7e1f4 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -1398,6 +1398,7 @@ static void msm_pdev_shutdown(struct platform_device *pdev)
>   static const struct of_device_id dt_match[] = {
>   	{ .compatible = "qcom,mdp4", .data = (void *)KMS_MDP4 },
>   	{ .compatible = "qcom,mdss", .data = (void *)KMS_MDP5 },
> +	{ .compatible = "qcom,msm8998-mdss", .data = (void *)KMS_DPU },
>   	{ .compatible = "qcom,sdm845-mdss", .data = (void *)KMS_DPU },
>   	{ .compatible = "qcom,sc7180-mdss", .data = (void *)KMS_DPU },
>   	{ .compatible = "qcom,sc7280-mdss", .data = (void *)KMS_DPU },
> 


-- 
With best wishes
Dmitry
