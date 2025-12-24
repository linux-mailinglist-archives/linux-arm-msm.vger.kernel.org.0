Return-Path: <linux-arm-msm+bounces-86598-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AD293CDCF6B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 18:47:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C7CC6301738D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 17:46:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3AA832862E;
	Wed, 24 Dec 2025 17:46:50 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [5.144.164.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B6F3277A4
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 17:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.144.164.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766598410; cv=none; b=CLAXh6x/jKj7W8RyVvypizR0O5q2uffFNPgS5kBvFpmBZu6H+90U76XInKVSchKUkjv25OU3YmNFVTubkpG3EDVQLTr/g/Y8o6yUQ174+PSlgnVd1up2uc7DakXoSevn9Vo9l9lOVtzuvC57INknstqN4zASlPrUc3MB7vDRz7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766598410; c=relaxed/simple;
	bh=MZH/siXPWCBU/10IbjiS3JvKaSQ9wuTb7bPyTJNnI3U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rCISOQpdtROxIam9AOJwPYS1rHWWmiilfJVfk3X3qXQlR7kTcUY6zBL4tMy5Idg3KgtE3rhUMTLEz940LwSGVnJqSer2L8eQoHltHSfCyjnxgwsVc3/FgRi2QScnIyXJ0rojrkzANi65Bao8RXFv1vqJEpvE+E94lHWKO04iE3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org; spf=pass smtp.mailfrom=somainline.org; arc=none smtp.client-ip=5.144.164.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=somainline.org
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 1C1483EDC6;
	Wed, 24 Dec 2025 18:46:45 +0100 (CET)
Date: Wed, 24 Dec 2025 18:46:43 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Teguh Sobirin <teguh@sobir.in>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] drm/msm/dpu: fix WD timer handling on DPU 8.x
Message-ID: <aUwia8142ACgDWBM@SoMainline.org>
References: <20251224-intf-fix-wd-v4-0-07a0926fafd2@oss.qualcomm.com>
 <20251224-intf-fix-wd-v4-2-07a0926fafd2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251224-intf-fix-wd-v4-2-07a0926fafd2@oss.qualcomm.com>

On 2025-12-24 17:33:50, Dmitry Baryshkov wrote:
> Since DPU 8.x Watchdog timer settings were moved from the TOP to the
> INTF block. Support programming the timer in the INTF block.
> 
> Fixes: e955a3f0d86e ("drm/msm/dpu: Implement tearcheck support on INTF block")

I was somewhat fine with keeping this tag in patch 1/2; while that doesn't
necessarily trigger a bug because the condition was not reached back then,
the logic was still in the wrong place (which I may have blindly inferred from
downstream, and/or because the initialization of vsync_cfg was there despite not
being used yet).

However I don't think that patch resulted in any invalid behaviour regarding the
watchdog timer.  The entire setup was already wrong to begin with and my patch
only made it *slightly less wrong* by at least moving the TE setup to the INTF
for 5.x; it made sure to keep the WD setup in the original spot.  That it was
later moved for DPU 8.x was not something that patch intended to concern itself
with.

If anything (and in other words) my patch should have had a Fixes: on the first
commit that added DPU 5.0 support - for not checking the registers properly -
and this patch should have a Fixes: on the first introduction of DPU 8.x for the
same reason instead?

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 48 +++++++++++++++++++++++++++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h |  3 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c  |  7 -----
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h |  7 +++++
>  5 files changed, 55 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 0482b2bb5a9e..0e53d9869ae9 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -792,7 +792,7 @@ static void _dpu_encoder_update_vsync_source(struct dpu_encoder_virt *dpu_enc,
>  
>  		if (phys_enc->has_intf_te && phys_enc->hw_intf->ops.vsync_sel)
>  			phys_enc->hw_intf->ops.vsync_sel(phys_enc->hw_intf,
> -							 vsync_cfg.vsync_source);
> +							 &vsync_cfg);

Be sure to also move the initialization of vsync_cfg, at least ->frame_rate
outside of the if (hw_mdptop->ops.setup_vsync_source) above (related to the
first patch).

This vsync_sel function is using frame_rate now in your
dpu_hw_intf_vsync_sel_v8().

>  	}
>  }
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> index a80ac82a9625..7967d9bd2f44 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> @@ -67,6 +67,10 @@
>  #define INTF_MISR_CTRL                  0x180
>  #define INTF_MISR_SIGNATURE             0x184
>  
> +#define INTF_WD_TIMER_0_CTL		0x230
> +#define INTF_WD_TIMER_0_CTL2		0x234
> +#define INTF_WD_TIMER_0_LOAD_VALUE	0x238

All other constants use spaces for alignment, making this look odd.

> +
>  #define INTF_MUX                        0x25C
>  #define INTF_STATUS                     0x26C
>  #define INTF_AVR_CONTROL                0x270
> @@ -475,7 +479,7 @@ static int dpu_hw_intf_get_vsync_info(struct dpu_hw_intf *intf,
>  }
>  
>  static void dpu_hw_intf_vsync_sel(struct dpu_hw_intf *intf,
> -				  enum dpu_vsync_source vsync_source)
> +				  struct dpu_vsync_source_cfg *cfg)
>  {
>  	struct dpu_hw_blk_reg_map *c;
>  
> @@ -484,7 +488,42 @@ static void dpu_hw_intf_vsync_sel(struct dpu_hw_intf *intf,
>  
>  	c = &intf->hw;
>  
> -	DPU_REG_WRITE(c, INTF_TEAR_MDP_VSYNC_SEL, (vsync_source & 0xf));
> +	DPU_REG_WRITE(c, INTF_TEAR_MDP_VSYNC_SEL, (cfg->vsync_source & 0xf));
> +}
> +
> +static void dpu_hw_intf_vsync_sel_v8(struct dpu_hw_intf *intf,
> +				  struct dpu_vsync_source_cfg *cfg)
> +{
> +	struct dpu_hw_blk_reg_map *c;
> +
> +	if (!intf)
> +		return;
> +
> +	c = &intf->hw;
> +
> +	if (cfg->vsync_source >= DPU_VSYNC_SOURCE_WD_TIMER_4 &&
> +	    cfg->vsync_source <= DPU_VSYNC_SOURCE_WD_TIMER_1) {

It's quite nasty that those timers are defined in reverse order, otherwise one
might think this wouldn't match anything at all.

Does it make sense to also mention INTF sources in the warning below,
and/or change the condition to explicitly check for GPIO and INTF sources?  Perhaps
in an ELSE to the ==TIMER0 so that it's all clearly separated?

> +		pr_warn_once("DPU 8.x supports only GPIOs and timer0 as TE sources\n");
> +		return;
> +	}
> +
> +	if (cfg->vsync_source == DPU_VSYNC_SOURCE_WD_TIMER_0) {
> +		u32 reg;
> +
> +		DPU_REG_WRITE(c, INTF_WD_TIMER_0_LOAD_VALUE,
> +			      CALCULATE_WD_LOAD_VALUE(cfg->frame_rate));

Repeat: it's used here, but you didn't assign it on the call-side
because hw_mdptop->ops.setup_vsync_source is NULL.

> +
> +		DPU_REG_WRITE(c, INTF_WD_TIMER_0_CTL, BIT(0)); /* clear timer */
> +		reg = DPU_REG_READ(c, INTF_WD_TIMER_0_CTL2);
> +		reg |= BIT(8);		/* enable heartbeat timer */
> +		reg |= BIT(0);		/* enable WD timer */
> +		DPU_REG_WRITE(c, INTF_WD_TIMER_0_CTL2, reg);
> +
> +		/* make sure that timers are enabled/disabled for vsync state */
> +		wmb();
> +	}
> +
> +	dpu_hw_intf_vsync_sel(intf, cfg);
>  }
>  
>  static void dpu_hw_intf_disable_autorefresh(struct dpu_hw_intf *intf,
> @@ -598,7 +637,10 @@ struct dpu_hw_intf *dpu_hw_intf_init(struct drm_device *dev,
>  		c->ops.enable_tearcheck = dpu_hw_intf_enable_te;
>  		c->ops.disable_tearcheck = dpu_hw_intf_disable_te;
>  		c->ops.connect_external_te = dpu_hw_intf_connect_external_te;
> -		c->ops.vsync_sel = dpu_hw_intf_vsync_sel;
> +		if (mdss_rev->core_major_ver >= 8)
> +			c->ops.vsync_sel = dpu_hw_intf_vsync_sel_v8;
> +		else
> +			c->ops.vsync_sel = dpu_hw_intf_vsync_sel;
>  		c->ops.disable_autorefresh = dpu_hw_intf_disable_autorefresh;
>  	}
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> index f31067a9aaf1..e84ab849d71a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> @@ -12,6 +12,7 @@
>  #include "dpu_hw_util.h"
>  
>  struct dpu_hw_intf;
> +struct dpu_vsync_source_cfg;
>  
>  /* intf timing settings */
>  struct dpu_hw_intf_timing_params {
> @@ -107,7 +108,7 @@ struct dpu_hw_intf_ops {
>  
>  	int (*connect_external_te)(struct dpu_hw_intf *intf, bool enable_external_te);
>  
> -	void (*vsync_sel)(struct dpu_hw_intf *intf, enum dpu_vsync_source vsync_source);
> +	void (*vsync_sel)(struct dpu_hw_intf *intf, struct dpu_vsync_source_cfg *cfg);

Should we rename it now?

- Marijn

>  
>  	/**
>  	 * Disable autorefresh if enabled
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
> index 96dc10589bee..1ebd75d4f9be 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
> @@ -22,13 +22,6 @@
>  #define TRAFFIC_SHAPER_WR_CLIENT(num)     (0x060 + (num * 4))
>  #define TRAFFIC_SHAPER_FIXPOINT_FACTOR    4
>  
> -#define MDP_TICK_COUNT                    16
> -#define XO_CLK_RATE                       19200
> -#define MS_TICKS_IN_SEC                   1000
> -
> -#define CALCULATE_WD_LOAD_VALUE(fps) \
> -	((uint32_t)((MS_TICKS_IN_SEC * XO_CLK_RATE)/(MDP_TICK_COUNT * fps)))
> -
>  static void dpu_hw_setup_split_pipe(struct dpu_hw_mdp *mdp,
>  		struct split_pipe_cfg *cfg)
>  {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
> index 67b08e99335d..6fe65bc3bff4 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
> @@ -21,6 +21,13 @@
>  
>  #define TO_S15D16(_x_)((_x_) << 7)
>  
> +#define MDP_TICK_COUNT                    16
> +#define XO_CLK_RATE                       19200
> +#define MS_TICKS_IN_SEC                   1000
> +
> +#define CALCULATE_WD_LOAD_VALUE(fps) \
> +	((uint32_t)((MS_TICKS_IN_SEC * XO_CLK_RATE)/(MDP_TICK_COUNT * fps)))
> +
>  extern const struct dpu_csc_cfg dpu_csc_YUV2RGB_601L;
>  extern const struct dpu_csc_cfg dpu_csc10_YUV2RGB_601L;
>  extern const struct dpu_csc_cfg dpu_csc10_rgb2yuv_601l;
> 
> -- 
> 2.47.3
> 

