Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A939539E4EC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jun 2021 19:07:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231730AbhFGRJU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Jun 2021 13:09:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231723AbhFGRJR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Jun 2021 13:09:17 -0400
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F5B5C061766
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Jun 2021 10:07:14 -0700 (PDT)
Received: by mail-qk1-x735.google.com with SMTP id j184so17378251qkd.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Jun 2021 10:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RmeYQ/ZjjCaIyjItMjlP85jvXRjCl3Zk4JkEtkJYSBY=;
        b=oISc4cU4YTQkjp0n9pgdr1lbPZXsWrFmqBytfBGf/VTDke+AUi5NgsMmgMWBNX7pOi
         yz01vx6nHE34B+5QvYaAy5AIp1leR3my8AuccPTtPbCsKKS/0rgd+vFejAGV+pC2337M
         Hyu649c0Y6FMGVBtvNZni1VLAGOPfx5AL2Blg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RmeYQ/ZjjCaIyjItMjlP85jvXRjCl3Zk4JkEtkJYSBY=;
        b=gC7HuP1L8RHJ27xkPb9ihik8H/Kd7jzs4XSxr0dObg0ABEJAsjFGXtWGlXJRYKCYON
         0fm5LDiVKoBN8sZKpBy0Pty7uQsff0nrxN39nN6rsZOLy8U1On1tKrH5nFGuRTPfIj23
         v6SsQM1qWKOwq57fW194agluGq1iwDE38RPeDJVVA+Yl/XclVcta4pSprgn+Lu/W9RiX
         mWF2GI8yLalBVQSg0V6K+6tb03wSyeQ8yukjmgO4MParkzY1h5NtZJ/5kJ38U6YFgwux
         V8FrT7Izec9SEDyXJxQ5f7kxOtw4O008RaDN9Wy2yc8Lc0TSVJPfbaSTd0Q6iqyLN7Jw
         BwWg==
X-Gm-Message-State: AOAM531ke6hzPVLO684AR+cIdaLA6JFpnxc/Nm+DpmJvyU60TRSo7ndF
        zjAJv7dKUmps48QW6CrV193FmJtIKCpqkw==
X-Google-Smtp-Source: ABdhPJzMb4JYIU3lszByN19DuVqhASfLd11EW88EW7l3V+liejnfwEYMu4O8jo+H58ImdiFK+viOUg==
X-Received: by 2002:a37:6b47:: with SMTP id g68mr17421835qkc.89.1623085633621;
        Mon, 07 Jun 2021 10:07:13 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com. [209.85.219.180])
        by smtp.gmail.com with ESMTPSA id y20sm9981020qkm.5.2021.06.07.10.07.13
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jun 2021 10:07:13 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id y2so25939759ybq.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Jun 2021 10:07:13 -0700 (PDT)
X-Received: by 2002:a25:8082:: with SMTP id n2mr25004184ybk.79.1623085632738;
 Mon, 07 Jun 2021 10:07:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210525000159.3384921-1-dianders@chromium.org>
 <20210524165920.v8.7.I18e60221f6d048d14d6c50a770b15f356fa75092@changeid> <6e0cd667a8a776e524b42f1535827208@codeaurora.org>
In-Reply-To: <6e0cd667a8a776e524b42f1535827208@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 7 Jun 2021 10:07:01 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UEUsP4qRB-zj31ykS2UznnY=6WF2pD26=FDnVZy6rxCg@mail.gmail.com>
Message-ID: <CAD=FV=UEUsP4qRB-zj31ykS2UznnY=6WF2pD26=FDnVZy6rxCg@mail.gmail.com>
Subject: Re: [PATCH v8 07/11] drm/panel: panel-simple: Stash DP AUX bus; allow
 using it for DDC
To:     Rajeev Nandan <rajeevny@codeaurora.org>
Cc:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Sam Ravnborg <sam@ravnborg.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linus W <linus.walleij@linaro.org>,
        Lyude Paul <lyude@redhat.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Steev Klimaszewski <steev@kali.org>,
        Rob Clark <robdclark@chromium.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thierry Reding <treding@nvidia.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Thierry Reding <thierry.reding@gmail.com>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Jun 4, 2021 at 9:10 AM <rajeevny@codeaurora.org> wrote:
>
> Hi Doug,
>
> >       panel->no_hpd = of_property_read_bool(dev->of_node, "no-hpd");
> >       if (!panel->no_hpd) {
> > @@ -708,6 +712,8 @@ static int panel_simple_probe(struct device *dev,
> > const struct panel_desc *desc)
> >
> >               if (!panel->ddc)
> >                       return -EPROBE_DEFER;
> > +     } else if (aux) {
> > +             panel->ddc = &aux->ddc;
> >       }
>
> In panel_simple_probe(), the put_device(&panel->ddc->dev) call is
> causing issue when the aux->ddc is used to assign panel->ddc
> It works well when "ddc-i2c-bus" is used to assign panel->ddc
>
> static int panel_simple_probe(...)
> {
> ...
>
> free_ddc:
>          if (panel->ddc)
>                  put_device(&panel->ddc->dev);
>
>          return err;
> }

Thanks for catching! Fixed in v9.


-Doug
