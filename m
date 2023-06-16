Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 647AC733C21
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Jun 2023 00:12:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233622AbjFPWM4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Jun 2023 18:12:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233378AbjFPWM4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Jun 2023 18:12:56 -0400
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [5.144.164.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53724119
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jun 2023 15:12:52 -0700 (PDT)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 169F840F38;
        Sat, 17 Jun 2023 00:12:50 +0200 (CEST)
Date:   Sat, 17 Jun 2023 00:12:48 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH v3 17/19] drm/msm/dpu: inline INTF_BLK and
 INTF_BLK_DSI_TE macros
Message-ID: <vpuwgjbgfau6fwn3etg3hyoo44yn4n4xo7hzbe3kfir4ih2tgp@rmutsfjobrub>
References: <20230616100317.500687-1-dmitry.baryshkov@linaro.org>
 <20230616100317.500687-18-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230616100317.500687-18-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-06-16 13:03:15, Dmitry Baryshkov wrote:
> To simplify making changes to the hardware block definitions, expand
> corresponding macros. This way making all the changes are more obvious
> and visible in the source files.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Looks good but I am not sure how much it is worth to review this (versus
checking your script and rerunning it to see if I get the same results),
considering that there are quite some conflicts with your interrupt
rework.  In what order to you intend to land that?

> ---
>  .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   |  52 ++++++--
>  .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    |  53 ++++++--
>  .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    |  55 ++++++--
>  .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   |  82 +++++++++---
>  .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    |  55 ++++++--
>  .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    |  28 +++-
>  .../msm/disp/dpu1/catalog/dpu_6_3_sm6115.h    |  15 ++-
>  .../msm/disp/dpu1/catalog/dpu_6_4_sm6350.h    |  28 +++-
>  .../msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h   |  15 ++-
>  .../msm/disp/dpu1/catalog/dpu_6_9_sm6375.h    |  15 ++-
>  .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    |  55 ++++++--
>  .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    |  41 ++++--
>  .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  | 120 +++++++++++++-----
>  .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    |  55 ++++++--
>  .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    |  55 ++++++--
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  30 -----
>  16 files changed, 545 insertions(+), 209 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> index a71a6cd532c0..d78cedd35c01 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> @@ -243,18 +243,46 @@ static const struct dpu_dspp_cfg msm8998_dspp[] = {
>  };
>  
>  static const struct dpu_intf_cfg msm8998_intf[] = {
> -	INTF_BLK("intf_0", INTF_0, 0x6a000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 21, INTF_SDM845_MASK,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
> -	INTF_BLK("intf_1", INTF_1, 0x6a800, 0x280, INTF_DSI, MSM_DSI_CONTROLLER_0, 21, INTF_SDM845_MASK,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27)),
> -	INTF_BLK("intf_2", INTF_2, 0x6b000, 0x280, INTF_DSI, MSM_DSI_CONTROLLER_1, 21, INTF_SDM845_MASK,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29)),
> -	INTF_BLK("intf_3", INTF_3, 0x6b800, 0x280, INTF_HDMI, 0, 21, INTF_SDM845_MASK,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31)),
> +	{
> +		.name = "intf_0", .id = INTF_0,
> +		.base = 0x6a000, .len = 0x280,
> +		.features = INTF_SDM845_MASK,
> +		.type = INTF_DP,
> +		.controller_id = MSM_DP_CONTROLLER_0,
> +		.prog_fetch_lines_worst_case = 21,
> +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
> +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25),
> +		.intr_tear_rd_ptr = -1,
> +	}, {
> +		.name = "intf_1", .id = INTF_1,
> +		.base = 0x6a800, .len = 0x280,
> +		.features = INTF_SDM845_MASK,
> +		.type = INTF_DSI,
> +		.controller_id = MSM_DSI_CONTROLLER_0,
> +		.prog_fetch_lines_worst_case = 21,
> +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
> +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
> +		.intr_tear_rd_ptr = -1,
> +	}, {
> +		.name = "intf_2", .id = INTF_2,
> +		.base = 0x6b000, .len = 0x280,
> +		.features = INTF_SDM845_MASK,
> +		.type = INTF_DSI,
> +		.controller_id = MSM_DSI_CONTROLLER_1,
> +		.prog_fetch_lines_worst_case = 21,
> +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
> +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
> +		.intr_tear_rd_ptr = -1,
> +	}, {
> +		.name = "intf_3", .id = INTF_3,
> +		.base = 0x6b800, .len = 0x280,
> +		.features = INTF_SDM845_MASK,
> +		.type = INTF_HDMI,
> +		.prog_fetch_lines_worst_case = 21,
> +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
> +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31),
> +		.intr_tear_rd_ptr = -1,
> +	},
>  };
>  
>  static const struct dpu_perf_cfg msm8998_perf_data = {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> index e1bdc0cc45cd..de26f469ebb1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> @@ -257,18 +257,47 @@ static const struct dpu_dsc_cfg sdm845_dsc[] = {
>  };
>  
>  static const struct dpu_intf_cfg sdm845_intf[] = {
> -	INTF_BLK("intf_0", INTF_0, 0x6a000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SDM845_MASK,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
> -	INTF_BLK("intf_1", INTF_1, 0x6a800, 0x280, INTF_DSI, MSM_DSI_CONTROLLER_0, 24, INTF_SDM845_MASK,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27)),
> -	INTF_BLK("intf_2", INTF_2, 0x6b000, 0x280, INTF_DSI, MSM_DSI_CONTROLLER_1, 24, INTF_SDM845_MASK,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29)),
> -	INTF_BLK("intf_3", INTF_3, 0x6b800, 0x280, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SDM845_MASK,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31)),
> +	{
> +		.name = "intf_0", .id = INTF_0,
> +		.base = 0x6a000, .len = 0x280,
> +		.features = INTF_SDM845_MASK,
> +		.type = INTF_DP,
> +		.controller_id = MSM_DP_CONTROLLER_0,
> +		.prog_fetch_lines_worst_case = 24,
> +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
> +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25),
> +		.intr_tear_rd_ptr = -1,
> +	}, {
> +		.name = "intf_1", .id = INTF_1,
> +		.base = 0x6a800, .len = 0x280,
> +		.features = INTF_SDM845_MASK,
> +		.type = INTF_DSI,
> +		.controller_id = MSM_DSI_CONTROLLER_0,
> +		.prog_fetch_lines_worst_case = 24,
> +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
> +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
> +		.intr_tear_rd_ptr = -1,
> +	}, {
> +		.name = "intf_2", .id = INTF_2,
> +		.base = 0x6b000, .len = 0x280,
> +		.features = INTF_SDM845_MASK,
> +		.type = INTF_DSI,
> +		.controller_id = MSM_DSI_CONTROLLER_1,
> +		.prog_fetch_lines_worst_case = 24,
> +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
> +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
> +		.intr_tear_rd_ptr = -1,
> +	}, {
> +		.name = "intf_3", .id = INTF_3,
> +		.base = 0x6b800, .len = 0x280,
> +		.features = INTF_SDM845_MASK,
> +		.type = INTF_DP,
> +		.controller_id = MSM_DP_CONTROLLER_1,
> +		.prog_fetch_lines_worst_case = 24,
> +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
> +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31),
> +		.intr_tear_rd_ptr = -1,
> +	},
>  };
>  
>  static const struct dpu_perf_cfg sdm845_perf_data = {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> index 5f20272cd5aa..c8c702e4f045 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> @@ -306,20 +306,47 @@ static const struct dpu_dsc_cfg sm8150_dsc[] = {
>  };
>  
>  static const struct dpu_intf_cfg sm8150_intf[] = {
> -	INTF_BLK("intf_0", INTF_0, 0x6a000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7180_MASK,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
> -	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x6a800, 0x2bc, INTF_DSI, MSM_DSI_CONTROLLER_0, 24, INTF_SC7180_MASK,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
> -			DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2)),
> -	INTF_BLK_DSI_TE("intf_2", INTF_2, 0x6b000, 0x2bc, INTF_DSI, MSM_DSI_CONTROLLER_1, 24, INTF_SC7180_MASK,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
> -			DPU_IRQ_IDX(MDP_INTF2_TEAR_INTR, 2)),
> -	INTF_BLK("intf_3", INTF_3, 0x6b800, 0x280, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7180_MASK,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31)),
> +	{
> +		.name = "intf_0", .id = INTF_0,
> +		.base = 0x6a000, .len = 0x280,
> +		.features = INTF_SC7180_MASK,
> +		.type = INTF_DP,
> +		.controller_id = MSM_DP_CONTROLLER_0,
> +		.prog_fetch_lines_worst_case = 24,
> +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
> +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25),
> +		.intr_tear_rd_ptr = -1,
> +	}, {
> +		.name = "intf_1", .id = INTF_1,
> +		.base = 0x6a800, .len = 0x2bc,
> +		.features = INTF_SC7180_MASK,
> +		.type = INTF_DSI,
> +		.controller_id = MSM_DSI_CONTROLLER_0,
> +		.prog_fetch_lines_worst_case = 24,
> +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
> +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
> +		.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2),
> +	}, {
> +		.name = "intf_2", .id = INTF_2,
> +		.base = 0x6b000, .len = 0x2bc,
> +		.features = INTF_SC7180_MASK,
> +		.type = INTF_DSI,
> +		.controller_id = MSM_DSI_CONTROLLER_1,
> +		.prog_fetch_lines_worst_case = 24,
> +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
> +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
> +		.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF2_TEAR_INTR, 2),
> +	}, {
> +		.name = "intf_3", .id = INTF_3,
> +		.base = 0x6b800, .len = 0x280,
> +		.features = INTF_SC7180_MASK,
> +		.type = INTF_DP,
> +		.controller_id = MSM_DP_CONTROLLER_1,
> +		.prog_fetch_lines_worst_case = 24,
> +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
> +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31),
> +		.intr_tear_rd_ptr = -1,
> +	},
>  };
>  
>  static const struct dpu_perf_cfg sm8150_perf_data = {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> index 7439f0279a3c..11bf4cec0f95 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> @@ -313,27 +313,69 @@ static const struct dpu_dsc_cfg sc8180x_dsc[] = {
>  };
>  
>  static const struct dpu_intf_cfg sc8180x_intf[] = {
> -	INTF_BLK("intf_0", INTF_0, 0x6a000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7180_MASK,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
> -	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x6a800, 0x2bc, INTF_DSI, MSM_DSI_CONTROLLER_0, 24, INTF_SC7180_MASK,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
> -			DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2)),
> -	INTF_BLK_DSI_TE("intf_2", INTF_2, 0x6b000, 0x2bc, INTF_DSI, MSM_DSI_CONTROLLER_1, 24, INTF_SC7180_MASK,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
> -			DPU_IRQ_IDX(MDP_INTF2_TEAR_INTR, 2)),
> +	{
> +		.name = "intf_0", .id = INTF_0,
> +		.base = 0x6a000, .len = 0x280,
> +		.features = INTF_SC7180_MASK,
> +		.type = INTF_DP,
> +		.controller_id = MSM_DP_CONTROLLER_0,
> +		.prog_fetch_lines_worst_case = 24,
> +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
> +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25),
> +		.intr_tear_rd_ptr = -1,
> +	}, {
> +		.name = "intf_1", .id = INTF_1,
> +		.base = 0x6a800, .len = 0x2bc,
> +		.features = INTF_SC7180_MASK,
> +		.type = INTF_DSI,
> +		.controller_id = MSM_DSI_CONTROLLER_0,
> +		.prog_fetch_lines_worst_case = 24,
> +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
> +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
> +		.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2),
> +	}, {
> +		.name = "intf_2", .id = INTF_2,
> +		.base = 0x6b000, .len = 0x2bc,
> +		.features = INTF_SC7180_MASK,
> +		.type = INTF_DSI,
> +		.controller_id = MSM_DSI_CONTROLLER_1,
> +		.prog_fetch_lines_worst_case = 24,
> +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
> +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
> +		.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF2_TEAR_INTR, 2),
> +	},
>  	/* INTF_3 is for MST, wired to INTF_DP 0 and 1, use dummy index until this is supported */
> -	INTF_BLK("intf_3", INTF_3, 0x6b800, 0x280, INTF_DP, 999, 24, INTF_SC7180_MASK,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31)),
> -	INTF_BLK("intf_4", INTF_4, 0x6c000, 0x280, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7180_MASK,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 20),
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 21)),
> -	INTF_BLK("intf_5", INTF_5, 0x6c800, 0x280, INTF_DP, MSM_DP_CONTROLLER_2, 24, INTF_SC7180_MASK,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 22),
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 23)),
> +	{
> +		.name = "intf_3", .id = INTF_3,
> +		.base = 0x6b800, .len = 0x280,
> +		.features = INTF_SC7180_MASK,
> +		.type = INTF_DP,
> +		.controller_id = 999,
> +		.prog_fetch_lines_worst_case = 24,
> +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
> +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31),
> +		.intr_tear_rd_ptr = -1,
> +	}, {
> +		.name = "intf_4", .id = INTF_4,
> +		.base = 0x6c000, .len = 0x280,
> +		.features = INTF_SC7180_MASK,
> +		.type = INTF_DP,
> +		.controller_id = MSM_DP_CONTROLLER_1,
> +		.prog_fetch_lines_worst_case = 24,
> +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 20),
> +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 21),
> +		.intr_tear_rd_ptr = -1,
> +	}, {
> +		.name = "intf_5", .id = INTF_5,
> +		.base = 0x6c800, .len = 0x280,
> +		.features = INTF_SC7180_MASK,
> +		.type = INTF_DP,
> +		.controller_id = MSM_DP_CONTROLLER_2,
> +		.prog_fetch_lines_worst_case = 24,
> +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 22),
> +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 23),
> +		.intr_tear_rd_ptr = -1,
> +	},
>  };
>  
>  static const struct dpu_perf_cfg sc8180x_perf_data = {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> index 60e71cbc5e27..bf35b5bf0cd1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> @@ -306,20 +306,47 @@ static const struct dpu_dsc_cfg sm8250_dsc[] = {
>  };
>  
>  static const struct dpu_intf_cfg sm8250_intf[] = {
> -	INTF_BLK("intf_0", INTF_0, 0x6a000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7180_MASK,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
> -	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x6a800, 0x2c0, INTF_DSI, MSM_DSI_CONTROLLER_0, 24, INTF_SC7180_MASK,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
> -			DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2)),
> -	INTF_BLK_DSI_TE("intf_2", INTF_2, 0x6b000, 0x2c0, INTF_DSI, MSM_DSI_CONTROLLER_1, 24, INTF_SC7180_MASK,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
> -			DPU_IRQ_IDX(MDP_INTF2_TEAR_INTR, 2)),
> -	INTF_BLK("intf_3", INTF_3, 0x6b800, 0x280, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7180_MASK,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31)),
> +	{
> +		.name = "intf_0", .id = INTF_0,
> +		.base = 0x6a000, .len = 0x280,
> +		.features = INTF_SC7180_MASK,
> +		.type = INTF_DP,
> +		.controller_id = MSM_DP_CONTROLLER_0,
> +		.prog_fetch_lines_worst_case = 24,
> +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
> +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25),
> +		.intr_tear_rd_ptr = -1,
> +	}, {
> +		.name = "intf_1", .id = INTF_1,
> +		.base = 0x6a800, .len = 0x2c0,
> +		.features = INTF_SC7180_MASK,
> +		.type = INTF_DSI,
> +		.controller_id = MSM_DSI_CONTROLLER_0,
> +		.prog_fetch_lines_worst_case = 24,
> +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
> +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
> +		.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2),
> +	}, {
> +		.name = "intf_2", .id = INTF_2,
> +		.base = 0x6b000, .len = 0x2c0,
> +		.features = INTF_SC7180_MASK,
> +		.type = INTF_DSI,
> +		.controller_id = MSM_DSI_CONTROLLER_1,
> +		.prog_fetch_lines_worst_case = 24,
> +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
> +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
> +		.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF2_TEAR_INTR, 2),
> +	}, {
> +		.name = "intf_3", .id = INTF_3,
> +		.base = 0x6b800, .len = 0x280,
> +		.features = INTF_SC7180_MASK,
> +		.type = INTF_DP,
> +		.controller_id = MSM_DP_CONTROLLER_1,
> +		.prog_fetch_lines_worst_case = 24,
> +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
> +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31),
> +		.intr_tear_rd_ptr = -1,
> +	},
>  };
>  
>  static const struct dpu_wb_cfg sm8250_wb[] = {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
> index 904c758a60df..0f59e372cf3e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
> @@ -138,13 +138,27 @@ static const struct dpu_pingpong_cfg sc7180_pp[] = {
>  };
>  
>  static const struct dpu_intf_cfg sc7180_intf[] = {
> -	INTF_BLK("intf_0", INTF_0, 0x6a000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7180_MASK,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
> -	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x6a800, 0x2c0, INTF_DSI, MSM_DSI_CONTROLLER_0, 24, INTF_SC7180_MASK,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
> -			DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2)),
> +	{
> +		.name = "intf_0", .id = INTF_0,
> +		.base = 0x6a000, .len = 0x280,
> +		.features = INTF_SC7180_MASK,
> +		.type = INTF_DP,
> +		.controller_id = MSM_DP_CONTROLLER_0,
> +		.prog_fetch_lines_worst_case = 24,
> +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
> +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25),
> +		.intr_tear_rd_ptr = -1,
> +	}, {
> +		.name = "intf_1", .id = INTF_1,
> +		.base = 0x6a800, .len = 0x2c0,
> +		.features = INTF_SC7180_MASK,
> +		.type = INTF_DSI,
> +		.controller_id = MSM_DSI_CONTROLLER_0,
> +		.prog_fetch_lines_worst_case = 24,
> +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
> +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
> +		.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2),
> +	},
>  };
>  
>  static const struct dpu_wb_cfg sc7180_wb[] = {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
> index 4236cd7317a1..f01eac27f405 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
> @@ -94,10 +94,17 @@ static const struct dpu_pingpong_cfg sm6115_pp[] = {
>  };
>  
>  static const struct dpu_intf_cfg sm6115_intf[] = {
> -	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x6a800, 0x2c0, INTF_DSI, MSM_DSI_CONTROLLER_0, 24, INTF_SC7180_MASK,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
> -			DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2)),
> +	{
> +		.name = "intf_1", .id = INTF_1,
> +		.base = 0x6a800, .len = 0x2c0,
> +		.features = INTF_SC7180_MASK,
> +		.type = INTF_DSI,
> +		.controller_id = MSM_DSI_CONTROLLER_0,
> +		.prog_fetch_lines_worst_case = 24,
> +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
> +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
> +		.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2),
> +	},
>  };
>  
>  static const struct dpu_perf_cfg sm6115_perf_data = {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
> index 82c04d2ce010..df4bf6510123 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
> @@ -155,13 +155,27 @@ static const struct dpu_dsc_cfg sm6350_dsc[] = {
>  };
>  
>  static const struct dpu_intf_cfg sm6350_intf[] = {
> -	INTF_BLK("intf_0", INTF_0, 0x6a000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 35, INTF_SC7180_MASK,
> -		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
> -		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
> -	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x6a800, 0x2c0, INTF_DSI, MSM_DSI_CONTROLLER_0, 35, INTF_SC7180_MASK,
> -		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
> -		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
> -		DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2)),
> +	{
> +		.name = "intf_0", .id = INTF_0,
> +		.base = 0x6a000, .len = 0x280,
> +		.features = INTF_SC7180_MASK,
> +		.type = INTF_DP,
> +		.controller_id = MSM_DP_CONTROLLER_0,
> +		.prog_fetch_lines_worst_case = 35,
> +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
> +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25),
> +		.intr_tear_rd_ptr = -1,
> +	}, {
> +		.name = "intf_1", .id = INTF_1,
> +		.base = 0x6a800, .len = 0x2c0,
> +		.features = INTF_SC7180_MASK,
> +		.type = INTF_DSI,
> +		.controller_id = MSM_DSI_CONTROLLER_0,
> +		.prog_fetch_lines_worst_case = 35,
> +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
> +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
> +		.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2),
> +	},
>  };
>  
>  static const struct dpu_perf_cfg sm6350_perf_data = {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
> index c6bf487e131b..cb486bea6628 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
> @@ -91,10 +91,17 @@ static const struct dpu_pingpong_cfg qcm2290_pp[] = {
>  };
>  
>  static const struct dpu_intf_cfg qcm2290_intf[] = {
> -	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x6a800, 0x2c0, INTF_DSI, MSM_DSI_CONTROLLER_0, 24, INTF_SC7180_MASK,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
> -			DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2)),
> +	{
> +		.name = "intf_1", .id = INTF_1,
> +		.base = 0x6a800, .len = 0x2c0,
> +		.features = INTF_SC7180_MASK,
> +		.type = INTF_DSI,
> +		.controller_id = MSM_DSI_CONTROLLER_0,
> +		.prog_fetch_lines_worst_case = 24,
> +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
> +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
> +		.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2),
> +	},
>  };
>  
>  static const struct dpu_perf_cfg qcm2290_perf_data = {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
> index 97de7a1f52b4..74dc032af7a4 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
> @@ -104,10 +104,17 @@ static const struct dpu_dsc_cfg sm6375_dsc[] = {
>  };
>  
>  static const struct dpu_intf_cfg sm6375_intf[] = {
> -	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x6a800, 0x2c0, INTF_DSI, MSM_DSI_CONTROLLER_0, 24, INTF_SC7180_MASK,
> -		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
> -		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
> -		DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2)),
> +	{
> +		.name = "intf_1", .id = INTF_1,
> +		.base = 0x6a800, .len = 0x2c0,
> +		.features = INTF_SC7180_MASK,
> +		.type = INTF_DSI,
> +		.controller_id = MSM_DSI_CONTROLLER_0,
> +		.prog_fetch_lines_worst_case = 24,
> +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
> +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
> +		.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2),
> +	},
>  };
>  
>  static const struct dpu_perf_cfg sm6375_perf_data = {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> index 108e35cbcd90..d5191a663ae1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> @@ -313,20 +313,47 @@ static const struct dpu_dsc_cfg sm8350_dsc[] = {
>  };
>  
>  static const struct dpu_intf_cfg sm8350_intf[] = {
> -	INTF_BLK("intf_0", INTF_0, 0x34000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
> -	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x35000, 0x2c4, INTF_DSI, MSM_DSI_CONTROLLER_0, 24, INTF_SC7280_MASK,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
> -			DPU_IRQ_IDX(MDP_INTF1_7xxx_TEAR_INTR, 2)),
> -	INTF_BLK_DSI_TE("intf_2", INTF_2, 0x36000, 0x2c4, INTF_DSI, MSM_DSI_CONTROLLER_1, 24, INTF_SC7280_MASK,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
> -			DPU_IRQ_IDX(MDP_INTF2_7xxx_TEAR_INTR, 2)),
> -	INTF_BLK("intf_3", INTF_3, 0x37000, 0x280, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31)),
> +	{
> +		.name = "intf_0", .id = INTF_0,
> +		.base = 0x34000, .len = 0x280,
> +		.features = INTF_SC7280_MASK,
> +		.type = INTF_DP,
> +		.controller_id = MSM_DP_CONTROLLER_0,
> +		.prog_fetch_lines_worst_case = 24,
> +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
> +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25),
> +		.intr_tear_rd_ptr = -1,
> +	}, {
> +		.name = "intf_1", .id = INTF_1,
> +		.base = 0x35000, .len = 0x2c4,
> +		.features = INTF_SC7280_MASK,
> +		.type = INTF_DSI,
> +		.controller_id = MSM_DSI_CONTROLLER_0,
> +		.prog_fetch_lines_worst_case = 24,
> +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
> +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
> +		.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF1_7xxx_TEAR_INTR, 2),
> +	}, {
> +		.name = "intf_2", .id = INTF_2,
> +		.base = 0x36000, .len = 0x2c4,
> +		.features = INTF_SC7280_MASK,
> +		.type = INTF_DSI,
> +		.controller_id = MSM_DSI_CONTROLLER_1,
> +		.prog_fetch_lines_worst_case = 24,
> +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
> +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
> +		.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF2_7xxx_TEAR_INTR, 2),
> +	}, {
> +		.name = "intf_3", .id = INTF_3,
> +		.base = 0x37000, .len = 0x280,
> +		.features = INTF_SC7280_MASK,
> +		.type = INTF_DP,
> +		.controller_id = MSM_DP_CONTROLLER_1,
> +		.prog_fetch_lines_worst_case = 24,
> +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
> +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31),
> +		.intr_tear_rd_ptr = -1,
> +	},
>  };
>  
>  static const struct dpu_perf_cfg sm8350_perf_data = {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> index 7b5c9a77b102..d3a18048972f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> @@ -191,16 +191,37 @@ static const struct dpu_wb_cfg sc7280_wb[] = {
>  };
>  
>  static const struct dpu_intf_cfg sc7280_intf[] = {
> -	INTF_BLK("intf_0", INTF_0, 0x34000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
> -	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x35000, 0x2c4, INTF_DSI, MSM_DSI_CONTROLLER_0, 24, INTF_SC7280_MASK,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
> -			DPU_IRQ_IDX(MDP_INTF1_7xxx_TEAR_INTR, 2)),
> -	INTF_BLK("intf_5", INTF_5, 0x39000, 0x280, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 22),
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 23)),
> +	{
> +		.name = "intf_0", .id = INTF_0,
> +		.base = 0x34000, .len = 0x280,
> +		.features = INTF_SC7280_MASK,
> +		.type = INTF_DP,
> +		.controller_id = MSM_DP_CONTROLLER_0,
> +		.prog_fetch_lines_worst_case = 24,
> +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
> +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25),
> +		.intr_tear_rd_ptr = -1,
> +	}, {
> +		.name = "intf_1", .id = INTF_1,
> +		.base = 0x35000, .len = 0x2c4,
> +		.features = INTF_SC7280_MASK,
> +		.type = INTF_DSI,
> +		.controller_id = MSM_DSI_CONTROLLER_0,
> +		.prog_fetch_lines_worst_case = 24,
> +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
> +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
> +		.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF1_7xxx_TEAR_INTR, 2),
> +	}, {
> +		.name = "intf_5", .id = INTF_5,
> +		.base = 0x39000, .len = 0x280,
> +		.features = INTF_SC7280_MASK,
> +		.type = INTF_DP,
> +		.controller_id = MSM_DP_CONTROLLER_1,
> +		.prog_fetch_lines_worst_case = 24,
> +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 22),
> +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 23),
> +		.intr_tear_rd_ptr = -1,
> +	},
>  };
>  
>  static const struct dpu_perf_cfg sc7280_perf_data = {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> index 062b17dedec7..9f94cc6369dd 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> @@ -328,35 +328,97 @@ static const struct dpu_dsc_cfg sc8280xp_dsc[] = {
>  
>  /* TODO: INTF 3, 8 and 7 are used for MST, marked as INTF_NONE for now */
>  static const struct dpu_intf_cfg sc8280xp_intf[] = {
> -	INTF_BLK("intf_0", INTF_0, 0x34000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
> -	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x35000, 0x300, INTF_DSI, MSM_DSI_CONTROLLER_0, 24, INTF_SC7280_MASK,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
> -			DPU_IRQ_IDX(MDP_INTF1_7xxx_TEAR_INTR, 2)),
> -	INTF_BLK_DSI_TE("intf_2", INTF_2, 0x36000, 0x300, INTF_DSI, MSM_DSI_CONTROLLER_1, 24, INTF_SC7280_MASK,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
> -			DPU_IRQ_IDX(MDP_INTF2_7xxx_TEAR_INTR, 2)),
> -	INTF_BLK("intf_3", INTF_3, 0x37000, 0x280, INTF_NONE, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31)),
> -	INTF_BLK("intf_4", INTF_4, 0x38000, 0x280, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 20),
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 21)),
> -	INTF_BLK("intf_5", INTF_5, 0x39000, 0x280, INTF_DP, MSM_DP_CONTROLLER_3, 24, INTF_SC7280_MASK,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 22),
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 23)),
> -	INTF_BLK("intf_6", INTF_6, 0x3a000, 0x280, INTF_DP, MSM_DP_CONTROLLER_2, 24, INTF_SC7280_MASK,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 16),
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 17)),
> -	INTF_BLK("intf_7", INTF_7, 0x3b000, 0x280, INTF_NONE, MSM_DP_CONTROLLER_2, 24, INTF_SC7280_MASK,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 18),
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 19)),
> -	INTF_BLK("intf_8", INTF_8, 0x3c000, 0x280, INTF_NONE, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13)),
> +	{
> +		.name = "intf_0", .id = INTF_0,
> +		.base = 0x34000, .len = 0x280,
> +		.features = INTF_SC7280_MASK,
> +		.type = INTF_DP,
> +		.controller_id = MSM_DP_CONTROLLER_0,
> +		.prog_fetch_lines_worst_case = 24,
> +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
> +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25),
> +		.intr_tear_rd_ptr = -1,
> +	}, {
> +		.name = "intf_1", .id = INTF_1,
> +		.base = 0x35000, .len = 0x300,
> +		.features = INTF_SC7280_MASK,
> +		.type = INTF_DSI,
> +		.controller_id = MSM_DSI_CONTROLLER_0,
> +		.prog_fetch_lines_worst_case = 24,
> +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
> +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
> +		.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF1_7xxx_TEAR_INTR, 2),
> +	}, {
> +		.name = "intf_2", .id = INTF_2,
> +		.base = 0x36000, .len = 0x300,
> +		.features = INTF_SC7280_MASK,
> +		.type = INTF_DSI,
> +		.controller_id = MSM_DSI_CONTROLLER_1,
> +		.prog_fetch_lines_worst_case = 24,
> +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
> +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
> +		.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF2_7xxx_TEAR_INTR, 2),
> +	}, {
> +		.name = "intf_3", .id = INTF_3,
> +		.base = 0x37000, .len = 0x280,
> +		.features = INTF_SC7280_MASK,
> +		.type = INTF_NONE,
> +		.controller_id = MSM_DP_CONTROLLER_0,
> +		.prog_fetch_lines_worst_case = 24,
> +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
> +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31),
> +		.intr_tear_rd_ptr = -1,
> +	}, {
> +		.name = "intf_4", .id = INTF_4,
> +		.base = 0x38000, .len = 0x280,
> +		.features = INTF_SC7280_MASK,
> +		.type = INTF_DP,
> +		.controller_id = MSM_DP_CONTROLLER_1,
> +		.prog_fetch_lines_worst_case = 24,
> +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 20),
> +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 21),
> +		.intr_tear_rd_ptr = -1,
> +	}, {
> +		.name = "intf_5", .id = INTF_5,
> +		.base = 0x39000, .len = 0x280,
> +		.features = INTF_SC7280_MASK,
> +		.type = INTF_DP,
> +		.controller_id = MSM_DP_CONTROLLER_3,
> +		.prog_fetch_lines_worst_case = 24,
> +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 22),
> +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 23),
> +		.intr_tear_rd_ptr = -1,
> +	}, {
> +		.name = "intf_6", .id = INTF_6,
> +		.base = 0x3a000, .len = 0x280,
> +		.features = INTF_SC7280_MASK,
> +		.type = INTF_DP,
> +		.controller_id = MSM_DP_CONTROLLER_2,
> +		.prog_fetch_lines_worst_case = 24,
> +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 16),
> +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 17),
> +		.intr_tear_rd_ptr = -1,
> +	}, {
> +		.name = "intf_7", .id = INTF_7,
> +		.base = 0x3b000, .len = 0x280,
> +		.features = INTF_SC7280_MASK,
> +		.type = INTF_NONE,
> +		.controller_id = MSM_DP_CONTROLLER_2,
> +		.prog_fetch_lines_worst_case = 24,
> +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 18),
> +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 19),
> +		.intr_tear_rd_ptr = -1,
> +	}, {
> +		.name = "intf_8", .id = INTF_8,
> +		.base = 0x3c000, .len = 0x280,
> +		.features = INTF_SC7280_MASK,
> +		.type = INTF_NONE,
> +		.controller_id = MSM_DP_CONTROLLER_1,
> +		.prog_fetch_lines_worst_case = 24,
> +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
> +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13),
> +		.intr_tear_rd_ptr = -1,
> +	},
>  };
>  
>  static const struct dpu_perf_cfg sc8280xp_perf_data = {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> index d92af1410c3e..517629c4a168 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> @@ -337,20 +337,47 @@ static const struct dpu_dsc_cfg sm8450_dsc[] = {
>  };
>  
>  static const struct dpu_intf_cfg sm8450_intf[] = {
> -	INTF_BLK("intf_0", INTF_0, 0x34000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
> -	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x35000, 0x300, INTF_DSI, MSM_DSI_CONTROLLER_0, 24, INTF_SC7280_MASK,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
> -			DPU_IRQ_IDX(MDP_INTF1_7xxx_TEAR_INTR, 2)),
> -	INTF_BLK_DSI_TE("intf_2", INTF_2, 0x36000, 0x300, INTF_DSI, MSM_DSI_CONTROLLER_1, 24, INTF_SC7280_MASK,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
> -			DPU_IRQ_IDX(MDP_INTF2_7xxx_TEAR_INTR, 2)),
> -	INTF_BLK("intf_3", INTF_3, 0x37000, 0x280, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31)),
> +	{
> +		.name = "intf_0", .id = INTF_0,
> +		.base = 0x34000, .len = 0x280,
> +		.features = INTF_SC7280_MASK,
> +		.type = INTF_DP,
> +		.controller_id = MSM_DP_CONTROLLER_0,
> +		.prog_fetch_lines_worst_case = 24,
> +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
> +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25),
> +		.intr_tear_rd_ptr = -1,
> +	}, {
> +		.name = "intf_1", .id = INTF_1,
> +		.base = 0x35000, .len = 0x300,
> +		.features = INTF_SC7280_MASK,
> +		.type = INTF_DSI,
> +		.controller_id = MSM_DSI_CONTROLLER_0,
> +		.prog_fetch_lines_worst_case = 24,
> +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
> +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
> +		.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF1_7xxx_TEAR_INTR, 2),
> +	}, {
> +		.name = "intf_2", .id = INTF_2,
> +		.base = 0x36000, .len = 0x300,
> +		.features = INTF_SC7280_MASK,
> +		.type = INTF_DSI,
> +		.controller_id = MSM_DSI_CONTROLLER_1,
> +		.prog_fetch_lines_worst_case = 24,
> +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
> +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
> +		.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF2_7xxx_TEAR_INTR, 2),
> +	}, {
> +		.name = "intf_3", .id = INTF_3,
> +		.base = 0x37000, .len = 0x280,
> +		.features = INTF_SC7280_MASK,
> +		.type = INTF_DP,
> +		.controller_id = MSM_DP_CONTROLLER_1,
> +		.prog_fetch_lines_worst_case = 24,
> +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
> +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31),
> +		.intr_tear_rd_ptr = -1,
> +	},
>  };
>  
>  static const struct dpu_perf_cfg sm8450_perf_data = {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> index 32ffb9a9cfc7..ed1d1d4092e8 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> @@ -351,20 +351,47 @@ static const struct dpu_dsc_cfg sm8550_dsc[] = {
>  };
>  
>  static const struct dpu_intf_cfg sm8550_intf[] = {
> -	INTF_BLK("intf_0", INTF_0, 0x34000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
> -	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x35000, 0x300, INTF_DSI, MSM_DSI_CONTROLLER_0, 24, INTF_SC7280_MASK,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
> -			DPU_IRQ_IDX(MDP_INTF1_7xxx_TEAR_INTR, 2)),
> -	INTF_BLK_DSI_TE("intf_2", INTF_2, 0x36000, 0x300, INTF_DSI, MSM_DSI_CONTROLLER_1, 24, INTF_SC7280_MASK,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
> -			DPU_IRQ_IDX(MDP_INTF2_7xxx_TEAR_INTR, 2)),
> -	INTF_BLK("intf_3", INTF_3, 0x37000, 0x280, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31)),
> +	{
> +		.name = "intf_0", .id = INTF_0,
> +		.base = 0x34000, .len = 0x280,
> +		.features = INTF_SC7280_MASK,
> +		.type = INTF_DP,
> +		.controller_id = MSM_DP_CONTROLLER_0,
> +		.prog_fetch_lines_worst_case = 24,
> +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
> +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25),
> +		.intr_tear_rd_ptr = -1,
> +	}, {
> +		.name = "intf_1", .id = INTF_1,
> +		.base = 0x35000, .len = 0x300,
> +		.features = INTF_SC7280_MASK,
> +		.type = INTF_DSI,
> +		.controller_id = MSM_DSI_CONTROLLER_0,
> +		.prog_fetch_lines_worst_case = 24,
> +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
> +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
> +		.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF1_7xxx_TEAR_INTR, 2),
> +	}, {
> +		.name = "intf_2", .id = INTF_2,
> +		.base = 0x36000, .len = 0x300,
> +		.features = INTF_SC7280_MASK,
> +		.type = INTF_DSI,
> +		.controller_id = MSM_DSI_CONTROLLER_1,
> +		.prog_fetch_lines_worst_case = 24,
> +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
> +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
> +		.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF2_7xxx_TEAR_INTR, 2),
> +	}, {
> +		.name = "intf_3", .id = INTF_3,
> +		.base = 0x37000, .len = 0x280,
> +		.features = INTF_SC7280_MASK,
> +		.type = INTF_DP,
> +		.controller_id = MSM_DP_CONTROLLER_1,
> +		.prog_fetch_lines_worst_case = 24,
> +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
> +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31),
> +		.intr_tear_rd_ptr = -1,
> +	},
>  };
>  
>  static const struct dpu_perf_cfg sm8550_perf_data = {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index d2bca1ec0e63..6acd34e61aca 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -463,36 +463,6 @@ static const struct dpu_dsc_sub_blks dsc_sblk_1 = {
>  	.ctl = {.base = 0xF80, .len = 0x10},
>  };
>  
> -/*************************************************************
> - * INTF sub blocks config
> - *************************************************************/
> -#define INTF_BLK(_name, _id, _base, _len, _type, _ctrl_id, _progfetch, _features, _underrun, _vsync) \
> -	{\
> -	.name = _name, .id = _id, \
> -	.base = _base, .len = _len, \
> -	.features = _features, \
> -	.type = _type, \
> -	.controller_id = _ctrl_id, \
> -	.prog_fetch_lines_worst_case = _progfetch, \
> -	.intr_underrun = _underrun, \
> -	.intr_vsync = _vsync, \
> -	.intr_tear_rd_ptr = -1, \
> -	}
> -
> -/* DSI Interface sub-block with TEAR registers (since DPU 5.0.0) */
> -#define INTF_BLK_DSI_TE(_name, _id, _base, _len, _type, _ctrl_id, _progfetch, _features, _underrun, _vsync, _tear_rd_ptr) \
> -	{\
> -	.name = _name, .id = _id, \
> -	.base = _base, .len = _len, \
> -	.features = _features, \

Now that the DSI_TE context is gone here, it might be harder to properly
reapply [1] which added BIT(DPU_INTF_TE) as it's not a global INTF
feature (though it is dependent on the core revision) but only relevant
for the DSI interfaces.

[1]: https://lore.kernel.org/linux-arm-msm/20230522214527.190054-2-dmitry.baryshkov@linaro.org/

- Marijn

> -	.type = _type, \
> -	.controller_id = _ctrl_id, \
> -	.prog_fetch_lines_worst_case = _progfetch, \
> -	.intr_underrun = _underrun, \
> -	.intr_vsync = _vsync, \
> -	.intr_tear_rd_ptr = _tear_rd_ptr, \
> -	}
> -
>  /*************************************************************
>   * VBIF sub blocks config
>   *************************************************************/
> -- 
> 2.39.2
> 
