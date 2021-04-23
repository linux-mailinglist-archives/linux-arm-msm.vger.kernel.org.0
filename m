Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AA2F36951F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Apr 2021 16:52:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240214AbhDWOwe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Apr 2021 10:52:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238411AbhDWOwe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Apr 2021 10:52:34 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E211DC061574
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Apr 2021 07:51:57 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id v19-20020a0568300913b029028423b78c2dso36879421ott.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Apr 2021 07:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=DKtdcbgCIuBeHR93Ps5SlExKlw0Mgg/XpXM8QJ8fIC4=;
        b=n2s6Qz1HAbkGOT+OLGCGBcP0qNZFmM+TZtMBXQMGHbFYDm7MdbjuS59pJWYsPGocmF
         bS7w9+Zb6U7O6gvn+Ig98OAn/c8MzknkrBrqhg22MDxr6vnUM75dFMzzHzY2MPALykRj
         pDX29VWZt0bjT+63iD27ku979P16ZacRgy9SftBcy4kKwuu6oaHZbsBIYkf6G6DhS6UX
         4G3uwIXF66n6GT2VLDCTe/J0L3ggPW5iBlrULx860qu2RRcLKrrshVlpO97GBw82BWtz
         HMCoJr3oN0FlpEs8FnA5tXvXa6iDKoHIXhFquK4PK989hcmnH1rbfwl5ZNBi3ox8Hgjm
         cQlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=DKtdcbgCIuBeHR93Ps5SlExKlw0Mgg/XpXM8QJ8fIC4=;
        b=dDqr+l+vYZSs0uJqfv4GOUOIRszNcn3umTZcgXRY6EX8SvK5pW351P+MUyWkGS17HS
         JR4DeEq5SCd3JKhVKcPmTKviZdbb7B2ZNTYFkn2NeV6paTn+iO7A0jCCZrUNJrIzms8r
         NZCDk9RL4KZ+ltJ6XwDnc9+gcpwc4jVv/E2rkyxhbwFgs6TkdlDiP4NwHPfKktRFaip/
         30pXKs0rYVe//RToDP32PO2xZR5VFMv0Yx6OugyeJ4x7VQjV+eBOfsLfoDKibecVggVf
         gnp2ni8mjd2LOAamp9eGLp/43dMm4QycDB9tfVeElqda22xKcZwPC9JcR+9/7p5GdBxJ
         F26Q==
X-Gm-Message-State: AOAM530g4GqFAHGW1NoNhUwJdXco5J0OHASR6vJ/Qj7woykY0ahAuGuW
        oFVCi7GBw8DdSWPatWKwdxHMQA==
X-Google-Smtp-Source: ABdhPJw817mCO7m3hXQcGfXTaEXLe0i387k1uq4IONzsYoyO5MmZvPe79qEjPHyV/ZrDYPFVtyNIxQ==
X-Received: by 2002:a9d:37b6:: with SMTP id x51mr3653303otb.159.1619189517323;
        Fri, 23 Apr 2021 07:51:57 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id u4sm1222038ool.25.2021.04.23.07.51.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 07:51:56 -0700 (PDT)
Date:   Fri, 23 Apr 2021 09:51:55 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Sam Ravnborg <sam@ravnborg.org>, Wolfram Sang <wsa@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>, robdclark@chromium.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
        Steev Klimaszewski <steev@kali.org>,
        linux-arm-msm@vger.kernel.org, Linus W <linus.walleij@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Robert Foss <robert.foss@linaro.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 18/27] drm/bridge: ti-sn65dsi86: Code motion of refclk
 management functions
Message-ID: <YILfCx01DVji0n0Z@builder.lan>
References: <20210416223950.3586967-1-dianders@chromium.org>
 <20210416153909.v4.18.I047b8c7c6a3fc60eaca473da7a374f171fb021c2@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210416153909.v4.18.I047b8c7c6a3fc60eaca473da7a374f171fb021c2@changeid>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 16 Apr 17:39 CDT 2021, Douglas Anderson wrote:

> No functional changes--this just makes the diffstat of a future change
> easier to understand.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
> (no changes since v1)
> 
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 116 +++++++++++++-------------
>  1 file changed, 58 insertions(+), 58 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index a98abf496190..b3c699da7724 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -192,6 +192,64 @@ static void ti_sn65dsi86_write_u16(struct ti_sn65dsi86 *pdata,
>  	regmap_write(pdata->regmap, reg + 1, val >> 8);
>  }
>  
> +static u32 ti_sn_bridge_get_dsi_freq(struct ti_sn65dsi86 *pdata)
> +{
> +	u32 bit_rate_khz, clk_freq_khz;
> +	struct drm_display_mode *mode =
> +		&pdata->bridge.encoder->crtc->state->adjusted_mode;
> +
> +	bit_rate_khz = mode->clock *
> +			mipi_dsi_pixel_format_to_bpp(pdata->dsi->format);
> +	clk_freq_khz = bit_rate_khz / (pdata->dsi->lanes * 2);
> +
> +	return clk_freq_khz;
> +}
> +
> +/* clk frequencies supported by bridge in Hz in case derived from REFCLK pin */
> +static const u32 ti_sn_bridge_refclk_lut[] = {
> +	12000000,
> +	19200000,
> +	26000000,
> +	27000000,
> +	38400000,
> +};
> +
> +/* clk frequencies supported by bridge in Hz in case derived from DACP/N pin */
> +static const u32 ti_sn_bridge_dsiclk_lut[] = {
> +	468000000,
> +	384000000,
> +	416000000,
> +	486000000,
> +	460800000,
> +};
> +
> +static void ti_sn_bridge_set_refclk_freq(struct ti_sn65dsi86 *pdata)
> +{
> +	int i;
> +	u32 refclk_rate;
> +	const u32 *refclk_lut;
> +	size_t refclk_lut_size;
> +
> +	if (pdata->refclk) {
> +		refclk_rate = clk_get_rate(pdata->refclk);
> +		refclk_lut = ti_sn_bridge_refclk_lut;
> +		refclk_lut_size = ARRAY_SIZE(ti_sn_bridge_refclk_lut);
> +		clk_prepare_enable(pdata->refclk);
> +	} else {
> +		refclk_rate = ti_sn_bridge_get_dsi_freq(pdata) * 1000;
> +		refclk_lut = ti_sn_bridge_dsiclk_lut;
> +		refclk_lut_size = ARRAY_SIZE(ti_sn_bridge_dsiclk_lut);
> +	}
> +
> +	/* for i equals to refclk_lut_size means default frequency */
> +	for (i = 0; i < refclk_lut_size; i++)
> +		if (refclk_lut[i] == refclk_rate)
> +			break;
> +
> +	regmap_update_bits(pdata->regmap, SN_DPPLL_SRC_REG, REFCLK_FREQ_MASK,
> +			   REFCLK_FREQ(i));
> +}
> +
>  static int __maybe_unused ti_sn65dsi86_resume(struct device *dev)
>  {
>  	struct ti_sn65dsi86 *pdata = dev_get_drvdata(dev);
> @@ -459,64 +517,6 @@ static void ti_sn_bridge_disable(struct drm_bridge *bridge)
>  	regmap_write(pdata->regmap, SN_PLL_ENABLE_REG, 0);
>  }
>  
> -static u32 ti_sn_bridge_get_dsi_freq(struct ti_sn65dsi86 *pdata)
> -{
> -	u32 bit_rate_khz, clk_freq_khz;
> -	struct drm_display_mode *mode =
> -		&pdata->bridge.encoder->crtc->state->adjusted_mode;
> -
> -	bit_rate_khz = mode->clock *
> -			mipi_dsi_pixel_format_to_bpp(pdata->dsi->format);
> -	clk_freq_khz = bit_rate_khz / (pdata->dsi->lanes * 2);
> -
> -	return clk_freq_khz;
> -}
> -
> -/* clk frequencies supported by bridge in Hz in case derived from REFCLK pin */
> -static const u32 ti_sn_bridge_refclk_lut[] = {
> -	12000000,
> -	19200000,
> -	26000000,
> -	27000000,
> -	38400000,
> -};
> -
> -/* clk frequencies supported by bridge in Hz in case derived from DACP/N pin */
> -static const u32 ti_sn_bridge_dsiclk_lut[] = {
> -	468000000,
> -	384000000,
> -	416000000,
> -	486000000,
> -	460800000,
> -};
> -
> -static void ti_sn_bridge_set_refclk_freq(struct ti_sn65dsi86 *pdata)
> -{
> -	int i;
> -	u32 refclk_rate;
> -	const u32 *refclk_lut;
> -	size_t refclk_lut_size;
> -
> -	if (pdata->refclk) {
> -		refclk_rate = clk_get_rate(pdata->refclk);
> -		refclk_lut = ti_sn_bridge_refclk_lut;
> -		refclk_lut_size = ARRAY_SIZE(ti_sn_bridge_refclk_lut);
> -		clk_prepare_enable(pdata->refclk);
> -	} else {
> -		refclk_rate = ti_sn_bridge_get_dsi_freq(pdata) * 1000;
> -		refclk_lut = ti_sn_bridge_dsiclk_lut;
> -		refclk_lut_size = ARRAY_SIZE(ti_sn_bridge_dsiclk_lut);
> -	}
> -
> -	/* for i equals to refclk_lut_size means default frequency */
> -	for (i = 0; i < refclk_lut_size; i++)
> -		if (refclk_lut[i] == refclk_rate)
> -			break;
> -
> -	regmap_update_bits(pdata->regmap, SN_DPPLL_SRC_REG, REFCLK_FREQ_MASK,
> -			   REFCLK_FREQ(i));
> -}
> -
>  static void ti_sn_bridge_set_dsi_rate(struct ti_sn65dsi86 *pdata)
>  {
>  	unsigned int bit_rate_mhz, clk_freq_mhz;
> -- 
> 2.31.1.368.gbe11c130af-goog
> 
