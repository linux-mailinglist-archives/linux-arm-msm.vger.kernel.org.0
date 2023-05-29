Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 83594715117
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 May 2023 23:46:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229715AbjE2VqU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 May 2023 17:46:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229724AbjE2VqT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 May 2023 17:46:19 -0400
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [5.144.164.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D009CF
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 May 2023 14:46:17 -0700 (PDT)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 506773F319;
        Mon, 29 May 2023 23:46:16 +0200 (CEST)
Date:   Mon, 29 May 2023 23:46:15 +0200
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
Subject: Re: [PATCH] drm/msm/dpu: use PINGPONG_NONE to unbind INTF from PP
Message-ID: <h33hhvvlwq67uooelhm5wot7hx5utzegxtq3wu25rfrcrjx45n@dznkc26cxz23>
References: <20230526090945.439639-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230526090945.439639-1-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-05-26 12:09:45, Dmitry Baryshkov wrote:
> Currently the driver passes the PINGPONG index to
> dpu_hw_intf_ops::bind_pingpong_blk() callback and uses separate boolean
> flag to tell whether INTF should be bound or unbound. Simplify this by
> passing PINGPONG_NONE in case of unbinding and drop the flag completely.

Perhaps worth mentioning that this flag was only recently introduced
(and link to it as a dependency under the cut), as well as explain that
the passed `enum dpu_pingpong` value is bogus when enable=false because
it is not part of the value written to the register for the
"unbind/disable" case?  See for example the wording I suggested on the
patch that introduces and uses PINGPONG_NONE.

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c          | 4 ++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 4 +---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 1 -
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c          | 3 +--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h          | 1 -

How about appending/sending another patch that drops this from
dpu_hw_wb.c as well?

>  5 files changed, 4 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index ebe34eda6e50..7fd3a13ac226 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -2102,8 +2102,8 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
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
> index 1a4c20f02312..3130c86a32cc 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> @@ -66,7 +66,6 @@ static void _dpu_encoder_phys_cmd_update_intf_cfg(
>  	if (test_bit(DPU_CTL_ACTIVE_CFG, &ctl->caps->features) && phys_enc->hw_intf->ops.bind_pingpong_blk)
>  		phys_enc->hw_intf->ops.bind_pingpong_blk(
>  				phys_enc->hw_intf,
> -				true,
>  				phys_enc->hw_pp->idx);
>  
>  	if (phys_enc->hw_intf->ops.enable_compression)
> @@ -556,8 +555,7 @@ static void dpu_encoder_phys_cmd_disable(struct dpu_encoder_phys *phys_enc)
>  	if (phys_enc->hw_intf->ops.bind_pingpong_blk) {
>  		phys_enc->hw_intf->ops.bind_pingpong_blk(
>  				phys_enc->hw_intf,
> -				false,
> -				phys_enc->hw_pp->idx);
> +				PINGPONG_NONE);

Is there also a cleanup state where hw_pp is assigned back to NULL?

>  		ctl = phys_enc->hw_ctl;
>  		ctl->ops.update_pending_flush_intf(ctl, phys_enc->intf_idx);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> index 3a374292f311..220020273304 100644
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
> index a2486f99d3c2..918d154848b9 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> @@ -268,7 +268,6 @@ static void dpu_hw_intf_setup_prg_fetch(
>  
>  static void dpu_hw_intf_bind_pingpong_blk(
>  		struct dpu_hw_intf *intf,
> -		bool enable,
>  		const enum dpu_pingpong pp)
>  {
>  	struct dpu_hw_blk_reg_map *c = &intf->hw;
> @@ -277,7 +276,7 @@ static void dpu_hw_intf_bind_pingpong_blk(
>  	mux_cfg = DPU_REG_READ(c, INTF_MUX);
>  	mux_cfg &= ~0xf;
>  
> -	if (enable)
> +	if (pp != PINGPONG_NONE)

Kuogee just used `if (pp)`, I think we should stay consistent.

- Marijn

>  		mux_cfg |= (pp - PINGPONG_0) & 0x7;
>  	else
>  		mux_cfg |= 0xf;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> index 72fe907729f1..e2d15e89880d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> @@ -89,7 +89,6 @@ struct dpu_hw_intf_ops {
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
