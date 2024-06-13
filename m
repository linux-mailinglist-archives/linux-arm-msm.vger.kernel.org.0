Return-Path: <linux-arm-msm+bounces-22642-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD13907B83
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 20:36:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 936AB1C23C24
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 18:36:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1271E14A0AD;
	Thu, 13 Jun 2024 18:33:33 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [5.144.164.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F68813D63D
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2024 18:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.144.164.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718303613; cv=none; b=tlLSJ03g+tq8eclDJR9zzpDb2PtvD/xblKNvPgDYnuDe7d2leF/RWh46d6QnIcRUKdatpq8N5vlImYIr7RvqbKfVepkqMllgQK4Qg6fdz96uAIMbg866OKNEc5P67McMwYo11/zKTglXOnSVbBe7XWGD356eBiXNy0x0kwTfbeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718303613; c=relaxed/simple;
	bh=CpdX3pu56PQzLUvbCx0DROlJfZb5I7MJFbTQSg5roJ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Aiz2+YdtVSPRDxJJhLfOJykJgonqPLP3CTXiH/FYy4bJzZl3eSs3ri+kF3dH9kHLtXFp363LjcjhJY3rqCCtDjmurEOMwzz+bxC9q4L9ChYJ1xyqlK2JWoyB52HitpnxX+u35Sja+bI1XgqWQgeyDLTotXiShGfHiFqHBrszUN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org; spf=pass smtp.mailfrom=somainline.org; arc=none smtp.client-ip=5.144.164.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=somainline.org
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r2.th.seeweb.it (Postfix) with ESMTPSA id ACE683EBA4;
	Thu, 13 Jun 2024 20:14:08 +0200 (CEST)
Date: Thu, 13 Jun 2024 20:14:07 +0200
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
Subject: Re: [PATCH v2 7/8] drm/msm/dpu: support setting the TE source
Message-ID: <cu3iicchkdmpkm6fttqv42hw2zfa2bs4wk6xsbeu5m4poav4s5@l7kbg43sfzrb>
References: <20240613-dpu-handle-te-signal-v2-0-67a0116b5366@linaro.org>
 <20240613-dpu-handle-te-signal-v2-7-67a0116b5366@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240613-dpu-handle-te-signal-v2-7-67a0116b5366@linaro.org>

On 2024-06-13 20:05:10, Dmitry Baryshkov wrote:
> Make the DPU driver use the TE source specified in the DT. If none is
> specified, the driver defaults to the first GPIO (mdp_vsync0).

mdp_vsync_p?

> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 44 ++++++++++++++++++++++++++++++++-
>  1 file changed, 43 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index e9991f3756d4..6fcb3cf4a382 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -505,6 +505,44 @@ static void dpu_kms_wait_flush(struct msm_kms *kms, unsigned crtc_mask)
>  		dpu_kms_wait_for_commit_done(kms, crtc);
>  }
>  
> +static const char *dpu_vsync_sources[] = {
> +	[DPU_VSYNC_SOURCE_GPIO_0] = "mdp_vsync_p",
> +	[DPU_VSYNC_SOURCE_GPIO_1] = "mdp_vsync_s",
> +	[DPU_VSYNC_SOURCE_GPIO_2] = "mdp_vsync_e",
> +	[DPU_VSYNC_SOURCE_INTF_0] = "mdp_intf0",
> +	[DPU_VSYNC_SOURCE_INTF_1] = "mdp_intf1",
> +	[DPU_VSYNC_SOURCE_INTF_2] = "mdp_intf2",
> +	[DPU_VSYNC_SOURCE_INTF_3] = "mdp_intf3",
> +	[DPU_VSYNC_SOURCE_WD_TIMER_0] = "timer0",
> +	[DPU_VSYNC_SOURCE_WD_TIMER_1] = "timer1",
> +	[DPU_VSYNC_SOURCE_WD_TIMER_2] = "timer2",
> +	[DPU_VSYNC_SOURCE_WD_TIMER_3] = "timer3",
> +	[DPU_VSYNC_SOURCE_WD_TIMER_4] = "timer4",
> +};
> +
> +static int dpu_kms_dsi_set_te_source(struct msm_display_info *info,
> +				     struct msm_dsi *dsi)
> +{
> +	const char *te_source = msm_dsi_get_te_source(dsi);

Just checking: if the TE source is different and one has dual-DSI, it must be
set on both controllers?

> +	int i;
> +
> +	if (!te_source) {
> +		info->vsync_source = DPU_VSYNC_SOURCE_GPIO_0;
> +		return 0;
> +	}
> +
> +	/* we can not use match_string since dpu_vsync_sources is a sparse array */

Instead of having gaps in the array, you could also store both the vsync_source
and name as the array elements?

> +	for (i = 0; i < ARRAY_SIZE(dpu_vsync_sources); i++) {
> +		if (dpu_vsync_sources[i] &&
> +		    !strcmp(dpu_vsync_sources[i], te_source)) {
> +			info->vsync_source = i;
> +			return 0;
> +		}
> +	}
> +
> +	return -EINVAL;
> +}
> +
>  static int _dpu_kms_initialize_dsi(struct drm_device *dev,
>  				    struct msm_drm_private *priv,
>  				    struct dpu_kms *dpu_kms)
> @@ -543,7 +581,11 @@ static int _dpu_kms_initialize_dsi(struct drm_device *dev,
>  
>  		info.is_cmd_mode = msm_dsi_is_cmd_mode(priv->dsi[i]);
>  
> -		info.vsync_source = DPU_VSYNC_SOURCE_GPIO_0;
> +		rc = dpu_kms_dsi_set_te_source(&info, priv->dsi[i]);
> +		if (rc) {
> +			DPU_ERROR("failed to identify TE source for dsi display\n");
> +			return rc;
> +		}
>  
>  		encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_DSI, &info);
>  		if (IS_ERR(encoder)) {
> 
> -- 
> 2.39.2
> 

