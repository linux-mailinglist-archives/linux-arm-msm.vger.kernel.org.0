Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53FA773F767
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jun 2023 10:35:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230298AbjF0Ifh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Jun 2023 04:35:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232022AbjF0IfW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Jun 2023 04:35:22 -0400
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it [5.144.164.165])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1656BDD
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jun 2023 01:35:20 -0700 (PDT)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 107001F485;
        Tue, 27 Jun 2023 10:35:19 +0200 (CEST)
Date:   Tue, 27 Jun 2023 10:35:17 +0200
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
Subject: Re: [PATCH v4 16/19] drm/msm/dpu: inline WB_BLK macros
Message-ID: <7brto77qjxoqpqnykaegd2mcthcfpiwsjufhlzqrl3i2eumrjd@noyc6lbbgfxw>
References: <20230619212519.875673-1-dmitry.baryshkov@linaro.org>
 <20230619212519.875673-17-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230619212519.875673-17-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-06-20 00:25:16, Dmitry Baryshkov wrote:
> To simplify making changes to the hardware block definitions, expand
> corresponding macros. This way making all the changes are more obvious
> and visible in the source files.
> 
> Tested-by: Marijn Suijten <marijn.suijten@somainline.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Validated that this incurs no changes by checksumming a stripped
dpu_hw_catalog.o.

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  .../drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h | 14 ++++++++++++--
>  .../drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h | 14 ++++++++++++--
>  .../drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h | 14 ++++++++++++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 18 ------------------
>  4 files changed, 36 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> index c8f4c6326a1a..9148d7da62e4 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> @@ -323,8 +323,18 @@ static const struct dpu_intf_cfg sm8250_intf[] = {
>  };
>  
>  static const struct dpu_wb_cfg sm8250_wb[] = {
> -	WB_BLK("wb_2", WB_2, 0x65000, WB_SM8250_MASK, DPU_CLK_CTRL_WB2, 6,
> -			VBIF_RT, MDP_SSPP_TOP0_INTR, 4096, 4),
> +	{
> +		.name = "wb_2", .id = WB_2,
> +		.base = 0x65000, .len = 0x2c8,
> +		.features = WB_SM8250_MASK,
> +		.format_list = wb2_formats,
> +		.num_formats = ARRAY_SIZE(wb2_formats),
> +		.clk_ctrl = DPU_CLK_CTRL_WB2,
> +		.xin_id = 6,
> +		.vbif_idx = VBIF_RT,
> +		.maxlinewidth = 4096,
> +		.intr_wb_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 4),
> +	},
>  };
>  
>  static const struct dpu_perf_cfg sm8250_perf_data = {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
> index d7d117e3af36..904c758a60df 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
> @@ -148,8 +148,18 @@ static const struct dpu_intf_cfg sc7180_intf[] = {
>  };
>  
>  static const struct dpu_wb_cfg sc7180_wb[] = {
> -	WB_BLK("wb_2", WB_2, 0x65000, WB_SM8250_MASK, DPU_CLK_CTRL_WB2, 6,
> -			VBIF_RT, MDP_SSPP_TOP0_INTR, 4096, 4),
> +	{
> +		.name = "wb_2", .id = WB_2,
> +		.base = 0x65000, .len = 0x2c8,
> +		.features = WB_SM8250_MASK,
> +		.format_list = wb2_formats,
> +		.num_formats = ARRAY_SIZE(wb2_formats),
> +		.clk_ctrl = DPU_CLK_CTRL_WB2,
> +		.xin_id = 6,
> +		.vbif_idx = VBIF_RT,
> +		.maxlinewidth = 4096,
> +		.intr_wb_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 4),
> +	},
>  };
>  
>  static const struct dpu_perf_cfg sc7180_perf_data = {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> index 3b67010f336b..7b5c9a77b102 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> @@ -176,8 +176,18 @@ static const struct dpu_dsc_cfg sc7280_dsc[] = {
>  };
>  
>  static const struct dpu_wb_cfg sc7280_wb[] = {
> -	WB_BLK("wb_2", WB_2, 0x65000, WB_SM8250_MASK, DPU_CLK_CTRL_WB2, 6,
> -			VBIF_RT, MDP_SSPP_TOP0_INTR, 4096, 4),
> +	{
> +		.name = "wb_2", .id = WB_2,
> +		.base = 0x65000, .len = 0x2c8,
> +		.features = WB_SM8250_MASK,
> +		.format_list = wb2_formats,
> +		.num_formats = ARRAY_SIZE(wb2_formats),
> +		.clk_ctrl = DPU_CLK_CTRL_WB2,
> +		.xin_id = 6,
> +		.vbif_idx = VBIF_RT,
> +		.maxlinewidth = 4096,
> +		.intr_wb_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 4),
> +	},
>  };
>  
>  static const struct dpu_intf_cfg sc7280_intf[] = {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 3ea63ca358a4..d2bca1ec0e63 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -493,24 +493,6 @@ static const struct dpu_dsc_sub_blks dsc_sblk_1 = {
>  	.intr_tear_rd_ptr = _tear_rd_ptr, \
>  	}
>  
> -/*************************************************************
> - * Writeback blocks config
> - *************************************************************/
> -#define WB_BLK(_name, _id, _base, _features, _clk_ctrl, \
> -		__xin_id, vbif_id, _reg, _max_linewidth, _wb_done_bit) \
> -	{ \
> -	.name = _name, .id = _id, \
> -	.base = _base, .len = 0x2c8, \
> -	.features = _features, \
> -	.format_list = wb2_formats, \
> -	.num_formats = ARRAY_SIZE(wb2_formats), \
> -	.clk_ctrl = _clk_ctrl, \
> -	.xin_id = __xin_id, \
> -	.vbif_idx = vbif_id, \
> -	.maxlinewidth = _max_linewidth, \
> -	.intr_wb_done = DPU_IRQ_IDX(_reg, _wb_done_bit) \
> -	}
> -
>  /*************************************************************
>   * VBIF sub blocks config
>   *************************************************************/
> -- 
> 2.39.2
> 
