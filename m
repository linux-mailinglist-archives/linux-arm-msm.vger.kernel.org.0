Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4653D371E0F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 May 2021 19:10:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232514AbhECRIw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 May 2021 13:08:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236700AbhECRHX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 May 2021 13:07:23 -0400
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 357C7C06174A
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 May 2021 09:55:35 -0700 (PDT)
Received: by mail-qk1-x72c.google.com with SMTP id 197so5422812qkl.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 May 2021 09:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WTaPZJJAb+agZFdITzeXOjZnWTBVRqn0ZvSBSvsqyj8=;
        b=KPPMi8esPiixHTvAdzjM1N0qW/guYzs1KzH9fDZI4345Xh0a+0njo5pRHf/sVYbNfp
         PabktArLEDIdcVFhAkDgyadtRbNJDn4dafcTG2RtZl+LsjdNdxrriJeg5Ss619IEeUSn
         rzhLOppLZScRfHHm9uhyiGH4PoNuoziso7orE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WTaPZJJAb+agZFdITzeXOjZnWTBVRqn0ZvSBSvsqyj8=;
        b=XONVf6zvPCaQzd3JrTpahMoUhJ+MBDvcvgTgCR+9gWtplpN4G758+K+7eO8yGJplWt
         kS+NwkzXMBAi8E+7hK/kF0DWFk09O1X0qbPMYqF4JARPpFtxaCLoZ8dPckvPR5VyN802
         EWbXxJBavJdPsOLIhOmFfQwrJD0WoqPcdeNn2MWQFTiYxyXHW+t/HIO6wIvzo7Pk5np7
         p1C77OOjGRIVyoYWUz4G5xmDiJ+PqZ3cf9gJ/Z21rIJvofyEUk3o2EydXa7UwTLMqTjv
         S74KtA9y3lNWhmEu6GKaD37bQrvF89FDk3nsu+wfFHz/Y63lEdrp6stj9z8UhktP5JGj
         mdog==
X-Gm-Message-State: AOAM531ch6Mh9jIhM0mxYYBjSqt0uL5OakRhb7z8q9n6o+VS7fN86Hb9
        YaY3qoerjdKOLJiJJDeno2hATv1JQH2R6A==
X-Google-Smtp-Source: ABdhPJzbi3O3DXp0NYHepdLJI8f9Fa4HPYouEAUMLJDgoEW9TTE/CcO28XiV4/WVWQSihRYS8n7PlQ==
X-Received: by 2002:a37:e94:: with SMTP id 142mr20096680qko.49.1620060934195;
        Mon, 03 May 2021 09:55:34 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id n18sm285741qtv.70.2021.05.03.09.55.33
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 May 2021 09:55:33 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id t94so8413780ybi.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 May 2021 09:55:33 -0700 (PDT)
X-Received: by 2002:a25:d9ce:: with SMTP id q197mr15755336ybg.276.1620060932851;
 Mon, 03 May 2021 09:55:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210423165906.2504169-1-dianders@chromium.org>
 <20210423095743.v5.9.I3e68fa38c4ccbdbdf145cad2b01e83a1e5eac302@changeid> <CACRpkdbZxauBFLvR_MMx4WD+K6DftK19Fivt_mkE=+Xr2EPUvQ@mail.gmail.com>
In-Reply-To: <CACRpkdbZxauBFLvR_MMx4WD+K6DftK19Fivt_mkE=+Xr2EPUvQ@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 3 May 2021 09:55:20 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XGYHNasnqaFopUnuZNaBn+Nbf4+ak7vUoERaA8pRBTsw@mail.gmail.com>
Message-ID: <CAD=FV=XGYHNasnqaFopUnuZNaBn+Nbf4+ak7vUoERaA8pRBTsw@mail.gmail.com>
Subject: Re: [PATCH v5 09/20] drm/bridge: ti-sn65dsi86: Break GPIO and
 MIPI-to-eDP bridge into sub-drivers
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Sam Ravnborg <sam@ravnborg.org>, Wolfram Sang <wsa@kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Rob Clark <robdclark@chromium.org>,
        Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Steev Klimaszewski <steev@kali.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Robert Foss <robert.foss@linaro.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Sat, May 1, 2021 at 4:59 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Fri, Apr 23, 2021 at 6:59 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> > Let's use the newly minted aux bus to break up the driver into sub
> > drivers. We're not doing a full breakup here: all the code is still in
> > the same file and remains largely untouched. The big goal here of
> > using sub-drivers is to allow part of our code to finish probing even
> > if some other code needs to defer. This can solve some chicken-and-egg
> > problems. Specifically:
> > - In commit 48834e6084f1 ("drm/panel-simple: Support hpd-gpios for
> >   delaying prepare()") we had to add a bit of a hack to simpel-panel
> >   to support HPD showing up late. We can get rid of that hack now
> >   since the GPIO part of our driver can finish probing early.
> > - We have a desire to expose our DDC bus to simple-panel (and perhaps
> >   to a backlight driver?). That will end up with the same
> >   chicken-and-egg problem. A future patch to move this to a sub-driver
> >   will fix it.
> > - If/when we support the PWM functionality present in the bridge chip
> >   for a backlight we'll end up with another chicken-and-egg
> >   problem. If we allow the PWM to be a sub-driver too then it solves
> >   this problem.
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> >
> > Changes in v5:
> > - Fix module compile problems (Bjorn + kbuild bot)
> > - Remove useless MODULE_DEVICE_TABLE (Bjorn).
>
> This is generally a good idea. I have no idea when to use
> auxbus or MFD

It was a bit hard for me to figure out too. I think historically this
could have been implemented by MFD but I believe that the point of
introducing the AUX bus was that MFD wasn't a great fit for things
like this. It's talked about a bit in
"Documentation/driver-api/auxiliary_bus.rst". For me the important
thing here is that we think of the bridge chip as one device, not a
collection of IP blocks glued together in one package. As some
evidence, the DT bindings don't have sub-nodes for this. There's a
single DT node that says that this one device is the bridge, is a GPIO
controller, and can provide a PWM.


> but I trust that you researched that so:
> Acked-by: Linus Walleij <linus.walleij@linaro.org>

Thanks! I'll land it then to whittle the patch stack down to just the
controversial EDID one.

-Doug
