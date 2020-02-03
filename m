Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D54D151355
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2020 00:35:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726994AbgBCXfU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Feb 2020 18:35:20 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:33495 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726369AbgBCXfU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Feb 2020 18:35:20 -0500
Received: by mail-pf1-f195.google.com with SMTP id n7so8458879pfn.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Feb 2020 15:35:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Npi7Na9ZPRN7+svZB6NYN9WZnYpab1FvMeQ9pCjz/HE=;
        b=N0C80xaK/OJsbuV6SjR0p8b3Mv91XsNZUzj9ek3PCmCLhKmXuUxSNDkV2E57T0Be0i
         avC4vHvFsTDwgC7mzXMfnI3SJjhu3vH1f2ReGd2dRAMhdVWs+oJ96W0x8KEoYOy1ETVh
         X8wOO6qJLTPoDxEA4VqEzbR7428zx3zV8EMaTbj185dQNa3csUUG0EElHu8XxehY0pbX
         3tDL3dsvbkQHdz6XkSyxhqjlOviyHJiztlYNhQQOQA8QLNUW7yKerZCOjC7aiu8k51va
         qYHtdnuSarhFSkCptHSAMoxRkzOm0BElrkKMgK4kigJUym2l9s6cBwjxA+EUHPc3NSHb
         v57w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Npi7Na9ZPRN7+svZB6NYN9WZnYpab1FvMeQ9pCjz/HE=;
        b=CGzxx8oSkCl0b+M8CuO6+PaqSDcIrnUDQY6Vf8fBcyJcIzHlsJPr1Ig9/ugsqt+H1J
         C2EwfpH0asf4YYg0ci2lRzFiUDOvTEwwbwDrybet8sF2o8VLaxOiXFIPeCb0fmUppqo0
         s+BGiHSyyseMpZaL7LzxKTvtG7m/1cNFai89Rji5CLcGGZQcpFOj1B07oZCZEaqXiK3J
         Kvqx/I0UOlbqtsi8ohrXEMGW3e5MMy7UhYiT0G3DrnaP//QwOJUJhuCm8n7IjazOlST/
         EcPS8l9ncdNTtBfsx7RdOo1Hiorw0/FPc0JWt4PpBaYL92tX1TvwJ6VPmk8so1njjSUA
         BcZQ==
X-Gm-Message-State: APjAAAU5RlCzMRwP9JwjS/jalsRPIsi81eiFnHvV5FiJgqCtfEYGd0XD
        6/dCyp0wP9zF5H/C1LvMIUVV/Q==
X-Google-Smtp-Source: APXvYqwnZyv8Ev0iKfoX+uq0HNaOMlQj8lJY/h/9sXmZdFNEUKT4GIJnuZ7hzqnGOzG8ZXdEyqaTYA==
X-Received: by 2002:aa7:8f3d:: with SMTP id y29mr28254568pfr.183.1580772919806;
        Mon, 03 Feb 2020 15:35:19 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id h3sm9379345pfo.102.2020.02.03.15.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2020 15:35:19 -0800 (PST)
Date:   Mon, 3 Feb 2020 15:35:17 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        robdclark@chromium.org, linux-arm-msm@vger.kernel.org,
        seanpaul@chromium.org, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>,
        Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v3 5/9] drm/bridge: ti-sn65dsi86: Read num lanes from the
 DP sink
Message-ID: <20200203233517.GE311651@builder>
References: <20191218223530.253106-1-dianders@chromium.org>
 <20191218143416.v3.5.Idbd0051d0de53f7e9d18a291ea33011c0854fcc6@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191218143416.v3.5.Idbd0051d0de53f7e9d18a291ea33011c0854fcc6@changeid>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 18 Dec 14:35 PST 2019, Douglas Anderson wrote:

> At least one panel hooked up to the bridge (AUO B116XAK01) only
> supports 1 lane of DP.  Let's read this information and stop
> hardcoding 4 DP lanes.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Tested-by: Rob Clark <robdclark@gmail.com>
> Reviewed-by: Rob Clark <robdclark@gmail.com>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
> 
> Changes in v3: None
> Changes in v2: None
> 
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 32 +++++++++++++++++++++++++--
>  1 file changed, 30 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index d55d19759796..0fc9e97b2d98 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -313,8 +313,7 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge)
>  		goto err_dsi_host;
>  	}
>  
> -	/* TODO: setting to 4 lanes always for now */
> -	pdata->dp_lanes = 4;
> +	/* TODO: setting to 4 MIPI lanes always for now */
>  	dsi->lanes = 4;
>  	dsi->format = MIPI_DSI_FMT_RGB888;
>  	dsi->mode_flags = MIPI_DSI_MODE_VIDEO;
> @@ -511,12 +510,41 @@ static void ti_sn_bridge_set_video_timings(struct ti_sn_bridge *pdata)
>  	usleep_range(10000, 10500); /* 10ms delay recommended by spec */
>  }
>  
> +static unsigned int ti_sn_get_max_lanes(struct ti_sn_bridge *pdata)
> +{
> +	u8 data;
> +	int ret;
> +
> +	ret = drm_dp_dpcd_readb(&pdata->aux, DP_MAX_LANE_COUNT, &data);
> +	if (ret != 1) {
> +		DRM_DEV_ERROR(pdata->dev,
> +			      "Can't read lane count (%d); assuming 4\n", ret);
> +		return 4;
> +	}
> +
> +	return data & DP_LANE_COUNT_MASK;
> +}
> +
>  static void ti_sn_bridge_enable(struct drm_bridge *bridge)
>  {
>  	struct ti_sn_bridge *pdata = bridge_to_ti_sn_bridge(bridge);
>  	unsigned int val;
>  	int ret;
>  
> +	/*
> +	 * Run with the maximum number of lanes that the DP sink supports.
> +	 *
> +	 * Depending use cases, we might want to revisit this later because:
> +	 * - It's plausible that someone may have run fewer lines to the
> +	 *   sink than the sink actually supports, assuming that the lines
> +	 *   will just be driven at a higher rate.
> +	 * - The DP spec seems to indicate that it's more important to minimize
> +	 *   the number of lanes than the link rate.
> +	 *
> +	 * If we do revisit, it would be important to measure the power impact.
> +	 */
> +	pdata->dp_lanes = ti_sn_get_max_lanes(pdata);
> +
>  	/* DSI_A lane config */
>  	val = CHA_DSI_LANES(4 - pdata->dsi->lanes);
>  	regmap_update_bits(pdata->regmap, SN_DSI_LANES_REG,
> -- 
> 2.24.1.735.g03f4e72817-goog
> 
