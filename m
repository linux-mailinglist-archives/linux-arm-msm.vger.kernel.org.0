Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 385D811FC83
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2019 02:19:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726373AbfLPBTT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 15 Dec 2019 20:19:19 -0500
Received: from mail-il1-f195.google.com ([209.85.166.195]:46642 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726299AbfLPBTT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 15 Dec 2019 20:19:19 -0500
Received: by mail-il1-f195.google.com with SMTP id t17so4061929ilm.13;
        Sun, 15 Dec 2019 17:19:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ePXTIUIV0Ij0A4oFj9n/QikNcOig0/QRLPKU1H5Yl24=;
        b=sLKPB9VQC3w3hOZ2rB0Zj7IdZFrQ7RPW2q18mbwdnIfdK3WSusuuVHYKvdX4IXEwe8
         hzLoUWxTb5Uaia3LHoHRZz4qtYV2NLwhgrY5SDdMr/T6LRY215U2o95E7V2ZdY+TgZmQ
         uotdb1LF7J0yfmJhjzJh7r4eiR51N8lQh/sF+87Tx6P2kf92KDrPToRrDsO+myw8H6UR
         lnbmcXrdQDRHJehj4Z5ImhNS/K1CR16ORqPXUk2GyCMVlHDL6W4PPx6GgFO4Mm+9RyN+
         x7QawRLn0MaCrnH63TF7WLR6UW8tgEYzzPvU86CD+1GQ3BxCszDiG65dRBvISbRUirq2
         aMGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ePXTIUIV0Ij0A4oFj9n/QikNcOig0/QRLPKU1H5Yl24=;
        b=U9Jf5K+DNjY/mRHJTzqX0xF5Igpp9+3zEgz+eVjB5C8hUjCx3Vd9yEgZhnFXGXpJOW
         X2MKf3UsDoYFa4gEIhNBl3WK3L3RDRO61wM/2ntwh81LwwzjZb/vrXK5QPWKyRn7qlzM
         783ClkRc7EVtZjgylmYh3GSXiWuHXgGI9uEsifdwLv+Qt5M6XejIVp8hQp5FxQljYWYK
         ioMDWLuE0lbmxe6vu8M6eBKtNVxIf6rTRQ3g/FIcspSvvkF0njs3zLGM+ZyCEFXH23X2
         GHGqAxvwAliXF1T7BRVz/CQtAICtIb3j1tAetzEZkNuwDwD0CeuKXKqjJOQFn4Bj74JA
         Zxeg==
X-Gm-Message-State: APjAAAVX5W/s2TZl2tUX9ZIexb5qBuCoWrx8syjM3sUiWQzswZtp+2Ta
        7qEFrs+FMUKusm5OoBbvlLQ9uliHaIty0wlkjpQ=
X-Google-Smtp-Source: APXvYqwD8Xnb/tCPRqtJ8UGlll0Xewt5uNwl7jCMZ0uVsOUTNIJewHgcq6oah6cqSetAmqsuqyBBSYFKuG3i1gfA7EY=
X-Received: by 2002:a92:6e09:: with SMTP id j9mr10245125ilc.178.1576459158278;
 Sun, 15 Dec 2019 17:19:18 -0800 (PST)
MIME-Version: 1.0
References: <20191213234530.145963-1-dianders@chromium.org>
 <20191213154448.9.I1791f91dd22894da04f86699a7507d101d4385bc@changeid>
 <20191214000738.GP624164@phenom.ffwll.local> <CAD=FV=VqU8Aeuno44hAi6SP+7NZRTfgJcYPHcWpVNCo6GXUJPw@mail.gmail.com>
In-Reply-To: <CAD=FV=VqU8Aeuno44hAi6SP+7NZRTfgJcYPHcWpVNCo6GXUJPw@mail.gmail.com>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Sun, 15 Dec 2019 18:19:06 -0700
Message-ID: <CAOCk7NoT9FKikk3pNi-JGZPopaicE0kM-7nEK4GeqZmEtB+nAA@mail.gmail.com>
Subject: Re: [PATCH 9/9] drm/bridge: ti-sn65dsi86: Skip non-standard DP rates
To:     Doug Anderson <dianders@chromium.org>
Cc:     Andrzej Hajda <a.hajda@samsung.com>,
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
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Dec 13, 2019 at 5:49 PM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Fri, Dec 13, 2019 at 4:07 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Fri, Dec 13, 2019 at 03:45:30PM -0800, Douglas Anderson wrote:
> > > The bridge chip supports these DP rates according to TI's spec:
> > > * 1.62 Gbps (RBR)
> > > * 2.16 Gbps
> > > * 2.43 Gbps
> > > * 2.7 Gbps (HBR)
> > > * 3.24 Gbps
> > > * 4.32 Gbps
> > > * 5.4 Gbps (HBR2)
> > >
> > > As far as I can tell, only RBR, HBR, and HBR2 are part of the DP spec.
> > > If other rates work then I believe it's because the sink has allowed
> > > bending the spec a little bit.
> >
> > I think you need to look at the eDP spec. And filter this stuff correctly
> > (there's more fields there for these somewhat irky edp timings). Simply
> > not using them works, but it's defeating the point of having these
> > intermediate clocks for edp panels.
>
> Ah, I see my problem.  I had earlier only found the eDP 1.3 spec which
> doesn't mention these rates.  The eDP 1.4 spec does, however.  ...and
> the change log for 1.4 specifically mentions that it added 4 new link
> rates and also adds the "SUPPORTED_LINK_RATES" register.

Yeah, you need the eDP spec.  I previously posted
https://patchwork.kernel.org/patch/11205201/ and was hoping Bjorn
would find time to test it.  Maybe it would fit well with your series?
 I'm coming back from tracel, and hope to review everything you have,
but this caught my eye.

>
> I can try to spin a v2 but for now I'll hold off for additional feedback.
>
> I'll also note that I'd be totally OK if just the first 8 patches in
> this series landed for now and someone could eventually figure out how
> to make this work.  With just the first 8 patches I think we will
> still be in an improved state compared to where we were before (and it
> fixes the panel I care about) and someone could later write the code
> to skip unsupported rates...
>
>
> -Doug
