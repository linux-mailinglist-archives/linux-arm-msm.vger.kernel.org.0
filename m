Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D896B36DD50
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Apr 2021 18:45:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241122AbhD1QqQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Apr 2021 12:46:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231923AbhD1QqQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Apr 2021 12:46:16 -0400
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DE8DC061573
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Apr 2021 09:45:30 -0700 (PDT)
Received: by mail-qt1-x832.google.com with SMTP id l1so7339820qtr.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Apr 2021 09:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rrj3UlBlJ91qMWs4IlTPGuw8X2L/oNKhyyRLTCh8fWE=;
        b=lf++hd/X6bQjKPClgG4WlPiLlx0SEPhHDHsu8w5ZyHb/uz+XduZNY+A0zluRDDQxjc
         L2fOBYoKdVMfh8CB6Dxs6hGNXdaO+l98nAg/bwFcadAUV1wPG3qXuF3ERBWSvSCt0Zrg
         UiDRc/2MnqpGGBT99Roig9k+c6ycmYY0gP8j8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rrj3UlBlJ91qMWs4IlTPGuw8X2L/oNKhyyRLTCh8fWE=;
        b=JvIkhco3jN88e35yGRkat7lmQRM4s29xpxEzWy3BzyaqN/p+IWRvHjqinuNO5nHnVH
         x32bVZoBxktdF8pzRA2KxL982jJ1KDkQdDie2nT+mAmw3ZWR+Y9t0JxOfjSqlMPkAle9
         NEUzlibqHuBlJnpbc0w8ONwhneMrbKZ6UWGY4Oy5ll8sExv/QxP63EcSW8j4cNGvRYgf
         1GRqbq3Y7Mk1g2ymj5RZ2yjAs+IT7De38UtliEtYjZT88B9Nq9WZClPxpW/89+IHbcZx
         pduHRELj6aFimiB1xBP2VHlVKjTLIEUjGgoFJps9W0CWZuk6pvWSkK2TJnq6NOBEcNcF
         TWCw==
X-Gm-Message-State: AOAM531Up4lzh43HxIRUlyMn3uiMdvOHgLTUm6v/KzpsuOLB9hQyPmEL
        RXZXXZFAUTVv5PBirxJx6hEzcVWIubRAyQ==
X-Google-Smtp-Source: ABdhPJy24H1AfS5q40EKKeARPAcB+o20kiJvb8r+IRq44Roh67pksD3EHk6pnJXKv5OiCwqQXW7VvA==
X-Received: by 2002:ac8:78b:: with SMTP id l11mr27512520qth.321.1619628329669;
        Wed, 28 Apr 2021 09:45:29 -0700 (PDT)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com. [209.85.219.170])
        by smtp.gmail.com with ESMTPSA id c29sm357707qtv.93.2021.04.28.09.45.26
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Apr 2021 09:45:27 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id s9so16394032ybe.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Apr 2021 09:45:26 -0700 (PDT)
X-Received: by 2002:a25:7157:: with SMTP id m84mr42521872ybc.175.1619628324558;
 Wed, 28 Apr 2021 09:45:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210423165906.2504169-1-dianders@chromium.org> <20210423095743.v5.17.Ibd31b8f7c73255d68c5c9f5b611b4bfaa036f727@changeid>
In-Reply-To: <20210423095743.v5.17.Ibd31b8f7c73255d68c5c9f5b611b4bfaa036f727@changeid>
From:   Sean Paul <seanpaul@chromium.org>
Date:   Wed, 28 Apr 2021 12:44:45 -0400
X-Gmail-Original-Message-ID: <CAOw6vbLqDgqhXH8pUZqfhKCZk68SfzLf76Z4au3g83=Uw_8z2Q@mail.gmail.com>
Message-ID: <CAOw6vbLqDgqhXH8pUZqfhKCZk68SfzLf76Z4au3g83=Uw_8z2Q@mail.gmail.com>
Subject: Re: [PATCH v5 17/20] drm/panel: panel-simple: Power the panel when
 reading the EDID
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Sam Ravnborg <sam@ravnborg.org>, Wolfram Sang <wsa@kernel.org>,
        robdclark@chromium.org,
        dri-devel <dri-devel@lists.freedesktop.org>,
        David Airlie <airlied@linux.ie>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Steev Klimaszewski <steev@kali.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-i2c@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Apr 23, 2021 at 1:00 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> I don't believe that it ever makes sense to read the EDID when a panel
> is not powered and the powering on of the panel is the job of
> prepare(). Let's make sure that this happens before we try to read the
> EDID. We use the pm_runtime functions directly rather than directly
> calling the normal prepare() function because the pm_runtime functions
> are definitely refcounted whereas it's less clear if the prepare() one
> is.
>
> NOTE: I'm not 100% sure how EDID reading was working for folks in the
> past, but I can only assume that it was failing on the initial attempt
> and then working only later. This patch, presumably, will fix that. If
> some panel out there really can read the EDID without powering up and
> it's a big advantage to preserve the old behavior we can add a
> per-panel flag. It appears that providing the DDC bus to the panel in
> the past was somewhat uncommon in any case.
>

Maybe some combination of drivers caching the EDID for panels while
they're already powered and overly broad pm runtime references?

At any rate, this makes sense to me,

Reviewed-by: Sean Paul <seanpaul@chromium.org>

> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>
> (no changes since v1)
>
>  drivers/gpu/drm/panel/panel-simple.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 4de33c929a59..a12dfe8b8d90 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -510,12 +510,18 @@ static int panel_simple_get_modes(struct drm_panel *panel,
>
>         /* probe EDID if a DDC bus is available */
>         if (p->ddc) {
> -               struct edid *edid = drm_get_edid(connector, p->ddc);
> +               struct edid *edid;
>
> +               pm_runtime_get_sync(panel->dev);
> +
> +               edid = drm_get_edid(connector, p->ddc);
>                 if (edid) {
>                         num += drm_add_edid_modes(connector, edid);
>                         kfree(edid);
>                 }
> +
> +               pm_runtime_mark_last_busy(panel->dev);
> +               pm_runtime_put_autosuspend(panel->dev);
>         }
>
>         /* add hard-coded panel modes */
> --
> 2.31.1.498.g6c1eba8ee3d-goog
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
