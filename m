Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 806D34B7694
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Feb 2022 21:49:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242704AbiBORmz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Feb 2022 12:42:55 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:59196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242475AbiBORmy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Feb 2022 12:42:54 -0500
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E90AF8BE01;
        Tue, 15 Feb 2022 09:42:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1644946964; x=1676482964;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=I0P/s5Xzuf379+YxgczzGONTRmfLBBXVHSvWtOdV4pc=;
  b=hRpdngq1nMlu4SZZ0ipVeZ5KPzhgK/9UZFz5JdXnNEOLo87O3zQQwujV
   COWICBeQdLNpA5lx6XfSP7JEbv+Fie45luWGGsC7oLoWo6cXQfz7C9itI
   24QMqu7uE/jvNcHCe8o/PalaZ/NL+vEFvPr3LtINVLM+ISYXlrl6vl0So
   c=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 15 Feb 2022 09:42:43 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2022 09:42:43 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Tue, 15 Feb 2022 09:42:42 -0800
Received: from [10.111.168.21] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Tue, 15 Feb
 2022 09:42:41 -0800
Message-ID: <6a3ef247-b26b-d505-cd85-92fb277163dd@quicinc.com>
Date:   Tue, 15 Feb 2022 09:42:38 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v2 2/2] drm/msm/dpu: Add SC8180x to hw catalog
Content-Language: en-US
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
CC:     Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20220215043353.1256754-1-bjorn.andersson@linaro.org>
 <20220215043353.1256754-2-bjorn.andersson@linaro.org>
 <be397e2e-05ab-5c18-8e2d-16c443f0a6d1@quicinc.com>
 <Ygvisfhi0SY6XdAz@builder.lan>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <Ygvisfhi0SY6XdAz@builder.lan>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 2/15/2022 9:28 AM, Bjorn Andersson wrote:
> On Tue 15 Feb 11:14 CST 2022, Abhinav Kumar wrote:
> 
>>
>>
>> On 2/14/2022 8:33 PM, Bjorn Andersson wrote:
>>> From: Rob Clark <robdclark@chromium.org>
>>>
>>> Add SC8180x to the hardware catalog, for initial support for the
>>> platform. Due to limitations in the DP driver only one of the four DP
>>> interfaces is left enabled.
>>>
>>> The SC8180x platform supports the newly added DPU_INTF_WIDEBUS flag and
>>> the Windows-on-Snapdragon bootloader leaves the widebus bit set, so this
>>> is flagged appropriately to ensure widebus is disabled - for now.
>>>
>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>>> [bjorn: Reworked intf and irq definitions]
>>> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>>> ---
>>>
>>> Changes since v1:
>>> - Dropped widebus flag
>>>
>>>    .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 129 ++++++++++++++++++
>>>    .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   1 +
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   1 +
>>>    drivers/gpu/drm/msm/msm_drv.c                 |   1 +
>>>    4 files changed, 132 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>> index aa75991903a6..7ac0fe32df49 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>> @@ -90,6 +90,17 @@
>>>    			 BIT(MDP_INTF3_INTR) | \
>>>    			 BIT(MDP_INTF4_INTR))
>>> +#define IRQ_SC8180X_MASK (BIT(MDP_SSPP_TOP0_INTR) | \
>>> +			  BIT(MDP_SSPP_TOP0_INTR2) | \
>>> +			  BIT(MDP_SSPP_TOP0_HIST_INTR) | \
>>> +			  BIT(MDP_INTF0_INTR) | \
>>> +			  BIT(MDP_INTF1_INTR) | \
>>> +			  BIT(MDP_INTF2_INTR) | \
>>> +			  BIT(MDP_INTF3_INTR) | \
>>> +			  BIT(MDP_INTF4_INTR) | \
>>> +			  BIT(MDP_INTF5_INTR) | \
>>> +			  BIT(MDP_AD4_0_INTR) | \
>>> +			  BIT(MDP_AD4_1_INTR))
>>>    #define DEFAULT_PIXEL_RAM_SIZE		(50 * 1024)
>>>    #define DEFAULT_DPU_LINE_WIDTH		2048
>>> @@ -225,6 +236,22 @@ static const struct dpu_caps sm8150_dpu_caps = {
>>>    	.max_vdeci_exp = MAX_VERT_DECIMATION,
>>>    };
>>> +static const struct dpu_caps sc8180x_dpu_caps = {
>>> +	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
>>> +	.max_mixer_blendstages = 0xb,
>>> +	.qseed_type = DPU_SSPP_SCALER_QSEED3,
>>> +	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
>>> +	.ubwc_version = DPU_HW_UBWC_VER_30,
>>> +	.has_src_split = true,
>>> +	.has_dim_layer = true,
>>> +	.has_idle_pc = true,
>>> +	.has_3d_merge = true,
>>> +	.max_linewidth = 4096,
>>> +	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>>> +	.max_hdeci_exp = MAX_HORZ_DECIMATION,
>>> +	.max_vdeci_exp = MAX_VERT_DECIMATION,
>>> +};
>>> +
>>>    static const struct dpu_caps sm8250_dpu_caps = {
>>>    	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
>>>    	.max_mixer_blendstages = 0xb,
>>> @@ -293,6 +320,31 @@ static const struct dpu_mdp_cfg sc7180_mdp[] = {
>>>    	},
>>>    };
>>> +static const struct dpu_mdp_cfg sc8180x_mdp[] = {
>>> +	{
>>> +	.name = "top_0", .id = MDP_TOP,
>>> +	.base = 0x0, .len = 0x45C,
>>> +	.features = 0,
>>> +	.highest_bank_bit = 0x3,
>>> +	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
>>> +			.reg_off = 0x2AC, .bit_off = 0},
>>> +	.clk_ctrls[DPU_CLK_CTRL_VIG1] = {
>>> +			.reg_off = 0x2B4, .bit_off = 0},
>>> +	.clk_ctrls[DPU_CLK_CTRL_VIG2] = {
>>> +			.reg_off = 0x2BC, .bit_off = 0},
>>> +	.clk_ctrls[DPU_CLK_CTRL_VIG3] = {
>>> +			.reg_off = 0x2C4, .bit_off = 0},
>>> +	.clk_ctrls[DPU_CLK_CTRL_DMA0] = {
>>> +			.reg_off = 0x2AC, .bit_off = 8},
>>> +	.clk_ctrls[DPU_CLK_CTRL_DMA1] = {
>>> +			.reg_off = 0x2B4, .bit_off = 8},
>>> +	.clk_ctrls[DPU_CLK_CTRL_CURSOR0] = {
>>> +			.reg_off = 0x2BC, .bit_off = 8},
>>> +	.clk_ctrls[DPU_CLK_CTRL_CURSOR1] = {
>>> +			.reg_off = 0x2C4, .bit_off = 8},
>>> +	},
>>> +};
>>> +
>>>    static const struct dpu_mdp_cfg sm8250_mdp[] = {
>>>    	{
>>>    	.name = "top_0", .id = MDP_TOP,
>>> @@ -861,6 +913,16 @@ static const struct dpu_intf_cfg sc7280_intf[] = {
>>>    	INTF_BLK("intf_5", INTF_5, 0x39000, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 22, 23),
>>>    };
>>> +static const struct dpu_intf_cfg sc8180x_intf[] = {
>>> +	INTF_BLK("intf_0", INTF_0, 0x6A000, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
>>> +	INTF_BLK("intf_1", INTF_1, 0x6A800, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
>>> +	INTF_BLK("intf_2", INTF_2, 0x6B000, INTF_DSI, 1, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
>>> +	/* INTF_3 is for MST, wired to INTF_DP 0 and 1, use dummy index until this is supported */
>>> +	INTF_BLK("intf_3", INTF_3, 0x6B800, INTF_DP, 999, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
>>> +	INTF_BLK("intf_4", INTF_4, 0x6C000, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 20, 21),
>>> +	INTF_BLK("intf_5", INTF_5, 0x6C800, INTF_DP, MSM_DP_CONTROLLER_2, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 22, 23),
>>
>> This is a continued discussion from
>> https://patchwork.freedesktop.org/patch/474179/.
>>
>> Shouldnt INTF_5 be marked as INTF_eDP?
>>
> 
> Might be, I didn't even know we had an INTF_EDP define...
> 
> Is there any reason to distinguish DP and EDP in the DPU?  I see sc7280
> doesn't distinguish the DP and EDP interfaces.
> 
> Regards,
> Bjorn
> 

Like I have mentioned in the other patch, I think we have enough 
confusion between eDP and DP with the common driver. Since DPU does have 
separate interfaces I think we should fix that.

Regarding sc7280 using INTF_DP, I synced up with Sankeerth. He referred 
to your change 
https://patchwork.freedesktop.org/patch/457776/?series=92992&rev=5 as it 
was posted earlier and ended up using the same INTF_DP macro. So its 
turning out to be a cyclical error.

I think we should fix both.

>>> +};
>>> +
>>>    /*************************************************************
>>>     * VBIF sub blocks config
>>>     *************************************************************/
>>> @@ -931,6 +993,10 @@ static const struct dpu_qos_lut_entry sm8150_qos_linear[] = {
>>>    	{.fl = 0, .lut = 0x0011222222223357 },
>>>    };
>>> +static const struct dpu_qos_lut_entry sc8180x_qos_linear[] = {
>>> +	{.fl = 4, .lut = 0x0000000000000357 },
>>> +};
>>> +
>>>    static const struct dpu_qos_lut_entry sdm845_qos_macrotile[] = {
>>>    	{.fl = 10, .lut = 0x344556677},
>>>    	{.fl = 11, .lut = 0x3344556677},
>>> @@ -944,6 +1010,10 @@ static const struct dpu_qos_lut_entry sc7180_qos_macrotile[] = {
>>>    	{.fl = 0, .lut = 0x0011223344556677},
>>>    };
>>> +static const struct dpu_qos_lut_entry sc8180x_qos_macrotile[] = {
>>> +	{.fl = 10, .lut = 0x0000000344556677},
>>> +};
>>> +
>>>    static const struct dpu_qos_lut_entry sdm845_qos_nrt[] = {
>>>    	{.fl = 0, .lut = 0x0},
>>>    };
>>> @@ -1045,6 +1115,33 @@ static const struct dpu_perf_cfg sm8150_perf_data = {
>>>    	.bw_inefficiency_factor = 120,
>>>    };
>>> +static const struct dpu_perf_cfg sc8180x_perf_data = {
>>> +	.max_bw_low = 9600000,
>>> +	.max_bw_high = 9600000,
>>> +	.min_core_ib = 2400000,
>>> +	.min_llcc_ib = 800000,
>>> +	.min_dram_ib = 800000,
>>> +	.danger_lut_tbl = {0xf, 0xffff, 0x0, 0x0},
>>> +	.qos_lut_tbl = {
>>> +		{.nentry = ARRAY_SIZE(sc8180x_qos_linear),
>>> +		.entries = sc8180x_qos_linear
>>> +		},
>>> +		{.nentry = ARRAY_SIZE(sc8180x_qos_macrotile),
>>> +		.entries = sc8180x_qos_macrotile
>>> +		},
>>> +		{.nentry = ARRAY_SIZE(sc7180_qos_nrt),
>>> +		.entries = sc7180_qos_nrt
>>> +		},
>>> +		/* TODO: macrotile-qseed is different from macrotile */
>>> +	},
>>> +	.cdp_cfg = {
>>> +		{.rd_enable = 1, .wr_enable = 1},
>>> +		{.rd_enable = 1, .wr_enable = 0}
>>> +	},
>>> +	.clk_inefficiency_factor = 105,
>>> +	.bw_inefficiency_factor = 120,
>>> +};
>>> +
>>>    static const struct dpu_perf_cfg sm8250_perf_data = {
>>>    	.max_bw_low = 13700000,
>>>    	.max_bw_high = 16600000,
>>> @@ -1199,6 +1296,37 @@ static void sm8150_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
>>>    	};
>>>    }
>>> +/*
>>> + * sc8180x_cfg_init(): populate sc8180 dpu sub-blocks reg offsets
>>> + * and instance counts.
>>> + */
>>> +static void sc8180x_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
>>> +{
>>> +	*dpu_cfg = (struct dpu_mdss_cfg){
>>> +		.caps = &sc8180x_dpu_caps,
>>> +		.mdp_count = ARRAY_SIZE(sc8180x_mdp),
>>> +		.mdp = sc8180x_mdp,
>>> +		.ctl_count = ARRAY_SIZE(sm8150_ctl),
>>> +		.ctl = sm8150_ctl,
>>> +		.sspp_count = ARRAY_SIZE(sdm845_sspp),
>>> +		.sspp = sdm845_sspp,
>>> +		.mixer_count = ARRAY_SIZE(sm8150_lm),
>>> +		.mixer = sm8150_lm,
>>> +		.pingpong_count = ARRAY_SIZE(sm8150_pp),
>>> +		.pingpong = sm8150_pp,
>>> +		.merge_3d_count = ARRAY_SIZE(sm8150_merge_3d),
>>> +		.merge_3d = sm8150_merge_3d,
>>> +		.intf_count = ARRAY_SIZE(sc8180x_intf),
>>> +		.intf = sc8180x_intf,
>>> +		.vbif_count = ARRAY_SIZE(sdm845_vbif),
>>> +		.vbif = sdm845_vbif,
>>> +		.reg_dma_count = 1,
>>> +		.dma_cfg = sm8150_regdma,
>>> +		.perf = sc8180x_perf_data,
>>> +		.mdss_irqs = IRQ_SC8180X_MASK,
>>> +	};
>>> +}
>>> +
>>>    /*
>>>     * sm8250_cfg_init(): populate sm8250 dpu sub-blocks reg offsets
>>>     * and instance counts.
>>> @@ -1260,6 +1388,7 @@ static const struct dpu_mdss_hw_cfg_handler cfg_handler[] = {
>>>    	{ .hw_rev = DPU_HW_VER_401, .cfg_init = sdm845_cfg_init},
>>>    	{ .hw_rev = DPU_HW_VER_500, .cfg_init = sm8150_cfg_init},
>>>    	{ .hw_rev = DPU_HW_VER_501, .cfg_init = sm8150_cfg_init},
>>> +	{ .hw_rev = DPU_HW_VER_510, .cfg_init = sc8180x_cfg_init},
>>>    	{ .hw_rev = DPU_HW_VER_600, .cfg_init = sm8250_cfg_init},
>>>    	{ .hw_rev = DPU_HW_VER_620, .cfg_init = sc7180_cfg_init},
>>>    	{ .hw_rev = DPU_HW_VER_720, .cfg_init = sc7280_cfg_init},
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>>> index 31af04afda7d..9572d29ff2ff 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>>> @@ -39,6 +39,7 @@
>>>    #define DPU_HW_VER_410	DPU_HW_VER(4, 1, 0) /* sdm670 v1.0 */
>>>    #define DPU_HW_VER_500	DPU_HW_VER(5, 0, 0) /* sm8150 v1.0 */
>>>    #define DPU_HW_VER_501	DPU_HW_VER(5, 0, 1) /* sm8150 v2.0 */
>>> +#define DPU_HW_VER_510	DPU_HW_VER(5, 1, 1) /* sc8180 */
>>>    #define DPU_HW_VER_600	DPU_HW_VER(6, 0, 0) /* sm8250 */
>>>    #define DPU_HW_VER_620	DPU_HW_VER(6, 2, 0) /* sc7180 v1.0 */
>>>    #define DPU_HW_VER_720	DPU_HW_VER(7, 2, 0) /* sc7280 */
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>> index 47fe11a84a77..cedc631f8498 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>> @@ -1351,6 +1351,7 @@ const struct of_device_id dpu_dt_match[] = {
>>>    	{ .compatible = "qcom,sdm845-dpu", },
>>>    	{ .compatible = "qcom,sc7180-dpu", },
>>>    	{ .compatible = "qcom,sc7280-dpu", },
>>> +	{ .compatible = "qcom,sc8180x-dpu", },
>>>    	{ .compatible = "qcom,sm8150-dpu", },
>>>    	{ .compatible = "qcom,sm8250-dpu", },
>>>    	{}
>>> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
>>> index 555666e3f960..0f441d358b60 100644
>>> --- a/drivers/gpu/drm/msm/msm_drv.c
>>> +++ b/drivers/gpu/drm/msm/msm_drv.c
>>> @@ -1438,6 +1438,7 @@ static const struct of_device_id dt_match[] = {
>>>    	{ .compatible = "qcom,sdm845-mdss", .data = (void *)KMS_DPU },
>>>    	{ .compatible = "qcom,sc7180-mdss", .data = (void *)KMS_DPU },
>>>    	{ .compatible = "qcom,sc7280-mdss", .data = (void *)KMS_DPU },
>>> +	{ .compatible = "qcom,sc8180x-mdss", .data = (void *)KMS_DPU },
>>>    	{ .compatible = "qcom,sm8150-mdss", .data = (void *)KMS_DPU },
>>>    	{ .compatible = "qcom,sm8250-mdss", .data = (void *)KMS_DPU },
>>>    	{}
