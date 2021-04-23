Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A08B63694E6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Apr 2021 16:39:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238411AbhDWOkD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Apr 2021 10:40:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231680AbhDWOkC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Apr 2021 10:40:02 -0400
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1969C061574
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Apr 2021 07:39:25 -0700 (PDT)
Received: by mail-oi1-x235.google.com with SMTP id n140so49349374oig.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Apr 2021 07:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=I9MV5JyH6P4LcZ2fDNEMfCCgOEciWBlM45eAxADBLIQ=;
        b=jfQ5giClCQ+i8W6e5OshV7lriJfQRODdnG8kSfYWAHru1vZUimVaVXPgZiqdGMYkd3
         i+7zLQ4pJVAzrBjtNEgWyhHxY1F338mxE26iVYXQ1J3+PsKDRV36CM6+6O8RzMEaugCq
         aDdaIXgO8B1DTCbHtPAP6+PYYTvfaBgX9UrCiKKql4UQ29UYJsxHSfa0G1p3VfGlIvLY
         /KFCDYCkUr2XoX7iQyCF0RUcttULylRSInzTqkHaD0j7LD0uW/oFF2bbHT9XEvK9aCra
         ERrs+tyU8lYf9WObn8k7vI0j+B7kTw2lYGzwdUThODaAGzAKtang6KlpLBJwoJl8e9R/
         Jt2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=I9MV5JyH6P4LcZ2fDNEMfCCgOEciWBlM45eAxADBLIQ=;
        b=qrx2iL9eS8D4pMikEYo4cS8apVoxmlLYBsr9sw+uRSQtLYzuHyc87QSP5DXk1+uS4T
         8LC/vrTnST6ZiQBTF4792ikNH5kj6UIBkyUj8z+fki3eZesG1Y16tjwYcP4+khCpKSQs
         bgFeMpgk+A7YOpsd7E1xeLHi70p2u2Yi2hWL6fUkozfHNfEI0cMN5XCHyWLp9BC5uZN+
         Gh9Bqarua+OVbTJqnS/o+vCsXevKPcerknNTyOlFAjtYqUIykY4TlfPBoDkQz/1KTm4x
         28cJ7Mx5r2akfAcoldjP+fzZD3DLKN5H/CZMGx9yqa5/PyEjK4tJ7kkq0GnU+Ar175zI
         4SXQ==
X-Gm-Message-State: AOAM53071c+RKP8U+UBCMOd0I1gIrVHMaiI0WQxyxWhhzeNxiBJzmSNl
        jD83zxPj6AyCN6OgHDO730y3Mw==
X-Google-Smtp-Source: ABdhPJxVQ1s6ij+X+zfhhvI9MYkNm9WLqcvt633vB4X16M7nShv794knsCpkxzlL5HCG515umByBnw==
X-Received: by 2002:aca:eb4e:: with SMTP id j75mr4217266oih.125.1619188765058;
        Fri, 23 Apr 2021 07:39:25 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id q23sm1395830otc.7.2021.04.23.07.39.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 07:39:24 -0700 (PDT)
Date:   Fri, 23 Apr 2021 09:39:22 -0500
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
Subject: Re: [PATCH v4 13/27] drm/bridge: ti-sn65dsi86: Use devm to do our
 runtime_disable
Message-ID: <YILcGg9tBRUasU5Q@builder.lan>
References: <20210416223950.3586967-1-dianders@chromium.org>
 <20210416153909.v4.13.I1e627eb5f316c0cf6595b120e6e262f5bf890300@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210416153909.v4.13.I1e627eb5f316c0cf6595b120e6e262f5bf890300@changeid>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 16 Apr 17:39 CDT 2021, Douglas Anderson wrote:

> There's no devm_runtime_enable(), but it's easy to use
> devm_add_action_or_reset() and means we don't need to worry about the
> disable in our remove() routine or in error paths.
> 
> No functional changes intended by this change.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
> (no changes since v1)
> 
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index a200e88fd006..53f1f7b3022f 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -1223,6 +1223,11 @@ static void ti_sn_bridge_parse_lanes(struct ti_sn65dsi86 *pdata,
>  	pdata->ln_polrs = ln_polrs;
>  }
>  
> +static void ti_sn65dsi86_runtime_disable(void *data)
> +{
> +	pm_runtime_disable(data);
> +}
> +
>  static int ti_sn65dsi86_probe(struct i2c_client *client,
>  			      const struct i2c_device_id *id)
>  {
> @@ -1278,12 +1283,13 @@ static int ti_sn65dsi86_probe(struct i2c_client *client,
>  		return ret;
>  
>  	pm_runtime_enable(dev);
> +	ret = devm_add_action_or_reset(dev, ti_sn65dsi86_runtime_disable, dev);
> +	if (ret)
> +		return ret;
>  
>  	ret = ti_sn_setup_gpio_controller(pdata);
> -	if (ret) {
> -		pm_runtime_disable(dev);
> +	if (ret)
>  		return ret;
> -	}
>  
>  	pdata->aux.name = "ti-sn65dsi86-aux";
>  	pdata->aux.dev = dev;
> @@ -1316,8 +1322,6 @@ static int ti_sn65dsi86_remove(struct i2c_client *client)
>  
>  	drm_bridge_remove(&pdata->bridge);
>  
> -	pm_runtime_disable(pdata->dev);
> -
>  	of_node_put(pdata->host_node);
>  
>  	return 0;
> -- 
> 2.31.1.368.gbe11c130af-goog
> 
