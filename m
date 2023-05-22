Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C03B70CDC0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 May 2023 00:21:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234670AbjEVWVk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 May 2023 18:21:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234672AbjEVWV2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 May 2023 18:21:28 -0400
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it [IPv6:2001:4b7a:2000:18::166])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA44CBF
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 May 2023 15:21:25 -0700 (PDT)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 064833EED9;
        Tue, 23 May 2023 00:21:23 +0200 (CEST)
Date:   Tue, 23 May 2023 00:21:22 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 6/6] drm/msm/dpu: drop compatibility INTR defines
Message-ID: <jvxfqncbc5y7tbcuitpgyjjiopg4j4umwoahqkb2osh77juezu@myhreiqafux2>
References: <20230522214527.190054-1-dmitry.baryshkov@linaro.org>
 <20230522214527.190054-7-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230522214527.190054-7-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-05-23 00:45:27, Dmitry Baryshkov wrote:
> While reworking interrupts masks, it was easier to keep old
> MDP_INTFn_7xxx_INTR and MDP_INTFn_7xxx_TEAR_INTR symbols. Now it is time
> to drop them and use unified symbol names.
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h  |  4 ++--
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h  |  2 +-
>  .../drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h    |  4 ++--
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h  |  4 ++--
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h  |  4 ++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h   | 13 -------------
>  6 files changed, 9 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> index 649784aa6567..df88e3f2a548 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> @@ -161,11 +161,11 @@ static const struct dpu_intf_cfg sm8350_intf[] = {
>  	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x35000, 0x2c4, INTF_DSI, 0, 24, INTF_SC7280_MASK,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
> -			DPU_IRQ_IDX(MDP_INTF1_7xxx_TEAR_INTR, 2)),
> +			DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2)),
>  	INTF_BLK_DSI_TE("intf_2", INTF_2, 0x36000, 0x2c4, INTF_DSI, 1, 24, INTF_SC7280_MASK,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
> -			DPU_IRQ_IDX(MDP_INTF2_7xxx_TEAR_INTR, 2)),
> +			DPU_IRQ_IDX(MDP_INTF2_TEAR_INTR, 2)),
>  	INTF_BLK("intf_3", INTF_3, 0x37000, 0x280, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31)),
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> index 1e87c7f4775d..4d9936d41464 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> @@ -107,7 +107,7 @@ static const struct dpu_intf_cfg sc7280_intf[] = {
>  	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x35000, 0x2c4, INTF_DSI, 0, 24, INTF_SC7280_MASK,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
> -			DPU_IRQ_IDX(MDP_INTF1_7xxx_TEAR_INTR, 2)),
> +			DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2)),
>  	INTF_BLK("intf_5", INTF_5, 0x39000, 0x280, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 22),
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 23)),
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> index 3082657f06f2..65fa65b954db 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> @@ -151,11 +151,11 @@ static const struct dpu_intf_cfg sc8280xp_intf[] = {
>  	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x35000, 0x300, INTF_DSI, 0, 24, INTF_SC7280_MASK,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
> -			DPU_IRQ_IDX(MDP_INTF1_7xxx_TEAR_INTR, 2)),
> +			DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2)),
>  	INTF_BLK_DSI_TE("intf_2", INTF_2, 0x36000, 0x300, INTF_DSI, 1, 24, INTF_SC7280_MASK,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
> -			DPU_IRQ_IDX(MDP_INTF2_7xxx_TEAR_INTR, 2)),
> +			DPU_IRQ_IDX(MDP_INTF2_TEAR_INTR, 2)),
>  	INTF_BLK("intf_3", INTF_3, 0x37000, 0x280, INTF_NONE, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31)),
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> index ca5b82bc8322..b8158ed94845 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> @@ -169,11 +169,11 @@ static const struct dpu_intf_cfg sm8450_intf[] = {
>  	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x35000, 0x300, INTF_DSI, 0, 24, INTF_SC7280_MASK,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
> -			DPU_IRQ_IDX(MDP_INTF1_7xxx_TEAR_INTR, 2)),
> +			DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2)),
>  	INTF_BLK_DSI_TE("intf_2", INTF_2, 0x36000, 0x300, INTF_DSI, 1, 24, INTF_SC7280_MASK,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
> -			DPU_IRQ_IDX(MDP_INTF2_7xxx_TEAR_INTR, 2)),
> +			DPU_IRQ_IDX(MDP_INTF2_TEAR_INTR, 2)),
>  	INTF_BLK("intf_3", INTF_3, 0x37000, 0x280, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31)),
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> index dd7c87f772ea..6a12e882b5b8 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> @@ -173,11 +173,11 @@ static const struct dpu_intf_cfg sm8550_intf[] = {
>  	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x35000, 0x300, INTF_DSI, 0, 24, INTF_SC7280_MASK,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
> -			DPU_IRQ_IDX(MDP_INTF1_7xxx_TEAR_INTR, 2)),
> +			DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2)),
>  	INTF_BLK_DSI_TE("intf_2", INTF_2, 0x36000, 0x300, INTF_DSI, 1, 24, INTF_SC7280_MASK,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
> -			DPU_IRQ_IDX(MDP_INTF2_7xxx_TEAR_INTR, 2)),
> +			DPU_IRQ_IDX(MDP_INTF2_TEAR_INTR, 2)),
>  	INTF_BLK("intf_3", INTF_3, 0x37000, 0x280, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31)),
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> index f0b92c9e3b09..4a46c0900e04 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> @@ -39,19 +39,6 @@ enum dpu_hw_intr_reg {
>  				   intf == INTF_2 ? MDP_INTF2_TEAR_INTR : \
>  				   -1)
>  
> -/* compatibility */
> -#define MDP_INTF0_7xxx_INTR MDP_INTF0_INTR
> -#define MDP_INTF1_7xxx_INTR MDP_INTF1_INTR
> -#define MDP_INTF2_7xxx_INTR MDP_INTF2_INTR
> -#define MDP_INTF3_7xxx_INTR MDP_INTF3_INTR
> -#define MDP_INTF4_7xxx_INTR MDP_INTF4_INTR
> -#define MDP_INTF5_7xxx_INTR MDP_INTF5_INTR
> -#define MDP_INTF6_7xxx_INTR MDP_INTF6_INTR
> -#define MDP_INTF7_7xxx_INTR MDP_INTF7_INTR
> -#define MDP_INTF8_7xxx_INTR MDP_INTF8_INTR
> -#define MDP_INTF1_7xxx_TEAR_INTR MDP_INTF1_TEAR_INTR
> -#define MDP_INTF2_7xxx_TEAR_INTR MDP_INTF2_TEAR_INTR
> -
>  #define DPU_IRQ_IDX(reg_idx, offset)	(reg_idx * 32 + offset)
>  
>  /**
> -- 
> 2.39.2
> 
