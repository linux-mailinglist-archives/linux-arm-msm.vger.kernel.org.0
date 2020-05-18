Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 614131D7E4A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2020 18:22:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727782AbgERQWk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 May 2020 12:22:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727938AbgERQWj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 May 2020 12:22:39 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52124C05BD09
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2020 09:22:39 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id z4so122944wmi.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2020 09:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=h21pn6leaS0udA+6sZ78ZisTbB55GhG4Y4hXmjrbCNk=;
        b=jtq+ZxtjGw+wtB+PoQzf2Zy8k44Nvyst4cTaGBxSsLBiGNiFcdcwYCggaUNSXBTHbP
         C6xsjI4bHaWGTLU7uc45ahTni5fXJFj9fncUXM8sIJwXflk6HJO3GUczzmfXouSR+Q+A
         +BIYwtjcvefIcztkcvZfFJsPGXItC1IEoOL/Yz5oK8angtsjM1jVg+6nOPwtcb/0Ss/c
         ngKNRig/r38qSKmbIBBoMCzWvMayHMJ/cu/eDzQhPltuwHLrGHouCWx8Ge+U2NnNouo3
         Tv6KjvptIZ2Sd4TOC91xAkTRpKVAj+cHXvrhpvgkpOQLuzFhoRRngdKp30A2z0kRd5cE
         w3bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=h21pn6leaS0udA+6sZ78ZisTbB55GhG4Y4hXmjrbCNk=;
        b=uHfxBfWtJAT52xVMTO+/Cho48sqgvbSQuu4INus16uju2MRsSZJNsHSm1IHGlpMqq8
         nucKOa/OZc6yA73nrI9JlIX+c8fsxJlCuMW73m7Cq8oZPS5MYdnv59pBtoV6LyH+QZbp
         W23wSVWRESZQbE+Jdm0gHKTYFqREWhHazCRqf/0kJafx+SRkVM1CUdzgbM7+EKLRTvC1
         c97cne3lj2dRKsLKh6WdUlLjzzI13TXvy6sfKaL64LEuMS0SO1Q9R2r91QGZK8ZMSRW1
         866S2Qc7jf9s/k3+e4HmbVGkuRRaE58/Z8ZeekAAZzRCIsYNQX34QHh5AyfPHdmX6Q6U
         JYoQ==
X-Gm-Message-State: AOAM532BnNAC7jaPxESlCNLcSS/pOCgLkuuc1IvvAdAfC43nxi2A6vzj
        0xBAB20dxeeRB/ghtSbKgeY+Yg==
X-Google-Smtp-Source: ABdhPJxo15H/x7EEu/9WMN/iuxjvzEmsBbPIXj17etTJA8QzpdJAzwsllFGjEWc6leX17MJxQrFDtw==
X-Received: by 2002:a1c:9989:: with SMTP id b131mr164743wme.176.1589818957967;
        Mon, 18 May 2020 09:22:37 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id w13sm16554687wrm.28.2020.05.18.09.22.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 09:22:37 -0700 (PDT)
Date:   Mon, 18 May 2020 17:22:35 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Andy Gross <agross@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Douglas Anderson <dianders@chromium.org>,
        Jani Nikula <jani.nikula@intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pwm@vger.kernel.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Michael Hennerich <michael.hennerich@analog.com>,
        patches@opensource.cirrus.com,
        Russell King <linux@armlinux.org.uk>,
        Support Opensource <support.opensource@diasemi.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v2 10/16] backlight: drop extern from prototypes
Message-ID: <20200518162235.nn4zuv3uuteaq36k@holly.lan>
References: <20200517190139.740249-1-sam@ravnborg.org>
 <20200517190139.740249-11-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200517190139.740249-11-sam@ravnborg.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, May 17, 2020 at 09:01:33PM +0200, Sam Ravnborg wrote:
> No need to put "extern" in front of prototypes.
> While touching the prototypes adjust indent to follow
> the kernel style.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>



> ---
>  include/linux/backlight.h | 35 +++++++++++++++++++----------------
>  1 file changed, 19 insertions(+), 16 deletions(-)
> 
> diff --git a/include/linux/backlight.h b/include/linux/backlight.h
> index eae7a5e66248..308aec67fa4f 100644
> --- a/include/linux/backlight.h
> +++ b/include/linux/backlight.h
> @@ -444,22 +444,25 @@ static inline bool backlight_is_blank(struct backlight_device *bd)
>  	       bd->props.state & (BL_CORE_SUSPENDED | BL_CORE_FBBLANK);
>  }
>  
> -extern struct backlight_device *backlight_device_register(const char *name,
> -	struct device *dev, void *devdata, const struct backlight_ops *ops,
> -	const struct backlight_properties *props);
> -extern struct backlight_device *devm_backlight_device_register(
> -	struct device *dev, const char *name, struct device *parent,
> -	void *devdata, const struct backlight_ops *ops,
> -	const struct backlight_properties *props);
> -extern void backlight_device_unregister(struct backlight_device *bd);
> -extern void devm_backlight_device_unregister(struct device *dev,
> -					struct backlight_device *bd);
> -extern void backlight_force_update(struct backlight_device *bd,
> -				   enum backlight_update_reason reason);
> -extern int backlight_register_notifier(struct notifier_block *nb);
> -extern int backlight_unregister_notifier(struct notifier_block *nb);
> -extern struct backlight_device *backlight_device_get_by_type(enum backlight_type type);
> -extern int backlight_device_set_brightness(struct backlight_device *bd, unsigned long brightness);
> +struct backlight_device *
> +backlight_device_register(const char *name, struct device *dev, void *devdata,
> +			  const struct backlight_ops *ops,
> +			  const struct backlight_properties *props);
> +struct backlight_device *
> +devm_backlight_device_register(struct device *dev, const char *name,
> +			       struct device *parent, void *devdata,
> +			       const struct backlight_ops *ops,
> +			       const struct backlight_properties *props);
> +void backlight_device_unregister(struct backlight_device *bd);
> +void devm_backlight_device_unregister(struct device *dev,
> +				      struct backlight_device *bd);
> +void backlight_force_update(struct backlight_device *bd,
> +			    enum backlight_update_reason reason);
> +int backlight_register_notifier(struct notifier_block *nb);
> +int backlight_unregister_notifier(struct notifier_block *nb);
> +struct backlight_device *backlight_device_get_by_type(enum backlight_type type);
> +int backlight_device_set_brightness(struct backlight_device *bd,
> +				    unsigned long brightness);
>  
>  #define to_backlight_device(obj) container_of(obj, struct backlight_device, dev)
>  
> -- 
> 2.25.1
> 
