Return-Path: <linux-arm-msm+bounces-43191-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 318779FB9DA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 07:32:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 680A27A1C8E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 06:32:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8185CA6F;
	Tue, 24 Dec 2024 06:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lhf9sVQw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B33E8EC0
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Dec 2024 06:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735021972; cv=none; b=EVl60A/mXZgDysVW5hl2dONhWTFSnUhQ87+yAJAVYPtECg5Bz7eVkgZspOj1jIOOV0f5XbA32Ykzmgzq/gw6/HHJo9HAe4Ey/R2S1bS7nTJqoTsA1gWtGMItFy79oYRXJuJMpvUWH3Y/B/3rvheMkbtWaTLTfk7it1BDtjeihBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735021972; c=relaxed/simple;
	bh=N3mdxO6LqVTnrU1lTktN9cbBSGb7nc8+PDPMuZ7fHE8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rdIWZdjkmmfUCTvMiOmZC0Oek86bqnfRf7ZXO1YIfhVJuC/5mfkaPxS9DIoCBkN26icppx7DDMVyGt30whGP6dW43IaNF4cb+UdgcEVBQH1Hd1uB3BRRYPIlsn9JbWLRojrbj3ghXOseKDDNlcWMmYs84iI9Nc9AGJrq8T1QMbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lhf9sVQw; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-540254357c8so4927883e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Dec 2024 22:32:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735021969; x=1735626769; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bincwshAYNCJ6hJiNrJokdCtTwI1ZrZprXh0S5Xi7zE=;
        b=lhf9sVQw5OW0V6JODMLPO2ioufKG4lUy9gc2kQh5eDdNDd0Ryw26nBLaAkvTBHJptn
         78QfIxaAn9xlp/7LL/viROHoLXS3K9/rkLlcEAK3iBGzKaT6/OgJU+p/Ixybwn35Ydv7
         2CIZzjH1upf3ZtPVxQhq5oNyvWCatmgINFhod9m36symZ+kgBBcM7QjLpyZ9NzuuUt84
         VHQ/tElvc9mZNxfxDRXyxteEV+2V/gsSEwsL79VyObkAvLU5qXM4Xx2CpdRDQC/bkpNx
         HaE61YVXrHtWVmlcbPeWwEzvUwi+0LDiEQ4Wbr86TPCNQYVlnAKp3KZr0TwC2ZFJGxeW
         iYTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735021969; x=1735626769;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bincwshAYNCJ6hJiNrJokdCtTwI1ZrZprXh0S5Xi7zE=;
        b=PCzzaiPSCffZ1Y0+7oNtvgrB4xPynoHpogavA/PJSutRTOaA45+UjfJruvqFBlePZZ
         y5yzZLdpVHrHKi4b6govchQYcRRQudhM3AfL8OG+qe9KrTTwtddv1FiC3/zFNmI/AAnM
         zqWpdLffkzpCY4fmPHZAGKfjyY3BuuGISDr3lCfrLeFpSgVVnpvD8L31pey8wG39Mib+
         dv9ybI9KZ8jQwtLyZesGrbUKI1swjZT3hCJV14rMKBCOfqZZgCHfMTH0oFgGHIcL+6Ke
         JdRbHpdENmuElg7/QYLUXCJG7NsRHwCXUwd2+k65CZdCIYGuNuR5Q8O2Yo2kAaYUnxXf
         5gEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvlw7wfXdKE2/aLWKG+VRnbe1+r5tBaCf0O1H1ur4PV9IIwICfeofqRBzD9hUSKb+FpVKDFWgTSPloR3ys@vger.kernel.org
X-Gm-Message-State: AOJu0YyxHtWJm7w5xC/K36yJzDLSiaH91HtCPEOVKI0UCCrNVKXtjtO0
	64As66E3KOotZ35BYXUxvAPFg774Q25fWvSn2myqg55Log5oafPgHnEl2es8bOo=
X-Gm-Gg: ASbGnctU2jj4okyKWItZSlqun8RDP5tQePbx/Hv2SvHoVq1BdF5eUdZdhRhc5ofEz5F
	Us5UdnKiWBNcY03dEE2gHo4172OTMUC43V1RVFjULUo4jokMnsAOPQ7e3eEE03Lxa4X4qFRhYz/
	KFmfMgy8rvuApLSLIeWJ39UE6jr5E4i6dIfvCUtu+Ec5nonlR4QgSg6GxnGm7Tg8wunWg1g2SDr
	RXG7DNcUwjs4hc3zrWQZIDQc9fncKJy/2xnFBm9gLhBjleRMXAJfM7wdOrAhbGkHYlCfWP4IcT/
	fQgfbNxYm1gfiOGeJIg+fQOYc2t6uB/1OBDw
X-Google-Smtp-Source: AGHT+IG2dUyPsRFhwHcHhqelrSh4mxVgYi+bc7D5YG6R7v8H+FahxoLp7u/H0DSLNi487A5ahAGY5w==
X-Received: by 2002:a05:6512:3d22:b0:53e:39c2:f021 with SMTP id 2adb3069b0e04-54229533228mr5103052e87.15.1735021968071;
        Mon, 23 Dec 2024 22:32:48 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223600508sm1535074e87.94.2024.12.23.22.32.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 22:32:47 -0800 (PST)
Date: Tue, 24 Dec 2024 08:32:44 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>, 
	Doug Anderson <dianders@chromium.org>, Johan Hovold <johan@kernel.org>, 
	Bjorn Andersson <quic_bjorande@quicinc.com>
Subject: Re: [PATCH 2/4] drm/msm/dp: remove redundant ST_DISPLAY_OFF checks
 in msm_dp_bridge_atomic_enable()
Message-ID: <ldcydwcuwkwwng4d3b47pjz3ndhuhwerz6t3drwmifdzh7g3nl@3y6es72w74d7>
References: <20241202-hpd_display_off-v1-0-8d0551847753@quicinc.com>
 <20241202-hpd_display_off-v1-2-8d0551847753@quicinc.com>
 <f6oh3kid5dfiqe7jy7j3d4gcv4evbtztzpgiygvzfsu6qlim2j@2vsulwcau6tr>
 <58d28874-0fcc-42f4-831d-1f304f7d9d4f@quicinc.com>
 <orsov5jni37n7m3xm4qdiurnfzdubxy45itmrb5gwi243l2l5t@vz623b5c35n5>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <orsov5jni37n7m3xm4qdiurnfzdubxy45itmrb5gwi243l2l5t@vz623b5c35n5>

On Wed, Dec 04, 2024 at 12:32:55PM +0200, Dmitry Baryshkov wrote:
> On Tue, Dec 03, 2024 at 07:24:46PM -0800, Abhinav Kumar wrote:
> > 
> > 
> > On 12/3/2024 5:53 AM, Dmitry Baryshkov wrote:
> > > On Mon, Dec 02, 2024 at 04:39:01PM -0800, Abhinav Kumar wrote:
> > > > The checks in msm_dp_display_prepare() for making sure that we are in
> > > > ST_DISPLAY_OFF OR ST_MAINLINK_READY seem redundant.
> > > > 
> > > > DRM fwk shall not issue any commits if state is not ST_MAINLINK_READY as
> > > > msm_dp's atomic_check callback returns a failure if state is not ST_MAINLINK_READY.
> > > 
> > > Can the state change between atomic_check() and atomic_commit()?
> > > 
> > 
> > Good question.
> > 
> > I cannot deny that such a possibility does exist.
> > 
> > From what I can see in the state machine today, the only possibility I can
> > think of here is if a user very quickly removes the cable as soon as they
> > connect the cable like so fast that the connect was not yet processed before
> > disconnect.
> 
> If the cable has electrical issues, it is possible even w/o user
> intervention.

And the possible desynchronisation between DRM atomic states and HPD
state machine brings back the topic: can we get rid of the state
machine instead of trying to fix it? I'd rather see a patchset that
removes it completely. The link training should go to the atomic_enable,
etc, etc. Please? Pretty please? I'd rather see imperfect solution which
has possible issues with some of the dongles (as they can be fixed later
on) than having the imperfect HPD state machine which is known to break
DRM framework expectations.

> 
> > 
> > Similarly, if an irq_hpd fires after atomic_check but before
> > atomic_enable(), and moreover if we hit the sink_count == 0 case in
> > msm_dp_display_handle_port_status_changed() during this irq_hpd,
> > 
> > In both these cases, then we will transition to ST_DISCONNECT_PENDING state.
> > 
> > Without this change, we would have bailed out in the ST_DISCONNECT_PENDING
> > case.
> > 
> > But other than this, I cannot atleast think of a case where a different
> > state transition can happen between atomic_check() and atomic_commit()
> > because for other transitions, I think we should be still okay.
> > 
> > But this is purely based on theoretical observation and hypothesis.
> > 
> > Is it better to add a check to bail out in the DISCONNECT_PENDING case?
> 
> I think so, please.
> 
> > 
> > OR document this as "To-do: Need to bail out if DISCONNECT_PENDING" because
> > even if I add this check, I dont know if can make sure this can be validated
> > as the check could never hit.
> > 
> > 
> > > > 
> > > > For the ST_DISPLAY_OFF check, its mainly to guard against a scenario that
> > > > there is an atomic_enable() without a prior atomic_disable() which once again
> > > > should not really happen.
> > > > 
> > > > To simplify the code, get rid of these checks.
> > > > 
> > > > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > > ---
> > > >   drivers/gpu/drm/msm/dp/dp_display.c | 6 ------
> > > >   1 file changed, 6 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> > > > index 992184cc17e4..614fff09e5f2 100644
> > > > --- a/drivers/gpu/drm/msm/dp/dp_display.c
> > > > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> > > > @@ -1513,12 +1513,6 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
> > > >   		return;
> > > >   	}
> > > > -	state = msm_dp_display->hpd_state;
> > > > -	if (state != ST_DISPLAY_OFF && state != ST_MAINLINK_READY) {
> > > > -		mutex_unlock(&msm_dp_display->event_mutex);
> > > > -		return;
> > > > -	}
> > > > -
> > > >   	rc = msm_dp_display_set_mode(dp, &msm_dp_display->msm_dp_mode);
> > > >   	if (rc) {
> > > >   		DRM_ERROR("Failed to perform a mode set, rc=%d\n", rc);
> > > > 
> > > > -- 
> > > > 2.34.1
> > > > 
> > > 
> 
> -- 
> With best wishes
> Dmitry

-- 
With best wishes
Dmitry

