Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CAB08721ACC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jun 2023 00:05:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229904AbjFDWFh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 4 Jun 2023 18:05:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229670AbjFDWFg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 4 Jun 2023 18:05:36 -0400
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it [IPv6:2001:4b7a:2000:18::168])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5474AC
        for <linux-arm-msm@vger.kernel.org>; Sun,  4 Jun 2023 15:05:35 -0700 (PDT)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 00D153EB7A;
        Mon,  5 Jun 2023 00:05:33 +0200 (CEST)
Date:   Mon, 5 Jun 2023 00:05:32 +0200
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
Subject: Re: [PATCH v2 2/2] drm/msm/dpu: use PINGPONG_NONE to unbind WB from
 PP
Message-ID: <rlo3b6i56p3uhq4hdosv2jtegchfhxzf5xvkyopqwq2czjlekr@tulojcn5ko7m>
References: <20230604031308.894274-1-dmitry.baryshkov@linaro.org>
 <20230604031308.894274-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230604031308.894274-2-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-06-04 06:13:08, Dmitry Baryshkov wrote:
> Currently the driver passes the PINGPONG index to
> dpu_hw_wb_ops::bind_pingpong_blk() callback and uses separate boolean
> flag to tell whether WB should be bound or unbound. Simplify this by
> passing PINGPONG_NONE in case of unbinding and drop the flag completely.
> 
> Suggested-by: Marijn Suijten <marijn.suijten@somainline.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c         | 3 +--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c | 2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c           | 4 ++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h           | 2 +-
>  4 files changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 3e543d664c98..493905a5b63a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -2080,8 +2080,7 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
>  	if (phys_enc->hw_wb) {
>  		/* disable the PP block */
>  		if (phys_enc->hw_wb->ops.bind_pingpong_blk)
> -			phys_enc->hw_wb->ops.bind_pingpong_blk(phys_enc->hw_wb, false,
> -					phys_enc->hw_pp->idx);
> +			phys_enc->hw_wb->ops.bind_pingpong_blk(phys_enc->hw_wb, PINGPONG_NONE);
>  
>  		/* mark WB flush as pending */
>  		if (phys_enc->hw_ctl->ops.update_pending_flush_wb)
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> index e9325cafb1a8..a466ff70a4d6 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> @@ -210,7 +210,7 @@ static void dpu_encoder_phys_wb_setup_cdp(struct dpu_encoder_phys *phys_enc)
>  
>  		/* setup which pp blk will connect to this wb */
>  		if (hw_pp && phys_enc->hw_wb->ops.bind_pingpong_blk)
> -			phys_enc->hw_wb->ops.bind_pingpong_blk(phys_enc->hw_wb, true,
> +			phys_enc->hw_wb->ops.bind_pingpong_blk(phys_enc->hw_wb,
>  					phys_enc->hw_pp->idx);
>  
>  		phys_enc->hw_ctl->ops.setup_intf_cfg(phys_enc->hw_ctl, &intf_cfg);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
> index dcffd6cc47fc..ebc416400382 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
> @@ -154,7 +154,7 @@ static void dpu_hw_wb_setup_cdp(struct dpu_hw_wb *ctx,
>  
>  static void dpu_hw_wb_bind_pingpong_blk(
>  		struct dpu_hw_wb *ctx,
> -		bool enable, const enum dpu_pingpong pp)
> +		const enum dpu_pingpong pp)
>  {
>  	struct dpu_hw_blk_reg_map *c;
>  	int mux_cfg;
> @@ -167,7 +167,7 @@ static void dpu_hw_wb_bind_pingpong_blk(
>  	mux_cfg = DPU_REG_READ(c, WB_MUX);
>  	mux_cfg &= ~0xf;
>  
> -	if (enable)
> +	if (pp)
>  		mux_cfg |= (pp - PINGPONG_0) & 0x7;
>  	else
>  		mux_cfg |= 0xf;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h
> index c7f792eeb55c..2d7db2efa3d0 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h
> @@ -49,7 +49,7 @@ struct dpu_hw_wb_ops {
>  			  bool enable);
>  
>  	void (*bind_pingpong_blk)(struct dpu_hw_wb *ctx,
> -			bool enable, const enum dpu_pingpong pp);
> +				  const enum dpu_pingpong pp);
>  };
>  
>  /**
> -- 
> 2.39.2
> 
