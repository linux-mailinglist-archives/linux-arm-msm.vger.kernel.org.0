Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A4083694DF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Apr 2021 16:38:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231345AbhDWOiw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Apr 2021 10:38:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236659AbhDWOiv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Apr 2021 10:38:51 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47422C061574
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Apr 2021 07:38:13 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id 65-20020a9d03470000b02902808b4aec6dso40718542otv.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Apr 2021 07:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=NRE9QbrX/aDzI7BokRhqkKTHnKj1gy2yobJ+pmPUges=;
        b=JnjnE8scoMKiMsn2WI2JJGApFjwHhkXV2h1hZ6aowI6ySX76qoFvwJEeJ5b8u3MHfO
         DIeUi4Tp72ybADLKCPQwCAfW5e0KYT+TW7nLX/wTaFpY8DIyRIGOOFf9eNa+kewocn1y
         fPGI1GPbbbkQPwQN2tJjZ23JgJi2jB+mgXEt2ZBVL+yRtxJIyBNW6uwqvgt2MBkj6iWJ
         65C0DcxS23+1iCUJkamBc1gdTDF1D05rxtam11/PJOx18XhXES1x45j1T5fTMe6oLyZo
         lM/oTkbkS8PK+ILWbvqR7HJOzjQYnkOTaDC5+X51lz9dWoV/U2CnLG1TvtLVZ76pgqt1
         nBaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NRE9QbrX/aDzI7BokRhqkKTHnKj1gy2yobJ+pmPUges=;
        b=iz2LiTdZ8HLJCkmOWATzvC74GKEMYqVPT8A6q9PZOR1CIYCUrwd7p5/eB4QaeKgQAk
         nDIzpJCXLccaky+JqZG1Ni7pABr98WDaGhp4P1AyZSYLirvMSwaXN+rI1vwACzk1fE1O
         ZuPzHTnRl3C0fC08h2VyDHDFt336QY9PwzkLG0YOcS0rXewmcwPpxmEXBTBpzhl6ZCpB
         VCRj6ywrp4hps0ap+SJKSy8X9sr1fMSs2LFAcsvXY9Wz8UXovD7JX8UKm+4w/MEhWAp4
         QoVOk0KhtfYKUs77nr8x69BwfjMwSc+6U5PARRuX5IuGF6+1KlopqIK/XXGgN/m3CAKN
         Ls8Q==
X-Gm-Message-State: AOAM532qUNSSHrtJOOJMDTbLPv01WnaCXCJYlaG0ahG3zDhW2qsuXM4P
        dWRNb3BisSfaEhuaw2zRuUYF9Q==
X-Google-Smtp-Source: ABdhPJyIuk+s7BfatZ+LX3Jze2EUeAMDwGu3pEcnv7gx4wV+urxaFqMUx6OtitjHOT/734tTtUfVEA==
X-Received: by 2002:a05:6830:1af7:: with SMTP id c23mr3799532otd.3.1619188692103;
        Fri, 23 Apr 2021 07:38:12 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id w84sm1308335oig.20.2021.04.23.07.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 07:38:11 -0700 (PDT)
Date:   Fri, 23 Apr 2021 09:38:09 -0500
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
Subject: Re: [PATCH v4 11/27] drm/bridge: ti-sn65dsi86: Add local var for
 "dev" to simplify probe
Message-ID: <YILb0Q79huUgGgd1@builder.lan>
References: <20210416223950.3586967-1-dianders@chromium.org>
 <20210416153909.v4.11.I83925d8ca228bdc5f55b17854c90754efc6a470e@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210416153909.v4.11.I83925d8ca228bdc5f55b17854c90754efc6a470e@changeid>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 16 Apr 17:39 CDT 2021, Douglas Anderson wrote:

> Tiny cleanup for probe so we don't keep having to specify
> "&client->dev" or "pdata->dev". No functional changes intended.
> 

Nice

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
> (no changes since v1)
> 
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 26 ++++++++++++--------------
>  1 file changed, 12 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 0c6aa99ddc99..2cbf619fbd27 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -1226,6 +1226,7 @@ static void ti_sn_bridge_parse_lanes(struct ti_sn65dsi86 *pdata,
>  static int ti_sn65dsi86_probe(struct i2c_client *client,
>  			      const struct i2c_device_id *id)
>  {
> +	struct device *dev = &client->dev;
>  	struct ti_sn65dsi86 *pdata;
>  	int ret;
>  
> @@ -1234,8 +1235,7 @@ static int ti_sn65dsi86_probe(struct i2c_client *client,
>  		return -ENODEV;
>  	}
>  
> -	pdata = devm_kzalloc(&client->dev, sizeof(struct ti_sn65dsi86),
> -			     GFP_KERNEL);
> +	pdata = devm_kzalloc(dev, sizeof(struct ti_sn65dsi86), GFP_KERNEL);
>  	if (!pdata)
>  		return -ENOMEM;
>  
> @@ -1246,26 +1246,24 @@ static int ti_sn65dsi86_probe(struct i2c_client *client,
>  		return PTR_ERR(pdata->regmap);
>  	}
>  
> -	pdata->dev = &client->dev;
> +	pdata->dev = dev;
>  
> -	ret = drm_of_find_panel_or_bridge(pdata->dev->of_node, 1, 0,
> -					  &pdata->panel, NULL);
> +	ret = drm_of_find_panel_or_bridge(dev->of_node, 1, 0, &pdata->panel, NULL);
>  	if (ret) {
>  		DRM_ERROR("could not find any panel node\n");
>  		return ret;
>  	}
>  
> -	dev_set_drvdata(&client->dev, pdata);
> +	dev_set_drvdata(dev, pdata);
>  
> -	pdata->enable_gpio = devm_gpiod_get(pdata->dev, "enable",
> -					    GPIOD_OUT_LOW);
> +	pdata->enable_gpio = devm_gpiod_get(dev, "enable", GPIOD_OUT_LOW);
>  	if (IS_ERR(pdata->enable_gpio)) {
>  		DRM_ERROR("failed to get enable gpio from DT\n");
>  		ret = PTR_ERR(pdata->enable_gpio);
>  		return ret;
>  	}
>  
> -	ti_sn_bridge_parse_lanes(pdata, client->dev.of_node);
> +	ti_sn_bridge_parse_lanes(pdata, dev->of_node);
>  
>  	ret = ti_sn65dsi86_parse_regulators(pdata);
>  	if (ret) {
> @@ -1273,7 +1271,7 @@ static int ti_sn65dsi86_probe(struct i2c_client *client,
>  		return ret;
>  	}
>  
> -	pdata->refclk = devm_clk_get_optional(pdata->dev, "refclk");
> +	pdata->refclk = devm_clk_get_optional(dev, "refclk");
>  	if (IS_ERR(pdata->refclk))
>  		return PTR_ERR(pdata->refclk);
>  
> @@ -1281,23 +1279,23 @@ static int ti_sn65dsi86_probe(struct i2c_client *client,
>  	if (ret)
>  		return ret;
>  
> -	pm_runtime_enable(pdata->dev);
> +	pm_runtime_enable(dev);
>  
>  	ret = ti_sn_setup_gpio_controller(pdata);
>  	if (ret) {
> -		pm_runtime_disable(pdata->dev);
> +		pm_runtime_disable(dev);
>  		return ret;
>  	}
>  
>  	i2c_set_clientdata(client, pdata);
>  
>  	pdata->aux.name = "ti-sn65dsi86-aux";
> -	pdata->aux.dev = pdata->dev;
> +	pdata->aux.dev = dev;
>  	pdata->aux.transfer = ti_sn_aux_transfer;
>  	drm_dp_aux_init(&pdata->aux);
>  
>  	pdata->bridge.funcs = &ti_sn_bridge_funcs;
> -	pdata->bridge.of_node = client->dev.of_node;
> +	pdata->bridge.of_node = dev->of_node;
>  
>  	drm_bridge_add(&pdata->bridge);
>  
> -- 
> 2.31.1.368.gbe11c130af-goog
> 
