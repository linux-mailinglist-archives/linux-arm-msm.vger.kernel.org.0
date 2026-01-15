Return-Path: <linux-arm-msm+bounces-89234-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9800DD255EC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 16:32:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 72DBC3022300
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 15:30:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AFD63B5301;
	Thu, 15 Jan 2026 15:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MtmliGQQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36BE723EA88;
	Thu, 15 Jan 2026 15:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768491027; cv=none; b=WQDZl2Y4+ObQ+unq0iXMnOWeKhd9xsLaej/oRrwQozchNt2hf4KMru/R7zdrw3WAO5axcbD6+31i/XZtLFw5SlXryV15V+YPP9LrkEzctvg6sBW9mUfKq8IxK/vgu8Q17q1EQNJiF2V+tMjeKJb8hr6lTE+EEUYDI2JJTPKdntc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768491027; c=relaxed/simple;
	bh=Tdh8vUSB9h6cGBkd4Yoh0KO4dewGr2XwfKhzq/PFFHU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZYUXG/HwZkoF0hxw7Oiu0v1jNb731O2fLl7K0uxFnizeBGWSx2EvWWk4DX16dJS1y26zK+FG6aReob5IUFk4PsMv4PZOkICcIESv/AaPf86Uvr+jg9PHjyiOIBVVnXDNR64ciYrgzJM0NcD7cuXwEmuC+CvcclWkBlnnGTYLR+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MtmliGQQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D73D5C19422;
	Thu, 15 Jan 2026 15:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768491024;
	bh=Tdh8vUSB9h6cGBkd4Yoh0KO4dewGr2XwfKhzq/PFFHU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MtmliGQQ0HwQXqkNh+gbNIqKmXqZl/GrHlr9sR3xGberqohktFfpXuYDdsBiVt+F/
	 lfTA9zE+M12JzL3Dkt/5IoCd1UZ3JAr+OG+HxOzyYuzsVInkaDbxbcA1AjOHwO+3yS
	 AZJwAqbi1sUiHySvsbrSYYmJoEb/H4ENSuU4IRIisC6OqzqfwBck4OY+u6ScAk838L
	 37RcaB6uTEzpHBFMyat2vY4ILrwJ3tAZwvGsaLptj+oKtaBL8dhHFl4vvwSnkipr2J
	 pbzHHydpkjA4ruZ2gLlfW+BblftHLYoKjEUHd8XbNX7ivKZsf3vv+h7HSAM0kVsY4H
	 cNoqq3JH5IpEg==
Date: Thu, 15 Jan 2026 09:30:22 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Subject: Re: [PATCH v3 4/8] drm/msm/dp: Move link training to atomic_enable()
Message-ID: <x72w6pys3ph7sfcpp2drowkv7wkis2vf2z72eokgo2m3mpiod5@ykuxvtdfcnpf>
References: <20260115-hpd-refactor-v3-0-08e2f3bcd2e0@oss.qualcomm.com>
 <20260115-hpd-refactor-v3-4-08e2f3bcd2e0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115-hpd-refactor-v3-4-08e2f3bcd2e0@oss.qualcomm.com>

On Thu, Jan 15, 2026 at 09:29:09AM +0200, Dmitry Baryshkov wrote:
> From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> 
> Currently, the DP link training is being done during HPD. Move
> link training to atomic_enable() in accordance with the atomic_enable()
> documentation.
> 
> Link disabling is already done in atomic_post_disable() (as part of the
> dp_ctrl_off_link_stream() helper).
> 
> Finally, call the plug/unplug handlers directly in hpd_notify() instead
> of queueing them in the event thread so that they aren't preempted by
> other events.
> 
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index a05144de3b93..3184066adb15 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -436,11 +436,6 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
>  	msm_dp_link_psm_config(dp->link, &dp->panel->link_info, false);
>  
>  	msm_dp_link_reset_phy_params_vx_px(dp->link);

I think unrelated to this patch (and series), but do we really want to
keep the v_level and p_level settings until the user reconnects the
cable?

Regards,
Bjorn

> -	rc = msm_dp_ctrl_on_link(dp->ctrl);
> -	if (rc) {
> -		DRM_ERROR("failed to complete DP link training\n");
> -		goto end;
> -	}
>  
>  	msm_dp_add_event(dp, EV_USER_NOTIFICATION, true, 0);
>  
> @@ -1695,6 +1690,12 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
>  		force_link_train = true;
>  	}
>  
> +	rc = msm_dp_ctrl_on_link(msm_dp_display->ctrl);
> +	if (rc) {
> +		DRM_ERROR("Failed link training (rc=%d)\n", rc);
> +		drm_connector_set_link_status_property(dp->connector, DRM_LINK_STATUS_BAD);
> +	}
> +
>  	msm_dp_display_enable(msm_dp_display, force_link_train);
>  
>  	rc = msm_dp_display_post_enable(dp);
> 
> -- 
> 2.47.3
> 
> 

