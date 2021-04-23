Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80B6B3696B0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Apr 2021 18:13:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229519AbhDWQOW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Apr 2021 12:14:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230355AbhDWQOQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Apr 2021 12:14:16 -0400
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDDBCC06174A
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Apr 2021 09:13:38 -0700 (PDT)
Received: by mail-oi1-x232.google.com with SMTP id d25so12153773oij.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Apr 2021 09:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=VbXYKADdmwOH79L6ViVXTU8ZSxeTDRgadHJidgsTXTM=;
        b=oWoxobZWaNhkJ4ZKI8Hr/eMLcZAgzZqlE8Kgg4FItYE4OZ7J+8m4F2VTX5vPoVSA3K
         FdPEVmxBPvlD73fmPf0qTXMl/TNPv8QXT+qkL0NCa55U7haBFLcodjrTCRWRjNWjFX83
         acAstwZExSckSRqfGmPAck/PtMEpLEK3oaHg3UjD5U1ni0VP+NMHbbwMeF9lWxZp/BP5
         tCSoJC4PQM3dRiPz94F0vTRhUuJbZ+wothIRvjtcKXl0DZxaXf/zxCFDDBH/2x4GNmIg
         Cx0t5aPTpU87rRGLz2PNFXEZg8uyLss1TKjkFuCvmlYX+tAeqRWajxxR5oLKKTVpYzab
         XiMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VbXYKADdmwOH79L6ViVXTU8ZSxeTDRgadHJidgsTXTM=;
        b=eizAY+IGCE0O/ODpR97mJeQDDzrC4rPrS89ajsw6vqNnpflhG1kfGfNVuv0HVMgpmW
         GfoOTb3xOga4TPD7CVYCQOhVa7AEkZROPl0uvVy47AQMgfbOw9OlwQP2CyLp0jFhDv4M
         W5qgliLz5ZBMkDgmbp1RqF5gniCXktOYTJQppdia2DWqjMExlxybl3m3r3d5fHarZSWZ
         6y0jHXq40b/J6GgXRdwM0RVY9UzZOcI0dBwNkdeE6OhbHuKvcpDC2cJUfR759Jx15FFW
         D0PHtiva16TUwH0CCsxXb/CiL3S0hZZfx2R0qyyVfPyP0Q07zOxMP/anMdftqpyhqBhA
         cxpw==
X-Gm-Message-State: AOAM530DSwdyHmxeLiT0046e/pO2Fj3hMYrYr31CiSS7oJ0qHSlm7Zea
        P14FvuhsVAu4Pyifh2Z6JkfCeA==
X-Google-Smtp-Source: ABdhPJzRUZLe7+UOtveCxOLUUqc//CIMtkno3xigvUsDgjkUmuug6YblE/W99gqm8UKVoUIvUrD0Iw==
X-Received: by 2002:aca:f553:: with SMTP id t80mr4455681oih.149.1619194418219;
        Fri, 23 Apr 2021 09:13:38 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id w2sm1272005oov.23.2021.04.23.09.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 09:13:37 -0700 (PDT)
Date:   Fri, 23 Apr 2021 11:13:35 -0500
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
Subject: Re: [PATCH v4 25/27] drm/bridge: ti-sn65dsi86: Don't read EDID blob
 over DDC
Message-ID: <YILyL+V4tgNX8mck@builder.lan>
References: <20210416223950.3586967-1-dianders@chromium.org>
 <20210416153909.v4.25.I9330684c25f65bb318eff57f0616500f83eac3cc@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210416153909.v4.25.I9330684c25f65bb318eff57f0616500f83eac3cc@changeid>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 16 Apr 17:39 CDT 2021, Douglas Anderson wrote:

> This is really just a revert of commit 58074b08c04a ("drm/bridge:
> ti-sn65dsi86: Read EDID blob over DDC"), resolving conflicts.
> 
> The old code failed to read the EDID properly in a very important
> case: before the bridge's pre_enable() was called. The way things need
> to work:
> 1. Read the EDID.
> 2. Based on the EDID, decide on video settings and pixel clock.
> 3. Enable the bridge w/ the desired settings.
> 
> The way things were working:
> 1. Try to read the EDID but fail; fall back to hardcoded values.
> 2. Based on hardcoded values, decide on video settings and pixel clock.
> 3. Enable the bridge w/ the desired settings.
> 4. Try again to read the EDID, it works now!
> 5. Realize that the hardcoded settings weren't quite right.
> 6. Disable / reenable the bridge w/ the right settings.
> 
> The reasons for the failures were twofold:
> a) Since we never ran the bridge chip's pre-enable then we never set
>    the bit to ignore HPD. This meant the bridge chip didn't even _try_
>    to go out on the bus and communicate with the panel.
> b) Even if we fixed things to ignore HPD, the EDID still wouldn't read
>    if the panel wasn't on.
> 
> Instead of reverting the code, we could fix it to set the HPD bit and
> also power on the panel. However, it also works nicely to just let the
> panel code read the EDID. Now that we've split the driver up we can
> expose the DDC AUX channel bus to the panel node. The panel can take
> charge of reading the EDID.
> 
> NOTE: in order for things to work, anyone that needs to read the EDID
> will need to add something that looks like this to their panel in the
> dts:
>   ddc-i2c-bus = <&sn65dsi86_bridge>;
> 
> Presumably it's OK to land this without waiting for users to add the
> dts property since the EDID reading was a bit broken anyway, was
> "recently" added, and we know we must have the fallback mode to use
> (since the EDID reading was a bit broken).
> 
> Suggested-by: Andrzej Hajda <a.hajda@samsung.com>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
> 
> (no changes since v1)
> 
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 22 ----------------------
>  1 file changed, 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 8253098bcdbf..62904dfdee0a 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -125,7 +125,6 @@
>   * @connector:    Our connector.
>   * @host_node:    Remote DSI node.
>   * @dsi:          Our MIPI DSI source.
> - * @edid:         Detected EDID of eDP panel.
>   * @refclk:       Our reference clock.
>   * @panel:        Our panel.
>   * @enable_gpio:  The GPIO we toggle to enable the bridge.
> @@ -156,7 +155,6 @@ struct ti_sn65dsi86 {
>  	struct drm_dp_aux		aux;
>  	struct drm_bridge		bridge;
>  	struct drm_connector		connector;
> -	struct edid			*edid;
>  	struct device_node		*host_node;
>  	struct mipi_dsi_device		*dsi;
>  	struct clk			*refclk;
> @@ -404,24 +402,6 @@ connector_to_ti_sn65dsi86(struct drm_connector *connector)
>  static int ti_sn_bridge_connector_get_modes(struct drm_connector *connector)
>  {
>  	struct ti_sn65dsi86 *pdata = connector_to_ti_sn65dsi86(connector);
> -	struct edid *edid = pdata->edid;
> -	int num, ret;
> -
> -	if (!edid) {
> -		pm_runtime_get_sync(pdata->dev);
> -		edid = pdata->edid = drm_get_edid(connector, &pdata->aux.ddc);
> -		pm_runtime_put_autosuspend(pdata->dev);
> -	}
> -
> -	if (edid && drm_edid_is_valid(edid)) {
> -		ret = drm_connector_update_edid_property(connector, edid);
> -		if (!ret) {
> -			num = drm_add_edid_modes(connector, edid);
> -			if (num)
> -				return num;
> -		}
> -	}
> -
>  	return drm_panel_get_modes(pdata->panel, connector);
>  }
>  
> @@ -1330,8 +1310,6 @@ static void ti_sn_bridge_remove(struct auxiliary_device *adev)
>  		mipi_dsi_device_unregister(pdata->dsi);
>  	}
>  
> -	kfree(pdata->edid);
> -
>  	drm_bridge_remove(&pdata->bridge);
>  
>  	of_node_put(pdata->host_node);
> -- 
> 2.31.1.368.gbe11c130af-goog
> 
