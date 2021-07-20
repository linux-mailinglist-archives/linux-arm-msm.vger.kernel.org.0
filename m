Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31B5C3CFEB6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jul 2021 18:07:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235764AbhGTP0s (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Jul 2021 11:26:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240572AbhGTPYQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Jul 2021 11:24:16 -0400
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 769EBC061786
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jul 2021 09:03:06 -0700 (PDT)
Received: by mail-ot1-x32b.google.com with SMTP id b18-20020a0568303112b02904cf73f54f4bso8424659ots.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jul 2021 09:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/vkJe7iPu6rsdTrj/rwJVM+Dly5WduuMAkiM0NoVcRs=;
        b=tkehq4kLm6OU0/ZCklwHz62NOXlObQgW8EWUpyNQ2S0Q8YbPGeFrp+aL64AyMwAsP0
         TYKEoAxG+iBDEJGeN1+SgfEd6i/MUh3ZH8ch22GfXoK/Sq9ndDX0RmX47cNdYgSoUQmA
         RILjD04PqiwU/I8D67WsqbocBFHTNomMApzp1TwKLtWQbhpOb9yWuNNvBjFkaTt9rPbf
         Nt7OWfj9GmQX/4mG1aDIopaQTy2GBwiaTppNHwBRckuPh1it6uhGvBJ4AP8drg/ltygL
         i3scYALFfjB0bxl8bSrU8M09UiqaSaV/4EVsCgJrHVbIrtWsF/Us1eSa7qUzZ2N4FFOz
         N2Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/vkJe7iPu6rsdTrj/rwJVM+Dly5WduuMAkiM0NoVcRs=;
        b=EZLfAPyBhEap9B3QobaIWajXoZnZRdrPvJ7NfQu4Pxyto9qMUGh9CKEHhQfYoP2yrW
         Df2fyffU2Px1IwG1+VsPrgdQfENcCo4vrqQpgGj/SC3Trqi+AjkoCKNH66Ihdt2YYmKI
         T1yZhrAT4OjJBSOBWN9IT22sjqdruHN/3dq9uXpDdk4cH4+3UmN4ssX3MinpWNWCSD8v
         T2Y1LQOOsJ09QrFikLXTvnXYcXexBl+DaQvKqLFZQH/fXMnscaA6yHOxNZXbSGMbZCqI
         qQvMnkJSSFcxfoApG9oJAZh2gu+draqDioKZz1sx+4Qe00Dv08xWtHJDHopMJ+lreGCL
         /I6A==
X-Gm-Message-State: AOAM532eByCanIn7C7OGJYFkB41DpXptPhhMZUEWQtx+S3mAkJe1qHrI
        EMx1+NnmxSnDkWzJbuvRLuIKjQ==
X-Google-Smtp-Source: ABdhPJyrqDKwsECRQVkzMXTYg0ATE6Lh1vcU0X1FvoL4VMrd25wJ7w3JR+MmjJ1WsmmDQCPVUhGS3A==
X-Received: by 2002:a9d:6c1:: with SMTP id 59mr14779236otx.318.1626796985486;
        Tue, 20 Jul 2021 09:03:05 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 12sm1228504oij.40.2021.07.20.09.03.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jul 2021 09:03:05 -0700 (PDT)
Date:   Tue, 20 Jul 2021 11:03:03 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Caleb Connolly <caleb@connolly.tech>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 3/5] drm/panel/samsung-sofef00: make gpio optional
Message-ID: <YPbztxBh4cCJF8p3@yoga>
References: <20210720153125.43389-1-caleb@connolly.tech>
 <20210720153125.43389-4-caleb@connolly.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210720153125.43389-4-caleb@connolly.tech>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 20 Jul 10:33 CDT 2021, Caleb Connolly wrote:

> The OnePlus 6T panel fails to initialise if it has been reset,
> workaround this by allowing panels to not specify a reset GPIO.
> 
> Signed-off-by: Caleb Connolly <caleb@connolly.tech>
> ---
>  drivers/gpu/drm/panel/panel-samsung-sofef00.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-samsung-sofef00.c b/drivers/gpu/drm/panel/panel-samsung-sofef00.c
> index 8cb1853574bb..a20a5af14653 100644
> --- a/drivers/gpu/drm/panel/panel-samsung-sofef00.c
> +++ b/drivers/gpu/drm/panel/panel-samsung-sofef00.c
> @@ -44,6 +44,8 @@ struct sofef00_panel *to_sofef00_panel(struct drm_panel *panel)
> 
>  static void sofef00_panel_reset(struct sofef00_panel *ctx)
>  {
> +	if (!ctx->reset_gpio)

gpiod_set_value_cansleep(NULL, 1) is a perfectly valid nop, so I don't
think you need to make this conditional.

That said, don't you need this to get the panel out of reset once you
apply power after it being powered off?

> +		return;
>  	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
>  	usleep_range(5000, 6000);
>  	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> @@ -137,7 +139,8 @@ static int sofef00_panel_prepare(struct drm_panel *panel)
>  	ret = sofef00_panel_on(ctx);
>  	if (ret < 0) {
>  		dev_err(dev, "Failed to initialize panel: %d\n", ret);
> -		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +		if (ctx->reset_gpio)

Ditto.


Regards,
Bjorn

> +			gpiod_set_value_cansleep(ctx->reset_gpio, 1);
>  		return ret;
>  	}
> 
> @@ -276,7 +279,7 @@ static int sofef00_panel_probe(struct mipi_dsi_device *dsi)
>  		return ret;
>  	}
> 
> -	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
> +	ctx->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
>  	if (IS_ERR(ctx->reset_gpio)) {
>  		ret = PTR_ERR(ctx->reset_gpio);
>  		dev_warn(dev, "Failed to get reset-gpios: %d\n", ret);
> --
> 2.32.0
> 
> 
