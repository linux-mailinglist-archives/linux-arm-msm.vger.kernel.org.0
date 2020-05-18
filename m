Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 186D81D7F26
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2020 18:50:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728470AbgERQuo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 May 2020 12:50:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726958AbgERQuo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 May 2020 12:50:44 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08D99C061A0C
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2020 09:50:44 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id w7so12633000wre.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2020 09:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=BdW89KVUrfgJZgJ6lFQwQ5B2siSxs0MlWvrsl3aUQvQ=;
        b=kyAoq1KRo6MAV61Q5tg0wLc1p7tEFFGM9R1ue2/8u5qXYjgnOMfFMq2+VHjUopZxUE
         hNwkvfIh6pLFNnvXrcmBW1+67wD6TWvuEohaowOSAcNnMqfaec+9mCC3UifrTn6DKq4M
         zNp47EWNQpzTFKO/Bi26pxmQ5fSWHCYiF+3yzgKP5JC5NhHJGTETi+b8zUAaLD3zNIcU
         cmu2QwQOGNnfevQqsaxnRfFi7Xu7DRu6IhBsEKE4EYZumKv62GY3NjicT5Xrhs0DeF63
         z7ZlNqwgdXA4FVYyRhaNtapFsuZMyzJcEzLrohOHDnUB2MVZrSBHWdLXyBO2dqOYLvpe
         nTCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BdW89KVUrfgJZgJ6lFQwQ5B2siSxs0MlWvrsl3aUQvQ=;
        b=Fn6Ly6hpCESQGFDW0cJoYyWhJzcW2ranzjhvLfb31j8QAthhuz3A1uEfun7/Pk5vtp
         NCMl6UjmItBG9YooWDkqWxsr9LN1xq3UXCB5qV+H1VO7owxaItHU44xB5XjOyv854AbS
         yCxWh3vMxJz0f4SCon9Q1QlYp7QKOQZN0wexe5G/l7P7NUMVtSaU0rKQl2xJRj2pDd0t
         StGwxuXC3Z4nFeeX0XlFz8WXFlDFH3VIv9zSVfh2digEPKScKvA/O8AIbiPccapEE+0C
         7mjtPpEy5/UdArS06/Rg/anyYPkuxbS1XANCnpbi/0X1kQxca8tQHxT8syJzHSB3DJ7t
         rmtg==
X-Gm-Message-State: AOAM532WF2B63PoIo17dbAKjKzeW1MGjxPuh9JpHxY8dsdg6bXZR7h+l
        892iTM2SgfqETnGQl+algzm5Og==
X-Google-Smtp-Source: ABdhPJx5yS9SSHVUTWVYS7UghxQM9AekWaDO8lrmLR36Nmb3f1pPvSwvNzKB+hZoMPyglpPGPYxrww==
X-Received: by 2002:adf:fb08:: with SMTP id c8mr21082644wrr.421.1589820642769;
        Mon, 18 May 2020 09:50:42 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id w13sm16641638wrm.28.2020.05.18.09.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 09:50:42 -0700 (PDT)
Date:   Mon, 18 May 2020 17:50:40 +0100
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
        Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>,
        Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2 12/16] backlight: wire up kernel-doc documentation
Message-ID: <20200518165040.4es3gdydes4so72k@holly.lan>
References: <20200517190139.740249-1-sam@ravnborg.org>
 <20200517190139.740249-13-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200517190139.740249-13-sam@ravnborg.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, May 17, 2020 at 09:01:35PM +0200, Sam Ravnborg wrote:
> Include backlight so the documentation is now generated
> with make htmldocs and friends.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Jonathan Corbet <corbet@lwn.net>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


> ---
>  Documentation/gpu/backlight.rst | 12 ++++++++++++
>  Documentation/gpu/index.rst     |  1 +
>  2 files changed, 13 insertions(+)
>  create mode 100644 Documentation/gpu/backlight.rst
> 
> diff --git a/Documentation/gpu/backlight.rst b/Documentation/gpu/backlight.rst
> new file mode 100644
> index 000000000000..9ebfc9d0aced
> --- /dev/null
> +++ b/Documentation/gpu/backlight.rst
> @@ -0,0 +1,12 @@
> +=================
> +Backlight support
> +=================
> +
> +.. kernel-doc:: drivers/video/backlight/backlight.c
> +   :doc: overview
> +
> +.. kernel-doc:: include/linux/backlight.h
> +   :internal:
> +
> +.. kernel-doc:: drivers/video/backlight/backlight.c
> +   :export:
> diff --git a/Documentation/gpu/index.rst b/Documentation/gpu/index.rst
> index 1fcf8e851e15..c9a51e3bfb5a 100644
> --- a/Documentation/gpu/index.rst
> +++ b/Documentation/gpu/index.rst
> @@ -12,6 +12,7 @@ Linux GPU Driver Developer's Guide
>     drm-uapi
>     drm-client
>     drivers
> +   backlight
>     vga-switcheroo
>     vgaarbiter
>     todo
> -- 
> 2.25.1
> 
