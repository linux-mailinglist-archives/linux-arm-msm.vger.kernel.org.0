Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB2AC1D3DBA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2020 21:41:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728334AbgENTlW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 May 2020 15:41:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728187AbgENTlW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 May 2020 15:41:22 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC9CDC061A0C
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2020 12:41:20 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id u188so151630wmu.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2020 12:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=NFCWAEu05B4EVTuscfDYGoNeadlz+Kx9w9Y5eJvPttc=;
        b=iiMsiC+mv/wgW8vole6F8NN4cEtIXPvO0pSRH18Z9qVdXjuaSJnnDp9RkqXhzJ+Qt3
         2EhRuywExWkh2CmcncaOfPNzSP4bIY/pKSEdh/sRcGiInH8zjYAIpRs7Y3injlZP7Ndx
         hV83PYAdgnTRVurii3t5KVdNlPKufu+e1UoR4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NFCWAEu05B4EVTuscfDYGoNeadlz+Kx9w9Y5eJvPttc=;
        b=bezNFoULORJ+3OBoeSuLl34e/e00lUfn95lbQwgedyJkN/IGkojOiY1h9SMWF6l/T6
         f7e0aS+jbsA4IftdGpdrUBztNtkJiDMftBllJj3tHA8IJzqlAJMf1LlUT8QShiltSO1J
         lCEt4NccyUPvElM+lTkGiwK/h3Glii9dYoUgqwGlsQh//mdMtA2PPZ/b30WG8LKMcHQF
         hZca7TkwavWWB300j5gInSNs5HuPOSdPbjwGxDbB7axXtzb1EJ0H3tuh4NYNmcclRQ/p
         4wdDoGy/BOoSFeZ7YpjO2jnWU+F6Un68Cuht3Mt7RqfYfFG6Cien2oy+g0tEryaBrw/c
         mfnw==
X-Gm-Message-State: AOAM530GSS8hwPVBOY1kf35sqdMKHia4IuqlBQSegqP44ek0xggCt6sC
        QjsXRj1GWiySNsseuOkYu5KcmA==
X-Google-Smtp-Source: ABdhPJwFpfjqo8vtjxSzoQQvQrMS4vYTIbF1RS6H6blsGaggnazJUNp8mnWAkPEh3BAF2LXxL3D5Zw==
X-Received: by 2002:a1c:5985:: with SMTP id n127mr9963996wmb.64.1589485279605;
        Thu, 14 May 2020 12:41:19 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id c125sm125672wma.23.2020.05.14.12.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 12:41:18 -0700 (PDT)
Date:   Thu, 14 May 2020 21:41:16 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Allison Randal <allison@lohutok.net>,
        Andy Gross <agross@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Douglas Anderson <dianders@chromium.org>,
        Enrico Weigelt <info@metux.net>,
        Jani Nikula <jani.nikula@intel.com>,
        Jonathan Corbet <corbet@lwn.net>, Jyri Sarha <jsarha@ti.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Kefeng Wang <wangkefeng.wang@huawei.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pwm@vger.kernel.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Michael Hennerich <michael.hennerich@analog.com>,
        patches@opensource.cirrus.com,
        Russell King <linux@armlinux.org.uk>,
        Support Opensource <support.opensource@diasemi.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Uwe Kleine Konig <u.kleine-koenig@pengutronix.de>,
        Zheng Bin <zhengbin13@huawei.com>
Subject: Re: [PATCH v1 08/18] backlight: add backlight_is_blank()
Message-ID: <20200514194116.GB206103@phenom.ffwll.local>
References: <20200514191001.457441-1-sam@ravnborg.org>
 <20200514191001.457441-9-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200514191001.457441-9-sam@ravnborg.org>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, May 14, 2020 at 09:09:51PM +0200, Sam Ravnborg wrote:
> The backlight support has two properties that express the state:
> - power
> - state
> 
> It is un-documented and easy to get wrong.
> Add backlight_is_blank() helper to make it simpler for drivers
> to get the check of the state correct.
> 
> A lot of drivers also includes checks for fb_blank.
> This check is redundant when the state is checked
> as thus not needed in this helper function.
> Rolling out this helper to all relevant backlight drivers
> will eliminate almost all accesses to fb_blank.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>
> ---
>  include/linux/backlight.h | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/include/linux/backlight.h b/include/linux/backlight.h
> index b7839ea9d00a..e67e926de1e2 100644
> --- a/include/linux/backlight.h
> +++ b/include/linux/backlight.h
> @@ -165,6 +165,23 @@ static inline int backlight_disable(struct backlight_device *bd)
>  	return backlight_update_status(bd);
>  }
>  
> +/**
> + * backlight_is_blank - Return true if display is expected to be blank
> + * @bd: the backlight device
> + *
> + * Display is expected to be blank if any of these is true::
> + *
> + *   1) if power in not UNBLANK
> + *   2) if state indicate BLANK or SUSPENDED
> + *
> + * Returns true if display is expected to be blank, false otherwise.
> + */
> +static inline bool backlight_is_blank(struct backlight_device *bd)
> +{
> +	return bd->props.power != FB_BLANK_UNBLANK ||
> +	       bd->props.state & (BL_CORE_SUSPENDED | BL_CORE_FBBLANK);

This definition here doesn't match backlight_enabled/disable() functions
we added. I think to avoid lots of pondering and surprises we should try
to make sure these are all matching, so that once we rolled them out
everywhere, we can just replace the complicated state with one flag.
-Daniel

> +}
> +
>  extern struct backlight_device *backlight_device_register(const char *name,
>  	struct device *dev, void *devdata, const struct backlight_ops *ops,
>  	const struct backlight_properties *props);
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
