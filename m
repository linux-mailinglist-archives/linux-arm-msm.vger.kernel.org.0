Return-Path: <linux-arm-msm+bounces-46835-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 095CCA26932
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2025 01:59:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 77CAD3A2257
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2025 00:59:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C0F954654;
	Tue,  4 Feb 2025 00:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m1JC91QH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D1F7083C
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Feb 2025 00:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738630768; cv=none; b=YTAmvLmhsb5vsvPXkVOzAcuV696/pTVcE79q5nRuPD5bSSCsDdbS3kUqZ2iW9yiqG452QwYinR5r9WZPTiiHpjNT/b0onqFWjt4Y0zUwPe+v1BlHooJyVU5VU/GqZgcsIeEj9bJ/XFnLoA65kaC05WMmPy9yPsdjd71qgj7ks8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738630768; c=relaxed/simple;
	bh=Ol6He+EmpCD6EcfaZPNihsT1m7DuezwTek76UAYgc1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rhcM3LBAjRfpRhVHq9vStDu/kWvDIkz/UK9KFcECI4XjVbOweH4SOqw0lX5EKtIxgVkVRRD6FKulI0OhENlVwFPm1yE5gnUiXze90YdQxGdiTeSsGc2dmTT40bvSv0E8sAuw6sb4OPxOLbPMSy2m0J9wjzImkS99J3Tbp1S9+lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m1JC91QH; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-540218726d5so4877393e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Feb 2025 16:59:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738630764; x=1739235564; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iQu+PcBCYHyEWcLorUNu/krN34Y5N713WyAJdtXWICI=;
        b=m1JC91QHXg4nZ67aOxSgrWUheYA+7S+jl2HHJSvXVE0prHl61Nqa0BLG874zzWv0GN
         eYs9RvUgDPGSDfiKL+0RlQzwrsuO0cZImUfbzNrmhu8AqG9fF9gKKCviezhhD3Nsqkv9
         Pk1KCanDvBTiErWV79tYkiAcTIlZuf9FtnnVophuHmRnsNKYVrcw6fzsnNsqKYVWof1Q
         pz6fuzhu1T/FkGAC4bbX0pdHS/O48g14vCgXsl3ca8H4bDJ5Cf51FKnEC4PHjUXig9UB
         RnD6UVo4iw+Ek2wQT/zy/1H7J0zyEFEV2Pkjcm8HTEDETm2pk6TshqNPCJAWRsuQuzxI
         E3gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738630764; x=1739235564;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iQu+PcBCYHyEWcLorUNu/krN34Y5N713WyAJdtXWICI=;
        b=uf/JKXIIaaR7ceHtijqiuMiB9bQqMmPG0JBDATreIVSEiS8F6KwXonegmnqLS2Bp54
         g/VrRvouEiYSCGK87zWBX2kPWKWpYSu4xlFxU0M47Wlw5DeGf3VRW0WJvtGVLKV3Sv3D
         gY04OLMHMvWcmh+IGvpps3AQgMdG7UfUUV+Ncsbtrw0bCC57r5hj1bvbN35aUjmBypof
         ekrgig7oD2Q794xIdKQwilg6dY/sEMroORvAjj+NuRmPEO+uFbexKUsBCzMzj9r9/D99
         I6M92D/s7joCxoY+kbkIt/zsrqqzaat6B5XGFBqAAP1kzLHNxG9EvgeUnu+xbR/0l6aW
         Fj7A==
X-Forwarded-Encrypted: i=1; AJvYcCVJd8PvOoaB5TnEuqCgj1dZbA7JOPmFRcCu43V5bv8sV2Igcv0YgnueSwSnZspC0mCGSBtqVJGODtTAu58l@vger.kernel.org
X-Gm-Message-State: AOJu0YwGUFD2jPF1+6+b7wMU9LrNH0jhTrdceiUFe7Kgbo62AaCJ9TQX
	7g1m2OaEEtkRQS/FKwUj+PGRvJMe+RfhyvDPR2shu3618YS6edC+SjyEMjgeewQ=
X-Gm-Gg: ASbGncu2FnCJXA+p+fDoSm1YUJsLsYLanpH8pMfGR9B+1rc0rIyTu+FRexLzaELKm8x
	HpQ/dSO+taWNgMHG3ab8ywQgYAN6u2ng924HOW+KoE6VxYqxsf3LUbVqxnezgW00fMyBM7B4J8n
	3ke9rC6Pa+7nJL5HbSWAvz72bek/3Aj/EwzE6SvXfUGe3TtGoIGKRyPT+Dik7xAAom0VtN2Tthk
	ObWjxl4p2Bv7zeupGSCvuzpUk4PQ9Wzp/ptlX3QZAT3kCcMDxOgWBLJYFuu2zApsFOIgMqGumdT
	9Rw49oxwIx9Iv4Tguq1c/Ccymbx9wd4GimQ+0BnMfZRN2hkKl+jMjEwGzqqjLjOVlnVYaYc=
X-Google-Smtp-Source: AGHT+IE/5jfpsneDUND06UjyJ4Ry6Zih6VLQBI5FGcNFFpcyLlM5QM1i945DtByaC+8TDC003dcEnQ==
X-Received: by 2002:a05:6512:114a:b0:542:8d45:cb4f with SMTP id 2adb3069b0e04-543e4bdffbcmr6358441e87.1.1738630764308;
        Mon, 03 Feb 2025 16:59:24 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543ebdf10e2sm1449566e87.32.2025.02.03.16.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 16:59:22 -0800 (PST)
Date: Tue, 4 Feb 2025 02:59:20 +0200
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
Message-ID: <na7jgb5leqbugi6a6xkfz3nl6mp7li4oevfevhjmo5y4v7eot6@fsmfv52u2rtz>
References: <20250124-bridge-hdmi-connector-v6-0-1592632327f7@linaro.org>
 <20250124-bridge-hdmi-connector-v6-2-1592632327f7@linaro.org>
 <7fbfc7d5-f6bb-4f99-914a-f91bb7d153fd@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7fbfc7d5-f6bb-4f99-914a-f91bb7d153fd@quicinc.com>

On Mon, Feb 03, 2025 at 11:34:00AM -0800, Abhinav Kumar wrote:
> 
> 
> On 1/24/2025 1:47 PM, Dmitry Baryshkov wrote:
> > The mode_set callback is deprecated, it doesn't get the
> > drm_bridge_state, just mode-related argumetns. Also Abhinav pointed out
> > that HDMI timings should be programmed after setting up HDMI PHY and
> > PLL. Rework the code to program HDMI timings at the end of
> > atomic_pre_enable().
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 23 +++++++++++++++--------
> >   1 file changed, 15 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> > index d839c71091dcdc3b020fcbba8d698d58ee7fc749..d5ab1f74c0e6f47dc59872c016104e9a84d85e9e 100644
> > --- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> > +++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> > @@ -126,15 +126,26 @@ static void msm_hdmi_config_avi_infoframe(struct hdmi *hdmi)
> >   	hdmi_write(hdmi, REG_HDMI_INFOFRAME_CTRL1, val);
> >   }
> > +static void msm_hdmi_bridge_atomic_set_timings(struct hdmi *hdmi,
> > +					       const struct drm_display_mode *mode);
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
> >   	if (!hdmi->power_on) {
> >   		msm_hdmi_phy_resource_enable(phy);
> >   		msm_hdmi_power_on(bridge);
> > @@ -151,6 +162,8 @@ static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
> >   	if (hdmi->hdcp_ctrl)
> >   		msm_hdmi_hdcp_on(hdmi->hdcp_ctrl);
> > +
> > +	msm_hdmi_bridge_atomic_set_timings(hdmi, &crtc_state->adjusted_mode);
> >   }
> 
> This addresses my comment about setting up the HDMI timing registers before
> setting up the timing engine registers.
> 
> But prior to this change, mode_set was doing the same thing as
> msm_hdmi_bridge_atomic_set_timings() which means
> msm_hdmi_bridge_atomic_set_timings() should be called at the beginning of
> pre_enable()?
> 
> The controller is enabled in msm_hdmi_set_mode(). So this should be done
> before that.

In [1] you provided the following order:

1) setup HDMI PHY and PLL
2) setup HDMI video path correctly (HDMI timing registers)
3) setup timing generator to match the HDMI video in (2)
4) Enable timing engine

This means htat msm_hdmi_bridge_atomic_set_timings() should come at the
end of msm_hdmi_bridge_atomic_pre_enable(), not in the beginning /
middle of it.

[1] https://lore.kernel.org/dri-devel/8dd4a43e-d83c-1f36-21ff-61e13ff751e7@quicinc.com/


> 
> >   static void msm_hdmi_bridge_atomic_post_disable(struct drm_bridge *bridge,
> > @@ -177,17 +190,12 @@ static void msm_hdmi_bridge_atomic_post_disable(struct drm_bridge *bridge,
> >   	}
> >   }
> > -static void msm_hdmi_bridge_mode_set(struct drm_bridge *bridge,
> > -		 const struct drm_display_mode *mode,
> > -		 const struct drm_display_mode *adjusted_mode)
> > +static void msm_hdmi_bridge_atomic_set_timings(struct hdmi *hdmi,
> > +					       const struct drm_display_mode *mode)
> >   {
> > -	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
> > -	struct hdmi *hdmi = hdmi_bridge->hdmi;
> >   	int hstart, hend, vstart, vend;
> >   	uint32_t frame_ctrl;
> > -	mode = adjusted_mode;
> > -
> >   	hdmi->pixclock = mode->clock * 1000;
> >   	hstart = mode->htotal - mode->hsync_start;
> > @@ -306,7 +314,6 @@ static const struct drm_bridge_funcs msm_hdmi_bridge_funcs = {
> >   	.atomic_reset = drm_atomic_helper_bridge_reset,
> >   	.atomic_pre_enable = msm_hdmi_bridge_atomic_pre_enable,
> >   	.atomic_post_disable = msm_hdmi_bridge_atomic_post_disable,
> > -	.mode_set = msm_hdmi_bridge_mode_set,
> >   	.mode_valid = msm_hdmi_bridge_mode_valid,
> >   	.edid_read = msm_hdmi_bridge_edid_read,
> >   	.detect = msm_hdmi_bridge_detect,
> > 

-- 
With best wishes
Dmitry

