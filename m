Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A940F151351
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2020 00:33:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726474AbgBCXdR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Feb 2020 18:33:17 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:36629 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727192AbgBCXdQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Feb 2020 18:33:16 -0500
Received: by mail-pj1-f65.google.com with SMTP id gv17so503591pjb.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Feb 2020 15:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=3aYiPA/gJeoBo48Ys9UapQ0Ubna55Q+Eek/KSnN7OTE=;
        b=qn+mnqQCcbYJ1bVCJ8S5wTj0A3XX0kEYmXBHZW3Kgk5qO4J5y//6RudPCe7dXAu7Ib
         hIhfJTwxvYvManjAqfpkaQD98RZLUOVNnKIDg+XAsu1sBG76SUtLqROV5wZ6zadciVIu
         qv+l47h4wY6J1pdEE0/MHCZNwdp78fVhVd6VFqbuvxnj6EFGR41fISlFiJ3ODoZygnsr
         1SMpiUb6uJvJAAgdqYakM+EBWXDsmTJNK7diOSh/ShytwskMDfdVkZEkNgDwQrD1m0WZ
         C85QhxfahubgbydPcrjyJATx6LkFSjpB4yCP8BPnCxnKR2bi6FTGWNGNXx+qYtruHpKq
         oRsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=3aYiPA/gJeoBo48Ys9UapQ0Ubna55Q+Eek/KSnN7OTE=;
        b=pIwKLjCxcFk/MP6mvul2vvL3IXgeMDBXAuRxYR8X3BvcvSEKnSw2zVCucljwcPGcna
         CftO1esnBju80ncSJHDgu0TvFXzFxIIiPvSXvm2m145OfgnwxJiMa8oDn3+TECyV6faM
         TVyyrQ7Ae4rNr9r17xcFHBLd40rt7LlJVRUczWIq8bNsVYfclKLZuat0SwYpcqKFdiay
         magvXayEBN90AS2vM8aDqDmZd7ra9EQWvk/t/x9YkEP99F3f05Bap3Esyg3EPeGOdfNF
         PTSCoUnFy92CTApcQCcnMIKFyX/uwKE7fisCOEg99p1rccdoG9M1wFzTvfw59ed2+xok
         rpRA==
X-Gm-Message-State: APjAAAXRmYgTglaHpopCaQul4BcuEyVnyU/Mb3Dwa2//bqkwHBtYGGA4
        VeZSv+xr2XWvgy5urASvT/+8Qk4dVtM=
X-Google-Smtp-Source: APXvYqyYv/3WZZoQ1fH4Z0rd/mToMYgxMof6syF+b8Indkq9ll0Hb4RbBOj0ZiJq6oVriYm0cFF+Vw==
X-Received: by 2002:a17:90a:b30b:: with SMTP id d11mr2003878pjr.22.1580772794291;
        Mon, 03 Feb 2020 15:33:14 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id q29sm9637390pgc.15.2020.02.03.15.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2020 15:33:13 -0800 (PST)
Date:   Mon, 3 Feb 2020 15:33:11 -0800
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
Subject: Re: [PATCH v3 3/9] drm/bridge: ti-sn65dsi86: Don't use MIPI
 variables for DP link
Message-ID: <20200203233311.GC311651@builder>
References: <20191218223530.253106-1-dianders@chromium.org>
 <20191218143416.v3.3.Ia6e05f4961adb0d4a0d32ba769dd7781ee8db431@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191218143416.v3.3.Ia6e05f4961adb0d4a0d32ba769dd7781ee8db431@changeid>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 18 Dec 14:35 PST 2019, Douglas Anderson wrote:

> The ti-sn65dsi86 is a bridge from MIPI to DP and thus has two links:
> the MIPI link and the DP link.  The two links do not need to have the
> same format or number of lanes.  Stop using MIPI variables when
> talking about the DP link.
> 
> This has zero functional change because:
> * currently we are hardcoding the MIPI link as unpacked RGB888 which
>   requires 24 bits and currently we are not changing the DP link rate
>   from the bridge's default of 8 bits per pixel.
> * currently we are hardcoding both the MIPI and DP as being 4 lanes.
> 
> This is all in prep for fixing some of the above.
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
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 7b596af265e4..ab644baaf90c 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -100,6 +100,7 @@ struct ti_sn_bridge {
>  	struct drm_panel		*panel;
>  	struct gpio_desc		*enable_gpio;
>  	struct regulator_bulk_data	supplies[SN_REGULATOR_SUPPLY_NUM];
> +	int				dp_lanes;
>  };
>  
>  static const struct regmap_range ti_sn_bridge_volatile_ranges[] = {
> @@ -313,6 +314,7 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge)
>  	}
>  
>  	/* TODO: setting to 4 lanes always for now */
> +	pdata->dp_lanes = 4;
>  	dsi->lanes = 4;
>  	dsi->format = MIPI_DSI_FMT_RGB888;
>  	dsi->mode_flags = MIPI_DSI_MODE_VIDEO;
> @@ -451,13 +453,17 @@ static void ti_sn_bridge_set_dp_rate(struct ti_sn_bridge *pdata)
>  	struct drm_display_mode *mode =
>  		&pdata->bridge.encoder->crtc->state->adjusted_mode;
>  
> -	/* set DSIA clk frequency */
> -	bit_rate_mhz = (mode->clock / 1000) *
> -			mipi_dsi_pixel_format_to_bpp(pdata->dsi->format);
> +	/*
> +	 * Calculate minimum bit rate based on our pixel clock.  At
> +	 * the moment this driver never sets the DP_18BPP_EN bit in
> +	 * register 0x5b so we hardcode 24bpp.
> +	 */
> +	bit_rate_mhz = (mode->clock / 1000) * 24;
>  
> -	/* set DP data rate */
> -	dp_rate_mhz = ((bit_rate_mhz / pdata->dsi->lanes) * DP_CLK_FUDGE_NUM) /
> +	/* Calculate minimum DP data rate, taking 80% as per DP spec */
> +	dp_rate_mhz = ((bit_rate_mhz / pdata->dp_lanes) * DP_CLK_FUDGE_NUM) /
>  							DP_CLK_FUDGE_DEN;
> +
>  	for (i = 1; i < ARRAY_SIZE(ti_sn_bridge_dp_rate_lut) - 1; i++)
>  		if (ti_sn_bridge_dp_rate_lut[i] > dp_rate_mhz)
>  			break;
> @@ -517,7 +523,7 @@ static void ti_sn_bridge_enable(struct drm_bridge *bridge)
>  			   CHA_DSI_LANES_MASK, val);
>  
>  	/* DP lane config */
> -	val = DP_NUM_LANES(pdata->dsi->lanes - 1);
> +	val = DP_NUM_LANES(pdata->dp_lanes - 1);
>  	regmap_update_bits(pdata->regmap, SN_SSC_CONFIG_REG, DP_NUM_LANES_MASK,
>  			   val);
>  
> -- 
> 2.24.1.735.g03f4e72817-goog
> 
