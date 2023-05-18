Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E46E1708839
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 May 2023 21:14:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229582AbjERTOo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 May 2023 15:14:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbjERTOo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 May 2023 15:14:44 -0400
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it [5.144.164.165])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07ED7F2
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 May 2023 12:14:39 -0700 (PDT)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 97365203DE;
        Thu, 18 May 2023 21:14:37 +0200 (CEST)
Date:   Thu, 18 May 2023 21:14:36 +0200
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
Subject: Re: [PATCH v2 1/3] drm/msm/dpu: drop SSPP's SRC subblock
Message-ID: <375aoihzzqquma4e53zfl7t6xdamlwyb2t36effy44wooylywp@5oz5jl5t54qo>
References: <20230429012353.2569481-1-dmitry.baryshkov@linaro.org>
 <20230429012353.2569481-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230429012353.2569481-2-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-04-29 04:23:51, Dmitry Baryshkov wrote:
> The src_blk declares a lame copy of main SSPP register space. It's
> offset is always 0. It's length has been fixed to 0x150, while SSPP's

It's -> its, twice.



> length is now correct. Drop the src_blk and access SSPP registers
> without additional subblock lookup.

Note that the block code still calls `dpu_debugfs_create_regset32()` on
"src_blk", do we want to rename that?

> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  14 +-
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  14 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   | 128 ++++++++----------
>  3 files changed, 58 insertions(+), 98 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 03f162af1a50..c3b0db1fdeb2 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -13,7 +13,7 @@
>  #include "dpu_kms.h"
>  
>  #define VIG_BASE_MASK \
> -	(BIT(DPU_SSPP_SRC) | BIT(DPU_SSPP_QOS) |\
> +	(BIT(DPU_SSPP_QOS) |\
>  	BIT(DPU_SSPP_CDP) |\
>  	BIT(DPU_SSPP_TS_PREFILL) | BIT(DPU_SSPP_EXCL_RECT))
>  
> @@ -39,7 +39,7 @@
>  #define VIG_QCM2290_MASK (VIG_BASE_MASK | BIT(DPU_SSPP_QOS_8LVL))
>  
>  #define DMA_MSM8998_MASK \
> -	(BIT(DPU_SSPP_SRC) | BIT(DPU_SSPP_QOS) |\
> +	(BIT(DPU_SSPP_QOS) |\
>  	BIT(DPU_SSPP_TS_PREFILL) | BIT(DPU_SSPP_TS_PREFILL_REC1) |\
>  	BIT(DPU_SSPP_CDP) | BIT(DPU_SSPP_EXCL_RECT))
>  
> @@ -50,7 +50,7 @@
>  	(VIG_SC7280_MASK | BIT(DPU_SSPP_SMART_DMA_V2))
>  
>  #define DMA_SDM845_MASK \
> -	(BIT(DPU_SSPP_SRC) | BIT(DPU_SSPP_QOS) | BIT(DPU_SSPP_QOS_8LVL) |\
> +	(BIT(DPU_SSPP_QOS) | BIT(DPU_SSPP_QOS_8LVL) |\
>  	BIT(DPU_SSPP_TS_PREFILL) | BIT(DPU_SSPP_TS_PREFILL_REC1) |\
>  	BIT(DPU_SSPP_CDP) | BIT(DPU_SSPP_EXCL_RECT))
>  
> @@ -252,8 +252,6 @@ static const uint32_t wb2_formats[] = {
>  	.maxdwnscale = MAX_DOWNSCALE_RATIO, \
>  	.maxupscale = MAX_UPSCALE_RATIO, \
>  	.smart_dma_priority = sdma_pri, \
> -	.src_blk = {.name = STRCAT("sspp_src_", num), \
> -		.id = DPU_SSPP_SRC, .base = 0x00, .len = 0x150,}, \
>  	.scaler_blk = {.name = STRCAT("sspp_scaler", num), \
>  		.id = qseed_ver, \
>  		.base = 0xa00, .len = 0xa0,}, \
> @@ -272,8 +270,6 @@ static const uint32_t wb2_formats[] = {
>  	.maxdwnscale = MAX_DOWNSCALE_RATIO, \
>  	.maxupscale = MAX_UPSCALE_RATIO, \
>  	.smart_dma_priority = sdma_pri, \
> -	.src_blk = {.name = STRCAT("sspp_src_", num), \
> -		.id = DPU_SSPP_SRC, .base = 0x00, .len = 0x150,}, \
>  	.scaler_blk = {.name = STRCAT("sspp_scaler", num), \
>  		.id = qseed_ver, \
>  		.base = 0xa00, .len = 0xa0,}, \
> @@ -292,8 +288,6 @@ static const uint32_t wb2_formats[] = {
>  	.maxdwnscale = SSPP_UNITY_SCALE, \
>  	.maxupscale = SSPP_UNITY_SCALE, \
>  	.smart_dma_priority = sdma_pri, \
> -	.src_blk = {.name = STRCAT("sspp_src_", num), \
> -		.id = DPU_SSPP_SRC, .base = 0x00, .len = 0x150,}, \
>  	.format_list = plane_formats, \
>  	.num_formats = ARRAY_SIZE(plane_formats), \
>  	.virt_format_list = plane_formats, \
> @@ -375,8 +369,6 @@ static const struct dpu_sspp_sub_blks sm8550_dma_sblk_5 = _DMA_SBLK("13", 6);
>  	.maxdwnscale = SSPP_UNITY_SCALE, \
>  	.maxupscale = SSPP_UNITY_SCALE, \
>  	.smart_dma_priority = sdma_pri, \
> -	.src_blk = {.name = STRCAT("sspp_src_", num), \
> -		.id = DPU_SSPP_SRC, .base = 0x00, .len = 0x150,}, \
>  	.format_list = plane_formats_yuv, \
>  	.num_formats = ARRAY_SIZE(plane_formats_yuv), \
>  	.virt_format_list = plane_formats, \
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 71584cd56fd7..3e92c2c66716 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -64,7 +64,6 @@ enum {
>  
>  /**
>   * SSPP sub-blocks/features
> - * @DPU_SSPP_SRC             Src and fetch part of the pipes,
>   * @DPU_SSPP_SCALER_QSEED2,  QSEED2 algorithm support
>   * @DPU_SSPP_SCALER_QSEED3,  QSEED3 alogorithm support
>   * @DPU_SSPP_SCALER_QSEED3LITE,  QSEED3 Lite alogorithm support
> @@ -85,8 +84,7 @@ enum {
>   * @DPU_SSPP_MAX             maximum value
>   */
>  enum {
> -	DPU_SSPP_SRC = 0x1,
> -	DPU_SSPP_SCALER_QSEED2,
> +	DPU_SSPP_SCALER_QSEED2 = 0x1,
>  	DPU_SSPP_SCALER_QSEED3,
>  	DPU_SSPP_SCALER_QSEED3LITE,
>  	DPU_SSPP_SCALER_QSEED4,
> @@ -278,14 +276,6 @@ enum {
>  	u32 base; \
>  	u32 len
>  
> -/**
> - * struct dpu_src_blk: SSPP part of the source pipes
> - * @info:   HW register and features supported by this sub-blk
> - */
> -struct dpu_src_blk {
> -	DPU_HW_SUBBLK_INFO;
> -};
> -
>  /**
>   * struct dpu_scaler_blk: Scaler information
>   * @info:   HW register and features supported by this sub-blk
> @@ -392,7 +382,6 @@ struct dpu_caps {
>   * @smart_dma_priority: hw priority of rect1 of multirect pipe
>   * @max_per_pipe_bw: maximum allowable bandwidth of this pipe in kBps
>   * @qseed_ver: qseed version
> - * @src_blk:
>   * @scaler_blk:
>   * @csc_blk:
>   * @hsic:
> @@ -413,7 +402,6 @@ struct dpu_sspp_sub_blks {
>  	u32 smart_dma_priority;
>  	u32 max_per_pipe_bw;
>  	u32 qseed_ver;
> -	struct dpu_src_blk src_blk;
>  	struct dpu_scaler_blk scaler_blk;
>  	struct dpu_pp_blk csc_blk;
>  	struct dpu_pp_blk hsic_blk;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> index cf70a9bd1034..83a091f978e2 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> @@ -12,7 +12,7 @@
>  
>  #define DPU_FETCH_CONFIG_RESET_VALUE   0x00000087
>  
> -/* DPU_SSPP_SRC */
> +/* SSPP registers */
>  #define SSPP_SRC_SIZE                      0x00
>  #define SSPP_SRC_XY                        0x08
>  #define SSPP_OUT_SIZE                      0x0c
> @@ -149,9 +149,6 @@ static int _sspp_subblk_offset(struct dpu_hw_sspp *ctx,
>  	sblk = ctx->cap->sblk;
>  
>  	switch (s_id) {
> -	case DPU_SSPP_SRC:
> -		*idx = sblk->src_blk.base;
> -		break;
>  	case DPU_SSPP_SCALER_QSEED2:
>  	case DPU_SSPP_SCALER_QSEED3:
>  	case DPU_SSPP_SCALER_RGB:
> @@ -172,9 +169,8 @@ static void dpu_hw_sspp_setup_multirect(struct dpu_sw_pipe *pipe)
>  {
>  	struct dpu_hw_sspp *ctx = pipe->sspp;
>  	u32 mode_mask;
> -	u32 idx;
>  
> -	if (_sspp_subblk_offset(ctx, DPU_SSPP_SRC, &idx))
> +	if (!ctx)
>  		return;
>  
>  	if (pipe->multirect_index == DPU_SSPP_RECT_SOLO) {
> @@ -185,7 +181,7 @@ static void dpu_hw_sspp_setup_multirect(struct dpu_sw_pipe *pipe)
>  		 */
>  		mode_mask = 0;
>  	} else {
> -		mode_mask = DPU_REG_READ(&ctx->hw, SSPP_MULTIRECT_OPMODE + idx);
> +		mode_mask = DPU_REG_READ(&ctx->hw, SSPP_MULTIRECT_OPMODE);
>  		mode_mask |= pipe->multirect_index;
>  		if (pipe->multirect_mode == DPU_SSPP_MULTIRECT_TIME_MX)
>  			mode_mask |= BIT(2);
> @@ -193,7 +189,7 @@ static void dpu_hw_sspp_setup_multirect(struct dpu_sw_pipe *pipe)
>  			mode_mask &= ~BIT(2);
>  	}
>  
> -	DPU_REG_WRITE(&ctx->hw, SSPP_MULTIRECT_OPMODE + idx, mode_mask);
> +	DPU_REG_WRITE(&ctx->hw, SSPP_MULTIRECT_OPMODE, mode_mask);
>  }
>  
>  static void _sspp_setup_opmode(struct dpu_hw_sspp *ctx,
> @@ -247,9 +243,8 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
>  	u32 opmode = 0;
>  	u32 fast_clear = 0;
>  	u32 op_mode_off, unpack_pat_off, format_off;
> -	u32 idx;
>  
> -	if (_sspp_subblk_offset(ctx, DPU_SSPP_SRC, &idx) || !fmt)
> +	if (!ctx || !fmt)
>  		return;
>  
>  	if (pipe->multirect_index == DPU_SSPP_RECT_SOLO ||
> @@ -264,7 +259,7 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
>  	}
>  
>  	c = &ctx->hw;
> -	opmode = DPU_REG_READ(c, op_mode_off + idx);
> +	opmode = DPU_REG_READ(c, op_mode_off);
>  	opmode &= ~(MDSS_MDP_OP_FLIP_LR | MDSS_MDP_OP_FLIP_UD |
>  			MDSS_MDP_OP_BWC_EN | MDSS_MDP_OP_PE_OVERRIDE);
>  
> @@ -352,12 +347,12 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
>  			VIG_CSC_10_EN | VIG_CSC_10_SRC_DATAFMT,
>  			DPU_FORMAT_IS_YUV(fmt));
>  
> -	DPU_REG_WRITE(c, format_off + idx, src_format);
> -	DPU_REG_WRITE(c, unpack_pat_off + idx, unpack);
> -	DPU_REG_WRITE(c, op_mode_off + idx, opmode);
> +	DPU_REG_WRITE(c, format_off, src_format);
> +	DPU_REG_WRITE(c, unpack_pat_off, unpack);
> +	DPU_REG_WRITE(c, op_mode_off, opmode);
>  
>  	/* clear previous UBWC error */
> -	DPU_REG_WRITE(c, SSPP_UBWC_ERROR_STATUS + idx, BIT(31));
> +	DPU_REG_WRITE(c, SSPP_UBWC_ERROR_STATUS, BIT(31));
>  }
>  
>  static void dpu_hw_sspp_setup_pe_config(struct dpu_hw_sspp *ctx,
> @@ -368,9 +363,8 @@ static void dpu_hw_sspp_setup_pe_config(struct dpu_hw_sspp *ctx,
>  	u32 lr_pe[4], tb_pe[4], tot_req_pixels[4];
>  	const u32 bytemask = 0xff;
>  	const u32 shortmask = 0xffff;
> -	u32 idx;
>  
> -	if (_sspp_subblk_offset(ctx, DPU_SSPP_SRC, &idx) || !pe_ext)
> +	if (!ctx || !pe_ext)
>  		return;
>  
>  	c = &ctx->hw;
> @@ -400,21 +394,21 @@ static void dpu_hw_sspp_setup_pe_config(struct dpu_hw_sspp *ctx,
>  	}
>  
>  	/* color 0 */
> -	DPU_REG_WRITE(c, SSPP_SW_PIX_EXT_C0_LR + idx, lr_pe[0]);
> -	DPU_REG_WRITE(c, SSPP_SW_PIX_EXT_C0_TB + idx, tb_pe[0]);
> -	DPU_REG_WRITE(c, SSPP_SW_PIX_EXT_C0_REQ_PIXELS + idx,
> +	DPU_REG_WRITE(c, SSPP_SW_PIX_EXT_C0_LR, lr_pe[0]);
> +	DPU_REG_WRITE(c, SSPP_SW_PIX_EXT_C0_TB, tb_pe[0]);
> +	DPU_REG_WRITE(c, SSPP_SW_PIX_EXT_C0_REQ_PIXELS,
>  			tot_req_pixels[0]);
>  
>  	/* color 1 and color 2 */
> -	DPU_REG_WRITE(c, SSPP_SW_PIX_EXT_C1C2_LR + idx, lr_pe[1]);
> -	DPU_REG_WRITE(c, SSPP_SW_PIX_EXT_C1C2_TB + idx, tb_pe[1]);
> -	DPU_REG_WRITE(c, SSPP_SW_PIX_EXT_C1C2_REQ_PIXELS + idx,
> +	DPU_REG_WRITE(c, SSPP_SW_PIX_EXT_C1C2_LR, lr_pe[1]);
> +	DPU_REG_WRITE(c, SSPP_SW_PIX_EXT_C1C2_TB, tb_pe[1]);
> +	DPU_REG_WRITE(c, SSPP_SW_PIX_EXT_C1C2_REQ_PIXELS,
>  			tot_req_pixels[1]);
>  
>  	/* color 3 */
> -	DPU_REG_WRITE(c, SSPP_SW_PIX_EXT_C3_LR + idx, lr_pe[3]);
> -	DPU_REG_WRITE(c, SSPP_SW_PIX_EXT_C3_TB + idx, lr_pe[3]);
> -	DPU_REG_WRITE(c, SSPP_SW_PIX_EXT_C3_REQ_PIXELS + idx,
> +	DPU_REG_WRITE(c, SSPP_SW_PIX_EXT_C3_LR, lr_pe[3]);
> +	DPU_REG_WRITE(c, SSPP_SW_PIX_EXT_C3_TB, lr_pe[3]);
> +	DPU_REG_WRITE(c, SSPP_SW_PIX_EXT_C3_REQ_PIXELS,
>  			tot_req_pixels[3]);
>  }
>  
> @@ -453,9 +447,8 @@ static void dpu_hw_sspp_setup_rects(struct dpu_sw_pipe *pipe,
>  	struct dpu_hw_blk_reg_map *c;
>  	u32 src_size, src_xy, dst_size, dst_xy;
>  	u32 src_size_off, src_xy_off, out_size_off, out_xy_off;
> -	u32 idx;
>  
> -	if (_sspp_subblk_offset(ctx, DPU_SSPP_SRC, &idx) || !cfg)
> +	if (!ctx || !cfg)
>  		return;
>  
>  	c = &ctx->hw;
> @@ -483,10 +476,10 @@ static void dpu_hw_sspp_setup_rects(struct dpu_sw_pipe *pipe,
>  		drm_rect_width(&cfg->dst_rect);
>  
>  	/* rectangle register programming */
> -	DPU_REG_WRITE(c, src_size_off + idx, src_size);
> -	DPU_REG_WRITE(c, src_xy_off + idx, src_xy);
> -	DPU_REG_WRITE(c, out_size_off + idx, dst_size);
> -	DPU_REG_WRITE(c, out_xy_off + idx, dst_xy);
> +	DPU_REG_WRITE(c, src_size_off, src_size);
> +	DPU_REG_WRITE(c, src_xy_off, src_xy);
> +	DPU_REG_WRITE(c, out_size_off, dst_size);
> +	DPU_REG_WRITE(c, out_xy_off, dst_xy);
>  }
>  
>  static void dpu_hw_sspp_setup_sourceaddress(struct dpu_sw_pipe *pipe,
> @@ -495,24 +488,23 @@ static void dpu_hw_sspp_setup_sourceaddress(struct dpu_sw_pipe *pipe,
>  	struct dpu_hw_sspp *ctx = pipe->sspp;
>  	u32 ystride0, ystride1;
>  	int i;
> -	u32 idx;
>  
> -	if (_sspp_subblk_offset(ctx, DPU_SSPP_SRC, &idx))
> +	if (!ctx)
>  		return;
>  
>  	if (pipe->multirect_index == DPU_SSPP_RECT_SOLO) {
>  		for (i = 0; i < ARRAY_SIZE(layout->plane_addr); i++)
> -			DPU_REG_WRITE(&ctx->hw, SSPP_SRC0_ADDR + idx + i * 0x4,
> +			DPU_REG_WRITE(&ctx->hw, SSPP_SRC0_ADDR + i * 0x4,
>  					layout->plane_addr[i]);
>  	} else if (pipe->multirect_index == DPU_SSPP_RECT_0) {
> -		DPU_REG_WRITE(&ctx->hw, SSPP_SRC0_ADDR + idx,
> +		DPU_REG_WRITE(&ctx->hw, SSPP_SRC0_ADDR,
>  				layout->plane_addr[0]);
> -		DPU_REG_WRITE(&ctx->hw, SSPP_SRC2_ADDR + idx,
> +		DPU_REG_WRITE(&ctx->hw, SSPP_SRC2_ADDR,
>  				layout->plane_addr[2]);
>  	} else {
> -		DPU_REG_WRITE(&ctx->hw, SSPP_SRC1_ADDR + idx,
> +		DPU_REG_WRITE(&ctx->hw, SSPP_SRC1_ADDR,
>  				layout->plane_addr[0]);
> -		DPU_REG_WRITE(&ctx->hw, SSPP_SRC3_ADDR + idx,
> +		DPU_REG_WRITE(&ctx->hw, SSPP_SRC3_ADDR,
>  				layout->plane_addr[2]);
>  	}
>  
> @@ -522,8 +514,8 @@ static void dpu_hw_sspp_setup_sourceaddress(struct dpu_sw_pipe *pipe,
>  		ystride1 = (layout->plane_pitch[2]) |
>  			(layout->plane_pitch[3] << 16);
>  	} else {
> -		ystride0 = DPU_REG_READ(&ctx->hw, SSPP_SRC_YSTRIDE0 + idx);
> -		ystride1 = DPU_REG_READ(&ctx->hw, SSPP_SRC_YSTRIDE1 + idx);
> +		ystride0 = DPU_REG_READ(&ctx->hw, SSPP_SRC_YSTRIDE0);
> +		ystride1 = DPU_REG_READ(&ctx->hw, SSPP_SRC_YSTRIDE1);
>  
>  		if (pipe->multirect_index == DPU_SSPP_RECT_0) {
>  			ystride0 = (ystride0 & 0xFFFF0000) |
> @@ -540,8 +532,8 @@ static void dpu_hw_sspp_setup_sourceaddress(struct dpu_sw_pipe *pipe,
>  		}
>  	}
>  
> -	DPU_REG_WRITE(&ctx->hw, SSPP_SRC_YSTRIDE0 + idx, ystride0);
> -	DPU_REG_WRITE(&ctx->hw, SSPP_SRC_YSTRIDE1 + idx, ystride1);
> +	DPU_REG_WRITE(&ctx->hw, SSPP_SRC_YSTRIDE0, ystride0);
> +	DPU_REG_WRITE(&ctx->hw, SSPP_SRC_YSTRIDE1, ystride1);
>  }
>  
>  static void dpu_hw_sspp_setup_csc(struct dpu_hw_sspp *ctx,
> @@ -565,9 +557,8 @@ static void dpu_hw_sspp_setup_solidfill(struct dpu_sw_pipe *pipe, u32 color)
>  {
>  	struct dpu_hw_sspp *ctx = pipe->sspp;
>  	struct dpu_hw_fmt_layout cfg;
> -	u32 idx;
>  
> -	if (_sspp_subblk_offset(ctx, DPU_SSPP_SRC, &idx))
> +	if (!ctx)
>  		return;
>  
>  	/* cleanup source addresses */
> @@ -576,9 +567,9 @@ static void dpu_hw_sspp_setup_solidfill(struct dpu_sw_pipe *pipe, u32 color)
>  
>  	if (pipe->multirect_index == DPU_SSPP_RECT_SOLO ||
>  	    pipe->multirect_index == DPU_SSPP_RECT_0)
> -		DPU_REG_WRITE(&ctx->hw, SSPP_SRC_CONSTANT_COLOR + idx, color);
> +		DPU_REG_WRITE(&ctx->hw, SSPP_SRC_CONSTANT_COLOR, color);
>  	else
> -		DPU_REG_WRITE(&ctx->hw, SSPP_SRC_CONSTANT_COLOR_REC1 + idx,
> +		DPU_REG_WRITE(&ctx->hw, SSPP_SRC_CONSTANT_COLOR_REC1,
>  				color);
>  }
>  
> @@ -586,39 +577,34 @@ static void dpu_hw_sspp_setup_danger_safe_lut(struct dpu_hw_sspp *ctx,
>  			u32 danger_lut,
>  			u32 safe_lut)
>  {
> -	u32 idx;
> -
> -	if (_sspp_subblk_offset(ctx, DPU_SSPP_SRC, &idx))
> +	if (!ctx)
>  		return;
>  
> -	DPU_REG_WRITE(&ctx->hw, SSPP_DANGER_LUT + idx, danger_lut);
> -	DPU_REG_WRITE(&ctx->hw, SSPP_SAFE_LUT + idx, safe_lut);
> +	DPU_REG_WRITE(&ctx->hw, SSPP_DANGER_LUT, danger_lut);
> +	DPU_REG_WRITE(&ctx->hw, SSPP_SAFE_LUT, safe_lut);
>  }
>  
>  static void dpu_hw_sspp_setup_creq_lut(struct dpu_hw_sspp *ctx,
>  			u64 creq_lut)
>  {
> -	u32 idx;
> -
> -	if (_sspp_subblk_offset(ctx, DPU_SSPP_SRC, &idx))
> +	if (!ctx)
>  		return;
>  
>  	if (ctx->cap && test_bit(DPU_SSPP_QOS_8LVL, &ctx->cap->features)) {
> -		DPU_REG_WRITE(&ctx->hw, SSPP_CREQ_LUT_0 + idx, creq_lut);
> -		DPU_REG_WRITE(&ctx->hw, SSPP_CREQ_LUT_1 + idx,
> +		DPU_REG_WRITE(&ctx->hw, SSPP_CREQ_LUT_0, creq_lut);
> +		DPU_REG_WRITE(&ctx->hw, SSPP_CREQ_LUT_1,
>  				creq_lut >> 32);
>  	} else {
> -		DPU_REG_WRITE(&ctx->hw, SSPP_CREQ_LUT + idx, creq_lut);
> +		DPU_REG_WRITE(&ctx->hw, SSPP_CREQ_LUT, creq_lut);
>  	}
>  }
>  
>  static void dpu_hw_sspp_setup_qos_ctrl(struct dpu_hw_sspp *ctx,
>  		struct dpu_hw_pipe_qos_cfg *cfg)
>  {
> -	u32 idx;
>  	u32 qos_ctrl = 0;
>  
> -	if (_sspp_subblk_offset(ctx, DPU_SSPP_SRC, &idx))
> +	if (!ctx)
>  		return;
>  
>  	if (cfg->vblank_en) {
> @@ -634,23 +620,19 @@ static void dpu_hw_sspp_setup_qos_ctrl(struct dpu_hw_sspp *ctx,
>  	if (cfg->danger_safe_en)
>  		qos_ctrl |= SSPP_QOS_CTRL_DANGER_SAFE_EN;
>  
> -	DPU_REG_WRITE(&ctx->hw, SSPP_QOS_CTRL + idx, qos_ctrl);
> +	DPU_REG_WRITE(&ctx->hw, SSPP_QOS_CTRL, qos_ctrl);
>  }
>  
>  static void dpu_hw_sspp_setup_cdp(struct dpu_sw_pipe *pipe,
>  		struct dpu_hw_cdp_cfg *cfg)
>  {
>  	struct dpu_hw_sspp *ctx = pipe->sspp;
> -	u32 idx;
>  	u32 cdp_cntl = 0;
>  	u32 cdp_cntl_offset = 0;
>  
>  	if (!ctx || !cfg)
>  		return;
>  
> -	if (_sspp_subblk_offset(ctx, DPU_SSPP_SRC, &idx))
> -		return;
> -
>  	if (pipe->multirect_index == DPU_SSPP_RECT_SOLO ||
>  	    pipe->multirect_index == DPU_SSPP_RECT_0)
>  		cdp_cntl_offset = SSPP_CDP_CNTL;
> @@ -672,13 +654,11 @@ static void dpu_hw_sspp_setup_cdp(struct dpu_sw_pipe *pipe,
>  static void _setup_layer_ops(struct dpu_hw_sspp *c,
>  		unsigned long features)
>  {
> -	if (test_bit(DPU_SSPP_SRC, &features)) {
> -		c->ops.setup_format = dpu_hw_sspp_setup_format;
> -		c->ops.setup_rects = dpu_hw_sspp_setup_rects;
> -		c->ops.setup_sourceaddress = dpu_hw_sspp_setup_sourceaddress;
> -		c->ops.setup_solidfill = dpu_hw_sspp_setup_solidfill;
> -		c->ops.setup_pe = dpu_hw_sspp_setup_pe_config;
> -	}
> +	c->ops.setup_format = dpu_hw_sspp_setup_format;
> +	c->ops.setup_rects = dpu_hw_sspp_setup_rects;
> +	c->ops.setup_sourceaddress = dpu_hw_sspp_setup_sourceaddress;
> +	c->ops.setup_solidfill = dpu_hw_sspp_setup_solidfill;
> +	c->ops.setup_pe = dpu_hw_sspp_setup_pe_config;
>  
>  	if (test_bit(DPU_SSPP_QOS, &features)) {
>  		c->ops.setup_danger_safe_lut =
> @@ -728,8 +708,8 @@ int _dpu_hw_sspp_init_debugfs(struct dpu_hw_sspp *hw_pipe, struct dpu_kms *kms,
>  	/* add register dump support */
>  	dpu_debugfs_create_regset32("src_blk", 0400,
>  			debugfs_root,
> -			sblk->src_blk.base + cfg->base,
> -			sblk->src_blk.len,
> +			cfg->base,
> +			cfg->len,
>  			kms);
>  
>  	if (cfg->features & BIT(DPU_SSPP_SCALER_QSEED3) ||
> -- 
> 2.39.2
> 
