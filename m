Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0A643A4980
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jun 2021 21:38:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230197AbhFKTk3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Jun 2021 15:40:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230312AbhFKTk2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Jun 2021 15:40:28 -0400
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com [IPv6:2607:f8b0:4864:20::831])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BB41C061574
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jun 2021 12:38:14 -0700 (PDT)
Received: by mail-qt1-x831.google.com with SMTP id p21so3470283qtw.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jun 2021 12:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=d+zltXrlokDR6aEz3MSD5AaZ+/B1A6IvYPaBHs/lMpI=;
        b=PC510Bg8QJ7pOM5BN87EP8x/PnrQVXe+tYw1foUULzDf34lC0QcVW3OJNJACp7r3Um
         rP+Ng/TqdYE2Ty/h1cgenY+sh23jadqmO5rojNF0/moYsj2n1HYpXaDZ++5GPL3kXa0z
         +vPJRPPH5kxozmZv0wICET+dNRpxJ6ye6RIAE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=d+zltXrlokDR6aEz3MSD5AaZ+/B1A6IvYPaBHs/lMpI=;
        b=jcFIpKZ1SL6FV/BBYXoV31PFVlnBnyQ/HR3OXuFsdPSk2In2rUJrmj4LN0Dqy8t2EZ
         5UQGcN0f1gzrtMkgkHEc2dhwIEZztmvcTlBpA5TMAgJZqbl8aoJS5bpfOwE8ws5RUtbi
         qdpgR6FeLEODfIKy1wHmSqsABRhy7bPO9aK+vwdLCDeYy5N+JK5u4GLpSpte4AfyYTvC
         ge9NpxjoUFuR47Sjbi3IhsGMDZ2tD5bdWUYBoJX3Qq4fzC1fFQq5M3GvewGWMT/g6rOR
         nrnrWna7LtbRBoeHh5wajCw+oA8P9ogX+XS5Itvd8WFFZ4U+/cr5RAN7SyLWzrKs8Kvu
         pJpA==
X-Gm-Message-State: AOAM533wHYN1w0l5de3nCw3HKxtC2rumpcmszpk2L0tL6kgtPgYN7T7s
        aPNBimM+gfRNPwMDoBqv+lXGy/BrrqqBFw==
X-Google-Smtp-Source: ABdhPJzUFI5BPkfesTZnRIvnCm7uvqZsGvA8+jVhYiE5CxcFphjX0g9W0Shlemd46ThFoW+duSWwkQ==
X-Received: by 2002:aed:3167:: with SMTP id 94mr5363660qtg.126.1623440291259;
        Fri, 11 Jun 2021 12:38:11 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id t201sm5097317qka.49.2021.06.11.12.38.08
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Jun 2021 12:38:09 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id f84so5930958ybg.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jun 2021 12:38:08 -0700 (PDT)
X-Received: by 2002:a25:8082:: with SMTP id n2mr7635962ybk.79.1623440288458;
 Fri, 11 Jun 2021 12:38:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210611171747.1263039-1-dianders@chromium.org>
In-Reply-To: <20210611171747.1263039-1-dianders@chromium.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 11 Jun 2021 12:37:57 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XTsCvrudDgS2_kX-9e3v+fXVu0yDfzVV+On2_5=JT4=A@mail.gmail.com>
Message-ID: <CAD=FV=XTsCvrudDgS2_kX-9e3v+fXVu0yDfzVV+On2_5=JT4=A@mail.gmail.com>
Subject: Re: [PATCH v10 00/11] drm: Fix EDID reading on ti-sn65dsi86 by
 introducing the DP AUX bus
To:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Sam Ravnborg <sam@ravnborg.org>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Thierry Reding <treding@nvidia.com>,
        Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
        Lyude Paul <lyude@redhat.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Steev Klimaszewski <steev@kali.org>,
        Linus W <linus.walleij@linaro.org>,
        Rob Clark <robdclark@chromium.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Andy Gross <agross@kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Robert Foss <robert.foss@linaro.org>,
        Sandeep Panda <spanda@codeaurora.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Jun 11, 2021 at 10:18 AM Douglas Anderson <dianders@chromium.org> wrote:
>
> The primary goal of this series is to try to properly fix EDID reading
> for eDP panels using the ti-sn65dsi86 bridge.
>
> Previously we had a patch that added EDID reading but it turned out
> not to work at bootup. This caused some extra churn at bootup as we
> tried (and failed) to read the EDID several times and also ended up
> forcing us to use the hardcoded mode at boot. With this patch series I
> believe EDID reading is reliable at boot now and we never use the
> hardcoded mode.
>
> High level note: in this series the EDID reading is driven by the
> panel driver, not by the bridge chip driver. I believe this makes a
> reasonable amount of sense since the panel driver already _could_
> drive reading the EDID if provided with the DDC bus and in future
> planned work we'll want to give the panel driver the DDC bus (to make
> decisions based on EDID) and the AUX bus (to control the
> backlight). There are also planned patches from Laurent to make
> ti-sn65dsi86 able to drive full DP monitors. In that case the bridge
> chip will still be in charge of reading the EDID, but it's not hard to
> make this dynamic.
>
> This series is the logical successor to the 3-part series containing
> the patch ("drm/bridge: ti-sn65dsi86: Properly get the EDID, but only
> if refclk") [1].
>
> This patch was tested against drm-misc-next commit f42498705965
> ("drm/panfrost: Fix missing clk_disable_unprepare() on error in
> panfrost_clk_init()") on a sc7180-trogdor-lazor device.
>
> At v10 now, this is ready to land and I plan to commit it shortly. All
> patches have reviews and Laurent has said over IRC he doesn't object
> it it landing.

I've pushed this to drm-misc-next. I know it's only been a few hours
since I posted it to the lists, but it's the same as v9 that's been
sitting there for a while, except for checking the result of kazalloc
that Lyude noticed (thanks!). I'm not aware of anyone else planning to
add reviews and presume that if they were going to speak up they'd
have done it by now.

While landing, the "dim" tools pointed out two whitespace issues in
patch #4 which I fixed while applying.

Thanks to everyone for all the reviews and help in getting this
whipped into shape!

-Doug
