Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9728339058E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 May 2021 17:36:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233595AbhEYPhr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 May 2021 11:37:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233451AbhEYPhq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 May 2021 11:37:46 -0400
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFD6DC061756
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 May 2021 08:36:16 -0700 (PDT)
Received: by mail-oi1-x22b.google.com with SMTP id h9so30698913oih.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 May 2021 08:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=RBWrllR3VRUzbn0TFjCHIkpDFbjuICLM+Irp8TfqZvQ=;
        b=vfBNsgUJ3DNsQ29JC/BYOu1ThglJZt3oPlNhnLLrxLMwAD0/bMJ/ZX3jZQw8DiK2YW
         1jdJiYpfTEIDP0XOGmVKOl3q4xqa1K4s3nOEx173WCyUnqscLbfmCv6iilfBVaDGDwk1
         bDKTmiSF19pqwoVgyhUdlGA4lJz6C8oy8qQ1ouyMpY9FEOBAj+WDdXf/NXZbURz8jOug
         Sm15WgSyBCdZYgZwHYYU4Cn/Ydcmg4NCNBpHklrYK+l6xaTVUMjx07c8pXPHeQoFJKVv
         tJrsiNu5Gr83YQ/KrVm7dX1H4C11r89yS/Bp0ifkvaHgjnpSTQy31DrCaPH8EJu4upmM
         76Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RBWrllR3VRUzbn0TFjCHIkpDFbjuICLM+Irp8TfqZvQ=;
        b=mVNbD2iQLAingmFeJ7/w1t1EZ8R5if+oQsxHXT0pREljqkA3eKO/vJ0sP2EfkEkLNk
         sYUvO0rTFsKPFKSmqtrw33LE566jwNkoGjtLw5wEmcCWH8jRN/3RhJrIfn/j0dUzMHGE
         8sSYV0QPycxDmYCqXh3h4tHwW2+y77XDXS3wHfy71AZgLm/QbVFdqCvlJ88YXLqGKOnM
         i4v1cJ6dyGfQz9w7Twr7K3laHIXrsbcX6PU7eEKKQV99+VfJrZh/dhEY2jmaO42rNzbG
         GdcN5ky5HdOzpnDeVI20PGY6JjKdlfj8GwtUJk1M4ORsORwyxtVroP1Wx0B1mJNpvbXd
         homw==
X-Gm-Message-State: AOAM533D2rB9KYrO+9cFQ6ihemNj+bITTrf3XZKHjyhRnf9vOgVe/Ldl
        NQss7+06XJQjSh0eKhmJZ/fUjw==
X-Google-Smtp-Source: ABdhPJwEt/s/nXGw4osAaDad+fMzlf5d4VrTdg07Pxn/LoMX4MZI9UquiRGC764LeckgQhy1ZQ1V4Q==
X-Received: by 2002:aca:497:: with SMTP id 145mr14980127oie.108.1621956976253;
        Tue, 25 May 2021 08:36:16 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id u14sm3293340oif.41.2021.05.25.08.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 May 2021 08:36:15 -0700 (PDT)
Date:   Tue, 25 May 2021 10:36:13 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Caleb Connolly <caleb@connolly.tech>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] drm: panel: sofef00: remove reset GPIO handling
Message-ID: <YK0ZbTeH7eRP+p98@builder.lan>
References: <20210502014146.85642-1-caleb@connolly.tech>
 <20210502014146.85642-3-caleb@connolly.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210502014146.85642-3-caleb@connolly.tech>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat 01 May 20:42 CDT 2021, Caleb Connolly wrote:

> Resetting the panel on fajita causes it to never come back, we aren't
> quite sure why this is so for now lets remove reset handling as it is
> effectively broken. It is also not needed on enchilada.
> 
> Signed-off-by: Caleb Connolly <caleb@connolly.tech>
> ---
>  drivers/gpu/drm/panel/panel-samsung-sofef00.c | 26 +++----------------
>  1 file changed, 4 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-samsung-sofef00.c b/drivers/gpu/drm/panel/panel-samsung-sofef00.c
> index 8cb1853574bb..cfc8b2a19742 100644
> --- a/drivers/gpu/drm/panel/panel-samsung-sofef00.c
> +++ b/drivers/gpu/drm/panel/panel-samsung-sofef00.c
> @@ -23,7 +23,6 @@ struct sofef00_panel {
>  	struct drm_panel panel;
>  	struct mipi_dsi_device *dsi;
>  	struct regulator *supply;
> -	struct gpio_desc *reset_gpio;
>  	const struct drm_display_mode *mode;
>  	bool prepared;
>  };
> @@ -42,16 +41,6 @@ struct sofef00_panel *to_sofef00_panel(struct drm_panel *panel)
>  			return ret;					\
>  	} while (0)
>  
> -static void sofef00_panel_reset(struct sofef00_panel *ctx)
> -{
> -	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
> -	usleep_range(5000, 6000);
> -	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> -	usleep_range(2000, 3000);
> -	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
> -	usleep_range(12000, 13000);
> -}
> -
>  static int sofef00_panel_on(struct sofef00_panel *ctx)
>  {
>  	struct mipi_dsi_device *dsi = ctx->dsi;
> @@ -132,12 +121,9 @@ static int sofef00_panel_prepare(struct drm_panel *panel)
>  		return ret;
>  	}
>  
> -	sofef00_panel_reset(ctx);
> -
>  	ret = sofef00_panel_on(ctx);
>  	if (ret < 0) {
>  		dev_err(dev, "Failed to initialize panel: %d\n", ret);
> -		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
>  		return ret;
>  	}
>  
> @@ -155,8 +141,11 @@ static int sofef00_panel_unprepare(struct drm_panel *panel)
>  		return 0;
>  
>  	ret = sofef00_panel_off(ctx);
> -	if (ret < 0)
> +
> +	if (ret < 0) {
>  		dev_err(dev, "Failed to un-initialize panel: %d\n", ret);
> +		return ret;

This early return seems unrelated to what's described in the commit
message.

Also as a general comment, what do you expect the software should do if
you return an error in the unprepare path? Can we if this happens just
continue to display stuff on the display?

> +	}
>  
>  	regulator_disable(ctx->supply);
>  
> @@ -276,13 +265,6 @@ static int sofef00_panel_probe(struct mipi_dsi_device *dsi)
>  		return ret;
>  	}
>  
> -	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);

If I understand your description in the cover letter this works for one
of the devices using the panel, but not the other.

So how about using devm_gpiod_get_optional() instead. That will give you
NULL back if the property isn't defined and make all the gpiod
operations nops.

Regards,
Bjorn

> -	if (IS_ERR(ctx->reset_gpio)) {
> -		ret = PTR_ERR(ctx->reset_gpio);
> -		dev_warn(dev, "Failed to get reset-gpios: %d\n", ret);
> -		return ret;
> -	}
> -
>  	ctx->dsi = dsi;
>  	mipi_dsi_set_drvdata(dsi, ctx);
>  
> -- 
> 2.30.2
> 
> 
