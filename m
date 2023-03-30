Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADFE36D03C8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Mar 2023 13:48:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230181AbjC3LsA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Mar 2023 07:48:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231194AbjC3Lr6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Mar 2023 07:47:58 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E4B39770
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 04:47:40 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id j11so24108423lfg.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 04:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680176857;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dN6gpqlaRCe87B84QZtc+IVdQ7PwUD1wkL26LMXP+MA=;
        b=cVc4lCMicJRSs5sKLy/hp0waDjG6rXGt1WhthkywgDW3MIG7b+3i9a1Nj5Ht5TzLFK
         T46gchJ7MIbubHNhrXOCKCBNKOtVS23srysm9AYcmDiOS02/iVhnMFGh7XOl+ycZR6d6
         NCQKiD6cqHS7rBa3CV/fOx43vvHjW8wPlFMqykytDAGTJOAGVHoItQJBHuejuBSeMImu
         5U9Shj6XwJMfUZQMFf1Grbw2FTss9+k1w+10e+fY8g7uQ2BMIYnNgWB8J6d1NTVDc0TJ
         MViyWmXGyRIELSvzuO7FNducTnHfgdqEgLdYbZfoEOSFtivW/54ROSx86f+7usjBPw8x
         xCVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680176857;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dN6gpqlaRCe87B84QZtc+IVdQ7PwUD1wkL26LMXP+MA=;
        b=7/8Na/7e/YkMkEDN36kvomH337O3EP3eusxcQUN8msTCobW8uvKH8i5zWp+Tsm68gc
         60bjiJlmJhaOpktkZ0+hxHzyItg25D9QHHWKVDCa8H3MWC01U4M2sET0aB3mZM3WZdzv
         o7Wp4DkyWGc9cNAf38CT+KK5Si3sNxPUBFe5Bg+eZv7FsHxcOcBYeb86Zy6rZ/SQqNfK
         hGI3WMVUjNAL0mTOzYwfMFSda1mJNOfUyZ+f6Ywr+NRRpOoLgM1XCP4Zy3YQbh2b7xZ8
         926EXchX6SF2hT5HFdmjaZoX2umDYR07gv02vGK/BiN5Dv6MLnGhidbrPQJD25E0jmz3
         MAVA==
X-Gm-Message-State: AAQBX9eO7yqnW4BbA2cMpfad84zrgjhY0Sj0FGY4fo1gZgUOg+O9bQDQ
        O8Ngf77npb+tI0hkBMAwg3d1nA==
X-Google-Smtp-Source: AKy350Y7yZSctfWMKxztf8Fs3AeYRi4RXxWAc92UW089/ItKJegHJPEKQBSil7pxzd0e9n5EsQX+OQ==
X-Received: by 2002:ac2:4c26:0:b0:4e9:a16f:a176 with SMTP id u6-20020ac24c26000000b004e9a16fa176mr7400691lfq.36.1680176857417;
        Thu, 30 Mar 2023 04:47:37 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
        by smtp.gmail.com with ESMTPSA id w10-20020a19c50a000000b004e84a8c3d86sm5889893lfe.42.2023.03.30.04.47.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Mar 2023 04:47:37 -0700 (PDT)
Message-ID: <ce8ffd25-e82c-b84c-ebad-2fde6dbac7c4@linaro.org>
Date:   Thu, 30 Mar 2023 13:47:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [v2,23/50] drm/msm/dpu: split SM6115 catalog entry to the
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
References: <20230211231259.1308718-24-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230211231259.1308718-24-dmitry.baryshkov@linaro.org>
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
>  .../msm/disp/dpu1/catalog/dpu_6_3_sm6115.h    | 96 +++++++++++++++++++
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 90 +----------------
>  2 files changed, 98 insertions(+), 88 deletions(-)
>  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
> new file mode 100644
> index 000000000000..aadb65329ec3
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
> @@ -0,0 +1,96 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2022. Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2015-2018, 2020 The Linux Foundation. All rights reserved.
> + */
> +
> +#ifndef _DPU_6_3_SM6115_H
> +#define _DPU_6_3_SM6115_H
> +
> +static const struct dpu_caps sm6115_dpu_caps = {
> +	.max_mixer_width = DEFAULT_DPU_LINE_WIDTH,
> +	.max_mixer_blendstages = 0x4,
> +	.qseed_type = DPU_SSPP_SCALER_QSEED4,
> +	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
Rebase

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
> +	.has_dim_layer = true,
> +	.has_idle_pc = true,
> +	.max_linewidth = 2160,
> +	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
> +};
> +
> +static const struct dpu_ubwc_cfg sm6115_ubwc_cfg = {
> +	.ubwc_version = DPU_HW_UBWC_VER_10,
> +	.highest_bank_bit = 0x1,
> +	.ubwc_swizzle = 0x7,
> +};
> +
> +static const struct dpu_mdp_cfg sm6115_mdp[] = {
> +	{
> +	.name = "top_0", .id = MDP_TOP,
> +	.base = 0x0, .len = 0x494,
> +	.features = 0,
> +	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
> +	.clk_ctrls[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
> +	},
> +};
> +
> +static const struct dpu_sspp_cfg sm6115_sspp[] = {
> +	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1f8, VIG_SC7180_MASK,
> +		sm6115_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
> +	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x1f8, DMA_SDM845_MASK,
> +		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
> +};
> +
> +static const struct dpu_perf_cfg sm6115_perf_data = {
> +	.max_bw_low = 3100000,
> +	.max_bw_high = 4000000,
> +	.min_core_ib = 2400000,
> +	.min_llcc_ib = 800000,
> +	.min_dram_ib = 800000,
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
> +static const struct dpu_mdss_cfg sm6115_dpu_cfg = {
> +	.caps = &sm6115_dpu_caps,
> +	.ubwc = &sm6115_ubwc_cfg,
> +	.mdp_count = ARRAY_SIZE(sm6115_mdp),
> +	.mdp = sm6115_mdp,
> +	.ctl_count = ARRAY_SIZE(qcm2290_ctl),
> +	.ctl = qcm2290_ctl,
> +	.sspp_count = ARRAY_SIZE(sm6115_sspp),
> +	.sspp = sm6115_sspp,
> +	.mixer_count = ARRAY_SIZE(qcm2290_lm),
> +	.mixer = qcm2290_lm,
> +	.dspp_count = ARRAY_SIZE(qcm2290_dspp),
> +	.dspp = qcm2290_dspp,
> +	.pingpong_count = ARRAY_SIZE(qcm2290_pp),
> +	.pingpong = qcm2290_pp,
> +	.intf_count = ARRAY_SIZE(qcm2290_intf),
> +	.intf = qcm2290_intf,
> +	.vbif_count = ARRAY_SIZE(sdm845_vbif),
> +	.vbif = sdm845_vbif,
> +	.perf = &sm6115_perf_data,
> +	.mdss_irqs = IRQ_SC7180_MASK,
> +};
> +
> +#endif
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index f7a940fe67ff..15ac2a86dbb1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -349,17 +349,6 @@ static const struct dpu_caps sc7180_dpu_caps = {
>  	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>  };
>  
> -static const struct dpu_caps sm6115_dpu_caps = {
> -	.max_mixer_width = DEFAULT_DPU_LINE_WIDTH,
> -	.max_mixer_blendstages = 0x4,
> -	.qseed_type = DPU_SSPP_SCALER_QSEED4,
> -	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
> -	.has_dim_layer = true,
> -	.has_idle_pc = true,
> -	.max_linewidth = 2160,
> -	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
> -};
> -
>  static const struct dpu_caps sm8150_dpu_caps = {
>  	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
>  	.max_mixer_blendstages = 0xb,
> @@ -422,12 +411,6 @@ static const struct dpu_ubwc_cfg sc7180_ubwc_cfg = {
>  	.highest_bank_bit = 0x3,
>  };
>  
> -static const struct dpu_ubwc_cfg sm6115_ubwc_cfg = {
> -	.ubwc_version = DPU_HW_UBWC_VER_10,
> -	.highest_bank_bit = 0x1,
> -	.ubwc_swizzle = 0x7,
> -};
> -
>  static const struct dpu_ubwc_cfg sm8150_ubwc_cfg = {
>  	.ubwc_version = DPU_HW_UBWC_VER_30,
>  	.highest_bank_bit = 0x2,
> @@ -538,18 +521,6 @@ static const struct dpu_mdp_cfg sc8180x_mdp[] = {
>  	},
>  };
>  
> -static const struct dpu_mdp_cfg sm6115_mdp[] = {
> -	{
> -	.name = "top_0", .id = MDP_TOP,
> -	.base = 0x0, .len = 0x494,
> -	.features = 0,
> -	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
> -		.reg_off = 0x2ac, .bit_off = 0},
> -	.clk_ctrls[DPU_CLK_CTRL_DMA0] = {
> -		.reg_off = 0x2ac, .bit_off = 8},
> -	},
> -};
> -
>  static const struct dpu_mdp_cfg sm8250_mdp[] = {
>  	{
>  	.name = "top_0", .id = MDP_TOP,
> @@ -885,13 +856,6 @@ static const struct dpu_sspp_cfg sc7180_sspp[] = {
>  static const struct dpu_sspp_sub_blks sm6115_vig_sblk_0 =
>  				_VIG_SBLK("0", 2, DPU_SSPP_SCALER_QSEED4);
>  
> -static const struct dpu_sspp_cfg sm6115_sspp[] = {
> -	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1f8, VIG_SC7180_MASK,
> -		sm6115_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
> -	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x1f8, DMA_SDM845_MASK,
> -		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
> -};
> -
>  static const struct dpu_sspp_sub_blks sm8250_vig_sblk_0 =
>  				_VIG_SBLK("0", 5, DPU_SSPP_SCALER_QSEED4);
>  static const struct dpu_sspp_sub_blks sm8250_vig_sblk_1 =
> @@ -1666,35 +1630,6 @@ static const struct dpu_perf_cfg sc7180_perf_data = {
>  	.bw_inefficiency_factor = 120,
>  };
>  
> -static const struct dpu_perf_cfg sm6115_perf_data = {
> -	.max_bw_low = 3100000,
> -	.max_bw_high = 4000000,
> -	.min_core_ib = 2400000,
> -	.min_llcc_ib = 800000,
> -	.min_dram_ib = 800000,
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
>  static const struct dpu_perf_cfg sm8150_perf_data = {
>  	.max_bw_low = 12800000,
>  	.max_bw_high = 12800000,
> @@ -1881,29 +1816,6 @@ static const struct dpu_mdss_cfg sc7180_dpu_cfg = {
>  	.mdss_irqs = IRQ_SC7180_MASK,
>  };
>  
> -static const struct dpu_mdss_cfg sm6115_dpu_cfg = {
> -	.caps = &sm6115_dpu_caps,
> -	.ubwc = &sm6115_ubwc_cfg,
> -	.mdp_count = ARRAY_SIZE(sm6115_mdp),
> -	.mdp = sm6115_mdp,
> -	.ctl_count = ARRAY_SIZE(qcm2290_ctl),
> -	.ctl = qcm2290_ctl,
> -	.sspp_count = ARRAY_SIZE(sm6115_sspp),
> -	.sspp = sm6115_sspp,
> -	.mixer_count = ARRAY_SIZE(qcm2290_lm),
> -	.mixer = qcm2290_lm,
> -	.dspp_count = ARRAY_SIZE(qcm2290_dspp),
> -	.dspp = qcm2290_dspp,
> -	.pingpong_count = ARRAY_SIZE(qcm2290_pp),
> -	.pingpong = qcm2290_pp,
> -	.intf_count = ARRAY_SIZE(qcm2290_intf),
> -	.intf = qcm2290_intf,
> -	.vbif_count = ARRAY_SIZE(sdm845_vbif),
> -	.vbif = sdm845_vbif,
> -	.perf = &sm6115_perf_data,
> -	.mdss_irqs = IRQ_SC7180_MASK,
> -};
> -
>  static const struct dpu_mdss_cfg sm8150_dpu_cfg = {
>  	.caps = &sm8150_dpu_caps,
>  	.ubwc = &sm8150_ubwc_cfg,
> @@ -2012,6 +1924,8 @@ static const struct dpu_mdss_cfg qcm2290_dpu_cfg = {
>  	.mdss_irqs = IRQ_SC7180_MASK,
>  };
>  
> +#include "catalog/dpu_6_3_sm6115.h"
> +
>  #include "catalog/dpu_7_0_sm8350.h"
>  #include "catalog/dpu_7_2_sc7280.h"
>  
