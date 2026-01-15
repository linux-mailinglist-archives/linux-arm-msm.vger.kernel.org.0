Return-Path: <linux-arm-msm+bounces-89229-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D781D25215
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 16:01:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8049C304A577
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 14:57:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6800735C1BA;
	Thu, 15 Jan 2026 14:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HdohdZiW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3646B34DB4C;
	Thu, 15 Jan 2026 14:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768489047; cv=none; b=c8+YCan1c65fY7p5Yp9lLmL1wi2noJFYonOQQ3AvvDv13ghkD+dSk4YBqdzpZAzWSBvae7V/06Ust9fPRXNziTnQINAvhheLh0c8LWN/jF/QxXoV1I+BX5EZc15XQGcz8jfcSSBmbsFpfY4DvP3sESmGz5WIswWiqZdD5wFDbZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768489047; c=relaxed/simple;
	bh=RN5nqWzMwmk5vcj24tq3c6ou+TS9jaUJHpO5HZ+M3G0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SEZPmrzkXXKDaez8J8s3pWK35I+SWJq7WVV2xSxXL+IX+DFJgypIMLwp4qh5c0L3T+h/XSDLAmpXtdc7qdobSePlRz4SkCtdlpb5AWLgIxfZJx4uf4uPHIaZrBoyZVF0EMsnDXkzvhWAD6HbPLqLpNWFjdt5gQS+rbTXXavdPJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HdohdZiW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 098D5C16AAE;
	Thu, 15 Jan 2026 14:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768489047;
	bh=RN5nqWzMwmk5vcj24tq3c6ou+TS9jaUJHpO5HZ+M3G0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HdohdZiWIccNHWVtm6+LqON64wbEFuxZat0QrvaUeSQiCkILve7HxlgFoCjFA172o
	 ynihfwM04HHsHAv0btjOMEnGTaEmeQfw2SOsdFDrwIMMyz9F3sdGOeMxdnt2Nvsqgc
	 cFr2w4Q6dSyaylLaHaG87iji4Q7W1MgVENSD3ORc82wZN4aOyL0nkt7q6fJZFBTatm
	 vi3zZYQIzlQ+gR3xjt5iiKGkMpce0vsIvK6soKgXqXf+rstd5559Tdo1l3jymm872p
	 LH7NpAdsu3ovmaLN2eSNyMr4xQQWhT5mfrvcOtl7de2yc7Anzj0ZDiGzWQ5JylY1vp
	 iHgFB1hTODa3g==
Date: Thu, 15 Jan 2026 08:57:24 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Subject: Re: [PATCH v3 3/8] drm/msm/dp: Read DPCD and sink count in bridge
 detect()
Message-ID: <ti4tccx5dnupiv5ppglvcg7xmn2twvdjv5fktupgnqp56we4u5@jsd7mdrbhbwj>
References: <20260115-hpd-refactor-v3-0-08e2f3bcd2e0@oss.qualcomm.com>
 <20260115-hpd-refactor-v3-3-08e2f3bcd2e0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115-hpd-refactor-v3-3-08e2f3bcd2e0@oss.qualcomm.com>

On Thu, Jan 15, 2026 at 09:29:08AM +0200, Dmitry Baryshkov wrote:
> From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> 
> Instead of relying on the link_ready flag to specify if DP is connected,
> read the DPCD bits and get the sink count to accurately detect if DP is
> connected.

This makes it sounds like the two options are equal, but they most
definitely aren't.

I think this commit message should capture the fact that "link_ready"
not only says that the cable is connected, but that we've managed to
bring up the main link - which is a source of race conditions in the hot
plug detection logic, as well as making it impossible to move link
management to the enable/disable calls.

> 
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 60 +++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_drm.c     | 20 -------------
>  drivers/gpu/drm/msm/dp/dp_drm.h     |  2 ++
>  3 files changed, 62 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 5997cd28ba11..a05144de3b93 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1151,6 +1151,66 @@ static int msm_dp_hpd_event_thread_start(struct msm_dp_display_private *msm_dp_p
>  	return 0;
>  }
>  
> +/**
> + * msm_dp_bridge_detect - callback to determine if connector is connected
> + * @bridge: Pointer to drm bridge structure
> + * @connector: Pointer to drm connector structure
> + * Returns: Bridge's 'is connected' status

Could you please rewrite the return definition, to capture what the
value really refers to.

> + */
> +enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge,
> +					       struct drm_connector *connector)
> +{
> +	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(bridge);
> +	struct msm_dp *dp = msm_dp_bridge->msm_dp_display;
> +	struct msm_dp_display_private *priv;
> +	int ret = 0;

First usage is an assignment, so no need for the zero-initialization.

> +	int status = connector_status_disconnected;
> +	u8 dpcd[DP_RECEIVER_CAP_SIZE];
> +	struct drm_dp_desc desc;
> +
> +	dp = to_dp_bridge(bridge)->msm_dp_display;
> +
> +	priv = container_of(dp, struct msm_dp_display_private, msm_dp_display);
> +
> +	if (!dp->link_ready)
> +		return status;

So despite the commit message, we're still relying on the link_ready
flag? (With the improvement that even if the code thinks we've trained
the link, we can still determine that we should report it as
disconnected)

Perhaps I'm missing something here? Did we change the meaning of
"link_ready"?


Other than this part, this looks quite familiar to my experiments. Very
happy to see you continue this work!!!

Regards,
Bjorn

> +
> +	msm_dp_aux_enable_xfers(priv->aux, true);
> +
> +	ret = pm_runtime_resume_and_get(&dp->pdev->dev);
> +	if (ret) {
> +		DRM_ERROR("failed to pm_runtime_resume\n");
> +		msm_dp_aux_enable_xfers(priv->aux, false);
> +		return status;
> +	}
> +
> +	ret = msm_dp_aux_is_link_connected(priv->aux);
> +	if (dp->internal_hpd && !ret)
> +		goto end;
> +
> +	ret = drm_dp_read_dpcd_caps(priv->aux, dpcd);
> +	if (ret)
> +		goto end;
> +
> +	ret = drm_dp_read_desc(priv->aux, &desc, drm_dp_is_branch(dpcd));
> +	if (ret)
> +		goto end;
> +
> +	status = connector_status_connected;
> +	if (drm_dp_read_sink_count_cap(connector, dpcd, &desc)) {
> +		int sink_count = drm_dp_read_sink_count(priv->aux);
> +
> +		drm_dbg_dp(dp->drm_dev, "sink_count = %d\n", sink_count);
> +
> +		if (sink_count <= 0)
> +			status = connector_status_disconnected;
> +	}
> +
> +end:
> +	pm_runtime_put_sync(&dp->pdev->dev);
> +	return status;
> +}
> +
>  static irqreturn_t msm_dp_display_irq_handler(int irq, void *dev_id)
>  {
>  	struct msm_dp_display_private *dp = dev_id;
> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
> index fd6443d2b6ce..e4622c85fb66 100644
> --- a/drivers/gpu/drm/msm/dp/dp_drm.c
> +++ b/drivers/gpu/drm/msm/dp/dp_drm.c
> @@ -15,26 +15,6 @@
>  #include "dp_audio.h"
>  #include "dp_drm.h"
>  
> -/**
> - * msm_dp_bridge_detect - callback to determine if connector is connected
> - * @bridge: Pointer to drm bridge structure
> - * @connector: Pointer to drm connector structure
> - * Returns: Bridge's 'is connected' status
> - */
> -static enum drm_connector_status
> -msm_dp_bridge_detect(struct drm_bridge *bridge, struct drm_connector *connector)
> -{
> -	struct msm_dp *dp;
> -
> -	dp = to_dp_bridge(bridge)->msm_dp_display;
> -
> -	drm_dbg_dp(dp->drm_dev, "link_ready = %s\n",
> -		str_true_false(dp->link_ready));
> -
> -	return (dp->link_ready) ? connector_status_connected :
> -					connector_status_disconnected;
> -}
> -
>  static int msm_dp_bridge_atomic_check(struct drm_bridge *bridge,
>  			    struct drm_bridge_state *bridge_state,
>  			    struct drm_crtc_state *crtc_state,
> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.h b/drivers/gpu/drm/msm/dp/dp_drm.h
> index 9eb3431dd93a..6c0426803d78 100644
> --- a/drivers/gpu/drm/msm/dp/dp_drm.h
> +++ b/drivers/gpu/drm/msm/dp/dp_drm.h
> @@ -25,6 +25,8 @@ int msm_dp_bridge_init(struct msm_dp *msm_dp_display, struct drm_device *dev,
>  		   struct drm_encoder *encoder,
>  		   bool yuv_supported);
>  
> +enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge,
> +					       struct drm_connector *connector);
>  void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
>  				 struct drm_atomic_state *state);
>  void msm_dp_bridge_atomic_disable(struct drm_bridge *drm_bridge,
> 
> -- 
> 2.47.3
> 
> 

