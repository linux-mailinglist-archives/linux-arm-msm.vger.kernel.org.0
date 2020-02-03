Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 72A8C151338
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2020 00:31:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726331AbgBCXbo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Feb 2020 18:31:44 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:38455 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726287AbgBCXbo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Feb 2020 18:31:44 -0500
Received: by mail-pg1-f194.google.com with SMTP id a33so8681477pgm.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Feb 2020 15:31:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=XGNxCxtoGDp+8cXtqCNq+umjrj7BBwnr/1CarpNQDow=;
        b=Zf4BLBA33ovQTs19yyX6WoAUz8Zzi5NHrDyFtSRCEdaayqM1QIHAMeKBKdVu0zrOXq
         KnrsACkNHOl7zushehwUJ5H8+RYQpP0PpBZ/ieM61RhlNMZuzQRlnWZLJMcJj7BabDq5
         iNKAuTtqGwnSBcvmGAkIbyKMP3snJQAwnqzKlQ/3SsK0kcA9n3nSHC5F2klihcWk2j5q
         Jb3wGG1CcJVnP1nuv3Kn7xF54yrSTJc8ceuwTNYEP8eRCvP9OP+10TZKUeV96hc7Op9+
         DhDt0we2rYE0t+hXRF3YKUtbQi8ZupPG30e+jGMJ33SovSUXMtzRvEK0E14Ekxsjzb+i
         P8Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=XGNxCxtoGDp+8cXtqCNq+umjrj7BBwnr/1CarpNQDow=;
        b=Xiz14OCt9+gjWqerPGXzmHdEuiFj2Z1wYNfGRy4la5w7rdnlzClYRjOn/87NGOjzaU
         za+xWGDR/xFZe6vQ1Q0vb8eNFl56zDUjUQmIfF1iTO9F1CgtBFyA72VA6ZGUlgicFeWq
         Evwz0dii78oIJRhnvbPjDoA334R2k7WDjO7sk5+VROhrQsthiAnuGAFH1B90oLaeI4DF
         H1O3T6GgtdyDLem6dY8jDEwEU3ULus0vzjZOrLXIFmv94R7R2+eDjkFHGpEmPgJd4GX1
         Y99Us3G6yBk7rZYqG30UkgaWOGtbaFo8A+14/trCEGabJi1c6ABRaeVAbp4vbMmiiv4e
         VZbw==
X-Gm-Message-State: APjAAAVHSciePufXo37TES+UmljAtqSyGsuvMq928RsePHwTfOLAalRq
        DVSrMdDO5Jfp9XpdBf4objVrQw==
X-Google-Smtp-Source: APXvYqyCCGOrUZ9ASeMIJ6mqBRwpGQqSbvV3UlCvjqN3zMfGsZDYOyhgRD7u3sbBrwMLEggMT+Q29w==
X-Received: by 2002:a63:7053:: with SMTP id a19mr26365083pgn.377.1580772703136;
        Mon, 03 Feb 2020 15:31:43 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id m101sm557380pje.13.2020.02.03.15.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2020 15:31:42 -0800 (PST)
Date:   Mon, 3 Feb 2020 15:31:40 -0800
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
Subject: Re: [PATCH v3 1/9] drm/bridge: ti-sn65dsi86: Split the setting of
 the dp and dsi rates
Message-ID: <20200203233140.GA311651@builder>
References: <20191218223530.253106-1-dianders@chromium.org>
 <20191218143416.v3.1.Icb765d5799e9651e5249c0c27627ba33a9e411cf@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191218143416.v3.1.Icb765d5799e9651e5249c0c27627ba33a9e411cf@changeid>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 18 Dec 14:35 PST 2019, Douglas Anderson wrote:

> These two things were in one function.  Split into two.  This looks
> like it's duplicating some code, but don't worry.  This is is just in
> preparation for future changes.
> 
> This is intended to have zero functional change and will just make
> future patches easier to understand.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Tested-by: Rob Clark <robdclark@gmail.com>
> Reviewed-by: Rob Clark <robdclark@gmail.com>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
> 
> Changes in v3: None
> Changes in v2: None
> 
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 33 +++++++++++++++++++--------
>  1 file changed, 23 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 43abf01ebd4c..2fb9370a76e6 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -417,6 +417,24 @@ static void ti_sn_bridge_set_refclk_freq(struct ti_sn_bridge *pdata)
>  			   REFCLK_FREQ(i));
>  }
>  
> +static void ti_sn_bridge_set_dsi_rate(struct ti_sn_bridge *pdata)
> +{
> +	unsigned int bit_rate_mhz, clk_freq_mhz;
> +	unsigned int val;
> +	struct drm_display_mode *mode =
> +		&pdata->bridge.encoder->crtc->state->adjusted_mode;
> +
> +	/* set DSIA clk frequency */
> +	bit_rate_mhz = (mode->clock / 1000) *
> +			mipi_dsi_pixel_format_to_bpp(pdata->dsi->format);
> +	clk_freq_mhz = bit_rate_mhz / (pdata->dsi->lanes * 2);
> +
> +	/* for each increment in val, frequency increases by 5MHz */
> +	val = (MIN_DSI_CLK_FREQ_MHZ / 5) +
> +		(((clk_freq_mhz - MIN_DSI_CLK_FREQ_MHZ) / 5) & 0xFF);
> +	regmap_write(pdata->regmap, SN_DSIA_CLK_FREQ_REG, val);
> +}
> +
>  /**
>   * LUT index corresponds to register value and
>   * LUT values corresponds to dp data rate supported
> @@ -426,22 +444,16 @@ static const unsigned int ti_sn_bridge_dp_rate_lut[] = {
>  	0, 1620, 2160, 2430, 2700, 3240, 4320, 5400
>  };
>  
> -static void ti_sn_bridge_set_dsi_dp_rate(struct ti_sn_bridge *pdata)
> +static void ti_sn_bridge_set_dp_rate(struct ti_sn_bridge *pdata)
>  {
> -	unsigned int bit_rate_mhz, clk_freq_mhz, dp_rate_mhz;
> -	unsigned int val, i;
> +	unsigned int bit_rate_mhz, dp_rate_mhz;
> +	unsigned int i;
>  	struct drm_display_mode *mode =
>  		&pdata->bridge.encoder->crtc->state->adjusted_mode;
>  
>  	/* set DSIA clk frequency */
>  	bit_rate_mhz = (mode->clock / 1000) *
>  			mipi_dsi_pixel_format_to_bpp(pdata->dsi->format);
> -	clk_freq_mhz = bit_rate_mhz / (pdata->dsi->lanes * 2);
> -
> -	/* for each increment in val, frequency increases by 5MHz */
> -	val = (MIN_DSI_CLK_FREQ_MHZ / 5) +
> -		(((clk_freq_mhz - MIN_DSI_CLK_FREQ_MHZ) / 5) & 0xFF);
> -	regmap_write(pdata->regmap, SN_DSIA_CLK_FREQ_REG, val);
>  
>  	/* set DP data rate */
>  	dp_rate_mhz = ((bit_rate_mhz / pdata->dsi->lanes) * DP_CLK_FUDGE_NUM) /
> @@ -510,7 +522,8 @@ static void ti_sn_bridge_enable(struct drm_bridge *bridge)
>  			   val);
>  
>  	/* set dsi/dp clk frequency value */
> -	ti_sn_bridge_set_dsi_dp_rate(pdata);
> +	ti_sn_bridge_set_dsi_rate(pdata);
> +	ti_sn_bridge_set_dp_rate(pdata);
>  
>  	/* enable DP PLL */
>  	regmap_write(pdata->regmap, SN_PLL_ENABLE_REG, 1);
> -- 
> 2.24.1.735.g03f4e72817-goog
> 
