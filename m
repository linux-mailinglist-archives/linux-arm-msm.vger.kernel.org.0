Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B4D36D0412
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Mar 2023 13:56:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231214AbjC3L4N (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Mar 2023 07:56:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231202AbjC3L4M (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Mar 2023 07:56:12 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DE0B8A5A
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 04:55:49 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id h25so24155784lfv.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 04:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680177348;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2SpTzzAUQHR8j55o898T2hL8wCiOXqXeeHQ7w+JLOUg=;
        b=svtLnucnFcStf/Szi+iXU/74H6dHDbiQZxqk0FCrZ7Zh/yp90fIbrwGO4XrhK9DBQK
         Dz0TpTQDOPMsmalXNZD9OwYXhXeloRM8Xll9No0g5wSf9mpXoY2XKFTNwGv521xP+vmA
         NyJVBbrsxqJeM8EwwIsPMN+Ems/SYDzSiuQeD3VfSYxUVLDZlWV99z28UOsI5rvfu0oy
         1RtCMgT4Fa1bHjAcdRkjGKheVYdOZEev9TOKWqJjNFn+kE+pATV8Cbw9kno50hsar0xA
         I60An5MC6ZCzlEKjdDwYTCiStAiuVSJWEZ/uKwt5LeeXa/rxDV9TGgVW2YUcaEOzdwrI
         U+6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680177348;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2SpTzzAUQHR8j55o898T2hL8wCiOXqXeeHQ7w+JLOUg=;
        b=Py0+ZKaOmYNOvAa1ZJ9zBNK0kF33amI+MvhmNC0s7Mou90/x+TiHj2ninbsWoL8445
         x2/aVwLZXUViz57VgTT/oPghAOOCaDgTMm3YwecBt0TaHeWq4+HX0kmopSaVw5CIrFvF
         uJi/966Ro0015vwZgV5jOp2Fo459OyTT0+wv+/JF2ZlnHlvLG9ejWEZ1kjnFY1+os+gD
         YQyGGmgO1MnEQmMCelLtEiNMHDoR/ouRid8J28mDsX5Z6c+ybJ4e+ZCAQXvxHTkNZ8Dz
         6zcDU0oGSkl+a1Ra25rjdoJLCn4BFDx7dD0EH1fvDLj6fJi9HtdFbSMGuqoElS4jOy8q
         LCbQ==
X-Gm-Message-State: AAQBX9dfg83sX04lL4Y3FI9y8brAwSiRTMkvue3CgyuIWW7kLAoMufEZ
        1POHYODletgR83+yeVTfQychtw==
X-Google-Smtp-Source: AKy350aocVotNiHOWY0XrPx4+ZkulM6v0LjwPICTsm3pYnFKx04qBte3b6DyivgRjjxH2DUsjGQ/5Q==
X-Received: by 2002:ac2:5591:0:b0:4ea:e2f8:5edf with SMTP id v17-20020ac25591000000b004eae2f85edfmr6771548lfg.33.1680177347716;
        Thu, 30 Mar 2023 04:55:47 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
        by smtp.gmail.com with ESMTPSA id c17-20020ac25311000000b004db3900da02sm5825789lfh.73.2023.03.30.04.55.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Mar 2023 04:55:47 -0700 (PDT)
Message-ID: <a8bb727e-8fe3-bb22-d818-108f8a5920cc@linaro.org>
Date:   Thu, 30 Mar 2023 13:55:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [v2,25/50] drm/msm/dpu: split SC7180 catalog entry to the
 separate file
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        dri-devel@lists.freedesktop.org,
        Stephen Boyd <swboyd@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@gmail.com>
References: <20230211231259.1308718-26-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230211231259.1308718-26-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 12.02.2023 00:12, Dmitry Baryshkov wrote:
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    | 148 ++++++++++++++++++
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 144 +----------------
>  2 files changed, 149 insertions(+), 143 deletions(-)
>  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
> new file mode 100644
> index 000000000000..7f998ffa195f
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
> @@ -0,0 +1,148 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2022. Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2015-2018, 2020 The Linux Foundation. All rights reserved.
> + */
> +
> +#ifndef _DPU_6_2_SC7180_H
> +#define _DPU_6_2_SC7180_H
> +
> +static const struct dpu_caps sc7180_dpu_caps = {
> +	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
> +	.max_mixer_blendstages = 0x9,
> +	.qseed_type = DPU_SSPP_SCALER_QSEED4,
> +	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2,
Rebase

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
> +	.has_dim_layer = true,
> +	.has_idle_pc = true,
> +	.max_linewidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
> +	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
> +};
> +
> +static const struct dpu_ubwc_cfg sc7180_ubwc_cfg = {
> +	.ubwc_version = DPU_HW_UBWC_VER_20,
> +	.highest_bank_bit = 0x3,
> +};
> +
> +static const struct dpu_mdp_cfg sc7180_mdp[] = {
> +	{
> +	.name = "top_0", .id = MDP_TOP,
> +	.base = 0x0, .len = 0x494,
> +	.features = 0,
> +	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
> +	.clk_ctrls[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
> +	.clk_ctrls[DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8 },
> +	.clk_ctrls[DPU_CLK_CTRL_DMA2] = { .reg_off = 0x2c4, .bit_off = 8 },
> +	.clk_ctrls[DPU_CLK_CTRL_WB2] = { .reg_off = 0x3b8, .bit_off = 24 },
> +	},
> +};
> +
> +static const struct dpu_ctl_cfg sc7180_ctl[] = {
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
> +};
> +
> +static const struct dpu_sspp_cfg sc7180_sspp[] = {
> +	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1f8, VIG_SC7180_MASK,
> +		sc7180_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
> +	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x1f8, DMA_SDM845_MASK,
> +		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
> +	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x1f8, DMA_CURSOR_SDM845_MASK,
> +		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
> +	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x1f8, DMA_CURSOR_SDM845_MASK,
> +		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
> +};
> +
> +static const struct dpu_lm_cfg sc7180_lm[] = {
> +	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK,
> +		&sc7180_lm_sblk, PINGPONG_0, LM_1, DSPP_0),
> +	LM_BLK("lm_1", LM_1, 0x45000, MIXER_SDM845_MASK,
> +		&sc7180_lm_sblk, PINGPONG_1, LM_0, 0),
> +};
> +
> +static const struct dpu_dspp_cfg sc7180_dspp[] = {
> +	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
> +		 &sc7180_dspp_sblk),
> +};
> +
> +static const struct dpu_pingpong_cfg sc7180_pp[] = {
> +	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x70000, 0, sdm845_pp_sblk_te, -1, -1),
> +	PP_BLK_TE("pingpong_1", PINGPONG_1, 0x70800, 0, sdm845_pp_sblk_te, -1, -1),
> +};
> +
> +static const struct dpu_intf_cfg sc7180_intf[] = {
> +	INTF_BLK("intf_0", INTF_0, 0x6a000, 0x2b8, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> +	INTF_BLK("intf_1", INTF_1, 0x6a800, 0x2b8, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> +};
> +
> +static const struct dpu_perf_cfg sc7180_perf_data = {
> +	.max_bw_low = 6800000,
> +	.max_bw_high = 6800000,
> +	.min_core_ib = 2400000,
> +	.min_llcc_ib = 800000,
> +	.min_dram_ib = 1600000,
> +	.min_prefill_lines = 24,
> +	.danger_lut_tbl = {0xff, 0xffff, 0x0},
> +	.safe_lut_tbl = {0xfff0, 0xff00, 0xffff},
> +	.qos_lut_tbl = {
> +		{.nentry = ARRAY_SIZE(sc7180_qos_linear),
> +		.entries = sc7180_qos_linear
> +		},
> +		{.nentry = ARRAY_SIZE(sc7180_qos_macrotile),
> +		.entries = sc7180_qos_macrotile
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
> +static const struct dpu_mdss_cfg sc7180_dpu_cfg = {
> +	.caps = &sc7180_dpu_caps,
> +	.ubwc = &sc7180_ubwc_cfg,
> +	.mdp_count = ARRAY_SIZE(sc7180_mdp),
> +	.mdp = sc7180_mdp,
> +	.ctl_count = ARRAY_SIZE(sc7180_ctl),
> +	.ctl = sc7180_ctl,
> +	.sspp_count = ARRAY_SIZE(sc7180_sspp),
> +	.sspp = sc7180_sspp,
> +	.mixer_count = ARRAY_SIZE(sc7180_lm),
> +	.mixer = sc7180_lm,
> +	.dspp_count = ARRAY_SIZE(sc7180_dspp),
> +	.dspp = sc7180_dspp,
> +	.pingpong_count = ARRAY_SIZE(sc7180_pp),
> +	.pingpong = sc7180_pp,
> +	.intf_count = ARRAY_SIZE(sc7180_intf),
> +	.intf = sc7180_intf,
> +	.wb_count = ARRAY_SIZE(sm8250_wb),
> +	.wb = sm8250_wb,
> +	.vbif_count = ARRAY_SIZE(sdm845_vbif),
> +	.vbif = sdm845_vbif,
> +	.reg_dma_count = 1,
> +	.dma_cfg = &sdm845_regdma,
> +	.perf = &sc7180_perf_data,
> +	.mdss_irqs = IRQ_SC7180_MASK,
> +};
> +
> +#endif
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 457783a9579a..81d2a94b382f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -328,17 +328,6 @@ static const struct dpu_caps sdm845_dpu_caps = {
>  	.max_vdeci_exp = MAX_VERT_DECIMATION,
>  };
>  
> -static const struct dpu_caps sc7180_dpu_caps = {
> -	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
> -	.max_mixer_blendstages = 0x9,
> -	.qseed_type = DPU_SSPP_SCALER_QSEED4,
> -	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2,
> -	.has_dim_layer = true,
> -	.has_idle_pc = true,
> -	.max_linewidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
> -	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
> -};
> -
>  static const struct dpu_caps sm8150_dpu_caps = {
>  	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
>  	.max_mixer_blendstages = 0xb,
> @@ -392,11 +381,6 @@ static const struct dpu_ubwc_cfg sdm845_ubwc_cfg = {
>  	.highest_bank_bit = 0x2,
>  };
>  
> -static const struct dpu_ubwc_cfg sc7180_ubwc_cfg = {
> -	.ubwc_version = DPU_HW_UBWC_VER_20,
> -	.highest_bank_bit = 0x3,
> -};
> -
>  static const struct dpu_ubwc_cfg sm8150_ubwc_cfg = {
>  	.ubwc_version = DPU_HW_UBWC_VER_30,
>  	.highest_bank_bit = 0x2,
> @@ -465,24 +449,6 @@ static const struct dpu_mdp_cfg sdm845_mdp[] = {
>  	},
>  };
>  
> -static const struct dpu_mdp_cfg sc7180_mdp[] = {
> -	{
> -	.name = "top_0", .id = MDP_TOP,
> -	.base = 0x0, .len = 0x494,
> -	.features = 0,
> -	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
> -		.reg_off = 0x2AC, .bit_off = 0},
> -	.clk_ctrls[DPU_CLK_CTRL_DMA0] = {
> -		.reg_off = 0x2AC, .bit_off = 8},
> -	.clk_ctrls[DPU_CLK_CTRL_DMA1] = {
> -		.reg_off = 0x2B4, .bit_off = 8},
> -	.clk_ctrls[DPU_CLK_CTRL_DMA2] = {
> -		.reg_off = 0x2C4, .bit_off = 8},
> -	.clk_ctrls[DPU_CLK_CTRL_WB2] = {
> -		.reg_off = 0x3B8, .bit_off = 24},
> -	},
> -};
> -
>  static const struct dpu_mdp_cfg sc8180x_mdp[] = {
>  	{
>  	.name = "top_0", .id = MDP_TOP,
> @@ -604,27 +570,6 @@ static const struct dpu_ctl_cfg sdm845_ctl[] = {
>  	},
>  };
>  
> -static const struct dpu_ctl_cfg sc7180_ctl[] = {
> -	{
> -	.name = "ctl_0", .id = CTL_0,
> -	.base = 0x1000, .len = 0x1dc,
> -	.features = BIT(DPU_CTL_ACTIVE_CFG),
> -	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
> -	},
> -	{
> -	.name = "ctl_1", .id = CTL_1,
> -	.base = 0x1200, .len = 0x1dc,
> -	.features = BIT(DPU_CTL_ACTIVE_CFG),
> -	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
> -	},
> -	{
> -	.name = "ctl_2", .id = CTL_2,
> -	.base = 0x1400, .len = 0x1dc,
> -	.features = BIT(DPU_CTL_ACTIVE_CFG),
> -	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
> -	},
> -};
> -
>  static const struct dpu_ctl_cfg sm8150_ctl[] = {
>  	{
>  	.name = "ctl_0", .id = CTL_0,
> @@ -807,17 +752,6 @@ static const struct dpu_sspp_sub_blks sc7180_vig_sblk_0 =
>  static const struct dpu_sspp_sub_blks sc7280_vig_sblk_0 =
>  			_VIG_SBLK_ROT("0", 4, DPU_SSPP_SCALER_QSEED4, &dpu_rot_sc7280_cfg_v2);
>  
> -static const struct dpu_sspp_cfg sc7180_sspp[] = {
> -	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1f8, VIG_SC7180_MASK,
> -		sc7180_vig_sblk_0, 0,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
> -	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x1f8, DMA_SDM845_MASK,
> -		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
> -	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x1f8, DMA_CURSOR_SDM845_MASK,
> -		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
> -	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x1f8, DMA_CURSOR_SDM845_MASK,
> -		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
> -};
> -
>  static const struct dpu_sspp_sub_blks sm6115_vig_sblk_0 =
>  				_VIG_SBLK("0", 2, DPU_SSPP_SCALER_QSEED4);
>  
> @@ -971,13 +905,6 @@ static const struct dpu_lm_sub_blks sc7180_lm_sblk = {
>  	},
>  };
>  
> -static const struct dpu_lm_cfg sc7180_lm[] = {
> -	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK,
> -		&sc7180_lm_sblk, PINGPONG_0, LM_1, DSPP_0),
> -	LM_BLK("lm_1", LM_1, 0x45000, MIXER_SDM845_MASK,
> -		&sc7180_lm_sblk, PINGPONG_1, LM_0, 0),
> -};
> -
>  /* SM8150 */
>  
>  static const struct dpu_lm_cfg sm8150_lm[] = {
> @@ -1040,11 +967,6 @@ static const struct dpu_dspp_cfg msm8998_dspp[] = {
>  		 &msm8998_dspp_sblk),
>  };
>  
> -static const struct dpu_dspp_cfg sc7180_dspp[] = {
> -	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
> -		 &sc7180_dspp_sblk),
> -};
> -
>  static const struct dpu_dspp_cfg sm8150_dspp[] = {
>  	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
>  		 &sm8150_dspp_sblk),
> @@ -1122,11 +1044,6 @@ static const struct dpu_pingpong_cfg sdm845_pp[] = {
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 15)),
>  };
>  
> -static const struct dpu_pingpong_cfg sc7180_pp[] = {
> -	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x70000, 0, sdm845_pp_sblk_te, -1, -1),
> -	PP_BLK_TE("pingpong_1", PINGPONG_1, 0x70800, 0, sdm845_pp_sblk_te, -1, -1),
> -};
> -
>  static const struct dpu_pingpong_cfg sm8150_pp[] = {
>  	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x70000, MERGE_3D_0, sdm845_pp_sblk_te,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
> @@ -1218,11 +1135,6 @@ static const struct dpu_intf_cfg sdm845_intf[] = {
>  	INTF_BLK("intf_3", INTF_3, 0x6B800, 0x280, INTF_DP, 1, 24, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
>  };
>  
> -static const struct dpu_intf_cfg sc7180_intf[] = {
> -	INTF_BLK("intf_0", INTF_0, 0x6A000, 0x2b8, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> -	INTF_BLK("intf_1", INTF_1, 0x6A800, 0x2b8, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> -};
> -
>  static const struct dpu_intf_cfg sm8150_intf[] = {
>  	INTF_BLK("intf_0", INTF_0, 0x6A000, 0x2b8, INTF_DP, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
>  	INTF_BLK("intf_1", INTF_1, 0x6A800, 0x2b8, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> @@ -1539,34 +1451,6 @@ static const struct dpu_perf_cfg sdm845_perf_data = {
>  	.bw_inefficiency_factor = 120,
>  };
>  
> -static const struct dpu_perf_cfg sc7180_perf_data = {
> -	.max_bw_low = 6800000,
> -	.max_bw_high = 6800000,
> -	.min_core_ib = 2400000,
> -	.min_llcc_ib = 800000,
> -	.min_dram_ib = 1600000,
> -	.min_prefill_lines = 24,
> -	.danger_lut_tbl = {0xff, 0xffff, 0x0},
> -	.safe_lut_tbl = {0xfff0, 0xff00, 0xffff},
> -	.qos_lut_tbl = {
> -		{.nentry = ARRAY_SIZE(sc7180_qos_linear),
> -		.entries = sc7180_qos_linear
> -		},
> -		{.nentry = ARRAY_SIZE(sc7180_qos_macrotile),
> -		.entries = sc7180_qos_macrotile
> -		},
> -		{.nentry = ARRAY_SIZE(sc7180_qos_nrt),
> -		.entries = sc7180_qos_nrt
> -		},
> -	},
> -	.cdp_cfg = {
> -		{.rd_enable = 1, .wr_enable = 1},
> -		{.rd_enable = 1, .wr_enable = 0}
> -	},
> -	.clk_inefficiency_factor = 105,
> -	.bw_inefficiency_factor = 120,
> -};
> -
>  static const struct dpu_perf_cfg sm8150_perf_data = {
>  	.max_bw_low = 12800000,
>  	.max_bw_high = 12800000,
> @@ -1705,33 +1589,6 @@ static const struct dpu_mdss_cfg sdm845_dpu_cfg = {
>  	.mdss_irqs = IRQ_SDM845_MASK,
>  };
>  
> -static const struct dpu_mdss_cfg sc7180_dpu_cfg = {
> -	.caps = &sc7180_dpu_caps,
> -	.ubwc = &sc7180_ubwc_cfg,
> -	.mdp_count = ARRAY_SIZE(sc7180_mdp),
> -	.mdp = sc7180_mdp,
> -	.ctl_count = ARRAY_SIZE(sc7180_ctl),
> -	.ctl = sc7180_ctl,
> -	.sspp_count = ARRAY_SIZE(sc7180_sspp),
> -	.sspp = sc7180_sspp,
> -	.mixer_count = ARRAY_SIZE(sc7180_lm),
> -	.mixer = sc7180_lm,
> -	.dspp_count = ARRAY_SIZE(sc7180_dspp),
> -	.dspp = sc7180_dspp,
> -	.pingpong_count = ARRAY_SIZE(sc7180_pp),
> -	.pingpong = sc7180_pp,
> -	.intf_count = ARRAY_SIZE(sc7180_intf),
> -	.intf = sc7180_intf,
> -	.wb_count = ARRAY_SIZE(sm8250_wb),
> -	.wb = sm8250_wb,
> -	.vbif_count = ARRAY_SIZE(sdm845_vbif),
> -	.vbif = sdm845_vbif,
> -	.reg_dma_count = 1,
> -	.dma_cfg = &sdm845_regdma,
> -	.perf = &sc7180_perf_data,
> -	.mdss_irqs = IRQ_SC7180_MASK,
> -};
> -
>  static const struct dpu_mdss_cfg sm8150_dpu_cfg = {
>  	.caps = &sm8150_dpu_caps,
>  	.ubwc = &sm8150_ubwc_cfg,
> @@ -1817,6 +1674,7 @@ static const struct dpu_mdss_cfg sm8250_dpu_cfg = {
>  	.mdss_irqs = IRQ_SM8250_MASK,
>  };
>  
> +#include "catalog/dpu_6_2_sc7180.h"
>  #include "catalog/dpu_6_5_qcm2290.h"
>  #include "catalog/dpu_6_3_sm6115.h"
>  
