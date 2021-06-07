Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 855B839E4F8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jun 2021 19:08:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230267AbhFGRKe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Jun 2021 13:10:34 -0400
Received: from mail-qk1-f179.google.com ([209.85.222.179]:37647 "EHLO
        mail-qk1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230378AbhFGRKe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Jun 2021 13:10:34 -0400
Received: by mail-qk1-f179.google.com with SMTP id i67so17367144qkc.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Jun 2021 10:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Vmc21GFO17uaFIYIEI6ngL7qf7K+9zFe/VHNqdjyLTk=;
        b=Sw3lO1CuIlIW8p7F9X3EIJWbHqckmdlxzrp7zumdiztpcK0kS+1dg7doroe67j7AiX
         6ISqph79TFZjX9hMy/r/UF0kMeh+9gTRwhS6SEVotj3vIXHu9xL9KDu9UuiK20DXefxL
         8T3IDs+fg77gOa1QGIfGtyYVVNonxe2aZ5rrk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Vmc21GFO17uaFIYIEI6ngL7qf7K+9zFe/VHNqdjyLTk=;
        b=WvgHluLs1RbPFk+fAQAD0Z9kGBdkTjqjYBKgXqY9/qFQrnjcUSaa41hU+YptN3m5ha
         zooIWBOdSHiKVZe/QzW4HqQAJDjRduB1KyRXe04BlbMGK+TnWj6bs45h/DXXEQ5QDMeK
         FC8a1xxbyvTvOjWLsxKildQ9QCv1AamgN5xSZxNEa5g8Ninbfdphb1JI3O8CW0bVzVh0
         /yGqdeaHSPqaefyMS/iEKw9XBrsQo8970APkDe6HY/EA2AOZQtSbI2kILHNrcGeD47aY
         9RZkuoNReAfk0CCMtvX7ZsmmfKMgg6x2gBhSz2VNJpofB8OWhqt6N0JIXEqmvCyCYsNw
         r/Vg==
X-Gm-Message-State: AOAM530EvY2RsJqoqY1GDq02J47XfZoja2i36mahbJBEafe0WiAHCYKN
        VT3S1mXrI0x9C+aniyOlM2zY5WuUqzWHBg==
X-Google-Smtp-Source: ABdhPJwmwCoj1qzQRiQ+BMvJPvWeUkDN26b4SNP2LdnQGik9QLOIJ8t4UyGS2iIbNdag26Lo0XJjlQ==
X-Received: by 2002:a05:620a:9d7:: with SMTP id y23mr5338551qky.227.1623085645894;
        Mon, 07 Jun 2021 10:07:25 -0700 (PDT)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com. [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id b123sm10562870qke.87.2021.06.07.10.07.24
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jun 2021 10:07:25 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id q21so25985983ybg.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Jun 2021 10:07:24 -0700 (PDT)
X-Received: by 2002:a25:ab4b:: with SMTP id u69mr25982035ybi.276.1623085644485;
 Mon, 07 Jun 2021 10:07:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210525000159.3384921-1-dianders@chromium.org>
 <20210524165920.v8.8.If89144992cb9d900f8c91a8d1817dbe00f543720@changeid> <YLxRyC9eNlg+Uex3@builder.lan>
In-Reply-To: <YLxRyC9eNlg+Uex3@builder.lan>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 7 Jun 2021 10:07:13 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UZkzKG6EJFAU9jCjb-twChzCH+JtcL5a9VyO5dxSdOwA@mail.gmail.com>
Message-ID: <CAD=FV=UZkzKG6EJFAU9jCjb-twChzCH+JtcL5a9VyO5dxSdOwA@mail.gmail.com>
Subject: Re: [PATCH v8 08/11] drm/bridge: ti-sn65dsi86: Promote the AUX
 channel to its own sub-dev
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Sam Ravnborg <sam@ravnborg.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linus W <linus.walleij@linaro.org>,
        Lyude Paul <lyude@redhat.com>,
        Steev Klimaszewski <steev@kali.org>,
        Rob Clark <robdclark@chromium.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thierry Reding <treding@nvidia.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Robert Foss <robert.foss@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Sat, Jun 5, 2021 at 9:40 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> > +     /*
> > +      * We couldn't do this pre-probe because it would confuse pinctrl.
> > +      * It would have tried to grab the same pins that the main device had.
> > +      * Set it now so that we can put the proper (sub) device in the aux
> > +      * structure and it will have the right node.
> > +      */
> > +     adev->dev.of_node = pdata->dev->of_node;
>
> I suspect the refcount of the of_node will be wrong here and upon
> removing the aux device things will be off...
>
> Instead, I think you're looking for device_set_of_node_from_dev(), which
> also sets of_node_reused, which in turn causes pinctrl_bind_pins() to be
> skipped - i.e. it seems to deal with the problem your comment describes.

You rock! This is exactly what I wanted. I wish I had thought to look
for it--I somehow just assumed that this wasn't already a solved
problem.

-Doug
