Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F24FE15135F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2020 00:39:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727177AbgBCXjH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Feb 2020 18:39:07 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:37899 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726984AbgBCXjH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Feb 2020 18:39:07 -0500
Received: by mail-pg1-f195.google.com with SMTP id a33so8689236pgm.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Feb 2020 15:39:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=yw2JA/6AXwF+6u8uNVr/YyXYYHJ8klG+TzKG0d9b16Q=;
        b=ue0DVmxjJvkuQVa0LhJ+216bR3UWp4VHUBpSBdIy6xpQBmjvSqkBYXi1YWlRNkl3jv
         Wo+YTkHsG/7aFVNT+Lkpqcqzd7En3WdUy/hpxXAVM4ZaXCwqdiaKulu7Hj0ieRF6xFoi
         n867VxVwHjui6lBCAs2clAbLG+8qHJtXOXrDCwfC/+s3WpwuPEF8ipKd8HodlVbz2qJo
         NbicofDd+5ti86vjkN9MY4jmo0/G/IBinNEouvxiCoJ81PArcUTZLMya5Ws9M9f1B+9z
         dZpe9EgERXKsKT7ptP5WnKcD2E2WVrVdVvltY44f0sZCxt8CwSzOz8MUHwhs8kzyQzbQ
         Mmhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=yw2JA/6AXwF+6u8uNVr/YyXYYHJ8klG+TzKG0d9b16Q=;
        b=hysrZLORNE6+2e9OJJHvhyB+94wRHrUzkdzZG3XYKShwQyJ/P5g+uWncgamo4mkNJx
         D0GDqe6vcDvIkicQ15FewvNcISkn0Ayy2h4t69uemIUyB4psAV9oeqtJpPnCDp3kZrBH
         F5KAT68ysTPfND46bDJ6dSXCDwGN8ODBQp3HB9DqU0jGHBkCzT6DRtpQ1V3eImRagBtu
         0jf+8xJjMf/KbLGEPSQOBBxQ0D1SjDTCO/CAYpgYE2e/9JpndsLaAPfp93HPSq5iOU2d
         xL/gX2STNxCSkj/X1klWwXM60YjzGQUAcHm25nfogZPtqVT9Q42tseSe72uVTnNaCI5O
         MMdA==
X-Gm-Message-State: APjAAAWk81h6W01Y22MyzaEzLvT3KA71jUW0yGNOq4yqv5rRcjuJFvzj
        2okThpjdHa0RlOepWpsDcn1AnA==
X-Google-Smtp-Source: APXvYqxOoFk3CyqcPGJfbhnecTv/NZMWeZNBLC2qjizan1SzjZNjXWy0WgOLL1Q4sNdufGFAOQs10w==
X-Received: by 2002:a62:e40e:: with SMTP id r14mr27073983pfh.115.1580773144397;
        Mon, 03 Feb 2020 15:39:04 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id z14sm20152891pgj.43.2020.02.03.15.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2020 15:39:03 -0800 (PST)
Date:   Mon, 3 Feb 2020 15:39:01 -0800
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
Subject: Re: [PATCH v3 7/9] drm/bridge: ti-sn65dsi86: Group DP link training
 bits in a function
Message-ID: <20200203233901.GG311651@builder>
References: <20191218223530.253106-1-dianders@chromium.org>
 <20191218143416.v3.7.I1fc75ad11db9048ef08cfe1ab7322753d9a219c7@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191218143416.v3.7.I1fc75ad11db9048ef08cfe1ab7322753d9a219c7@changeid>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 18 Dec 14:35 PST 2019, Douglas Anderson wrote:

> We'll re-organize the ti_sn_bridge_enable() function a bit to group
> together all the parts relating to link training and split them into a
> sub-function.  This is not intended to have any functional change and
> is in preparation for trying link training several times at different
> rates.  One small side effect here is that if link training fails
> we'll now leave the DP PLL disabled, but that seems like a sane thing
> to do.
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
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 86 ++++++++++++++++-----------
>  1 file changed, 52 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index d5990a0947b9..48fb4dc72e1c 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -530,6 +530,46 @@ static unsigned int ti_sn_get_max_lanes(struct ti_sn_bridge *pdata)
>  	return data & DP_LANE_COUNT_MASK;
>  }
>  
> +static int ti_sn_link_training(struct ti_sn_bridge *pdata)
> +{
> +	unsigned int val;
> +	int ret;
> +
> +	/* set dp clk frequency value */
> +	ti_sn_bridge_set_dp_rate(pdata);
> +
> +	/* enable DP PLL */
> +	regmap_write(pdata->regmap, SN_PLL_ENABLE_REG, 1);
> +
> +	ret = regmap_read_poll_timeout(pdata->regmap, SN_DPPLL_SRC_REG, val,
> +				       val & DPPLL_SRC_DP_PLL_LOCK, 1000,
> +				       50 * 1000);
> +	if (ret) {
> +		DRM_ERROR("DP_PLL_LOCK polling failed (%d)\n", ret);
> +		goto exit;
> +	}
> +
> +	/* Semi auto link training mode */
> +	regmap_write(pdata->regmap, SN_ML_TX_MODE_REG, 0x0A);
> +	ret = regmap_read_poll_timeout(pdata->regmap, SN_ML_TX_MODE_REG, val,
> +				       val == ML_TX_MAIN_LINK_OFF ||
> +				       val == ML_TX_NORMAL_MODE, 1000,
> +				       500 * 1000);
> +	if (ret) {
> +		DRM_ERROR("Training complete polling failed (%d)\n", ret);
> +	} else if (val == ML_TX_MAIN_LINK_OFF) {
> +		DRM_ERROR("Link training failed, link is off\n");
> +		ret = -EIO;
> +	}
> +
> +exit:
> +	/* Disable the PLL if we failed */
> +	if (ret)
> +		regmap_write(pdata->regmap, SN_PLL_ENABLE_REG, 0);
> +
> +	return ret;
> +}
> +
>  static void ti_sn_bridge_enable(struct drm_bridge *bridge)
>  {
>  	struct ti_sn_bridge *pdata = bridge_to_ti_sn_bridge(bridge);
> @@ -555,29 +595,8 @@ static void ti_sn_bridge_enable(struct drm_bridge *bridge)
>  	regmap_update_bits(pdata->regmap, SN_DSI_LANES_REG,
>  			   CHA_DSI_LANES_MASK, val);
>  
> -	/* Set the DP output format (18 bpp or 24 bpp) */
> -	val = (ti_sn_bridge_get_bpp(pdata) == 18) ? BPP_18_RGB : 0;
> -	regmap_update_bits(pdata->regmap, SN_DATA_FORMAT_REG, BPP_18_RGB, val);
> -
> -	/* DP lane config */
> -	val = DP_NUM_LANES(min(pdata->dp_lanes, 3));
> -	regmap_update_bits(pdata->regmap, SN_SSC_CONFIG_REG, DP_NUM_LANES_MASK,
> -			   val);
> -
> -	/* set dsi/dp clk frequency value */
> +	/* set dsi clk frequency value */
>  	ti_sn_bridge_set_dsi_rate(pdata);
> -	ti_sn_bridge_set_dp_rate(pdata);
> -
> -	/* enable DP PLL */
> -	regmap_write(pdata->regmap, SN_PLL_ENABLE_REG, 1);
> -
> -	ret = regmap_read_poll_timeout(pdata->regmap, SN_DPPLL_SRC_REG, val,
> -				       val & DPPLL_SRC_DP_PLL_LOCK, 1000,
> -				       50 * 1000);
> -	if (ret) {
> -		DRM_ERROR("DP_PLL_LOCK polling failed (%d)\n", ret);
> -		return;
> -	}
>  
>  	/**
>  	 * The SN65DSI86 only supports ASSR Display Authentication method and
> @@ -588,19 +607,18 @@ static void ti_sn_bridge_enable(struct drm_bridge *bridge)
>  	drm_dp_dpcd_writeb(&pdata->aux, DP_EDP_CONFIGURATION_SET,
>  			   DP_ALTERNATE_SCRAMBLER_RESET_ENABLE);
>  
> -	/* Semi auto link training mode */
> -	regmap_write(pdata->regmap, SN_ML_TX_MODE_REG, 0x0A);
> -	ret = regmap_read_poll_timeout(pdata->regmap, SN_ML_TX_MODE_REG, val,
> -				       val == ML_TX_MAIN_LINK_OFF ||
> -				       val == ML_TX_NORMAL_MODE, 1000,
> -				       500 * 1000);
> -	if (ret) {
> -		DRM_ERROR("Training complete polling failed (%d)\n", ret);
> -		return;
> -	} else if (val == ML_TX_MAIN_LINK_OFF) {
> -		DRM_ERROR("Link training failed, link is off\n");
> +	/* Set the DP output format (18 bpp or 24 bpp) */
> +	val = (ti_sn_bridge_get_bpp(pdata) == 18) ? BPP_18_RGB : 0;
> +	regmap_update_bits(pdata->regmap, SN_DATA_FORMAT_REG, BPP_18_RGB, val);
> +
> +	/* DP lane config */
> +	val = DP_NUM_LANES(min(pdata->dp_lanes, 3));
> +	regmap_update_bits(pdata->regmap, SN_SSC_CONFIG_REG, DP_NUM_LANES_MASK,
> +			   val);
> +
> +	ret = ti_sn_link_training(pdata);
> +	if (ret)
>  		return;
> -	}
>  
>  	/* config video parameters */
>  	ti_sn_bridge_set_video_timings(pdata);
> -- 
> 2.24.1.735.g03f4e72817-goog
> 
