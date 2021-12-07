Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1CA246C6D8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Dec 2021 22:42:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241948AbhLGVqX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Dec 2021 16:46:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232757AbhLGVqX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Dec 2021 16:46:23 -0500
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com [IPv6:2607:f8b0:4864:20::d32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56006C061746
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Dec 2021 13:42:52 -0800 (PST)
Received: by mail-io1-xd32.google.com with SMTP id p65so680100iof.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Dec 2021 13:42:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ld7GFu9I5ImAVII2taoKUmYqR/icJ65ORArYw4v0ttc=;
        b=nAZjM66YrDrs8HfAa2iTCYIWgi9qc/YsUgO5VAYK6/eQVvUw5DJAifluaZXeUqd1iF
         v0BFAkBj6IjQzFW0qnP8+30o9JfzzNyjPxxkAJp5859e/BduAVE136R8S7ATT6+5f4gn
         9J302+HRh1jPhAbGJ2IgovUoCD7uc7m2N3OSo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ld7GFu9I5ImAVII2taoKUmYqR/icJ65ORArYw4v0ttc=;
        b=UgNYr/0p1y4K770R78anRIBLOLH+0AlfKhyKESzG84ahMReV4qXCN7NOUJrNqMvYCe
         qM+NWZnQaYPeH956hA6unW2rE43YsxVYBOMeR74SmXkmPbex1Q2bHKEnh2E7HzLRBiww
         nzrT+8Mr636oNAcFZHoHgtlfFGQHOlDdv22tW8JgW5WjXGWmAtpBZYob8WRPTtverM9K
         x99SLuFB1RJ0huXirAb3bHU47c8ECaJ0Zj+015gC+D7+ctrtP0r/ZEwK/VBLWRR36gL0
         u2p2VnKLwb+tQ9nrGI09wYKn7cnVpVy5uMJd7Lol3Xg0vRG4b4CBA5hmy2ALHUQN2zRl
         McdA==
X-Gm-Message-State: AOAM532vK+GgK6rEXgbBtU4hy3XEIozV9Aub0xFleH3UM/LsHPVW7ceZ
        bpchloZpMbgTzucNdoz8+in1Eg6nrZvscA==
X-Google-Smtp-Source: ABdhPJwru9NCjRAyf5qpMLG4R13Q2FqWOKhXvmva0W11gHmEpJMztIHYKbwhfooRu9YduP2QnpGi+g==
X-Received: by 2002:a05:6602:29c5:: with SMTP id z5mr2147877ioq.34.1638913370672;
        Tue, 07 Dec 2021 13:42:50 -0800 (PST)
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com. [209.85.166.171])
        by smtp.gmail.com with ESMTPSA id i26sm890754ila.12.2021.12.07.13.42.49
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Dec 2021 13:42:50 -0800 (PST)
Received: by mail-il1-f171.google.com with SMTP id r2so377792ilb.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Dec 2021 13:42:49 -0800 (PST)
X-Received: by 2002:a92:ca0e:: with SMTP id j14mr2173215ils.27.1638913369355;
 Tue, 07 Dec 2021 13:42:49 -0800 (PST)
MIME-Version: 1.0
References: <20211207213830.625890-1-robdclark@gmail.com>
In-Reply-To: <20211207213830.625890-1-robdclark@gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 7 Dec 2021 13:42:36 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VSRB45vFJZhVg7OTy2ZAv6UZ638YjQQiZemt9-AD1JXw@mail.gmail.com>
Message-ID: <CAD=FV=VSRB45vFJZhVg7OTy2ZAv6UZ638YjQQiZemt9-AD1JXw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/bridge: sn65dsi86: defer if there is no dsi host
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Maxime Ripard <maxime@cerno.tech>,
        Stephen Boyd <swboyd@chromium.org>,
        =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>,
        Rob Clark <robdclark@chromium.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sam Ravnborg <sam@ravnborg.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Dec 7, 2021 at 1:33 PM Rob Clark <robdclark@gmail.com> wrote:
>
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
> ---
> v2: Drop DRM_ERROR() in favor of drm_err_probe() and shift around the
>     spot where we report the error
>
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 02b490671f8f..8f1321ca819e 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -714,10 +714,8 @@ static int ti_sn_attach_host(struct ti_sn65dsi86 *pdata)
>         };
>
>         host = of_find_mipi_dsi_host_by_node(pdata->host_node);
> -       if (!host) {
> -               DRM_ERROR("failed to find dsi host\n");
> -               return -ENODEV;
> -       }
> +       if (!host)
> +               return -EPROBE_DEFER;
>
>         dsi = devm_mipi_dsi_device_register_full(dev, host, &info);
>         if (IS_ERR(dsi)) {
> @@ -1267,8 +1265,10 @@ static int ti_sn_bridge_probe(struct auxiliary_device *adev,
>         drm_bridge_add(&pdata->bridge);
>
>         ret = ti_sn_attach_host(pdata);
> -       if (ret)
> +       if (ret) {
> +               dev_err_probe(pdata->dev, ret, "failed to attach dsi host");

nit: Needs a "\n" at the end, doesn't it?


>                 goto err_remove_bridge;
> +       }

It's going to be a little funny now because if the
devm_mipi_dsi_attach() call fails you'll report "failed to attach dsi
host" twice (once using DRM_ERROR in ti_sn_attach_host() and once
here). Probably all the error messages could be removed from
ti_sn_attach_host() and you could rely on this new one because:
* devm_mipi_dsi_device_register_full() already appears plenty chatty.
* this is the same message that devm_mipi_dsi_attach() was printing out anyway.

In any case, it's not really a big deal, so with the "\n" added I'm
happy with my Reviewed-by.

I'm happy to apply this to to drm-misc-next tomorrow if there are no
objections. I can always add the "\n" myself unless you want to send a
v3 with it and/or want to remove more error messages. ;-)

-Doug
