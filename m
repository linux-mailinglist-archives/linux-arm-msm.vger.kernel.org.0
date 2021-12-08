Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD1C946CCA9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Dec 2021 05:44:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244262AbhLHEra (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Dec 2021 23:47:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242900AbhLHEra (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Dec 2021 23:47:30 -0500
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11D8BC061746
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Dec 2021 20:43:59 -0800 (PST)
Received: by mail-oi1-x230.google.com with SMTP id q25so2600511oiw.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Dec 2021 20:43:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=rd+j5j+A/ltOuK7rQ2SC4JfrJuxW264ZWQGgHOMWaxs=;
        b=EPFLc6hcqSLUoOeh+GNUVsfeJF00qoKKUuzB2uAZqd8AHEb+BtVBfmE8vVZZIgkiuM
         3KieSufO0fqA4B8cHdUS6NTshnydDBqQS0GbdRD0Fv6QtLJwmFONJ9RVwDTebWdurtUi
         jLHhP8qSQ6/arPzR7769MWq32PsXWVg0EgEqE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=rd+j5j+A/ltOuK7rQ2SC4JfrJuxW264ZWQGgHOMWaxs=;
        b=5yWCHTDwD1slLJczPBtQnA/VmOkoA6Ki2PFiOClWVuKdUSMB+rlmA+9gUH7gtAjMfj
         i+Y6C+fGBds42ETxVUnFrqRYzT+WPk6oYroUv5jl7hJ+45mg+jDyrnIhqU6xkHOiwjXF
         08rlut+/yZ4EWDOibRN8HBaFhd3MMa4mUFe40+Ys2kn5A828zu98oC5XIW8szdKI2rxH
         lAUa4ayXRCenqDllJZPGXI3kQgwr8Odh9J9l23GNiaNYiVLA6D72pNj9trwe1vCzryJa
         lOAGivL96zSpNlbFW0DvZlVPrnIA8d3SZ2xEjt1hFuxygIJd4C9Suj5YYeGQN9drqaTC
         U7wg==
X-Gm-Message-State: AOAM5320TvWK6XumQKbC99n/LdweepM+nezF38TJR2Cz+L+EvWtkWFJi
        EN3bK7CIqBjZobdDiFd0e+s1GfJ6wdFA6JsKSfsRyA==
X-Google-Smtp-Source: ABdhPJxbPhPALpa9YOf2Yuk1/fk2GRgOHioOp0wS0T4qNd1uQnbM6dYNBdZUXWXxkz3w91sRMGI5pDArkPRWDBlG+jE=
X-Received: by 2002:a05:6808:211f:: with SMTP id r31mr9375277oiw.64.1638938638466;
 Tue, 07 Dec 2021 20:43:58 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 7 Dec 2021 23:43:58 -0500
MIME-Version: 1.0
In-Reply-To: <20211207215753.635841-1-robdclark@gmail.com>
References: <20211207215753.635841-1-robdclark@gmail.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Tue, 7 Dec 2021 23:43:58 -0500
Message-ID: <CAE-0n52gbwsJXG7=hdQhcttTbucjBv9SBq+kng2Ansc=TyqCKg@mail.gmail.com>
Subject: Re: [PATCH v3] drm/bridge: sn65dsi86: defer if there is no dsi host
To:     Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>,
        Douglas Anderson <dianders@chromium.org>,
        =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>,
        Rob Clark <robdclark@chromium.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Rob Clark (2021-12-07 13:57:52)
> From: Rob Clark <robdclark@chromium.org>
>
> Otherwise we don't get another shot at it if the bridge probes before
> the dsi host is registered.  It seems like this is what *most* (but not
> all) of the other bridges do.
>
> It looks like this was missed in the conversion to attach dsi host at
> probe time.
>
> Fixes: c3b75d4734cb ("drm/bridge: sn65dsi86: Register and attach our DSI device at probe")
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> Reviewed-by: Doug Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

One more nit below

> v2: Drop DRM_ERROR() in favor of drm_err_probe() and shift around the
>     spot where we report the error
> v3: Add \n and cull error msgs a bit further
>
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 18 +++++++-----------
>  1 file changed, 7 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 02b490671f8f..c2928a6409b1 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -740,10 +736,8 @@ static int ti_sn_attach_host(struct ti_sn65dsi86 *pdata)
>         pdata->dsi = dsi;
>
>         ret = devm_mipi_dsi_attach(dev, dsi);
> -       if (ret < 0) {
> -               DRM_ERROR("failed to attach dsi to host\n");
> +       if (ret < 0)
>                 return ret;
> -       }
>
>         return 0;

This can be simplified further to

	return devm_mipi_dsi_attach(dev, dsi);
