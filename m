Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFA1E3996B8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jun 2021 02:07:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229611AbhFCAIv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Jun 2021 20:08:51 -0400
Received: from mail-qv1-f52.google.com ([209.85.219.52]:40743 "EHLO
        mail-qv1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229568AbhFCAIu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Jun 2021 20:08:50 -0400
Received: by mail-qv1-f52.google.com with SMTP id u13so2332369qvt.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jun 2021 17:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YY+50g2xbLmTItDZeExpa+h7sZUgks1PFFwjtEST29Q=;
        b=J+RLM6Uw8pkvedBwVfvy74tpdAUeGO0e98yDe55RjmvPdGbEjR6u0YMprrOSWzv3gF
         nSSv8X3pRykeUkcdrSaK1I/MQnjUdHw2otek61i8OwYCHm1bImLbRjDGt31WKPYg3vHX
         5OugkfuCie6rZleuvOlKW129DU0L59AeD354c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YY+50g2xbLmTItDZeExpa+h7sZUgks1PFFwjtEST29Q=;
        b=rlz99JMgceqBOYyAndpAbTAmTEIkpEbOcHIZA8Ham2+hO5QI5c00d96FLhJMUoUJhA
         aZNUdXcQnJPipZGZVie8wKuYCaCPa0Uu0seshMyfWFVW6l+QgGQDZaLbSSWTgFO0V6to
         +f6o2AWREzDpY8rnjKjna/HsQL2HcL7t1DhkOZPINKYuJStiT2KON56QrQxpPF9nocKx
         oXOT/zlenmC1ZMyiWf61mJUYA1I0JqI94243i0p4jC0yx5LDTgQLsd8wEsbtZfvMtH3S
         0PcFPBe0JPV34RSlYUrrMd0T6mFofupMWuhU513o35ilAM+br6yMSml2dCZW9VTBLG3C
         G3ew==
X-Gm-Message-State: AOAM530J1q9lApuRcWPYU43SSgGMcjQyr823uOmXAv/6HhW3KDHz/oPz
        twb7MrfUm0NMBclycTGlYcyOj6U0Nm5Y3A==
X-Google-Smtp-Source: ABdhPJyUIchjImhwDLfI0p+HB4G93MkM7dk1V7xaa+sU9ueU+L5PkS6p3pIRkb8nLzP92iUheWmS6w==
X-Received: by 2002:a05:6214:19ed:: with SMTP id q13mr23885980qvc.13.1622678755899;
        Wed, 02 Jun 2021 17:05:55 -0700 (PDT)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com. [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id l65sm887596qke.7.2021.06.02.17.05.54
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jun 2021 17:05:54 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id b9so6265068ybg.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jun 2021 17:05:54 -0700 (PDT)
X-Received: by 2002:a25:2345:: with SMTP id j66mr42352856ybj.343.1622678753835;
 Wed, 02 Jun 2021 17:05:53 -0700 (PDT)
MIME-Version: 1.0
References: <1622390172-31368-1-git-send-email-rajeevny@codeaurora.org> <1622390172-31368-4-git-send-email-rajeevny@codeaurora.org>
In-Reply-To: <1622390172-31368-4-git-send-email-rajeevny@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 2 Jun 2021 17:05:42 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UncbMRcrJmMiCNT6YSoSGzENnmwfEBqmV2aEGXO5mA+Q@mail.gmail.com>
Message-ID: <CAD=FV=UncbMRcrJmMiCNT6YSoSGzENnmwfEBqmV2aEGXO5mA+Q@mail.gmail.com>
Subject: Re: [v5 3/5] drm/panel-simple: Support for delays between GPIO & regulator
To:     Rajeev Nandan <rajeevny@codeaurora.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Rob Clark <robdclark@gmail.com>, Lyude Paul <lyude@redhat.com>,
        Jani Nikula <jani.nikula@intel.com>,
        Rob Herring <robh@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        "Kristian H. Kristensen" <hoegsberg@chromium.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Sean Paul <seanpaul@chromium.org>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        Krishna Manikandan <mkrishn@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Sun, May 30, 2021 at 8:57 AM Rajeev Nandan <rajeevny@codeaurora.org> wrote:
>
> Some panels datasheets may specify a delay between the enable GPIO and
> the regulator. Support this in panel-simple.
>
> Signed-off-by: Rajeev Nandan <rajeevny@codeaurora.org>
> ---
>
> Changes in v4:
> - New
>
> Changes in v5:
> - Update description (Douglas)
> - Warn if "power_to_enable" or "disable_to_power_off" is non-zero and panel->enable_gpio
>   is NULL (Douglas)
>
>  drivers/gpu/drm/panel/panel-simple.c | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 047fad5..e3f5b7e 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -133,6 +133,22 @@ struct panel_desc {
>                 unsigned int prepare_to_enable;
>
>                 /**
> +                * @delay.power_to_enable: Time for the power to enable the display on.
> +                *
> +                * The time (in milliseconds) to wait after powering up the display
> +                * before asserting its enable pin.
> +                */
> +               unsigned int power_to_enable;
> +
> +               /**
> +                * @delay.disable_to_power_off: Time for the disable to power the display off.
> +                *
> +                * The time (in milliseconds) to wait before powering off the display
> +                * after deasserting its enable pin.
> +                */
> +               unsigned int disable_to_power_off;
> +
> +               /**
>                  * @delay.enable: Time for the panel to display a valid frame.
>                  *
>                  * The time (in milliseconds) that it takes for the panel to
> @@ -347,6 +363,10 @@ static int panel_simple_suspend(struct device *dev)
>         struct panel_simple *p = dev_get_drvdata(dev);
>
>         gpiod_set_value_cansleep(p->enable_gpio, 0);
> +
> +       if (p->desc->delay.disable_to_power_off)
> +               msleep(p->desc->delay.disable_to_power_off);
> +
>         regulator_disable(p->supply);
>         p->unprepared_time = ktime_get();
>
> @@ -407,6 +427,9 @@ static int panel_simple_prepare_once(struct panel_simple *p)
>                 return err;
>         }
>
> +       if (p->desc->delay.power_to_enable)
> +               msleep(p->desc->delay.power_to_enable);
> +
>         gpiod_set_value_cansleep(p->enable_gpio, 1);
>
>         delay = p->desc->delay.prepare;
> @@ -782,6 +805,11 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc,
>                 break;
>         }
>
> +       if (!panel->enable_gpio && desc->delay.disable_to_power_off)
> +               dev_warn(dev, "Specify enable_gpio when using disable_to_power_off delay\n");
> +       if (!panel->enable_gpio && desc->delay.power_to_enable)
> +               dev_warn(dev, "Specify enable_gpio when using power_to_enable delay\n");

Last nit is that the warning messages could be a little confusing to
someone reading the logs. I guess the target audience of the error
message is probably someone doing bringup. That person specified a
panel in their device tree and maybe isn't even aware that they're
using "disable_to_power_off" or "power_to_enable". Maybe wording
instead:

Need a delay after disabling panel GPIO, but a GPIO wasn't provided.
Need a delay after enabling panel GPIO, but a GPIO wasn't provided.

That's definitely getting into nittiness, though and I wouldn't be
upset if the patch landed with the existing messages. Thus, with or
without the change to the error message:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
