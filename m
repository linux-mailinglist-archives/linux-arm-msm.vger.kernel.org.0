Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDAC0369771
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Apr 2021 18:53:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243229AbhDWQx7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Apr 2021 12:53:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229957AbhDWQx6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Apr 2021 12:53:58 -0400
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D4BDC061574
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Apr 2021 09:53:21 -0700 (PDT)
Received: by mail-qk1-x72f.google.com with SMTP id t17so21774857qkg.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Apr 2021 09:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DND1iGGPjngmHTVlV+c4Q20wbAG71cect3ZWcNu/fqM=;
        b=HEvzLaXsM1O3YDF7kXj6cV9W3z/mj/YaZRnHFlBZ2rpsku/yo45gm9QY1TDQ+b0Q2Q
         4QmACTulVrObY8AyQsXioItz4TGmlCVL/xhIo2hpFyVGQOkbET4Dy+zwn72r3lYZUfpH
         +pv1WLGIP5dCOKj6dRBy4N34rssSE/rrgyn1c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DND1iGGPjngmHTVlV+c4Q20wbAG71cect3ZWcNu/fqM=;
        b=Hj3k4c+haAZ5ed0iPoUW5xZFx7DDOnhC5K9rURv683hMNFpBL6I+UTnkxGewR2qpwS
         V8SQP4RFpw3nG/xd1miJrAtycr5vAeIa9ytFBcdQJml9AyK8uaR3rrTd3Lu7IEaCAAmg
         sTVxnRNFKVGDTLVDfzO5edpVLL5gtVyhdBjK54tKS7PtoObAgCNsskmQGcsUh2G855Fk
         8tBYvZYMG1c91M/q6mh3jNiYddyapriHeoLFheRotg17C3nyHBzsc7hdT7/xIQntihfL
         mNHrmFR3HQCuSOhCv2d8W4DrcFQOWsLkROV6Z48X6V6epbhCHuShK8CsMiB2LbjYTSU0
         1OCw==
X-Gm-Message-State: AOAM5331I/XUZM5Rl9UQdvCBe+4csTE73chWb3X2VZtSabXo0cihiA4N
        wK0iaOSA9dilUx3gSaPkg3tbW4DIflAyCQ==
X-Google-Smtp-Source: ABdhPJyXAkJ/0ZNnuSqkvQhxoy4Fw/8wz3kW+gkrkk5n3V1kv+/8akXapvGb9iax2BzoOVSSVQahdw==
X-Received: by 2002:a37:90a:: with SMTP id 10mr4978856qkj.396.1619196800232;
        Fri, 23 Apr 2021 09:53:20 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id j13sm4647410qth.57.2021.04.23.09.53.20
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Apr 2021 09:53:20 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id g38so56342349ybi.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Apr 2021 09:53:20 -0700 (PDT)
X-Received: by 2002:a25:6088:: with SMTP id u130mr7214627ybb.257.1619196429157;
 Fri, 23 Apr 2021 09:47:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210416223950.3586967-1-dianders@chromium.org> <20210416153909.v4.27.I502f2a92ddd36c3d28d014dd75e170c2d405a0a5@changeid>
In-Reply-To: <20210416153909.v4.27.I502f2a92ddd36c3d28d014dd75e170c2d405a0a5@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 23 Apr 2021 09:46:57 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XdAA4+U5=oW++6j84+=L88ViuKRpGkmgUShDYj0=SaoQ@mail.gmail.com>
Message-ID: <CAD=FV=XdAA4+U5=oW++6j84+=L88ViuKRpGkmgUShDYj0=SaoQ@mail.gmail.com>
Subject: Re: [PATCH v4 27/27] drm/panel: panel-simple: Prepare/unprepare are
 refcounted, not forced
To:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Sam Ravnborg <sam@ravnborg.org>, Wolfram Sang <wsa@kernel.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Rob Clark <robdclark@chromium.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
        Steev Klimaszewski <steev@kali.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linus W <linus.walleij@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Thierry Reding <thierry.reding@gmail.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Apr 16, 2021 at 3:41 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> Historically simple-panel had code to make sure that if prepare() was
> called on an already-prepared panel that it was a no-op. Similarly if
> unprepare() was called on an already-unprepared panel it was also a
> no-op. Essentially it means that these functions always "forced" the
> value to be whatever the caller wanted it to be. You can see that the
> forcing behavior dates back at least as far as 2014 by looking at
> commit 613a633e7a56 ("drm/panel: simple: Add proper definition for
> prepare and unprepare").
>
> Apparently the code supporting the historical behavior may not be
> needed [1] and prepare() / unprepare() are supposed to be
> balanced. Let's try removing it and see if anyone breaks! If they do
> then we can have a debate about whether we should change that code or
> revert this patch. :-) If nobody breaks then we've nicely saved a few
> lines of code and some complexity.
>
> [1] https://lore.kernel.org/r/YHePsQgqOau1V5lD@pendragon.ideasonboard.com
>
> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
> (no changes since v1)
>
>  drivers/gpu/drm/panel/panel-simple.c | 14 --------------
>  1 file changed, 14 deletions(-)

So it turns out that when looking at panel_simple_remove() I already
found a case that's not necessarily refcounting. There I see
drm_panel_unprepare() just simply hardcoded, but (as I understand it)
there's no reason to believe that the panel has been prepared at
remove() time. Yes, I could fix panel_simple_remove() but instead, for
now, I think I'm going to drop this patch from the series. If someone
wants to pick it up then I certainly won't object, but for now keeping
the way things are seems the best way to keep from getting shouted at.

-Doug
