Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 74256721AC9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jun 2023 00:05:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229886AbjFDWFB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 4 Jun 2023 18:05:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229670AbjFDWFA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 4 Jun 2023 18:05:00 -0400
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it [IPv6:2001:4b7a:2000:18::166])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F062CAC
        for <linux-arm-msm@vger.kernel.org>; Sun,  4 Jun 2023 15:04:58 -0700 (PDT)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id D7A1A3EBBD;
        Mon,  5 Jun 2023 00:04:56 +0200 (CEST)
Date:   Mon, 5 Jun 2023 00:04:54 +0200
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
Subject: Re: [PATCH v2 1/2] drm/msm/dpu: use PINGPONG_NONE to unbind INTF
 from PP
Message-ID: <dzxdyiigbkjlmhudjbrmxuhauqn2lh5dkuyrpddcpt5xteo7um@elcvbccbbfod>
References: <20230604031308.894274-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230604031308.894274-1-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-06-04 06:13:07, Dmitry Baryshkov wrote:
> Currently the driver passes the PINGPONG index to
> dpu_hw_intf_ops::bind_pingpong_blk() callback and uses separate boolean
> flag to tell whether INTF should be bound or unbound. Simplify this by
> passing PINGPONG_NONE in case of unbinding and drop the flag completely.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
> 
> Changes since v1:
> - Dropped != PINGPONG_NONE (Marijn)
> 
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c          | 4 ++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 4 +---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 1 -
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c          | 3 +--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h          | 1 -
>  5 files changed, 4 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 2e1873d29c4b..3e543d664c98 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -2090,8 +2090,8 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
>  		for (i = 0; i < dpu_enc->num_phys_encs; i++) {
>  			if (dpu_enc->phys_encs[i] && phys_enc->hw_intf->ops.bind_pingpong_blk)
>  				phys_enc->hw_intf->ops.bind_pingpong_blk(
> -						dpu_enc->phys_encs[i]->hw_intf, false,
> -						dpu_enc->phys_encs[i]->hw_pp->idx);
> +						dpu_enc->phys_encs[i]->hw_intf,
> +						PINGPONG_NONE);
>  
>  			/* mark INTF flush as pending */
>  			if (phys_enc->hw_ctl->ops.update_pending_flush_intf)
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> index 4f8c9187f76d..107f0eff958c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> @@ -66,7 +66,6 @@ static void _dpu_encoder_phys_cmd_update_intf_cfg(
>  	if (test_bit(DPU_CTL_ACTIVE_CFG, &ctl->caps->features) && phys_enc->hw_intf->ops.bind_pingpong_blk)
>  		phys_enc->hw_intf->ops.bind_pingpong_blk(
>  				phys_enc->hw_intf,
> -				true,
>  				phys_enc->hw_pp->idx);
>  }
>  
> @@ -553,8 +552,7 @@ static void dpu_encoder_phys_cmd_disable(struct dpu_encoder_phys *phys_enc)
>  	if (phys_enc->hw_intf->ops.bind_pingpong_blk) {
>  		phys_enc->hw_intf->ops.bind_pingpong_blk(
>  				phys_enc->hw_intf,
> -				false,
> -				phys_enc->hw_pp->idx);
> +				PINGPONG_NONE);
>  
>  		ctl = phys_enc->hw_ctl;
>  		ctl->ops.update_pending_flush_intf(ctl, phys_enc->hw_intf->idx);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> index e26629e9e303..662d74ded1b9 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> @@ -287,7 +287,6 @@ static void dpu_encoder_phys_vid_setup_timing_engine(
>  	if (phys_enc->hw_intf->ops.bind_pingpong_blk)
>  		phys_enc->hw_intf->ops.bind_pingpong_blk(
>  				phys_enc->hw_intf,
> -				true,
>  				phys_enc->hw_pp->idx);
>  
>  	if (phys_enc->hw_pp->merge_3d)
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> index 5dce18236d87..530f82e34c1e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> @@ -267,7 +267,6 @@ static void dpu_hw_intf_setup_prg_fetch(
>  
>  static void dpu_hw_intf_bind_pingpong_blk(
>  		struct dpu_hw_intf *intf,
> -		bool enable,
>  		const enum dpu_pingpong pp)
>  {
>  	struct dpu_hw_blk_reg_map *c = &intf->hw;
> @@ -276,7 +275,7 @@ static void dpu_hw_intf_bind_pingpong_blk(
>  	mux_cfg = DPU_REG_READ(c, INTF_MUX);
>  	mux_cfg &= ~0xf;
>  
> -	if (enable)
> +	if (pp)
>  		mux_cfg |= (pp - PINGPONG_0) & 0x7;
>  	else
>  		mux_cfg |= 0xf;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> index 73b0885918f8..33895eca1211 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> @@ -88,7 +88,6 @@ struct dpu_hw_intf_ops {
>  	u32 (*get_line_count)(struct dpu_hw_intf *intf);
>  
>  	void (*bind_pingpong_blk)(struct dpu_hw_intf *intf,
> -			bool enable,
>  			const enum dpu_pingpong pp);
>  	void (*setup_misr)(struct dpu_hw_intf *intf, bool enable, u32 frame_count);
>  	int (*collect_misr)(struct dpu_hw_intf *intf, u32 *misr_value);
> -- 
> 2.39.2
> 
