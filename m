Return-Path: <linux-arm-msm+bounces-89235-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C9824D25691
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 16:39:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 480FC3007516
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 15:39:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A1253A9624;
	Thu, 15 Jan 2026 15:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gSQv+6wd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B05930BB96;
	Thu, 15 Jan 2026 15:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768491573; cv=none; b=hXuyYikH19yL3rv9fIeuiDe/E02lvIzNYVkHAd2z7E45U+KqGXbHQZqfUYTVKhCr1DaYde1D/osF0szTimLneTtuDiowuRG3tBQW/iwjEvotT9//jTUsS4k0oCkhi31GJSAMBohy+uqnJCfX/04IAPxRRTBdFwPcIA4bMpUfGyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768491573; c=relaxed/simple;
	bh=2/FJr6HKXQ9B/aLFHDzmSIWSdRXZK3fRvthO/uAKRf0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K65Kcman9eZL3F5eSAh5ftjujPCeBcmNsFiVdz3vf4F8VPpC9kC2tpFL21xqP/xr6hEpmOkCNoajUfxuER/8KqjMpYgVyzhZTKpcmreY9iavw7RWWq9K9eFdjIfEwSQSLPuGvp4UVkr7TxVavlS9C7VJ9+8wwhJbY1y3hYNO698=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gSQv+6wd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFE70C116D0;
	Thu, 15 Jan 2026 15:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768491572;
	bh=2/FJr6HKXQ9B/aLFHDzmSIWSdRXZK3fRvthO/uAKRf0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gSQv+6wdSnMJUJpnVuUTQjJ/9oDIAxTRWnReXeYCDPlR645g15u04uwi7xi3/DQQ9
	 7QzdEpIsogIGgRv00EKxrcRBKt1Ux8oB2yfAPZuUsrXIzoab8/98jg2hb/orRJ9c7v
	 aYHv9i7E3JWvxQQIXsBk3BhJAbW3lMdu3SVfTxTgATK5JNu6hZLPLp1z5QXJrPvna2
	 lPEA/LHv+RgSaX+BJgDQD1sSQ04Q2w/GLiLH+oaxfzX8q+J/6I5AWlo2xNTWAZR4HV
	 VhziKzeDiY7/w3YVLR3SzjcZqP7HWcwe34RH7WLgAXEZMWvJik7BG/snJziHnPiU/R
	 kJXeEOBOUHaUw==
Date: Thu, 15 Jan 2026 09:39:29 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Subject: Re: [PATCH v3 4/8] drm/msm/dp: Move link training to atomic_enable()
Message-ID: <s5u3th3xw5rbaokoky3zhqhirbmfjljd32oqvyprabkx3xy4uo@tmc2l5domvpk>
References: <20260115-hpd-refactor-v3-0-08e2f3bcd2e0@oss.qualcomm.com>
 <20260115-hpd-refactor-v3-4-08e2f3bcd2e0@oss.qualcomm.com>
 <5b4870fc-911d-4574-a0ce-59428cbdf103@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5b4870fc-911d-4574-a0ce-59428cbdf103@oss.qualcomm.com>

On Thu, Jan 15, 2026 at 10:30:49AM +0100, Konrad Dybcio wrote:
> On 1/15/26 8:29 AM, Dmitry Baryshkov wrote:
> > From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> > 
> > Currently, the DP link training is being done during HPD. Move
> > link training to atomic_enable() in accordance with the atomic_enable()
> > documentation.
> > 
> > Link disabling is already done in atomic_post_disable() (as part of the
> > dp_ctrl_off_link_stream() helper).
> > 
> > Finally, call the plug/unplug handlers directly in hpd_notify() instead
> > of queueing them in the event thread so that they aren't preempted by
> > other events.
> 
> I think this part of the commit message no longer applies 
> 
> > 
> > Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/dp/dp_display.c | 11 ++++++-----
> >  1 file changed, 6 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> > index a05144de3b93..3184066adb15 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_display.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> > @@ -436,11 +436,6 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
> >  	msm_dp_link_psm_config(dp->link, &dp->panel->link_info, false);
> >  
> >  	msm_dp_link_reset_phy_params_vx_px(dp->link);
> > -	rc = msm_dp_ctrl_on_link(dp->ctrl);
> > -	if (rc) {
> > -		DRM_ERROR("failed to complete DP link training\n");
> > -		goto end;
> > -	}
> >  
> >  	msm_dp_add_event(dp, EV_USER_NOTIFICATION, true, 0);
> >  
> > @@ -1695,6 +1690,12 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
> >  		force_link_train = true;
> >  	}
> >  
> > +	rc = msm_dp_ctrl_on_link(msm_dp_display->ctrl);
> > +	if (rc) {
> > +		DRM_ERROR("Failed link training (rc=%d)\n", rc);
> > +		drm_connector_set_link_status_property(dp->connector, DRM_LINK_STATUS_BAD);
> > +	}
> 
> Previously failure in this call would have propagated an error
> 
> msm_dp_ctrl_on_link() enables mainlink clocks, so 
> 

Missed that one. I guess in practice it's not much difference from the
previous behavior - where the display just wouldn't work either, except
for the crash you point out below.

It seems to be that it would make sense to return an error to userspace
when this happens, but the kernel-doc says:

"""
The bridge can assume that the display pipe (i.e. clocks and timing
signals) feeding it is running when this callback is called.
"""

What's the expected error path here?

Regards,
Bjorn

> > +
> >  	msm_dp_display_enable(msm_dp_display, force_link_train);
> 
> IIUC this will crash the machine if the above fails
> 
> Konrad
> 

