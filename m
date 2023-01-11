Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 359CE6665F3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jan 2023 23:03:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235895AbjAKWD3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Jan 2023 17:03:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235904AbjAKWD1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Jan 2023 17:03:27 -0500
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it [5.144.164.167])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E67F932241
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 14:03:21 -0800 (PST)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 858903EF28;
        Wed, 11 Jan 2023 23:03:17 +0100 (CET)
Date:   Wed, 11 Jan 2023 23:03:14 +0100
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Kalyan Thota <quic_kalyant@quicinc.com>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, robdclark@chromium.org,
        dianders@chromium.org, swboyd@chromium.org,
        quic_vpolimer@quicinc.com, dmitry.baryshkov@linaro.org,
        quic_abhinavk@quicinc.com
Subject: Re: [v11] drm/msm/disp/dpu1: add support for dspp sub block flush in
 sc7280
Message-ID: <20230111220314.5dzipthz6juyqnfj@SoMainline.org>
References: <1671542719-12655-1-git-send-email-quic_kalyant@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1671542719-12655-1-git-send-email-quic_kalyant@quicinc.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2022-12-20 05:25:19, Kalyan Thota wrote:
> Flush mechanism for DSPP blocks has changed in sc7280 family, it
> allows individual sub blocks to be flushed in coordination with
> master flush control.
> 
> Representation: master_flush && (PCC_flush | IGC_flush .. etc )
> 
> This change adds necessary support for the above design.
> 
> Changes in v1:
> - Few nits (Doug, Dmitry)
> - Restrict sub-block flush programming to dpu_hw_ctl file (Dmitry)
> 
> Changes in v2:
> - Move the address offset to flush macro (Dmitry)
> - Separate ops for the sub block flush (Dmitry)
> 
> Changes in v3:
> - Reuse the DPU_DSPP_xx enum instead of a new one (Dmitry)
> 
> Changes in v4:
> - Use shorter version for unsigned int (Stephen)
> 
> Changes in v5:
> - Spurious patch please ignore.
> 
> Changes in v6:
> - Add SOB tag (Doug, Dmitry)
> 
> Changes in v7:
> - Cache flush mask per dspp (Dmitry)
> - Few nits (Marijn)
> 
> Changes in v8:
> - Few nits (Marijn)
> 
> Changes in v9:
> - Use DSPP enum while accessing flush mask to make it readable (Dmitry)
> - Few nits (Dmitry)
> 
> Changes in v10:
> - Fix white spaces in a separate patch (Dmitry)
> 
> Changes in v11:
> - Define a macro for dspp flush selection (Marijn)
> - Few nits (Marijn)

Please CC the reviewer when you send updated versions of your patches,
so that they don't have to be alerted/requested by others to re-review
the latest version, and scour the lists for where that latest version
is.

Looks much more understandable with the macro, thanks!

I have a few more nits for you below, but beyond that you can have my:

Marijn Suijten <marijn.suijten@somainline.org>

> Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c       |  2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c |  5 ++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  4 +++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c     | 44 ++++++++++++++++++++++++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h     |  5 ++-
>  5 files changed, 55 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 601d687..4170fbe 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -766,7 +766,7 @@ static void _dpu_crtc_setup_cp_blocks(struct drm_crtc *crtc)
>  
>  		/* stage config flush mask */
>  		ctl->ops.update_pending_flush_dspp(ctl,
> -			mixer[i].hw_dspp->idx);
> +			mixer[i].hw_dspp->idx, DPU_DSPP_PCC);
>  	}
>  }
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 27f029f..0eecb2f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -65,7 +65,10 @@
>  	(PINGPONG_SDM845_MASK | BIT(DPU_PINGPONG_TE2))
>  
>  #define CTL_SC7280_MASK \
> -	(BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_FETCH_ACTIVE) | BIT(DPU_CTL_VM_CFG))
> +	(BIT(DPU_CTL_ACTIVE_CFG) | \
> +	 BIT(DPU_CTL_FETCH_ACTIVE) | \
> +	 BIT(DPU_CTL_VM_CFG) | \
> +	 BIT(DPU_CTL_DSPP_SUB_BLOCK_FLUSH))
>  
>  #define MERGE_3D_SM8150_MASK (0)
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 38aa38a..0e70337 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -161,10 +161,12 @@ enum {
>   * DSPP sub-blocks
>   * @DPU_DSPP_PCC             Panel color correction block
>   * @DPU_DSPP_GC              Gamma correction block
> + * @DPU_DSPP_IGC             Inverse gamma correction block
>   */
>  enum {
>  	DPU_DSPP_PCC = 0x1,
>  	DPU_DSPP_GC,
> +	DPU_DSPP_IGC,
>  	DPU_DSPP_MAX
>  };
>  
> @@ -191,6 +193,7 @@ enum {
>   * @DPU_CTL_SPLIT_DISPLAY:	CTL supports video mode split display
>   * @DPU_CTL_FETCH_ACTIVE:	Active CTL for fetch HW (SSPPs)
>   * @DPU_CTL_VM_CFG:		CTL config to support multiple VMs
> + * @DPU_CTL_DSPP_BLOCK_FLUSH	CTL config to support dspp sub-block flush

Missing colon?

>   * @DPU_CTL_MAX
>   */
>  enum {
> @@ -198,6 +201,7 @@ enum {
>  	DPU_CTL_ACTIVE_CFG,
>  	DPU_CTL_FETCH_ACTIVE,
>  	DPU_CTL_VM_CFG,
> +	DPU_CTL_DSPP_SUB_BLOCK_FLUSH,
>  	DPU_CTL_MAX
>  };
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> index a35ecb6..fb2a115 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> @@ -33,6 +33,7 @@
>  #define   CTL_INTF_FLUSH                0x110
>  #define   CTL_INTF_MASTER               0x134
>  #define   CTL_FETCH_PIPE_ACTIVE         0x0FC
> +#define   CTL_DSPP_n_FLUSH(n)           ((0x13C) + ((n) * 4))

Ordering-wise this should've sat before CTL_FETCH_PIPE_ACTIVE, which in
turn should have been in between CTL_INTF_ACTIVE and CTL_MERGE_3D_FLUSH
:/

>  
>  #define CTL_MIXER_BORDER_OUT            BIT(24)
>  #define CTL_FLUSH_MASK_CTL              BIT(17)
> @@ -42,6 +43,7 @@
>  #define  DSC_IDX        22
>  #define  INTF_IDX       31
>  #define WB_IDX          16
> +#define  DSPP_IDX       29  /* From DPU hw rev 7.x.x */
>  #define CTL_INVALID_BIT                 0xffff
>  #define CTL_DEFAULT_GROUP_ID		0xf
>  
> @@ -113,6 +115,9 @@ static inline void dpu_hw_ctl_clear_pending_flush(struct dpu_hw_ctl *ctx)
>  	trace_dpu_hw_ctl_clear_pending_flush(ctx->pending_flush_mask,
>  				     dpu_hw_ctl_get_flush_register(ctx));
>  	ctx->pending_flush_mask = 0x0;
> +
> +	memset(ctx->pending_dspp_flush_mask, 0,
> +		sizeof(ctx->pending_dspp_flush_mask));
>  }
>  
>  static inline void dpu_hw_ctl_update_pending_flush(struct dpu_hw_ctl *ctx,
> @@ -130,6 +135,8 @@ static u32 dpu_hw_ctl_get_pending_flush(struct dpu_hw_ctl *ctx)
>  
>  static inline void dpu_hw_ctl_trigger_flush_v1(struct dpu_hw_ctl *ctx)
>  {
> +	int dspp;
> +
>  	if (ctx->pending_flush_mask & BIT(MERGE_3D_IDX))
>  		DPU_REG_WRITE(&ctx->hw, CTL_MERGE_3D_FLUSH,
>  				ctx->pending_merge_3d_flush_mask);
> @@ -140,6 +147,12 @@ static inline void dpu_hw_ctl_trigger_flush_v1(struct dpu_hw_ctl *ctx)
>  		DPU_REG_WRITE(&ctx->hw, CTL_WB_FLUSH,
>  				ctx->pending_wb_flush_mask);
>  
> +	for (dspp = DSPP_0; dspp < DSPP_MAX; dspp++)
> +		if (ctx->pending_flush_mask & BIT(DSPP_IDX) &&

In earlier review I meant to have this top part of the conditional
outside of the for loop, since it's independent of it (= the dspp
variable).

> +		    ctx->pending_dspp_flush_mask[dspp - DSPP_0])
> +			DPU_REG_WRITE(&ctx->hw, CTL_DSPP_n_FLUSH(dspp - DSPP_0),
> +				ctx->pending_dspp_flush_mask[dspp - DSPP_0]);
> +
>  	DPU_REG_WRITE(&ctx->hw, CTL_FLUSH, ctx->pending_flush_mask);
>  }
>  
> @@ -287,7 +300,7 @@ static void dpu_hw_ctl_update_pending_flush_merge_3d_v1(struct dpu_hw_ctl *ctx,
>  }
>  
>  static void dpu_hw_ctl_update_pending_flush_dspp(struct dpu_hw_ctl *ctx,
> -	enum dpu_dspp dspp)
> +	enum dpu_dspp dspp, u32 dspp_sub_blk)
>  {
>  	switch (dspp) {
>  	case DSPP_0:
> @@ -307,6 +320,29 @@ static void dpu_hw_ctl_update_pending_flush_dspp(struct dpu_hw_ctl *ctx,
>  	}
>  }
>  
> +static void dpu_hw_ctl_update_pending_flush_dspp_subblocks(

Nit: sub_blocks (to match the sub_blk style used across the rest of this
patch...)

- Marijn

> +	struct dpu_hw_ctl *ctx,	enum dpu_dspp dspp, u32 dspp_sub_blk)
> +{
> +	if (dspp >= DSPP_MAX)
> +		return;
> +
> +	switch (dspp_sub_blk) {
> +	case DPU_DSPP_IGC:
> +		ctx->pending_dspp_flush_mask[dspp - DSPP_0] |= BIT(2);
> +		break;
> +	case DPU_DSPP_PCC:
> +		ctx->pending_dspp_flush_mask[dspp - DSPP_0] |= BIT(4);
> +		break;
> +	case DPU_DSPP_GC:
> +		ctx->pending_dspp_flush_mask[dspp - DSPP_0] |= BIT(5);
> +		break;
> +	default:
> +		return;
> +	}
> +
> +	ctx->pending_flush_mask |= BIT(DSPP_IDX);
> +}
> +
>  static u32 dpu_hw_ctl_poll_reset_status(struct dpu_hw_ctl *ctx, u32 timeout_us)
>  {
>  	struct dpu_hw_blk_reg_map *c = &ctx->hw;
> @@ -675,7 +711,11 @@ static void _setup_ctl_ops(struct dpu_hw_ctl_ops *ops,
>  	ops->setup_blendstage = dpu_hw_ctl_setup_blendstage;
>  	ops->update_pending_flush_sspp = dpu_hw_ctl_update_pending_flush_sspp;
>  	ops->update_pending_flush_mixer = dpu_hw_ctl_update_pending_flush_mixer;
> -	ops->update_pending_flush_dspp = dpu_hw_ctl_update_pending_flush_dspp;
> +	if (cap & BIT(DPU_CTL_DSPP_SUB_BLOCK_FLUSH))
> +		ops->update_pending_flush_dspp = dpu_hw_ctl_update_pending_flush_dspp_subblocks;
> +	else
> +		ops->update_pending_flush_dspp = dpu_hw_ctl_update_pending_flush_dspp;
> +
>  	if (cap & BIT(DPU_CTL_FETCH_ACTIVE))
>  		ops->set_active_pipes = dpu_hw_ctl_set_fetch_pipe_active;
>  };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> index 96c012e..78611a8 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> @@ -152,9 +152,11 @@ struct dpu_hw_ctl_ops {
>  	 * No effect on hardware
>  	 * @ctx       : ctl path ctx pointer
>  	 * @blk       : DSPP block index
> +	 * @dspp_sub_blk : DSPP sub-block index
>  	 */
>  	void (*update_pending_flush_dspp)(struct dpu_hw_ctl *ctx,
> -		enum dpu_dspp blk);
> +		enum dpu_dspp blk, u32 dspp_sub_blk);
> +
>  	/**
>  	 * Write the value of the pending_flush_mask to hardware
>  	 * @ctx       : ctl path ctx pointer
> @@ -242,6 +244,7 @@ struct dpu_hw_ctl {
>  	u32 pending_intf_flush_mask;
>  	u32 pending_wb_flush_mask;
>  	u32 pending_merge_3d_flush_mask;
> +	u32 pending_dspp_flush_mask[DSPP_MAX - DSPP_0];
>  
>  	/* ops */
>  	struct dpu_hw_ctl_ops ops;
> -- 
> 2.7.4
> 
