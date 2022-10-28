Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 399A161114E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Oct 2022 14:27:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229647AbiJ1M1E (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Oct 2022 08:27:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229556AbiJ1M1D (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Oct 2022 08:27:03 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 707301D3EA8
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Oct 2022 05:27:01 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id g12so8047186lfh.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Oct 2022 05:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pKlT2zzFOtgFxJ4YhfqAga01fUD346OfB/D8zebdAto=;
        b=QOvGHwXFBrIGLeJ79NOvROKBOPrQFa24GgLJoz5sEC+IokUqcv2qoMdoTcQciUoK7e
         RH1ddbx6DYCQKOE+1WNgAVVy378IOF4PGToK5PKmqT/YuR98OrK35x22V32rhn0KFOPi
         D3VJkmVC6Cu3b0mt41vw2+37DyuzIHbxz68L/86J4ngvZCOflbTbtUe0CG3zHn3uHXkG
         c3FWN5kr8/mWds8Sopo69SBRzHqaV2BSmDuuXVNBKT1llKabqXwBDns5pXZbfE75tlqT
         cZ+T48bMbQ+70s8WVa/WOCSIOySEJzxwp3+nv7v1KMUFZAu1x7BvikUYxLrYvmq2OfPK
         FQ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pKlT2zzFOtgFxJ4YhfqAga01fUD346OfB/D8zebdAto=;
        b=oX/1/JR4qs0kio/ZYUXRj9b5t2X9TvYuajqBbwZOa+tvc561E00AW7hbsysHX5JGMQ
         19GuIRLd53OUHwnJiyN/Y9I7lqbnxGMMarFJU3u5F9/O7qfuumzAA+J7PaoLZW+EiX9b
         vLEqb5emtOuKuXEM6DdWY2PIwOtky5fygbiAUlN/LEN0ppfQM2kz8VvzBzKo/uRwnZFp
         Q9UmlSexi6XfB8lGBImnHRHUYD8ksqkHQCZvGattcIHuji0l4vBcOCCO4kzlQRTQhlgv
         bn1QX3WqWBZIArNdnyTxfWMfD4G8hwAYeAeyEvUqG+xpxaZ02YPyMfq14BaHm3zPi9K1
         g7FA==
X-Gm-Message-State: ACrzQf0wVg/upLh4uopKqj7GVvO0LLcVKTI6Hbqe/gtI0D6RBiGJqdeA
        dGKHevt2t1xC20IlLzi1/D4zcw==
X-Google-Smtp-Source: AMsMyM5NfpYOLBUNvaiR18n9Kv+L8pW14eelJHSU1WEJcdD9ITZ1bHnjs9tKCiBVyFKhZ7F7TEyPHA==
X-Received: by 2002:a05:6512:6ce:b0:4a2:530a:33d0 with SMTP id u14-20020a05651206ce00b004a2530a33d0mr21221494lff.270.1666960019674;
        Fri, 28 Oct 2022 05:26:59 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id o20-20020a05651205d400b004979e1ff641sm544371lfo.115.2022.10.28.05.26.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Oct 2022 05:26:59 -0700 (PDT)
Message-ID: <f09429f2-0b21-7f8a-ad64-e51af056ea08@linaro.org>
Date:   Fri, 28 Oct 2022 15:26:58 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v1 3/9] drm/msm/dpu: Add SM8350 to hw catalog
Content-Language: en-GB
To:     Robert Foss <robert.foss@linaro.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, konrad.dybcio@somainline.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run,
        airlied@linux.ie, daniel@ffwll.ch, quic_kalyant@quicinc.com,
        swboyd@chromium.org, angelogioacchino.delregno@somainline.org,
        loic.poulain@linaro.org, quic_vpolimer@quicinc.com,
        vkoul@kernel.org, dianders@chromium.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Jonathan Marek <jonathan@marek.ca>, vinod.koul@linaro.org,
        quic_jesszhan@quicinc.com
References: <20221028120812.339100-1-robert.foss@linaro.org>
 <20221028120812.339100-4-robert.foss@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221028120812.339100-4-robert.foss@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 28/10/2022 15:08, Robert Foss wrote:
> Add compatibility for SM8350 display subsystem, including
> required entries in DPU hw catalog.
> ---
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 217 ++++++++++++++++++
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   1 +
>   2 files changed, 218 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index d0ce7612fee8..bc829d7bdd6e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -112,6 +112,15 @@
>   			 BIT(MDP_INTF3_INTR) | \
>   			 BIT(MDP_INTF4_INTR))
>   
> +#define IRQ_SM8350_MASK (BIT(MDP_SSPP_TOP0_INTR) | \
> +			 BIT(MDP_SSPP_TOP0_INTR2) | \
> +			 BIT(MDP_SSPP_TOP0_HIST_INTR) | \
> +			 BIT(MDP_INTF0_7xxx_INTR) | \
> +			 BIT(MDP_INTF1_7xxx_INTR) | \
> +			 BIT(MDP_INTF2_7xxx_INTR) | \
> +			 BIT(MDP_INTF3_7xxx_INTR) | \
> +			 0)
> +
>   #define IRQ_SC8180X_MASK (BIT(MDP_SSPP_TOP0_INTR) | \
>   			  BIT(MDP_SSPP_TOP0_INTR2) | \
>   			  BIT(MDP_SSPP_TOP0_HIST_INTR) | \
> @@ -364,6 +373,20 @@ static const struct dpu_caps sm8250_dpu_caps = {
>   	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>   };
>   
> +static const struct dpu_caps sm8350_dpu_caps = {
> +	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
> +	.max_mixer_blendstages = 0xb,
> +	.qseed_type = DPU_SSPP_SCALER_QSEED3LITE,
> +	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
> +	.ubwc_version = DPU_HW_UBWC_VER_40,
> +	.has_src_split = true,
> +	.has_dim_layer = true,
> +	.has_idle_pc = true,
> +	.has_3d_merge = true,
> +	.max_linewidth = 4096,

Is it 4096 or 5120?

> +	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
> +};
> +
>   static const struct dpu_caps sc7280_dpu_caps = {
>   	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
>   	.max_mixer_blendstages = 0x7,
> @@ -501,6 +524,33 @@ static const struct dpu_mdp_cfg sm8250_mdp[] = {
>   	},
>   };
>   
> +static const struct dpu_mdp_cfg sm8350_mdp[] = {
> +	{
> +	.name = "top_0", .id = MDP_TOP,
> +	.base = 0x0, .len = 0x494,
> +	.features = 0,
> +	.highest_bank_bit = 0x3, /* TODO: 2 for LP_DDR4 */
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
> +	.clk_ctrls[DPU_CLK_CTRL_REG_DMA] = {
> +			.reg_off = 0x2BC, .bit_off = 20},
> +	},
> +};
> +
>   static const struct dpu_mdp_cfg sc7280_mdp[] = {
>   	{
>   	.name = "top_0", .id = MDP_TOP,
> @@ -659,6 +709,66 @@ static const struct dpu_ctl_cfg sm8150_ctl[] = {
>   	},
>   };
>   
> +static const struct dpu_ctl_cfg sm8350_ctl[] = {
> +	{
> +	.name = "ctl_0", .id = CTL_0,
> +	.base = 0x15000, .len = 0x1e8,
> +	.features = BIT(DPU_CTL_SPLIT_DISPLAY) |
> +		    BIT(DPU_CTL_PINGPONG_SPLIT) |
> +		    BIT(DPU_CTL_ACTIVE_CFG) |
> +		    BIT(DPU_CTL_FETCH_ACTIVE) |
> +		    BIT(DPU_CTL_VM_CFG) |
> +		    BIT(DPU_CTL_UNIFIED_DSPP_FLUSH),
> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
> +	},
> +	{
> +	.name = "ctl_1", .id = CTL_1,
> +	.base = 0x16000, .len = 0x1e8,
> +	.features = BIT(DPU_CTL_SPLIT_DISPLAY) |
> +		    BIT(DPU_CTL_ACTIVE_CFG) |
> +		    BIT(DPU_CTL_FETCH_ACTIVE) |
> +		    BIT(DPU_CTL_VM_CFG) |
> +		    BIT(DPU_CTL_UNIFIED_DSPP_FLUSH),

The UNIFIED_DSPP_FLUSH is not merged. Could you please change this to 
BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK (for first two CTLs) and 
just CTL_SC7280_MASK for the rest of them?

> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
> +	},
> +	{
> +	.name = "ctl_2", .id = CTL_2,
> +	.base = 0x17000, .len = 0x1e8,
> +	.features = BIT(DPU_CTL_ACTIVE_CFG) |
> +		    BIT(DPU_CTL_FETCH_ACTIVE) |
> +		    BIT(DPU_CTL_VM_CFG) |
> +		    BIT(DPU_CTL_UNIFIED_DSPP_FLUSH),
> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
> +	},
> +	{
> +	.name = "ctl_3", .id = CTL_3,
> +	.base = 0x18000, .len = 0x1e8,
> +	.features = BIT(DPU_CTL_ACTIVE_CFG) |
> +		    BIT(DPU_CTL_FETCH_ACTIVE) |
> +		    BIT(DPU_CTL_VM_CFG) |
> +		    BIT(DPU_CTL_UNIFIED_DSPP_FLUSH),
> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
> +	},
> +	{
> +	.name = "ctl_4", .id = CTL_4,
> +	.base = 0x19000, .len = 0x1e8,
> +	.features = BIT(DPU_CTL_ACTIVE_CFG) |
> +		    BIT(DPU_CTL_FETCH_ACTIVE) |
> +		    BIT(DPU_CTL_VM_CFG) |
> +		    BIT(DPU_CTL_UNIFIED_DSPP_FLUSH),
> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
> +	},
> +	{
> +	.name = "ctl_5", .id = CTL_5,
> +	.base = 0x1a000, .len = 0x1e8,
> +	.features = BIT(DPU_CTL_ACTIVE_CFG) |
> +		    BIT(DPU_CTL_FETCH_ACTIVE) |
> +		    BIT(DPU_CTL_VM_CFG) |
> +		    BIT(DPU_CTL_UNIFIED_DSPP_FLUSH),
> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
> +	},
> +};
> +
>   static const struct dpu_ctl_cfg sc7280_ctl[] = {
>   	{
>   	.name = "ctl_0", .id = CTL_0,
> @@ -1182,6 +1292,27 @@ static const struct dpu_pingpong_cfg sc7280_pp[] = {
>   	PP_BLK("pingpong_3", PINGPONG_3, 0x6c000, 0, sc7280_pp_sblk, -1, -1),
>   };
>   
> +static const struct dpu_pingpong_cfg sm8350_pp[] = {
> +	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x69000, MERGE_3D_0, sdm845_pp_sblk_te,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12)),
> +	PP_BLK_TE("pingpong_1", PINGPONG_1, 0x6a000, MERGE_3D_0, sdm845_pp_sblk_te,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13)),
> +	PP_BLK("pingpong_2", PINGPONG_2, 0x6b000, MERGE_3D_1, sdm845_pp_sblk,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 14)),
> +	PP_BLK("pingpong_3", PINGPONG_3, 0x6c000, MERGE_3D_1, sdm845_pp_sblk,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 15)),
> +	PP_BLK("pingpong_4", PINGPONG_4, 0x6d000, MERGE_3D_2, sdm845_pp_sblk,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
> +			-1),
> +	PP_BLK("pingpong_5", PINGPONG_5, 0x6e000, MERGE_3D_2, sdm845_pp_sblk,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
> +			-1),
> +};
> +
>   static struct dpu_pingpong_cfg qcm2290_pp[] = {
>   	PP_BLK("pingpong_0", PINGPONG_0, 0x70000, 0, sdm845_pp_sblk,
>   		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
> @@ -1205,6 +1336,12 @@ static const struct dpu_merge_3d_cfg sm8150_merge_3d[] = {
>   	MERGE_3D_BLK("merge_3d_2", MERGE_3D_2, 0x83200),
>   };
>   
> +static const struct dpu_merge_3d_cfg sm8350_merge_3d[] = {
> +	MERGE_3D_BLK("merge_3d_0", MERGE_3D_0, 0x4e000),
> +	MERGE_3D_BLK("merge_3d_1", MERGE_3D_1, 0x4f000),
> +	MERGE_3D_BLK("merge_3d_2", MERGE_3D_2, 0x50000),
> +};
> +
>   /*************************************************************
>    * DSC sub blocks config
>    *************************************************************/
> @@ -1222,6 +1359,12 @@ static struct dpu_dsc_cfg sdm845_dsc[] = {
>   	DSC_BLK("dsc_3", DSC_3, 0x80c00),
>   };
>   
> +static struct dpu_dsc_cfg sm8350_dsc[] = {
> +	DSC_BLK("dsc_0", DSC_0, 0x80000),
> +	DSC_BLK("dsc_1", DSC_1, 0x81000),
> +	DSC_BLK("dsc_2", DSC_2, 0x82000),
> +};
> +
>   /*************************************************************
>    * INTF sub blocks config
>    *************************************************************/
> @@ -1269,6 +1412,13 @@ static const struct dpu_intf_cfg sc7280_intf[] = {
>   	INTF_BLK("intf_5", INTF_5, 0x39000, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 22, 23),
>   };
>   
> +static const struct dpu_intf_cfg sm8350_intf[] = {
> +	INTF_BLK("intf_0", INTF_0, 0x34000, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> +	INTF_BLK("intf_1", INTF_1, 0x35000, INTF_DSI, 0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> +	INTF_BLK("intf_2", INTF_2, 0x36000, INTF_DSI, 1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
> +	INTF_BLK("intf_3", INTF_3, 0x37000, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
> +};
> +
>   static const struct dpu_intf_cfg sc8180x_intf[] = {
>   	INTF_BLK("intf_0", INTF_0, 0x6A000, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
>   	INTF_BLK("intf_1", INTF_1, 0x6A800, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> @@ -1397,6 +1547,14 @@ static const struct dpu_reg_dma_cfg sm8250_regdma = {
>   	.clk_ctrl = DPU_CLK_CTRL_REG_DMA,
>   };
>   
> +static const struct dpu_reg_dma_cfg sm8350_regdma = {
> +	.base = 0x0,
> +	.version = 0x00020000,
> +	.trigger_sel_off = 0x119c,
> +	.xin_id = 7,
> +	.clk_ctrl = DPU_CLK_CTRL_REG_DMA,
> +};
> +
>   /*************************************************************
>    * PERF data config
>    *************************************************************/
> @@ -1700,6 +1858,36 @@ static const struct dpu_perf_cfg sc7280_perf_data = {
>   	.bw_inefficiency_factor = 120,
>   };
>   
> +static const struct dpu_perf_cfg sm8350_perf_data = {
> +	.max_bw_low = 11800000,
> +	.max_bw_high = 18200000,
> +	.min_core_ib = 2500000,
> +	.min_llcc_ib = 0,
> +	.min_dram_ib = 800000,
> +	.min_prefill_lines = 40,
> +	/* FIXME: lut tables */
> +	.danger_lut_tbl = {0x3ffff, 0x3ffff, 0x0},
> +	.safe_lut_tbl = {0xfe00, 0xfe00, 0xffff},
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
>   static const struct dpu_perf_cfg qcm2290_perf_data = {
>   	.max_bw_low = 2700000,
>   	.max_bw_high = 2700000,
> @@ -1876,6 +2064,34 @@ static const struct dpu_mdss_cfg sm8250_dpu_cfg = {
>   	.mdss_irqs = IRQ_SM8250_MASK,
>   };
>   
> +static const struct dpu_mdss_cfg sm8350_dpu_cfg = {
> +	.caps = &sm8350_dpu_caps,
> +	.mdp_count = ARRAY_SIZE(sm8350_mdp),
> +	.mdp = sm8350_mdp,
> +	.ctl_count = ARRAY_SIZE(sm8350_ctl),
> +	.ctl = sm8350_ctl,
> +	.sspp_count = ARRAY_SIZE(sm8250_sspp),
> +	.sspp = sm8250_sspp,
> +	.mixer_count = ARRAY_SIZE(sm8150_lm),
> +	.mixer = sm8150_lm,
> +	.dspp_count = ARRAY_SIZE(sm8150_dspp),
> +	.dspp = sm8150_dspp,
> +	.pingpong_count = ARRAY_SIZE(sm8350_pp),
> +	.pingpong = sm8350_pp,
> +	.dsc_count = ARRAY_SIZE(sm8350_dsc),
> +	.dsc = sm8350_dsc,
> +	.merge_3d_count = ARRAY_SIZE(sm8350_merge_3d),
> +	.merge_3d = sm8350_merge_3d,
> +	.intf_count = ARRAY_SIZE(sm8350_intf),
> +	.intf = sm8350_intf,
> +	.vbif_count = ARRAY_SIZE(sdm845_vbif),
> +	.vbif = sdm845_vbif,
> +	.reg_dma_count = 1,
> +	.dma_cfg = &sm8250_regdma,
> +	.perf = &sm8350_perf_data,
> +	.mdss_irqs = IRQ_SM8350_MASK,
> +};
> +
>   static const struct dpu_mdss_cfg sc7280_dpu_cfg = {
>   	.caps = &sc7280_dpu_caps,
>   	.mdp_count = ARRAY_SIZE(sc7280_mdp),
> @@ -1933,6 +2149,7 @@ static const struct dpu_mdss_hw_cfg_handler cfg_handler[] = {
>   	{ .hw_rev = DPU_HW_VER_600, .dpu_cfg = &sm8250_dpu_cfg},
>   	{ .hw_rev = DPU_HW_VER_620, .dpu_cfg = &sc7180_dpu_cfg},
>   	{ .hw_rev = DPU_HW_VER_650, .dpu_cfg = &qcm2290_dpu_cfg},
> +	{ .hw_rev = DPU_HW_VER_700, .dpu_cfg = &sm8350_dpu_cfg},
>   	{ .hw_rev = DPU_HW_VER_720, .dpu_cfg = &sc7280_dpu_cfg},
>   };
>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 71fe4c505f5b..e59630e06110 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -45,6 +45,7 @@
>   #define DPU_HW_VER_600	DPU_HW_VER(6, 0, 0) /* sm8250 */
>   #define DPU_HW_VER_620	DPU_HW_VER(6, 2, 0) /* sc7180 v1.0 */
>   #define DPU_HW_VER_650	DPU_HW_VER(6, 5, 0) /* qcm2290|sm4125 */
> +#define DPU_HW_VER_700	DPU_HW_VER(7, 0, 0) /* sm8350 */
>   #define DPU_HW_VER_720	DPU_HW_VER(7, 2, 0) /* sc7280 */
>   
>   #define IS_MSM8996_TARGET(rev) IS_DPU_MAJOR_MINOR_SAME((rev), DPU_HW_VER_170)

-- 
With best wishes
Dmitry

