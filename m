Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 496E2386C78
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 May 2021 23:43:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245407AbhEQVoZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 May 2021 17:44:25 -0400
Received: from mail-ot1-f53.google.com ([209.85.210.53]:38673 "EHLO
        mail-ot1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245411AbhEQVoY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 May 2021 17:44:24 -0400
Received: by mail-ot1-f53.google.com with SMTP id q7-20020a9d57870000b02902a5c2bd8c17so6858374oth.5;
        Mon, 17 May 2021 14:43:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9ZuRyjqXz1u6KlmS9cEtPEj1bTCF9klAASByLTyEeAw=;
        b=JQqzqOU9yIdvVMm6vDbkcBHsGcl8hqBovFVCn3r4telyq28599+O10iARN+jjF/MsT
         YNrZ8XCqeM0PSaXwwbJAF6UxyGZb75lDeT/Nejhk9NFZkUqDpTKjw1JnetNCci4khqOU
         8rfAH4UEz9/ZWdqAWTVyqj8Q6MPYaEN/K6O6X0WCDLUN4r5xNWtRW0TYKCkPdPsk0U2C
         UOnx2kUnAxBs+TeKPIZR+IQ5xo0q/Aks5qEWS8hE9dTOlCHUx3OdB/VHy/spO7y8Y0MF
         odzKTq/EYbuEZAzAQkx/GbhUeHlBr0wZw9k9ND3hR88bC8MafCoDir3kP6mAM1FNikOR
         7pWQ==
X-Gm-Message-State: AOAM5320lV1NMW2qpE8i2hx5gkLE0YkgROprGkgTlRMVbaEZKsVL+r+g
        YkP038WvNeRQq0X1I6fKkg==
X-Google-Smtp-Source: ABdhPJx77y2xp4HIKj/s6A+7gdN9XpP9ehYnMOSoZVAdJZi7M1bovy10GzobQthYHlb2pey5pH+gnQ==
X-Received: by 2002:a9d:614b:: with SMTP id c11mr1358620otk.59.1621287786097;
        Mon, 17 May 2021 14:43:06 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id o14sm1298358oik.29.2021.05.17.14.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 14:43:05 -0700 (PDT)
Received: (nullmailer pid 3253643 invoked by uid 1000);
        Mon, 17 May 2021 21:43:04 -0000
Date:   Mon, 17 May 2021 16:43:04 -0500
From:   Rob Herring <robh@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] drm/msm/dpu: Add SC8180x to hw catalog
Message-ID: <20210517214304.GA3251336@robh.at.kernel.org>
References: <20210511041852.592295-1-bjorn.andersson@linaro.org>
 <20210511041852.592295-4-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210511041852.592295-4-bjorn.andersson@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, May 10, 2021 at 11:18:51PM -0500, Bjorn Andersson wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Add SC8180x to the hardware catalog, for initial support for the
> platform. Due to limitations in the DP driver only one of the four DP
> interfaces is left enabled.
> 
> The SC8180x platform supports the newly added DPU_INTF_WIDEBUS flag and
> the Windows-on-Snapdragon bootloader leaves the widebus bit set, so this
> is flagged appropriately to ensure widebus is disabled - for now.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  .../devicetree/bindings/display/msm/dpu.txt   |   4 +-

This is getting converted to schema. Please help that along (it needs 
it).

>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 121 ++++++++++++++++++
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   3 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   1 +
>  drivers/gpu/drm/msm/msm_drv.c                 |   1 +
>  5 files changed, 128 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dpu.txt b/Documentation/devicetree/bindings/display/msm/dpu.txt
> index 586e6eac5b08..b98258374a60 100644
> --- a/Documentation/devicetree/bindings/display/msm/dpu.txt
> +++ b/Documentation/devicetree/bindings/display/msm/dpu.txt
> @@ -8,7 +8,7 @@ The DPU display controller is found in SDM845 SoC.
>  
>  MDSS:
>  Required properties:
> -- compatible:  "qcom,sdm845-mdss", "qcom,sc7180-mdss"
> +- compatible:  "qcom,sdm845-mdss", "qcom,sc7180-mdss", "qcom,sc8180x-mdss"
>  - reg: physical base address and length of controller's registers.
>  - reg-names: register region names. The following region is required:
>    * "mdss"
> @@ -41,7 +41,7 @@ Optional properties:
>  
>  MDP:
>  Required properties:
> -- compatible: "qcom,sdm845-dpu", "qcom,sc7180-dpu"
> +- compatible: "qcom,sdm845-dpu", "qcom,sc7180-dpu", "qcom,sc8180x-dpu"
>  - reg: physical base address and length of controller's registers.
>  - reg-names : register region names. The following region is required:
>    * "mdp"
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index b569030a0847..81c429ce94a9 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -56,6 +56,10 @@
>  
>  #define INTF_SC7280_MASK INTF_SC7180_MASK | BIT(DPU_DATA_HCTL_EN)
>  
> +#define INTF_SC8180X_MASK BIT(DPU_INTF_INPUT_CTRL) | \
> +			  BIT(DPU_INTF_TE) | \
> +			  BIT(DPU_INTF_WIDEBUS)
> +
>  #define INTR_SC7180_MASK \
>  	(BIT(DPU_IRQ_TYPE_PING_PONG_RD_PTR) |\
>  	BIT(DPU_IRQ_TYPE_PING_PONG_WR_PTR) |\
> @@ -197,6 +201,22 @@ static const struct dpu_caps sm8150_dpu_caps = {
>  	.max_vdeci_exp = MAX_VERT_DECIMATION,
>  };
>  
> +static const struct dpu_caps sc8180_dpu_caps = {
> +	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
> +	.max_mixer_blendstages = 0xb,
> +	.qseed_type = DPU_SSPP_SCALER_QSEED3,
> +	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
> +	.ubwc_version = DPU_HW_UBWC_VER_30,
> +	.has_src_split = true,
> +	.has_dim_layer = true,
> +	.has_idle_pc = true,
> +	.has_3d_merge = false,   /* I think? */
> +	.max_linewidth = 4096,
> +	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
> +	.max_hdeci_exp = MAX_HORZ_DECIMATION,
> +	.max_vdeci_exp = MAX_VERT_DECIMATION,
> +};
> +
>  static const struct dpu_caps sm8250_dpu_caps = {
>  	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
>  	.max_mixer_blendstages = 0xb,
> @@ -265,6 +285,35 @@ static const struct dpu_mdp_cfg sc7180_mdp[] = {
>  	},
>  };
>  
> +static const struct dpu_mdp_cfg sc8180_mdp[] = {
> +	{
> +	.name = "top_0", .id = MDP_TOP,
> +	// TODO check len
> +	.base = 0x0, .len = 0x45C,
> +	.features = 0,
> +	.highest_bank_bit = 0x3,
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
> +	.clk_ctrls[DPU_CLK_CTRL_CURSOR0] = {
> +			.reg_off = 0x2BC, .bit_off = 8},
> +	.clk_ctrls[DPU_CLK_CTRL_CURSOR1] = {
> +			.reg_off = 0x2C4, .bit_off = 8},
> +// TODO ???
> +//	.clk_ctrls[DPU_CLK_CTRL_REG_DMA] = {
> +//			.reg_off = 0x2BC, .bit_off = 20},
> +	},
> +};
> +
>  static const struct dpu_mdp_cfg sm8250_mdp[] = {
>  	{
>  	.name = "top_0", .id = MDP_TOP,
> @@ -789,6 +838,15 @@ static const struct dpu_intf_cfg sc7280_intf[] = {
>  	INTF_BLK("intf_5", INTF_5, 0x39000, INTF_EDP, 0, 24, INTF_SC7280_MASK),
>  };
>  
> +static const struct dpu_intf_cfg sc8180x_intf[] = {
> +//	INTF_BLK("intf_0", INTF_0, 0x6A000, INTF_DP, 0, 24, INTF_SC8180X_MASK),
> +	INTF_BLK("intf_1", INTF_1, 0x6A800, INTF_DSI, 0, 24, INTF_SC8180X_MASK),
> +	INTF_BLK("intf_2", INTF_2, 0x6B000, INTF_DSI, 1, 24, INTF_SC8180X_MASK),
> +//	INTF_BLK("intf_3", INTF_3, 0x6B800, INTF_DP, 1, 24, INTF_SC8180X_MASK),
> +//	INTF_BLK("intf_4", INTF_4, 0x6C000, INTF_DP, 2, 24, INTF_SC8180X_MASK),
> +	INTF_BLK("intf_5", INTF_5, 0x6C800, INTF_DP, 0, 24, INTF_SC8180X_MASK),
> +};
> +
>  /*************************************************************
>   * VBIF sub blocks config
>   *************************************************************/
> @@ -859,6 +917,10 @@ static const struct dpu_qos_lut_entry sm8150_qos_linear[] = {
>  	{.fl = 0, .lut = 0x0011222222223357 },
>  };
>  
> +static const struct dpu_qos_lut_entry sc8180_qos_linear[] = {
> +	{.fl = 4, .lut = 0x0000000000000357 },
> +};
> +
>  static const struct dpu_qos_lut_entry sdm845_qos_macrotile[] = {
>  	{.fl = 10, .lut = 0x344556677},
>  	{.fl = 11, .lut = 0x3344556677},
> @@ -872,6 +934,10 @@ static const struct dpu_qos_lut_entry sc7180_qos_macrotile[] = {
>  	{.fl = 0, .lut = 0x0011223344556677},
>  };
>  
> +static const struct dpu_qos_lut_entry sc8180_qos_macrotile[] = {
> +	{.fl = 10, .lut = 0x0000000344556677},
> +};
> +
>  static const struct dpu_qos_lut_entry sdm845_qos_nrt[] = {
>  	{.fl = 0, .lut = 0x0},
>  };
> @@ -976,6 +1042,31 @@ static const struct dpu_perf_cfg sm8150_perf_data = {
>  	.bw_inefficiency_factor = 120,
>  };
>  
> +static const struct dpu_perf_cfg sc8180_perf_data = {
> +	.max_bw_low = 9600000,
> +	.max_bw_high = 9600000,
> +	.min_core_ib = 2400000,
> +	.min_llcc_ib = 800000,
> +	.min_dram_ib = 800000,
> +	.danger_lut_tbl = {0xf, 0xffff, 0x0, 0x0},
> +	.qos_lut_tbl = {
> +		{.nentry = ARRAY_SIZE(sc8180_qos_linear),
> +		.entries = sc8180_qos_linear
> +		},
> +		{.nentry = ARRAY_SIZE(sc8180_qos_macrotile),
> +		.entries = sc8180_qos_macrotile
> +		},
> +		{.nentry = ARRAY_SIZE(sc7180_qos_nrt),
> +		.entries = sc7180_qos_nrt
> +		},
> +		/* TODO: macrotile-qseed is different from macrotile */
> +	},
> +	.cdp_cfg = {
> +		{.rd_enable = 1, .wr_enable = 1},
> +		{.rd_enable = 1, .wr_enable = 0}
> +	},
> +};
> +
>  static const struct dpu_perf_cfg sm8250_perf_data = {
>  	.max_bw_low = 13700000,
>  	.max_bw_high = 16600000,
> @@ -1129,6 +1220,35 @@ static void sm8150_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
>  	};
>  }
>  
> +/*
> + * sc8180_cfg_init(): populate sc8180 dpu sub-blocks reg offsets
> + * and instance counts.
> + */
> +static void sc8180_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
> +{
> +	*dpu_cfg = (struct dpu_mdss_cfg){
> +		.caps = &sc8180_dpu_caps,
> +		.mdp_count = ARRAY_SIZE(sc8180_mdp),
> +		.mdp = sc8180_mdp,
> +		.ctl_count = ARRAY_SIZE(sm8150_ctl),
> +		.ctl = sm8150_ctl,
> +		.sspp_count = ARRAY_SIZE(sdm845_sspp),
> +		.sspp = sdm845_sspp,
> +		.mixer_count = ARRAY_SIZE(sm8150_lm),
> +		.mixer = sm8150_lm,
> +		.pingpong_count = ARRAY_SIZE(sm8150_pp),
> +		.pingpong = sm8150_pp,
> +		.intf_count = ARRAY_SIZE(sc8180x_intf),
> +		.intf = sc8180x_intf,
> +		.vbif_count = ARRAY_SIZE(sdm845_vbif),
> +		.vbif = sdm845_vbif,
> +		.reg_dma_count = 1,
> +		.dma_cfg = sm8150_regdma,
> +		.perf = sc8180_perf_data,
> +		.mdss_irqs = 0x3ff,
> +	};
> +}
> +
>  /*
>   * sm8250_cfg_init(): populate sm8250 dpu sub-blocks reg offsets
>   * and instance counts.
> @@ -1191,6 +1311,7 @@ static const struct dpu_mdss_hw_cfg_handler cfg_handler[] = {
>  	{ .hw_rev = DPU_HW_VER_401, .cfg_init = sdm845_cfg_init},
>  	{ .hw_rev = DPU_HW_VER_500, .cfg_init = sm8150_cfg_init},
>  	{ .hw_rev = DPU_HW_VER_501, .cfg_init = sm8150_cfg_init},
> +	{ .hw_rev = DPU_HW_VER_510, .cfg_init = sc8180_cfg_init},
>  	{ .hw_rev = DPU_HW_VER_600, .cfg_init = sm8250_cfg_init},
>  	{ .hw_rev = DPU_HW_VER_620, .cfg_init = sc7180_cfg_init},
>  	{ .hw_rev = DPU_HW_VER_720, .cfg_init = sc7280_cfg_init},
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index c2f34a4f82d9..644e315df0fb 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -39,6 +39,7 @@
>  #define DPU_HW_VER_410	DPU_HW_VER(4, 1, 0) /* sdm670 v1.0 */
>  #define DPU_HW_VER_500	DPU_HW_VER(5, 0, 0) /* sm8150 v1.0 */
>  #define DPU_HW_VER_501	DPU_HW_VER(5, 0, 1) /* sm8150 v2.0 */
> +#define DPU_HW_VER_510	DPU_HW_VER(5, 1, 1) /* sc8180 */
>  #define DPU_HW_VER_600	DPU_HW_VER(6, 0, 0) /* sm8250 */
>  #define DPU_HW_VER_620	DPU_HW_VER(6, 2, 0) /* sc7180 v1.0 */
>  #define DPU_HW_VER_720	DPU_HW_VER(7, 2, 0) /* sc7280 */
> @@ -287,6 +288,8 @@ enum dpu_qos_lut_usage {
>  	DPU_QOS_LUT_USAGE_LINEAR,
>  	DPU_QOS_LUT_USAGE_MACROTILE,
>  	DPU_QOS_LUT_USAGE_NRT,
> +	DPU_QOS_LUT_USAGE_CWB,
> +	DPU_QOS_LUT_USAGE_MACROTILE_QSEED,
>  	DPU_QOS_LUT_USAGE_MAX,
>  };
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 8b01cb660381..7e8f0df2bd88 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -1228,6 +1228,7 @@ static const struct of_device_id dpu_dt_match[] = {
>  	{ .compatible = "qcom,sdm845-dpu", },
>  	{ .compatible = "qcom,sc7180-dpu", },
>  	{ .compatible = "qcom,sc7280-dpu", },
> +	{ .compatible = "qcom,sc8180x-dpu", },
>  	{ .compatible = "qcom,sm8150-dpu", },
>  	{ .compatible = "qcom,sm8250-dpu", },
>  	{}
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index e1104d2454e2..b5bcbf5c2306 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -1342,6 +1342,7 @@ static const struct of_device_id dt_match[] = {
>  	{ .compatible = "qcom,sdm845-mdss", .data = (void *)KMS_DPU },
>  	{ .compatible = "qcom,sc7180-mdss", .data = (void *)KMS_DPU },
>  	{ .compatible = "qcom,sc7280-mdss", .data = (void *)KMS_DPU },
> +	{ .compatible = "qcom,sc8180x-mdss", .data = (void *)KMS_DPU },
>  	{ .compatible = "qcom,sm8150-mdss", .data = (void *)KMS_DPU },
>  	{ .compatible = "qcom,sm8250-mdss", .data = (void *)KMS_DPU },
>  	{}
> -- 
> 2.29.2
> 
