Return-Path: <linux-arm-msm+bounces-47227-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BACE4A2D392
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Feb 2025 04:50:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5C88E7A496C
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Feb 2025 03:49:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8CBF15B554;
	Sat,  8 Feb 2025 03:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PJOLdzFa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C888E154C12
	for <linux-arm-msm@vger.kernel.org>; Sat,  8 Feb 2025 03:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738986605; cv=none; b=hqKAsHGO5PJyazYr+EoL1Qw0pmpGYj6UU7AsbzF8B1uebH72KpNYI6siw1i5OrxYV1ijIW9Lq9J2MNOaJeKh8ncr9OfCFPQSaQoHCWroEtY1DFT8pho7k072M1ctSX2mQBmP1CMD8RWTv/TU2g+JfFZbzChwEbEDDAQIL+MiKTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738986605; c=relaxed/simple;
	bh=TjEn9rDaN1w6UDnajPbII/IvS33Pp/I6fmQNUP0Z114=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X2Sap9PRg2lU5oF95GwZboWpvXa4w0w5FcSfewg14NSSrK1JOTKd7eIxn5LOcvHovswrUAUVs6uT+sLLjDjoMHdYc/iA6mFhE5f1tQlq66EsY/11BUsDDMdFE+lZyRZhn0UqI9C4AQBh9SctHJOBJzrlD5zxmR3SLCD5POECmwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PJOLdzFa; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-30738a717ffso24762571fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Feb 2025 19:50:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738986602; x=1739591402; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NUuRY+SGQqkiJGXQ8h6Ofym4ZEB8QVsdwYk0m4YJyac=;
        b=PJOLdzFayzSENH0kJ5oRnOeIjW9XcInrjaG3jgS57f9+3muAtbxA04vrUforrEjPiq
         33K6YtjVIVEf0YvxOv8+hSuTKHALiTWjWZpz+vONfIAGe1oPYq9ph+6sYxW6k7GtK4UR
         aBQ+i898PL4EWw7nPzKUdOinWvPJjKCvD+Xyfpx2hH68MfdoGaxQTv4UWXJLsKu7y2wv
         N/jJlgbdlrPu6KMRCmnyVXJ0hZ6XxRPPYgPV2mLe+fpBgeqmsLlHEOEmhtCmhQJE/8zi
         sZ20Uu4RFm1Htz6aLDrOu559A+qpTGDGm0RNw0lPSUm9Eti4EnBhu3acfF91foskQZx7
         OTjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738986602; x=1739591402;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NUuRY+SGQqkiJGXQ8h6Ofym4ZEB8QVsdwYk0m4YJyac=;
        b=Z7Dcuh00Olosm/AZfuZS3ffE2+xu9nO02gXrI6BdfGcIrU7X5v+usHiDytutOanTrM
         k1v93pwUjCIU1Y3OVyndOunYLN/EM/BuiMdH3MGIrL1fRR0UBVBwa/mO3vZ6dXWLimMX
         GQQt8Cr6JZHNbqbiQXYGET/bMU/VvGST85ZRHXzAocjg/bS+I5GitQh6Ygyo/EHXCzYX
         aDChw5wZfEsMR0BT6RhSqqp08R2FZE5GNd20AiX4Cd68kckzoQIyrQBJvbsJROqXmEBB
         lh/A8us+guNDhFxSw+PrYnQmKfQSKaGlF3oi819orBLg4Bmh8RpD1BlngwDJbtklAelZ
         DeVg==
X-Forwarded-Encrypted: i=1; AJvYcCV5Lud+nypM0qNg/0fxyvkW9jsXwSVk6bDdcW0c5qJ//2ezwicT7lVMiSAF8Yh/f8DJ1N46uso1f2tZOiTe@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7WXGiPdlWeuXFPhqjQ0j0nRTQmvG2Q853P7DtTZHV8zDNQr5i
	GXHSmqS2mTBiGzcW094gk5hjiAjylnjvfwFopytoEA5kQFrZx6uTVvQAbZS2arI=
X-Gm-Gg: ASbGnct3YlQr6XkW1v4GOaJULmh88WMI6x24fiFNgKEDLSEMU4clHvDAVNjqT9JUbL+
	bbwRpufYkGQHx8z3bOZoDxyUb1snvqSV+exBjRc9Dm52+rW4FiCVN3W827jCRB8HleE71I/2Gyq
	D5a8Qkmy7LoEiOIvXkfOlUj2miKUAiMPKexS+kQFkuPmWCPaKsdbk8mf8AW6WgAfh6CliUJTPOb
	dsR9DTp1mFABuHlqBF528pq0gXXUn9niBBXKvjnTSH/tkGyDnbWWsSvxAi7H0pNOfbTIOqldxS/
	nGKHJh3SKYCqxdm0tbSAWCQBrsZNFwyeeOZVTPVicmyFTCWLtmZJ0HkKOCpqJDwvdmNEUtQ=
X-Google-Smtp-Source: AGHT+IHxa06MWEO0AyRI+e3MMcFW/cLQ8qh1dO9gXzCNcVwPzBIJl1HzogP/eYdm61A/K08gSYzy1A==
X-Received: by 2002:a2e:9147:0:b0:308:860e:d4d3 with SMTP id 38308e7fff4ca-308860edd40mr13207081fa.22.1738986601810;
        Fri, 07 Feb 2025 19:50:01 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307de2f6995sm5745881fa.107.2025.02.07.19.49.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 19:50:00 -0800 (PST)
Date: Sat, 8 Feb 2025 05:49:56 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Simona Vetter <simona@ffwll.ch>, 
	Simona Vetter <simona.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 2/7] drm/msm/hdmi: program HDMI timings during
 atomic_pre_enable
Message-ID: <irh4phyeaybd42xujkyqos2rpjpkarz5jvymbxhtbmy6l7zz5f@fmov5qqheyg7>
References: <20250208-bridge-hdmi-connector-v7-0-0c3837f00258@linaro.org>
 <20250208-bridge-hdmi-connector-v7-2-0c3837f00258@linaro.org>
 <cdfa5cfd-6cdf-45cf-ac18-c2c217d4211a@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cdfa5cfd-6cdf-45cf-ac18-c2c217d4211a@quicinc.com>

On Fri, Feb 07, 2025 at 04:42:46PM -0800, Abhinav Kumar wrote:
> 
> 
> On 2/7/2025 4:27 PM, Dmitry Baryshkov wrote:
> > The mode_set callback is deprecated, it doesn't get the
> > drm_bridge_state, just mode-related argumetns. Also Abhinav pointed out
> > that HDMI timings should be programmed after setting up HDMI PHY and
> > PLL. Rework the code to program HDMI timings at the end of
> > atomic_pre_enable().
> > 
> 
> I think now this needs to be changed that, program the HDMI timings at the
> beginning of atomic_pre_enable() to match the location of mode_set()
> 
> With that fixed,

Ack

> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> > Reviewed-by: Maxime Ripard <mripard@kernel.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 24 ++++++++++++++++--------
> >   1 file changed, 16 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> > index d839c71091dcdc3b020fcbba8d698d58ee7fc749..bd94b3a70f0e5e457a88f089b491103a8c09567b 100644
> > --- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> > +++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> > @@ -126,15 +126,29 @@ static void msm_hdmi_config_avi_infoframe(struct hdmi *hdmi)
> >   	hdmi_write(hdmi, REG_HDMI_INFOFRAME_CTRL1, val);
> >   }
> > +static void msm_hdmi_set_timings(struct hdmi *hdmi,
> > +				 const struct drm_display_mode *mode);
> > +
> >   static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
> >   					      struct drm_bridge_state *old_bridge_state)
> >   {
> > +	struct drm_atomic_state *state = old_bridge_state->base.state;
> >   	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
> >   	struct hdmi *hdmi = hdmi_bridge->hdmi;
> >   	struct hdmi_phy *phy = hdmi->phy;
> > +	struct drm_encoder *encoder = bridge->encoder;
> > +	struct drm_connector *connector;
> > +	struct drm_connector_state *conn_state;
> > +	struct drm_crtc_state *crtc_state;
> >   	DBG("power up");
> > +	connector = drm_atomic_get_new_connector_for_encoder(state, encoder);
> > +	conn_state = drm_atomic_get_new_connector_state(state, connector);
> > +	crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
> > +
> > +	msm_hdmi_set_timings(hdmi, &crtc_state->adjusted_mode);
> > +
> >   	if (!hdmi->power_on) {
> >   		msm_hdmi_phy_resource_enable(phy);
> >   		msm_hdmi_power_on(bridge);
> > @@ -177,17 +191,12 @@ static void msm_hdmi_bridge_atomic_post_disable(struct drm_bridge *bridge,
> >   	}
> >   }
> > -static void msm_hdmi_bridge_mode_set(struct drm_bridge *bridge,
> > -		 const struct drm_display_mode *mode,
> > -		 const struct drm_display_mode *adjusted_mode)
> > +static void msm_hdmi_set_timings(struct hdmi *hdmi,
> > +				 const struct drm_display_mode *mode)
> >   {
> > -	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
> > -	struct hdmi *hdmi = hdmi_bridge->hdmi;
> >   	int hstart, hend, vstart, vend;
> >   	uint32_t frame_ctrl;
> > -	mode = adjusted_mode;
> > -
> >   	hdmi->pixclock = mode->clock * 1000;
> >   	hstart = mode->htotal - mode->hsync_start;
> > @@ -306,7 +315,6 @@ static const struct drm_bridge_funcs msm_hdmi_bridge_funcs = {
> >   	.atomic_reset = drm_atomic_helper_bridge_reset,
> >   	.atomic_pre_enable = msm_hdmi_bridge_atomic_pre_enable,
> >   	.atomic_post_disable = msm_hdmi_bridge_atomic_post_disable,
> > -	.mode_set = msm_hdmi_bridge_mode_set,
> >   	.mode_valid = msm_hdmi_bridge_mode_valid,
> >   	.edid_read = msm_hdmi_bridge_edid_read,
> >   	.detect = msm_hdmi_bridge_detect,
> > 
> 

-- 
With best wishes
Dmitry

