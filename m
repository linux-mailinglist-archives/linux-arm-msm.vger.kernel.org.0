Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EFCA670AEF3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 May 2023 18:11:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231146AbjEUQLB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 21 May 2023 12:11:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229957AbjEUQKv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 21 May 2023 12:10:51 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21BFE12B
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 May 2023 09:10:41 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2af24ee004dso29601281fa.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 May 2023 09:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684685440; x=1687277440;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WU6W3PKh6pacgo2iyJiyQgcIG1/wHjAs9Z77Ybdfmns=;
        b=xv2kFlJOSOLos99oQybfx6GL91x15wKi6Fd0v75o6rCW+iQA70Vl9+u8y0lELzUaYE
         NJiaRcHK9CN23u0HonvRJQd8Colf1ETS3DlPXreVvslIXFt2Y5uRyYF4R5ZapoZVVP9n
         7ftToRa/i0gnnDPuJLovLQso77NqMmxM2kSu9LbufEopJi4RNDSSs6XjcHREuV7imRKN
         aqbSPOZ6WRJy9MwI6DeiBTigX0l9SazeBIDbqirScuNbVYglPJQ2vqO63pX4BqcfMI/d
         AlnYdcGt3JqETdqHsByQs6WsCxPh5J7WciSp7LCAROW0Zv8hpO5fIwxfya0A+/j1zr5O
         +nPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684685440; x=1687277440;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WU6W3PKh6pacgo2iyJiyQgcIG1/wHjAs9Z77Ybdfmns=;
        b=HzV2Bz6YpTlK+RsxN+Z5XBfBWta1h9oDf3syZwAoMUrG6eyrpBR3+jYQkx1a23qtNF
         MYjHco0p+RPAdn8w2L45o1aMMZpgmUGWe9v4lC7/LWBfGoQzhUA6Jx96sqcubBYxeF0e
         jErhk1hKB97MeUL0iTNCTb9iQM4joFWy098Q/8uJXIxUKmao/ECVFauyJp+irplwy3Bg
         dczLeXs2OQsxxEOLXRRbdkgvGxg1GqhoONHntcS9bykIYNAlSfT7UjiT4MvCDQOn2s6l
         PzjJT6g91i2a1rrCDVWjTfy4DOl9/PstmNv4Tei4a9lIc17AqDKToH2g/xraDomWBCsk
         hsJg==
X-Gm-Message-State: AC+VfDz6UQVY3CC47RcMsH8jpuET8U7deypfvjMyktXHRTHXsKQ98d9C
        h7voxl9gZ/XADN/wFEikJ0RZ0w==
X-Google-Smtp-Source: ACHHUZ5lKW4/ojX2AKibLUe7lDkCODx7KDER/KyzEAfkQw40GOf7z7XjpuC8mpY29EupH0jQxgVFxw==
X-Received: by 2002:a2e:2e0f:0:b0:2a8:e480:a3c8 with SMTP id u15-20020a2e2e0f000000b002a8e480a3c8mr2896926lju.44.1684685440090;
        Sun, 21 May 2023 09:10:40 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id y2-20020a2e3202000000b002adf8d948dasm749819ljy.35.2023.05.21.09.10.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 May 2023 09:10:39 -0700 (PDT)
Message-ID: <233b9b14-999d-b96f-3a5e-4eb84b1d053b@linaro.org>
Date:   Sun, 21 May 2023 19:10:38 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4 08/12] drm/msm/dpu: Add SM6375 support
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev
References: <20230411-topic-straitlagoon_mdss-v4-0-68e7e25d70e1@linaro.org>
 <20230411-topic-straitlagoon_mdss-v4-8-68e7e25d70e1@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230411-topic-straitlagoon_mdss-v4-8-68e7e25d70e1@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 19/05/2023 20:04, Konrad Dybcio wrote:
> Add basic SM6375 support to the DPU1 driver to enable display output.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h | 153 +++++++++++++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   1 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
>   4 files changed, 156 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
> new file mode 100644
> index 000000000000..5085e7409ff6
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
> @@ -0,0 +1,153 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2022. Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2015-2018, 2020 The Linux Foundation. All rights reserved.
> + * Copyright (c) 2023, Linaro Limited
> + */
> +
> +#ifndef _DPU_6_9_SM6375_H
> +#define _DPU_6_9_SM6375_H
> +
> +static const struct dpu_caps sm6375_dpu_caps = {
> +	.max_mixer_width = DEFAULT_DPU_LINE_WIDTH,
> +	.max_mixer_blendstages = 0x4,
> +	.qseed_type = DPU_SSPP_SCALER_QSEED4,
> +	.has_dim_layer = true,
> +	.has_idle_pc = true,
> +	.max_linewidth = 2160,
> +	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
> +};
> +
> +static const struct dpu_ubwc_cfg sm6375_ubwc_cfg = {
> +	.ubwc_version = DPU_HW_UBWC_VER_20,
> +	.ubwc_swizzle = 6,
> +	.highest_bank_bit = 1,
> +};
> +
> +static const struct dpu_mdp_cfg sm6375_mdp[] = {
> +	{
> +	.name = "top_0", .id = MDP_TOP,
> +	.base = 0x0, .len = 0x494,
> +	.features = 0,
> +	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
> +	.clk_ctrls[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
> +	},
> +};
> +
> +static const struct dpu_ctl_cfg sm6375_ctl[] = {
> +	{
> +	.name = "ctl_0", .id = CTL_0,
> +	.base = 0x1000, .len = 0x1dc,
> +	.features = BIT(DPU_CTL_ACTIVE_CFG),
> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
> +	},
> +};
> +
> +static const struct dpu_sspp_cfg sm6375_sspp[] = {
> +	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1f8, VIG_SC7180_MASK,
> +		sm6115_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
> +	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x1f8, DMA_SDM845_MASK,
> +		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
> +};
> +
> +static const struct dpu_lm_cfg sm6375_lm[] = {
> +	LM_BLK("lm_0", LM_0, 0x44000, MIXER_QCM2290_MASK,
> +		&qcm2290_lm_sblk, PINGPONG_0, 0, DSPP_0),
> +};
> +
> +static const struct dpu_dspp_cfg sm6375_dspp[] = {
> +	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
> +		&sm8150_dspp_sblk),
> +};
> +
> +static const struct dpu_pingpong_cfg sm6375_pp[] = {
> +	PP_BLK("pingpong_0", PINGPONG_0, 0x70000, PINGPONG_SM8150_MASK, 0, sdm845_pp_sblk,
> +		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
> +		-1),
> +};
> +
> +static const struct dpu_intf_cfg sm6375_intf[] = {
> +	INTF_BLK("intf_0", INTF_0, 0x00000, 0x2c0, INTF_NONE, 0, 0, 0, 0, 0),

I think this is 0x280. Or maybe even better would be to drop it (and in 
sm6350 too).

> +	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x6a800, 0x2c0, INTF_DSI, 0, 24, INTF_SC7280_MASK,
> +		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
> +		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
> +		DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2)),
> +};
> +
> +static const struct dpu_vbif_cfg sm6375_vbif[] = {

Please use sdm845_vbif

> +	{
> +	.name = "vbif_0", .id = VBIF_RT,
> +	.base = 0, .len = 0x2008,
> +	.features = BIT(DPU_VBIF_QOS_REMAP),
> +	.xin_halt_timeout = 0x4000,
> +	.qos_rp_remap_size = 0x40,
> +	.qos_rt_tbl = {
> +		.npriority_lvl = ARRAY_SIZE(sdm845_rt_pri_lvl),
> +		.priority_lvl = sdm845_rt_pri_lvl,
> +		},
> +	.qos_nrt_tbl = {
> +		.npriority_lvl = ARRAY_SIZE(sdm845_nrt_pri_lvl),
> +		.priority_lvl = sdm845_nrt_pri_lvl,
> +		},
> +	.memtype_count = 14,
> +	.memtype = {3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3},
> +	},
> +};
> +
> +static const struct dpu_perf_cfg sm6375_perf_data = {
> +	.max_bw_low = 5200000,
> +	.max_bw_high = 6200000,
> +	.min_core_ib = 2500000,
> +	.min_llcc_ib = 0, /* No LLCC on this SoC */
> +	.min_dram_ib = 1600000,
> +	.min_prefill_lines = 24,
> +	/* TODO: confirm danger_lut_tbl */
> +	.danger_lut_tbl = {0xffff, 0xffff, 0x0},
> +	.safe_lut_tbl = {0xfe00, 0xfe00, 0xffff},
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
> +const struct dpu_mdss_cfg dpu_sm6375_cfg = {
> +	.caps = &sm6375_dpu_caps,
> +	.ubwc = &sm6375_ubwc_cfg,
> +	.mdp_count = ARRAY_SIZE(sm6375_mdp),
> +	.mdp = sm6375_mdp,
> +	.ctl_count = ARRAY_SIZE(sm6375_ctl),
> +	.ctl = sm6375_ctl,
> +	.sspp_count = ARRAY_SIZE(sm6375_sspp),
> +	.sspp = sm6375_sspp,
> +	.mixer_count = ARRAY_SIZE(sm6375_lm),
> +	.mixer = sm6375_lm,
> +	.dspp_count = ARRAY_SIZE(sm6375_dspp),
> +	.dspp = sm6375_dspp,
> +	.pingpong_count = ARRAY_SIZE(sm6375_pp),
> +	.pingpong = sm6375_pp,
> +	.intf_count = ARRAY_SIZE(sm6375_intf),
> +	.intf = sm6375_intf,
> +	.vbif_count = ARRAY_SIZE(sm6375_vbif),
> +	.vbif = sm6375_vbif,
> +	.perf = &sm6375_perf_data,
> +	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
> +		     BIT(MDP_SSPP_TOP0_INTR2) | \
> +		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
> +		     BIT(MDP_INTF1_INTR) | \
> +		     BIT(MDP_INTF1_TEAR_INTR),
> +};
> +
> +#endif
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 5ef1dffc27dc..7577572a5ef4 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -809,6 +809,7 @@ static const struct dpu_qos_lut_entry sc7180_qos_nrt[] = {
>   #include "catalog/dpu_6_3_sm6115.h"
>   #include "catalog/dpu_6_4_sm6350.h"
>   #include "catalog/dpu_6_5_qcm2290.h"
> +#include "catalog/dpu_6_9_sm6375.h"
>   
>   #include "catalog/dpu_7_0_sm8350.h"
>   #include "catalog/dpu_7_2_sc7280.h"
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 67ff78e7bc99..3d35fcfaf446 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -882,6 +882,7 @@ extern const struct dpu_mdss_cfg dpu_sc7180_cfg;
>   extern const struct dpu_mdss_cfg dpu_sm6115_cfg;
>   extern const struct dpu_mdss_cfg dpu_sm6350_cfg;
>   extern const struct dpu_mdss_cfg dpu_qcm2290_cfg;
> +extern const struct dpu_mdss_cfg dpu_sm6375_cfg;
>   extern const struct dpu_mdss_cfg dpu_sm8350_cfg;
>   extern const struct dpu_mdss_cfg dpu_sc7280_cfg;
>   extern const struct dpu_mdss_cfg dpu_sc8280xp_cfg;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 46be7ad8d615..980c3c8f8269 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -1287,6 +1287,7 @@ static const struct of_device_id dpu_dt_match[] = {
>   	{ .compatible = "qcom,sc8280xp-dpu", .data = &dpu_sc8280xp_cfg, },
>   	{ .compatible = "qcom,sm6115-dpu", .data = &dpu_sm6115_cfg, },
>   	{ .compatible = "qcom,sm6350-dpu", .data = &dpu_sm6350_cfg, },
> +	{ .compatible = "qcom,sm6375-dpu", .data = &dpu_sm6375_cfg, },
>   	{ .compatible = "qcom,sm8150-dpu", .data = &dpu_sm8150_cfg, },
>   	{ .compatible = "qcom,sm8250-dpu", .data = &dpu_sm8250_cfg, },
>   	{ .compatible = "qcom,sm8350-dpu", .data = &dpu_sm8350_cfg, },
> 

-- 
With best wishes
Dmitry

