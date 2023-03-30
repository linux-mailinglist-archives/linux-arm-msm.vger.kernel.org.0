Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F15A36D056B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Mar 2023 14:55:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231431AbjC3MzU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Mar 2023 08:55:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230019AbjC3MzS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Mar 2023 08:55:18 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7B449774
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 05:55:10 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id k37so24435346lfv.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 05:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680180909;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xs3QmN8T8iW9r/5NmYaxFT5YWIUQmUcwiR9Ua3jh+zQ=;
        b=YTR0UA8CQ3uPyewVZBsvvkKFJJAyLK7MleuMH1K71qQTJUAbKGpt+40RaIFwMElzyF
         E8SWFxavRDsOz1yUwdx2KYG7YoK89di1TQrAaTR9a7LpkXPyuAlkJM8L8pngnbJUklhJ
         oZkWuKgtD6KtzXKt5q5I+UHvKg9k+O2K9FtjWIQo4l5tlaHOilFpBMTT8Mg6XhbFep8f
         kh+Lw/Da5vnH4sIKBmakp6Q3fkHKR2l9JjhJ+7DQzWyjs7JBbU8kboEl/NFJRutOHFm6
         ehJjmVE5hL4gDkrhik9mFO6h09aoVPnrgRSZMjWbRs+mMfIkwV0Q8qpVVjw2BPLe3vLF
         xsxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680180909;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xs3QmN8T8iW9r/5NmYaxFT5YWIUQmUcwiR9Ua3jh+zQ=;
        b=S2MwaLxl9sJ4MUk6JTq33vun3mZML3Dw1OQMqz9infeZXpMt4Xb+Z1JAXwpb+0NAHb
         5FbhA6xm6t7GGVvytgWTCYD2M34alk8O5LJCG86+J3jf79SBWtnrYeaRgvQr8htiw2Al
         HLQckXKZOoUGih2hS1MTHZrPeiF6OJl5i4sgLyocBWzV5fGQoGghutOuKPKIGplc0Bnb
         iqf4talQGqGOWSFY0a31iSAv8SlHtAkm2aYX/yloh5AvXEChVKoFsjEXkUiT0lXLFs+v
         6QSG0uLPr0cxrur7og0fSH/mNF9m2KqfY51CatfwMkcZFbbxhqzaRypSO6i0bmwjOFO1
         JW4Q==
X-Gm-Message-State: AAQBX9dqoRo+WN7n5mfoeVePUT4l2xt6p1+kWV1MjhdbRkdHw1y+aWK5
        /RA6V7Gv1n4EpfMJ7zbpcvXmww==
X-Google-Smtp-Source: AKy350ZzCNYzjCfnZmWAwG7fhNIJ1q1IEqBUCCf2ZBmkFyW21wuMQQc+1Nx5g4qh7iprmhW3kjrLmg==
X-Received: by 2002:a19:ca4a:0:b0:4d8:86c1:4771 with SMTP id h10-20020a19ca4a000000b004d886c14771mr1681091lfj.6.1680180908990;
        Thu, 30 Mar 2023 05:55:08 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
        by smtp.gmail.com with ESMTPSA id z18-20020ac24192000000b004e81c9bb65csm5842664lfh.282.2023.03.30.05.55.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Mar 2023 05:55:08 -0700 (PDT)
Message-ID: <33db544d-0084-262a-787c-ac322b7918ad@linaro.org>
Date:   Thu, 30 Mar 2023 14:55:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [v2,41/50] drm/msm/dpu: deduplicate sc8180x with sm8150
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
References: <20230211231259.1308718-42-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230211231259.1308718-42-dmitry.baryshkov@linaro.org>
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
> Remove duplicate between sc8180x and sm8150, which belong to the same
> DPU major revision. The merged file is named using the DPU major version
> and the amount of LM units.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Rebase

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    | 172 ++----------------
>  .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   |  61 ++-----
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_lm6.h | 152 ++++++++++++++++
>  3 files changed, 184 insertions(+), 201 deletions(-)
>  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_lm6.h
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> index f7c79474133a..33303040fbd0 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> @@ -7,153 +7,13 @@
>  #ifndef _DPU_5_0_SM8150_H
>  #define _DPU_5_0_SM8150_H
>  
> -static const struct dpu_caps sm8150_dpu_caps = {
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
> +#include "dpu_5_lm6.h"
>  
>  static const struct dpu_ubwc_cfg sm8150_ubwc_cfg = {
>  	.ubwc_version = DPU_HW_UBWC_VER_30,
>  	.highest_bank_bit = 0x2,
>  };
>  
> -static const struct dpu_mdp_cfg sm8150_mdp[] = {
> -	{
> -	.name = "top_0", .id = MDP_TOP,
> -	.base = 0x0, .len = 0x45c,
> -	.features = BIT(DPU_MDP_AUDIO_SELECT),
> -	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
> -	.clk_ctrls[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
> -	.clk_ctrls[DPU_CLK_CTRL_VIG2] = { .reg_off = 0x2bc, .bit_off = 0 },
> -	.clk_ctrls[DPU_CLK_CTRL_VIG3] = { .reg_off = 0x2c4, .bit_off = 0 },
> -	.clk_ctrls[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
> -	.clk_ctrls[DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8 },
> -	.clk_ctrls[DPU_CLK_CTRL_DMA2] = { .reg_off = 0x2bc, .bit_off = 8 },
> -	.clk_ctrls[DPU_CLK_CTRL_DMA3] = { .reg_off = 0x2c4, .bit_off = 8 },
> -	},
> -};
> -
> -static const struct dpu_ctl_cfg sm8150_ctl[] = {
> -	{
> -	.name = "ctl_0", .id = CTL_0,
> -	.base = 0x1000, .len = 0x1e0,
> -	.features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_SPLIT_DISPLAY),
> -	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
> -	},
> -	{
> -	.name = "ctl_1", .id = CTL_1,
> -	.base = 0x1200, .len = 0x1e0,
> -	.features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_SPLIT_DISPLAY),
> -	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
> -	},
> -	{
> -	.name = "ctl_2", .id = CTL_2,
> -	.base = 0x1400, .len = 0x1e0,
> -	.features = BIT(DPU_CTL_ACTIVE_CFG),
> -	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
> -	},
> -	{
> -	.name = "ctl_3", .id = CTL_3,
> -	.base = 0x1600, .len = 0x1e0,
> -	.features = BIT(DPU_CTL_ACTIVE_CFG),
> -	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
> -	},
> -	{
> -	.name = "ctl_4", .id = CTL_4,
> -	.base = 0x1800, .len = 0x1e0,
> -	.features = BIT(DPU_CTL_ACTIVE_CFG),
> -	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
> -	},
> -	{
> -	.name = "ctl_5", .id = CTL_5,
> -	.base = 0x1a00, .len = 0x1e0,
> -	.features = BIT(DPU_CTL_ACTIVE_CFG),
> -	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
> -	},
> -};
> -
> -static const struct dpu_sspp_cfg sm8150_sspp[] = {
> -	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1f0, VIG_SDM845_MASK,
> -		sdm845_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
> -	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, 0x1f0, VIG_SDM845_MASK,
> -		sdm845_vig_sblk_1, 4, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
> -	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, 0x1f0, VIG_SDM845_MASK,
> -		sdm845_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
> -	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, 0x1f0, VIG_SDM845_MASK,
> -		sdm845_vig_sblk_3, 12, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
> -	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x1f0, DMA_SDM845_MASK,
> -		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
> -	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x1f0, DMA_SDM845_MASK,
> -		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
> -	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x1f0, DMA_CURSOR_SDM845_MASK,
> -		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
> -	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000, 0x1f0, DMA_CURSOR_SDM845_MASK,
> -		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
> -};
> -
> -static const struct dpu_lm_cfg sm8150_lm[] = {
> -	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK,
> -		&sdm845_lm_sblk, PINGPONG_0, LM_1, DSPP_0),
> -	LM_BLK("lm_1", LM_1, 0x45000, MIXER_SDM845_MASK,
> -		&sdm845_lm_sblk, PINGPONG_1, LM_0, DSPP_1),
> -	LM_BLK("lm_2", LM_2, 0x46000, MIXER_SDM845_MASK,
> -		&sdm845_lm_sblk, PINGPONG_2, LM_3, 0),
> -	LM_BLK("lm_3", LM_3, 0x47000, MIXER_SDM845_MASK,
> -		&sdm845_lm_sblk, PINGPONG_3, LM_2, 0),
> -	LM_BLK("lm_4", LM_4, 0x48000, MIXER_SDM845_MASK,
> -		&sdm845_lm_sblk, PINGPONG_4, LM_5, 0),
> -	LM_BLK("lm_5", LM_5, 0x49000, MIXER_SDM845_MASK,
> -		&sdm845_lm_sblk, PINGPONG_5, LM_4, 0),
> -};
> -
> -static const struct dpu_dspp_cfg sm8150_dspp[] = {
> -	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
> -		 &sm8150_dspp_sblk),
> -	DSPP_BLK("dspp_1", DSPP_1, 0x56000, DSPP_SC7180_MASK,
> -		 &sm8150_dspp_sblk),
> -	DSPP_BLK("dspp_2", DSPP_2, 0x58000, DSPP_SC7180_MASK,
> -		 &sm8150_dspp_sblk),
> -	DSPP_BLK("dspp_3", DSPP_3, 0x5a000, DSPP_SC7180_MASK,
> -		 &sm8150_dspp_sblk),
> -};
> -
> -static const struct dpu_pingpong_cfg sm8150_pp[] = {
> -	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x70000, MERGE_3D_0, sdm845_pp_sblk_te,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12)),
> -	PP_BLK_TE("pingpong_1", PINGPONG_1, 0x70800, MERGE_3D_0, sdm845_pp_sblk_te,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13)),
> -	PP_BLK("pingpong_2", PINGPONG_2, 0x71000, MERGE_3D_1, sdm845_pp_sblk,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 14)),
> -	PP_BLK("pingpong_3", PINGPONG_3, 0x71800, MERGE_3D_1, sdm845_pp_sblk,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 15)),
> -	PP_BLK("pingpong_4", PINGPONG_4, 0x72000, MERGE_3D_2, sdm845_pp_sblk,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
> -			-1),
> -	PP_BLK("pingpong_5", PINGPONG_5, 0x72800, MERGE_3D_2, sdm845_pp_sblk,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
> -			-1),
> -};
> -
> -static const struct dpu_merge_3d_cfg sm8150_merge_3d[] = {
> -	MERGE_3D_BLK("merge_3d_0", MERGE_3D_0, 0x83000),
> -	MERGE_3D_BLK("merge_3d_1", MERGE_3D_1, 0x83100),
> -	MERGE_3D_BLK("merge_3d_2", MERGE_3D_2, 0x83200),
> -};
> -
>  static const struct dpu_dsc_cfg sm8150_dsc[] = {
>  	DSC_BLK("dsc_0", DSC_0, 0x80000, BIT(DPU_DSC_OUTPUT_CTRL)),
>  	DSC_BLK("dsc_1", DSC_1, 0x80400, BIT(DPU_DSC_OUTPUT_CTRL)),
> @@ -198,24 +58,24 @@ static const struct dpu_perf_cfg sm8150_perf_data = {
>  };
>  
>  static const struct dpu_mdss_cfg sm8150_dpu_cfg = {
> -	.caps = &sm8150_dpu_caps,
> +	.caps = &dpu_5_lm6_dpu_caps,
>  	.ubwc = &sm8150_ubwc_cfg,
> -	.mdp_count = ARRAY_SIZE(sm8150_mdp),
> -	.mdp = sm8150_mdp,
> -	.ctl_count = ARRAY_SIZE(sm8150_ctl),
> -	.ctl = sm8150_ctl,
> -	.sspp_count = ARRAY_SIZE(sm8150_sspp),
> -	.sspp = sm8150_sspp,
> -	.mixer_count = ARRAY_SIZE(sm8150_lm),
> -	.mixer = sm8150_lm,
> -	.dspp_count = ARRAY_SIZE(sm8150_dspp),
> -	.dspp = sm8150_dspp,
> +	.mdp_count = ARRAY_SIZE(dpu_5_lm6_mdp),
> +	.mdp = dpu_5_lm6_mdp,
> +	.ctl_count = ARRAY_SIZE(dpu_5_lm6_ctl),
> +	.ctl = dpu_5_lm6_ctl,
> +	.sspp_count = ARRAY_SIZE(dpu_5_lm6_sspp),
> +	.sspp = dpu_5_lm6_sspp,
> +	.mixer_count = ARRAY_SIZE(dpu_5_lm6_lm),
> +	.mixer = dpu_5_lm6_lm,
> +	.dspp_count = ARRAY_SIZE(dpu_5_lm6_dspp),
> +	.dspp = dpu_5_lm6_dspp,
>  	.dsc_count = ARRAY_SIZE(sm8150_dsc),
>  	.dsc = sm8150_dsc,
> -	.pingpong_count = ARRAY_SIZE(sm8150_pp),
> -	.pingpong = sm8150_pp,
> -	.merge_3d_count = ARRAY_SIZE(sm8150_merge_3d),
> -	.merge_3d = sm8150_merge_3d,
> +	.pingpong_count = ARRAY_SIZE(dpu_5_lm6_pp),
> +	.pingpong = dpu_5_lm6_pp,
> +	.merge_3d_count = ARRAY_SIZE(dpu_5_lm6_merge_3d),
> +	.merge_3d = dpu_5_lm6_merge_3d,
>  	.intf_count = ARRAY_SIZE(sm8150_intf),
>  	.intf = sm8150_intf,
>  	.vbif_count = ARRAY_SIZE(sdm845_vbif),
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> index 457733a6986e..48185e3dc873 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> @@ -7,42 +7,13 @@
>  #ifndef _DPU_5_1_SC8180X_H
>  #define _DPU_5_1_SC8180X_H
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
> +#include "dpu_5_lm6.h"
>  
>  static const struct dpu_ubwc_cfg sc8180x_ubwc_cfg = {
>  	.ubwc_version = DPU_HW_UBWC_VER_30,
>  	.highest_bank_bit = 0x3,
>  };
>  
> -static const struct dpu_mdp_cfg sc8180x_mdp[] = {
> -	{
> -	.name = "top_0", .id = MDP_TOP,
> -	.base = 0x0, .len = 0x45c,
> -	.features = BIT(DPU_MDP_AUDIO_SELECT),
> -	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
> -	.clk_ctrls[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
> -	.clk_ctrls[DPU_CLK_CTRL_VIG2] = { .reg_off = 0x2bc, .bit_off = 0 },
> -	.clk_ctrls[DPU_CLK_CTRL_VIG3] = { .reg_off = 0x2c4, .bit_off = 0 },
> -	.clk_ctrls[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
> -	.clk_ctrls[DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8 },
> -	.clk_ctrls[DPU_CLK_CTRL_DMA2] = { .reg_off = 0x2bc, .bit_off = 8 },
> -	.clk_ctrls[DPU_CLK_CTRL_DMA3] = { .reg_off = 0x2c4, .bit_off = 8 },
> -	},
> -};
> -
>  static const struct dpu_intf_cfg sc8180x_intf[] = {
>  	INTF_BLK("intf_0", INTF_0, 0x6a000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
>  	INTF_BLK("intf_1", INTF_1, 0x6a800, 0x280, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> @@ -81,22 +52,22 @@ static const struct dpu_perf_cfg sc8180x_perf_data = {
>  };
>  
>  static const struct dpu_mdss_cfg sc8180x_dpu_cfg = {
> -	.caps = &sc8180x_dpu_caps,
> +	.caps = &dpu_5_lm6_dpu_caps,
>  	.ubwc = &sc8180x_ubwc_cfg,
> -	.mdp_count = ARRAY_SIZE(sc8180x_mdp),
> -	.mdp = sc8180x_mdp,
> -	.ctl_count = ARRAY_SIZE(sm8150_ctl),
> -	.ctl = sm8150_ctl,
> -	.sspp_count = ARRAY_SIZE(sm8150_sspp),
> -	.sspp = sm8150_sspp,
> -	.mixer_count = ARRAY_SIZE(sm8150_lm),
> -	.mixer = sm8150_lm,
> -	.dspp_count = ARRAY_SIZE(sm8150_dspp),
> -	.dspp = sm8150_dspp,
> -	.pingpong_count = ARRAY_SIZE(sm8150_pp),
> -	.pingpong = sm8150_pp,
> -	.merge_3d_count = ARRAY_SIZE(sm8150_merge_3d),
> -	.merge_3d = sm8150_merge_3d,
> +	.mdp_count = ARRAY_SIZE(dpu_5_lm6_mdp),
> +	.mdp = dpu_5_lm6_mdp,
> +	.ctl_count = ARRAY_SIZE(dpu_5_lm6_ctl),
> +	.ctl = dpu_5_lm6_ctl,
> +	.sspp_count = ARRAY_SIZE(dpu_5_lm6_sspp),
> +	.sspp = dpu_5_lm6_sspp,
> +	.mixer_count = ARRAY_SIZE(dpu_5_lm6_lm),
> +	.mixer = dpu_5_lm6_lm,
> +	.dspp_count = ARRAY_SIZE(dpu_5_lm6_dspp),
> +	.dspp = dpu_5_lm6_dspp,
> +	.pingpong_count = ARRAY_SIZE(dpu_5_lm6_pp),
> +	.pingpong = dpu_5_lm6_pp,
> +	.merge_3d_count = ARRAY_SIZE(dpu_5_lm6_merge_3d),
> +	.merge_3d = dpu_5_lm6_merge_3d,
>  	.intf_count = ARRAY_SIZE(sc8180x_intf),
>  	.intf = sc8180x_intf,
>  	.vbif_count = ARRAY_SIZE(sdm845_vbif),
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_lm6.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_lm6.h
> new file mode 100644
> index 000000000000..294702531ce2
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_lm6.h
> @@ -0,0 +1,152 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2022. Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2015-2018, 2020 The Linux Foundation. All rights reserved.
> + */
> +
> +#ifndef _DPU_5_LM6_H
> +#define _DPU_5_LM6_H
> +
> +static const struct dpu_caps dpu_5_lm6_dpu_caps = {
> +	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
> +	.max_mixer_blendstages = 0xb,
> +	.qseed_type = DPU_SSPP_SCALER_QSEED3,
> +	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
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
> +static const struct dpu_mdp_cfg dpu_5_lm6_mdp[] = {
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
> +static const struct dpu_ctl_cfg dpu_5_lm6_ctl[] = {
> +	{
> +	.name = "ctl_0", .id = CTL_0,
> +	.base = 0x1000, .len = 0x1e0,
> +	.features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_SPLIT_DISPLAY),
> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
> +	},
> +	{
> +	.name = "ctl_1", .id = CTL_1,
> +	.base = 0x1200, .len = 0x1e0,
> +	.features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_SPLIT_DISPLAY),
> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
> +	},
> +	{
> +	.name = "ctl_2", .id = CTL_2,
> +	.base = 0x1400, .len = 0x1e0,
> +	.features = BIT(DPU_CTL_ACTIVE_CFG),
> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
> +	},
> +	{
> +	.name = "ctl_3", .id = CTL_3,
> +	.base = 0x1600, .len = 0x1e0,
> +	.features = BIT(DPU_CTL_ACTIVE_CFG),
> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
> +	},
> +	{
> +	.name = "ctl_4", .id = CTL_4,
> +	.base = 0x1800, .len = 0x1e0,
> +	.features = BIT(DPU_CTL_ACTIVE_CFG),
> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
> +	},
> +	{
> +	.name = "ctl_5", .id = CTL_5,
> +	.base = 0x1a00, .len = 0x1e0,
> +	.features = BIT(DPU_CTL_ACTIVE_CFG),
> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
> +	},
> +};
> +
> +static const struct dpu_sspp_cfg dpu_5_lm6_sspp[] = {
> +	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1f0, VIG_SDM845_MASK,
> +		sdm845_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
> +	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, 0x1f0, VIG_SDM845_MASK,
> +		sdm845_vig_sblk_1, 4, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
> +	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, 0x1f0, VIG_SDM845_MASK,
> +		sdm845_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
> +	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, 0x1f0, VIG_SDM845_MASK,
> +		sdm845_vig_sblk_3, 12, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
> +	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x1f0, DMA_SDM845_MASK,
> +		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
> +	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x1f0, DMA_SDM845_MASK,
> +		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
> +	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x1f0, DMA_CURSOR_SDM845_MASK,
> +		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
> +	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000, 0x1f0, DMA_CURSOR_SDM845_MASK,
> +		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
> +};
> +
> +static const struct dpu_lm_cfg dpu_5_lm6_lm[] = {
> +	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK,
> +		&sdm845_lm_sblk, PINGPONG_0, LM_1, DSPP_0),
> +	LM_BLK("lm_1", LM_1, 0x45000, MIXER_SDM845_MASK,
> +		&sdm845_lm_sblk, PINGPONG_1, LM_0, DSPP_1),
> +	LM_BLK("lm_2", LM_2, 0x46000, MIXER_SDM845_MASK,
> +		&sdm845_lm_sblk, PINGPONG_2, LM_3, 0),
> +	LM_BLK("lm_3", LM_3, 0x47000, MIXER_SDM845_MASK,
> +		&sdm845_lm_sblk, PINGPONG_3, LM_2, 0),
> +	LM_BLK("lm_4", LM_4, 0x48000, MIXER_SDM845_MASK,
> +		&sdm845_lm_sblk, PINGPONG_4, LM_5, 0),
> +	LM_BLK("lm_5", LM_5, 0x49000, MIXER_SDM845_MASK,
> +		&sdm845_lm_sblk, PINGPONG_5, LM_4, 0),
> +};
> +
> +static const struct dpu_dspp_cfg dpu_5_lm6_dspp[] = {
> +	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
> +		 &sm8150_dspp_sblk),
> +	DSPP_BLK("dspp_1", DSPP_1, 0x56000, DSPP_SC7180_MASK,
> +		 &sm8150_dspp_sblk),
> +	DSPP_BLK("dspp_2", DSPP_2, 0x58000, DSPP_SC7180_MASK,
> +		 &sm8150_dspp_sblk),
> +	DSPP_BLK("dspp_3", DSPP_3, 0x5a000, DSPP_SC7180_MASK,
> +		 &sm8150_dspp_sblk),
> +};
> +
> +static const struct dpu_pingpong_cfg dpu_5_lm6_pp[] = {
> +	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x70000, MERGE_3D_0, sdm845_pp_sblk_te,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12)),
> +	PP_BLK_TE("pingpong_1", PINGPONG_1, 0x70800, MERGE_3D_0, sdm845_pp_sblk_te,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13)),
> +	PP_BLK("pingpong_2", PINGPONG_2, 0x71000, MERGE_3D_1, sdm845_pp_sblk,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 14)),
> +	PP_BLK("pingpong_3", PINGPONG_3, 0x71800, MERGE_3D_1, sdm845_pp_sblk,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 15)),
> +	PP_BLK("pingpong_4", PINGPONG_4, 0x72000, MERGE_3D_2, sdm845_pp_sblk,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
> +			-1),
> +	PP_BLK("pingpong_5", PINGPONG_5, 0x72800, MERGE_3D_2, sdm845_pp_sblk,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
> +			-1),
> +};
> +
> +static const struct dpu_merge_3d_cfg dpu_5_lm6_merge_3d[] = {
> +	MERGE_3D_BLK("merge_3d_0", MERGE_3D_0, 0x83000),
> +	MERGE_3D_BLK("merge_3d_1", MERGE_3D_1, 0x83100),
> +	MERGE_3D_BLK("merge_3d_2", MERGE_3D_2, 0x83200),
> +};
> +
> +#endif
