Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E67260B77
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jul 2019 20:35:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727358AbfGESfm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Jul 2019 14:35:42 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:37657 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725730AbfGESfl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Jul 2019 14:35:41 -0400
Received: by mail-io1-f65.google.com with SMTP id e5so16617936iok.4;
        Fri, 05 Jul 2019 11:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6RTglQDcnPhYZ6+ia3duitJHDfc8+bEhxKjHNNLaC3E=;
        b=BZ+9kgdje40skG8QZnBrGGdCq+a5PY3QRB1EP82Bv5D+ASw59GLdJ9nl/CXfWrv2Vb
         sdF/4tDpTcNbX29P0DW2295h/VzsyaIFf6sv2obahvhi1F+alJ5zWmaIJiJXRPUNeaYy
         WUaUabgcyn/IxOCELyyu3AD5IKOubFFL1lUj/Z7VEDe8z+Hz4XrYmBQwlw5UdwX4fwjD
         hC3UH/KOlUIB65U/iiQZL8bXUsDlJ5+vvTWOEFcdI8AoUkJzuUZdhsxDb3zR2QybccWT
         XnXvDsdZdq+wBp8GJNViKCsoaxzAeoKTh08miWZiKe3mFnjd5j8o0p6REXuo9vGXKrUk
         Y5Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6RTglQDcnPhYZ6+ia3duitJHDfc8+bEhxKjHNNLaC3E=;
        b=D7BMyCxtBJELX+zDt+F94st4rB5u1zjNBHjv6JIFDDCHOVFZJWq2dvomTDuv42xYlQ
         u6E2nKNDJZ/SOPtE/QI3QzZ46RqlLljB9dELRfHlreA1kOHZYNAAlW7h2BNma+ZnETsw
         q3quJJgSGAkSg0hzIPCTjDvFG6aIi8FqZDcsJg6YRVIuEHOCyfWbj7SXTl3VjAa2KId/
         L9uFIhQKdwM4xxz/bUhF6lW+Mjy+oPhSVItsrW2lSdb98mMh8K8CWv4VVRxMzrr+imQI
         wBeDJholW7EpzMBjo4OpAi050ckqoXtuY2YjL86RVgUR54Hr3PnwVeciNAnlJKkiwJJM
         Q0aA==
X-Gm-Message-State: APjAAAXGdh7+lmq4Gu6UGr1j1l/58zwORB0SOxacari7JLfkp1lbti9r
        f/3yysehKVLf/gecBV7g4x2Eoc9/oL01b63yqj8=
X-Google-Smtp-Source: APXvYqyd73dY/S9t5icoFq7nzm8pi6H5OC2r++hJMBl44SpiTDWX/+NV+P7GLXcL1rKew1ZlNNEFkwyeZXbwgWKdoq0=
X-Received: by 2002:a02:c95a:: with SMTP id u26mr5888920jao.15.1562351741149;
 Fri, 05 Jul 2019 11:35:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190705165450.329-1-jeffrey.l.hugo@gmail.com>
 <20190705165755.515-1-jeffrey.l.hugo@gmail.com> <20190705172058.GA2788@ravnborg.org>
In-Reply-To: <20190705172058.GA2788@ravnborg.org>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Fri, 5 Jul 2019 12:35:30 -0600
Message-ID: <CAOCk7NrVSCt18QfMs+_nW1rDMuhK_dPKWL0roESmwEEy4u3BZQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/panel: simple: Add support for Sharp LD-D5116Z01B panel
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     thierry.reding@gmail.com, Dave Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        DTML <devicetree@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jul 5, 2019 at 11:21 AM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Jeffrey.
>
> Patch looks good, but there is a few fields that are not initialized.
> Did you forget them, or are they not needed?

Thanks for the review.  Overlooked some of them.

>
> On Fri, Jul 05, 2019 at 09:57:55AM -0700, Jeffrey Hugo wrote:
> > The Sharp LD-D5116Z01B is a 12.3" eDP panel with a 1920X1280 resolution.
> >
> > Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> > ---
> >  drivers/gpu/drm/panel/panel-simple.c | 26 ++++++++++++++++++++++++++
> >  1 file changed, 26 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> > index 5a93c4edf1e4..e6f578667324 100644
> > --- a/drivers/gpu/drm/panel/panel-simple.c
> > +++ b/drivers/gpu/drm/panel/panel-simple.c
> > @@ -2354,6 +2354,29 @@ static const struct panel_desc samsung_ltn140at29_301 = {
> >       },
> >  };
> >
> > +static const struct drm_display_mode sharp_ld_d5116z01b_mode = {
> > +     .clock = 168480,
> > +     .hdisplay = 1920,
> > +     .hsync_start = 1920 + 48,
> > +     .hsync_end = 1920 + 48 + 32,
> > +     .htotal = 1920 + 48 + 32 + 80,
> > +     .vdisplay = 1280,
> > +     .vsync_start = 1280 + 3,
> > +     .vsync_end = 1280 + 3 + 10,
> > +     .vtotal = 1280 + 3 + 10 + 57,
> > +     .vrefresh = 60,
> > +};
> No .flags? Is it not needed for an eDP panel?

The flags don't appear to make sense per my understanding of eDP.
Therefore I intended .flags to be 0, which it implicitly is because
this is a static struct.  Would you prefer I explicitly list .flags =
0?

>
> > +
> > +static const struct panel_desc sharp_ld_d5116z01b = {
> > +     .modes = &sharp_ld_d5116z01b_mode,
> > +     .num_modes = 1,
> > +     .bpc = 8,
> > +     .size = {
> > +             .width = 260,
> > +             .height = 120,
> > +     },
> > +};
> No .bus_format?

Ah, yes.  Looks like it should be MEDIA_BUS_FMT_RGB888_1X24
Will fix.

> No .bus_flags?

eDP is differential signaling, so what I see generally doesn't apply,
but DRM_BUS_FLAG_DATA_MSB_TO_LSB does apply, so I'll add that.
