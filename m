Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3272467145
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jul 2019 16:22:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726992AbfGLOWp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Jul 2019 10:22:45 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:43608 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726602AbfGLOWp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Jul 2019 10:22:45 -0400
Received: by mail-io1-f66.google.com with SMTP id k20so20646843ios.10;
        Fri, 12 Jul 2019 07:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nGPJaLLrwimgpDuREnLtjr8F7xnTIflmgbQ9hHlyOpQ=;
        b=h9jOcluIb6ww2CKPkNW/sCP5MUssFNFfo0eU3XK9p5+YpV+7emWd40fuQ0aguUlM9O
         SfMrf+m/5YOcM1qa0dWndBpgkz4Qf9EGlyTiqz+6Y7JfRFAgXKOiqXiCzMj/UING1hQK
         scP1RFCeJ3R4/WI+CNFRDFjyahtAk+rWVWR0IuQj7nPfOfOJ66wZq62M+xb3Dc8zqLHh
         7OKh5uoWtjoEXRLbSMp+jHa1EJkzjK5EAf3zVnOt4gap7JtE0RNtC7abt3UjoaIXQZKZ
         9vyQ3Ys5NMV/5OAzKCJeNjBwZ+sbQ1MsrhJazHGjIncJuDsrADav8uSg9bJTbg3Z6slp
         LwRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nGPJaLLrwimgpDuREnLtjr8F7xnTIflmgbQ9hHlyOpQ=;
        b=oZ+oPpzLAOR3A+9KAikTmIFIC3wdZz6Hv7CwnwHEjwMHmpa3pPffGEHJk5ejPpiAwq
         bBokLNdTyrVa2Z+w++qllOOFUd7hbYBm41lAEwH/cvgN6Ud23h0QCEYjz7mOJQp9awHU
         5xNalTFxXgrb8ddPFr4z/sW8Q07jY/DU/PokwbjxWkGWOCKDqCo+eu1CUUKirzLTocpC
         rKKQ7QuaF62o6hbdRFgL6SzhixkgMbXhoj6fr8XRMppkwv+n5cFF9bFuOf7v/qlYqz7Z
         oXnKIRcv1O4rZ9EycjvaLwL8AmxCARN0ZVxHOisagXlCKlVQ9zMPB6993drf0voUMlgr
         ShHQ==
X-Gm-Message-State: APjAAAW4TT3qdQJM/w5w7ZO3MW8MYAMSOwdgI5SyL6WWU9M6Htgr2ZC6
        ZJKXoBYH0LgX/F/wOscvkX7K2TCvQx4AM5lcYrg=
X-Google-Smtp-Source: APXvYqyd1oIXsBnzN7dG75lZKkuN70UrVbbdWWU17WfiRt880v2QjEESBBiu9clKHIbyAFlTaHjA8LuvFTEITgzhLUI=
X-Received: by 2002:a6b:3b89:: with SMTP id i131mr10329306ioa.33.1562941364182;
 Fri, 12 Jul 2019 07:22:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190703214326.41269-1-jeffrey.l.hugo@gmail.com>
 <20190703214512.41319-1-jeffrey.l.hugo@gmail.com> <CGME20190706010615epcas2p343102f858a7fadaf6785f7ece105f1a7@epcas2p3.samsung.com>
 <20190706010604.GG20625@sirena.org.uk> <64ca3a74-374f-d4f3-bee6-a607cc5c0fc5@samsung.com>
 <CAF6AEGtGjKRA3A8v6pgaXLgpeiLZuz6HuDSFRjKrNp4iQNVZtA@mail.gmail.com> <10b1313f-7a60-df04-a9e3-76649b74f2f0@samsung.com>
In-Reply-To: <10b1313f-7a60-df04-a9e3-76649b74f2f0@samsung.com>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Fri, 12 Jul 2019 08:22:33 -0600
Message-ID: <CAOCk7NoyCmPQF3s4GWD1Oa4t5hdqi6vdcOdHyJpo3Gc1JQqXcw@mail.gmail.com>
Subject: Re: [PATCH 1/2] regmap: Add DSI bus support
To:     Andrzej Hajda <a.hajda@samsung.com>
Cc:     Rob Clark <robdclark@gmail.com>, Mark Brown <broonie@kernel.org>,
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

On Fri, Jul 12, 2019 at 7:01 AM Andrzej Hajda <a.hajda@samsung.com> wrote:
>
> On 11.07.2019 15:56, Rob Clark wrote:
> > On Thu, Jul 11, 2019 at 6:11 AM Andrzej Hajda <a.hajda@samsung.com> wrote:
> >> On 06.07.2019 03:06, Mark Brown wrote:
> >>> On Wed, Jul 03, 2019 at 02:45:12PM -0700, Jeffrey Hugo wrote:
> >>>> Add basic support with a simple implementation that utilizes the generic
> >>>> read/write commands to allow device registers to be configured.
> >>> This looks good to me but I really don't know anything about DSI,
> >>> I'd appreciate some review from other people who do.  I take it
> >>> there's some spec thing in DSI that says registers and bytes must
> >>> both be 8 bit?
> >>
> >> I am little bit confused about regmap usage here. On the one hand it
> >> nicely fits to this specific driver, probably because it already uses
> >> regmap_i2c.
> >>
> >> On the other it will be unusable for almost all current DSI drivers and
> >> probably for most new drivers. Why?
> >>
> >> 1. DSI protocol defines actually more than 30 types of transactions[1],
> >> but this patchset implements only few of them (dsi generic write/read
> >> family). Is it possible to implement multiple types of transactions in
> >> regmap?
> >>
> >> 2. There is already some set of helpers which uses dsi bus, rewriting it
> >> on regmap is possible or driver could use of regmap and direct access
> >> together, the question is if it is really necessary.
> >>
> >> 3. DSI devices are no MFDs so regmap abstraction has no big value added
> >> (correct me, if there are other significant benefits).
> >>
> > I assume it is not *just* this one bridge that can be programmed over
> > either i2c or dsi, depending on how things are wired up on the board.
> > It certainly would be nice for regmap to support this case, so we
> > don't have to write two different bridge drivers for the same bridge.
> > I wouldn't expect a panel that is only programmed via dsi to use this.
>
>
> On the other side supporting DSI and I2C in one driver is simply matter
> of writing proper accesors.

To me, this reads like your counter argument to not using regmap, is
to reinvent regmap.  Maybe I don't understand what you are proposing
here, but it sounds like remove the regmap support, define sn65
specific accessors that just before sending the write to the bus does
a check if the access needs to go over i2c or DSI.  Feels like a
clunky version of regmap to me.  Why not use the existing "generic"
framework?

To your point that DSI defines over 30 message types, yes it does, but
that seems to be outside of the scope.  How many of those are actually
for doing register access?  I'm thinking just 4 (technically a hair
more than that because of the multiple version of the same message) -
generic read, generic write, dcs read, dcs write.  I don't view regmap
as a generic abstraction layer over a particular mechanism, and thus
needs to support everything that mechanism does.  Sending sync
commands, or pixel data over DSI is outside the scope of regmap to me.
