Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1C9E372149
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 May 2021 22:27:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229577AbhECU2Y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 May 2021 16:28:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbhECU2X (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 May 2021 16:28:23 -0400
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 029D4C06174A
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 May 2021 13:27:30 -0700 (PDT)
Received: by mail-qk1-x72e.google.com with SMTP id q127so6468850qkb.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 May 2021 13:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sXfHyvXsdLPfK14t8jsIufOFAbNJOVYacQ8xJhXokuY=;
        b=GGhbF2KWKOjxUeuXFE0kuMeilBQgs774Rzy7nnZReRnuxKT8AayCNx6+DK55HUB8Ts
         yKzYzXXL02g3TV4K0xSOcNKd1+QSTk0wSFCKz5mtTzKXgBamo1n5nCv6zNGqIe0gN+0a
         ikyd6ZrkIasFnou00Q+VV63mjxKda/k2K+HZo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sXfHyvXsdLPfK14t8jsIufOFAbNJOVYacQ8xJhXokuY=;
        b=UkXIc3jier8UjudVQNQWCRMz63KoshpoHwH9B17FbkwEkXB6qtaMeNLExpuJZkMtLT
         sMvxTx3+SDVz7OImnIWi1uRAoNfPAAeTw8JWfiKril2bO8SKGHyKERoG3cw2GApAyFEi
         msz+wyvgmMZ/xau0gybu/RIJWnruEyR06ioYcmFaTKToR2gh0x1vPPglTrx7PQbEFTl/
         yZ0pI7GBfanmlSDV+JHLju2K/l08M/Js62j2xqDPfM5q1W6NLgxUNwwhyQ1scHbu9mm9
         pfYYDA2YxjXEzp28Xy/9Y/7X8JcDPQvLt92CxSw8G3Na7VMyT4KawIJjJMVKeia2o1nH
         IlEg==
X-Gm-Message-State: AOAM530pcg4AVJ9gjVBBx4vDUgaagrFdkhIo3ehCQA2D9O57GOS7yL7a
        AVVyXnD3TIp1XJzd8CzBL/fCmHLQxk5kew==
X-Google-Smtp-Source: ABdhPJyOGMpSpprwDsACrv9zTuhc+KvL7Un0xANVWznKmWykK+X/DREcUmWQrxKSwEHvkv+M/NLX/g==
X-Received: by 2002:a37:30c:: with SMTP id 12mr8177308qkd.355.1620073648658;
        Mon, 03 May 2021 13:27:28 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com. [209.85.219.173])
        by smtp.gmail.com with ESMTPSA id s5sm6515968qkg.88.2021.05.03.13.27.27
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 May 2021 13:27:27 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id r8so9241170ybb.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 May 2021 13:27:27 -0700 (PDT)
X-Received: by 2002:a25:9c86:: with SMTP id y6mr29614256ybo.405.1620073646749;
 Mon, 03 May 2021 13:27:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210423165906.2504169-1-dianders@chromium.org> <20210423095743.v5.14.Ie9daa320d907fff73f893f74b898197e399cce59@changeid>
In-Reply-To: <20210423095743.v5.14.Ie9daa320d907fff73f893f74b898197e399cce59@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 3 May 2021 13:27:15 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UTmOP8LDaf-Tyx17OORQK6pJH6O_w3cP0Bu-KRYaHkYw@mail.gmail.com>
Message-ID: <CAD=FV=UTmOP8LDaf-Tyx17OORQK6pJH6O_w3cP0Bu-KRYaHkYw@mail.gmail.com>
Subject: Re: [PATCH v5 14/20] drm/bridge: ti-sn65dsi86: Promote the AUX
 channel to its own sub-dev
To:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Sam Ravnborg <sam@ravnborg.org>, Lyude Paul <lyude@redhat.com>,
        Thierry Reding <treding@nvidia.com>,
        Linus W <linus.walleij@linaro.org>
Cc:     linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Rob Clark <robdclark@chromium.org>,
        Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Steev Klimaszewski <steev@kali.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Robert Foss <robert.foss@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Wolfram Sang <wsa@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Apr 23, 2021 at 10:00 AM Douglas Anderson <dianders@chromium.org> wrote:
>
> We'd like to be able to expose the DDC-over-AUX channel bus to our
> panel. This gets into a chicken-and-egg problem because:
> - The panel wants to get its DDC at probe time.
> - The ti-sn65dsi86 MIPI-to-eDP bridge code, which provides the DDC
>   bus, wants to get the panel at probe time.
>
> By using a sub device we can fully create the AUX channel bits so that
> the panel can get them. Then the panel can finish probing and the
> bridge can probe.
>
> To accomplish this, we also move registering the AUX channel out of
> the bridge's attach code and do it right at probe time. We use devm to
> manage cleanup.
>
> NOTE: there's a little bit of a trick here. Though the AUX channel can
> run without the MIPI-to-eDP bits of the code, the MIPI-to-eDP bits
> can't run without the AUX channel. We could come up a complicated
> signaling scheme (have the MIPI-to-eDP bits return EPROBE_DEFER for a
> while or wait on some sort of completion), but it seems simple enough
> to just not even bother creating the bridge device until the AUX
> channel probes. That's what we'll do.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
> Changes in v5:
> - Fix module compile problems (Bjorn + kbuild bot)
> - Remove useless MODULE_DEVICE_TABLE (Bjorn).
>
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 87 +++++++++++++++++++++------
>  1 file changed, 67 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 9dc3cd8e17df..3539ddf9d109 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -116,6 +116,7 @@
>   * struct ti_sn65dsi86 - Platform data for ti-sn65dsi86 driver.
>   * @bridge_aux:   AUX-bus sub device for MIPI-to-eDP bridge functionality.
>   * @gpio_aux:     AUX-bus sub device for GPIO controller functionality.
> + * @aux_aux:      AUX-bus sub device for eDP AUX channel functionality.
>   *
>   * @dev:          Pointer to the top level (i2c) device.
>   * @regmap:       Regmap for accessing i2c.
> @@ -148,6 +149,7 @@
>  struct ti_sn65dsi86 {
>         struct auxiliary_device         bridge_aux;
>         struct auxiliary_device         gpio_aux;
> +       struct auxiliary_device         aux_aux;
>
>         struct device                   *dev;
>         struct regmap                   *regmap;
> @@ -484,18 +486,12 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
>                 return -EINVAL;
>         }
>
> -       ret = drm_dp_aux_register(&pdata->aux);
> -       if (ret < 0) {
> -               drm_err(bridge->dev, "Failed to register DP AUX channel: %d\n", ret);
> -               return ret;
> -       }
> -
>         ret = drm_connector_init(bridge->dev, &pdata->connector,
>                                  &ti_sn_bridge_connector_funcs,
>                                  DRM_MODE_CONNECTOR_eDP);
>         if (ret) {
>                 DRM_ERROR("Failed to initialize connector with drm\n");
> -               goto err_conn_init;
> +               return ret;
>         }
>
>         drm_connector_helper_add(&pdata->connector,
> @@ -552,8 +548,6 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
>         mipi_dsi_device_unregister(dsi);
>  err_dsi_host:
>         drm_connector_cleanup(&pdata->connector);
> -err_conn_init:
> -       drm_dp_aux_unregister(&pdata->aux);
>         return ret;
>  }
>
> @@ -1330,11 +1324,6 @@ static int ti_sn_bridge_probe(struct auxiliary_device *adev,
>         if (ret)
>                 return ret;
>
> -       pdata->aux.name = "ti-sn65dsi86-aux";
> -       pdata->aux.dev = pdata->dev;
> -       pdata->aux.transfer = ti_sn_aux_transfer;
> -       drm_dp_aux_init(&pdata->aux);
> -
>         pdata->bridge.funcs = &ti_sn_bridge_funcs;
>         pdata->bridge.of_node = np;
>
> @@ -1429,6 +1418,50 @@ static int ti_sn65dsi86_add_aux_device(struct ti_sn65dsi86 *pdata,
>         return ret;
>  }
>
> +static void ti_sn65dsi86_unregister_dp_aux(void *data)
> +{
> +       drm_dp_aux_unregister(data);
> +}
> +
> +static int ti_sn_aux_probe(struct auxiliary_device *adev,
> +                          const struct auxiliary_device_id *id)
> +{
> +       struct ti_sn65dsi86 *pdata = dev_get_drvdata(adev->dev.parent);
> +       int ret;
> +
> +       pdata->aux.name = "ti-sn65dsi86-aux";
> +       pdata->aux.dev = pdata->dev;
> +       pdata->aux.transfer = ti_sn_aux_transfer;
> +       drm_dp_aux_init(&pdata->aux);
> +
> +       ret = drm_dp_aux_register(&pdata->aux);
> +       if (ret < 0) {
> +               drm_err(pdata, "Failed to register DP AUX channel: %d\n", ret);
> +               return ret;
> +       }
> +       ret = devm_add_action_or_reset(&adev->dev,
> +                                      ti_sn65dsi86_unregister_dp_aux, &pdata->aux);
> +       if (ret)
> +               return ret;
> +
> +       /*
> +        * The eDP to MIPI bridge parts don't work until the AUX channel is
> +        * setup so we don't add it in the main driver probe, we add it now.
> +        */
> +       return ti_sn65dsi86_add_aux_device(pdata, &pdata->bridge_aux, "bridge");
> +}
> +
> +static const struct auxiliary_device_id ti_sn_aux_id_table[] = {
> +       { .name = "ti_sn65dsi86.aux", },
> +       {},
> +};
> +
> +static struct auxiliary_driver ti_sn_aux_driver = {
> +       .name = "aux",
> +       .probe = ti_sn_aux_probe,
> +       .id_table = ti_sn_aux_id_table,
> +};
> +
>  static int ti_sn65dsi86_probe(struct i2c_client *client,
>                               const struct i2c_device_id *id)
>  {
> @@ -1487,10 +1520,11 @@ static int ti_sn65dsi86_probe(struct i2c_client *client,
>          * motiviation here is to solve the chicken-and-egg problem of probe
>          * ordering. The bridge wants the panel to be there when it probes.
>          * The panel wants its HPD GPIO (provided by sn65dsi86 on some boards)
> -        * when it probes. There will soon be other devices (DDC I2C bus, PWM)
> -        * that have the same problem. Having sub-devices allows the some sub
> -        * devices to finish probing even if others return -EPROBE_DEFER and
> -        * gets us around the problems.
> +        * when it probes. The panel and maybe backlight might want the DDC
> +        * bus. Soon the PWM provided by the bridge chip will have the same
> +        * problem. Having sub-devices allows the some sub devices to finish
> +        * probing even if others return -EPROBE_DEFER and gets us around the
> +        * problems.
>          */
>
>         if (IS_ENABLED(CONFIG_OF_GPIO)) {
> @@ -1499,7 +1533,13 @@ static int ti_sn65dsi86_probe(struct i2c_client *client,
>                         return ret;
>         }
>
> -       return ti_sn65dsi86_add_aux_device(pdata, &pdata->bridge_aux, "bridge");
> +       /*
> +        * NOTE: At the end of the AUX channel probe we'll add the aux device
> +        * for the bridge. This is because the bridge can't be used until the
> +        * AUX channel is there and this is a very simple solution to the
> +        * dependency problem.
> +        */
> +       return ti_sn65dsi86_add_aux_device(pdata, &pdata->aux_aux, "aux");
>  }
>
>  static struct i2c_device_id ti_sn65dsi86_id[] = {
> @@ -1536,12 +1576,18 @@ static int __init ti_sn65dsi86_init(void)
>         if (ret)
>                 goto err_main_was_registered;
>
> -       ret = auxiliary_driver_register(&ti_sn_bridge_driver);
> +       ret = auxiliary_driver_register(&ti_sn_aux_driver);
>         if (ret)
>                 goto err_gpio_was_registered;
>
> +       ret = auxiliary_driver_register(&ti_sn_bridge_driver);
> +       if (ret)
> +               goto err_aux_was_registered;
> +
>         return 0;
>
> +err_aux_was_registered:
> +       auxiliary_driver_unregister(&ti_sn_aux_driver);
>  err_gpio_was_registered:
>         ti_sn_gpio_unregister();
>  err_main_was_registered:
> @@ -1554,6 +1600,7 @@ module_init(ti_sn65dsi86_init);
>  static void __exit ti_sn65dsi86_exit(void)
>  {
>         auxiliary_driver_unregister(&ti_sn_bridge_driver);
> +       auxiliary_driver_unregister(&ti_sn_aux_driver);
>         ti_sn_gpio_unregister();
>         i2c_del_driver(&ti_sn65dsi86_driver);
>  }

Ugh, more fun! :(

I tried rebasing this to the latest drm-misc-next and I found commit
6cba3fe43341 ("drm/dp: Add backpointer to drm_device in drm_dp_aux").
That commit makes it pretty explicit that we shouldn't call
drm_dp_aux_register() until we actually have a "drm_dev" for the
bridge.

I'm applying several of the other patches in this series but I won't
apply this one or anything based on it. I'll do some digging and send
out a proposed fix shortly.

-Doug
