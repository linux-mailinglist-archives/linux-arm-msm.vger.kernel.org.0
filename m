Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 441ED708844
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 May 2023 21:20:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229622AbjERTUJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 May 2023 15:20:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbjERTUJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 May 2023 15:20:09 -0400
Received: from relay02.th.seeweb.it (relay02.th.seeweb.it [IPv6:2001:4b7a:2000:18::163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97A9E95
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 May 2023 12:20:07 -0700 (PDT)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id A858E201C8;
        Thu, 18 May 2023 21:20:05 +0200 (CEST)
Date:   Thu, 18 May 2023 21:20:04 +0200
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
        Jeykumar Sankaran <quic_jeykumar@quicinc.com>
Subject: Re: [PATCH v2 3/3] drm/msm/dpu: access CSC/CSC10 registers directly
Message-ID: <ycwywmgy2pby2jglwm7tfjqgliizbi7ue75x526hdkik3kjtrt@c4eb4bgucgxb>
References: <20230429012353.2569481-1-dmitry.baryshkov@linaro.org>
 <20230429012353.2569481-4-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230429012353.2569481-4-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-04-29 04:23:53, Dmitry Baryshkov wrote:
> Stop using _sspp_subblk_offset() to get offset of the csc_blk. Inline

the offset of.

> this function and use ctx->cap->sblk->csc_blk.base directly.
> 
> As this was the last user, drop _sspp_subblk_offset() too.
> 
> Reviewed-by: Jeykumar Sankaran <quic_jeykumar@quicinc.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Also much nicer to have idx renamed to offset, and having it on the
left-hand side of these `blk + REG` expressions.  Thanks!

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 43 +++++----------------
>  1 file changed, 9 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> index 37cd5f4396c6..fd9714659293 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> @@ -136,30 +136,6 @@
>  #define TS_CLK			19200000
>  
>  
> -static int _sspp_subblk_offset(struct dpu_hw_sspp *ctx,
> -		int s_id,
> -		u32 *idx)
> -{
> -	int rc = 0;
> -	const struct dpu_sspp_sub_blks *sblk;
> -
> -	if (!ctx || !ctx->cap || !ctx->cap->sblk)
> -		return -EINVAL;
> -
> -	sblk = ctx->cap->sblk;
> -
> -	switch (s_id) {
> -	case DPU_SSPP_CSC:
> -	case DPU_SSPP_CSC_10BIT:
> -		*idx = sblk->csc_blk.base;
> -		break;
> -	default:
> -		rc = -EINVAL;
> -	}
> -
> -	return rc;
> -}
> -
>  static void dpu_hw_sspp_setup_multirect(struct dpu_sw_pipe *pipe)
>  {
>  	struct dpu_hw_sspp *ctx = pipe->sspp;
> @@ -210,19 +186,16 @@ static void _sspp_setup_opmode(struct dpu_hw_sspp *ctx,
>  static void _sspp_setup_csc10_opmode(struct dpu_hw_sspp *ctx,
>  		u32 mask, u8 en)
>  {
> -	u32 idx;
> +	const struct dpu_sspp_sub_blks *sblk = ctx->cap->sblk;
>  	u32 opmode;
>  
> -	if (_sspp_subblk_offset(ctx, DPU_SSPP_CSC_10BIT, &idx))
> -		return;
> -
> -	opmode = DPU_REG_READ(&ctx->hw, SSPP_VIG_CSC_10_OP_MODE + idx);
> +	opmode = DPU_REG_READ(&ctx->hw, sblk->csc_blk.base + SSPP_VIG_CSC_10_OP_MODE);
>  	if (en)
>  		opmode |= mask;
>  	else
>  		opmode &= ~mask;
>  
> -	DPU_REG_WRITE(&ctx->hw, SSPP_VIG_CSC_10_OP_MODE + idx, opmode);
> +	DPU_REG_WRITE(&ctx->hw, sblk->csc_blk.base + SSPP_VIG_CSC_10_OP_MODE, opmode);
>  }
>  
>  /*
> @@ -530,18 +503,20 @@ static void dpu_hw_sspp_setup_sourceaddress(struct dpu_sw_pipe *pipe,
>  static void dpu_hw_sspp_setup_csc(struct dpu_hw_sspp *ctx,
>  		const struct dpu_csc_cfg *data)
>  {
> -	u32 idx;
> +	u32 offset;
>  	bool csc10 = false;
>  
> -	if (_sspp_subblk_offset(ctx, DPU_SSPP_CSC, &idx) || !data)
> +	if (!ctx || !data)
>  		return;
>  
> +	offset = ctx->cap->sblk->csc_blk.base;
> +
>  	if (test_bit(DPU_SSPP_CSC_10BIT, &ctx->cap->features)) {
> -		idx += CSC_10BIT_OFFSET;
> +		offset += CSC_10BIT_OFFSET;
>  		csc10 = true;
>  	}
>  
> -	dpu_hw_csc_setup(&ctx->hw, idx, data, csc10);
> +	dpu_hw_csc_setup(&ctx->hw, offset, data, csc10);
>  }
>  
>  static void dpu_hw_sspp_setup_solidfill(struct dpu_sw_pipe *pipe, u32 color)
> -- 
> 2.39.2
> 
