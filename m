Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B40F67750
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jul 2019 02:49:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727392AbfGMAtZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Jul 2019 20:49:25 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:46939 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727236AbfGMAtZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Jul 2019 20:49:25 -0400
Received: by mail-ed1-f66.google.com with SMTP id d4so10618589edr.13;
        Fri, 12 Jul 2019 17:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SyqVAgQMOHYXey7EnkAylgSqwsoD6phOjM6qtdZ4mNw=;
        b=qCl3ma6CyklmWDLlR3q/xIlLZoVBiD9DmK8Y9WaGemh0o9qNRjqZTzHmJ3eFCAPTN8
         YlrlYwBw7Xn5sK9INOZX9VpMfClNM/AcDFUSvmpvwPrcV8bKHWgcMrHKnwNZJ/4M/TYP
         XQueTm7VyWhkf8SlUBudIVxfxYDsGG153oobZgRYKIOxZ/j2Px189vGz30Xpls/gHtwk
         AXhO1SRUHspmO1N2c619aD+utfQedV8vNrePHMXQoCw1m4EJHYDQDnQKLDh2mYDV7tdv
         QRe9tuGfk1+hMAv+5EJqJNJSsOwwKCLtGBoEiOrV8M8W3KSY0IIICfHJrCtgBqJ6TWzx
         KTCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SyqVAgQMOHYXey7EnkAylgSqwsoD6phOjM6qtdZ4mNw=;
        b=aRDLdFvWxHKWTPreHM4yqedRkBsA4A68E1iQXyOoExOExqkJku0v9rH11Rf/83wQBN
         KUD4qTV591osddzY+w3t1HT11hDKhWqVxnpMTsV1G8vY3woDx+VG9cDAbV9pgA31X5oa
         P+UbjU2fEVt8hifN/l9A+MaaI9USrMbhf3gzJtm9sOEaFB5LsaRrFxqu/WJxCEY2JmZN
         cZA2FUu7mAoous+Sfh76U/u4P4ZHbhUxOsHvQBBT4wrqDxzq/6CY0Yl1su6gnZjaTktT
         t3AoxZ0zIB8mlfbUp6soG9fn7x9W1D4CqxzmkgXZtbYGf12+frGdRqPdcpgiPXSCpnlM
         erKg==
X-Gm-Message-State: APjAAAWFEpm7wpcwz6/w7uAlTj6mlwfHRoL9rBSp1Nk24iiUIIGELDE1
        +gDA1vJRl9+TdoYQQbqKrdj85ZHARvyBpdcquf8=
X-Google-Smtp-Source: APXvYqyDnrpj8iAQ6BNq+8gwo2b3Md7G97ZUOdYET+TJa+t9rbuRiFvlgq0grhmuNKjhyvRktnY5DBaQMrRBZYG2t2Q=
X-Received: by 2002:a17:906:3f87:: with SMTP id b7mr10538910ejj.164.1562978962599;
 Fri, 12 Jul 2019 17:49:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190703214326.41269-1-jeffrey.l.hugo@gmail.com>
 <20190703214512.41319-1-jeffrey.l.hugo@gmail.com> <CGME20190706010615epcas2p343102f858a7fadaf6785f7ece105f1a7@epcas2p3.samsung.com>
 <20190706010604.GG20625@sirena.org.uk> <64ca3a74-374f-d4f3-bee6-a607cc5c0fc5@samsung.com>
 <CAF6AEGtGjKRA3A8v6pgaXLgpeiLZuz6HuDSFRjKrNp4iQNVZtA@mail.gmail.com>
 <10b1313f-7a60-df04-a9e3-76649b74f2f0@samsung.com> <CAOCk7NoyCmPQF3s4GWD1Oa4t5hdqi6vdcOdHyJpo3Gc1JQqXcw@mail.gmail.com>
In-Reply-To: <CAOCk7NoyCmPQF3s4GWD1Oa4t5hdqi6vdcOdHyJpo3Gc1JQqXcw@mail.gmail.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Fri, 12 Jul 2019 17:49:11 -0700
Message-ID: <CAF6AEGu8NY14qkzO1qU1TGX4VrUvQU3vZbDXjA_UNBqqODGucQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] regmap: Add DSI bus support
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     Andrzej Hajda <a.hajda@samsung.com>,
        Mark Brown <broonie@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jul 12, 2019 at 7:22 AM Jeffrey Hugo <jeffrey.l.hugo@gmail.com> wrote:
>
> On Fri, Jul 12, 2019 at 7:01 AM Andrzej Hajda <a.hajda@samsung.com> wrote:
> >
> > On 11.07.2019 15:56, Rob Clark wrote:
> > > On Thu, Jul 11, 2019 at 6:11 AM Andrzej Hajda <a.hajda@samsung.com> wrote:
> > >> On 06.07.2019 03:06, Mark Brown wrote:
> > >>> On Wed, Jul 03, 2019 at 02:45:12PM -0700, Jeffrey Hugo wrote:
> > >>>> Add basic support with a simple implementation that utilizes the generic
> > >>>> read/write commands to allow device registers to be configured.
> > >>> This looks good to me but I really don't know anything about DSI,
> > >>> I'd appreciate some review from other people who do.  I take it
> > >>> there's some spec thing in DSI that says registers and bytes must
> > >>> both be 8 bit?
> > >>
> > >> I am little bit confused about regmap usage here. On the one hand it
> > >> nicely fits to this specific driver, probably because it already uses
> > >> regmap_i2c.
> > >>
> > >> On the other it will be unusable for almost all current DSI drivers and
> > >> probably for most new drivers. Why?
> > >>
> > >> 1. DSI protocol defines actually more than 30 types of transactions[1],
> > >> but this patchset implements only few of them (dsi generic write/read
> > >> family). Is it possible to implement multiple types of transactions in
> > >> regmap?
> > >>
> > >> 2. There is already some set of helpers which uses dsi bus, rewriting it
> > >> on regmap is possible or driver could use of regmap and direct access
> > >> together, the question is if it is really necessary.
> > >>
> > >> 3. DSI devices are no MFDs so regmap abstraction has no big value added
> > >> (correct me, if there are other significant benefits).
> > >>
> > > I assume it is not *just* this one bridge that can be programmed over
> > > either i2c or dsi, depending on how things are wired up on the board.
> > > It certainly would be nice for regmap to support this case, so we
> > > don't have to write two different bridge drivers for the same bridge.
> > > I wouldn't expect a panel that is only programmed via dsi to use this.
> >
> >
> > On the other side supporting DSI and I2C in one driver is simply matter
> > of writing proper accesors.
>
> To me, this reads like your counter argument to not using regmap, is
> to reinvent regmap.  Maybe I don't understand what you are proposing
> here, but it sounds like remove the regmap support, define sn65
> specific accessors that just before sending the write to the bus does
> a check if the access needs to go over i2c or DSI.  Feels like a
> clunky version of regmap to me.  Why not use the existing "generic"
> framework?
>
> To your point that DSI defines over 30 message types, yes it does, but
> that seems to be outside of the scope.  How many of those are actually
> for doing register access?  I'm thinking just 4 (technically a hair
> more than that because of the multiple version of the same message) -
> generic read, generic write, dcs read, dcs write.  I don't view regmap
> as a generic abstraction layer over a particular mechanism, and thus
> needs to support everything that mechanism does.  Sending sync
> commands, or pixel data over DSI is outside the scope of regmap to me.

I'm w/ jhugo on this one.. if you are working w/ a device that can be
programmed via i2c or dsi, regmap and limiting yourself to the small
subset of dsi cmds which map to i2c reads/writes, makes a ton of
sense.  (And I'm almost certain this bridge isn't the only such
device.)

That isn't to say you should use regmap for devices that are only
programmed over dsi.  That would be silly.  The original argument
about this not being usable by most DSI devices is really a
non-sequitur.

BR,
-R
