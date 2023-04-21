Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E28E6EA4E4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Apr 2023 09:34:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229650AbjDUHe4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Apr 2023 03:34:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231239AbjDUHeq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Apr 2023 03:34:46 -0400
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it [IPv6:2001:4b7a:2000:18::168])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58D921718
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Apr 2023 00:34:24 -0700 (PDT)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id A72C03F793;
        Fri, 21 Apr 2023 09:34:21 +0200 (CEST)
Date:   Fri, 21 Apr 2023 09:34:20 +0200
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
Subject: Re: [PATCH v2 1/2] drm/msm/dpu: drop the regdma configuration
Message-ID: <7nmiqq3ntsrlqs6x25fbvptsrs2vosc5wopbg6cx5re2n7eniy@nqicfx5gndkc>
References: <20230420222558.1208887-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230420222558.1208887-1-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-04-21 01:25:57, Dmitry Baryshkov wrote:
> The regdma is currently not used by the current driver. We have no way
> to practically verify that the regdma is described correctly. Drop it
> now.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   |  1 -
>  .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    |  2 -
>  .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    |  2 -
>  .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   |  2 -
>  .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    |  2 -
>  .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    |  2 -
>  .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    |  2 -
>  .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  |  2 -
>  .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    |  2 -
>  .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    |  2 -
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 40 -------------------
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    | 18 ---------
>  12 files changed, 77 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> index 2b3ae84057df..02e9b26b49b0 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> @@ -195,7 +195,6 @@ const struct dpu_mdss_cfg dpu_msm8998_cfg = {
>  	.intf = msm8998_intf,
>  	.vbif_count = ARRAY_SIZE(msm8998_vbif),
>  	.vbif = msm8998_vbif,
> -	.reg_dma_count = 0,
>  	.perf = &msm8998_perf_data,
>  	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
>  		     BIT(MDP_SSPP_TOP0_INTR2) | \
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> index ceca741e93c9..63009435e258 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> @@ -193,8 +193,6 @@ const struct dpu_mdss_cfg dpu_sdm845_cfg = {
>  	.intf = sdm845_intf,
>  	.vbif_count = ARRAY_SIZE(sdm845_vbif),
>  	.vbif = sdm845_vbif,
> -	.reg_dma_count = 1,
> -	.dma_cfg = &sdm845_regdma,
>  	.perf = &sdm845_perf_data,
>  	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
>  		     BIT(MDP_SSPP_TOP0_INTR2) | \
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> index 282d410269ff..e17398f98734 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> @@ -220,8 +220,6 @@ const struct dpu_mdss_cfg dpu_sm8150_cfg = {
>  	.intf = sm8150_intf,
>  	.vbif_count = ARRAY_SIZE(sdm845_vbif),
>  	.vbif = sdm845_vbif,
> -	.reg_dma_count = 1,
> -	.dma_cfg = &sm8150_regdma,
>  	.perf = &sm8150_perf_data,
>  	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
>  		     BIT(MDP_SSPP_TOP0_INTR2) | \
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> index c57400265f28..d32f939e9c00 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> @@ -198,8 +198,6 @@ const struct dpu_mdss_cfg dpu_sc8180x_cfg = {
>  	.intf = sc8180x_intf,
>  	.vbif_count = ARRAY_SIZE(sdm845_vbif),
>  	.vbif = sdm845_vbif,
> -	.reg_dma_count = 1,
> -	.dma_cfg = &sm8150_regdma,
>  	.perf = &sc8180x_perf_data,
>  	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
>  		     BIT(MDP_SSPP_TOP0_INTR2) | \
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> index 2c40229ea515..f49fc1690b71 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> @@ -228,8 +228,6 @@ const struct dpu_mdss_cfg dpu_sm8250_cfg = {
>  	.vbif = sdm845_vbif,
>  	.wb_count = ARRAY_SIZE(sm8250_wb),
>  	.wb = sm8250_wb,
> -	.reg_dma_count = 1,
> -	.dma_cfg = &sm8250_regdma,
>  	.perf = &sm8250_perf_data,
>  	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
>  		     BIT(MDP_SSPP_TOP0_INTR2) | \
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
> index 8799ed757119..0a273ba8cf4f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
> @@ -143,8 +143,6 @@ const struct dpu_mdss_cfg dpu_sc7180_cfg = {
>  	.wb = sc7180_wb,
>  	.vbif_count = ARRAY_SIZE(sdm845_vbif),
>  	.vbif = sdm845_vbif,
> -	.reg_dma_count = 1,
> -	.dma_cfg = &sdm845_regdma,
>  	.perf = &sc7180_perf_data,
>  	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
>  		     BIT(MDP_SSPP_TOP0_INTR2) | \
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> index ca107ca8de46..865dc51d0fe5 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> @@ -211,8 +211,6 @@ const struct dpu_mdss_cfg dpu_sm8350_cfg = {
>  	.intf = sm8350_intf,
>  	.vbif_count = ARRAY_SIZE(sdm845_vbif),
>  	.vbif = sdm845_vbif,
> -	.reg_dma_count = 1,
> -	.dma_cfg = &sm8350_regdma,
>  	.perf = &sm8350_perf_data,
>  	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
>  		     BIT(MDP_SSPP_TOP0_INTR2) | \
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> index 9aab110b8c44..1ac7ad2ba0da 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> @@ -202,8 +202,6 @@ const struct dpu_mdss_cfg dpu_sc8280xp_cfg = {
>  	.intf = sc8280xp_intf,
>  	.vbif_count = ARRAY_SIZE(sdm845_vbif),
>  	.vbif = sdm845_vbif,
> -	.reg_dma_count = 1,
> -	.dma_cfg = &sc8280xp_regdma,
>  	.perf = &sc8280xp_perf_data,
>  	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
>  		     BIT(MDP_SSPP_TOP0_INTR2) | \
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> index 02a259b6b426..41c326fc3792 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> @@ -219,8 +219,6 @@ const struct dpu_mdss_cfg dpu_sm8450_cfg = {
>  	.intf = sm8450_intf,
>  	.vbif_count = ARRAY_SIZE(sdm845_vbif),
>  	.vbif = sdm845_vbif,
> -	.reg_dma_count = 1,
> -	.dma_cfg = &sm8450_regdma,
>  	.perf = &sm8450_perf_data,
>  	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
>  		     BIT(MDP_SSPP_TOP0_INTR2) | \
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> index 9e403034093f..e60ebb6242e3 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> @@ -224,8 +224,6 @@ const struct dpu_mdss_cfg dpu_sm8550_cfg = {
>  	.intf = sm8550_intf,
>  	.vbif_count = ARRAY_SIZE(sdm845_vbif),
>  	.vbif = sdm845_vbif,
> -	.reg_dma_count = 1,
> -	.dma_cfg = &sm8450_regdma,
>  	.perf = &sm8550_perf_data,
>  	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
>  		     BIT(MDP_SSPP_TOP0_INTR2) | \
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 03f162af1a50..57b3c495aeb5 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -650,46 +650,6 @@ static const struct dpu_vbif_cfg sdm845_vbif[] = {
>  	},
>  };
>  
> -static const struct dpu_reg_dma_cfg sc8280xp_regdma = {
> -	.base = 0x0,
> -	.version = 0x00020000,
> -	.trigger_sel_off = 0x119c,
> -	.xin_id = 7,
> -	.clk_ctrl = DPU_CLK_CTRL_REG_DMA,

It is fine to keep these in the mdp .clk_ctrls array for now, right?

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> -};
> -
> -static const struct dpu_reg_dma_cfg sdm845_regdma = {
> -	.base = 0x0, .version = 0x1, .trigger_sel_off = 0x119c
> -};
> -
> -static const struct dpu_reg_dma_cfg sm8150_regdma = {
> -	.base = 0x0, .version = 0x00010001, .trigger_sel_off = 0x119c
> -};
> -
> -static const struct dpu_reg_dma_cfg sm8250_regdma = {
> -	.base = 0x0,
> -	.version = 0x00010002,
> -	.trigger_sel_off = 0x119c,
> -	.xin_id = 7,
> -	.clk_ctrl = DPU_CLK_CTRL_REG_DMA,
> -};
> -
> -static const struct dpu_reg_dma_cfg sm8350_regdma = {
> -	.base = 0x400,
> -	.version = 0x00020000,
> -	.trigger_sel_off = 0x119c,
> -	.xin_id = 7,
> -	.clk_ctrl = DPU_CLK_CTRL_REG_DMA,
> -};
> -
> -static const struct dpu_reg_dma_cfg sm8450_regdma = {
> -	.base = 0x0,
> -	.version = 0x00020000,
> -	.trigger_sel_off = 0x119c,
> -	.xin_id = 7,
> -	.clk_ctrl = DPU_CLK_CTRL_REG_DMA,
> -};
> -
>  /*************************************************************
>   * PERF data config
>   *************************************************************/
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 71584cd56fd7..8d62c21b051a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -720,21 +720,6 @@ struct dpu_vbif_cfg {
>  	u32 memtype_count;
>  	u32 memtype[MAX_XIN_COUNT];
>  };
> -/**
> - * struct dpu_reg_dma_cfg - information of lut dma blocks
> - * @id                 enum identifying this block
> - * @base               register offset of this block
> - * @features           bit mask identifying sub-blocks/features
> - * @version            version of lutdma hw block
> - * @trigger_sel_off    offset to trigger select registers of lutdma
> - */
> -struct dpu_reg_dma_cfg {
> -	DPU_HW_BLK_INFO;
> -	u32 version;
> -	u32 trigger_sel_off;
> -	u32 xin_id;
> -	enum dpu_clk_ctrl_type clk_ctrl;
> -};
>  
>  /**
>   * Define CDP use cases
> @@ -850,9 +835,6 @@ struct dpu_mdss_cfg {
>  	u32 wb_count;
>  	const struct dpu_wb_cfg *wb;
>  
> -	u32 reg_dma_count;
> -	const struct dpu_reg_dma_cfg *dma_cfg;
> -
>  	u32 ad_count;
>  
>  	u32 dspp_count;
> -- 
> 2.39.2
> 
