Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A638211EF62
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Dec 2019 01:48:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726739AbfLNAsO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Dec 2019 19:48:14 -0500
Received: from mail-io1-f68.google.com ([209.85.166.68]:41542 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727002AbfLNAsN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Dec 2019 19:48:13 -0500
Received: by mail-io1-f68.google.com with SMTP id c16so1452358ioo.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2019 16:48:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vFS8VgWqLfvH3Ij7xQNX1+MJfR1R/okTz8jIXQ/PrWw=;
        b=KHpcHkONtDRBkeXUyGK4TV4REhOe28eSqOpXzWRjTuEoQim33Pz9kdTNOakFhamF+2
         oBnmWQErhxq3ML+ldiVgaxFs4m8k5S1eCZhqaC1hax0V7votOZGHr8Y/bYrGxjIDJ/sH
         t282JVnHXDA3Kk/0/SW2h0yfhUsLzn5NgoZMg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vFS8VgWqLfvH3Ij7xQNX1+MJfR1R/okTz8jIXQ/PrWw=;
        b=CaG9uMJjxczQ0YtLo1crH603pWKyBtFMHClozAJODXcENCEohD/PvNi/NvJhqjqyv3
         VBhklW/ZxPMyfX4urxOOUlaBEehUqveyRBh+qrd4+KazDVgHpYUC+O8B5Nrknhsz9ORg
         lrAhUSgfOPrP4T/u7MMeKacn9fn7gNglCnK9APU8mqauO03t/et6DirW2AEuK0QcqJ5o
         DY0bRoFWEvqaOBUkYbstsGj3hW5Zn5tRvTg18qixHX53K2hOPBaaBanV+KOFOsOiy43v
         1FBN5w6ZD+wnTYp9xThlVGVlmkMWuOzJ86nPWNkmsoU/QcE6wg3GVKLyA4J+BkWDmOwl
         NQVw==
X-Gm-Message-State: APjAAAWdrkBpnJwQoGbB/eqUvHUrQzOQbIsciJvwUJqjUH66kmj8oZGZ
        EmFxvCC9QMDtivfQoiPQeGGR0PraAt0=
X-Google-Smtp-Source: APXvYqzh6UxoNnvZ1Uz2+eydWd8e0MPP4APlliqzCU4vsVaYdP5P3RMQB3O041veZV59AovwrxAT5Q==
X-Received: by 2002:a02:82cc:: with SMTP id u12mr2152876jag.36.1576284492174;
        Fri, 13 Dec 2019 16:48:12 -0800 (PST)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com. [209.85.166.45])
        by smtp.gmail.com with ESMTPSA id i2sm2439375iol.29.2019.12.13.16.48.09
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2019 16:48:09 -0800 (PST)
Received: by mail-io1-f45.google.com with SMTP id v3so1478864ioj.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2019 16:48:09 -0800 (PST)
X-Received: by 2002:a02:711d:: with SMTP id n29mr2124405jac.114.1576284489229;
 Fri, 13 Dec 2019 16:48:09 -0800 (PST)
MIME-Version: 1.0
References: <20191213234530.145963-1-dianders@chromium.org>
 <20191213154448.9.I1791f91dd22894da04f86699a7507d101d4385bc@changeid> <20191214000738.GP624164@phenom.ffwll.local>
In-Reply-To: <20191214000738.GP624164@phenom.ffwll.local>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 13 Dec 2019 16:47:57 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VqU8Aeuno44hAi6SP+7NZRTfgJcYPHcWpVNCo6GXUJPw@mail.gmail.com>
Message-ID: <CAD=FV=VqU8Aeuno44hAi6SP+7NZRTfgJcYPHcWpVNCo6GXUJPw@mail.gmail.com>
Subject: Re: [PATCH 9/9] drm/bridge: ti-sn65dsi86: Skip non-standard DP rates
To:     Douglas Anderson <dianders@chromium.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Rob Clark <robdclark@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Sean Paul <seanpaul@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jonas Karlman <jonas@kwiboo.se>,
        LKML <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        David Airlie <airlied@linux.ie>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Dec 13, 2019 at 4:07 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Fri, Dec 13, 2019 at 03:45:30PM -0800, Douglas Anderson wrote:
> > The bridge chip supports these DP rates according to TI's spec:
> > * 1.62 Gbps (RBR)
> > * 2.16 Gbps
> > * 2.43 Gbps
> > * 2.7 Gbps (HBR)
> > * 3.24 Gbps
> > * 4.32 Gbps
> > * 5.4 Gbps (HBR2)
> >
> > As far as I can tell, only RBR, HBR, and HBR2 are part of the DP spec.
> > If other rates work then I believe it's because the sink has allowed
> > bending the spec a little bit.
>
> I think you need to look at the eDP spec. And filter this stuff correctly
> (there's more fields there for these somewhat irky edp timings). Simply
> not using them works, but it's defeating the point of having these
> intermediate clocks for edp panels.

Ah, I see my problem.  I had earlier only found the eDP 1.3 spec which
doesn't mention these rates.  The eDP 1.4 spec does, however.  ...and
the change log for 1.4 specifically mentions that it added 4 new link
rates and also adds the "SUPPORTED_LINK_RATES" register.

I can try to spin a v2 but for now I'll hold off for additional feedback.

I'll also note that I'd be totally OK if just the first 8 patches in
this series landed for now and someone could eventually figure out how
to make this work.  With just the first 8 patches I think we will
still be in an improved state compared to where we were before (and it
fixes the panel I care about) and someone could later write the code
to skip unsupported rates...


-Doug
