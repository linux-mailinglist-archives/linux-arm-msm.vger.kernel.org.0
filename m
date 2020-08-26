Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2322C2524B0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Aug 2020 02:24:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726707AbgHZAYk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Aug 2020 20:24:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726700AbgHZAYj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Aug 2020 20:24:39 -0400
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com [IPv6:2607:f8b0:4864:20::e41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3182C061755
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2020 17:24:38 -0700 (PDT)
Received: by mail-vs1-xe41.google.com with SMTP id i129so59593vsi.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2020 17:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LKNYZxdd9GnzF09d9hnsszm0hfjYWuDgd4/PlOEGld8=;
        b=f20JUufvss7xZL/HrjKmsqIQ5mWiEbA4xg5ZmZzrqMVH5q/i+AUHRaJOwlrs3zIU71
         zulan3xrqqX8mQS8GSGYsutdfDf1SRCSRvmcfE+20/9POjON2tF2SG9k0QZ+ponsIO25
         o1PHju9rH05o/4XewhDwdlfjBvY5fZC6yoroI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LKNYZxdd9GnzF09d9hnsszm0hfjYWuDgd4/PlOEGld8=;
        b=sWOvasCxf9iiIDT72SDsOQJxO2lrIye3SLf+5gSsTat69KkoS77FjHNO2dk1yb3nRm
         ypYXbAJpkz52P7PXRLP71nQehuhDwXv+Fluxo0edvVXGNVFNPQlsZnzTuqWWTexsa2OS
         WBgQoQyY8E3juY+DipsBTZFaSs/N0pSy83pP6YfR8dWCaM4hCveSRkwysM2G5ZMoDW4k
         OmD+lkhpW2e6RaTzRGw64bjRXNclll3Cq8umDOYuSIVhkrZUzzLQyDyZfGp8zslgyQGX
         XrkHcBOR34HfGzfR/wHZXztH8ELcDYFqAxEBik48A1MgRAfkDffqHmya1J6P/h/+cpJd
         k6Lw==
X-Gm-Message-State: AOAM5307jfdu/5pEAauM3KL+lsh4JYANdvB3iRGYzyfhNSnEpaggu0OQ
        Mxyh6dX0fodop9WnOxTKhm2bGYrAuNFsKA==
X-Google-Smtp-Source: ABdhPJxedtAw9zshV/8TRGpL6ONuH2WrSWnD1AWDPRh0lboKjmTQy3z5LkDOcVdDdBhIX4MR9AmmAQ==
X-Received: by 2002:a67:2fd4:: with SMTP id v203mr7267309vsv.101.1598401477458;
        Tue, 25 Aug 2020 17:24:37 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id h139sm123093vke.2.2020.08.25.17.24.36
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2020 17:24:36 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id b16so55184vsl.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2020 17:24:36 -0700 (PDT)
X-Received: by 2002:a67:bc08:: with SMTP id t8mr8111843vsn.44.1598401476047;
 Tue, 25 Aug 2020 17:24:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200825154249.20011-1-saiprakash.ranjan@codeaurora.org>
 <CAD=FV=XK3Xa3rRWvuSA_jA+5_1XYBmHEX2B2XSb8h3oOe1PHLw@mail.gmail.com>
 <3df7edd53ebca00be288e69b92b8d4b9@codeaurora.org> <CAD=FV=X=3Jae7_gXN_05EsmZjrM1bN=TMZ0qoGKz=UaNrthzAg@mail.gmail.com>
 <CAF6AEGsuusnGaN-H9geFa+jwX_hkvMHGZCWvwk5-MDGQ7cBsbQ@mail.gmail.com>
In-Reply-To: <CAF6AEGsuusnGaN-H9geFa+jwX_hkvMHGZCWvwk5-MDGQ7cBsbQ@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 25 Aug 2020 17:24:23 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WyL3ttE_F3YJJxOWAJANeNueqH0gO3phu8q5F4NP809g@mail.gmail.com>
Message-ID: <CAD=FV=WyL3ttE_F3YJJxOWAJANeNueqH0gO3phu8q5F4NP809g@mail.gmail.com>
Subject: Re: [PATCH] iommu: Add support to filter non-strict/lazy mode based
 on device names
To:     Rob Clark <robdclark@gmail.com>
Cc:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Will Deacon <will@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Aug 25, 2020 at 3:54 PM Rob Clark <robdclark@gmail.com> wrote:
>
> On Tue, Aug 25, 2020 at 3:23 PM Doug Anderson <dianders@chromium.org> wrote:
> >
> > Hi,
> >
> > On Tue, Aug 25, 2020 at 12:01 PM Sai Prakash Ranjan
> > <saiprakash.ranjan@codeaurora.org> wrote:
> > >
> > > Hi,
> > >
> > > On 2020-08-25 21:40, Doug Anderson wrote:
> > > > Hi,
> > > >
> > > > On Tue, Aug 25, 2020 at 8:43 AM Sai Prakash Ranjan
> > > > <saiprakash.ranjan@codeaurora.org> wrote:
> > > >>
> > > >> Currently the non-strict or lazy mode of TLB invalidation can only be
> > > >> set
> > > >> for all or no domains. This works well for development platforms where
> > > >> setting to non-strict/lazy mode is fine for performance reasons but on
> > > >> production devices, we need a more fine grained control to allow only
> > > >> certain peripherals to support this mode where we can be sure that it
> > > >> is
> > > >> safe. So add support to filter non-strict/lazy mode based on the
> > > >> device
> > > >> names that are passed via cmdline parameter "iommu.nonstrict_device".
> > > >>
> > > >> Example:
> > > >> iommu.nonstrict_device="7c4000.sdhci,a600000.dwc3,6048000.etr"
> >
> > Just curious: are device names like this really guaranteed to be
> > stable across versions?
> >
> >
> > > > I have an inherent dislike of jamming things like this onto the
> > > > command line.  IMHO the command line is the last resort for specifying
> > > > configuration and generally should be limited to some specialized
> > > > debug options and cases where the person running the kernel needs to
> > > > override a config that was set by the person (or company) compiling
> > > > the kernel.  Specifically, having a long/unwieldy command line makes
> > > > it harder to use for the case when an end user actually wants to use
> > > > it to override something.  It's also just another place to look for
> > > > config.
> > > >
> > >
> > > Good thing about command line parameters are that they are optional,
> > > they do
> > > not specify any default behaviour (I mean they are not mandatory to be
> > > set
> > > for the system to be functional), so I would like to view it as an
> > > optional
> > > config. And this command line parameter (nonstrict_device) is strictly
> > > optional
> > > with default being strict already set in the driver.
> > >
> > > They can be passed from the bootloader via chosen node for DT platforms
> > > or choose
> > > a new *bootconfig* as a way to pass the cmdline but finally it does boil
> > > down to
> > > just another config.
> >
> > Never looked at bootconfig.  Unfortunately it seems to require
> > initramfs so that pretty much means it's out for my usage.  :(
> >
> >
> > > I agree with general boolean or single value command line parameters
> > > being just
> > > more messy which could just be Kconfigs instead but for multiple value
> > > parameters
> > > like these do not fit in Kconfig.
> > >
> > > As you might already know, command line also gives an advantage to the
> > > end user
> > > to configure system without building kernel, for this specific command
> > > line its
> > > very useful because the performance bump is quite noticeable when the
> > > iommu.strict
> > > is off. Now for end user who would not be interested in building entire
> > > kernel(majority)
> > > and just cares about good speeds or throughput can find this very
> > > beneficial.
> > > I am not talking about one specific OS usecase here but more in general
> > > term.
> > >
> > > > The other problem is that this doesn't necessarily scale very well.
> > > > While it works OK for embedded cases it doesn't work terribly well for
> > > > distributions.  I know that in an out-of-band thread you indicated
> > > > that it doesn't break anything that's not already broken (AKA this
> > > > doesn't fix the distro case but it doesn't make it worse), it would be
> > > > better to come up with a more universal solution.
> > > >
> > >
> > > Is the universal solution here referring to fix all the command line
> > > parameters
> > > in the kernel or this specific command line? Are we going to remove any
> > > more
> > > addition to the cmdline ;)
> >
> > There are very few cases where a kernel command line parameter is the
> > only way to configure something.  Most of the time it's just there to
> > override a config.  I wouldn't suggest removing those.  I just don't
> > want a kernel command line parameter to be the primary way to enable
> > something.
> >
> >
> > > So possible other solution is the *bootconfig* which is again just
> > > another place
> > > to look for a config. So thing is that this universal solution would
> > > result in
> > > just more new fancy ways of passing configs or adding such configs to
> > > the drivers
> > > or subsystems in kernel which is pretty much similar to implementing
> > > policy in
> > > kernel which I think is frowned upon and mentioned in the other thread.
> > >
> > > > Ideally it feels like we should figure out how to tag devices in a
> > > > generic manner automatically (hardcode at the driver or in the device
> > > > tree).  I think the out-of-band discussions talked about "external
> > > > facing" and the like.  We could also, perhaps, tag devices that have
> > > > "binary blob" firmware if we wanted.  Then we'd have a policy (set by
> > > > Kconfig, perhaps overridable via commandline) that indicated the
> > > > strictness level for the various classes of devices.  So policy would
> > > > be decided by KConfig and/or command line.
> > > >
> > >
> > > How is tagging in driver or device tree better than the simple command
> > > line
> > > approach to pass the same list of devices which otherwise you would
> > > hardcode
> > > in the corresponding drivers and device tree all over the kernel other
> > > than
> > > the scalability part for command line? IMHO it is too much churn.
> >
> > It's better because it doesn't require keeping track and updating
> > these per-board (or per machine) arguments for each and every
> > board/machine you maintain.  If, for instance, we start out by
> > allowing HW video decoder to use non-strict.  So:
> >
> > On one board, we add in "aa00000.video-codec" to the command line.
> > On some other board, maybe we add in "1d00000.video-codec" to the command line.
> > On some other board, maybe we add in "90400000.video-codec" to the command line.
> >
> > Now we realize that there's some problem and we have to remove it, so
> > we need to go through and remove this from our command line
> > everywhere.  Worse is that we have to proactively notice it and remove
> > it.
> >
> > Instead, let's imagine that we set a policy at a bit of a higher
> > level.  Different ideas:
> >
> > a) We could have a CONFIG_ option for the video codec that's something
> > like "CONFIG_VIDEOCODEC_DEFAULT_NONSTRICT".  If this was set then if
> > there is no "iommu.strict" command line argument then this device
> > would be mapped as non-strict.  If "iommu.strict=0" or
> > "iommu.strict=1" is on the command line then it would override all of
> > these defaults.  Probably the existence (or maybe the default value)
> > of this CONFIG option implies that there are no known/expected
> > exploits related to it.
>
> jumping in a bit late so might have missed some of the background, but
> shouldn't the driver decide strict vs non-strict?  It should be the
> one that knows if non-strict is safe or not?

Part of the problem is that we need some way for the driver to know if
the connected device is external or not.  A soldered-down storage
device connected via an internal PCIe bus is probably OK to use w/
non-strict.  An exposed PCIe port that anyone could plug anything into
is probably not OK to use with non-strict.  Right now the kernel
doesn't have this info.

Part of the problem is also trying to describe the risk level that
you're OK with and/or which risks you're willing to take and which
ones you're not willing to take.  Right now there's a binary: "accept
all the risk so I can get the best performance" and "accept none of
the risk".  ...but what if you want to accept some risks and not
others?  Maybe you're compiling the firmware for the video decoder
yourself and you're very convinced that it really sanitizes all input
and can't be compromised (or, if it is, you can quickly patch the
compromise).  You might be willing to run this video codec in "non
strict mode".  ...but if you give the video decoder firmware to
someone else as a binary blob they might not be willing to trust you
and might want to run the same firmware as "non-strict".



> BR,
> -R
>
> >
> > b) We could find some way to tag the video codec and then set
> > non-strictness on certain classes of devices, then we could have a
> > policy to disable strictness on certain classes of devices.
> >
> > The nice thing about the above is that you could imagine someone
> > pushing a change to the stable trees that would fix everyone affected.
> > Nobody would need to go around and adjust command line options, they'd
> > just get the newest stable and it could cause devices to move into
> > strict mode if there was a known exploit.  I suppose with your
> > proposal stable trees could have a "blacklist" where the commandline
> > is ignored for exploited devices, but that seems ugly.
> >
> >
> > > Device tree could be used but then we have a problem with it being for
> > > only
> > > describing hardware and it doesn't work for ACPI based systems.
> > >
> > > Command line approach works for all systems (both DT and ACPI) without
> > > having
> > > to add too much churn to drivers. Lastly, I think we can have both
> > > options, it
> > > doesn't hurt to add command line parameter since it is optional.
> >
> > I'm not opposed to something existing that lets you override this on
> > the command line, but I'm just not a fan of it being the primary way.
> >
> > -Doug
> > _______________________________________________
> > iommu mailing list
> > iommu@lists.linux-foundation.org
> > https://lists.linuxfoundation.org/mailman/listinfo/iommu
