Return-Path: <linux-arm-msm+bounces-89236-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A9733D25791
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 16:47:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 90C48301C949
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 15:42:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 394F236D4F5;
	Thu, 15 Jan 2026 15:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lxMLZ+sM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15A542D7DF8;
	Thu, 15 Jan 2026 15:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768491778; cv=none; b=f1HzSlR6moLYvmLjY5KgG/odS0G+eEf+9IdlumQfxyyGVMHa/cxKhGDYfKK9EDCSTT9/UTTKBogoyiu+3EI9ieJqVPE4RwILrFkxVPwFrrPhGaxSXfCkx3dt5LkIoDVcK3g/2KxTEuTR39fy/NkEYV58ULvz7lTGb2iDQRUo7UE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768491778; c=relaxed/simple;
	bh=Vvu0/TPmWVy6yatxjIes5gxfTU9U/IRZqj1fb8T9FCs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=unwU+PuKkcj4VG8+aGvGdGLVZe+ssnqMAXw1Hw6B6t/ckdl4WANHFPFI0k76j7Bql5yrJhuwgF8f2sFg+AgjFzEWHb/36drCZ7BBk51u0zaEz2fgrCo2jwlJ2ht4zZj1VI0HX121MT8reQ6OLWmRCxgDSS1s481k2CqWAmz4Rmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lxMLZ+sM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD181C116D0;
	Thu, 15 Jan 2026 15:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768491777;
	bh=Vvu0/TPmWVy6yatxjIes5gxfTU9U/IRZqj1fb8T9FCs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lxMLZ+sMFx9z01Wj67Yk/ayjOT+zk9ITI70cCjFSNr8XYvNNWuYN0tYmPfaOHQGD1
	 qyfEfkQ+MzFOqTHr0s0u69COb4lujVHOzdXSSJxTBWi+PlkoohpaKAdgxvMr9KG112
	 Z4Rif6zXRfy0PPVFJuTaqAnRbNxaZ+NRxPViZXfWwPz2uo1vEmN+50qS1m+6g0hitG
	 xI7w2YBz8ZutpXjm/l8/J59EMhl2c7YDSGQUWXiZftbBbS+w2rM9Jn4i8UuKn66m8J
	 lMsDoaQpUJGGQ0GmhVsDs3tctWeCxEMxj3en/rdgSTLbKWQ1vNaB6cdNkjOqlD/mNe
	 owzYmF4QF1a7g==
Date: Thu, 15 Jan 2026 09:42:54 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Subject: Re: [PATCH v3 5/8] drm/msm/dp: Drop EV_USER_NOTIFICATION
Message-ID: <ztriduhwhimeztfdgijai2qeii2giaosb6qizhj4skxg6k5uq4@bi6vomgv3whj>
References: <20260115-hpd-refactor-v3-0-08e2f3bcd2e0@oss.qualcomm.com>
 <20260115-hpd-refactor-v3-5-08e2f3bcd2e0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115-hpd-refactor-v3-5-08e2f3bcd2e0@oss.qualcomm.com>

On Thu, Jan 15, 2026 at 09:29:10AM +0200, Dmitry Baryshkov wrote:
> From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> 
> Currently, we queue an event for signalling HPD connect/disconnect. This
> can mean a delay in plug/unplug handling and notifying DRM core when a
> hotplug happens.
> 
> Drop EV_USER_NOTIFICATION and signal the IRQ event as part of hotplug
> handling.
> 
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 28 ++++++++--------------------
>  drivers/gpu/drm/msm/dp/dp_display.h |  1 +
>  drivers/gpu/drm/msm/dp/dp_drm.c     |  2 ++
>  3 files changed, 11 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 3184066adb15..e0b424ac861a 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -58,7 +58,6 @@ enum {
>  	EV_HPD_PLUG_INT,
>  	EV_IRQ_HPD_INT,
>  	EV_HPD_UNPLUG_INT,
> -	EV_USER_NOTIFICATION,
>  };
>  
>  #define EVENT_TIMEOUT	(HZ/10)	/* 100ms */
> @@ -343,17 +342,6 @@ static const struct component_ops msm_dp_display_comp_ops = {
>  	.unbind = msm_dp_display_unbind,
>  };
>  
> -static void msm_dp_display_send_hpd_event(struct msm_dp *msm_dp_display)
> -{
> -	struct msm_dp_display_private *dp;
> -	struct drm_connector *connector;
> -
> -	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
> -
> -	connector = dp->msm_dp_display.connector;
> -	drm_helper_hpd_irq_event(connector->dev);
> -}
> -
>  static int msm_dp_display_send_hpd_notification(struct msm_dp_display_private *dp,
>  					    bool hpd)
>  {
> @@ -377,7 +365,11 @@ static int msm_dp_display_send_hpd_notification(struct msm_dp_display_private *d
>  
>  	drm_dbg_dp(dp->drm_dev, "type=%d hpd=%d\n",
>  			dp->msm_dp_display.connector_type, hpd);
> -	msm_dp_display_send_hpd_event(&dp->msm_dp_display);
> +
> +	drm_bridge_hpd_notify(dp->msm_dp_display.bridge,
> +			      hpd ?
> +			      connector_status_connected :
> +			      connector_status_disconnected);

Last time we tried this, we where out of sync with the link_ready in
detect. So, I'm still wondering about that if (!link_ready) return
disconnected; in the detect function.

With a reliable detect method, this looks good though.

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

>  
>  	return 0;
>  }
> @@ -437,7 +429,7 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
>  
>  	msm_dp_link_reset_phy_params_vx_px(dp->link);
>  
> -	msm_dp_add_event(dp, EV_USER_NOTIFICATION, true, 0);
> +	msm_dp_display_send_hpd_notification(dp, true);
>  
>  end:
>  	return rc;
> @@ -506,7 +498,7 @@ static int msm_dp_display_notify_disconnect(struct device *dev)
>  {
>  	struct msm_dp_display_private *dp = dev_get_dp_display_private(dev);
>  
> -	msm_dp_add_event(dp, EV_USER_NOTIFICATION, false, 0);
> +	msm_dp_display_send_hpd_notification(dp, false);
>  
>  	return 0;
>  }
> @@ -527,7 +519,7 @@ static int msm_dp_display_handle_port_status_changed(struct msm_dp_display_priva
>  		drm_dbg_dp(dp->drm_dev, "sink count is zero, nothing to do\n");
>  		if (dp->hpd_state != ST_DISCONNECTED) {
>  			dp->hpd_state = ST_DISCONNECT_PENDING;
> -			msm_dp_add_event(dp, EV_USER_NOTIFICATION, false, 0);
> +			msm_dp_display_send_hpd_notification(dp, false);
>  		}
>  	} else {
>  		if (dp->hpd_state == ST_DISCONNECTED) {
> @@ -1121,10 +1113,6 @@ static int hpd_event_thread(void *data)
>  		case EV_IRQ_HPD_INT:
>  			msm_dp_irq_hpd_handle(msm_dp_priv, todo->data);
>  			break;
> -		case EV_USER_NOTIFICATION:
> -			msm_dp_display_send_hpd_notification(msm_dp_priv,
> -						todo->data);
> -			break;
>  		default:
>  			break;
>  		}
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
> index cc6e2cab36e9..60094061c102 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.h
> +++ b/drivers/gpu/drm/msm/dp/dp_display.h
> @@ -16,6 +16,7 @@ struct msm_dp {
>  	struct platform_device *pdev;
>  	struct drm_connector *connector;
>  	struct drm_bridge *next_bridge;
> +	struct drm_bridge *bridge;
>  	bool link_ready;
>  	bool audio_enabled;
>  	bool power_on;
> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
> index e4622c85fb66..f935093c4df4 100644
> --- a/drivers/gpu/drm/msm/dp/dp_drm.c
> +++ b/drivers/gpu/drm/msm/dp/dp_drm.c
> @@ -340,6 +340,8 @@ int msm_dp_bridge_init(struct msm_dp *msm_dp_display, struct drm_device *dev,
>  		}
>  	}
>  
> +	msm_dp_display->bridge = bridge;
> +
>  	return 0;
>  }
>  
> 
> -- 
> 2.47.3
> 
> 

