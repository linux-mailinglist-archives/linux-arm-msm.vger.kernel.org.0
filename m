Return-Path: <linux-arm-msm+bounces-44551-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 524A5A07553
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 13:10:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 37ECB7A33A2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 12:10:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81DC618D;
	Thu,  9 Jan 2025 12:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CPGBoty+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE5321766F
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jan 2025 12:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736424622; cv=none; b=Hd0eHhplqpQn1+CmZlw8WFtvytFyjqXuWTCoU6/GG8x1eu01id35l30dnmJLUF1EDtNqKf4IYe9zOkpCAjQ8aNe9l8oqrU88YEYLOLikasF6Giu68VbWHND5t5RU3JYYqnSUdAMZQCGf1z1JETEANDNwR/9otKjUgGXMh9ND6sY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736424622; c=relaxed/simple;
	bh=yw80//erKtIihCTfLejyupKTzJ5/n78i0rH/c2Vn88A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uEl9LXxE/bhfZkadzCT1485OL2PKAj9ObmOvg8Qx7suenFAdSnm4rmjD+sHwXw8g6EK84ikuwUsPibED+fRlzOUEqtWbwr4CMSt94pywaALh2p3eOAi/fb9+VZ7mIMcQ0KLIchJ55ov58WAx1H9V1CIgzp6DWNXUdSV7zagS11Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CPGBoty+; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4368a293339so10350775e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jan 2025 04:10:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736424619; x=1737029419; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ScDEvNBMi9Yu3n8HTIx1zSceI6fYU9kCdn5rYgIhGU8=;
        b=CPGBoty+ygH9gBegbx0nxyEe8oXvZlHqg7o1/gC/4mgYGJHLqarZzTJ/hhjro28nno
         Vi/eR2vSWPnLWw015buz+cvt3kIhLZtlCRUO26I55YqxAjCkUxt8Qeix6TPyYj9HWROu
         RmSVVd8HOpLpzP3MzFz2/QuM/8F5D5rYrrcESQOYJD3uML79miHCBuexyZLR1T8v9q/W
         Q1V0UaNfJIu48ovc0lFW3seqj5bSeow7HL/K7tLI549aCQYUE9uYHkcjRpE9/pZPtDjR
         cRTj5PhNXqWM+E3Vn0WzAs1vP7R0B2ve3iHvl0EKSoDbaqEPnNn0jt9LbL45Ord+FE+l
         ZB3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736424619; x=1737029419;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ScDEvNBMi9Yu3n8HTIx1zSceI6fYU9kCdn5rYgIhGU8=;
        b=p+TCrTs8ZWuCWmKh/Y1lC2GzHbByt17u2qTQveFUkLLteShJuylAMJeTn1p9PS6z/z
         hM4mNSKWErn/9iIN7pwIhMV5cGBEUxlGCgVil51bwTBENWx/ZWUhykG0AkwOOu/fuqeZ
         kmb15i2oQnNIEb7ZhO0QxQM77ZtrnH2OC+QdUFnP0d3j/9XLU6jL+mIFEh11Zj0AQiyS
         ryNYSyTLym9iVuyxOVzp2KAqBdvwA1QW/PROq2smtekWfV1yW5iZy4QB3n6heq44fF5/
         T6S+VdyuKpFGqa8tnRzZWXf5f/D1o1msjblQcDCQ5CZYnBY01uWKRIMPMa0VUR7VYUnd
         FQ7g==
X-Forwarded-Encrypted: i=1; AJvYcCVL2xdjps02/fbrItmfp/Mp0rtDD5Y53aJsYNXmaDxhV+hvxBvXkiEUaqVF+AMkVFxj7mTUqMSolauyt8Dx@vger.kernel.org
X-Gm-Message-State: AOJu0YzcsF6mR788JBGHqjiOPAPfBIDACsAArA0aVfsAZMiGTYBui/SL
	QtVRTfxt0zqSE9pvO9cdGVT0XL29DEUenqe98WU82DO0INivMrfviIpzPBGkN8Y=
X-Gm-Gg: ASbGncsX8kcXegTUn8CIoCf7GdAcZLn7MpKHJu11StncHNvsb8RjZ8kyzswB8CFAB4P
	KjwTYLNF5pui7uHxwhk43v9vIGYzpiFlrH97VjbrdJtSTeBuStTfTWtWkV6unHM6iXx5j3PUrtl
	3NI9YXLGjf/nrZyx5vGWVov25QtB+wICUpm2qPSL6UF8oYzc4Wk1vt2dTdQtb8UQqcCf/gQegGE
	wBAM3STUWEqTQqBb1ddVXTti3whOr8m4XCP1WQtwwjEnMRTKF3Z/HM=
X-Google-Smtp-Source: AGHT+IG8rp+QX8v4S4fqKATVXk+QD/aEvAPXmO9Bulu0mN6QuKMDbLW3pqUmFSzB7pw+E5Uf11Sy2A==
X-Received: by 2002:a05:600c:46ce:b0:436:6ddf:7a27 with SMTP id 5b1f17b1804b1-436e27072a7mr53497435e9.23.1736424618831;
        Thu, 09 Jan 2025 04:10:18 -0800 (PST)
Received: from linaro.org ([86.121.162.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2da63eesm53042595e9.3.2025.01.09.04.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 04:10:18 -0800 (PST)
Date: Thu, 9 Jan 2025 14:10:16 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@redhat.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Rob Clark <robdclark@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Johan Hovold <johan@kernel.org>, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH v4 4/4] drm/msm/dp: Add support for LTTPR handling
Message-ID: <Z3+8qDc19zicI6vQ@linaro.org>
References: <20250108-drm-dp-msm-add-lttpr-transparent-mode-set-v4-0-918949bc2e3a@linaro.org>
 <20250108-drm-dp-msm-add-lttpr-transparent-mode-set-v4-4-918949bc2e3a@linaro.org>
 <feb4f780-8fe6-426b-9ba4-ab1fb102ac27@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <feb4f780-8fe6-426b-9ba4-ab1fb102ac27@quicinc.com>

On 25-01-08 14:57:41, Abhinav Kumar wrote:
> 
> 
> On 1/8/2025 6:31 AM, Abel Vesa wrote:
> > Link Training Tunable PHY Repeaters (LTTPRs) are defined in DisplayPort
> > 1.4a specification. As the name suggests, these PHY repeaters are
> > capable of adjusting their output for link training purposes.
> > 
> > According to the DisplayPort standard, LTTPRs have two operating
> > modes:
> >   - non-transparent - it replies to DPCD LTTPR field specific AUX
> >     requests, while passes through all other AUX requests
> >   - transparent - it passes through all AUX requests.
> > 
> > Switching between this two modes is done by the DPTX by issuing
> > an AUX write to the DPCD PHY_REPEATER_MODE register.
> > 
> > The msm DP driver is currently lacking any handling of LTTPRs.
> > This means that if at least one LTTPR is found between DPTX and DPRX,
> > the link training would fail if that LTTPR was not already configured
> > in transparent mode.
> > 
> > The section 3.6.6.1 from the DisplayPort v2.0 specification mandates
> > that before link training with the LTTPR is started, the DPTX may place
> > the LTTPR in non-transparent mode by first switching to transparent mode
> > and then to non-transparent mode. This operation seems to be needed only
> > on first link training and doesn't need to be done again until device is
> > unplugged.
> > 
> > It has been observed on a few X Elite-based platforms which have
> > such LTTPRs in their board design that the DPTX needs to follow the
> > procedure described above in order for the link training to be successful.
> > 
> > So add support for reading the LTTPR DPCD caps to figure out the number
> > of such LTTPRs first. Then, for platforms (or Type-C dongles) that have
> > at least one such an LTTPR, set its operation mode to transparent mode
> > first and then to non-transparent, just like the mentioned section of
> > the specification mandates.
> > 
> > Tested-by: Johan Hovold <johan+linaro@kernel.org>
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/dp/dp_display.c | 17 +++++++++++++++++
> >   1 file changed, 17 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> > index 24dd37f1682bf5016bb0efbeb44489061deff060..ad09daa4c8ab5c0eb67890509b94e72820bab870 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_display.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> > @@ -107,6 +107,8 @@ struct msm_dp_display_private {
> >   	struct msm_dp_event event_list[DP_EVENT_Q_MAX];
> >   	spinlock_t event_lock;
> > +	u8 lttpr_caps[DP_LTTPR_COMMON_CAP_SIZE];
> > +
> 
> The reason downstream stored it panel is to read it first in dp_panel's
> read_sink_caps and call lttpr_init if drm_dp_lttpr_count() is non-zero.
> 
> But here it looks like  msm_dp_display_lttpr_init() internally handles this
> for us. So no need to store this?

Replied to Bjorn already about this and why I thought it was a good idea
to add it.

But will drop in the next version.

> 
> >   	bool wide_bus_supported;
> >   	struct msm_dp_audio *audio;
> > @@ -367,12 +369,27 @@ static int msm_dp_display_send_hpd_notification(struct msm_dp_display_private *d
> >   	return 0;
> >   }
> > +static void msm_dp_display_lttpr_init(struct msm_dp_display_private *dp)
> > +{
> > +	int rc;
> > +
> > +	if (drm_dp_read_lttpr_common_caps(dp->aux, dp->panel->dpcd,
> > +					  dp->lttpr_caps))
> > +		return;
> > +
> > +	rc = drm_dp_lttpr_init(dp->aux, drm_dp_lttpr_count(dp->lttpr_caps));
> > +	if (rc)
> > +		DRM_ERROR("failed to set LTTPRs transparency mode, rc=%d\n", rc);
> > +}
> > +
> >   static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
> >   {
> >   	struct drm_connector *connector = dp->msm_dp_display.connector;
> >   	const struct drm_display_info *info = &connector->display_info;
> >   	int rc = 0;
> > +	msm_dp_display_lttpr_init(dp);
> > +
> 
> Can you pls move this call after msm_dp_panel_read_sink_caps()?
> 
> If msm_dp_panel_read_sink_caps() fails there is no need to call
> msm_dp_display_lttpr_init().

Sure.

> 
> 
> >   	rc = msm_dp_panel_read_sink_caps(dp->panel, connector);
> >   	if (rc)
> >   		goto end;
> > 

Thanks for reviewing!

Abel

