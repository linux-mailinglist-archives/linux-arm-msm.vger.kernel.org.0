Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74BE5423D63
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Oct 2021 14:00:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238117AbhJFMCY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Oct 2021 08:02:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238167AbhJFMCW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Oct 2021 08:02:22 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19AB0C061749
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Oct 2021 05:00:30 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id u7so2124593pfg.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Oct 2021 05:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=c3ET/nfws4iXh0TbxNZd9sSPG0B+4WbRQ4COCMRwWGI=;
        b=Z5zrUTDmnGq1VSpPNQ0Hjb4wLy45LvVqOLaVEy4qLott5uha+aLi4Haevp00Qk7JXG
         IXH2N1GvNytw5Ppe0Uv4exBmxklHJk7ZDh6G0F5MwaNNH+1EmcrXDE0bDuz6DGx2DQ/i
         0JpG/5VA14AOV1zIV8MODlVaCk0brhWnzmJnJ1xmtwlnSXvK7Nt2RZmwO4EQBVjFLxr1
         MAZsmokQuTcFJzRuL7RH4CSrpaw73ZGMLQbOQcXEU+XaxWZn9cWNlfE+iAYdFSXCuQPi
         ZobkqBtrzEkip0VcmfGI8YBpJqNWQ9aQ9UoJJ0/7mLtul0etgsn/BwUe4kqPQilb1BHo
         r83Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=c3ET/nfws4iXh0TbxNZd9sSPG0B+4WbRQ4COCMRwWGI=;
        b=FjmugHUF/N+mqE6qPVTLlqhNdM0RIXWvws8aNtkZGGpgCN+XHY9Pl0dgnkaTVLAxaR
         TnFcTRzUgoMbVYhitEdjr5N9vPLHWgP5FcFgZLdHcOSx/YV9MHxvlZmBzB/tyTKCh8tf
         LRIzvNhVZ2dfigL8ICKUruXh3aXuXOROPKvg59QG9/uab7j2M3hI8jLrciBxAMoNjFOz
         L4iUe8n6LTNUNVIWa4YnFPsh3/3QniO2I5zXRFXULMBJUwumCS4m9n+xM95+7HORqEUB
         SxdQ9VQKbRLbnAYolQJmTh6P8tqvs2mbcNTGXFkoYgaD8ZiyoW3sUW5mJ58fJGdD7zNn
         69Lg==
X-Gm-Message-State: AOAM5331PCPhLlWePPWTkx7ne1T91SiRdeEV6BRuVNoibXRD90NtrSt/
        vty7RdCK35AyUxQ5DCTSyiAz3nXuZZgPoum0S/qUVbYCKgnk7Q==
X-Google-Smtp-Source: ABdhPJz70XHpmr5/3xRf5CrIu4GFrUI79dpFQKhruWqA5Y7J4CLsWuCHQ3GQni8vs6mZaZkyeOnvX2pWuBSZ9G+rfTs=
X-Received: by 2002:a63:e115:: with SMTP id z21mr20626784pgh.306.1633521629436;
 Wed, 06 Oct 2021 05:00:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210708230329.395976-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20210708230329.395976-1-dmitry.baryshkov@linaro.org>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Wed, 6 Oct 2021 14:00:18 +0200
Message-ID: <CAG3jFystLjgs=s2R1ATzPGzWDjR16Q5ee0gy=h4r6=h2CLsv1A@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge/lontium-lt9611uxc: fix provided connector suport
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        MSM <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Applied to drm-misc-next

On Fri, 9 Jul 2021 at 01:03, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> - set DRM_CONNECTOR_POLL_HPD as the connector will generate hotplug
>   events on its own
>
> - do not call drm_kms_helper_hotplug_event() unless mode_config.funcs
>   pointer is not NULL to remove possible kernel oops.
>
> Fixes: bc6fa8676ebb ("drm/bridge/lontium-lt9611uxc: move HPD notification out of IRQ handler")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> index 3cac16db970f..010657ea7af7 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> @@ -167,9 +167,10 @@ static void lt9611uxc_hpd_work(struct work_struct *work)
>         struct lt9611uxc *lt9611uxc = container_of(work, struct lt9611uxc, work);
>         bool connected;
>
> -       if (lt9611uxc->connector.dev)
> -               drm_kms_helper_hotplug_event(lt9611uxc->connector.dev);
> -       else {
> +       if (lt9611uxc->connector.dev) {
> +               if (lt9611uxc->connector.dev->mode_config.funcs)
> +                       drm_kms_helper_hotplug_event(lt9611uxc->connector.dev);
> +       } else {
>
>                 mutex_lock(&lt9611uxc->ocm_lock);
>                 connected = lt9611uxc->hdmi_connected;
> @@ -339,6 +340,8 @@ static int lt9611uxc_connector_init(struct drm_bridge *bridge, struct lt9611uxc
>                 return -ENODEV;
>         }
>
> +       lt9611uxc->connector.polled = DRM_CONNECTOR_POLL_HPD;
> +
>         drm_connector_helper_add(&lt9611uxc->connector,
>                                  &lt9611uxc_bridge_connector_helper_funcs);
>         ret = drm_connector_init(bridge->dev, &lt9611uxc->connector,
> --
> 2.30.2
>
