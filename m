Return-Path: <linux-arm-msm+bounces-41470-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C62479ECAAA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 11:52:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8332028A146
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 10:52:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 330B91A8410;
	Wed, 11 Dec 2024 10:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F+VCgvH1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5F6239BD9
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 10:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733914330; cv=none; b=kTks9+rWq8Fs/HPkczbXpEhE22WRkNRWYDSXfW5qLHpfeXIvdbTWEDyaz44QjK3W95UCedE/KoFnC/V1MSM801ra4n67OrJKgbSzeO0IKOzxdEFIrsP5YExe0Jx4Vz2V46iUp6VBOVHp31KFcJOyY8wzWu6JqQg+S5DvANetHg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733914330; c=relaxed/simple;
	bh=XTWLX3H1aLkf21r4Z2LO8vdchchZzUBOI+uy0UCgByk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dVuh2qiU5edQYCslpPg6pFN8F/1tuWevgJFX/2gT7GJpepQzgai+lU838N7o7wn/ZEf73vW04+QR53NvXfbcyAvFLdpNSaJptZPEcIGkPaAIysirWNYL6k7L8pI2fBZXLp5vjsdnec+e0FZwNEk8AtBSF2OePzVqrJX+HMPHgCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F+VCgvH1; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-382610c7116so3385031f8f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 02:52:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733914326; x=1734519126; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XFBLxqgMKAfLfvAfVQrN7MaLGNe6NYPC9fHI64gRBug=;
        b=F+VCgvH1UWxwKFl65UopZsWTLfkv9Y0YRnPrk7QC89wkbiL39YN82f6862nUDJPJNn
         wtNNeb6CpWwSH7sfttSZ15zkJKBCTy/FHKqpqV06RnP3cXYUWKnsIAkgfmbGNTRVdDR7
         mvpyj3Ynq1sT0yAjCsFjqMvheX0Abv81UUPH5nmiSPfiaqVPdKdPC12Cl90KwUIU+kIx
         r+VX3Wr6FtTjPsne+UojIK1fFlGOlJjWqZUFM71NncaK61a3OoM1yYMEwZ6LKos2xftI
         w4y6umLRRAZDyMsa/LUuqJ2xEg8rFyrfRNVd5sGb0g8OboRorCRzC7LJ6Danyor1Hxri
         85DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733914326; x=1734519126;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XFBLxqgMKAfLfvAfVQrN7MaLGNe6NYPC9fHI64gRBug=;
        b=AVimh84H7RMmGOnPWsO2c85i1Kqn83Dk3ZnrfLTCwB+fulL+2TmJyPo7hPi33zOkix
         XowvI02ob/pmSzfU2hUOgTColJBAuId4mYU5j14pe3cqwBDpou0BQ3QdyhT7FBsb7C+I
         KdKniIIuJ/Qj0noN8KHVxJ1l1jff7JdNg7Bx2ZQvfMk+mDYXhe4Syjuu+n01KVYQRRE1
         W+DMfFosDTiSAwk+ptC1MhCocgAso6jFPcTj2gBAWm0AGMeWdWAJ0xC8SCA88PNqh0k1
         2p9C8JQiRli7sRhqGQGNCzy98GoStB4mQCiT7M74kHm0fa6Ad3BwvPQuYK+10PBet8rf
         xREg==
X-Forwarded-Encrypted: i=1; AJvYcCWdmrtqup691tK/OFGhvInZ1PFqSCpqq1Pnpy6troAFCyNp8fcK8+35BfktHkU3ppGSc8Suw7z6ih9LmkdZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwJSdQbsy8PNt5S4MD2z9ZyATDYbnRTr1Y+PjxblF5Tn9o3i7Tb
	bMnG8nIgGCfoY+j8R2Eyt/uUmN9Eo10a0Jhj1SzhLIHyiLstagQHvuopXKykgWw=
X-Gm-Gg: ASbGncu0+2W9pgrTP+dkbTWQbuG882g8OXN6ced5bDO5zXVM0k3Hcvwo/f7N0zpD/A6
	DCW2Q7O2LWG2+LsbY23j7Y9AAQ3VNG+QCYNl3jI7h5hG8j+UfJJtaQHA0oOMPoeXXzKSaLYIlhG
	JvjAe6CorAbsgDx8snYiwwcdlQHquxIB96wSzVR5N6dVCl9E3uqeLYV9s7kP5YENntjCsudRoeV
	Xmz9ulx99YisAhrPja2hb2DV91kTSjWhxF5VwMjRyuj5yzWhutV
X-Google-Smtp-Source: AGHT+IFBGgeOIhgT/0xoVrPzs9kikKVwZG8cyzRbTcEIDbZA5WI7Cssaqba8E6bBXazv0oFwTl1XNg==
X-Received: by 2002:a05:6000:a0b:b0:385:ebea:969d with SMTP id ffacd0b85a97d-3864ce55a7fmr1934159f8f.22.1733914326450;
        Wed, 11 Dec 2024 02:52:06 -0800 (PST)
Received: from linaro.org ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-387824a4e98sm1006870f8f.34.2024.12.11.02.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 02:52:05 -0800 (PST)
Date: Wed, 11 Dec 2024 12:52:03 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Johan Hovold <johan@kernel.org>, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH RFC 4/4] drm/msm/dp: Add support for LTTPR handling
Message-ID: <Z1lu04a4hlvAUQbX@linaro.org>
References: <20241031-drm-dp-msm-add-lttpr-transparent-mode-set-v1-0-cafbb9855f40@linaro.org>
 <20241031-drm-dp-msm-add-lttpr-transparent-mode-set-v1-4-cafbb9855f40@linaro.org>
 <6lpeexb5menpwrzcnmr367x4lmhvzyovhdybn54mnwk55ieehy@mos4oso67boo>
 <Z1lWgDk6vzbx4ew7@linaro.org>
 <iqt3i5mha44wksx7zqjjccz3od5tavyxygyda2dn2fz2w77n36@gyo3dh6a6j72>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <iqt3i5mha44wksx7zqjjccz3od5tavyxygyda2dn2fz2w77n36@gyo3dh6a6j72>

On 24-12-11 11:55:54, Dmitry Baryshkov wrote:
> On Wed, Dec 11, 2024 at 11:08:16AM +0200, Abel Vesa wrote:
> > On 24-10-31 18:54:25, Dmitry Baryshkov wrote:
> > > On Thu, Oct 31, 2024 at 05:12:48PM +0200, Abel Vesa wrote:
> > > > Link Training Tunable PHY Repeaters (LTTPRs) are defined in DisplayPort
> > > > 1.4a specification. As the name suggests, these PHY repeaters are
> > > > capable of adjusting their output for link training purposes.
> > > > 
> > > > The msm DP driver is currently lacking any handling of LTTPRs.
> > > > This means that if at least one LTTPR is found between DPTX and DPRX,
> > > > the link training would fail if that LTTPR was not already configured
> > > > in transparent mode.
> > > 
> > > It might be nice to mention what is the transparent mode, especially for
> > > those who do not have the standard at hand.
> > 
> > Sorry for the late reply.
> > 
> > Will do in the next version.
> > 
> > > 
> > > > The section 3.6.6.1 from the DisplayPort v2.0 specification mandates
> > > > that before link training with the LTTPR is started, the DPTX may place
> > > > the LTTPR in non-transparent mode by first switching to transparent mode
> > > > and then to non-transparent mode. This operation seems to be needed only
> > > > on first link training and doesn't need to be done again until device is
> > > > unplugged.
> > > > 
> > > > It has been observed on a few X Elite-based platforms which have
> > > > such LTTPRs in their board design that the DPTX needs to follow the
> > > > procedure described above in order for the link training to be successful.
> > > > 
> > > > So add support for reading the LTTPR DPCD caps to figure out the number
> > > > of such LTTPRs first. Then, for platforms (or Type-C dongles) that have
> > > > at least one such an LTTPR, set its operation mode to transparent mode
> > > > first and then to non-transparent, just like the mentioned section of
> > > > the specification mandates.
> > > > 
> > > > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > > > ---
> > > >  drivers/gpu/drm/msm/dp/dp_display.c | 25 +++++++++++++++++++++++++
> > > >  1 file changed, 25 insertions(+)
> > > > 
> > > > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> > > > index f01980b0888a40b719d3958cb96c6341feada077..5d3d318d7b87ce3bf567d8b7435931d8e087f713 100644
> > > > --- a/drivers/gpu/drm/msm/dp/dp_display.c
> > > > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> > > > @@ -107,6 +107,8 @@ struct dp_display_private {
> > > >  	struct dp_event event_list[DP_EVENT_Q_MAX];
> > > >  	spinlock_t event_lock;
> > > >  
> > > > +	u8 lttpr_caps[DP_LTTPR_COMMON_CAP_SIZE];
> > > > +
> > > >  	bool wide_bus_supported;
> > > >  
> > > >  	struct dp_audio *audio;
> > > > @@ -367,12 +369,35 @@ static int dp_display_send_hpd_notification(struct dp_display_private *dp,
> > > >  	return 0;
> > > >  }
> > > >  
> > > > +static void dp_display_lttpr_init(struct dp_display_private *dp)
> > > > +{
> > > > +	int lttpr_count;
> > > > +
> > > > +	if (drm_dp_read_lttpr_common_caps(dp->aux, dp->panel->dpcd,
> > > > +					  dp->lttpr_caps))
> > > > +		return;
> > > > +
> > > > +	lttpr_count = drm_dp_lttpr_count(dp->lttpr_caps);
> > > > +
> > > > +	if (lttpr_count) {
> > > > +		drm_dp_lttpr_set_transparent_mode(dp->aux, true);
> > > > +
> > > > +		if (lttpr_count > 0) {
> > > > +			if (drm_dp_lttpr_set_transparent_mode(dp->aux, false) != 1)
> > > > +				drm_dp_lttpr_set_transparent_mode(dp->aux, true);
> > > > +		}
> > > > +	}
> > > > +}
> > > > +
> > > >  static int dp_display_process_hpd_high(struct dp_display_private *dp)
> > > >  {
> > > >  	struct drm_connector *connector = dp->dp_display.connector;
> > > >  	const struct drm_display_info *info = &connector->display_info;
> > > >  	int rc = 0;
> > > >  
> > > > +	if (!dp->dp_display.is_edp)
> > > > +		dp_display_lttpr_init(dp);
> > > 
> > > Why is it limited to non-eDP cases only.
> > 
> > In case of eDP, I don't think that there will ever by a case that will
> > need an LTTPR in between the eDP PHY and the actual panel. It just
> > doesn't make sense.
> > 
> > IIUC, the LTTPRs, since are Training Tunnable capable, they help when
> > the physical link between the PHY and the sink can differ based on
> > different dongles and cables. This is obviously not applicable to eDP.
> 
> I think I just have a different paradigm: if the driver explicitly skips
> calling a function in some codepath, I assume that the usecase it broken
> or expected not to work (e.g. I read your patch like: LTTPR is expected
> not to work in eDP). If you would prefer to keep two separate code
> paths, please add a comment like 'we don't expect LTTPRs in eDP
> usecase`.

Fair point. But maybe I should drop the non-eDP condition entirely,
since the LTTPR count will read 0 and then the new helper (which
will be called drm_dp_lttpr_init() and will handle the disable->enable->disable
dance, just like you requested) will bail early if LTTPR count is 0.

That way should be more clean, IMO.

> 
> > > > +
> > > >  	rc = dp_panel_read_sink_caps(dp->panel, connector);
> > > >  	if (rc)
> > > >  		goto end;
> > > > 
> > > > -- 
> > > > 2.34.1
> > > > 
> > > 
> > > -- 
> > > With best wishes
> > > Dmitry
> 
> -- 
> With best wishes
> Dmitry

