Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5536C3504E2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Mar 2021 18:44:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234146AbhCaQnh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Mar 2021 12:43:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233950AbhCaQnU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Mar 2021 12:43:20 -0400
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2ED6C061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Mar 2021 09:43:19 -0700 (PDT)
Received: by mail-qk1-x733.google.com with SMTP id c4so19972582qkg.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Mar 2021 09:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VO+UUFNdki+F7xgaS2mK6aIBg7EST205oZYqbmljPz0=;
        b=hJ5Ug+Pyr8mj+ETexnOPGtlGqIF72PVbEoX6nARIHgLbRfNVoOsorpNYDzXcrvjHZ0
         HWDL2DOKo3VlO7/+6109vHwy15UC6IiiknGKCjWPkF1RwpL6wyPoFUsQo5DDz/fHwhLp
         r/Ur43R+d5yVjMN6SXQZRnBeyt4M9Z/8sgRk0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VO+UUFNdki+F7xgaS2mK6aIBg7EST205oZYqbmljPz0=;
        b=QMkLknWDtnuSzjnfCS+sYk79f7zPQQMHKHCDFWbJ1X1p/kny8HYFv9sP4YF81wtrYf
         M9dbBckP1+MI+OQ1EWMIUQONS4eLNYnmozFB5Wi4NOo4H+CXWqDb2heIv4SDzC6Mz1MX
         beeeCk+MXTCqS2bx1qwLOP9Ixkc9QWuNlEQsVNCH/ZxtK3WD4JcS0ncer2oSZacfG2m5
         tFRZnmhFVtau31bgGtSdi/eE3K/s4/QGR3qB03sj2ZPiCAlGs65KOxwBis+33pID/WKc
         S7Du11HzNhyefONI5qHYk+dnpIl864WFpxAKXSMaJsJl7jc3yWW31oydmjrmvALuAcvw
         qvsA==
X-Gm-Message-State: AOAM532ZtwwzNj0OPcJ0QhAyFybWwRfP6SyuEzwfWtHPf9oPFi3lM4+9
        MB5d/DEZ2/ysSBkyYvhF3bYrE17l4YjkbA==
X-Google-Smtp-Source: ABdhPJwq8UpEu9fjW34h/gDVrIadJ1xcHBuKZ3wKvbmPIWzYCIFs5gEVsUYOTaQNxTMUCniAVwDcEA==
X-Received: by 2002:a37:b801:: with SMTP id i1mr4017970qkf.133.1617208998601;
        Wed, 31 Mar 2021 09:43:18 -0700 (PDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id v7sm1805263qkv.86.2021.03.31.09.43.17
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Mar 2021 09:43:17 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id j2so21837183ybj.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Mar 2021 09:43:17 -0700 (PDT)
X-Received: by 2002:a25:8712:: with SMTP id a18mr162712ybl.79.1617208996943;
 Wed, 31 Mar 2021 09:43:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210330025345.3980086-1-dianders@chromium.org>
 <CGME20210330025417eucas1p29eca41bbcfc2550902cee87fd44b98e4@eucas1p2.samsung.com>
 <20210329195255.v2.5.I1a9275ffbde1d33ad7a3af819f5fbc0941b7ee02@changeid> <00fc2110-d30a-d8f2-b22b-a5c73b54127d@samsung.com>
In-Reply-To: <00fc2110-d30a-d8f2-b22b-a5c73b54127d@samsung.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 31 Mar 2021 09:43:05 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V9uMpPbXxoNd2DpvtX=nEb1RFdbZ5bV8ZGhNpOVMJtOg@mail.gmail.com>
Message-ID: <CAD=FV=V9uMpPbXxoNd2DpvtX=nEb1RFdbZ5bV8ZGhNpOVMJtOg@mail.gmail.com>
Subject: Re: [PATCH v2 05/14] drm/bridge: ti-sn65dsi86: Move MIPI detach() /
 unregister() to detach()
To:     Andrzej Hajda <a.hajda@samsung.com>
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Sam Ravnborg <sam@ravnborg.org>,
        Rob Clark <robdclark@chromium.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        David Airlie <airlied@linux.ie>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Steev Klimaszewski <steev@kali.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
        Robert Foss <robert.foss@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Mar 31, 2021 at 2:53 AM Andrzej Hajda <a.hajda@samsung.com> wrote:
>
>
> W dniu 30.03.2021 o 04:53, Douglas Anderson pisze:
> > The register() / attach() for MIPI happen in the bridge's
> > attach(). That means that the inverse belongs in the bridge's
> > detach().
>
>
> As I commented in previous patch, it would be better to fix mipi/bridge
> registration order in host and this driver.
>
> Have you considered this?

Fair enough. How about I drop this patch at the moment? My series
already has enough stuff in it right now and I don't believe anything
in the series depends on this patch.

-Doug
