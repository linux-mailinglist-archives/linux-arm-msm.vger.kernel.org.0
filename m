Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB8AB71DE7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2019 19:41:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391172AbfGWRlJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Jul 2019 13:41:09 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:40764 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388606AbfGWRlJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Jul 2019 13:41:09 -0400
Received: by mail-ed1-f67.google.com with SMTP id k8so44716295eds.7;
        Tue, 23 Jul 2019 10:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nogcB6tU7ggTUc1+z4/fMorc4784ohsjEsA0VkxE4cQ=;
        b=WEgbUlOwKq7FDIuwTpjXkL4hd+FxqB9iuHFupSLPSi3UKeNHLWZaKkOW15zx5J2/ZZ
         iq8eueW8GsDMgV/SbuUXl849uTeoFKSwBk97/PL1K/GdP6IyScS7KKhmTtjPG885+diA
         cRUhcWbQIOTDvi+ETBdb+Wqw2Qr4IRYtifiZNbdb+omqbkcvelRLhYOPCx/6rm/PP0pV
         P+9LzpxJAoz7157KwdoGgBOShLoYyKMiSjWxLv9D/XFnc9iFg6nX+umbM8UXpX5no5ET
         JVjO2MbiOlIMGOzoTAoU0AVnUrhsIVWYyNovjrnEKyh1nIO5ieSGxSZldsbMVW1fftUE
         9PQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nogcB6tU7ggTUc1+z4/fMorc4784ohsjEsA0VkxE4cQ=;
        b=IwR3qlBJPprY3q29mkRRTZa1pqGj9zY7GtmtDQVcnCb250KrpBUG/L7JdMjC7nHHXf
         TYbTEcQig75FC0Sh893G0NJhU3eaOsfKhLh39aOoM9WMrEwqDz7VXuDKkVxiVbQEbJ3P
         DNseHx4PYjrPmSB4C4HL3G4fKx2jkyzwTgYlSTtGWOo+UcNDXUCaD7+xRfv4zWgSjR2o
         fCbeKMdcHVTFlNSZAKx3pQo6YaTr3oQhJZ/sYhfa+cgG/wZs+pEBJ8ye0J1Cj0X+T0cl
         edJVlKVTPhKpHfZcMJV4M7JN/Gaoni7ZmUDqOioojsZbTVfPU7f/sHHpM/GvvXN3mijx
         VYyQ==
X-Gm-Message-State: APjAAAUoRQSM0xpi0wsAeM24C7Rl0yYf7XXmBbEydEuV+qcgcwMv4Zj3
        lLANn8Cyiz7KOVfVXwfhyS5FXJsSIIfCBsJCO+Y=
X-Google-Smtp-Source: APXvYqzemPNRUI4Dv8rCDS7Y3Atwe1foT+6Dyv7m4pV5WgS2/fMuH1KImSCRDazCl+5WCpEBG93Sr1jOHq4wKAJmBc8=
X-Received: by 2002:a17:906:f85:: with SMTP id q5mr60032126ejj.192.1563903667438;
 Tue, 23 Jul 2019 10:41:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190702202631.32148-2-robdclark@gmail.com> <20190710182844.25032-1-robdclark@gmail.com>
 <20190722142833.GB12009@8bytes.org> <CAF6AEGvJc2RK3GkpcXiVKsuTX81D3oahnu=qWJ9LFst1eT3tMg@mail.gmail.com>
 <20190722154803.GG12009@8bytes.org> <CAF6AEGvWf3ZOrbyyWjORuOVEPOcPr+JSEO78aYjhL-GVhDZnTg@mail.gmail.com>
 <20190723153822.gm4ossn43nvqbyak@willie-the-truck>
In-Reply-To: <20190723153822.gm4ossn43nvqbyak@willie-the-truck>
From:   Rob Clark <robdclark@gmail.com>
Date:   Tue, 23 Jul 2019 10:40:55 -0700
Message-ID: <CAF6AEGtL6gqtbmtksf7zCSGrFOEj0ynq-2nwvizLLiS0FTwHpg@mail.gmail.com>
Subject: Re: [PATCH v2] iommu: add support for drivers that manage iommu explicitly
To:     Will Deacon <will@kernel.org>
Cc:     Joerg Roedel <joro@8bytes.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        aarch64-laptops@lists.linaro.org,
        Rob Clark <robdclark@chromium.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Joe Perches <joe@perches.com>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jul 23, 2019 at 8:38 AM Will Deacon <will@kernel.org> wrote:
>
> On Mon, Jul 22, 2019 at 09:23:48AM -0700, Rob Clark wrote:
> > On Mon, Jul 22, 2019 at 8:48 AM Joerg Roedel <joro@8bytes.org> wrote:
> > >
> > > On Mon, Jul 22, 2019 at 08:41:34AM -0700, Rob Clark wrote:
> > > > It is set by the driver:
> > > >
> > > > https://patchwork.freedesktop.org/patch/315291/
> > > >
> > > > (This doesn't really belong in devicetree, since it isn't a
> > > > description of the hardware, so the driver is really the only place to
> > > > set this.. which is fine because it is about a detail of how the
> > > > driver works.)
> > >
> > > It is more a detail about how the firmware works. IIUC the problem is
> > > that the firmware initializes the context mappings for the GPU and the
> > > OS doesn't know anything about that and just overwrites them, causing
> > > the firmware GPU driver to fail badly.
> > >
> > > So I think it is the task of the firmware to tell the OS not to touch
> > > the devices mappings until the OS device driver takes over. On x86 there
> > > is something similar with the RMRR/unity-map tables from the firmware.
> > >
> >
> > Bjorn had a patchset[1] to inherit the config from firmware/bootloader
> > when arm-smmu is probed which handles that part of the problem.  My
> > patch is intended to be used on top of his patchset.  This seems to me
> > like the best solution, if we don't have control over the firmware.
>
> Hmm, but the feedback from Robin on the thread you cite was that this should
> be generalised to look more like RMRR, so there seems to be a clear message
> here.
>

Perhaps it is a lack of creativity, or lack of familiarity w/ iommu vs
virtualization, but I'm not quite seeing how RMRR would help.. in
particular when dealing with both DT and ACPI cases.  So I kinda
prefer, when possible, if arm-smmu can figure out what is going on by
looking at the hw state at boot (since that approach would work
equally well for DT and ACPI).

I *think* (but need to confirm if Bjorn hasn't already) that the
memory for the pagetables that firmware/bootloader sets up is already
removed from the memory map efi passes to kernel, so we don't need to
worry about kernel stomping in-use pagetables.

BR,
-R
