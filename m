Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E33FF1CF447
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2020 14:22:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729229AbgELMWO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 May 2020 08:22:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726891AbgELMWO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 May 2020 08:22:14 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8831DC061A0E
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2020 05:22:12 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id f18so13359336lja.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2020 05:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6rE0fPu5jCjuTK0cRn6PVF83ctsvQUR9eqdpVEWEcp8=;
        b=fRMfmTqU/svnwd/DeHQpZqANKDRENpPQrFnFCdA6XrC7CAjuUBlWO5WlHhJX1VdFZx
         GMq8lToALBRe4c2J8T+QxKo9JnROag//KysTHoivaIxpklZerMhBClnLLRGkf6GTvxAZ
         HkmO3moxLpKmk6A6rO8oP7BDRG8DnImZgtRVlxbihuFkbxwz1Ua1Vkr2ST+iiVDtsiMz
         +M1+jQ3zq3lb0Xi3P6DDhvioJsSDIiVLJW6i37AU92QD1VUuBYzTzk/eg8zmrLXxDlHD
         ODaToJfeFvwuXa2LV7sZKRly/f9mFOUS9o9v8dILxoPCrjdsYLDHOnR6njLXYMKzYGwc
         5uhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6rE0fPu5jCjuTK0cRn6PVF83ctsvQUR9eqdpVEWEcp8=;
        b=QsDFMH4bJatRv+szHG+3ITEP1ben+JgB/FrFtsMqQL7/EpomqSRKZyf9Xkq49X8swF
         QfoS/0ziLY3jOgur/RLJu2GYSFTNj5uF8rrNRqdkrPOMPoujN+dZdwp6X/EHfdpIAzC8
         8+6P+D4dElzyWUgNEv5igEcPLhgFOzldrOiAuuFz1X7QpqhPMk3cXMiUZ3nat5c42cu/
         wclkgi/bL0WEQIrnLhfJC2lISbKSpVV0YOoh+Oi/9VD8Ke14ddVC/Pf3yR4dbvjzUsC7
         M8PFXC5ckDJ5YOPULZKeOyspjcmGCrOL36Pliku48CbZVDqWBROTdgpWaSeY+QSKRbMh
         ecxg==
X-Gm-Message-State: AOAM531wF7dj1AHgfqCvopkzKe2LLXkM9EsJXnzsoCWzUx3Ej3AoOkCO
        kt1/KQbdbnY1IU5XiEyFoaDFcfqqJkxYcU/i+/EuTA==
X-Google-Smtp-Source: ABdhPJwIPX2HNFOXh8yU8/OwdxhhRENdd70ug7z8dIHFgzX2fvXuP4+XvRAkuMUcWF3Sb2fH8n4awGxwbFbw77QNBx8=
X-Received: by 2002:a2e:9c97:: with SMTP id x23mr1647314lji.39.1589286131013;
 Tue, 12 May 2020 05:22:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200430194617.197510-1-dianders@chromium.org>
 <20200430124442.v4.1.Ia50267a5549392af8b37e67092ca653a59c95886@changeid> <CAD=FV=WHoxdr++f7Y_NO=VnrnEPkP=+WS5u3j_5ifEjekhBWcA@mail.gmail.com>
In-Reply-To: <CAD=FV=WHoxdr++f7Y_NO=VnrnEPkP=+WS5u3j_5ifEjekhBWcA@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 12 May 2020 14:22:00 +0200
Message-ID: <CACRpkdb22QrOcJXrR1je9Cf8S9LnKCcnQ92ML2xQhncraKC1Pw@mail.gmail.com>
Subject: Re: [PATCH v4 1/6] drm/bridge: ti-sn65dsi86: Export bridge GPIOs to Linux
To:     Doug Anderson <dianders@chromium.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Sandeep Panda <spanda@codeaurora.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Jonas Karlman <jonas@kwiboo.se>,
        Rob Clark <robdclark@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Stephen Boyd <swboyd@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, May 7, 2020 at 4:39 PM Doug Anderson <dianders@chromium.org> wrote:

> One suggestion that came off-list is to change the code to make the
> numbering match up better with the datasheet.  Right now if you want
> GPIO 2 you have to refer to it like:
>
> hpd-gpios = <&sn65dsi86_bridge 1 GPIO_ACTIVE_HIGH>;
>
> That's because the code right now numbers things starting at 0 even if
> the datasheet numbers things starting at 1.

This is the hallmark of mixed-mode IC engineers at work.
They are at heart analog IC designers so of course they
enumerate everything starting at 1.

Digital IC designers are like programmers and start on 0.

Never the twain shall meet...

Yours,
Linus Walleij
