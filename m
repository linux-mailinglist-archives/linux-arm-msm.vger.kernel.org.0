Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7236E51605C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Apr 2022 22:42:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235804AbiD3UpU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 30 Apr 2022 16:45:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235120AbiD3UpT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 30 Apr 2022 16:45:19 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1322436325
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Apr 2022 13:41:56 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id m23so14351487ljc.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Apr 2022 13:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=mUSdLXi9LIg5/Qa3e4zAwJ2C0Vg/GX+KZxMTonnsd88=;
        b=c7P1YMFd7aHVbUvW6KEIU1oWlEZgM/pGbticKkP3s8KS1hFz1nwvnYpaOAv5JwgpOW
         5xb37tgDjo3opDnxBmkqgvzyossCvzqayFCn4yrlyHCgJvlE/GqIMqApCKanBFYZf9do
         aVWm9X8uSMQ/kwqsrrUjdWGL465UGiI/NLf2Q9xavs4k5S+LYcgMJUieBXo45QMzx2rz
         TTnlZ3bTpm1GOaUKB/dNacExqcTlI0Q0qdy/UKuXAjsPi0n5vvYCLh9bPnq85P2m/PkY
         10F9D5ceBWwNYvgEtWxsXi1/RBq+KQYBofs9GC4aofdZT/x6762zTAZIlyv3JCW0Tf9s
         dhYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=mUSdLXi9LIg5/Qa3e4zAwJ2C0Vg/GX+KZxMTonnsd88=;
        b=n1PhAckogwqTGXWNZ3h6a/QGmOukSmPS/kD184NdO1o9YtYn5KcKf7jtx5Sf/wxJOB
         ZsQMKG/J0sQXGQKnOa1TKNPKC+rkJKlbybq9vi1jCF6F1d8S8lnRqH0qCfaafQHNN8TF
         TuXWG0V6eBT6orKPiAXpwZ+3bKUYhG8f/GLznHqjS9PE4uBRVxZXD9iq6LG666aBi+it
         yh6PtmcUnPqSq5w8CnEgrvG8RrKG/gjkPU6ahJZ6tFBLiDn/MJP9BBNIyc4Kb8Hd4DAs
         lXub015nhyS/zOPkWrRszEiAlAV3oqJBA0Va6E4qgGxHdfD6G5a1Nvu8vdRc3pUlMCzC
         f7hg==
X-Gm-Message-State: AOAM533cPVML/jWYcHf9uP/fMREiogiO5bXWS+TLm01KWJfXwWc/UKXF
        Dk3x+HJMHU/v4WZLFOpS6NLN+w==
X-Google-Smtp-Source: ABdhPJx0KkHQLZvDo2jscX0+WWjz1YG9Q8fhXuaUqjbLa1dqgWEEPknJBWWCNWRU+LhFOhSrtUufRA==
X-Received: by 2002:a2e:9d19:0:b0:24b:4bd:3f68 with SMTP id t25-20020a2e9d19000000b0024b04bd3f68mr3428225lji.418.1651351314028;
        Sat, 30 Apr 2022 13:41:54 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id d28-20020ac25edc000000b0047255d210dasm271474lfq.9.2022.04.30.13.41.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 Apr 2022 13:41:53 -0700 (PDT)
Message-ID: <638bf3c9-3f62-dc7f-8ff1-961e5df28923@linaro.org>
Date:   Sat, 30 Apr 2022 23:41:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 2/3] drm/msm/disp: dpu1: Add MSM8996 support
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Stephen Boyd <swboyd@chromium.org>,
        Kalyan Thota <quic_kalyant@quicinc.com>,
        Robert Foss <robert.foss@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Yangtao Li <tiny.windzz@gmail.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20220430161529.605843-1-konrad.dybcio@somainline.org>
 <20220430161529.605843-2-konrad.dybcio@somainline.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220430161529.605843-2-konrad.dybcio@somainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30/04/2022 19:15, Konrad Dybcio wrote:
> Add support for MSM8996, which - fun fact - was the SoC that this driver
> (or rather SDE, its downstream origin) was meant for and first tested on.
> 
> It has some hardware that differs from the modern SoCs, so not a lot of
> current structs could have been reused. It's also seemingly the only SoC
> supported by DPU that uses RGB pipes.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 268 ++++++++++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   1 +
>   drivers/gpu/drm/msm/msm_drv.c                 |   1 +
>   3 files changed, 270 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 3ac425c0ad82..0a217b5172bd 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -16,6 +16,11 @@
>   	BIT(DPU_SSPP_CSC_10BIT) | BIT(DPU_SSPP_CDP) |\
>   	BIT(DPU_SSPP_TS_PREFILL) | BIT(DPU_SSPP_EXCL_RECT))
>   
> +#define VIG_MSM8996_MASK \
> +	(BIT(DPU_SSPP_SRC) | BIT(DPU_SSPP_QOS) |\
> +	BIT(DPU_SSPP_CDP) | BIT(DPU_SSPP_TS_PREFILL) |\
> +	BIT(DPU_SSPP_SCALER_QSEED3))
> +
>   #define VIG_MSM8998_MASK \
>   	(VIG_MASK | BIT(DPU_SSPP_SCALER_QSEED3))
>   
> @@ -30,6 +35,10 @@
>   
>   #define VIG_QCM2290_MASK (VIG_MASK | BIT(DPU_SSPP_QOS_8LVL))
>   
> +#define DMA_MSM8996_MASK \
> +	(BIT(DPU_SSPP_SRC) | BIT(DPU_SSPP_QOS) |\
> +	BIT(DPU_SSPP_TS_PREFILL) | BIT(DPU_SSPP_CDP))
> +
>   #define DMA_MSM8998_MASK \
>   	(BIT(DPU_SSPP_SRC) | BIT(DPU_SSPP_QOS) |\
>   	BIT(DPU_SSPP_TS_PREFILL) | BIT(DPU_SSPP_TS_PREFILL_REC1) |\
> @@ -57,6 +66,9 @@
>   #define PINGPONG_SDM845_SPLIT_MASK \
>   	(PINGPONG_SDM845_MASK | BIT(DPU_PINGPONG_TE2))
>   
> +#define RGB_MSM8996_MSK \
> +	(VIG_MSM8996_MASK | BIT(DPU_SSPP_SCALER_RGB))
> +
>   #define CTL_SC7280_MASK \
>   	(BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_FETCH_ACTIVE) | BIT(DPU_CTL_VM_CFG))
>   
> @@ -72,6 +84,14 @@
>   
>   #define INTF_SC7280_MASK INTF_SC7180_MASK | BIT(DPU_DATA_HCTL_EN)
>   
> +#define IRQ_MSM8996_MASK (BIT(MDP_SSPP_TOP0_INTR) | \
> +			 BIT(MDP_SSPP_TOP0_INTR2) | \
> +			 BIT(MDP_SSPP_TOP0_HIST_INTR) | \
> +			 BIT(MDP_INTF0_INTR) | \
> +			 BIT(MDP_INTF1_INTR) | \
> +			 BIT(MDP_INTF2_INTR) | \
> +			 BIT(MDP_INTF3_INTR))
> +

What about AD4 blocks? I think there were two AD4 blocks, so we might 
use IRQ_SDM845_MASK instead (Note: we need to check whether sdm845 
really supported INTF4 interrupts or not).

>   #define IRQ_SDM845_MASK (BIT(MDP_SSPP_TOP0_INTR) | \
>   			 BIT(MDP_SSPP_TOP0_INTR2) | \
>   			 BIT(MDP_SSPP_TOP0_HIST_INTR) | \
> @@ -207,6 +227,17 @@ static const uint32_t plane_formats_yuv[] = {
>    * DPU sub blocks config
>    *************************************************************/
>   /* DPU top level caps */
> +static const struct dpu_caps msm8996_dpu_caps = {
> +	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
> +	.max_mixer_blendstages = 0x7,
> +	.qseed_type = DPU_SSPP_SCALER_QSEED3,
> +	.has_src_split = true,
> +	.max_linewidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
> +	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
> +	.max_hdeci_exp = MAX_HORZ_DECIMATION,
> +	.max_vdeci_exp = MAX_VERT_DECIMATION,
> +};
> +
>   static const struct dpu_caps msm8998_dpu_caps = {
>   	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
>   	.max_mixer_blendstages = 0x7,
> @@ -328,6 +359,35 @@ static const struct dpu_caps sc7280_dpu_caps = {
>   	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>   };
>   
> +static const struct dpu_mdp_cfg msm8996_mdp[] = {
> +	{
> +	.name = "top_0", .id = MDP_TOP,
> +	.base = 0x0, .len = 0x454,
> +	.features = 0,
> +	.highest_bank_bit = 0x2,
> +	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
> +			.reg_off = 0x2AC, .bit_off = 0},

Please convert to the lower case.

> +	.clk_ctrls[DPU_CLK_CTRL_VIG1] = {
> +			.reg_off = 0x2B4, .bit_off = 0},
> +	.clk_ctrls[DPU_CLK_CTRL_VIG2] = {
> +			.reg_off = 0x2BC, .bit_off = 0},
> +	.clk_ctrls[DPU_CLK_CTRL_VIG3] = {
> +			.reg_off = 0x2C4, .bit_off = 0},
> +	.clk_ctrls[DPU_CLK_CTRL_RGB0] = {
> +			.reg_off = 0x2AC, .bit_off = 4},
> +	.clk_ctrls[DPU_CLK_CTRL_RGB1] = {
> +			.reg_off = 0x2B4, .bit_off = 4},
> +	.clk_ctrls[DPU_CLK_CTRL_RGB2] = {
> +			.reg_off = 0x2BC, .bit_off = 4},
> +	.clk_ctrls[DPU_CLK_CTRL_RGB3] = {
> +			.reg_off = 0x2C4, .bit_off = 4},
> +	.clk_ctrls[DPU_CLK_CTRL_DMA0] = {
> +			.reg_off = 0x2AC, .bit_off = 8},
> +	.clk_ctrls[DPU_CLK_CTRL_DMA1] = {
> +			.reg_off = 0x2B4, .bit_off = 8},

There were two cursor SSPPs, please add corresponding controls here

> +	},
> +};
> +
>   static const struct dpu_mdp_cfg msm8998_mdp[] = {
>   	{
>   	.name = "top_0", .id = MDP_TOP,
> @@ -513,6 +573,39 @@ static const struct dpu_mdp_cfg qcm2290_mdp[] = {
>   /*************************************************************
>    * CTL sub blocks config
>    *************************************************************/
> +static const struct dpu_ctl_cfg msm8996_ctl[] = {
> +	{
> +	.name = "ctl_0", .id = CTL_0,
> +	.base = 0x1000, .len = 0x64,
> +	.features = 0,
> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
> +	},
> +	{
> +	.name = "ctl_1", .id = CTL_1,
> +	.base = 0x1200, .len = 0x64,
> +	.features = 0,
> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
> +	},
> +	{
> +	.name = "ctl_2", .id = CTL_2,
> +	.base = 0x1400, .len = 0x64,
> +	.features = 0,
> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
> +	},
> +	{
> +	.name = "ctl_3", .id = CTL_3,
> +	.base = 0x1600, .len = 0x64,
> +	.features = 0,
> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
> +	},
> +	{
> +	.name = "ctl_4", .id = CTL_4,
> +	.base = 0x1800, .len = 0x64,
> +	.features = 0,
> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
> +	},
> +};
> +
>   static const struct dpu_ctl_cfg msm8998_ctl[] = {
>   	{
>   	.name = "ctl_0", .id = CTL_0,
> @@ -708,6 +801,25 @@ static const struct dpu_ctl_cfg qcm2290_ctl[] = {
>   
>   /* SSPP common configuration */
>   
> +#define _VIG_SBLK_8996(num, sdma_pri, qseed_ver) \
> +	{ \
> +	.maxdwnscale = MAX_DOWNSCALE_RATIO, \
> +	.maxupscale = MAX_UPSCALE_RATIO, \
> +	.smart_dma_priority = sdma_pri, \
> +	.src_blk = {.name = STRCAT("sspp_src_", num), \
> +		.id = DPU_SSPP_SRC, .base = 0x00, .len = 0x150,}, \
> +	.scaler_blk = {.name = STRCAT("sspp_scaler", num), \
> +		.id = qseed_ver, \
> +		.base = 0x200, .len = 0xa0,}, \
> +	.csc_blk = {.name = STRCAT("sspp_csc", num), \
> +		.id = DPU_SSPP_CSC, \
> +		.base = 0x320, .len = 0x100,}, \
> +	.format_list = plane_formats_yuv, \
> +	.num_formats = ARRAY_SIZE(plane_formats_yuv), \
> +	.virt_format_list = plane_formats, \
> +	.virt_num_formats = ARRAY_SIZE(plane_formats), \
> +	}
> +
>   #define _VIG_SBLK(num, sdma_pri, qseed_ver) \
>   	{ \
>   	.maxdwnscale = MAX_DOWNSCALE_RATIO, \
> @@ -740,6 +852,15 @@ static const struct dpu_ctl_cfg qcm2290_ctl[] = {
>   	.virt_num_formats = ARRAY_SIZE(plane_formats), \
>   	}
>   
> +static const struct dpu_sspp_sub_blks msm8996_vig_sblk_0 =
> +				_VIG_SBLK_8996("0", 0, DPU_SSPP_SCALER_QSEED3);
> +static const struct dpu_sspp_sub_blks msm8996_vig_sblk_1 =
> +				_VIG_SBLK_8996("1", 0, DPU_SSPP_SCALER_QSEED3);
> +static const struct dpu_sspp_sub_blks msm8996_vig_sblk_2 =
> +				_VIG_SBLK_8996("2", 0, DPU_SSPP_SCALER_QSEED3);
> +static const struct dpu_sspp_sub_blks msm8996_vig_sblk_3 =
> +				_VIG_SBLK_8996("3", 0, DPU_SSPP_SCALER_QSEED3);
> +
>   static const struct dpu_sspp_sub_blks msm8998_vig_sblk_0 =
>   				_VIG_SBLK("0", 0, DPU_SSPP_SCALER_QSEED3);
>   static const struct dpu_sspp_sub_blks msm8998_vig_sblk_1 =
> @@ -775,6 +896,30 @@ static const struct dpu_sspp_sub_blks sdm845_dma_sblk_3 = _DMA_SBLK("11", 4);
>   	.clk_ctrl = _clkctrl \
>   	}
>   
> +static const struct dpu_sspp_cfg msm8996_sspp[] = {
> +	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x150, VIG_MSM8996_MASK,
> +		msm8996_vig_sblk_0, 0,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
> +	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, 0x150, VIG_MSM8996_MASK,
> +		msm8996_vig_sblk_1, 4,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
> +	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, 0x150, VIG_MSM8996_MASK,
> +		msm8996_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
> +	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, 0x150, VIG_MSM8996_MASK,
> +		msm8996_vig_sblk_3, 12,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
> +	/* TODO: RGB blocks */
> +	SSPP_BLK("sspp_4", SSPP_RGB0, 0x14000, 0x150, RGB_MSM8996_MSK,
> +		sdm845_dma_sblk_0, 1, SSPP_TYPE_RGB, DPU_CLK_CTRL_RGB0),
> +	SSPP_BLK("sspp_5", SSPP_RGB1, 0x16000, 0x150, RGB_MSM8996_MSK,
> +		sdm845_dma_sblk_1, 5, SSPP_TYPE_RGB, DPU_CLK_CTRL_RGB1),
> +	SSPP_BLK("sspp_6", SSPP_RGB2, 0x18000, 0x150, RGB_MSM8996_MSK,
> +		sdm845_dma_sblk_2, 9, SSPP_TYPE_RGB, DPU_CLK_CTRL_RGB2),
> +	SSPP_BLK("sspp_7", SSPP_RGB3, 0x1a000, 0x150, RGB_MSM8996_MSK,
> +		sdm845_dma_sblk_3, 13, SSPP_TYPE_RGB, DPU_CLK_CTRL_RGB3),
> +	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x150, DMA_MSM8996_MASK,
> +		sdm845_dma_sblk_0, 2, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
> +	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x150, DMA_MSM8996_MASK,
> +		sdm845_dma_sblk_1, 10, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),

We must have cursor planes here. Otherwise there will be no hardware 
cursor. On newer platforms we emulate them using DMA SSPPs. On msm8996 
there were two special cursor planes (which supported just SRC, nothing 
more). Let's have them here, unless there are issues with them.

> +};
> +
>   static const struct dpu_sspp_cfg msm8998_sspp[] = {
>   	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x184, VIG_MSM8998_MASK,
>   		msm8998_vig_sblk_0, 0,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),

[skipped the rest]


-- 
With best wishes
Dmitry
