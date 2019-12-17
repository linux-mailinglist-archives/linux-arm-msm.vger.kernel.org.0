Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8622E121FC5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2019 01:31:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727742AbfLQAbc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Dec 2019 19:31:32 -0500
Received: from mail-il1-f195.google.com ([209.85.166.195]:32924 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727669AbfLQAbc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Dec 2019 19:31:32 -0500
Received: by mail-il1-f195.google.com with SMTP id r81so6992860ilk.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Dec 2019 16:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JwnjQSU0EMCbEaNHZW9Pw+wOWET0cgofZxvyjHhghRs=;
        b=LJge9oaMrdmXTTvEYO7zbOnORPyCGcmSx53eq5HbKh7MEapWdoj7UiSSzPrrcAxKGG
         psQgIO3vUwA3pMDg1bVbqxBErOp57AR+YE0+G2XA3g65R2n9aGqodnYFuyJKN+kxnGuS
         n25OcKWj8PdKc6W18kAYZY23GnZPl6xsIg9ZU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JwnjQSU0EMCbEaNHZW9Pw+wOWET0cgofZxvyjHhghRs=;
        b=C5JTlJK7nXp3e+RoGqPRM041jASAgvXAsIWCFq8fRrRVFzQUgXb8vHgpOZITXKnG06
         lVzJITVO+n2Sqg+ozFR6uwCGyjvVqwtckuiW7NuwStfomol4JqjTkXJLY6fA7JvKdAcE
         1/YFIMg6oRZf7AiFIrfgPdXrWsLUV4riiaP9edqXR4+fFQEtgcQPSEaStkahjwG97mED
         cI3RoDUFyB7WJmdkihpzwc6gchHve+SG7Sz89NLRMt4znAZP25d/egwej4S++FIFGaoD
         fUB8tl30QTZBN0jPawSJWG4UO3ru/3a6NhPezBdblFeTcs0MAVg/DmflD0TdgP15vVdw
         XnLQ==
X-Gm-Message-State: APjAAAVtT7PMFsF1E9YykWGkyN9P4299c4flh1tRgDJWPPoyMRrzmzYc
        gUEmlzFyKBBLEMd7fkiI+I22uS+zyC4=
X-Google-Smtp-Source: APXvYqy0brkXpIMooUU81eiHUDXp81e+qyIo2Gw0iDrzBKvcvMqcXfuXdxxtNgfeN/l+BSl0CEh/iw==
X-Received: by 2002:a92:3a9b:: with SMTP id i27mr12118318ilf.39.1576542691375;
        Mon, 16 Dec 2019 16:31:31 -0800 (PST)
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com. [209.85.166.175])
        by smtp.gmail.com with ESMTPSA id s21sm4741715ioa.33.2019.12.16.16.31.29
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Dec 2019 16:31:30 -0800 (PST)
Received: by mail-il1-f175.google.com with SMTP id t8so5519085iln.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Dec 2019 16:31:29 -0800 (PST)
X-Received: by 2002:a92:da44:: with SMTP id p4mr3491014ilq.168.1576542689632;
 Mon, 16 Dec 2019 16:31:29 -0800 (PST)
MIME-Version: 1.0
References: <20191213234530.145963-1-dianders@chromium.org>
 <20191213154448.9.I1791f91dd22894da04f86699a7507d101d4385bc@changeid>
 <20191214000738.GP624164@phenom.ffwll.local> <CAD=FV=VqU8Aeuno44hAi6SP+7NZRTfgJcYPHcWpVNCo6GXUJPw@mail.gmail.com>
 <CAOCk7NoT9FKikk3pNi-JGZPopaicE0kM-7nEK4GeqZmEtB+nAA@mail.gmail.com>
In-Reply-To: <CAOCk7NoT9FKikk3pNi-JGZPopaicE0kM-7nEK4GeqZmEtB+nAA@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 16 Dec 2019 16:31:16 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UwXHVyDD=Qj8Exq9xiw7=nisC_c02s76Gig8MDCUEh+Q@mail.gmail.com>
Message-ID: <CAD=FV=UwXHVyDD=Qj8Exq9xiw7=nisC_c02s76Gig8MDCUEh+Q@mail.gmail.com>
Subject: Re: [PATCH 9/9] drm/bridge: ti-sn65dsi86: Skip non-standard DP rates
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
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

Hi,

On Sun, Dec 15, 2019 at 5:19 PM Jeffrey Hugo <jeffrey.l.hugo@gmail.com> wrote:
>
> On Fri, Dec 13, 2019 at 5:49 PM Doug Anderson <dianders@chromium.org> wrote:
> >
> > Hi,
> >
> > On Fri, Dec 13, 2019 at 4:07 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> > >
> > > On Fri, Dec 13, 2019 at 03:45:30PM -0800, Douglas Anderson wrote:
> > > > The bridge chip supports these DP rates according to TI's spec:
> > > > * 1.62 Gbps (RBR)
> > > > * 2.16 Gbps
> > > > * 2.43 Gbps
> > > > * 2.7 Gbps (HBR)
> > > > * 3.24 Gbps
> > > > * 4.32 Gbps
> > > > * 5.4 Gbps (HBR2)
> > > >
> > > > As far as I can tell, only RBR, HBR, and HBR2 are part of the DP spec.
> > > > If other rates work then I believe it's because the sink has allowed
> > > > bending the spec a little bit.
> > >
> > > I think you need to look at the eDP spec. And filter this stuff correctly
> > > (there's more fields there for these somewhat irky edp timings). Simply
> > > not using them works, but it's defeating the point of having these
> > > intermediate clocks for edp panels.
> >
> > Ah, I see my problem.  I had earlier only found the eDP 1.3 spec which
> > doesn't mention these rates.  The eDP 1.4 spec does, however.  ...and
> > the change log for 1.4 specifically mentions that it added 4 new link
> > rates and also adds the "SUPPORTED_LINK_RATES" register.
>
> Yeah, you need the eDP spec.  I previously posted
> https://patchwork.kernel.org/patch/11205201/ and was hoping Bjorn
> would find time to test it.  Maybe it would fit well with your series?
>  I'm coming back from tracel, and hope to review everything you have,
> but this caught my eye.

Ah, interesting.  It looks like Rob has already posted a Fixup on my patch:

https://lore.kernel.org/r/20191215200632.1019065-1-robdclark@gmail.com

...that should also read the supported rates.  I need to go and review
/ test his new patch (I lost access to the hardware but should get it
back tomorrow or the next day), but would you be OK with going that
route?  I think my series is a superset of yours.  Specifically it has
these extra features atop yours:

* If link training fails and the panel supports faster rates, it will
try a faster rate in case it works.

* It adds support for using 6bpp when that's all that's needed,
reducing bandwidth to the panel (and link rate)

* It breaks things into smaller functions (assuming you agree this is
a good thing).

-Doug
