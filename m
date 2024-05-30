Return-Path: <linux-arm-msm+bounces-21096-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2876D8D4AEB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 13:35:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D3D00282659
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 11:35:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BEC5171E4D;
	Thu, 30 May 2024 11:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lLlxvgAB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66511183989
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 11:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717068911; cv=none; b=del6AByMska2XnAVLJVT9u1Hvhy3mWNUFmKr8BwDLUtWVDg+j6zEGn9DjR/E65eE/2PEvkwJr9SDRZFFcf7Ep4OWoz4ilqAJWM1dJOUl/wKkR6CKJAI76FkzXVZsZeYrqCDUuiZB1r+mPydtlzVbIx3LLHqM5dd0GyPeO26wdY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717068911; c=relaxed/simple;
	bh=BoQASBPUqaQo+E82MXqt+QyRpl9UFAs3ffdChOkkvhg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C+XRBbRtoFzpTWGAjEX2BWFKY1RDpp+72/316bxu40It2d4DZel2W9XJJqSqB7URlb7/W2+KBUU3crsLv770nRIxxf9E8FBNgqpXLqCr4CXqc1/gBKs+QR3CDbR/9FUcynWbU03TysvSjALajb3exM4o4gNpaet5YoPMDyUm7DE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lLlxvgAB; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5295e488248so785426e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 04:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717068906; x=1717673706; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wxpMuKi+LXyXGnJgFY2tdfzN1kQoY6oVI5V7Y+J38bw=;
        b=lLlxvgABcyzWQH1z+szaL7TMvs7nsN/R8J/XbIlASwDJiWGvg7VBTHtmDSheqibIv8
         3HDm1N2fiOvzNhQKaM0+XxRLCGga48NMyOGaYIympGuJOIuVJWnucQtNcScGk6ALkLLx
         AykafTISeHdG97LZwitojPDiojnHWGnmiNu8wYTaskVK4GridXnxPBBKtc47fre0zu1d
         n5Vfh+3pYORJv3bpudocP18GX0eNqUwx4fDU+tQ+CnQ3cTj3kcb3YC+MeCsRAcnSZjM2
         fZY/FraGjWurAdcUKRouBkt3cAW+R0kTn26ypOfGh/aSiu1U4dmxi7QUZ+8rhqyX32KR
         VfVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717068906; x=1717673706;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wxpMuKi+LXyXGnJgFY2tdfzN1kQoY6oVI5V7Y+J38bw=;
        b=WKL0RybzpQxAfberdOFd/23pw68cy4OFfWtQdDhNeeRhgHtTggw31BeRCOiKBJcUj0
         2BduPya5gKhNGwXdnEjoLdYS+d3AlPvvH53BBDUFWZQSlId1TVvQvAVpIIgqlNT5OP3a
         aHtFon0yomOALBx64iKEPygO+6wGUQ+D4Xb4k+DeGWkGtTe1tBzF9olYS8T6VqlDKyXf
         upOcN2IQ6hrLNX2hOlHUo9Dl/xJQYr8gT7UbRIBLEUcc794oHcvqHXVgOsf7/fF1jlfL
         hWSBGkb591hAi/MIiRO776VxNLr4QyR2aohU/u5apx1aYCYynLXTTfXI1sbhXntgI7F6
         NSWw==
X-Forwarded-Encrypted: i=1; AJvYcCU3f4vNTzenDeGCFuqXs0RMsWCF97fqtTZ1hBZgjKGAE22rtOXIcDqED1pwEY0l+Ui3gGon98Iq4+soGXjayUpXjn+sLiCCD2LHIh9DsQ==
X-Gm-Message-State: AOJu0Yzy1cRuMUWgDCmpwWlZuNUUqsCFh+vLRcHsx9EiHYXhFHE3BVZg
	AHO/7jG/UKDje87gDTPnodoJwiyueJ9AiFtKtF2uk6zUCig12nB99UeaG6NmrnA=
X-Google-Smtp-Source: AGHT+IEa+chLqLIDVqsM++sBJf0eXp91/FeFjOPnSviE3q1lQzzwC22rOXWI7iSC6GcMFIT55xs9Rg==
X-Received: by 2002:a19:521a:0:b0:51d:9e17:29ea with SMTP id 2adb3069b0e04-52b7d422099mr1055198e87.15.1717068906185;
        Thu, 30 May 2024 04:35:06 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52b7043b402sm344963e87.211.2024.05.30.04.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 04:35:05 -0700 (PDT)
Date: Thu, 30 May 2024 14:35:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/7] drm/msm/hdmi: make use of the drm_connector_hdmi
 framework
Message-ID: <u63p7wuvtrcdnbzikbgucedhsgjtyrx7zknkytcy5cu3hbbsxx@jm46d2od2jmi>
References: <20240530-bridge-hdmi-connector-v3-0-a1d184d68fe3@linaro.org>
 <20240530-bridge-hdmi-connector-v3-5-a1d184d68fe3@linaro.org>
 <20240530-poised-burgundy-petrel-7affed@houat>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240530-poised-burgundy-petrel-7affed@houat>

On Thu, May 30, 2024 at 11:16:08AM +0200, Maxime Ripard wrote:
> Hi,
> 
> On Thu, May 30, 2024 at 02:12:28AM GMT, Dmitry Baryshkov wrote:
> > Setup the HDMI connector on the MSM HDMI outputs. Make use of
> > atomic_check hook and of the provided Infoframe infrastructure.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> As a general comment: I really like it, it looks super tidy. Thanks!
> 
> There's a couple of minor issues below
> 
> > -int msm_hdmi_audio_update(struct hdmi *hdmi)
> > +static int msm_hdmi_audio_update(struct hdmi *hdmi)
> >  {
> >  	struct hdmi_audio *audio = &hdmi->audio;
> > -	struct hdmi_audio_infoframe *info = &audio->infoframe;
> >  	const struct hdmi_msm_audio_arcs *arcs = NULL;
> >  	bool enabled = audio->enabled;
> >  	uint32_t acr_pkt_ctrl, vbi_pkt_ctrl, aud_pkt_ctrl;
> > -	uint32_t infofrm_ctrl, audio_config;
> > +	uint32_t audio_config;
> > +
> > +	if (!hdmi->hdmi_mode)
> > +		return -EINVAL;
> > +
> > +	DBG("audio: enabled=%d, channels=%d, rate=%d",
> > +	    audio->enabled, audio->channels, audio->rate);
> >  
> > -	DBG("audio: enabled=%d, channels=%d, channel_allocation=0x%x, "
> > -		"level_shift_value=%d, downmix_inhibit=%d, rate=%d",
> > -		audio->enabled, info->channels,  info->channel_allocation,
> > -		info->level_shift_value, info->downmix_inhibit, audio->rate);
> >  	DBG("video: power_on=%d, pixclock=%lu", hdmi->power_on, hdmi->pixclock);
> 
> pixclock should come from the connector state too. It's still calculated
> by the driver in msm_hdmi_bridge_mode_set

Yes, that's why I asked on IRC regarding the char rate and ALSA codec.
I'll see what I can do.

> 
> > @@ -341,8 +425,11 @@ int msm_hdmi_bridge_init(struct hdmi *hdmi)
> >  	bridge->funcs = &msm_hdmi_bridge_funcs;
> >  	bridge->ddc = hdmi->i2c;
> >  	bridge->type = DRM_MODE_CONNECTOR_HDMIA;
> > +	bridge->vendor = "Qualcomm";
> > +	bridge->product = "Snapdragon";
> >  	bridge->ops = DRM_BRIDGE_OP_HPD |
> >  		DRM_BRIDGE_OP_DETECT |
> > +		DRM_BRIDGE_OP_HDMI |
> >  		DRM_BRIDGE_OP_EDID;
> >  
> >  	ret = devm_drm_bridge_add(hdmi->dev->dev, bridge);
> 
> It looks like you're not setting either the supported formats or bpc?

I've added what looks to be sane defaults to the drm_bridge_connector:
RGB only and bpc = 8. If at some point we get to YUV or HDR support,
that would need to be reflected here.




-- 
With best wishes
Dmitry

