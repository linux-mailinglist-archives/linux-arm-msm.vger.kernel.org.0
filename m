Return-Path: <linux-arm-msm+bounces-89240-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BD163D25BA5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 17:25:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8C2E53014D00
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 16:25:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC95E3B95FB;
	Thu, 15 Jan 2026 16:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lZfPacfd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F173B95E9;
	Thu, 15 Jan 2026 16:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768494311; cv=none; b=qQp+ZjEoMICC5f68HZia7e0wUUye5eRp5gWVjELcleMQM/W5nEjvESuhCREdHo/XX5/syNFy64zUs40EtssforUGEVHuzidfOJtug3eb496B3k31dKZXPZ3kXtvbgPJmo/9cE29Q8weZ3PIxpjzMKQwGS1GcBDfZA5CMiQLvpAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768494311; c=relaxed/simple;
	bh=2sSRAaTFOgRgS4+tmbzaE3avIKXUqFtJaekZE4cwgQg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JkkznKcLVWdaMYENdXJYMru2MdtlACgDbz17jp3AhzErEMQ7rPedfNcdr8GoGZ6TjCzfML51BFChdMgwQOHHFkqvj7Hs0++oN9st1eJE8nL9fvD4n0xr08GJBiQHDY1DZvwRrBxbWivjdzLhbdXbOQ9mH1cMXlpGx/c9lS6PvCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lZfPacfd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B517C2BC9E;
	Thu, 15 Jan 2026 16:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768494309;
	bh=2sSRAaTFOgRgS4+tmbzaE3avIKXUqFtJaekZE4cwgQg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lZfPacfdunR/Fsc4pbHMBdWTj3l+K7tXDDidsbNpSooAuEx70jXV0xu1fglGMnjSi
	 yf9CKphqmj1c7ipqaZ6vBVBYsRz7jNa3aqzc27dhx+AzX1sXJiBYnM8gml/jB1HMfO
	 rWr9prpd6R6CLavC0ZkcfveCjJeRsxwyq1xKXhXrqPNDN0H+TtutjOulqhELlkyDVq
	 4plL1225EobauqH63G0XrkhVXwzN6jN+AsFw/VT3YKZWxbwsEJ9SS51h64iH5yFnTi
	 mDxVtqd+V3t0TaSSLA1CUYBNCajd3ezolmpWghz6EOFqmsD3HtbMz5sRShs/TqQYNy
	 YM08HvKrBim4Q==
Date: Thu, 15 Jan 2026 10:25:06 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Subject: Re: [PATCH v3 8/8] drm/msm/dp: Add sink_count and link_ready to
 debug logs
Message-ID: <fqrjg2bcuyk6wtinui6lixsm4w24uqy5srlfxdx2lvkipnixsk@x4kcipaucugb>
References: <20260115-hpd-refactor-v3-0-08e2f3bcd2e0@oss.qualcomm.com>
 <20260115-hpd-refactor-v3-8-08e2f3bcd2e0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115-hpd-refactor-v3-8-08e2f3bcd2e0@oss.qualcomm.com>

On Thu, Jan 15, 2026 at 09:29:13AM +0200, Dmitry Baryshkov wrote:
> From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> 
> Add sink count and link_ready to the debug logs for [un]plug and HPD IRQ
> handling.
> 

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 36 ++++++++++++++++++++++++------------
>  1 file changed, 24 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index b26fba89e73a..67a193f58ce2 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -388,8 +388,10 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp)
>  	int ret;
>  	struct platform_device *pdev = dp->msm_dp_display.pdev;
>  
> -	drm_dbg_dp(dp->drm_dev, "Before, type=%d\n",
> -			dp->msm_dp_display.connector_type);
> +	drm_dbg_dp(dp->drm_dev, "Before, type=%d sink_count=%d, link_ready=%d\n",
> +			dp->msm_dp_display.connector_type,
> +			dp->link->sink_count,
> +			dp->msm_dp_display.link_ready);
>  
>  	if (dp->msm_dp_display.link_ready)
>  		return 0;
> @@ -411,8 +413,10 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp)
>  		pm_runtime_put_sync(&pdev->dev);
>  	}
>  
> -	drm_dbg_dp(dp->drm_dev, "After, type=%d\n",
> -			dp->msm_dp_display.connector_type);
> +	drm_dbg_dp(dp->drm_dev, "After, type=%d sink_count=%d, link_ready=%d\n",
> +			dp->msm_dp_display.connector_type,
> +			dp->link->sink_count,
> +			dp->msm_dp_display.link_ready);
>  
>  	/* uevent will complete connection part */
>  	return 0;
> @@ -440,8 +444,10 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp)
>  
>  	msm_dp_aux_enable_xfers(dp->aux, false);
>  
> -	drm_dbg_dp(dp->drm_dev, "Before, type=%d\n",
> -			dp->msm_dp_display.connector_type);
> +	drm_dbg_dp(dp->drm_dev, "Before, type=%d sink_count=%d, link_ready=%d\n",
> +			dp->msm_dp_display.connector_type,
> +			dp->link->sink_count,
> +			dp->msm_dp_display.link_ready);
>  
>  	if (!dp->msm_dp_display.link_ready)
>  		return 0;
> @@ -465,8 +471,10 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp)
>  	/* signal the disconnect event early to ensure proper teardown */
>  	msm_dp_display_handle_plugged_change(&dp->msm_dp_display, false);
>  
> -	drm_dbg_dp(dp->drm_dev, "After, type=%d\n",
> -			dp->msm_dp_display.connector_type);
> +	drm_dbg_dp(dp->drm_dev, "After, type=%d, sink_count=%d, link_ready=%d\n",
> +			dp->msm_dp_display.connector_type,
> +			dp->link->sink_count,
> +			dp->msm_dp_display.link_ready);
>  
>  	/* uevent will complete disconnection part */
>  	pm_runtime_put_sync(&pdev->dev);
> @@ -479,8 +487,10 @@ static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp)
>  	int rc = 0;
>  
>  	/* irq_hpd can happen at either connected or disconnected state */
> -	drm_dbg_dp(dp->drm_dev, "Before, type=%d\n",
> -			dp->msm_dp_display.connector_type);
> +	drm_dbg_dp(dp->drm_dev, "Before, type=%d, sink_count=%d, link_ready=%d\n",
> +			dp->msm_dp_display.connector_type,
> +			dp->link->sink_count,
> +			dp->msm_dp_display.link_ready);
>  
>  	/* check for any test request issued by sink */
>  	rc = msm_dp_link_process_request(dp->link);
> @@ -493,8 +503,10 @@ static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp)
>  			rc = msm_dp_display_handle_irq_hpd(dp);
>  	}
>  
> -	drm_dbg_dp(dp->drm_dev, "After, type=%d\n",
> -			dp->msm_dp_display.connector_type);
> +	drm_dbg_dp(dp->drm_dev, "After, type=%d, sink_count=%d, link_ready=%d\n",
> +			dp->msm_dp_display.connector_type,
> +			dp->link->sink_count,
> +			dp->msm_dp_display.link_ready);
>  
>  	return rc;
>  }
> 
> -- 
> 2.47.3
> 
> 

