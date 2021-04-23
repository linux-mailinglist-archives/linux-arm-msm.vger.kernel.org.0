Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58E7136951C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Apr 2021 16:51:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230416AbhDWOwI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Apr 2021 10:52:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229549AbhDWOwH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Apr 2021 10:52:07 -0400
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D330C061574
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Apr 2021 07:51:31 -0700 (PDT)
Received: by mail-oi1-x22b.google.com with SMTP id x20so15670160oix.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Apr 2021 07:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=EJM6pcyl5JpVhByUSBnFL3WnPUaWSbf6IkyIpm5v1k0=;
        b=BZlG4390wuLg5aXUToizN7kM6ql25OpmR5pOWw+rrhzNUcGe4Bcnt0O2J4gM35lPEb
         JxjMmMF0XSlrFkhrgqHzh9pYerbsZWdHKJVrQMcekzegzPGarMTIV/B7SK20ajESfOMe
         OnXYqeGxvoIH1+D4ua/SCEbLInqQDZglV4gERWblGVvYFrJu1jqjW7YbrZSOMqTALYWP
         HikgNxpLniYY8CRv9ii4L9utkPxgg5x1ZQ11Fo0kQVmRgIJEMq0fTJBTgM47a1NRxESu
         sdypenaNA7+K5ZVeF9S4OyJL0Dzv81Hm8JboWGoGizNbZZsLFZflqy2wqT8n3cj7vWiW
         euCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EJM6pcyl5JpVhByUSBnFL3WnPUaWSbf6IkyIpm5v1k0=;
        b=qIiRqs4zawczshiNu2BGk4VyTSggCNc7T1KxJMo/SrdWoiFk28gXX/pi4dlRplkxFf
         fGP8jQ7694sNtfFabQoWWpv5LTtdGkSmg3B3nLISyfdhMHpdETJDJQ5fM3hJPleIhdoL
         9L8Sl9GMHjEHyijZ30jzeFmEt53fxe4okGxAkNF1ZhGv2b5f+R748lIusBvOpfmUtpXP
         wFo3+rR+QUFd4NPCAV4UMV8Bo9m7XGJeWCN3YHoW9GOZ3Lp9RoiuYY4Nn+4HWBl/3EOk
         YFc8GADFLmLSNKeDzk44o7nx6o3bbSQ2FXadmyagfBmBSOBewHdfxghmoWBtWeey2olq
         NVJQ==
X-Gm-Message-State: AOAM533qTvQasmmFOoTnXFXRn7Dp3Ml3uPsg2Xgh7jTP/oMnx6gON0WC
        bAoXjProdva9vvz8oFygMfLSUg==
X-Google-Smtp-Source: ABdhPJypPkXURU9wCcUA9qAGTFRHLghubKiKXtHZ1oSHCwTXEJQAGZNqpwuAdUzgZLo69Ia2QRkSEA==
X-Received: by 2002:aca:4749:: with SMTP id u70mr3017886oia.34.1619189490542;
        Fri, 23 Apr 2021 07:51:30 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id w9sm1288105oiv.8.2021.04.23.07.51.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 07:51:30 -0700 (PDT)
Date:   Fri, 23 Apr 2021 09:51:28 -0500
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
Subject: Re: [PATCH v4 17/27] drm/bridge: ti-sn65dsi86: Use pm_runtime
 autosuspend
Message-ID: <YILe8KziQNalL994@builder.lan>
References: <20210416223950.3586967-1-dianders@chromium.org>
 <20210416153909.v4.17.I4c0b4a87e4dc19e5023b4d0a21bbfa6d9c09ebd8@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210416153909.v4.17.I4c0b4a87e4dc19e5023b4d0a21bbfa6d9c09ebd8@changeid>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 16 Apr 17:39 CDT 2021, Douglas Anderson wrote:

> Let's make the bridge use autosuspend with a 500ms delay. This is in
> preparation for promoting DP AUX transfers to their own sub-driver so
> that we're not constantly powering up and down the device as we
> transfer all the chunks.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
> (no changes since v1)
> 
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 44edcf6f5744..a98abf496190 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -243,7 +243,7 @@ static int status_show(struct seq_file *s, void *data)
>  		seq_printf(s, "[0x%02x] = 0x%08x\n", reg, val);
>  	}
>  
> -	pm_runtime_put(pdata->dev);
> +	pm_runtime_put_autosuspend(pdata->dev);
>  
>  	return 0;
>  }
> @@ -292,7 +292,7 @@ static int ti_sn_bridge_connector_get_modes(struct drm_connector *connector)
>  	if (!edid) {
>  		pm_runtime_get_sync(pdata->dev);
>  		edid = pdata->edid = drm_get_edid(connector, &pdata->aux.ddc);
> -		pm_runtime_put(pdata->dev);
> +		pm_runtime_put_autosuspend(pdata->dev);
>  	}
>  
>  	if (edid && drm_edid_is_valid(edid)) {
> @@ -418,7 +418,7 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
>  	/* check if continuous dsi clock is required or not */
>  	pm_runtime_get_sync(pdata->dev);
>  	regmap_read(pdata->regmap, SN_DPPLL_SRC_REG, &val);
> -	pm_runtime_put(pdata->dev);
> +	pm_runtime_put_autosuspend(pdata->dev);
>  	if (!(val & DPPLL_CLK_SRC_DSICLK))
>  		dsi->mode_flags |= MIPI_DSI_CLOCK_NON_CONTINUOUS;
>  
> @@ -1049,7 +1049,7 @@ static int ti_sn_bridge_gpio_get(struct gpio_chip *chip, unsigned int offset)
>  	 */
>  	pm_runtime_get_sync(pdata->dev);
>  	ret = regmap_read(pdata->regmap, SN_GPIO_IO_REG, &val);
> -	pm_runtime_put(pdata->dev);
> +	pm_runtime_put_autosuspend(pdata->dev);
>  
>  	if (ret)
>  		return ret;
> @@ -1100,7 +1100,7 @@ static int ti_sn_bridge_gpio_direction_input(struct gpio_chip *chip,
>  	 * it off and when it comes back it will have lost all state, but
>  	 * that's OK because the default is input and we're now an input.
>  	 */
> -	pm_runtime_put(pdata->dev);
> +	pm_runtime_put_autosuspend(pdata->dev);
>  
>  	return 0;
>  }
> @@ -1126,7 +1126,7 @@ static int ti_sn_bridge_gpio_direction_output(struct gpio_chip *chip,
>  				 SN_GPIO_MUX_OUTPUT << shift);
>  	if (ret) {
>  		clear_bit(offset, pdata->gchip_output);
> -		pm_runtime_put(pdata->dev);
> +		pm_runtime_put_autosuspend(pdata->dev);
>  	}
>  
>  	return ret;
> @@ -1408,6 +1408,8 @@ static int ti_sn65dsi86_probe(struct i2c_client *client,
>  	ret = devm_add_action_or_reset(dev, ti_sn65dsi86_runtime_disable, dev);
>  	if (ret)
>  		return ret;
> +	pm_runtime_set_autosuspend_delay(pdata->dev, 500);
> +	pm_runtime_use_autosuspend(pdata->dev);
>  
>  	ti_sn65dsi86_debugfs_init(pdata);
>  
> -- 
> 2.31.1.368.gbe11c130af-goog
> 
