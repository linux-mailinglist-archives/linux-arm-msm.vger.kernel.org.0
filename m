Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B853236DD32
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Apr 2021 18:38:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241066AbhD1Qjj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Apr 2021 12:39:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241055AbhD1Qji (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Apr 2021 12:39:38 -0400
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com [IPv6:2607:f8b0:4864:20::f2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBFC2C061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Apr 2021 09:38:53 -0700 (PDT)
Received: by mail-qv1-xf2e.google.com with SMTP id 3so6293119qvp.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Apr 2021 09:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ouf+5ZvIPbhOgiylW2yryEkXKmUKnkmHbAua9prhku0=;
        b=OqgDSWd0iwEYtrbB/lTWLSzGXqCXPeg8wHFOtfFXOKuVb9Lh/xMAhwgSkqipouV8PI
         4FONKugSbjATl2gMXT0mpO9v19lDf6J46Pfi+5MyjUpJYceeV9KnWXlFAnk+IYC5cDLv
         Ljni0gGHvU3IbxcjFaToo/+d7k+7c8D+AbLTg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ouf+5ZvIPbhOgiylW2yryEkXKmUKnkmHbAua9prhku0=;
        b=A4gl5Q5bAO30gZxi0HazQRjgn36CiVpu3aphaeKinIEtHD12F1nMmpQNArldApkRFk
         Rcflm31FpM/i1jwwt3Lovud0revp4VjraButVBO5F+bJo9J9XPjqr7S/Rm0cD3XIoUkZ
         DF8QwpRGPXRuz/G6I4OmtM4W7WKlL1idsFsJWDWia995kMh/clXpSIVWULOoOW38FvpV
         j1CbH4uuYq4Oy5D6brKUv0oLSxutdNEX+4WpXskSBYroFZ2lyZSgzWEfptvMYLXLwtaj
         /uc/W4/UrPganntdG6LECyO12CT92kPsxucmvnbSQLNCXCQu2HVq+5eDzbZcoaI6tAbc
         Fr7Q==
X-Gm-Message-State: AOAM532a86cy4Q/9nWehAMGfyIZkFAUGUc91yWNXNxvsZYxHT+mkLrEg
        Sp3KBtMOFLC+UhEobvyE3H+lkXjTGaTqLA==
X-Google-Smtp-Source: ABdhPJzoF//uZc0nmiG/SUh44s9xot8mNnL5VcBx1vseoGhaTjDc2p7eoGQMZ4+I6nm/b1TClsMcFQ==
X-Received: by 2002:a0c:de0d:: with SMTP id t13mr119917qvk.7.1619627932452;
        Wed, 28 Apr 2021 09:38:52 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id i6sm153510qkf.96.2021.04.28.09.38.51
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Apr 2021 09:38:51 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id q192so21047963ybg.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Apr 2021 09:38:51 -0700 (PDT)
X-Received: by 2002:a25:6c0a:: with SMTP id h10mr40506121ybc.167.1619627930452;
 Wed, 28 Apr 2021 09:38:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210423165906.2504169-1-dianders@chromium.org> <20210423095743.v5.16.Icb581b0273d95cc33ca38676c61ae6d7d2e75357@changeid>
In-Reply-To: <20210423095743.v5.16.Icb581b0273d95cc33ca38676c61ae6d7d2e75357@changeid>
From:   Sean Paul <seanpaul@chromium.org>
Date:   Wed, 28 Apr 2021 12:38:12 -0400
X-Gmail-Original-Message-ID: <CAOw6vbJOOEi9zyRnSMDL=qLMQPXU1uPwQ-K435_1uipcyqyUJQ@mail.gmail.com>
Message-ID: <CAOw6vbJOOEi9zyRnSMDL=qLMQPXU1uPwQ-K435_1uipcyqyUJQ@mail.gmail.com>
Subject: Re: [PATCH v5 16/20] drm/panel: panel-simple: Remove extra call: drm_connector_update_edid_property()
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
> As of commit 5186421cbfe2 ("drm: Introduce epoch counter to
> drm_connector") the drm_get_edid() function calls
> drm_connector_update_edid_property() for us. There's no reason for us
> to call it again.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Reviewed-by: Sean Paul <seanpaul@chromium.org>

> ---
> As Laurent pointed out [1] this is actually a pretty common
> problem. His suggestion to do this more broadly is a good idea but
> this series is probably a bit ambitious already so I would suggest
> that be taken up separately.
>
> [1] https://lore.kernel.org/r/YGphgcESWsozCi1y@pendragon.ideasonboard.com
>
> (no changes since v1)
>
>  drivers/gpu/drm/panel/panel-simple.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index bd208abcbf07..4de33c929a59 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -512,7 +512,6 @@ static int panel_simple_get_modes(struct drm_panel *panel,
>         if (p->ddc) {
>                 struct edid *edid = drm_get_edid(connector, p->ddc);
>
> -               drm_connector_update_edid_property(connector, edid);
>                 if (edid) {
>                         num += drm_add_edid_modes(connector, edid);
>                         kfree(edid);
> --
> 2.31.1.498.g6c1eba8ee3d-goog
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
