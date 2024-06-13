Return-Path: <linux-arm-msm+bounces-22635-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 717C7907AE6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 20:17:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 271A92869E1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 18:17:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7FB814A62D;
	Thu, 13 Jun 2024 18:17:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [5.144.164.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92B214A629
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2024 18:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.144.164.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718302640; cv=none; b=X5YjWnjp8GTeuQX9YDtmStLgXtBVeEYDQVFmoTu9/seCC4PLbyvTGHVstU04krrNAmCbrpGSVyhTXCxakTJuFiV/KrxfPiOIrWDmYeY/kdouoNR/IIXgjcMJCapRxG3aGlk+hCsbLTc6wrTT0R3M5YVUWo0tJtqNLSJYyLKwxaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718302640; c=relaxed/simple;
	bh=nT1nwhsJFtwnddjnVVG5bbkRbWne61GdQuzAGFSzJ2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FCioY3TP+DiFO3bRuv2GOHZtAmUbPJ7jCjUUDqFTcu30SBCHE6WCWBjS3qpUsThEm1EVGq3oYm9iQZxHchIizypyK84nF4/3IcvWDix9zxaNKSsQbh1oNPbIu71016ZoWrFbrPIPte/CEb+0EiljNzW+60Jjr+2WXDm1r7DnpKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org; spf=pass smtp.mailfrom=somainline.org; arc=none smtp.client-ip=5.144.164.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=somainline.org
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 591EB3EF1E;
	Thu, 13 Jun 2024 20:17:16 +0200 (CEST)
Date: Thu, 13 Jun 2024 20:17:15 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krishna Manikandan <quic_mkrishn@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/8] drm/msm/dpu: convert vsync source defines to the
 enum
Message-ID: <l3esy4ciy4envu35edg35sip5od6ltxpazpddo2w6vwmqomjky@azgqxi4la3hy>
References: <20240613-dpu-handle-te-signal-v2-0-67a0116b5366@linaro.org>
 <20240613-dpu-handle-te-signal-v2-2-67a0116b5366@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240613-dpu-handle-te-signal-v2-2-67a0116b5366@linaro.org>

On 2024-06-13 20:05:05, Dmitry Baryshkov wrote:
> Add enum dpu_vsync_source instead of a series of defines. Use this enum
> to pass vsync information.
> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c |  2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h |  2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h | 26 ++++++++++++++------------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h  |  2 +-
>  5 files changed, 18 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 119f3ea50a7c..4988a1029431 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -747,7 +747,7 @@ static void _dpu_encoder_update_vsync_source(struct dpu_encoder_virt *dpu_enc,
>  		if (disp_info->is_te_using_watchdog_timer)
>  			vsync_cfg.vsync_source = DPU_VSYNC_SOURCE_WD_TIMER_0;
>  		else
> -			vsync_cfg.vsync_source = DPU_VSYNC0_SOURCE_GPIO;
> +			vsync_cfg.vsync_source = DPU_VSYNC_SOURCE_GPIO_0;
>  
>  		hw_mdptop->ops.setup_vsync_source(hw_mdptop, &vsync_cfg);
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> index 225c1c7768ff..96f6160cf607 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> @@ -462,7 +462,7 @@ static int dpu_hw_intf_get_vsync_info(struct dpu_hw_intf *intf,
>  }
>  
>  static void dpu_hw_intf_vsync_sel(struct dpu_hw_intf *intf,
> -		u32 vsync_source)
> +				  enum dpu_vsync_source vsync_source)
>  {
>  	struct dpu_hw_blk_reg_map *c;
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> index f9015c67a574..ac244f0b33fb 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> @@ -107,7 +107,7 @@ struct dpu_hw_intf_ops {
>  
>  	int (*connect_external_te)(struct dpu_hw_intf *intf, bool enable_external_te);
>  
> -	void (*vsync_sel)(struct dpu_hw_intf *intf, u32 vsync_source);
> +	void (*vsync_sel)(struct dpu_hw_intf *intf, enum dpu_vsync_source vsync_source);
>  
>  	/**
>  	 * Disable autorefresh if enabled
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> index 66759623fc42..a2eff36a2224 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> @@ -54,18 +54,20 @@
>  #define DPU_BLEND_BG_INV_MOD_ALPHA	(1 << 12)
>  #define DPU_BLEND_BG_TRANSP_EN		(1 << 13)
>  
> -#define DPU_VSYNC0_SOURCE_GPIO		0
> -#define DPU_VSYNC1_SOURCE_GPIO		1
> -#define DPU_VSYNC2_SOURCE_GPIO		2
> -#define DPU_VSYNC_SOURCE_INTF_0		3
> -#define DPU_VSYNC_SOURCE_INTF_1		4
> -#define DPU_VSYNC_SOURCE_INTF_2		5
> -#define DPU_VSYNC_SOURCE_INTF_3		6
> -#define DPU_VSYNC_SOURCE_WD_TIMER_4	11
> -#define DPU_VSYNC_SOURCE_WD_TIMER_3	12
> -#define DPU_VSYNC_SOURCE_WD_TIMER_2	13
> -#define DPU_VSYNC_SOURCE_WD_TIMER_1	14
> -#define DPU_VSYNC_SOURCE_WD_TIMER_0	15
> +enum dpu_vsync_source {
> +	DPU_VSYNC_SOURCE_GPIO_0,
> +	DPU_VSYNC_SOURCE_GPIO_1,
> +	DPU_VSYNC_SOURCE_GPIO_2,

While at it, rename this to _P / _S / _E to match the other patches/code?

- Marijn

> +	DPU_VSYNC_SOURCE_INTF_0 = 3,
> +	DPU_VSYNC_SOURCE_INTF_1,
> +	DPU_VSYNC_SOURCE_INTF_2,
> +	DPU_VSYNC_SOURCE_INTF_3,
> +	DPU_VSYNC_SOURCE_WD_TIMER_4 = 11,
> +	DPU_VSYNC_SOURCE_WD_TIMER_3,
> +	DPU_VSYNC_SOURCE_WD_TIMER_2,
> +	DPU_VSYNC_SOURCE_WD_TIMER_1,
> +	DPU_VSYNC_SOURCE_WD_TIMER_0,
> +};
>  
>  enum dpu_hw_blk_type {
>  	DPU_HW_BLK_TOP = 0,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h
> index 6f3dc98087df..5c9a7ede991e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h
> @@ -64,7 +64,7 @@ struct dpu_vsync_source_cfg {
>  	u32 pp_count;
>  	u32 frame_rate;
>  	u32 ppnumber[PINGPONG_MAX];
> -	u32 vsync_source;
> +	enum dpu_vsync_source vsync_source;
>  };
>  
>  /**
> 
> -- 
> 2.39.2
> 

