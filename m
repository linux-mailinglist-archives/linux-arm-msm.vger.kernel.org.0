Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5264A6F087C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Apr 2023 17:37:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244210AbjD0Pht (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Apr 2023 11:37:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232630AbjD0Pht (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Apr 2023 11:37:49 -0400
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it [IPv6:2001:4b7a:2000:18::162])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF8AD26BA;
        Thu, 27 Apr 2023 08:37:45 -0700 (PDT)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id E127D20159;
        Thu, 27 Apr 2023 17:37:41 +0200 (CEST)
Date:   Thu, 27 Apr 2023 17:37:40 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: Re: [PATCH v2 07/13] drm/msm/dpu: Add SM6350 support
Message-ID: <k25jg7cez2kimpxr4ztbdzjr2adq6a2vjknyvfe5frxujtogfg@vhfdyt45unv6>
References: <20230411-topic-straitlagoon_mdss-v2-0-5def73f50980@linaro.org>
 <20230411-topic-straitlagoon_mdss-v2-7-5def73f50980@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230411-topic-straitlagoon_mdss-v2-7-5def73f50980@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-04-21 00:31:16, Konrad Dybcio wrote:
> Add SM6350 support to the DPU1 driver to enable display output.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

After addressing the comments from Dmitry (CURSOR0->DMA1 and
CURSOR1->DMA2), this is:

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

See below for some nits.

> ---
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h | 191 +++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   3 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
>  4 files changed, 196 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
> new file mode 100644
> index 000000000000..687a508cbaa6
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
> @@ -0,0 +1,191 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2022. Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2015-2018, 2020 The Linux Foundation. All rights reserved.
> + * Copyright (c) 2023, Linaro Limited
> + */
> +
> +#ifndef _DPU_6_4_SM6350_H
> +#define _DPU_6_4_SM6350_H
> +
> +static const struct dpu_caps sm6350_dpu_caps = {
> +	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
> +	.max_mixer_blendstages = 0x7,
> +	.qseed_type = DPU_SSPP_SCALER_QSEED4,

I thought it was QSEED3LITE, but doesn't really matter as both are
handled similarly.  It'll anyway change when I resubmit:

https://lore.kernel.org/linux-arm-msm/20230215-sspp-scaler-version-v1-0-416b1500b85b@somainline.org/T/#u

which should hardcode the register value directly, making this field
superfluous.

> +	.has_src_split = true,
> +	.has_dim_layer = true,
> +	.has_idle_pc = true,
> +	.max_linewidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
> +	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
> +};
> +
> +static const struct dpu_ubwc_cfg sm6350_ubwc_cfg = {
> +	.ubwc_version = DPU_HW_UBWC_VER_20,
> +	.ubwc_swizzle = 6,
> +	.highest_bank_bit = 1,
> +};
> +
> +static const struct dpu_mdp_cfg sm6350_mdp[] = {
> +	{
> +	.name = "top_0", .id = MDP_TOP,
> +	.base = 0x0, .len = 0x494,
> +	.features = 0,
> +	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
> +	.clk_ctrls[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
> +	.clk_ctrls[DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8 },
> +	.clk_ctrls[DPU_CLK_CTRL_DMA2] = { .reg_off = 0x2c4, .bit_off = 8 },
> +	.clk_ctrls[DPU_CLK_CTRL_REG_DMA] = { .reg_off = 0x2bc, .bit_off = 20 },
> +	},
> +};
> +
> +static const struct dpu_ctl_cfg sm6350_ctl[] = {
> +	{
> +	.name = "ctl_0", .id = CTL_0,
> +	.base = 0x1000, .len = 0x1dc,
> +	.features = BIT(DPU_CTL_ACTIVE_CFG),
> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
> +	},
> +	{
> +	.name = "ctl_1", .id = CTL_1,
> +	.base = 0x1200, .len = 0x1dc,
> +	.features = BIT(DPU_CTL_ACTIVE_CFG),
> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
> +	},
> +	{
> +	.name = "ctl_2", .id = CTL_2,
> +	.base = 0x1400, .len = 0x1dc,
> +	.features = BIT(DPU_CTL_ACTIVE_CFG),
> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
> +	},
> +	{
> +	.name = "ctl_3", .id = CTL_3,
> +	.base = 0x1600, .len = 0x1dc,
> +	.features = BIT(DPU_CTL_ACTIVE_CFG),
> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
> +	},
> +};
> +
> +static const struct dpu_sspp_cfg sm6350_sspp[] = {
> +	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1f8, VIG_SC7180_MASK,
> +		 sc7180_vig_sblk_0, 0,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
> +	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x1f8, DMA_SDM845_MASK,
> +		 sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
> +	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x1f8, DMA_CURSOR_SDM845_MASK,
> +		 sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR0),
> +	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x1f8, DMA_CURSOR_SDM845_MASK,
> +		 sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),
> +};
> +
> +static const struct dpu_lm_cfg sm6350_lm[] = {
> +	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK,
> +		&sc7180_lm_sblk, PINGPONG_0, LM_1, DSPP_0),
> +	LM_BLK("lm_1", LM_1, 0x45000, MIXER_SDM845_MASK,
> +		&sc7180_lm_sblk, PINGPONG_1, LM_0, 0),

These two entries are indented with two tabs and have one character too
many to align with the opening parenthesis on the previous line.  Can we
please settle on a single style, as this commit mostly uses tabs+spaces
to align with the opening parenthesis?

Dmitry vouched for `cino=(0` (when in unclosed parenthesis, align next
line with zero extra characters to the opening parenthesis), but I find
double tabs more convenient as it doesn't require reindenting when
changing the name of the macro (which happened too often in my INTF TE
series).

> +};
> +
> +static const struct dpu_dspp_cfg sm6350_dspp[] = {
> +	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
> +		 &sm8150_dspp_sblk),
> +};
> +
> +static struct dpu_pingpong_cfg sm6350_pp[] = {
> +	PP_BLK("pingpong_0", PINGPONG_0, 0x70000, PINGPONG_SM8150_MASK, 0, sdm845_pp_sblk,
> +	       DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
> +	       -1),
> +	PP_BLK("pingpong_1", PINGPONG_1, 0x70800, PINGPONG_SM8150_MASK, 0, sdm845_pp_sblk,
> +	       DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
> +	       -1),

Glad to see no TE2 here, we just removed it from all of DPU >= 5.0.0
instead of >= 7.0.0 in [1] as downstream DTS turned out to be wrong.

[1]: https://lore.kernel.org/linux-arm-msm/20230411-dpu-intf-te-v4-2-27ce1a5ab5c6@somainline.org/

- Marijn

> +};
> +
> +static const struct dpu_intf_cfg sm6350_intf[] = {
> +	INTF_BLK("intf_0", INTF_0, 0x6a000, 0x2c0, INTF_DP, 0, 35, INTF_SC7180_MASK,
> +		 DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
> +		 DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
> +	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x6a800, 0x2c0, INTF_DSI, 0, 35, INTF_SC7180_MASK,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
> +			DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2)),
> +};
> +
> +static const struct dpu_vbif_cfg sm6350_vbif[] = {
> +	{
> +	.name = "vbif_0", .id = VBIF_RT,
> +	.base = 0, .len = 0x1044,
> +	.features = BIT(DPU_VBIF_QOS_REMAP),
> +	.xin_halt_timeout = 0x4000,
> +	.qos_rt_tbl = {
> +		.npriority_lvl = ARRAY_SIZE(sdm845_rt_pri_lvl),
> +		.priority_lvl = sdm845_rt_pri_lvl,
> +	},
> +	.qos_nrt_tbl = {
> +		.npriority_lvl = ARRAY_SIZE(sdm845_nrt_pri_lvl),
> +		.priority_lvl = sdm845_nrt_pri_lvl,
> +	},
> +	.memtype_count = 14,
> +	.memtype = {3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3},
> +	},
> +};
> +
> +static const struct dpu_qos_lut_entry sm6350_qos_linear_macrotile[] = {
> +	{.fl = 0, .lut = 0x0011223344556677 },
> +	{.fl = 0, .lut = 0x0011223445566777 },
> +};
> +
> +static const struct dpu_perf_cfg sm6350_perf_data = {
> +	.max_bw_low = 4200000,
> +	.max_bw_high = 5100000,
> +	.min_core_ib = 2500000,
> +	.min_llcc_ib = 0,
> +	.min_dram_ib = 1600000,
> +	.min_prefill_lines = 35,
> +	/* TODO: confirm danger_lut_tbl */
> +	.danger_lut_tbl = {0xffff, 0xffff, 0x0, 0x0, 0xffff},
> +	.qos_lut_tbl = {
> +		{.nentry = ARRAY_SIZE(sm6350_qos_linear_macrotile),
> +		.entries = sm6350_qos_linear_macrotile
> +		},
> +		{.nentry = ARRAY_SIZE(sm6350_qos_linear_macrotile),
> +		.entries = sm6350_qos_linear_macrotile
> +		},
> +		{.nentry = ARRAY_SIZE(sc7180_qos_nrt),
> +		.entries = sc7180_qos_nrt
> +		},
> +	},
> +	.cdp_cfg = {
> +		{.rd_enable = 1, .wr_enable = 1},
> +		{.rd_enable = 1, .wr_enable = 0}
> +	},
> +	.clk_inefficiency_factor = 105,
> +	.bw_inefficiency_factor = 120,
> +};
> +
> +const struct dpu_mdss_cfg dpu_sm6350_cfg = {
> +	.caps = &sm6350_dpu_caps,
> +	.ubwc = &sm6350_ubwc_cfg,
> +	.mdp_count = ARRAY_SIZE(sm6350_mdp),
> +	.mdp = sm6350_mdp,
> +	.ctl_count = ARRAY_SIZE(sm6350_ctl),
> +	.ctl = sm6350_ctl,
> +	.sspp_count = ARRAY_SIZE(sm6350_sspp),
> +	.sspp = sm6350_sspp,
> +	.mixer_count = ARRAY_SIZE(sm6350_lm),
> +	.mixer = sm6350_lm,
> +	.dspp_count = ARRAY_SIZE(sm6350_dspp),
> +	.dspp = sm6350_dspp,
> +	.pingpong_count = ARRAY_SIZE(sm6350_pp),
> +	.pingpong = sm6350_pp,
> +	.intf_count = ARRAY_SIZE(sm6350_intf),
> +	.intf = sm6350_intf,
> +	.vbif_count = ARRAY_SIZE(sm6350_vbif),
> +	.vbif = sm6350_vbif,
> +	.reg_dma_count = 1,
> +	.dma_cfg = &sm8250_regdma,
> +	.perf = &sm6350_perf_data,
> +	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
> +		     BIT(MDP_SSPP_TOP0_INTR2) | \
> +		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
> +		     BIT(MDP_INTF0_INTR) | \
> +		     BIT(MDP_INTF1_INTR)
> +};
> +
> +#endif
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index db558a9ae36e..52750b592b36 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -806,6 +806,7 @@ static const struct dpu_qos_lut_entry sc7180_qos_nrt[] = {
>  #include "catalog/dpu_6_0_sm8250.h"
>  #include "catalog/dpu_6_2_sc7180.h"
>  #include "catalog/dpu_6_3_sm6115.h"
> +#include "catalog/dpu_6_4_sm6350.h"
>  #include "catalog/dpu_6_5_qcm2290.h"
>  
>  #include "catalog/dpu_7_0_sm8350.h"
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 756bff1d2185..f9611bd75e02 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -320,6 +320,8 @@ enum dpu_qos_lut_usage {
>  	DPU_QOS_LUT_USAGE_LINEAR,
>  	DPU_QOS_LUT_USAGE_MACROTILE,
>  	DPU_QOS_LUT_USAGE_NRT,
> +	DPU_QOS_LUT_USAGE_CWB,
> +	DPU_QOS_LUT_USAGE_MACROTILE_QSEED,
>  	DPU_QOS_LUT_USAGE_MAX,
>  };
>  
> @@ -880,6 +882,7 @@ extern const struct dpu_mdss_cfg dpu_sc8180x_cfg;
>  extern const struct dpu_mdss_cfg dpu_sm8250_cfg;
>  extern const struct dpu_mdss_cfg dpu_sc7180_cfg;
>  extern const struct dpu_mdss_cfg dpu_sm6115_cfg;
> +extern const struct dpu_mdss_cfg dpu_sm6350_cfg;
>  extern const struct dpu_mdss_cfg dpu_qcm2290_cfg;
>  extern const struct dpu_mdss_cfg dpu_sm8350_cfg;
>  extern const struct dpu_mdss_cfg dpu_sc7280_cfg;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 0e7a68714e9e..46be7ad8d615 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -1286,6 +1286,7 @@ static const struct of_device_id dpu_dt_match[] = {
>  	{ .compatible = "qcom,sc8180x-dpu", .data = &dpu_sc8180x_cfg, },
>  	{ .compatible = "qcom,sc8280xp-dpu", .data = &dpu_sc8280xp_cfg, },
>  	{ .compatible = "qcom,sm6115-dpu", .data = &dpu_sm6115_cfg, },
> +	{ .compatible = "qcom,sm6350-dpu", .data = &dpu_sm6350_cfg, },
>  	{ .compatible = "qcom,sm8150-dpu", .data = &dpu_sm8150_cfg, },
>  	{ .compatible = "qcom,sm8250-dpu", .data = &dpu_sm8250_cfg, },
>  	{ .compatible = "qcom,sm8350-dpu", .data = &dpu_sm8350_cfg, },
> 
> -- 
> 2.40.0
> 
