Return-Path: <linux-arm-msm+bounces-47070-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D63A2B7BD
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2025 02:20:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 235B51669D0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2025 01:20:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C42233997;
	Fri,  7 Feb 2025 01:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LBazPw9f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E35D27735
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Feb 2025 01:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738891200; cv=none; b=GBQvpsNA+k5uOL3aqZaV0ws3EfdDnkrPs8wASNjUnuBv8DjcYCGZOma9w2Lv2hyBS2y7wDaCdR/X6g64DRcIrMo1Q3uXz5nk1Rq40JA7skXcE9wCAXjXj5cr/PXTyclafT4p5vGh016/vIdwdCLkxcr99bxI8ZRgnQgIrjBXRfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738891200; c=relaxed/simple;
	bh=EVJ7hSNHarz561lqT93oP6UeGTQpx4hTOwBZBfSyp74=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NVckkTEPOq58qzDoF6YYrn8R4IOqAxLFsWS3UeejZz1jrnZiwtaAXEBn0p0XROWstkEFb735yu1fjEzffKaQH+34POp0UXVJL/YPJ8VAubg1Mv3T6d+Y2CyE2jTcDBw4K46S+lcI6xMX0TpmuZD8JSUwa8iCcLgadwGXCD3XTZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LBazPw9f; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54021daa6cbso1682120e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Feb 2025 17:19:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738891196; x=1739495996; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jR7G4bjSs75agGdo58DpWlgOrV5xySB61UFyh6B/Njo=;
        b=LBazPw9fjXxqgi4ZiCBirzsexbPx19BLXCDm87BclAxlDmqiVxYMBJ7uG2wz8aaS+k
         o1qfNSTAVwOSVGyBDwaaKWX+zt00+6+RBgmuQtNr9jHkPsbA3zgO54/Wfik7J6CVJdlj
         Ue6qfYa8b6q/Qp04SRJ3u1MR2I4hZcid+HMPP9YFir5exgt74OrBIX9jmtJRb2kYca0t
         i/xbAQxMQZnXs9LEIjtDmHcsMip81z/aSyN3g0gMn/aMm6XXoJGDJchRv1N/i0XZ/UdC
         LP1m6Kq8ZQuAWlkGxFrVTi2A7v79HMW5/fIP8Yg7uHln6zJCvrd5arpv4/K+q3UmgW7w
         5WSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738891196; x=1739495996;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jR7G4bjSs75agGdo58DpWlgOrV5xySB61UFyh6B/Njo=;
        b=OHwQvOjTxQtXaUDD1211UOrYN7IObbQHaG+IGeNTh266xwaDSJeIk7yFoQy9Igfa39
         qZ2xxSgDuYWmLKmWkm7UmKkhK/V6n/m/wGgVOdDL5D2ZDJNJHVyr77JIhCHuAL9cV+Zk
         DM31YcWmv0s6mvdoIsxzdDq2LVb82S6l7ZrncxdVvBeQ2FKyho04RC9ZfliyLRc578xl
         kh1M6kQMmj9shue0T6M59DATKWLzvlijnz1zT5Xo56drtBmh3J7iZjUhqzVL9C9whdbx
         Fe8NDsoMzMDhhhLF1yumLDklg1MhSOo8LihHdQE3JfunDtQxXSP5xFDkCWiHTAmUTu7R
         Of5w==
X-Forwarded-Encrypted: i=1; AJvYcCVIgJLJdADvBxTjjCy2bZLNO4uRIMEhXCKs1glHbhmPBxHvm8TPMAmMbvccjO/vNPVlz7KWKSE9n68x9yHx@vger.kernel.org
X-Gm-Message-State: AOJu0Yxr087jWw09aYv8sxiOf+4lN65fuzMnL/BFLWMFoBtLSTaXLxqM
	9w4FRBkDmzKiaoiLFyd8eCchfcoLzS3ha0tN+Q+axYGOdp9J+We0Oy3/zJBeFc0=
X-Gm-Gg: ASbGncvITwyHKlfGSVp2jQ2ONId7qfhI02y3WSTwz2YV3bc5MGGiTLte3BEFVaOxcjh
	nW2dtUN6VUtc8q4f82H+3EK4dE7IEnFbJj/yIu1e7Q8iR00TPC9mbCA7ieiL8E5E41A4NkAcI+0
	2vMiSwGNQCAHdMW7PLgJ78Ww3sgD9+JijvYcE0AP6GroQz1l30J7thHzpQYBxtQHiRGYHvmMRH7
	SBpDRYZ5wc5PElS7Yrr8R9Iuv3ZWEOh7NThbR4UcoquLw4PHVk3Pus09Z3mIqQgr0h3JUVbDsLn
	z6hkR490r6N7nYUedf1sv7T+1HcVMe1HGd2s8G4rcMT41+ROIvkqAVjA6OUrmx1mD4Axuug=
X-Google-Smtp-Source: AGHT+IGzkRVzaNXC0CL9KdL08++NyesGqxNAQYUMTfafBH2nZwBMw9jHYCswmGLhqdEzxoG/iLL+kQ==
X-Received: by 2002:a05:6512:159e:b0:540:1abe:d6d2 with SMTP id 2adb3069b0e04-54414ae0d71mr280840e87.35.1738891196095;
        Thu, 06 Feb 2025 17:19:56 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5441053eb99sm285940e87.22.2025.02.06.17.19.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 17:19:54 -0800 (PST)
Date: Fri, 7 Feb 2025 03:19:53 +0200
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
Message-ID: <fgzcd4gm4uriqbpslh7arfyxjvzyxrck3f2uuv4mhkvcbkdmvm@b2pz5vmmqs3l>
References: <20250124-bridge-hdmi-connector-v6-0-1592632327f7@linaro.org>
 <20250124-bridge-hdmi-connector-v6-2-1592632327f7@linaro.org>
 <7fbfc7d5-f6bb-4f99-914a-f91bb7d153fd@quicinc.com>
 <na7jgb5leqbugi6a6xkfz3nl6mp7li4oevfevhjmo5y4v7eot6@fsmfv52u2rtz>
 <1b98265e-8766-4504-b374-f7af8203c926@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1b98265e-8766-4504-b374-f7af8203c926@quicinc.com>

On Thu, Feb 06, 2025 at 12:41:30PM -0800, Abhinav Kumar wrote:
> 
> 
> On 2/3/2025 4:59 PM, Dmitry Baryshkov wrote:
> > On Mon, Feb 03, 2025 at 11:34:00AM -0800, Abhinav Kumar wrote:
> > > 
> > > 
> > > On 1/24/2025 1:47 PM, Dmitry Baryshkov wrote:
> > > > The mode_set callback is deprecated, it doesn't get the
> > > > drm_bridge_state, just mode-related argumetns. Also Abhinav pointed out
> > > > that HDMI timings should be programmed after setting up HDMI PHY and
> > > > PLL. Rework the code to program HDMI timings at the end of
> > > > atomic_pre_enable().
> > > > 
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > ---
> > > >    drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 23 +++++++++++++++--------
> > > >    1 file changed, 15 insertions(+), 8 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> > > > index d839c71091dcdc3b020fcbba8d698d58ee7fc749..d5ab1f74c0e6f47dc59872c016104e9a84d85e9e 100644
> > > > --- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> > > > +++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> > > > @@ -126,15 +126,26 @@ static void msm_hdmi_config_avi_infoframe(struct hdmi *hdmi)
> > > >    	hdmi_write(hdmi, REG_HDMI_INFOFRAME_CTRL1, val);
> > > >    }
> > > > +static void msm_hdmi_bridge_atomic_set_timings(struct hdmi *hdmi,
> > > > +					       const struct drm_display_mode *mode);
> > > >    static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
> > > >    					      struct drm_bridge_state *old_bridge_state)
> > > >    {
> > > > +	struct drm_atomic_state *state = old_bridge_state->base.state;
> > > >    	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
> > > >    	struct hdmi *hdmi = hdmi_bridge->hdmi;
> > > >    	struct hdmi_phy *phy = hdmi->phy;
> > > > +	struct drm_encoder *encoder = bridge->encoder;
> > > > +	struct drm_connector *connector;
> > > > +	struct drm_connector_state *conn_state;
> > > > +	struct drm_crtc_state *crtc_state;
> > > >    	DBG("power up");
> > > > +	connector = drm_atomic_get_new_connector_for_encoder(state, encoder);
> > > > +	conn_state = drm_atomic_get_new_connector_state(state, connector);
> > > > +	crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
> > > > +
> > > >    	if (!hdmi->power_on) {
> > > >    		msm_hdmi_phy_resource_enable(phy);
> > > >    		msm_hdmi_power_on(bridge);
> > > > @@ -151,6 +162,8 @@ static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
> > > >    	if (hdmi->hdcp_ctrl)
> > > >    		msm_hdmi_hdcp_on(hdmi->hdcp_ctrl);
> > > > +
> > > > +	msm_hdmi_bridge_atomic_set_timings(hdmi, &crtc_state->adjusted_mode);
> > > >    }
> > > 
> > > This addresses my comment about setting up the HDMI timing registers before
> > > setting up the timing engine registers.
> > > 
> > > But prior to this change, mode_set was doing the same thing as
> > > msm_hdmi_bridge_atomic_set_timings() which means
> > > msm_hdmi_bridge_atomic_set_timings() should be called at the beginning of
> > > pre_enable()?
> > > 
> > > The controller is enabled in msm_hdmi_set_mode(). So this should be done
> > > before that.
> > 
> > In [1] you provided the following order:
> > 
> > 1) setup HDMI PHY and PLL
> > 2) setup HDMI video path correctly (HDMI timing registers)
> > 3) setup timing generator to match the HDMI video in (2)
> > 4) Enable timing engine
> > 
> > This means htat msm_hdmi_bridge_atomic_set_timings() should come at the
> > end of msm_hdmi_bridge_atomic_pre_enable(), not in the beginning /
> > middle of it.
> > 
> > [1] https://lore.kernel.org/dri-devel/8dd4a43e-d83c-1f36-21ff-61e13ff751e7@quicinc.com/
> > 
> 
> Sequence given is correct and is exactly what is given in the docs. What is
> somewhat not clear in the docs is the location of the enable of the HDMI
> controller. This is not there in the above 4 steps. I am referring to the
> enable bit being programmed in msm_hdmi_set_mode(). Ideally till we enable
> the timing engine, it should be okay but what I wanted to do was to keep the
> msm_hdmi_set_mode() as the last call in this function that way we program
> everything and then enable the controller.
> 
> This can be done in either way, move it to the beginning of the function or
> move it right before msm_hdmi_set_mode(). I had suggested beginning because
> thats how it was when things were still in mode_set.

Well.. following your description it might be better to put it after PHY
init. What do you think?

-- 
With best wishes
Dmitry

