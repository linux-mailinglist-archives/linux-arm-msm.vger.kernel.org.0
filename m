Return-Path: <linux-arm-msm+bounces-43910-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9ABA00D7A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 19:16:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EBAE57A03F7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 18:16:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FC351F9F4F;
	Fri,  3 Jan 2025 18:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bNrUP7F8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E22711FC0F3
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jan 2025 18:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735928196; cv=none; b=Aj9pd1aei4OVEG40iVJYXgWZ9UrvlJGbMNF8PLXQrkWdFZwKHVmp36zG1SsARcQzNqKT+Vk0nu+mk0q4DHMScPnnISyZx5kCZv/O1+38g0+rzyjWCscYodPbMNNoWypcJScXKiMtPqSRn7qE08GE8ixeMH0G+BfJaBlbax1ONpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735928196; c=relaxed/simple;
	bh=nMz6wKMbARuMs2Xricte7THEHrp7IfrVfF2PDmx9Jzg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IFAG1gRIIyAyKVf1vrrLddEjv9RYeec1HumTIi0E/irRrmf8lt8OsWqT3KOLfulJYP/4xEgbVipZ4T02KgH8x1XLr3My5xWS6QX/14DGFU60+QtlkdQ5lhTTM6ytf0r8i8/vGCShFtsG/KMPNTdOSXP+gCRj4etOwjTmnxpEelQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bNrUP7F8; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-540215984f0so13188963e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jan 2025 10:16:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735928191; x=1736532991; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CEJ8oonqtcvJ6IAkiqfllwsDWGyyWC08rfpdJ62V49g=;
        b=bNrUP7F8MyQyX7WbWIAD/1Ft8A5CzcFzEZIu1tnPoAJtZ8oqf7SAbd06SnY9nlCop8
         aq1twnl62BzQ+1vZjTaQX8PTQyeFgEYzl2/ON3+2NobxGzI97ftEEx1GqVgd98z/V63a
         Wz9HaDVqFbPP1Amu+VeCvJM3aU/bV6AFpPeGmErOD2PsbVdjTXk1Z2ardIVNQvWqSyR9
         nKGpqSFggE4QRLIxfeUnt5x7ZxqSaHQJgWhyMdybAcTosF9gy2QOhpktKvlDoiogBFUW
         IJyoqoci2KmzARJkWenVf9JnvYc2xdH+fgfoFjlKMA8NRhXiOlO0Dy+JXZQ0AYNYvXgo
         nDEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735928191; x=1736532991;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CEJ8oonqtcvJ6IAkiqfllwsDWGyyWC08rfpdJ62V49g=;
        b=UZr7KlaMgI/8BVbODzSczzAVXZw2E2uvG9WC8cYQmZDKqRZDknHSoglBDTU1oTBNPD
         DkD08IywvIlRB9xga+bHcQ7JaRsd32K5+1E/zkro5BQ46IDYcfOO4qOkkjMOGGq8YUZT
         dGfLfCNtkOLxJwghn3sFZFDlSfZylyHvcP5A+n1cLgtQKIDLDbmdc0DVZ5sqaBhW7Fwg
         JSFSuStI5Tz8upu6gb6/7z9dUBV7y69XqK5dLRx57NvezbGCSArOls2JkGZXY4fYFfUL
         T/hsdPO/wZ4wBoK8KhJuTShNEC+kh3SQYnStRpqNknayIZPo3tjnjn/t/XJE0ZuHGnyK
         p4HQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzyjdDoe+2IbSCwx5lIoY11OLvlEGUtkhCDdMPXGSbBm/Yn7w1ViFJr9ixJ0LkZDFBT595MvfII2P3yZg9@vger.kernel.org
X-Gm-Message-State: AOJu0YzCJO4zCzXiJcn+RVUNyFMFpdOfGKSj/IjccBUfjaZFryzog/zm
	ftjoXuOJeDoTvRfDdrFes3ERmkiLVBb9p8gCXThFrXGhxhtt92hZ/ZYzrDp6MSs=
X-Gm-Gg: ASbGncuGCsjp0F+Ic0ktjKyCBiyyAsoYH+rEJx+GQsyGXULOW8mYeqG3K4CGxxW7Lfo
	zypvurF6l7WUX/Vha2wTzpw+TeJuvuf1RWy5m6EOv3//gttmdCcjvZbRtjFVHxblidXVNiB2U59
	voEFjMFhJwW42/DKyezTc6oxyNdowjjRjJ+k/bG9/ML0pSXEQwCQ0f47+/xEFXY03AeKOxWH+S9
	zlbFN8p+fafGH63eZYBMVFf+lSTuv3SIafVxl32nw8LNru2DdXpPipggJ7chGS7uBbLOKSzU3j1
	i6JgOoGtQm41xylIYC/y2FAHzJyOqnygfgsP
X-Google-Smtp-Source: AGHT+IEvvepfOBU+EsQDIAwIOdIqeI1ZlSV0iPdxp215z+zkJx6XJtR+bJJEVpMxCwPG4qFEfl+uKQ==
X-Received: by 2002:a05:6512:23a0:b0:540:75d3:95a4 with SMTP id 2adb3069b0e04-54229538b24mr15437986e87.17.1735928191141;
        Fri, 03 Jan 2025 10:16:31 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223813692sm4128190e87.125.2025.01.03.10.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 10:16:29 -0800 (PST)
Date: Fri, 3 Jan 2025 20:16:27 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, quic_abhinavk@quicinc.com, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>, 
	quic_ebharadw@quicinc.com, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>, 
	Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v4 15/25] drm/msm/dpu: Add CWB to msm_display_topology
Message-ID: <a4akor2liqafta53zeev22x2pkqwzo5szwidr2ruzdvttvze5h@jtio3jue7ez3>
References: <20241216-concurrent-wb-v4-0-fe220297a7f0@quicinc.com>
 <20241216-concurrent-wb-v4-15-fe220297a7f0@quicinc.com>
 <ki35rornnos35r3fzg5yyqzxnqua3dyfb6ewq2aefrh4u74vfi@opdnf44ntten>
 <4069bd6a-c37f-4dbe-bbd6-5b333ee54ad8@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4069bd6a-c37f-4dbe-bbd6-5b333ee54ad8@quicinc.com>

On Fri, Jan 03, 2025 at 10:03:35AM -0800, Jessica Zhang wrote:
> 
> 
> On 12/19/2024 9:03 PM, Dmitry Baryshkov wrote:
> > On Mon, Dec 16, 2024 at 04:43:26PM -0800, Jessica Zhang wrote:
> > > Add the cwb_enabled flag to msm_display topology and adjust the toplogy
> > > to account for concurrent writeback
> > 
> > Why?
> 
> Hi Dmitry,
> 
> This flag is necessary to specify that CWB mux(es) need to be assigned for
> the given reqeusted topology.

Why is necessary? Please rephrase your statement (we need foo bar, so do
baz).

> 
> > 
> > > 
> > > Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> > > ---
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 11 ++++++++++-
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c   | 10 ++++++++--
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h   |  2 ++
> > >   3 files changed, 20 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > index b4bfded3d53025853cee112ca598533ece290318..b063c8fe4c0594772d84401fa56c9c21afc0ad18 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > @@ -1198,6 +1198,8 @@ static struct msm_display_topology dpu_crtc_get_topology(
> > >   		dpu_encoder_update_topology(drm_enc, &topology, crtc_state->state,
> > >   					    &crtc_state->adjusted_mode);
> > > +	topology.cwb_enabled = drm_crtc_in_clone_mode(crtc_state);
> > > +
> > >   	/*
> > >   	 * Datapath topology selection
> > >   	 *
> > > @@ -1209,9 +1211,16 @@ static struct msm_display_topology dpu_crtc_get_topology(
> > >   	 * 2 LM, 1 INTF (stream merge to support high resolution interfaces)
> > >   	 *
> > >   	 * Add dspps to the reservation requirements if ctm is requested
> > > +	 *
> > > +	 * Only hardcode num_lm to 2 for cases where num_intf == 2 and CWB is not
> > > +	 * enabled. This is because in cases where CWB is enabled, num_intf will
> > > +	 * count both the WB and real-time phys encoders.
> > > +	 *
> > > +	 * For non-DSC CWB usecases, have the num_lm be decided by the
> > > +	 * (mode->hdisplay > MAX_HDISPLAY_SPLIT) check.
> > >   	 */
> > > -	if (topology.num_intf == 2)
> > > +	if (topology.num_intf == 2 && !topology.cwb_enabled)
> > >   		topology.num_lm = 2;
> > >   	else if (topology.num_dsc == 2)
> > >   		topology.num_lm = 2;
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > > index b763ef19f4c60ae8a35df6a6ffb19e8411bc63f8..85adaf256b2c705d2d7df378b6ffc0e578f52bc3 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > > @@ -382,8 +382,14 @@ static int _dpu_rm_reserve_ctls(
> > >   	int i = 0, j, num_ctls;
> > >   	bool needs_split_display;
> > > -	/* each hw_intf needs its own hw_ctrl to program its control path */
> > > -	num_ctls = top->num_intf;
> > > +	/*
> > > +	 * For non-CWB mode, each hw_intf needs its own hw_ctl to program its
> > > +	 * control path. Hardcode num_ctls to 1 if CWB is enabled
> > > +	 */
> > 
> > Why?
> 
> This is because num_intf is based on the number of phys_encs. Since in the
> CWB case, the WB and real-time encoders will be driven by the same CTL. I
> can add this to the comment doc.

Why are they driven by the same CTL? Is it also the case for platforms
before DPU 5.x?

> 
> Thanks,
> 
> Jessica Zhang
> 
> > 
> > > +	if (top->cwb_enabled)
> > > +		num_ctls = 1;
> > > +	else
> > > +		num_ctls = top->num_intf;
> > >   	needs_split_display = _dpu_rm_needs_split_display(top);
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> > > index b061dfdab52e04ab7d777e912a30173273cb3db7..12db21a2403ec6930894c36a58e898c5d94c2568 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> > > @@ -46,6 +46,7 @@ struct dpu_rm {
> > >    * @num_dspp:     number of dspp blocks used
> > >    * @num_dsc:      number of Display Stream Compression (DSC) blocks used
> > >    * @needs_cdm:    indicates whether cdm block is needed for this display topology
> > > + * @cwb_enabled:  indicates whether CWB is enabled for this display topology
> > >    */
> > >   struct msm_display_topology {
> > >   	u32 num_lm;
> > > @@ -53,6 +54,7 @@ struct msm_display_topology {
> > >   	u32 num_dspp;
> > >   	u32 num_dsc;
> > >   	bool needs_cdm;
> > > +	bool cwb_enabled;
> > >   };
> > >   int dpu_rm_init(struct drm_device *dev,
> > > 
> > > -- 
> > > 2.34.1
> > > 
> > 
> > -- 
> > With best wishes
> > Dmitry
> 

-- 
With best wishes
Dmitry

