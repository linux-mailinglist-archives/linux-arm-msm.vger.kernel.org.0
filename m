Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F6493D7335
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jul 2021 12:29:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236186AbhG0K3X (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Jul 2021 06:29:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236195AbhG0K3U (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Jul 2021 06:29:20 -0400
Received: from mail-ua1-x92d.google.com (mail-ua1-x92d.google.com [IPv6:2607:f8b0:4864:20::92d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48114C061764
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jul 2021 03:29:20 -0700 (PDT)
Received: by mail-ua1-x92d.google.com with SMTP id t26so4690780uao.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jul 2021 03:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BNXOQOHHvkyOlpYQvBOMgkkH26gWwGd0okW8oi8QdqI=;
        b=VA9XBSq4CQhlCAZrPbTm3nskntRBag7xfqyt0l5ZRi4tj4r7Nwmj7cH8Q//ULvZ68Y
         5rx6ds4fUh1cKyKjtK9DlDLoCmoMTBGuBTVGak7TJbutzKps51Gx+PW0a4zDeLzgCVRA
         7v+taAWoRMIo4GLW7W31F6kuP0wNC9VL3N8Xk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BNXOQOHHvkyOlpYQvBOMgkkH26gWwGd0okW8oi8QdqI=;
        b=ImrFqOATqBQQgbO0RqBzA6F4bRFmnSk7XkAthtiRFjD323zAnoqbeTBaCS0H1srHlB
         c94DouAuZNGiTKbgMz47wktatuz4SjhtHnCxlMI1HlG67eh2WOkjBOunziyZGGfHuYWd
         eRkoyXEl33ns1QKYZBvKNpklaG96WijBbApV4R59IJ7GRTHyYCI8uiH30Quxzth29plI
         w3ox9ZjidAR1XdMs1uWvsbMVZOkRAbPe+NmGMSCsXQz5M3nmE9T0E9Tj9yDIxRFTiPx4
         H/5neITMBWjOhUGuEePjy81K5e+Q1YvDDeppK/ou2UZEBZhNvYbCI+RT9kcW6jxCZy1f
         AO4Q==
X-Gm-Message-State: AOAM533JPeOz4Shz7r4rrmwuvV8X2NxGtYe87mZCkGglgwT4t1rhzalX
        KP+Xz2ySBCbP/2VGEZYI5zsQdsFveQfdP5eBZ9xIiw==
X-Google-Smtp-Source: ABdhPJyx7sQwhJ8UE8NDg2Kx4YHR88sGvEf5AH10FBKUxfscAE8LJuhcwnvw8wjRTLPiqyBoy6zqtE4uvHrV7c6EPNE=
X-Received: by 2002:ab0:2641:: with SMTP id q1mr16151134uao.82.1627381759398;
 Tue, 27 Jul 2021 03:29:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210727094435.v3.1.I629b2366a6591410359c7fcf6d385b474b705ca2@changeid>
 <YP/FMblLCPpR7Tgf@ravnborg.org>
In-Reply-To: <YP/FMblLCPpR7Tgf@ravnborg.org>
From:   Nicolas Boichat <drinkcat@chromium.org>
Date:   Tue, 27 Jul 2021 18:29:08 +0800
Message-ID: <CANMq1KAVA3LRXzcKrVoj30KtvwuA0hQ12JdMLu32-RD8h=UjFw@mail.gmail.com>
Subject: Re: [PATCH v3] drm/dsi: Add _NO_ to MIPI_DSI_* flags disabling features
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        David Airlie <airlied@linux.ie>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Andrzej Hajda <andrzej.hajda@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Tzung-Bi Shih <tzungbi@google.com>,
        Adrien Grassein <adrien.grassein@gmail.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Jonas Karlman <jonas@kwiboo.se>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Yangtao Li <tiny.windzz@gmail.com>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Pi-Hsun Shih <pihsun@chromium.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Sean Paul <sean@poorly.run>, Xin Ji <xji@analogixsemi.com>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        lkml <linux-kernel@vger.kernel.org>,
        Robert Foss <robert.foss@linaro.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Yu Jiahua <yujiahua1@huawei.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jul 27, 2021 at 4:35 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Nicolas,
> On Tue, Jul 27, 2021 at 09:45:21AM +0800, Nicolas Boichat wrote:
> > Many of the DSI flags have names opposite to their actual effects,
> > e.g. MIPI_DSI_MODE_EOT_PACKET means that EoT packets will actually
> > be disabled. Fix this by including _NO_ in the flag names, e.g.
> > MIPI_DSI_MODE_NO_EOT_PACKET.
> >
> > Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> > Reviewed-by: Robert Foss <robert.foss@linaro.org>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Reviewed-by: Andrzej Hajda <andrzej.hajda@samsung.com>
> > Reviewed-by: Xin Ji <xji@analogixsemi.com> # anx7625.c
> > Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org> # msm/dsi
> > ---
> > I considered adding _DISABLE_ instead, but that'd make the
> > flag names a big too long.
> >
> > Generated with:
> > flag=MIPI_DSI_MODE_VIDEO_HFP; git grep $flag | cut -f1 -d':' | \
> >   xargs -I{} sed -i -e "s/$flag/MIPI_DSI_MODE_VIDEO_NO_HFP/" {}
> > flag=MIPI_DSI_MODE_VIDEO_HBP; git grep $flag | cut -f1 -d':' | \
> >   xargs -I{} sed -i -e "s/$flag/MIPI_DSI_MODE_VIDEO_NO_HBP/" {}
> > flag=MIPI_DSI_MODE_VIDEO_HSA; git grep $flag | cut -f1 -d':' | \
> >   xargs -I{} sed -i -e "s/$flag/MIPI_DSI_MODE_VIDEO_NO_HSA/" {}
> > flag=MIPI_DSI_MODE_EOT_PACKET; git grep $flag | cut -f1 -d':' | \
> >   xargs -I{} sed -i -e "s/$flag/MIPI_DSI_MODE_NO_EOT_PACKET/" {}
> > (then minor format changes)
> >
> > Changes in v3:
> >  - Added all R-b tags from v1 and v2 (hopefully didn't miss any).
> >
> > Changes in v2:
> >  - Rebased on latest linux-next, after some of the flags got fixed
> >    (Linus Walleij).
>
> Thanks for the update, applied to drm-misc-next.

Thanks Sam!

>
>         Sam
