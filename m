Return-Path: <linux-arm-msm+bounces-23702-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D0F913407
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Jun 2024 14:48:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8522AB23971
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Jun 2024 12:48:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E1F0155342;
	Sat, 22 Jun 2024 12:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Jldh+qU5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C13A31CA9C
	for <linux-arm-msm@vger.kernel.org>; Sat, 22 Jun 2024 12:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719060493; cv=none; b=Vu3HtuuvA/zxKoskfD+pUmsRVsi8JksKKEDbzfeBYSeCsqPh2sRl5AMnY0T53F+6n9pkb9KUmhMSFVs3QHCYhmGNY9vMSOEX5YpnmxMSGNen5ZrXMbn+kUZ1Mqogeg9lxQqyJD3+PyaJsa4QkynRC8avQTFVi3pE0VLBd40n9UM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719060493; c=relaxed/simple;
	bh=KLCgkGvxQQObDNE0tZPyDFWipoGL33A5pTK/r40Ftys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uCqrwgnJTujkz7l3CxbZQxGU2pnYlZyrnrbQCbhhXTqZBNl6l+ZzsQDSuUwAiain/w9/J7UagW1n5UoRZsXn6a9+usida9mwr3FBcEIseBq9sYWjR1G7GC8x8vV1ZEEnQ0rgZJnEmKZ1B3ExiuNWSsbR5RsA9UHoSRWAG4ezqOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Jldh+qU5; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2eaa89464a3so33590071fa.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 22 Jun 2024 05:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719060490; x=1719665290; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J4NrzrquMu2wm+RaIJw1sglld6u4UvhjbmFh93smTfA=;
        b=Jldh+qU5s3WDNNs5wjW9+xHvGWQO6BFXNEKONnp0gngyYCmBYUu0b5Ty5XpMOy3yAY
         IXGDtxm/VVADgTk03sy9htALWVSHufNBUmc2DZh0i4EOuy/hfbEF8IXVwin+usxVHG9u
         tn/l029GRbq1dD8+QcvAJtsN2Yzax2BpD0XcvQIPs3smavVb0cjf7aXZ6yTWA0hOrS3i
         Vjm4pQ1ljcuQXab3NILAMOhcJolr1f/8LNzs11gzsUafiiNsEil7KOO8Gbcuf7/CiSwq
         IuqFsDyEsWTsq5310eUHOpyoTsrXcHMlRyLAa7WJ9TxmWcvqqA3UdjX2h4CjhL5flhmI
         Lk+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719060490; x=1719665290;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J4NrzrquMu2wm+RaIJw1sglld6u4UvhjbmFh93smTfA=;
        b=YWbM6F8/8J1INpfE9+8mBADJVydKOTM1NNM7NXU+7Ann4gA5cTfrHX9gOQnQHYdZ6w
         MgUZCJzhCDOsTAOfoxT4uaoT98eYCyU2Ohy8D7jc1J0NQcxMAxV9tcgMjTmY9CVuimxI
         3SBVxDkWK/DwP9THSKmEaFIqFiywQXP+0/wZNDKscBOjqrY4cmd6ZTiestDgKEl89g9V
         RvE5c5B5Y4mABpGU0xcRe7DmWYSymOT3pjkXSp/XwsNXQOB/UQECTZKFjDrPVg5blctq
         8qxR52JB80Us+l3SbKUa9jqJpeviM0Xp1jCID5BkCn05Q5wj3m+mZkJPZjdC9i/+TiG+
         fzww==
X-Forwarded-Encrypted: i=1; AJvYcCUqwKpTTkftJf4J1L1IJ0erzjlOw1A5jTnNo7c3GKaXgs+lBUzWrtoSPenwWUjt3E5YRr833qOktSj5scdkr4T+TxNiLJCrSgIAvdJ2dw==
X-Gm-Message-State: AOJu0YzeYf5tLBxE/RurENSFu/Cvmkrq5/D/Qa3i/WUihmVP2hnv7Bb/
	/cOFacYmW9RKeC+QJTrfpzjHFZ34ZkhI/IJkntLOQEkkh8legNMbaGwdOIxJeiE=
X-Google-Smtp-Source: AGHT+IHUtcMthGyb2HAUJ4dSJgS1RvVhsTp9d+IwnhEYCqcGykisBn3lTkmOciLbVOJPHTGKWoptCw==
X-Received: by 2002:a2e:998e:0:b0:2ec:4d5b:3d03 with SMTP id 38308e7fff4ca-2ec579845dbmr6014601fa.31.1719060489910;
        Sat, 22 Jun 2024 05:48:09 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec50860130sm3380151fa.140.2024.06.22.05.48.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jun 2024 05:48:09 -0700 (PDT)
Date: Sat, 22 Jun 2024 15:48:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krishna Manikandan <quic_mkrishn@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 5/8] drm/msm/dpu: rework vsync_source handling
Message-ID: <zxnlq4vc7w2j6jzwyuyvg65qguexs75y5urn3xub5wlqdm2hlu@ntfkwwvbplax>
References: <20240613-dpu-handle-te-signal-v2-0-67a0116b5366@linaro.org>
 <20240613-dpu-handle-te-signal-v2-5-67a0116b5366@linaro.org>
 <flxejwpqw75thyeu5ycnlichh37l4ltuied36jjzvgifury7lp@gjjcbohuhfa3>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <flxejwpqw75thyeu5ycnlichh37l4ltuied36jjzvgifury7lp@gjjcbohuhfa3>

On Thu, Jun 13, 2024 at 08:21:59PM GMT, Marijn Suijten wrote:
> Maybe retitle this to something that more closely resembles "remove unset
> is_te_using_watchdog_timer field"?

Well, it really moves vsync_source selection to
_dpu_kms_initialize_dsi(), it doesn't just drop the
is_te_using_watchdog_timer.

> 
> On 2024-06-13 20:05:08, Dmitry Baryshkov wrote:
> > The struct msm_display_info has is_te_using_watchdog_timer field which
> > is neither used anywhere nor is flexible enough to specify different
> 
> Well, it's "used", but not "set" (to anything other than the zero-initialized
> default). s/used/set?

ack

> 
> > sources. Replace it with the field specifying the vsync source using
> > enum dpu_vsync_source.
> > 
> > Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Patch itself is fine, just think the title could be clearer:
> 
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> 
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 5 +----
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h | 5 ++---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 2 ++
> >  3 files changed, 5 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > index bd37a56b4d03..b147f8814a18 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > @@ -743,10 +743,7 @@ static void _dpu_encoder_update_vsync_source(struct dpu_encoder_virt *dpu_enc,
> >  		vsync_cfg.pp_count = dpu_enc->num_phys_encs;
> >  		vsync_cfg.frame_rate = drm_mode_vrefresh(&dpu_enc->base.crtc->state->adjusted_mode);
> >  
> > -		if (disp_info->is_te_using_watchdog_timer)
> > -			vsync_cfg.vsync_source = DPU_VSYNC_SOURCE_WD_TIMER_0;
> > -		else
> > -			vsync_cfg.vsync_source = DPU_VSYNC_SOURCE_GPIO_0;
> > +		vsync_cfg.vsync_source = disp_info->vsync_source;
> >  
> >  		hw_mdptop->ops.setup_vsync_source(hw_mdptop, &vsync_cfg);
> >  
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> > index 76be77e30954..cb59bd4436f4 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> > @@ -26,15 +26,14 @@
> >   * @h_tile_instance:    Controller instance used per tile. Number of elements is
> >   *                      based on num_of_h_tiles
> >   * @is_cmd_mode		Boolean to indicate if the CMD mode is requested
> > - * @is_te_using_watchdog_timer:  Boolean to indicate watchdog TE is
> > - *				 used instead of panel TE in cmd mode panels
> > + * @vsync_source:	Source of the TE signal for DSI CMD devices
> >   */
> >  struct msm_display_info {
> >  	enum dpu_intf_type intf_type;
> >  	uint32_t num_of_h_tiles;
> >  	uint32_t h_tile_instance[MAX_H_TILES_PER_DISPLAY];
> >  	bool is_cmd_mode;
> > -	bool is_te_using_watchdog_timer;
> > +	enum dpu_vsync_source vsync_source;
> >  };
> >  
> >  /**
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > index 1955848b1b78..e9991f3756d4 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > @@ -543,6 +543,8 @@ static int _dpu_kms_initialize_dsi(struct drm_device *dev,
> >  
> >  		info.is_cmd_mode = msm_dsi_is_cmd_mode(priv->dsi[i]);
> >  
> > +		info.vsync_source = DPU_VSYNC_SOURCE_GPIO_0;
> > +
> >  		encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_DSI, &info);
> >  		if (IS_ERR(encoder)) {
> >  			DPU_ERROR("encoder init failed for dsi display\n");
> > 
> > -- 
> > 2.39.2
> > 

-- 
With best wishes
Dmitry

