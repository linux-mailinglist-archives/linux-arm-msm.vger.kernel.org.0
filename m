Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22A501D7DBE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2020 18:04:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727020AbgERQEt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 May 2020 12:04:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727777AbgERQEs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 May 2020 12:04:48 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61686C05BD09
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2020 09:04:48 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id i15so12472153wrx.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2020 09:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=YP8CIZVjkkHF2G0WX+WhQCb99+RXsj9eHVsB1xIYlDI=;
        b=iOGhTJKYxRyBmpnPYcOpuh0C1+CJnkg4S++Jh+yKaD7pVGeDnZYU9er35/bOk37Bqe
         kgZqGbDMSeGsQOzKfYNnDtoruFmL7pc6khugd9Zel6TlNeCOYuBfTdLCA68Y/ZIDHFmu
         RZ/iGj0XqPfgyNg59+qkCWZOL5Z8DC45MfpQ+g0kx2DqLHfMFZCm2xSF8rpNpO7ljpFb
         sknr2cUsEoCXXlS6FlBtUar6I6lhst8bUG2kYwbbKCXmEMfToo/EVMIBanLd9WgfVUdC
         U49r5NM+AX1WMt2t3EFt0BtOZbU5WxOWFWTXWgvYtK4T+kTAcfQ9ZLdiIc0/GWw0uifU
         2tIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YP8CIZVjkkHF2G0WX+WhQCb99+RXsj9eHVsB1xIYlDI=;
        b=uZOVfsk7vhyQVBKKssx8uNFz6sr5Lf66enzVJPKYvtLMC6DplGDxkR+cYXOkZSgb6q
         wqvPG0nSISt6lEF2Ax20whfDi1lo1pNcWGFbVvYgUUKRM/iEMNXE5KDTI/H6ayYxZGNR
         5i5ii8xHdsMLq6rPRHVuO13gxNeW8wipBDnOamMvUw6FSdcSuks3N8sU0LQ7f2i3yHzD
         i7ujakYo2T9pvsgtuwfoz/mzCFDfn1QuyW6dyMduOSyuwSTBidgrrK3YqNC5NLqKHFt/
         8QGtANShp4ptD6UBq3EvPUlYCxqTe5iAlu9YbUdi8msHQtlkry4Ao15X3VA1ATDjs8LA
         x+LA==
X-Gm-Message-State: AOAM533fOY7B82cB5cZO4tf0aGhanaqL0W1QdEzqyxlTQXHm/LaMO4dk
        CO85vJ97zXTsOT+xVtJllkEVqg==
X-Google-Smtp-Source: ABdhPJzvNP6Gmw/v+NTHrtZ9cGIGmEaLhbGhqaJPSjy5MpKyEdqde80GInq/3Ai1iSjkpQfKhVnU7A==
X-Received: by 2002:a5d:6412:: with SMTP id z18mr20016286wru.290.1589817887106;
        Mon, 18 May 2020 09:04:47 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id c17sm17357566wrn.59.2020.05.18.09.04.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 09:04:46 -0700 (PDT)
Date:   Mon, 18 May 2020 17:04:44 +0100
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
Subject: Re: [PATCH v2 07/16] backlight: document inline functions in
 backlight.h
Message-ID: <20200518160444.huxyjm2wxajnyfmx@holly.lan>
References: <20200517190139.740249-1-sam@ravnborg.org>
 <20200517190139.740249-8-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200517190139.740249-8-sam@ravnborg.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, May 17, 2020 at 09:01:30PM +0200, Sam Ravnborg wrote:
> Add documentation for the inline functions in backlight.h
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>
> ---
>  include/linux/backlight.h | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/include/linux/backlight.h b/include/linux/backlight.h
> index e2d72936bf05..98349a2984dc 100644
> --- a/include/linux/backlight.h
> +++ b/include/linux/backlight.h
> @@ -283,6 +283,10 @@ struct backlight_device {
>  	int use_count;
>  };
>  
> +/**
> + * backlight_update_status - force an update of the backligt device status

Typo.

Other than that,

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.

> + * @bd: the backlight device
> + */
>  static inline int backlight_update_status(struct backlight_device *bd)
>  {
>  	int ret = -ENOENT;
> @@ -375,6 +379,18 @@ extern int backlight_device_set_brightness(struct backlight_device *bd, unsigned
>  
>  #define to_backlight_device(obj) container_of(obj, struct backlight_device, dev)
>  
> +/**
> + * bl_get_data - access devdata
> + * @bl_dev: pointer to backlight device
> + *
> + * When a backlight device is registered the driver has the possibility
> + * to supply a void * devdata. bl_get_data() return a pointer to the
> + * devdata.
> + *
> + * RETURNS:
> + *
> + * pointer to devdata stored while registering the backlight device.
> + */
>  static inline void * bl_get_data(struct backlight_device *bl_dev)
>  {
>  	return dev_get_drvdata(&bl_dev->dev);
> -- 
> 2.25.1
> 
