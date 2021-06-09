Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FF803A1210
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jun 2021 13:09:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236705AbhFILLC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Jun 2021 07:11:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236416AbhFILLB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Jun 2021 07:11:01 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD1FBC061574
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Jun 2021 04:08:53 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id n17so13995422ljg.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Jun 2021 04:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UjzND9QnxwT8ifLhktgAKCRkzmnIT7lNJ4apsIOpbtw=;
        b=dBMRi3EmuIA041sODLhPvK+P60mTibEwJWo7dwzWinbjydvuRwgJHJvzNtChXBgd+4
         hjkivI5u/QbQrRBzaRU5Xsj//Y7mWrxSXSttBk5ltjsww5Zxy5yQrd+j8PamxA+1NqTk
         EzLmJJSA5lZexPPtpMa4HxUv6esdGsupwC+lZCCs4Y0hzjCoOVUqrLx8BEV02YD0RKTl
         vlsilNgiomDc2nbZf3Ya5H4HZxViabIa3gd/K2fnZlJqtTf4cOj0MLy6rMy/fphZ+O/E
         5YAIDWrIhxiVToPS+kl6FrWjFnwBjVu1Uuk9hE3bWP14rFI1mrm2NP+c3tRxSXCU6jrX
         rJSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UjzND9QnxwT8ifLhktgAKCRkzmnIT7lNJ4apsIOpbtw=;
        b=bD7s2v3G80x1M+8s3cWXFIPtFlDOfCMBqC1YoMD40aAbweMf+pJ6kU+K1mr3IKatTv
         Aea2M/NL7f+yfJH2qlbCj2PPuVdtVTMbYrlZiGU9wlCZFS5A88ZxWfgBsWDVM/aZnDT9
         kGQ6PftBeJpK2fFtExvUe26ItkETIORf0R9RiLffJ5ZlcfPqE9sE8+DC5e9X9+1wB+WZ
         Bgye8y+BkYXc96Gm0KJujSWwKfss93YfEq8f6YvAI0QH6VUrJFyrSRcC5XskWgU3/gvp
         DKb9nuKrnZnIreC2eibrJyPCsTtxvvaCWUptHS8keNdIBfbxsNtg9HeSIGhSFKfHUUoi
         3W2Q==
X-Gm-Message-State: AOAM5306Dnq5PGuuHCshtM7VlJcmD2dJe2i77hJTpSYNy2OMHiL2zPUw
        acUd4edaHPnVdwIS6zA3Ce1K380nnJqLicIedrmzmA==
X-Google-Smtp-Source: ABdhPJykUmPRzCleHYD3OvQZymAb45ky68Al8YzP3yNAw/wnHb+nvI8h+4+IwRpDxc60T+bXfIuOSqUjSlY8+FPslE4=
X-Received: by 2002:a05:651c:4c6:: with SMTP id e6mr21911588lji.326.1623236931972;
 Wed, 09 Jun 2021 04:08:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210607170555.4006050-1-dianders@chromium.org> <20210607100234.v9.7.If89144992cb9d900f8c91a8d1817dbe00f543720@changeid>
In-Reply-To: <20210607100234.v9.7.If89144992cb9d900f8c91a8d1817dbe00f543720@changeid>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 9 Jun 2021 13:08:41 +0200
Message-ID: <CACRpkdZ82tQw5wLXcJ4SwYr4_T+tmc93a-E_AED2dd7MzQ0h=Q@mail.gmail.com>
Subject: Re: [PATCH v9 07/11] drm/bridge: ti-sn65dsi86: Promote the AUX
 channel to its own sub-dev
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Sam Ravnborg <sam@ravnborg.org>,
        Rob Clark <robdclark@chromium.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
        Steev Klimaszewski <steev@kali.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Thierry Reding <treding@nvidia.com>,
        Lyude Paul <lyude@redhat.com>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Robert Foss <robert.foss@linaro.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jun 7, 2021 at 7:06 PM Douglas Anderson <dianders@chromium.org> wrote:

> On its own, this change looks a little strange and doesn't do too much
> useful. To understand why we're doing this we need to look forward to
> future patches where we're going to probe our panel using the new DP
> AUX bus. See the patch ("drm/bridge: ti-sn65dsi86: Add support for the
> DP AUX bus").
>
> Let's think about the set of steps we'll want to happen when we have
> the DP AUX bus:
>
> 1. We'll create the DP AUX bus.
> 2. We'll populate the devices on the DP AUX bus (AKA our panel).
> 3. For setting up the bridge-related functions of ti-sn65dsi86 we'll
>    need to get a reference to the panel.
>
> If we do #1 - #3 in a single probe call things _mostly_ will work, but
> it won't be massively robust. Let's explore.
>
> First let's think of the easy case of no -EPROBE_DEFER. In that case
> in step #2 when we populate the devices on the DP AUX bus it will
> actually try probing the panel right away. Since the panel probe
> doesn't defer then in step #3 we'll get a reference to the panel and
> we're golden.
>
> Second, let's think of the case when the panel returns
> -EPROBE_DEFER. In that case step #2 won't synchronously create the
> panel (it'll just add the device to the defer list to do it
> later). Step #3 will fail to get the panel and the bridge sub-device
> will return -EPROBE_DEFER. We'll depopulate the DP AUX bus. Later
> we'll try the whole sequence again. Presumably the panel will
> eventually stop returning -EPROBE_DEFER and we'll go back to the first
> case where things were golden. So this case is OK too even if it's a
> bit ugly that we have to keep creating / deleting the AUX bus over and
> over.
>
> So where is the problem? As I said, it's mostly about robustness. I
> don't believe that step #2 (creating the sub-devices) is really
> guaranteed to be synchronous. This is evidenced by the fact that it's
> allowed to "succeed" by just sticking the device on the deferred
> list. If anything about the process changes in Linux as a whole and
> step #2 just kicks off the probe of the DP AUX endpoints (our panel)
> in the background then we'd be in trouble because we might never get
> the panel in step #3.
>
> Adding an extra sub-device means we just don't need to worry about
> it. We'll create the sub-device for the DP AUX bus and it won't go
> away until the whole ti-sn65dsi86 driver goes away. If the bridge
> sub-device defers (maybe because it can't find the panel) that won't
> depopulate the DP AUX bus and so we don't need to worry about it.
>
> NOTE: there's a little bit of a trick here. Though the AUX channel can
> run without the MIPI-to-eDP bits of the code, the MIPI-to-eDP bits
> can't run without the AUX channel. We could come up a complicated
> signaling scheme (have the MIPI-to-eDP bits return EPROBE_DEFER for a
> while or wait on some sort of completion), but it seems simple enough
> to just not even bother creating the bridge device until the AUX
> channel probes. That's what we'll do.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Lyude Paul <lyude@redhat.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
