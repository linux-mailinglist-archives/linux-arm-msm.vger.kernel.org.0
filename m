Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEECC1DA269
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2020 22:19:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726333AbgESUTQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 May 2020 16:19:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726203AbgESUTQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 May 2020 16:19:16 -0400
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CE20C08C5C0;
        Tue, 19 May 2020 13:19:16 -0700 (PDT)
Received: by mail-oi1-x242.google.com with SMTP id l6so904670oic.9;
        Tue, 19 May 2020 13:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=k9wGkUcX8mpQpH0xT7svm0mysTXkndwHirc7LDkmIVs=;
        b=eaOTiOYGy7RGzDrE84ODOO4mkvp8w+Ti3n5zOCs2MzLSxzwRD0Mnt4wQ97IkJRivtX
         zWbO7w8mEpIm0zoGTWMU7LLb515tER+6WW9JJIiGtPO079HzCh8fEgS12Igy/N/5eD8O
         q1jMT5GGO6KS/gr3PifQQywcPiulG5aykfKC3KMge+rjXJtkbQsKkxCOyYieA3KiSprb
         BkyqbX1rTF1rysO8HS6x14Ok1R5aRfFJr/sHFfYKVvEW7mn/j3D1Bb9tWwMpiWBEcqWp
         XNdostXg+QFFN+cykYdZfnvmKR0DXLvMFUb7S51d36qvYUHbPufYd18ejnn0a2RIm2di
         41rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=k9wGkUcX8mpQpH0xT7svm0mysTXkndwHirc7LDkmIVs=;
        b=sPZCpz/HJ49Tic1lgiAe163lL9roLMOYFjOBhv6ihuMjJzrHD/ee1vCxTQt0l7imPv
         29l2Fg8v6e6d7FousatyAI+m3rjg7BbnEQD4xnScTcNpirNTRno2kVizCJT6R00Fc0zP
         //CiR9f5MaRVtuqtZHo4ZMZ4KdejR37MuSVmblmd2HbNgpj01cNfK115JpJiomANaH/O
         N5ffMraF855MnVg4FYIZb+vqM5Gonzxt5NdW8FgwUxH5JRMHkE8CZR6aBuF+dAhrghnb
         GlmsSktitwTKdNb5Huqo6gyiuDYQC3ct29HaKj39Lrk5cwteJy3goz7CaO/hBZfe6Hnm
         fS2w==
X-Gm-Message-State: AOAM531QlPMAN6pCkZ6OffOBvBZpH2GG2h2GuBe/hUEOa+gGYqeeHP0e
        UyfD35EvjlnJWzuo7sdzRzJuHOZm6OXP3EueXHc=
X-Google-Smtp-Source: ABdhPJwpptg0g/2Fuqr75TcXz0TmtAi6ivq8xFaPLg5vusReOtbpkYwZQMxwK3sgeD/rniBZQ0FaeWVLtK50KUScI5w=
X-Received: by 2002:a05:6808:a1b:: with SMTP id n27mr825430oij.171.1589919555708;
 Tue, 19 May 2020 13:19:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200506060025.1535960-1-vkoul@kernel.org> <20200506060025.1535960-3-vkoul@kernel.org>
 <20200519114528.GC1298122@kuha.fi.intel.com>
In-Reply-To: <20200519114528.GC1298122@kuha.fi.intel.com>
From:   Christian Lamparter <chunkeey@gmail.com>
Date:   Tue, 19 May 2020 22:19:03 +0200
Message-ID: <CAAd0S9AEOsOLrnry4xNRVOi5fXwm3KXYzQsUMCm9tVxHr2sr1w@mail.gmail.com>
Subject: Re: [PATCH v13 2/5] usb: renesas-xhci: Add the renesas xhci driver
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Vinod Koul <vkoul@kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        John Stultz <john.stultz@linaro.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        =?UTF-8?Q?Andreas_B=C3=B6hler?= <dev@aboehler.at>,
        USB list <linux-usb@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello,

On Tue, May 19, 2020 at 1:45 PM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
> On Wed, May 06, 2020 at 11:30:22AM +0530, Vinod Koul wrote:
> > From: Christian Lamparter <chunkeey@googlemail.com>
> >
> > This add a new driver for renesas xhci which is basically a firmware
> > loader for uPD720201 and uPD720202 w/o ROM. The xhci-pci driver will
> > invoke this driver for loading/unloading on relevant devices.
> >
> > This patch adds a firmware loader for the uPD720201K8-711-BAC-A
> > and uPD720202K8-711-BAA-A variant. Both of these chips are listed
> > in Renesas' R19UH0078EJ0500 Rev.5.00 "User's Manual: Hardware" as
> > devices which need the firmware loader on page 2 in order to
> > work as they "do not support the External ROM".
> >
> > The "Firmware Download Sequence" is describe in chapter
> > "7.1 FW Download Interface" R19UH0078EJ0500 Rev.5.00 page 131.
> >
> > The firmware "K2013080.mem" is available from a USB3.0 Host to
> > PCIe Adapter (PP2U-E card) "Firmware download" archive. An
> > alternative version can be sourced from Netgear's WNDR4700 GPL
> > archives.
> >
> > The release notes of the PP2U-E's "Firmware Download" ver 2.0.1.3
> > (2012-06-15) state that the firmware is for the following devices:
> >  - uPD720201 ES 2.0 sample whose revision ID is 2.
> >  - uPD720201 ES 2.1 sample & CS sample & Mass product, ID is 3.
> >  - uPD720202 ES 2.0 sample & CS sample & Mass product, ID is 2.
>
> You wouldn't happen to have access to the documentation of the
> "original" uPD720200 USB 3.0 controller?
>
> It would be cool if we could support that too with this driver.

???. I have one of those "original" uPD720200(A) working "just fine"
in my Laptop currently.
It's an really old HP dv6-6003eg from around 2011 that came with two
USB 3.0 Ports, which
are driven by a "NEC Corporation uPD720200 USB 3.0 Host Controller"
1033:0194 (Rev 04).

As for supporting the uPD720200 (flasher) with this serises.... There
are some bad news:

"In addition, the programming interface for the uPD720200 and uPD720200A
is different from the uPD720202, needs different programming tools, and relies
on proprietary chip features that cannot be disclosed outside of Renesas."
<https://mail.coreboot.org/pipermail/flashrom/2013-February/010498.html> :-(

Regards,
Christian
