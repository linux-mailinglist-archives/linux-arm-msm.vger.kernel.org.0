Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E6907BBB36
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Oct 2023 17:06:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232615AbjJFPGA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Oct 2023 11:06:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230158AbjJFPF7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Oct 2023 11:05:59 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 964B1CA
        for <linux-arm-msm@vger.kernel.org>; Fri,  6 Oct 2023 08:05:57 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-5041335fb9cso2869690e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Oct 2023 08:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696604756; x=1697209556; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z/YM/EjNdslSL44Lb2inatDCEteQg+t3sdC+S45069w=;
        b=T7CIT9hgD+/ikJF8DAhDTvKthr0kNhE6FIFdg5ooiEaif8XCH5Gspf8q9pbSVFRDcb
         jgSI+oJv+oK3euXSEvqp06lXHCSkzoMYFJ2REGPMOK4CNJdGaijCFsXvpnZm81zC+tnD
         yjgBQaKyp6RK8gypXw76JcLaqGufNrS0j9Iw9XlBz9URGtzVz/on64d1nrRghir2rSce
         081W2TlwBjVPT8zToX6WxWGS8uYF7rmF9+Z1kpnI6PKqbXZi1HxWO5DGOeBAd40BsP9E
         VblyOogsSVDW6+M9UagJqAqWw5m6rpaDb1tXdABNfxsi5ojkfa83V6iLevcdmB161mmi
         SctQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696604756; x=1697209556;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z/YM/EjNdslSL44Lb2inatDCEteQg+t3sdC+S45069w=;
        b=epdhmC57SO+M+wLAT7i1CjOfwka1YTlYKChK8uXcPGUYaA1ZJ9A/ip1u5n33TaZ5X4
         D2bhISl5oiFBeI0fDu0wklQnONNDFOcgd69JA4WXjUMvbMbnOmIqP+Ismlm2n9r3pH6a
         NdIOfCb64tLaFmhlOh+Rvxp758/1kUCFCmL5VC+txlzUX0EbPuYCTd8I6qaNUV/gLNUl
         nOKtVCCUeW/goKjsvsKadN5OamIPPTTjc1LiSTVgi98nlDOnQBNw0c2MIrGWAsvgYWfv
         mMIdvbpsKTYaTv3zw1QqJEL/pVhGgC0vQLBOMh/J+bidnx6DYV6Dp18Zx/1GdQKsyDWN
         XuJQ==
X-Gm-Message-State: AOJu0Yy8OUK6O+SsGsJAVOm5C52RE0r49fkjUETR1+XdPlYGRJFbwk87
        jVXoAH2sQi6artrBD+re/cmESg==
X-Google-Smtp-Source: AGHT+IGCsvAMDn7onmNS2NzBO9aEF59iz+Q4fUYIdIWd/nkH9iaot3VnXscfCfjkSDuHGkqbEcTVWQ==
X-Received: by 2002:a19:9104:0:b0:503:1910:711b with SMTP id t4-20020a199104000000b005031910711bmr7188192lfd.56.1696604755711;
        Fri, 06 Oct 2023 08:05:55 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id t24-20020a056512209800b005068dab881csm49998lfr.17.2023.10.06.08.05.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Oct 2023 08:05:55 -0700 (PDT)
Message-ID: <7a786472-3a54-467a-9183-3315e217024e@linaro.org>
Date:   Fri, 6 Oct 2023 18:05:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] drm/msm/dpu: Add hw revision 4.1 (SDM670)
Content-Language: en-GB
To:     Richard Acayan <mailingradian@gmail.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Vinod Polimera <quic_vpolimer@quicinc.com>,
        Ryan McCann <quic_rmccann@quicinc.com>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Liu Shixin <liushixin2@huawei.com>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
References: <20231003012119.857198-9-mailingradian@gmail.com>
 <20231003012119.857198-14-mailingradian@gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20231003012119.857198-14-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 03/10/2023 04:21, Richard Acayan wrote:
> The Snapdragon 670 uses similar clocks (with one frequency added) to the
> Snapdragon 845 but reports DPU revision 4.1. Add support for this DPU
> with configuration from the Pixel 3a downstream kernel.
> 
> Since revision 4.0 is SDM845, reuse some configuration from its catalog
> entry.
> 
> Link: https://android.googlesource.com/kernel/msm/+/368478b0ae76566927a2769a2bf24dfe7f38bb78/arch/arm64/boot/dts/qcom/sdm670-sde.dtsi
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>   .../msm/disp/dpu1/catalog/dpu_4_1_sdm670.h    | 104 ++++++++++++++++++
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |   6 +
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   1 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   1 +
>   4 files changed, 112 insertions(+)
>   create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h
> new file mode 100644
> index 000000000000..01a9aec1c956
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h
> @@ -0,0 +1,104 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2022. Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2023, Richard Acayan. All rights reserved.
> + */
> +
> +#ifndef _DPU_4_1_SDM670_H
> +#define _DPU_4_1_SDM670_H
> +
> +static const struct dpu_mdp_cfg sdm670_mdp = {
> +	.name = "top_0",
> +	.base = 0x0, .len = 0x45c,
> +	.features = BIT(DPU_MDP_AUDIO_SELECT),
> +	.clk_ctrls = {
> +		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
> +		[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
> +		[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
> +		[DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8 },
> +		[DPU_CLK_CTRL_DMA2] = { .reg_off = 0x2bc, .bit_off = 8 },
> +	},
> +};
> +
> +static const struct dpu_sspp_cfg sdm670_sspp[] = {
> +	{
> +		.name = "sspp_0", .id = SSPP_VIG0,
> +		.base = 0x4000, .len = 0x1c8,
> +		.features = VIG_SDM845_MASK_SDMA,
> +		.sblk = &sdm670_vig_sblk_0,

Could you please rebase you patch on top of 
https://patchwork.freedesktop.org/series/119804/

That patchset removes the need for per-SoC, per-SSPP sblk structures.

I'm mostly sure that sdm670 has scaler version 1.3 (the same as sdm845), 
but you can verify this by reading the register 0x0ae05a00.

> +		.xin_id = 0,
> +		.type = SSPP_TYPE_VIG,
> +		.clk_ctrl = DPU_CLK_CTRL_VIG0,
> +	}, {
> +		.name = "sspp_1", .id = SSPP_VIG1,
> +		.base = 0x6000, .len = 0x1c8,
> +		.features = VIG_SDM845_MASK_SDMA,
> +		.sblk = &sdm670_vig_sblk_1,
> +		.xin_id = 4,
> +		.type = SSPP_TYPE_VIG,
> +		.clk_ctrl = DPU_CLK_CTRL_VIG0,
> +	}, {
> +		.name = "sspp_8", .id = SSPP_DMA0,
> +		.base = 0x24000, .len = 0x1c8,
> +		.features = DMA_SDM845_MASK_SDMA,
> +		.sblk = &sdm845_dma_sblk_0,
> +		.xin_id = 1,
> +		.type = SSPP_TYPE_DMA,
> +		.clk_ctrl = DPU_CLK_CTRL_DMA0,
> +	}, {
> +		.name = "sspp_9", .id = SSPP_DMA1,
> +		.base = 0x26000, .len = 0x1c8,
> +		.features = DMA_CURSOR_SDM845_MASK_SDMA,
> +		.sblk = &sdm845_dma_sblk_1,
> +		.xin_id = 5,
> +		.type = SSPP_TYPE_DMA,
> +		.clk_ctrl = DPU_CLK_CTRL_DMA1,
> +	}, {
> +		.name = "sspp_10", .id = SSPP_DMA2,
> +		.base = 0x28000, .len = 0x1c8,
> +		.features = DMA_CURSOR_SDM845_MASK_SDMA,
> +		.sblk = &sdm845_dma_sblk_2,
> +		.xin_id = 9,
> +		.type = SSPP_TYPE_DMA,
> +		.clk_ctrl = DPU_CLK_CTRL_DMA2,
> +	},
> +};
> +
> +static const struct dpu_dsc_cfg sdm670_dsc[] = {
> +	{
> +		.name = "dsc_0", .id = DSC_0,
> +		.base = 0x80000, .len = 0x140,
> +	}, {
> +		.name = "dsc_1", .id = DSC_1,
> +		.base = 0x80400, .len = 0x140,
> +	},
> +};
> +
> +static const struct dpu_mdss_version sdm670_mdss_ver = {
> +	.core_major_ver = 4,
> +	.core_minor_ver = 1,
> +};
> +
> +const struct dpu_mdss_cfg dpu_sdm670_cfg = {
> +	.mdss_ver = &sdm670_mdss_ver,
> +	.caps = &sdm845_dpu_caps,
> +	.mdp = &sdm670_mdp,
> +	.ctl_count = ARRAY_SIZE(sdm845_ctl),
> +	.ctl = sdm845_ctl,
> +	.sspp_count = ARRAY_SIZE(sdm670_sspp),
> +	.sspp = sdm670_sspp,
> +	.mixer_count = ARRAY_SIZE(sdm845_lm),
> +	.mixer = sdm845_lm,
> +	.pingpong_count = ARRAY_SIZE(sdm845_pp),
> +	.pingpong = sdm845_pp,
> +	.dsc_count = ARRAY_SIZE(sdm670_dsc),
> +	.dsc = sdm670_dsc,
> +	.intf_count = ARRAY_SIZE(sdm845_intf),
> +	.intf = sdm845_intf,
> +	.vbif_count = ARRAY_SIZE(sdm845_vbif),

We were duplicating the data for different platforms, even if they 
looked similar, it was not obvious what is the actual level of 
similarity. Nevertheless, for the sdm670 / sdm845 pair I think this 
looks good. Especially since we do not expect other DPU 4.x platforms.

> +	.vbif = sdm845_vbif,
> +	.perf = &sdm845_perf_data,
> +};
> +
> +#endif
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 713dfc079718..63b274ae032a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -313,6 +313,11 @@ static const struct dpu_rotation_cfg dpu_rot_sc7280_cfg_v2 = {
>   	.rot_format_list = rotation_v2_formats,
>   };
>   
> +static const struct dpu_sspp_sub_blks sdm670_vig_sblk_0 =
> +				_VIG_SBLK(4, DPU_SSPP_SCALER_QSEED3);
> +static const struct dpu_sspp_sub_blks sdm670_vig_sblk_1 =
> +				_VIG_SBLK(5, DPU_SSPP_SCALER_QSEED3);
> +
>   static const struct dpu_sspp_sub_blks sdm845_vig_sblk_0 =
>   				_VIG_SBLK(5, DPU_SSPP_SCALER_QSEED3);
>   static const struct dpu_sspp_sub_blks sdm845_vig_sblk_1 =
> @@ -655,6 +660,7 @@ static const struct dpu_qos_lut_entry sc7180_qos_nrt[] = {
>   #include "catalog/dpu_3_0_msm8998.h"
>   
>   #include "catalog/dpu_4_0_sdm845.h"
> +#include "catalog/dpu_4_1_sdm670.h"
>   
>   #include "catalog/dpu_5_0_sm8150.h"
>   #include "catalog/dpu_5_1_sc8180x.h"
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 6c9634209e9f..dae5a1555e44 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -831,6 +831,7 @@ struct dpu_mdss_cfg {
>   
>   extern const struct dpu_mdss_cfg dpu_msm8998_cfg;
>   extern const struct dpu_mdss_cfg dpu_sdm845_cfg;
> +extern const struct dpu_mdss_cfg dpu_sdm670_cfg;
>   extern const struct dpu_mdss_cfg dpu_sm8150_cfg;
>   extern const struct dpu_mdss_cfg dpu_sc8180x_cfg;
>   extern const struct dpu_mdss_cfg dpu_sm8250_cfg;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index aa6ba2cf4b84..0049fb1de1e8 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -1362,6 +1362,7 @@ static const struct dev_pm_ops dpu_pm_ops = {
>   static const struct of_device_id dpu_dt_match[] = {
>   	{ .compatible = "qcom,msm8998-dpu", .data = &dpu_msm8998_cfg, },
>   	{ .compatible = "qcom,qcm2290-dpu", .data = &dpu_qcm2290_cfg, },
> +	{ .compatible = "qcom,sdm670-dpu", .data = &dpu_sdm670_cfg, },
>   	{ .compatible = "qcom,sdm845-dpu", .data = &dpu_sdm845_cfg, },
>   	{ .compatible = "qcom,sc7180-dpu", .data = &dpu_sc7180_cfg, },
>   	{ .compatible = "qcom,sc7280-dpu", .data = &dpu_sc7280_cfg, },

-- 
With best wishes
Dmitry

