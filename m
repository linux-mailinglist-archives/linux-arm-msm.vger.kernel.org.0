Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44EBE3EA961
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Aug 2021 19:23:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235642AbhHLRW4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Aug 2021 13:22:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235526AbhHLRW4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Aug 2021 13:22:56 -0400
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com [IPv6:2607:f8b0:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE7C3C061756
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Aug 2021 10:22:30 -0700 (PDT)
Received: by mail-il1-x134.google.com with SMTP id i13so7780666ilm.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Aug 2021 10:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=shNhrzerEsE2zV1N+PkQAZcTS3bJIsjxwVv+ONT+kpc=;
        b=dthu5PluI8SIpcGHuz8JNqyfTKjTeq/PS3sko15q/c71jvM7uhnrzAmMOkoByfl71N
         SGjlDrMO8rYb/Kmzko0/UOldzVK7JeHMMSmwx3uxViyzeVS7PjaN25w0RmOHmBxMajfo
         kZLqVaYoQlmpVWITeDANdz+vB1B1iSCXQtLr4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=shNhrzerEsE2zV1N+PkQAZcTS3bJIsjxwVv+ONT+kpc=;
        b=tpSR2qxk/2yZVq9Iu1UoGh3iSqqQNCtifpEhUkKnqQfnWADLwzPgwy18ze3earJBYp
         KYQfKbgeI+2936rE/j/oaih/5uYQ673IRvAEimJU494HPVLXh7KGf1l9ixpsDJaafWtT
         /XzyJApaDFOl/3Tq4FE0DDmt9jLCEUU4Dp6hSbeRBrJXSY7gqOoRfkMEf7wzBGdXLub5
         1ZBg8LrNIrvAZF26EywOZWYS3nvETc6wKftNkjljJVy/H1S8pRoiRGtZOK3I9gU3gcNd
         5S0aFzZrO3TJDcvY5Zt1KaW1Gi9n6p3GamkdzxhW1aso90uEXkGgbxcT1nf77CXpgV29
         SoJQ==
X-Gm-Message-State: AOAM530O7sZEnniQDmjwcIv+JbYHIJBskYT6uiluwP+n+VIeTNb4/mbv
        6AQKdRGtRGvdFMUNWb87PdHiKkPlm4hAbA==
X-Google-Smtp-Source: ABdhPJwwjFPRRyi1FoGh6kSf0SiICPxKihSTaDyJ4/Rqzh/Z/hTumb7UyT+Tw+NBGjLqiqfWmt0HrA==
X-Received: by 2002:a05:6e02:12e4:: with SMTP id l4mr3857139iln.277.1628788950172;
        Thu, 12 Aug 2021 10:22:30 -0700 (PDT)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com. [209.85.166.44])
        by smtp.gmail.com with ESMTPSA id z16sm1859141ile.72.2021.08.12.10.22.28
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Aug 2021 10:22:29 -0700 (PDT)
Received: by mail-io1-f44.google.com with SMTP id q16so7077271ioj.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Aug 2021 10:22:28 -0700 (PDT)
X-Received: by 2002:a05:6602:2159:: with SMTP id y25mr3762841ioy.61.1628788948245;
 Thu, 12 Aug 2021 10:22:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210811235253.924867-1-robdclark@gmail.com> <20210811235253.924867-5-robdclark@gmail.com>
In-Reply-To: <20210811235253.924867-5-robdclark@gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 12 Aug 2021 10:22:15 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V_bE0MfHDZn=u98UZ1eDw7vQXMpG=btwW6XGGqCF4brw@mail.gmail.com>
Message-ID: <CAD=FV=V_bE0MfHDZn=u98UZ1eDw7vQXMpG=btwW6XGGqCF4brw@mail.gmail.com>
Subject: Re: [PATCH 4/4] drm/bridge: ti-sn65dsi86: Add NO_CONNECTOR support
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Rob Clark <robdclark@chromium.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Aug 11, 2021 at 4:51 PM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> Slightly awkward to fish out the display_info when we aren't creating
> own connector.  But I don't see an obvious better way.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 34 +++++++++++++++++++++++----
>  1 file changed, 29 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 38dcc49eccaf..dc8112bab3d3 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -693,9 +693,11 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
>                 return ret;
>         }
>
> -       ret = ti_sn_bridge_connector_init(pdata);
> -       if (ret < 0)
> -               goto err_conn_init;
> +       if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
> +               ret = ti_sn_bridge_connector_init(pdata);
> +               if (ret < 0)
> +                       goto err_conn_init;
> +       }
>
>         /*
>          * TODO: ideally finding host resource and dsi dev registration needs
> @@ -757,7 +759,8 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
>  err_dsi_attach:
>         mipi_dsi_device_unregister(dsi);
>  err_dsi_host:
> -       drm_connector_cleanup(&pdata->connector);
> +       if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR))
> +               drm_connector_cleanup(&pdata->connector);
>  err_conn_init:
>         drm_dp_aux_unregister(&pdata->aux);
>         return ret;
> @@ -806,9 +809,30 @@ static void ti_sn_bridge_set_dsi_rate(struct ti_sn65dsi86 *pdata)
>         regmap_write(pdata->regmap, SN_DSIA_CLK_FREQ_REG, val);
>  }
>
> +/*
> + * Find the connector and fish out the bpc from display_info.  It would
> + * be nice if we could get this instead from drm_bridge_state, but that
> + * doesn't yet appear to be the case.
> + */
>  static unsigned int ti_sn_bridge_get_bpp(struct ti_sn65dsi86 *pdata)
>  {
> -       if (pdata->connector.display_info.bpc <= 6)
> +       struct drm_bridge *bridge = &pdata->bridge;
> +       struct drm_connector_list_iter conn_iter;
> +       struct drm_connector *connector;
> +       unsigned bpc = 0;
> +
> +       drm_connector_list_iter_begin(bridge->dev, &conn_iter);
> +       drm_for_each_connector_iter(connector, &conn_iter) {
> +               if (drm_connector_has_possible_encoder(connector, bridge->encoder)) {
> +                       bpc = connector->display_info.bpc;
> +                       break;
> +               }
> +       }
> +       drm_connector_list_iter_end(&conn_iter);

This looks reasonable to me. I'll plan to apply it to drm-misc-next
sometime next week to give Laurent a chance to comment on whether this
causes any problems with his planned support for full DP using this
bridge chip. IIUC that means it'll hit mainline 1 rev later, but as
per IRC comments this should be fine.

Reviewed-by: Douglas Anderson <dianders@chromium.org>


-Doug
