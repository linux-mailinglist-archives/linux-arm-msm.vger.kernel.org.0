Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07D614AE094
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Feb 2022 19:19:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353295AbiBHSTh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Feb 2022 13:19:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231478AbiBHSTh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Feb 2022 13:19:37 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46734C061576
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Feb 2022 10:19:33 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id u7so120963lji.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Feb 2022 10:19:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=rjz9bXaN35HqzP5OsNrgVkKAIfe4Wxi/3iU1Khy8GXU=;
        b=vp2lyvA+QXMNv2e4rIJtM3RXke1I7n6rN3ny5noYQIppWTq3XxzI4pJXzvaddkUiG+
         5tqDOi7fLYM5nSZwxRJzav3x3LrMqPCI11IHRAmTG1LgXmnR22XNYyLA/UqqsZgJYIoC
         TjMnOsiGKf3upDsAx63gS4fLssuxjxsIxMXV+E6E56K81GRfPy8qC9OfhLDwU9HvUXV4
         48qw0ygiUn2oydgHKdcX5hGzTdJ1AJO3nlk3a/V+eSLTsDguwaFe8KKYPHvOtmvYrIkq
         nkYHCmFfv1QiTc5X4esQuyV4ZfKS+tNbFnGANBzAdqi6+9GfM9jc6+Chq/rprW2t6r7d
         qwqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=rjz9bXaN35HqzP5OsNrgVkKAIfe4Wxi/3iU1Khy8GXU=;
        b=TbCK0BODG+XjJ567Vc+KORQto7+9QUFo0+Aiq0Yk/umbTkMb2qIU5p56iqm2BZXAvq
         7/QC/0Xu0wMzKzT7h+5bClq+twvT4imUVMVVhwNMAQ0ZDmAn0qE8luPyKWXv6JQDm2Kj
         HRluwGEbZh+fzy4ZTA8u+GzTbWKvwBMkLlb1SGjw620BCIF+GkBog0gbR4sCnMv7+eW2
         2x4KTc13YXgO9iugzSp0BHhTyA0nwS6mNE8mVtj3J4HPdd63+0tx7AwnKC3gOwcTVEQt
         +zB7LMJu3nGSGD7Zpo8/whL4LFrH/FY1CqkJZToPZfcCkhbPHh4I8zxcoDvBgGCmunLd
         cj7Q==
X-Gm-Message-State: AOAM5301DjWu2j7uoB7Fbn9bofZ0EfT54vPEG7sq3Ch4eoZ1RLu8xkeD
        U0vTy/29neXGSm4OgbLXbBrSDw==
X-Google-Smtp-Source: ABdhPJyn4hkEJIZ2k2v9/13746X5MW5cMTyvqhZATkem2EsMtj03GjoTVfX78KENmKBxCtRmx68e7Q==
X-Received: by 2002:a2e:bb8e:: with SMTP id y14mr3603589lje.502.1644344371560;
        Tue, 08 Feb 2022 10:19:31 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id bf10sm2135303ljb.130.2022.02.08.10.19.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Feb 2022 10:19:30 -0800 (PST)
Message-ID: <bf959a02-c0ac-5dd3-e3b3-71b0758acbb8@linaro.org>
Date:   Tue, 8 Feb 2022 21:19:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v2 1/2] drm/msm: add support for QCM2290 MDSS
Content-Language: en-GB
To:     Loic Poulain <loic.poulain@linaro.org>, robdclark@gmail.com,
        sean@poorly.run, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        bjorn.andersson@linaro.org
References: <1644338552-14426-1-git-send-email-loic.poulain@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1644338552-14426-1-git-send-email-loic.poulain@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 08/02/2022 19:42, Loic Poulain wrote:
> Add compatibility for QCM2290 display subsystem, including
> required entries in DPU hw catalog.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   v2: - Add BIT(DPU_SSPP_QOS_8LVL) to qcm2290 vig mask
>       - drop qseed_type from dpu caps as there is no scaler
>       - rename _QCM2290_VIG_SBLK to _VIG_SBLK_NOSCALE
>       - Use sm8150_dspp_sblk instead of cloning it
>       - Use sdm845_pp_sblk instead of cloning it
>       - Use sdm845_vbif
> 
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 148 +++++++++++++++++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |   1 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c        |   1 +
>   drivers/gpu/drm/msm/msm_drv.c                  |   1 +
>   4 files changed, 151 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index aa75991..12392d0 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -25,6 +25,8 @@
>   #define VIG_SM8250_MASK \
>   	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3LITE))
>   
> +#define VIG_QCM2290_MASK (VIG_MASK | BIT(DPU_SSPP_QOS_8LVL))
> +
>   #define DMA_SDM845_MASK \
>   	(BIT(DPU_SSPP_SRC) | BIT(DPU_SSPP_QOS) | BIT(DPU_SSPP_QOS_8LVL) |\
>   	BIT(DPU_SSPP_TS_PREFILL) | BIT(DPU_SSPP_TS_PREFILL_REC1) |\
> @@ -251,6 +253,17 @@ static const struct dpu_caps sc7280_dpu_caps = {
>   	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>   };
>   
> +static const struct dpu_caps qcm2290_dpu_caps = {
> +	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
> +	.max_mixer_blendstages = 0x4,
> +	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2,
> +	.ubwc_version = DPU_HW_UBWC_VER_20,
> +	.has_dim_layer = true,
> +	.has_idle_pc = true,
> +	.max_linewidth = 2160,
> +	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
> +};
> +
>   static const struct dpu_mdp_cfg sdm845_mdp[] = {
>   	{
>   	.name = "top_0", .id = MDP_TOP,
> @@ -336,6 +349,19 @@ static const struct dpu_mdp_cfg sc7280_mdp[] = {
>   	},
>   };
>   
> +static const struct dpu_mdp_cfg qcm2290_mdp[] = {
> +	{
> +	.name = "top_0", .id = MDP_TOP,
> +	.base = 0x0, .len = 0x494,
> +	.features = 0,
> +	.highest_bank_bit = 0x2,
> +	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
> +		.reg_off = 0x2AC, .bit_off = 0},
> +	.clk_ctrls[DPU_CLK_CTRL_DMA0] = {
> +		.reg_off = 0x2AC, .bit_off = 8},
> +	},
> +};
> +
>   /*************************************************************
>    * CTL sub blocks config
>    *************************************************************/
> @@ -459,6 +485,15 @@ static const struct dpu_ctl_cfg sc7280_ctl[] = {
>   	},
>   };
>   
> +static const struct dpu_ctl_cfg qcm2290_ctl[] = {
> +	{
> +	.name = "ctl_0", .id = CTL_0,
> +	.base = 0x1000, .len = 0x1dc,
> +	.features = BIT(DPU_CTL_ACTIVE_CFG),
> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
> +	},
> +};
> +
>   /*************************************************************
>    * SSPP sub blocks config
>    *************************************************************/
> @@ -595,6 +630,30 @@ static const struct dpu_sspp_cfg sc7280_sspp[] = {
>   		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),
>   };
>   
> +
> +#define _VIG_SBLK_NOSCALE(num, sdma_pri) \
> +	{ \
> +	.maxdwnscale = SSPP_UNITY_SCALE, \
> +	.maxupscale = SSPP_UNITY_SCALE, \
> +	.smart_dma_priority = sdma_pri, \
> +	.src_blk = {.name = STRCAT("sspp_src_", num), \
> +		.id = DPU_SSPP_SRC, .base = 0x00, .len = 0x150,}, \
> +	.format_list = plane_formats_yuv, \
> +	.num_formats = ARRAY_SIZE(plane_formats_yuv), \
> +	.virt_format_list = plane_formats, \
> +	.virt_num_formats = ARRAY_SIZE(plane_formats), \
> +	}
> +
> +static const struct dpu_sspp_sub_blks qcm2290_vig_sblk_0 = _VIG_SBLK_NOSCALE("0", 2);
> +static const struct dpu_sspp_sub_blks qcm2290_dma_sblk_0 = _DMA_SBLK("8", 1);
> +
> +static const struct dpu_sspp_cfg qcm2290_sspp[] = {
> +	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_QCM2290_MASK,
> +		 qcm2290_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
> +	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_SDM845_MASK,
> +		 qcm2290_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
> +};
> +
>   /*************************************************************
>    * MIXER sub blocks config
>    *************************************************************/
> @@ -679,6 +738,21 @@ static const struct dpu_lm_cfg sc7280_lm[] = {
>   		&sc7180_lm_sblk, PINGPONG_3, LM_2, 0),
>   };
>   
> +/* QCM2290 */
> +
> +static const struct dpu_lm_sub_blks qcm2290_lm_sblk = {
> +	.maxwidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
> +	.maxblendstages = 4, /* excluding base layer */
> +	.blendstage_base = { /* offsets relative to mixer base */
> +		0x20, 0x38, 0x50, 0x68
> +	},
> +};
> +
> +static const struct dpu_lm_cfg qcm2290_lm[] = {
> +	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SC7180_MASK,
> +		&qcm2290_lm_sblk, PINGPONG_0, 0, DSPP_0),
> +};
> +
>   /*************************************************************
>    * DSPP sub blocks config
>    *************************************************************/
> @@ -716,6 +790,11 @@ static const struct dpu_dspp_cfg sm8150_dspp[] = {
>   		 &sm8150_dspp_sblk),
>   };
>   
> +static const struct dpu_dspp_cfg qcm2290_dspp[] = {
> +	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
> +		 &sm8150_dspp_sblk),
> +};
> +
>   /*************************************************************
>    * PINGPONG sub blocks config
>    *************************************************************/
> @@ -798,6 +877,12 @@ static const struct dpu_pingpong_cfg sm8150_pp[] = {
>   			-1),
>   };
>   
> +static struct dpu_pingpong_cfg qcm2290_pp[] = {
> +	PP_BLK("pingpong_0", PINGPONG_0, 0x70000, 0, sdm845_pp_sblk,
> +		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
> +		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12)),
> +};
> +
>   /*************************************************************
>    * MERGE_3D sub blocks config
>    *************************************************************/
> @@ -861,6 +946,11 @@ static const struct dpu_intf_cfg sc7280_intf[] = {
>   	INTF_BLK("intf_5", INTF_5, 0x39000, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 22, 23),
>   };
>   
> +static const struct dpu_intf_cfg qcm2290_intf[] = {
> +	INTF_BLK("intf_0", INTF_0, 0x00000, INTF_NONE, 0, 0, 0, 0, 0, 0),
> +	INTF_BLK("intf_1", INTF_1, 0x6A800, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> +};
> +
>   /*************************************************************
>    * VBIF sub blocks config
>    *************************************************************/
> @@ -931,6 +1021,10 @@ static const struct dpu_qos_lut_entry sm8150_qos_linear[] = {
>   	{.fl = 0, .lut = 0x0011222222223357 },
>   };
>   
> +static const struct dpu_qos_lut_entry qcm2290_qos_linear[] = {
> +	{.fl = 0, .lut = 0x0011222222335777},
> +};
> +
>   static const struct dpu_qos_lut_entry sdm845_qos_macrotile[] = {
>   	{.fl = 10, .lut = 0x344556677},
>   	{.fl = 11, .lut = 0x3344556677},
> @@ -1102,6 +1196,27 @@ static const struct dpu_perf_cfg sc7280_perf_data = {
>   	.bw_inefficiency_factor = 120,
>   };
>   
> +static const struct dpu_perf_cfg qcm2290_perf_data = {
> +	.max_bw_low = 2700000,
> +	.max_bw_high = 2700000,
> +	.min_core_ib = 1300000,
> +	.min_llcc_ib = 0,
> +	.min_dram_ib = 1600000,
> +	.min_prefill_lines = 24,
> +	.danger_lut_tbl = {0xff, 0x0, 0x0},
> +	.safe_lut_tbl = {0xfff0, 0x0, 0x0},
> +	.qos_lut_tbl = {
> +		{.nentry = ARRAY_SIZE(qcm2290_qos_linear),
> +		.entries = qcm2290_qos_linear
> +		},
> +	},
> +	.cdp_cfg = {
> +		{.rd_enable = 1, .wr_enable = 1},
> +		{.rd_enable = 1, .wr_enable = 0}
> +	},
> +	.clk_inefficiency_factor = 105,
> +	.bw_inefficiency_factor = 120,
> +};
>   /*************************************************************
>    * Hardware catalog init
>    *************************************************************/
> @@ -1255,6 +1370,38 @@ static void sc7280_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
>   	};
>   }
>   
> +
> +/*
> + * qcm2290_cfg_init(): populate qcm2290 dpu sub-blocks reg offsets
> + * and instance counts.
> + */
> +static void qcm2290_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
> +{
> +	*dpu_cfg = (struct dpu_mdss_cfg){
> +		.caps = &qcm2290_dpu_caps,
> +		.mdp_count = ARRAY_SIZE(qcm2290_mdp),
> +		.mdp = qcm2290_mdp,
> +		.ctl_count = ARRAY_SIZE(qcm2290_ctl),
> +		.ctl = qcm2290_ctl,
> +		.sspp_count = ARRAY_SIZE(qcm2290_sspp),
> +		.sspp = qcm2290_sspp,
> +		.mixer_count = ARRAY_SIZE(qcm2290_lm),
> +		.mixer = qcm2290_lm,
> +		.dspp_count = ARRAY_SIZE(qcm2290_dspp),
> +		.dspp = qcm2290_dspp,
> +		.pingpong_count = ARRAY_SIZE(qcm2290_pp),
> +		.pingpong = qcm2290_pp,
> +		.intf_count = ARRAY_SIZE(qcm2290_intf),
> +		.intf = qcm2290_intf,
> +		.vbif_count = ARRAY_SIZE(sdm845_vbif),
> +		.vbif = sdm845_vbif,
> +		.reg_dma_count = 1,
> +		.dma_cfg = sdm845_regdma,
> +		.perf = qcm2290_perf_data,
> +		.mdss_irqs = IRQ_SC7180_MASK,
> +	};
> +}
> +
>   static const struct dpu_mdss_hw_cfg_handler cfg_handler[] = {
>   	{ .hw_rev = DPU_HW_VER_400, .cfg_init = sdm845_cfg_init},
>   	{ .hw_rev = DPU_HW_VER_401, .cfg_init = sdm845_cfg_init},
> @@ -1262,6 +1409,7 @@ static const struct dpu_mdss_hw_cfg_handler cfg_handler[] = {
>   	{ .hw_rev = DPU_HW_VER_501, .cfg_init = sm8150_cfg_init},
>   	{ .hw_rev = DPU_HW_VER_600, .cfg_init = sm8250_cfg_init},
>   	{ .hw_rev = DPU_HW_VER_620, .cfg_init = sc7180_cfg_init},
> +	{ .hw_rev = DPU_HW_VER_650, .cfg_init = qcm2290_cfg_init},
>   	{ .hw_rev = DPU_HW_VER_720, .cfg_init = sc7280_cfg_init},
>   };
>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 31af04a..5b31392 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -41,6 +41,7 @@
>   #define DPU_HW_VER_501	DPU_HW_VER(5, 0, 1) /* sm8150 v2.0 */
>   #define DPU_HW_VER_600	DPU_HW_VER(6, 0, 0) /* sm8250 */
>   #define DPU_HW_VER_620	DPU_HW_VER(6, 2, 0) /* sc7180 v1.0 */
> +#define DPU_HW_VER_650	DPU_HW_VER(6, 5, 0) /* qcm2290|sm4125 */
>   #define DPU_HW_VER_720	DPU_HW_VER(7, 2, 0) /* sc7280 */
>   
>   #define IS_MSM8996_TARGET(rev) IS_DPU_MAJOR_MINOR_SAME((rev), DPU_HW_VER_170)
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 47fe11a..b816a50 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -1348,6 +1348,7 @@ static const struct dev_pm_ops dpu_pm_ops = {
>   };
>   
>   const struct of_device_id dpu_dt_match[] = {
> +	{ .compatible = "qcom,qcm2290-dpu", },
>   	{ .compatible = "qcom,sdm845-dpu", },
>   	{ .compatible = "qcom,sc7180-dpu", },
>   	{ .compatible = "qcom,sc7280-dpu", },
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index ad35a5d..c8ab6eb 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -1438,6 +1438,7 @@ static void msm_pdev_shutdown(struct platform_device *pdev)
>   static const struct of_device_id dt_match[] = {
>   	{ .compatible = "qcom,mdp4", .data = (void *)KMS_MDP4 },
>   	{ .compatible = "qcom,mdss", .data = (void *)KMS_MDP5 },
> +	{ .compatible = "qcom,qcm2290-mdss", .data = (void *)KMS_DPU },
>   	{ .compatible = "qcom,sdm845-mdss", .data = (void *)KMS_DPU },
>   	{ .compatible = "qcom,sc7180-mdss", .data = (void *)KMS_DPU },
>   	{ .compatible = "qcom,sc7280-mdss", .data = (void *)KMS_DPU },


-- 
With best wishes
Dmitry
