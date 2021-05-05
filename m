Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3707C373BB5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 May 2021 14:51:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232410AbhEEMwZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 May 2021 08:52:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232389AbhEEMwY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 May 2021 08:52:24 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B63F3C061761
        for <linux-arm-msm@vger.kernel.org>; Wed,  5 May 2021 05:51:27 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id v5so2263848ljg.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 May 2021 05:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5ZKINt+24vkgq+jtEeRzmpva+N3VhWpG25a6HCCDQLg=;
        b=lsqTsl7XXHy6S6on3u5XAyk4I5ko7hEiejMokpIADhU8TTGOHuBxi28EfYt8Jf7FV/
         OnGwPXxfbb2dKPzov0N0V6NLD0nonHQEVWfTyW02sRnjp85USPGekyOLAQKJFWp9fF8E
         hqkQ/ym/tBF1B6XEQnez1qYEpgs7V6bTtplIPN8B/Ji0Uc1VvPaIIJbB6dxkhLrH3AqL
         3UtMnEuE9F6FZUX2A6rX80PBuBmh84a54AcIhfZ3QZ8F4adFMGl4Pe5TjEyqDS5EGFmn
         on3hpo4FRiMNfsvx4bzbW3vZtc2TN6Ndl2ZTM44H5dPIxkf925BYAYWpGTMK9970dbWN
         jpDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5ZKINt+24vkgq+jtEeRzmpva+N3VhWpG25a6HCCDQLg=;
        b=VaqxfrOxmNLQV4ixAg+QRb9nagXIyp5OVG0WO4U+15oogCDR9tQKQrdfHXh0KpWECn
         E3W4SprFrdjXw4o/dfoIServRINylUy6oEKt2ENXksMuOlO2lTp0ok6lIJ8dRiN1h5aR
         qJIa+/YOec9y9Dan6TNmhAGoktCbb2FO3Esyf+4B19Uuh7vgywVx3p49rv9FL/9pMRdn
         Uws+83Ppym5/Qhz/gaUUaDSgABjTB4Y89aD5hQbwuFLbP8qwqRX5zDRQ/DI2lBdXGDXp
         nAu0e+Q/t/STWn0I29FTqI727FfD6Jes5oHfe9u/x5XO69i7KyQLpQky5XfI0tXbnv2Z
         rdQA==
X-Gm-Message-State: AOAM533Ug0kzDGKiAewdS25SZYxZB9EddSiGB1/1mBcKnxCVs8/Yv2wi
        bfwxv1mdpiyUywwv5Ud8G4EXEPUKDoJe67lTwjLUvA==
X-Google-Smtp-Source: ABdhPJyQJiePbgT7/Tp3x1+jnfQmk7ukJ4HB+fh/IcgCx7MW+Kkyq/ARSBbLSXWU82nXtNazzReNnDeM6ZGufQXDZ/A=
X-Received: by 2002:a2e:a54c:: with SMTP id e12mr21964567ljn.326.1620219086062;
 Wed, 05 May 2021 05:51:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210423165906.2504169-1-dianders@chromium.org>
 <20210423095743.v5.1.I9e6af2529d6c61e5daf86a15a1211121c5223b9a@changeid>
 <CACRpkdYkRFLvCRPSYNzYQG58QgPfhvjtHb+FBQZadyrnjC8=1A@mail.gmail.com>
 <CAD=FV=UX683grZ=poTwKXxSqYBCLdLAOCxOPhE_xVVgKbe36Mw@mail.gmail.com>
 <CACRpkdYfugrJ4WGn=w+viGXE6s5cdHjLC++jHPLVy_QH09KA8Q@mail.gmail.com>
 <CAD=FV=XXxTz8hi92y6p3hX7iVEHuqKHsrKPSnX_a__WCEQRAKw@mail.gmail.com>
 <CACRpkdZVH=h37hSjvjcNmRwV-RoBB-nvUbrOT80DoLr7n81R3Q@mail.gmail.com> <CAD=FV=Vzn0ih_RqR_ySJzFtq0B0x_4a-Uwjk56GeLyUZtTEXrQ@mail.gmail.com>
In-Reply-To: <CAD=FV=Vzn0ih_RqR_ySJzFtq0B0x_4a-Uwjk56GeLyUZtTEXrQ@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 5 May 2021 14:51:14 +0200
Message-ID: <CACRpkdbOpJtoaX7Jayr1-QRvZOjKbt-D0XVy+Xvxga9RULoh1w@mail.gmail.com>
Subject: Re: [PATCH v5 01/20] drm/panel: panel-simple: Add missing
 pm_runtime_disable() calls
To:     Doug Anderson <dianders@chromium.org>
Cc:     Andrzej Hajda <a.hajda@samsung.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
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
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, May 3, 2021 at 10:41 PM Doug Anderson <dianders@chromium.org> wrote:

> > At your convenience and when you think there is too little
> > stuff in your sn65dsi86 TODO, check out
> > pinctrl-bcm63xx.c for an example of select GPIO_REGMAP
> > made very simple (this works fine as long as they are bit
> > offsets starting from 0).
>
> I seem to recall you mentioning something like this. When I looked at
> it in the past I wasn't convinced it would be easy. See my response
> [2]. The rough summary is that I didn't think the helpers were happy
> with the pm_runtime() model that I'm using. Did I get that wrong?

Yeah good point. It does seem a bit too complex for that.
Sorry for not remembering.

Yours,
Linus Walleij
