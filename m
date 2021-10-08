Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D26C342731F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Oct 2021 23:38:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243446AbhJHVkF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Oct 2021 17:40:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231714AbhJHVkC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Oct 2021 17:40:02 -0400
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com [IPv6:2607:f8b0:4864:20::d2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50D69C061755
        for <linux-arm-msm@vger.kernel.org>; Fri,  8 Oct 2021 14:38:06 -0700 (PDT)
Received: by mail-io1-xd2a.google.com with SMTP id i189so4499420ioa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Oct 2021 14:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=b/00gewG7UHvLp0h/Ly/IXeN+qoVZwxiCoqxtVebbaI=;
        b=dQ0efTIPLYgHkP9U3dBEnvmvLY8za0lfnn/jylE/ulZ7zzSc1RBgqjCPWTJbCywGq6
         cpcZej1RcJAyZQ/UhxVaE7tvdYg7DQI/2Els9a0Xjzo6Si3dcWw3ltdvGFRVsCniX3+0
         LABaOfhs3fvNty6v0UECd4B4StXBRl+6QmoiwtXAfBPgIvUqenZJEs+NqDqIM9rGE9Rf
         QhXCblG3djveSWk5T98TPMRXSDvDnmaNIOsPKPZyXJKg4hjzaw+Cv1z4APTMPb1YMLy4
         A3X643heB80Rhlfhmo6o2AFNOf4UfJEKkndgWAky5btmvpHG/9hVh1G1AJGX9Cjolc2i
         WkpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b/00gewG7UHvLp0h/Ly/IXeN+qoVZwxiCoqxtVebbaI=;
        b=7xWe6dtXgtDkBJz4BM1Ax2cfvb+zRQx6Svz7pWjQLU587MDUzZXga9pgcbcnSVifEv
         eLpEZfcygAv2kqgSq/jga9S5f+1z+6YGSG9eMyOKFB7xyGecTvDeR+6xtwxOmFcBNmKU
         xxhJecxGdfk0yeiXUvvSZVPkkLj0dciBccNnJoEFyhNPjNrFOm9DtKt9sYyiWa6ynXtS
         +iCoFW9CmFuwAwrBZ9pmex+mWLg/6xcqyzubsFt+EV2yS24azG8gmA6t4mm7RlkzvMuL
         U/IzC/OV52/zM9RQMvHApSWDHtFGSFpuQsr3r/FsGMosLy9AQ1tV3dPu+bTq8P6C5vOA
         g8gw==
X-Gm-Message-State: AOAM533M7fAtXGGHMOdF3OosFoAQQTfc+Anmfx0qTyBgauxzJ8IYTrJK
        dThTUSFPA354k27dkQN9yaUTYLUG4ewhVz05MHuwxg==
X-Google-Smtp-Source: ABdhPJyTKjP0ROPI3lwiR64pOofPrdgty82JjDrOFyBtUPNFTt7D9ijmUlMj5dyBjrcq0P+6VIjSXFzDNz2EEnEXtzw=
X-Received: by 2002:a6b:f915:: with SMTP id j21mr9273745iog.98.1633729085509;
 Fri, 08 Oct 2021 14:38:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210930030557.1426-1-bjorn.andersson@linaro.org>
 <20210930030557.1426-3-bjorn.andersson@linaro.org> <YV5vIyhy+m+Nx/gQ@ripper>
In-Reply-To: <YV5vIyhy+m+Nx/gQ@ripper>
From:   Doug Anderson <dianders@google.com>
Date:   Fri, 8 Oct 2021 14:37:52 -0700
Message-ID: <CAD=FV=UZoZ6amH9KfJOMWy9AHfGOuEpCPJYDy5YCtks6WqVkLw@mail.gmail.com>
Subject: Re: [PATCH v6 3/3] drm/bridge: ti-sn65dsi86: Implement the pwm_chip
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Robert Foss <robert.foss@linaro.org>
Cc:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Thierry Reding <thierry.reding@gmail.com>,
        "Uwe Kleine-K?nig" <u.kleine-koenig@pengutronix.de>,
        Lee Jones <lee.jones@linaro.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-pwm <linux-pwm@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Oct 6, 2021 at 8:51 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Wed 29 Sep 20:05 PDT 2021, Bjorn Andersson wrote:
>
> > The SN65DSI86 provides the ability to supply a PWM signal on GPIO 4,
> > with the primary purpose of controlling the backlight of the attached
> > panel. Add an implementation that exposes this using the standard PWM
> > framework, to allow e.g. pwm-backlight to expose this to the user.
> >
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>
> Any feedback on this?

I feel like Uwe and you have spent enough time on all the math and it
is clearly working well for you, so I continued to not dive deep into
it. However, in general I think this has been spun enough and it's
ready / beneficial to land.

It sounds like Robert has agreed to do the honors (assuming Uwe acks
patch #1) and that suits me fine.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
