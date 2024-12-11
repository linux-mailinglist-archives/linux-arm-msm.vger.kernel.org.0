Return-Path: <linux-arm-msm+bounces-41462-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E579EC9C6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 10:56:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5158B169237
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 09:56:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2E741EC4D1;
	Wed, 11 Dec 2024 09:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Rkt4E9In"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA0D91DFE26
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 09:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733910963; cv=none; b=GMOUXoOtMTdU/JcQWWPhMzviNJIaG3gOaEI4C/fNzVCuoajfBnSxRe1/7y5dMn1+7C1gJ8C8nZxs0V6yoa65hIE1Kdt00X+Zl6P6Y281RjaaQYr+5yC9z3jqkWQjsy6dc8VHBtMKPRzLTekxOeE2z6BL0nVkXkrwDrC4q4d//tI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733910963; c=relaxed/simple;
	bh=1zDzDj41q0AS9Lip+3qw49ypC6Hxmum+XtMtoQgBGd0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=seByB9jwV/SqhxHW9xfaPFB+lmCH5Oeq5UTiw4+tbkX/RJjelTbjKhkOLnGrKIWlKaC7VUAHcNI/UREV3Wo/zP5M2rVIsV6nFbuZkIoDganXYXEoFXp8wGZJQm2nBUCFYyjPUIkLLOZ7VCscSYfyYkYs/mNqAgsgcXkWNMxM22I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Rkt4E9In; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-540254357c8so1869311e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 01:56:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733910959; x=1734515759; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5o6spnVR6ajql5nXA/7yn9qe6fHy4wd5WT4oqg7Hxjg=;
        b=Rkt4E9InZIP/Ch4LaHdLYdMASPHfFUx6hvub4Zd9eo3AkymV1jSddoAqscLt0LgfoQ
         jb+sM1Pyvs0hjQlDgJ1V9gnvlG+mpryiXdpLV4weNGiMX+q9OpgQsJY4dtv6xPPJHuC/
         AoiW1WrBN3JBaznNTxk99WGTC8Poa6A5zcgQwI05+drr5sf9d22C1nQtGL0bffCw2K5r
         vas6HTJ5KUhlHZ+d1bcZ8qgvI3K+5H7GBdMP06GxVakVEGg9GVRw/xSVZnLosqmM2pZf
         Di2ftLBEwejYhu8ityLWXXAhEUZkEAyMK+DDxYaNUeO4/2w3IOszV/zuVZ4X48tpyLRt
         0HMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733910959; x=1734515759;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5o6spnVR6ajql5nXA/7yn9qe6fHy4wd5WT4oqg7Hxjg=;
        b=IU/mRxrDjHc1er55BO5QuaEetCI69Ifev3XdaTyw2If0JNGdgznedXFTk0iVDGy59d
         im4iMcxsEwcPGl7GQjMbb+Rmm/rGD8dCyloZketp7radik3kNcjVqJddCP5Br4gKZEaN
         KYGuVsapuUDaDf8XUC5u3/OKtLlwH6T+R+/qTD1KUBku82gp5F/i7H3fo1MiDktGPcs5
         9fIgWSZHtcllQZkHm2rOkFbnZ8PVLpeFDbAi/LQ5pNbs0aZ0jA+yqV3N8OZ2Ktx75ooL
         08mOqqa8O12IlVoZ8jIdZYoYc1rSbZicdC9S/cqiyI6JfNvKnhruH7otBYrPnzbYPMcj
         aOdg==
X-Forwarded-Encrypted: i=1; AJvYcCXJxliw+km5NlgNF/lvABhJTGHJCqUWYV1RgTB5skqyCqQTBjUQ1/a+upPBtMOsbCIiZR+4WumLBs0xRegB@vger.kernel.org
X-Gm-Message-State: AOJu0YxO7bRtuUVpqe5RMNQyvE7vgtPttijBx4ehLtAVtNnVmJKhHkh1
	QPmU/rFh34a2n7VLcvTMFSeX0TC0Q8gE6I8MtZInqh4xpZ3YLb9atnJSZ2+8gYk=
X-Gm-Gg: ASbGncuJ8S9A0HcHQ1Fnlqw7Wl2g+F7rikSXZXz/FPxPNIO/esdLPA/nbq45ipuFt+A
	lWyT1kq7s5CF3qwjRWK15H4HXUXYJ0gETftwX7aNeGnrGOUNLklAKbQ4P8Qp0IlVCn76/k9ieg+
	lN+eYTjtDB+7dihNlP/jgBbOp+ZGVL4oPrggwr4YG3NszWi9rr2ZqGsiK95hcRRa64X5iUotKOp
	lnuE+XoPgujACPNWIo63mXUEuNaGycf6mJT4sVsS3f/ZwV3HItmQe7u/+hQ6Z6fmRspddYqQbou
	9hXdyQYa5cYzqXltn9/3lxnsGsRwB7tjcw==
X-Google-Smtp-Source: AGHT+IFChwIInqKh4toLH7hhsT9qt9s90iu0Z0ak8AysLNTaQPEcT5Yq2WRNWpMzPvyheGTGJPWcWQ==
X-Received: by 2002:a05:6512:158b:b0:540:1fcd:1d9b with SMTP id 2adb3069b0e04-5402a609b3fmr630278e87.54.1733910958544;
        Wed, 11 Dec 2024 01:55:58 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e372946dcsm1563735e87.163.2024.12.11.01.55.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 01:55:57 -0800 (PST)
Date: Wed, 11 Dec 2024 11:55:54 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
	Danilo Krummrich <dakr@redhat.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Johan Hovold <johan@kernel.org>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH RFC 4/4] drm/msm/dp: Add support for LTTPR handling
Message-ID: <iqt3i5mha44wksx7zqjjccz3od5tavyxygyda2dn2fz2w77n36@gyo3dh6a6j72>
References: <20241031-drm-dp-msm-add-lttpr-transparent-mode-set-v1-0-cafbb9855f40@linaro.org>
 <20241031-drm-dp-msm-add-lttpr-transparent-mode-set-v1-4-cafbb9855f40@linaro.org>
 <6lpeexb5menpwrzcnmr367x4lmhvzyovhdybn54mnwk55ieehy@mos4oso67boo>
 <Z1lWgDk6vzbx4ew7@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z1lWgDk6vzbx4ew7@linaro.org>

On Wed, Dec 11, 2024 at 11:08:16AM +0200, Abel Vesa wrote:
> On 24-10-31 18:54:25, Dmitry Baryshkov wrote:
> > On Thu, Oct 31, 2024 at 05:12:48PM +0200, Abel Vesa wrote:
> > > Link Training Tunable PHY Repeaters (LTTPRs) are defined in DisplayPort
> > > 1.4a specification. As the name suggests, these PHY repeaters are
> > > capable of adjusting their output for link training purposes.
> > > 
> > > The msm DP driver is currently lacking any handling of LTTPRs.
> > > This means that if at least one LTTPR is found between DPTX and DPRX,
> > > the link training would fail if that LTTPR was not already configured
> > > in transparent mode.
> > 
> > It might be nice to mention what is the transparent mode, especially for
> > those who do not have the standard at hand.
> 
> Sorry for the late reply.
> 
> Will do in the next version.
> 
> > 
> > > The section 3.6.6.1 from the DisplayPort v2.0 specification mandates
> > > that before link training with the LTTPR is started, the DPTX may place
> > > the LTTPR in non-transparent mode by first switching to transparent mode
> > > and then to non-transparent mode. This operation seems to be needed only
> > > on first link training and doesn't need to be done again until device is
> > > unplugged.
> > > 
> > > It has been observed on a few X Elite-based platforms which have
> > > such LTTPRs in their board design that the DPTX needs to follow the
> > > procedure described above in order for the link training to be successful.
> > > 
> > > So add support for reading the LTTPR DPCD caps to figure out the number
> > > of such LTTPRs first. Then, for platforms (or Type-C dongles) that have
> > > at least one such an LTTPR, set its operation mode to transparent mode
> > > first and then to non-transparent, just like the mentioned section of
> > > the specification mandates.
> > > 
> > > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > > ---
> > >  drivers/gpu/drm/msm/dp/dp_display.c | 25 +++++++++++++++++++++++++
> > >  1 file changed, 25 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> > > index f01980b0888a40b719d3958cb96c6341feada077..5d3d318d7b87ce3bf567d8b7435931d8e087f713 100644
> > > --- a/drivers/gpu/drm/msm/dp/dp_display.c
> > > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> > > @@ -107,6 +107,8 @@ struct dp_display_private {
> > >  	struct dp_event event_list[DP_EVENT_Q_MAX];
> > >  	spinlock_t event_lock;
> > >  
> > > +	u8 lttpr_caps[DP_LTTPR_COMMON_CAP_SIZE];
> > > +
> > >  	bool wide_bus_supported;
> > >  
> > >  	struct dp_audio *audio;
> > > @@ -367,12 +369,35 @@ static int dp_display_send_hpd_notification(struct dp_display_private *dp,
> > >  	return 0;
> > >  }
> > >  
> > > +static void dp_display_lttpr_init(struct dp_display_private *dp)
> > > +{
> > > +	int lttpr_count;
> > > +
> > > +	if (drm_dp_read_lttpr_common_caps(dp->aux, dp->panel->dpcd,
> > > +					  dp->lttpr_caps))
> > > +		return;
> > > +
> > > +	lttpr_count = drm_dp_lttpr_count(dp->lttpr_caps);
> > > +
> > > +	if (lttpr_count) {
> > > +		drm_dp_lttpr_set_transparent_mode(dp->aux, true);
> > > +
> > > +		if (lttpr_count > 0) {
> > > +			if (drm_dp_lttpr_set_transparent_mode(dp->aux, false) != 1)
> > > +				drm_dp_lttpr_set_transparent_mode(dp->aux, true);
> > > +		}
> > > +	}
> > > +}
> > > +
> > >  static int dp_display_process_hpd_high(struct dp_display_private *dp)
> > >  {
> > >  	struct drm_connector *connector = dp->dp_display.connector;
> > >  	const struct drm_display_info *info = &connector->display_info;
> > >  	int rc = 0;
> > >  
> > > +	if (!dp->dp_display.is_edp)
> > > +		dp_display_lttpr_init(dp);
> > 
> > Why is it limited to non-eDP cases only.
> 
> In case of eDP, I don't think that there will ever by a case that will
> need an LTTPR in between the eDP PHY and the actual panel. It just
> doesn't make sense.
> 
> IIUC, the LTTPRs, since are Training Tunnable capable, they help when
> the physical link between the PHY and the sink can differ based on
> different dongles and cables. This is obviously not applicable to eDP.

I think I just have a different paradigm: if the driver explicitly skips
calling a function in some codepath, I assume that the usecase it broken
or expected not to work (e.g. I read your patch like: LTTPR is expected
not to work in eDP). If you would prefer to keep two separate code
paths, please add a comment like 'we don't expect LTTPRs in eDP
usecase`.

> > > +
> > >  	rc = dp_panel_read_sink_caps(dp->panel, connector);
> > >  	if (rc)
> > >  		goto end;
> > > 
> > > -- 
> > > 2.34.1
> > > 
> > 
> > -- 
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry

