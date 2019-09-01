Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4DA83A4A8F
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Sep 2019 18:28:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728912AbfIAQ2w (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 1 Sep 2019 12:28:52 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:38601 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728830AbfIAQ2w (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 1 Sep 2019 12:28:52 -0400
Received: by mail-ed1-f67.google.com with SMTP id r12so13601282edo.5
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Sep 2019 09:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rMFWYzKAvQHl6RRkEWOczDOVcZVclqiQe9OAjnrHx4M=;
        b=PUobBbYDHgeFaMdP7loZ2rjzUBh3I4JtzmMLFmjAMRs924eydJV8bUsoexsRdaebpn
         J9cGk/GxVxFnJcLcYysR7QG8k8SonpwzvNyuUfuzSgvnHhtnh+hxGZCeNG+QNrdrMO3G
         ZHgN5w7KonFf3h7y93vitlLFMJt9/H/XgWcf4w4KsWTKDu1RH+9OvrCnok2iMx+dHkGJ
         FqPGIylo78v4Q20nGkWrh+xNfFJVj1YxZPWKq95oMNQyZPCxRomuDP79JXjHKjPHFXqk
         F5doR72SDwxd5MbWcbdnkOz0fOalwAUJvnqZE1eiwCnku0Foz2kign1EKentqIuQWdrw
         rJTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rMFWYzKAvQHl6RRkEWOczDOVcZVclqiQe9OAjnrHx4M=;
        b=dlpOOpcLIARopWwSa9hdsVLL3fm0dxzOGKsLL09fftYIAVDbWMTbS0kIqUuYkdpWNV
         weduMTlTxjlRPgLD7Ow/5ZtOXP44X4W2GmLNLZ4lfwZIFbuItxTcoqpZSj+F9Pd15Hnf
         q5KSjeiEzHs2G6Jkw+ZS8oSdwKV162/iJmegkt0EfkeZ7LYT4NgBhKOC+Ml3or7vL6eV
         LdI9+5y5Iof9T6ECi8mqkQDNC7BVEwAA/Ou1xXuDC7ai8bRhDfvxEz/ATCFY8WYEla9e
         WZ46dv0S+rSX1UM3JJqBd21eiFZIK7CoTwto5BCGSdVlWyJhVKf0f2fuqqEEaykVOmOr
         bxCg==
X-Gm-Message-State: APjAAAVNWMGZqc4XA334QQAsq8VfVZW1pVoiI3HErGY7aqDWdpOvYnM0
        z5OsE7sCoMrMm1RatQBx8ZIdWAgsipLGWFrDw15oJcfj
X-Google-Smtp-Source: APXvYqzSuYkXJzwtaaQNndbjCRAgIuRfoQD1ZI05I7q5aV2Cuk+3ONDPslZByaWf8FOvUglhRXGdD2wNVNOmvKpHTS4=
X-Received: by 2002:a17:906:a3d5:: with SMTP id ca21mr149938ejb.258.1567355329734;
 Sun, 01 Sep 2019 09:28:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190823073448.8385-1-linus.walleij@linaro.org> <20190823073448.8385-5-linus.walleij@linaro.org>
In-Reply-To: <20190823073448.8385-5-linus.walleij@linaro.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Sun, 1 Sep 2019 09:28:38 -0700
Message-ID: <CAF6AEGvPtoEfAsB0KSP3ydmHGTdwnnM--Ru+dUY+7EEpw_8v_g@mail.gmail.com>
Subject: Re: [PATCH 5/6 v2] drm/msm/hdmi: Bring up HDMI connector OFF
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Sean Paul <sean@poorly.run>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Brian Masney <masneyb@onstation.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Aug 23, 2019 at 12:35 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> There is elaborate code in the HDMI connector handling to
> leave the connector in the state it was at power-on and
> only touch the GPIOs when the connector .enable() and
> .disable() callbacks are called.
>
> I don't think this is what we normally want, initialize
> the connector as OFF (possibly saving power?) using the
> appropriate GPIO descriptor flags. It will still be
> switched on/off in the enable()/disable() connector
> callback as before, but we can drop some strange surplus
> code.

I'm picking up the earlier patches in this series.. although I won't
have a good way to test on devices which use the hdmi block for a few
weeks (when I complete my move, and get back a bunch of boards that
are in boxes right now) so I'm going to wait on the last two I think.

When we get to dealing with devices with hdmi enabled by bootloader,
we may actually want to preserve the pre-probe state of the GPIOs.
Although maybe not worth worrying about until we can handle DSI
enabled at boot.

BR,
-R

>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: freedreno@lists.freedesktop.org
> Reviewed-by: Brian Masney <masneyb@onstation.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v1->v2:
> - Rebased on v5.3-rc1
> - Collected review tag
> ---
>  drivers/gpu/drm/msm/hdmi/hdmi.c           | 19 ++++++++++++-----
>  drivers/gpu/drm/msm/hdmi/hdmi_connector.c | 25 ++++++-----------------
>  2 files changed, 20 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
> index 355afb936401..5739eec65659 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
> @@ -552,13 +552,22 @@ static int msm_hdmi_bind(struct device *dev, struct device *master, void *data)
>         for (i = 0; i < HDMI_MAX_NUM_GPIO; i++) {
>                 const char *name = msm_hdmi_gpio_pdata[i].name;
>                 struct gpio_desc *gpiod;
> +               enum gpiod_flags flags;
>
>                 /*
> -                * We are fetching the GPIO lines "as is" since the connector
> -                * code is enabling and disabling the lines. Until that point
> -                * the power-on default value will be kept.
> +                * Notice the inverse set up here: we initialize the connector
> +                * to OFF state.
>                  */
> -               gpiod = devm_gpiod_get_optional(dev, name, GPIOD_ASIS);
> +               if (msm_hdmi_gpio_pdata[i].output) {
> +                       if (msm_hdmi_gpio_pdata[i].value)
> +                               flags = GPIOD_OUT_LOW;
> +                       else
> +                               flags = GPIOD_OUT_HIGH;
> +               } else {
> +                       flags = GPIOD_IN;
> +               }
> +
> +               gpiod = devm_gpiod_get_optional(dev, name, flags);
>                 /* This will catch e.g. -PROBE_DEFER */
>                 if (IS_ERR(gpiod))
>                         return PTR_ERR(gpiod);
> @@ -572,7 +581,7 @@ static int msm_hdmi_bind(struct device *dev, struct device *master, void *data)
>                          * in the upstream bindings.
>                          */
>                         if (sscanf(name, "qcom,hdmi-tx-%s", name3))
> -                               gpiod = devm_gpiod_get_optional(dev, name3, GPIOD_ASIS);
> +                               gpiod = devm_gpiod_get_optional(dev, name3, flags);
>                         if (IS_ERR(gpiod))
>                                 return PTR_ERR(gpiod);
>                         if (!gpiod)
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_connector.c b/drivers/gpu/drm/msm/hdmi/hdmi_connector.c
> index d0575d4f747d..f006682935e9 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi_connector.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi_connector.c
> @@ -75,16 +75,9 @@ static int gpio_config(struct hdmi *hdmi, bool on)
>                 for (i = 0; i < HDMI_MAX_NUM_GPIO; i++) {
>                         struct hdmi_gpio_data gpio = config->gpios[i];
>
> -                       if (gpio.gpiod) {
> -                               if (gpio.output) {
> -                                       gpiod_direction_output(gpio.gpiod,
> -                                                              gpio.value);
> -                               } else {
> -                                       gpiod_direction_input(gpio.gpiod);
> -                                       gpiod_set_value_cansleep(gpio.gpiod,
> -                                                                gpio.value);
> -                               }
> -                       }
> +                       /* The value indicates the value for turning things on */
> +                       if (gpio.gpiod)
> +                               gpiod_set_value_cansleep(gpio.gpiod, gpio.value);
>                 }
>
>                 DBG("gpio on");
> @@ -92,16 +85,10 @@ static int gpio_config(struct hdmi *hdmi, bool on)
>                 for (i = 0; i < HDMI_MAX_NUM_GPIO; i++) {
>                         struct hdmi_gpio_data gpio = config->gpios[i];
>
> -                       if (!gpio.gpiod)
> -                               continue;
> -
> -                       if (gpio.output) {
> -                               int value = gpio.value ? 0 : 1;
> -
> -                               gpiod_set_value_cansleep(gpio.gpiod, value);
> -                       }
> +                       /* The inverse value turns stuff off */
> +                       if (gpio.gpiod && gpio.output)
> +                               gpiod_set_value_cansleep(gpio.gpiod, !gpio.value);
>                 };
> -
>                 DBG("gpio off");
>         }
>
> --
> 2.21.0
>
