Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C426B6D045A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Mar 2023 14:08:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231349AbjC3MIf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Mar 2023 08:08:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231321AbjC3MId (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Mar 2023 08:08:33 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A94E5240
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 05:08:25 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id a11so19340402lji.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 05:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680178103;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X0eFzBIjTaoLMGITdLc0Le8FkqJdSU2AOxyyQAPvPcI=;
        b=XwcWpE0duuURNlYoFzQcO0iPJBvzJSDLDDsJ4Vthcw6/mWdQo7p2D+LeOmrI3Dk6Z0
         PUkJdfvsygPf8eZaP6BZ0IU8smSgJhtoD2lNwCoTOvyCLzFMrILZPJ1/TW9IKrdlnOc9
         CbmZGfIYrtqC8sH4SsRt1GeSX9p9c1rXWiNbkgFsrUO6Q2Qy9UusrGnjTIz9ItGlzMu/
         yiq3pCncw7bAF5OXRtJpclJb/MPDKzsHBycVoxK661/KZ6j0zA30bsxpnkv1HroFh+Vm
         h1pna4QkFIxcnvI5bG4kUBY6RKe5a3NwGCKhOOjKKDu9OmXqjfFfChH52sjxt3eu3PIy
         ORKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680178103;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X0eFzBIjTaoLMGITdLc0Le8FkqJdSU2AOxyyQAPvPcI=;
        b=joVEgLZIXvPbO67/rOOI2y8Yn8SgTvINMeXrbpIux3KaWU9rcwUojZzht2MRlfxdQA
         OJwxb3ZV5QucEA13acmJPf3ZfTvq8oLObjy4+qHjWBvGtv64qEXJHuK53UlTKyQ+Q5R3
         ByGrazIRR1rt5VmKn8WCUqUXQ/NEsif36c12vL4ZRBDr/8DrevrivrxYY1jaszXU8KLh
         I6KZYVc/2qkpO4OsTxIwUPsfp4XkoL0oQVLo9mIrlxWAPTNesx7UTkXjU++os/3eio8r
         PLJeEWlrbuayYNPGTHC5d7vrzJZr/Qg7rtpEtLdXJU+AwNS3JxxYrEtYKWPQ6OcHX2yD
         /cVw==
X-Gm-Message-State: AAQBX9cm/1QCTUPPbPSTL7abrjdroYjArpsgNy9NW0sf0DEqVMRjtoK8
        m2zczaGZNlbfTkLmBe4uun/RSw==
X-Google-Smtp-Source: AKy350bqaCg/89XXHDVqz4+DteFeJSmWHMXGZOWhHQk+45q8ZqheVNpPlaHjVPVLZ2go/RpAL2XHjA==
X-Received: by 2002:a2e:918a:0:b0:298:ac88:8d51 with SMTP id f10-20020a2e918a000000b00298ac888d51mr7470424ljg.42.1680178103484;
        Thu, 30 Mar 2023 05:08:23 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
        by smtp.gmail.com with ESMTPSA id o10-20020a2e730a000000b00294692d8645sm5936446ljc.17.2023.03.30.05.08.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Mar 2023 05:08:23 -0700 (PDT)
Message-ID: <f4a6fc48-2484-b8f2-25a5-e0767e0e97bf@linaro.org>
Date:   Thu, 30 Mar 2023 14:08:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [v2,27/50] drm/msm/dpu: split SC8180X catalog entry to the
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
References: <20230211231259.1308718-28-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230211231259.1308718-28-dmitry.baryshkov@linaro.org>
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
>  .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   | 108 ++++++++++++++++++
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 106 +----------------
>  2 files changed, 109 insertions(+), 105 deletions(-)
>  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> new file mode 100644
> index 000000000000..732ff876d311
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> @@ -0,0 +1,108 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2022. Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2015-2018, 2020 The Linux Foundation. All rights reserved.
> + */
> +
> +#ifndef _DPU_5_1_SC8180X_H
> +#define _DPU_5_1_SC8180X_H
> +
> +static const struct dpu_caps sc8180x_dpu_caps = {
> +	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
> +	.max_mixer_blendstages = 0xb,
> +	.qseed_type = DPU_SSPP_SCALER_QSEED3,
> +	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
Rebase

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
> +	.has_src_split = true,
> +	.has_dim_layer = true,
> +	.has_idle_pc = true,
> +	.has_3d_merge = true,
> +	.max_linewidth = 4096,
> +	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
> +	.max_hdeci_exp = MAX_HORZ_DECIMATION,
> +	.max_vdeci_exp = MAX_VERT_DECIMATION,
> +};
> +
> +static const struct dpu_ubwc_cfg sc8180x_ubwc_cfg = {
> +	.ubwc_version = DPU_HW_UBWC_VER_30,
> +	.highest_bank_bit = 0x3,
> +};
> +
> +static const struct dpu_mdp_cfg sc8180x_mdp[] = {
> +	{
> +	.name = "top_0", .id = MDP_TOP,
> +	.base = 0x0, .len = 0x45c,
> +	.features = BIT(DPU_MDP_AUDIO_SELECT),
> +	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
> +	.clk_ctrls[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
> +	.clk_ctrls[DPU_CLK_CTRL_VIG2] = { .reg_off = 0x2bc, .bit_off = 0 },
> +	.clk_ctrls[DPU_CLK_CTRL_VIG3] = { .reg_off = 0x2c4, .bit_off = 0 },
> +	.clk_ctrls[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
> +	.clk_ctrls[DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8 },
> +	.clk_ctrls[DPU_CLK_CTRL_DMA2] = { .reg_off = 0x2bc, .bit_off = 8 },
> +	.clk_ctrls[DPU_CLK_CTRL_DMA3] = { .reg_off = 0x2c4, .bit_off = 8 },
> +	},
> +};
> +
> +static const struct dpu_intf_cfg sc8180x_intf[] = {
> +	INTF_BLK("intf_0", INTF_0, 0x6a000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> +	INTF_BLK("intf_1", INTF_1, 0x6a800, 0x280, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> +	INTF_BLK("intf_2", INTF_2, 0x6b000, 0x280, INTF_DSI, 1, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
> +	/* INTF_3 is for MST, wired to INTF_DP 0 and 1, use dummy index until this is supported */
> +	INTF_BLK("intf_3", INTF_3, 0x6b800, 0x280, INTF_DP, 999, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
> +	INTF_BLK("intf_4", INTF_4, 0x6c000, 0x280, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 20, 21),
> +	INTF_BLK("intf_5", INTF_5, 0x6c800, 0x280, INTF_DP, MSM_DP_CONTROLLER_2, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 22, 23),
> +};
> +
> +static const struct dpu_perf_cfg sc8180x_perf_data = {
> +	.max_bw_low = 9600000,
> +	.max_bw_high = 9600000,
> +	.min_core_ib = 2400000,
> +	.min_llcc_ib = 800000,
> +	.min_dram_ib = 800000,
> +	.danger_lut_tbl = {0xf, 0xffff, 0x0},
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
> +		/* TODO: macrotile-qseed is different from macrotile */
> +	},
> +	.cdp_cfg = {
> +		{.rd_enable = 1, .wr_enable = 1},
> +		{.rd_enable = 1, .wr_enable = 0}
> +	},
> +	.clk_inefficiency_factor = 105,
> +	.bw_inefficiency_factor = 120,
> +};
> +
> +static const struct dpu_mdss_cfg sc8180x_dpu_cfg = {
> +	.caps = &sc8180x_dpu_caps,
> +	.ubwc = &sc8180x_ubwc_cfg,
> +	.mdp_count = ARRAY_SIZE(sc8180x_mdp),
> +	.mdp = sc8180x_mdp,
> +	.ctl_count = ARRAY_SIZE(sm8150_ctl),
> +	.ctl = sm8150_ctl,
> +	.sspp_count = ARRAY_SIZE(sdm845_sspp),
> +	.sspp = sdm845_sspp,
> +	.mixer_count = ARRAY_SIZE(sm8150_lm),
> +	.mixer = sm8150_lm,
> +	.pingpong_count = ARRAY_SIZE(sm8150_pp),
> +	.pingpong = sm8150_pp,
> +	.merge_3d_count = ARRAY_SIZE(sm8150_merge_3d),
> +	.merge_3d = sm8150_merge_3d,
> +	.intf_count = ARRAY_SIZE(sc8180x_intf),
> +	.intf = sc8180x_intf,
> +	.vbif_count = ARRAY_SIZE(sdm845_vbif),
> +	.vbif = sdm845_vbif,
> +	.reg_dma_count = 1,
> +	.dma_cfg = &sm8150_regdma,
> +	.perf = &sc8180x_perf_data,
> +	.mdss_irqs = IRQ_SC8180X_MASK,
> +};
> +
> +#endif
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index b2d994de297c..13796d40c1d7 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -343,21 +343,6 @@ static const struct dpu_caps sm8150_dpu_caps = {
>  	.max_vdeci_exp = MAX_VERT_DECIMATION,
>  };
>  
> -static const struct dpu_caps sc8180x_dpu_caps = {
> -	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
> -	.max_mixer_blendstages = 0xb,
> -	.qseed_type = DPU_SSPP_SCALER_QSEED3,
> -	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
> -	.has_src_split = true,
> -	.has_dim_layer = true,
> -	.has_idle_pc = true,
> -	.has_3d_merge = true,
> -	.max_linewidth = 4096,
> -	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
> -	.max_hdeci_exp = MAX_HORZ_DECIMATION,
> -	.max_vdeci_exp = MAX_VERT_DECIMATION,
> -};
> -
>  static const struct dpu_ubwc_cfg msm8998_ubwc_cfg = {
>  	.ubwc_version = DPU_HW_UBWC_VER_10,
>  	.highest_bank_bit = 0x2,
> @@ -373,11 +358,6 @@ static const struct dpu_ubwc_cfg sm8150_ubwc_cfg = {
>  	.highest_bank_bit = 0x2,
>  };
>  
> -static const struct dpu_ubwc_cfg sc8180x_ubwc_cfg = {
> -	.ubwc_version = DPU_HW_UBWC_VER_30,
> -	.highest_bank_bit = 0x3,
> -};
> -
>  static const struct dpu_mdp_cfg msm8998_mdp[] = {
>  	{
>  	.name = "top_0", .id = MDP_TOP,
> @@ -430,30 +410,6 @@ static const struct dpu_mdp_cfg sdm845_mdp[] = {
>  	},
>  };
>  
> -static const struct dpu_mdp_cfg sc8180x_mdp[] = {
> -	{
> -	.name = "top_0", .id = MDP_TOP,
> -	.base = 0x0, .len = 0x45C,
> -	.features = BIT(DPU_MDP_AUDIO_SELECT),
> -	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
> -			.reg_off = 0x2AC, .bit_off = 0},
> -	.clk_ctrls[DPU_CLK_CTRL_VIG1] = {
> -			.reg_off = 0x2B4, .bit_off = 0},
> -	.clk_ctrls[DPU_CLK_CTRL_VIG2] = {
> -			.reg_off = 0x2BC, .bit_off = 0},
> -	.clk_ctrls[DPU_CLK_CTRL_VIG3] = {
> -			.reg_off = 0x2C4, .bit_off = 0},
> -	.clk_ctrls[DPU_CLK_CTRL_DMA0] = {
> -			.reg_off = 0x2AC, .bit_off = 8},
> -	.clk_ctrls[DPU_CLK_CTRL_DMA1] = {
> -			.reg_off = 0x2B4, .bit_off = 8},
> -	.clk_ctrls[DPU_CLK_CTRL_DMA2] = {
> -			.reg_off = 0x2BC, .bit_off = 8},
> -	.clk_ctrls[DPU_CLK_CTRL_DMA3] = {
> -			.reg_off = 0x2C4, .bit_off = 8},
> -	},
> -};
> -
>  /*************************************************************
>   * CTL sub blocks config
>   *************************************************************/
> @@ -1076,16 +1032,6 @@ static const struct dpu_intf_cfg sm8150_intf[] = {
>  	INTF_BLK("intf_3", INTF_3, 0x6B800, 0x2b8, INTF_DP, 1, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
>  };
>  
> -static const struct dpu_intf_cfg sc8180x_intf[] = {
> -	INTF_BLK("intf_0", INTF_0, 0x6A000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> -	INTF_BLK("intf_1", INTF_1, 0x6A800, 0x280, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> -	INTF_BLK("intf_2", INTF_2, 0x6B000, 0x280, INTF_DSI, 1, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
> -	/* INTF_3 is for MST, wired to INTF_DP 0 and 1, use dummy index until this is supported */
> -	INTF_BLK("intf_3", INTF_3, 0x6B800, 0x280, INTF_DP, 999, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
> -	INTF_BLK("intf_4", INTF_4, 0x6C000, 0x280, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 20, 21),
> -	INTF_BLK("intf_5", INTF_5, 0x6C800, 0x280, INTF_DP, MSM_DP_CONTROLLER_2, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 22, 23),
> -};
> -
>  /*************************************************************
>   * Writeback blocks config
>   *************************************************************/
> @@ -1409,33 +1355,6 @@ static const struct dpu_perf_cfg sm8150_perf_data = {
>  	.bw_inefficiency_factor = 120,
>  };
>  
> -static const struct dpu_perf_cfg sc8180x_perf_data = {
> -	.max_bw_low = 9600000,
> -	.max_bw_high = 9600000,
> -	.min_core_ib = 2400000,
> -	.min_llcc_ib = 800000,
> -	.min_dram_ib = 800000,
> -	.danger_lut_tbl = {0xf, 0xffff, 0x0},
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
> -		/* TODO: macrotile-qseed is different from macrotile */
> -	},
> -	.cdp_cfg = {
> -		{.rd_enable = 1, .wr_enable = 1},
> -		{.rd_enable = 1, .wr_enable = 0}
> -	},
> -	.clk_inefficiency_factor = 105,
> -	.bw_inefficiency_factor = 120,
> -};
> -
>  /*************************************************************
>   * Hardware catalog
>   *************************************************************/
> @@ -1518,30 +1437,7 @@ static const struct dpu_mdss_cfg sm8150_dpu_cfg = {
>  	.mdss_irqs = IRQ_SDM845_MASK,
>  };
>  
> -static const struct dpu_mdss_cfg sc8180x_dpu_cfg = {
> -	.caps = &sc8180x_dpu_caps,
> -	.ubwc = &sc8180x_ubwc_cfg,
> -	.mdp_count = ARRAY_SIZE(sc8180x_mdp),
> -	.mdp = sc8180x_mdp,
> -	.ctl_count = ARRAY_SIZE(sm8150_ctl),
> -	.ctl = sm8150_ctl,
> -	.sspp_count = ARRAY_SIZE(sdm845_sspp),
> -	.sspp = sdm845_sspp,
> -	.mixer_count = ARRAY_SIZE(sm8150_lm),
> -	.mixer = sm8150_lm,
> -	.pingpong_count = ARRAY_SIZE(sm8150_pp),
> -	.pingpong = sm8150_pp,
> -	.merge_3d_count = ARRAY_SIZE(sm8150_merge_3d),
> -	.merge_3d = sm8150_merge_3d,
> -	.intf_count = ARRAY_SIZE(sc8180x_intf),
> -	.intf = sc8180x_intf,
> -	.vbif_count = ARRAY_SIZE(sdm845_vbif),
> -	.vbif = sdm845_vbif,
> -	.reg_dma_count = 1,
> -	.dma_cfg = &sm8150_regdma,
> -	.perf = &sc8180x_perf_data,
> -	.mdss_irqs = IRQ_SC8180X_MASK,
> -};
> +#include "catalog/dpu_5_1_sc8180x.h"
>  
>  #include "catalog/dpu_6_0_sm8250.h"
>  #include "catalog/dpu_6_2_sc7180.h"
