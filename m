Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 073FF72C93
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jul 2019 12:51:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727111AbfGXKvZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Jul 2019 06:51:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:53730 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726087AbfGXKvY (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Jul 2019 06:51:24 -0400
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2C0B4229ED;
        Wed, 24 Jul 2019 10:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1563965483;
        bh=WM+fscYo1bqfJi2bJEoVhI4xfS6Xuq0YCL9CJeqsjeQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=E8/sdrxglJ6P9i4L4AFnheuK8F34oHAqeZAxjE9/ywra0lH0UJDFt76V5Q7zAhyoo
         THDmcRxl8fvPWETShgPgdpQBEgTqCQp9QoKNRCKIFRGHpA+Ytg1CkfChHBZ2djurj6
         ysGCImQlwMiYq/0GEyg2CuJIgv6DtX5PaV3JAtIo=
Date:   Wed, 24 Jul 2019 11:51:17 +0100
From:   Will Deacon <will@kernel.org>
To:     Rob Clark <robdclark@gmail.com>
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
Subject: Re: [PATCH v2] iommu: add support for drivers that manage iommu
 explicitly
Message-ID: <20190724105116.fwhnbfuglbbojjzu@willie-the-truck>
References: <20190702202631.32148-2-robdclark@gmail.com>
 <20190710182844.25032-1-robdclark@gmail.com>
 <20190722142833.GB12009@8bytes.org>
 <CAF6AEGvJc2RK3GkpcXiVKsuTX81D3oahnu=qWJ9LFst1eT3tMg@mail.gmail.com>
 <20190722154803.GG12009@8bytes.org>
 <CAF6AEGvWf3ZOrbyyWjORuOVEPOcPr+JSEO78aYjhL-GVhDZnTg@mail.gmail.com>
 <20190723153822.gm4ossn43nvqbyak@willie-the-truck>
 <CAF6AEGtL6gqtbmtksf7zCSGrFOEj0ynq-2nwvizLLiS0FTwHpg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAF6AEGtL6gqtbmtksf7zCSGrFOEj0ynq-2nwvizLLiS0FTwHpg@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jul 23, 2019 at 10:40:55AM -0700, Rob Clark wrote:
> On Tue, Jul 23, 2019 at 8:38 AM Will Deacon <will@kernel.org> wrote:
> >
> > On Mon, Jul 22, 2019 at 09:23:48AM -0700, Rob Clark wrote:
> > > On Mon, Jul 22, 2019 at 8:48 AM Joerg Roedel <joro@8bytes.org> wrote:
> > > >
> > > > On Mon, Jul 22, 2019 at 08:41:34AM -0700, Rob Clark wrote:
> > > > > It is set by the driver:
> > > > >
> > > > > https://patchwork.freedesktop.org/patch/315291/
> > > > >
> > > > > (This doesn't really belong in devicetree, since it isn't a
> > > > > description of the hardware, so the driver is really the only place to
> > > > > set this.. which is fine because it is about a detail of how the
> > > > > driver works.)
> > > >
> > > > It is more a detail about how the firmware works. IIUC the problem is
> > > > that the firmware initializes the context mappings for the GPU and the
> > > > OS doesn't know anything about that and just overwrites them, causing
> > > > the firmware GPU driver to fail badly.
> > > >
> > > > So I think it is the task of the firmware to tell the OS not to touch
> > > > the devices mappings until the OS device driver takes over. On x86 there
> > > > is something similar with the RMRR/unity-map tables from the firmware.
> > > >
> > >
> > > Bjorn had a patchset[1] to inherit the config from firmware/bootloader
> > > when arm-smmu is probed which handles that part of the problem.  My
> > > patch is intended to be used on top of his patchset.  This seems to me
> > > like the best solution, if we don't have control over the firmware.
> >
> > Hmm, but the feedback from Robin on the thread you cite was that this should
> > be generalised to look more like RMRR, so there seems to be a clear message
> > here.
> >
> 
> Perhaps it is a lack of creativity, or lack of familiarity w/ iommu vs
> virtualization, but I'm not quite seeing how RMRR would help.. in
> particular when dealing with both DT and ACPI cases.

Well, I suppose we'd have something for DT and something for ACPI and we'd
try to make them look similar enough that we don't need lots of divergent
code in the kernel. The RMRR-like description would describe that, for a
particular device, a specific virt:phys mapping needs to exist in the
small window between initialising the SMMU and re-initialising the device
(GPU).

I would prefer this to be framebuffer-specific, since we're already in
flagrant violation of the arm64 boot requirements wrt ongoing DMA and making
this too general could lead to all sorts of brain damage. That would
probably also allow us to limit the flexibility, by mandating things like
alignment and memory attributes.

Having said that, I just realised I'm still a bit confused about the
problem: why does the bootloader require SMMU translation for the GPU at
all? If we could limit this whole thing to be identity-mapped/bypassed,
then all we need is a per-device flag in the firmware to indicate that the
SMMU should be initialised to allow passthrough for transactions originating
from that device.

> So I kinda prefer, when possible, if arm-smmu can figure out what is going
> on by looking at the hw state at boot (since that approach would work
> equally well for DT and ACPI).

That's not going to fly.

Forcing Linux to infer the state of the system by effectively parsing the
hardware configuration directly is fragile, error-prone and may not even be
possible in the general case. Worse, if this goes wrong, the symptoms are
very likely to be undiagnosable memory corruption, which is pretty awful in
my opinion.

Not only would you need separate parsing code for every IOMMU out there,
but you'd also need to make Linux aware of device aspects that it otherwise
doesn't care about, just in case the firmware decided to use them.
Furthermore, running an older kernel on newer hardware (which may have some
extensions), could cause the parsing to silently ignore parts of the device
that indicate memory regions which are in use. On top of that, there made be
device-global state that we are unable to reconfigure and that affect
devices other than the ones in question.

So no, I'm very much against this approach and the solution absolutely needs
to come in the form of a more abstract description from firmware.

> I *think* (but need to confirm if Bjorn hasn't already) that the
> memory for the pagetables that firmware/bootloader sets up is already
> removed from the memory map efi passes to kernel, so we don't need to
> worry about kernel stomping in-use pagetables.

It's precisely this sort of fragility that makes me nervous about this whole
approach.

Will
