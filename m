Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C41523DAE17
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jul 2021 23:19:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233660AbhG2VTm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Jul 2021 17:19:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233571AbhG2VTl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Jul 2021 17:19:41 -0400
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com [IPv6:2607:f8b0:4864:20::f34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 348B1C061765
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jul 2021 14:19:38 -0700 (PDT)
Received: by mail-qv1-xf34.google.com with SMTP id g6so4128746qvj.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jul 2021 14:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hI5gfLyD1Tzqc9HNbOUWHN5K+jDpUpe1OJ1d5jQQrt0=;
        b=PS5qQxOVGyVqgHrT4neWt8aUIyQ4OcaRSh3jgNavcE96MgC4OTRNgy+ykmimuMCCMj
         BEUrUvwzxDaWp94PgIisXpFJiI8jiWqdGY7JkkzOdJ2n8AD7HacClwU0tDD9ouhFHR9p
         ImZ5RVfunFsymGWcWNjeSM7OKB8lzdLtQDAHA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hI5gfLyD1Tzqc9HNbOUWHN5K+jDpUpe1OJ1d5jQQrt0=;
        b=RUuQYAhROmbxnlOHRUYLCYyY+IbCA7FO6c3jpcvltKdjnB2mSFK29QPVuK5U7RrtX0
         Ks8EgQayyl8CGSsLoL63KaY+1kFXYHhmLir0mSJQeJDDMBWMCDJrRFf9yC+Rc/O4NGBx
         DmaQa4LzjgODvwpgOC9NgiYj5japSkhtb0Sw//J6dG7ks056IgcAcpVZJhyNaE4jSCxv
         NC+E9fEx/8TKWMtJBA2naLdJRJr0BA5VjugYHS9OQmYVmw0TqQJQWS7SyPHtcTgkRgeR
         u3VA8NKrCr7dd9WbiL5Y3sCAjhW4qY/Ogt+DRDY4xV/lDFxBFLhTSO23gSpxkKdWqe3W
         uA8g==
X-Gm-Message-State: AOAM532o8QPhsSoyiOiiRj3ebTpDMkzyHK3BvjqnTEkBmQMmh2FEpJM+
        zxNDZZJqYKBLfcoqwJ6/4BPmFAw/Zp/cLg==
X-Google-Smtp-Source: ABdhPJycVx275vr7FOWC0+351ebDbRuFIgkOCZ8tD2QIwc+vVIBmXgD1W6mLVf8pJDuRSwqcZf1ChA==
X-Received: by 2002:ad4:4f06:: with SMTP id fb6mr1848626qvb.37.1627593577231;
        Thu, 29 Jul 2021 14:19:37 -0700 (PDT)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com. [209.85.219.170])
        by smtp.gmail.com with ESMTPSA id d129sm2416783qkf.136.2021.07.29.14.19.35
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jul 2021 14:19:35 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id a201so12372966ybg.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jul 2021 14:19:35 -0700 (PDT)
X-Received: by 2002:a25:2904:: with SMTP id p4mr9170962ybp.276.1627593575191;
 Thu, 29 Jul 2021 14:19:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210723002146.1962910-1-dianders@chromium.org>
 <20210722172104.RFC.1.I1116e79d34035338a45c1fc7cdd14a097909c8e0@changeid> <YQMPOxfQw7zx6evp@robh.at.kernel.org>
In-Reply-To: <YQMPOxfQw7zx6evp@robh.at.kernel.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 29 Jul 2021 14:19:23 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XYfQkuPseBq32rf2qiiv4fn2uf2wWv7FT3pjkRF9ugdA@mail.gmail.com>
Message-ID: <CAD=FV=XYfQkuPseBq32rf2qiiv4fn2uf2wWv7FT3pjkRF9ugdA@mail.gmail.com>
Subject: Re: [RFC PATCH 1/8] dt-bindings: drm/panel-simple: Introduce generic
 eDP panels
To:     Rob Herring <robh@kernel.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Steev Klimaszewski <steev@kali.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        David Airlie <airlied@linux.ie>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
        Maxime Ripard <mripard@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linus W <linus.walleij@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Jul 29, 2021 at 1:27 PM Rob Herring <robh@kernel.org> wrote:
>
> IMO, you should move any applicable compatibles to the edp-panel schema.
> Also, I don't think you should add 'edp-panel' to them. If they can work
> better with the generic eDP driver, then that should be an internal
> kernel change without a DT change. Also, if 2 different drivers match on
> compatible, it's a roll of the dice which driver binds.

So overall what I was going for is this:

1. I want to be able to specify _just_ "edp-panel" for new boards.
We'll make sure this is how it looks on devices that go through the
factory and thus we can make sure that the driver can recognize all
panels that get shipped.

2. For existing boards, I'd like to be able to move them to use
"edp-panel" but I'm less confident that I can really say exactly what
panels are out there in the field. Even though our device tree has
always listed only one panel, in truth boards have shipped with more
than one and they've just been "compatible enough" with each other
(this "white lie" is what I'm trying to fix). If somehow the generic
"edp-panel" doesn't recognize a panel then I wanted to be able to use
the old timings we'd always had before as a "fallback". That means
that logically I wanted "edp-panel" to be first and only fallback to
the old compatible string if we didn't recognize the panel ID that
came from the EDID. In truth, both compatible strings are handled by
the same driver the driver patch I submitted tried to be smart.

Perhaps that above is over ambitious and it'd be better to just drop
the whole "fallback" concept. If a board manufacturer wants to start
using the "edp-panel" concept then maybe the right idea is to force
them to bump the "board id" and then we can pick a new device tree
revision. Then we can make sure all boards that come out of the
factory with that new "board id" can be identified properly in the
EDID. This will also get rid of some of the complexity in the driver
patch, which is nice. I'll plan on doing this and address your other
feedback for a v2.


-Doug
