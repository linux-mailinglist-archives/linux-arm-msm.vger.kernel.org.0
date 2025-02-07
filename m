Return-Path: <linux-arm-msm+bounces-47187-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05AE0A2D04B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2025 23:07:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1DAD53A9800
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2025 22:07:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 904151B4159;
	Fri,  7 Feb 2025 22:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JiEZOBhR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E64142069
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Feb 2025 22:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738966045; cv=none; b=fSVade29jLz1cC7EmBMnQ64asFKNo2GB2PHL3Sh5npBzqhlMyxV9mV8IgdYoSudKo9Oct53EYI9vzZp5uT+3v162/paU5Kq0D1znAdOg3pHmTQndqM9mvb0sfRaN19yQ5dK/QwmqAtdKKAE5gxp3jpo3WnnAPPM3SMnfWDOSQz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738966045; c=relaxed/simple;
	bh=z0v3zJzDDZ2Asx9sfZ0vO8sd6bsZfsIZX6g7L73kCwc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tai0s/au/uxzl+hPXS6UyINmeb2UhSPE3s1UBrsUm1tG122Q7yTpfi31JlCoTqKc+nkJ2BUljU/aTn4NZ2Bw0TCFpUlB+4BzwaeSpIrFJEG4p/Mc5FujaJoQAzx8pEajGjfTnSO57DqicZpCfk68YgJkQba2YOv7Cwisgo0OtL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JiEZOBhR; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-54412a7d75cso2084648e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Feb 2025 14:07:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738966042; x=1739570842; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YoGtyAadAajUTvrSofPsqaE92yf53brkzxQxe3NpqEE=;
        b=JiEZOBhRFYIdd0A5bj9U+/dKJobZ6IFC8HalML/bVZAZA4tmcwPaxu2rzWreGBo9Jk
         L+NdHFkZn4YOdleF4reGUajIuwsaufHHj6c9PAo/Si2fLrc0CbLzAM9jEaKL9l1iUCsy
         mf4F1/cxs+IxzDR3Mn6mKStt535pNQdeBEFcMyt7vAtGkM2O1Jib9VlsZVjHxEorvz1x
         z9Ju687k4bdKYh8xiCdllEkXZfIpm6uUF9V/SdUVXvTdVgXQJynUwj1/zLEkYVQh0dBQ
         RcNQ1HqxSshy0LLv/+a4FRLq3tEfJ42PoXnwu/QHW/qttoT1HSzPnYyMV9MAEYfA4dKL
         tV+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738966042; x=1739570842;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YoGtyAadAajUTvrSofPsqaE92yf53brkzxQxe3NpqEE=;
        b=bqk8Nx/PhWjFXhUdL3H78Y3xcOYeE0249mXsGFoQJsrX3fomubizuFmXzcL8k/fhxl
         SHwzPcc6JFon+qSTl6I9cGDjQWZ/ugQPgU6yT9gCxhwsJhYv2SaoK/ibHJ/2T5QjIBke
         1ZgQK0oX/4gLEBO7e9aXEpcxDC7mLqD+CipdwkFmv3D8gG5rOVcAH1ZsujqSjY72IMNb
         q1CLpFKst73s01nmN2bn0ReAyVIHCEVGUDB84PAJYCU4oUb2u6MHuC8cR6+hJ0NN4QQ6
         crb3CjiX7haxoNv6U2UxSLevSTs8ZtNf2DnTzJEStY+/r8wF1rsAatHIEySHVl84/95D
         BqHA==
X-Forwarded-Encrypted: i=1; AJvYcCUj+emj2CDy9F1yz5muNx85wcNZP6BmJHMX2xDhaW82IbKCTLX/QLQ/EBkQ0mp0FLgE5/6EipyoiFFs0LRv@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz9AjQmOjz6diGyQyTSc35olF79aZtc1bGGsmn7NLH5IL1Zhid
	h4z29AsyaMYPXI3C0LOqk/BUcD2xZlIUNuCIQhNcJlb4OwS1onzzxqS5oqt5B9c=
X-Gm-Gg: ASbGncu654ZbAo2v6Bip609EStKt+SKMlkTMzaPSPIJg/9OH7zWMHuZBALn1sz8Z1nd
	ztThR13jtwSQFCHD/p7guPP+22KU7Lx6VrrfNdfhhPD7XjLgeN1wQm6qAogP8W0jWI14U6SGkIq
	BGrZ0KbSn9DjVvvdWFERg0u94VXYzXUAOs+YtMGguvLrGLBwB1IQUyKAqh/OXiUWylBJPPKjkDp
	C4Hbgt1DKi93puKSrIEtsqJUwjrcGqrU4Y6dXbWR063yl2aLXsrQTeXwYT5M0C653HC5rH5XdWo
	6/YhyJSKks9JPZIZfrPSxhl5NjgFGH9pPqetLqHOQzoFKW9OsLnp4wvrYuY+g6oyFDNUj1E=
X-Google-Smtp-Source: AGHT+IGlt4YgbVKf+phNyM/DE8c8iLjkn4RIMGk5ksuzhbALB5C0dL4KrNR9p1aZlABR8XoI6jqj+A==
X-Received: by 2002:a05:6512:3ba8:b0:540:1d37:e6e with SMTP id 2adb3069b0e04-54414ae1357mr1765761e87.33.1738966041556;
        Fri, 07 Feb 2025 14:07:21 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-544105f3182sm565650e87.192.2025.02.07.14.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 14:07:21 -0800 (PST)
Date: Sat, 8 Feb 2025 00:07:18 +0200
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
Subject: Re: [PATCH v6 2/7] drm/msm/hdmi: program HDMI timings during
 atomic_pre_enable
Message-ID: <d6lavujlmk5teri2sf4tp2tlvbkvw54azykvsqymyeyedmndb6@czsdg66h3esq>
References: <20250124-bridge-hdmi-connector-v6-0-1592632327f7@linaro.org>
 <20250124-bridge-hdmi-connector-v6-2-1592632327f7@linaro.org>
 <7fbfc7d5-f6bb-4f99-914a-f91bb7d153fd@quicinc.com>
 <na7jgb5leqbugi6a6xkfz3nl6mp7li4oevfevhjmo5y4v7eot6@fsmfv52u2rtz>
 <1b98265e-8766-4504-b374-f7af8203c926@quicinc.com>
 <fgzcd4gm4uriqbpslh7arfyxjvzyxrck3f2uuv4mhkvcbkdmvm@b2pz5vmmqs3l>
 <b7561a2c-653b-4c56-8bef-3ae76a729d7c@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b7561a2c-653b-4c56-8bef-3ae76a729d7c@quicinc.com>

On Fri, Feb 07, 2025 at 12:11:55PM -0800, Abhinav Kumar wrote:
> 
> 
> On 2/6/2025 5:19 PM, Dmitry Baryshkov wrote:
> > On Thu, Feb 06, 2025 at 12:41:30PM -0800, Abhinav Kumar wrote:
> > > 
> > > 
> > > On 2/3/2025 4:59 PM, Dmitry Baryshkov wrote:
> > > > On Mon, Feb 03, 2025 at 11:34:00AM -0800, Abhinav Kumar wrote:
> > > > > 
> > > > > 
> > > > > On 1/24/2025 1:47 PM, Dmitry Baryshkov wrote:
> > > > > > The mode_set callback is deprecated, it doesn't get the
> > > > > > drm_bridge_state, just mode-related argumetns. Also Abhinav pointed out
> > > > > > that HDMI timings should be programmed after setting up HDMI PHY and
> > > > > > PLL. Rework the code to program HDMI timings at the end of
> > > > > > atomic_pre_enable().
> > > > > > 
> > > > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > > > ---
> > > > > >     drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 23 +++++++++++++++--------
> > > > > >     1 file changed, 15 insertions(+), 8 deletions(-)
> > > > > > 
> > > > > > diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> > > > > > index d839c71091dcdc3b020fcbba8d698d58ee7fc749..d5ab1f74c0e6f47dc59872c016104e9a84d85e9e 100644
> > > > > > --- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> > > > > > +++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> > > > > > @@ -126,15 +126,26 @@ static void msm_hdmi_config_avi_infoframe(struct hdmi *hdmi)
> > > > > >     	hdmi_write(hdmi, REG_HDMI_INFOFRAME_CTRL1, val);
> > > > > >     }
> > > > > > +static void msm_hdmi_bridge_atomic_set_timings(struct hdmi *hdmi,
> > > > > > +					       const struct drm_display_mode *mode);
> > > > > >     static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
> > > > > >     					      struct drm_bridge_state *old_bridge_state)
> > > > > >     {
> > > > > > +	struct drm_atomic_state *state = old_bridge_state->base.state;
> > > > > >     	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
> > > > > >     	struct hdmi *hdmi = hdmi_bridge->hdmi;
> > > > > >     	struct hdmi_phy *phy = hdmi->phy;
> > > > > > +	struct drm_encoder *encoder = bridge->encoder;
> > > > > > +	struct drm_connector *connector;
> > > > > > +	struct drm_connector_state *conn_state;
> > > > > > +	struct drm_crtc_state *crtc_state;
> > > > > >     	DBG("power up");
> > > > > > +	connector = drm_atomic_get_new_connector_for_encoder(state, encoder);
> > > > > > +	conn_state = drm_atomic_get_new_connector_state(state, connector);
> > > > > > +	crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
> > > > > > +
> > > > > >     	if (!hdmi->power_on) {
> > > > > >     		msm_hdmi_phy_resource_enable(phy);
> > > > > >     		msm_hdmi_power_on(bridge);
> > > > > > @@ -151,6 +162,8 @@ static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
> > > > > >     	if (hdmi->hdcp_ctrl)
> > > > > >     		msm_hdmi_hdcp_on(hdmi->hdcp_ctrl);
> > > > > > +
> > > > > > +	msm_hdmi_bridge_atomic_set_timings(hdmi, &crtc_state->adjusted_mode);
> > > > > >     }
> > > > > 
> > > > > This addresses my comment about setting up the HDMI timing registers before
> > > > > setting up the timing engine registers.
> > > > > 
> > > > > But prior to this change, mode_set was doing the same thing as
> > > > > msm_hdmi_bridge_atomic_set_timings() which means
> > > > > msm_hdmi_bridge_atomic_set_timings() should be called at the beginning of
> > > > > pre_enable()?
> > > > > 
> > > > > The controller is enabled in msm_hdmi_set_mode(). So this should be done
> > > > > before that.
> > > > 
> > > > In [1] you provided the following order:
> > > > 
> > > > 1) setup HDMI PHY and PLL
> > > > 2) setup HDMI video path correctly (HDMI timing registers)
> > > > 3) setup timing generator to match the HDMI video in (2)
> > > > 4) Enable timing engine
> > > > 
> > > > This means htat msm_hdmi_bridge_atomic_set_timings() should come at the
> > > > end of msm_hdmi_bridge_atomic_pre_enable(), not in the beginning /
> > > > middle of it.
> > > > 
> > > > [1] https://lore.kernel.org/dri-devel/8dd4a43e-d83c-1f36-21ff-61e13ff751e7@quicinc.com/
> > > > 
> > > 
> > > Sequence given is correct and is exactly what is given in the docs. What is
> > > somewhat not clear in the docs is the location of the enable of the HDMI
> > > controller. This is not there in the above 4 steps. I am referring to the
> > > enable bit being programmed in msm_hdmi_set_mode(). Ideally till we enable
> > > the timing engine, it should be okay but what I wanted to do was to keep the
> > > msm_hdmi_set_mode() as the last call in this function that way we program
> > > everything and then enable the controller.
> > > 
> > > This can be done in either way, move it to the beginning of the function or
> > > move it right before msm_hdmi_set_mode(). I had suggested beginning because
> > > thats how it was when things were still in mode_set.
> > 
> > Well.. following your description it might be better to put it after PHY
> > init. What do you think?
> > 
> 
> Are you referring to after msm_hdmi_phy_powerup()? Yes, thats fine too.

After doing several tests, this doesn't result in a stable enough
behaviour. I'll follow your recommendataion and call
msm_hdmi_bridge_atomic_set_timings() in the beginning of
msm_hdmi_bridge_atomic_pre_enable().

-- 
With best wishes
Dmitry

