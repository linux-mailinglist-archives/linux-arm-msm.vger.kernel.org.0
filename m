Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA7EF73369
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jul 2019 18:11:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726817AbfGXQL5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Jul 2019 12:11:57 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:42438 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726526AbfGXQL5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Jul 2019 12:11:57 -0400
Received: by mail-ed1-f68.google.com with SMTP id v15so47636071eds.9;
        Wed, 24 Jul 2019 09:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BcPYpR9djhaAnW7bmdaXKS87Ax5QIqkCxuLZrAiV9mQ=;
        b=cVuuHA2c2hmZ1JZ77+HbfslSKbGPv3c3+EO5CcF0SdOPaiZbD1c19Z2G6/z4E3s/wd
         6x6eglO2cwi45TxHB76FO7V4aPgD6U1mQXvolig1tck5UO13xUuAUtYZoOgADYnd58Om
         cBFBQEHNck17IEdM2yJsvobMNW6ytF+mbNF3lk/V3q21tIleWbAun5vDG4f2OD6ruckJ
         SE0FpfhHBTlHrNoYSJCdlbxOcQoeGJa3yGFv4b8UVznsu6qY/fXVtTzRQ+E3UwqeOl57
         S03mFg4EDwHc5h4nEI8fUnm4fErXaE3accQk42M0EHZOF/GAzr0ARQ3ocB1ugjoyDDyv
         ESPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BcPYpR9djhaAnW7bmdaXKS87Ax5QIqkCxuLZrAiV9mQ=;
        b=Otsu093I95avicPybdqZLs2EOkfOUe9ERvD8QWmzFSo7aNSzyHYIcn0Q3VyGKkqbhH
         vo3qOs2oTRjVJ36dJlARtWm1CIScg1gzPNCYC/XcV9GeLCqNHUcm8TbVnjTz8X5RjsD9
         O4EOqBeDCUkEWKMU0DKkZVRaSDSpQMq4PA7CZdg3jiLQiqnMnZg1hz9t6Q6k6uOWhSr7
         VhIywcX5uzoanFUuXJHQ1XjD418HKWSEaDurFMzsiyQ+GmKdEIeednNApVWWGlKWfSgO
         2fY3LmCr+HS4pM9FDDn2hS45uCaoxz2QQw55eBX3QX9HzjU34NHP+uxE6fU5vqLMsZY+
         ovUg==
X-Gm-Message-State: APjAAAWNSqwNUkNN9QJUssG8iiSXY55ZPvWdD6v/ZQycMF0sDuKbSqVM
        qqASFDiIc1e0TWF6ftMTNQgIjP1SnyARxSL98Vg=
X-Google-Smtp-Source: APXvYqwnKz9+2R8hHcVfd0x/lvnHSBr5dPATrNP0dt3ip0omN9IfWY8hedoH3nZfWjSJPNlTslQKwkgg3Tr0lC5VCoU=
X-Received: by 2002:a17:906:3612:: with SMTP id q18mr64994404ejb.278.1563984714038;
 Wed, 24 Jul 2019 09:11:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190702202631.32148-2-robdclark@gmail.com> <20190710182844.25032-1-robdclark@gmail.com>
 <20190722142833.GB12009@8bytes.org> <CAF6AEGvJc2RK3GkpcXiVKsuTX81D3oahnu=qWJ9LFst1eT3tMg@mail.gmail.com>
 <20190722154803.GG12009@8bytes.org> <CAF6AEGvWf3ZOrbyyWjORuOVEPOcPr+JSEO78aYjhL-GVhDZnTg@mail.gmail.com>
 <20190723153822.gm4ossn43nvqbyak@willie-the-truck> <CAF6AEGtL6gqtbmtksf7zCSGrFOEj0ynq-2nwvizLLiS0FTwHpg@mail.gmail.com>
 <20190724105116.fwhnbfuglbbojjzu@willie-the-truck>
In-Reply-To: <20190724105116.fwhnbfuglbbojjzu@willie-the-truck>
From:   Rob Clark <robdclark@gmail.com>
Date:   Wed, 24 Jul 2019 09:11:42 -0700
Message-ID: <CAF6AEGsmNtwjQQPjwzFBJSAV9dPLFH5=-vkchz0KHgL1yz3mYg@mail.gmail.com>
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

On Wed, Jul 24, 2019 at 3:51 AM Will Deacon <will@kernel.org> wrote:
>
> On Tue, Jul 23, 2019 at 10:40:55AM -0700, Rob Clark wrote:
> > On Tue, Jul 23, 2019 at 8:38 AM Will Deacon <will@kernel.org> wrote:
> > >
> > > On Mon, Jul 22, 2019 at 09:23:48AM -0700, Rob Clark wrote:
> > > > On Mon, Jul 22, 2019 at 8:48 AM Joerg Roedel <joro@8bytes.org> wrote:
> > > > >
> > > > > On Mon, Jul 22, 2019 at 08:41:34AM -0700, Rob Clark wrote:
> > > > > > It is set by the driver:
> > > > > >
> > > > > > https://patchwork.freedesktop.org/patch/315291/
> > > > > >
> > > > > > (This doesn't really belong in devicetree, since it isn't a
> > > > > > description of the hardware, so the driver is really the only place to
> > > > > > set this.. which is fine because it is about a detail of how the
> > > > > > driver works.)
> > > > >
> > > > > It is more a detail about how the firmware works. IIUC the problem is
> > > > > that the firmware initializes the context mappings for the GPU and the
> > > > > OS doesn't know anything about that and just overwrites them, causing
> > > > > the firmware GPU driver to fail badly.
> > > > >
> > > > > So I think it is the task of the firmware to tell the OS not to touch
> > > > > the devices mappings until the OS device driver takes over. On x86 there
> > > > > is something similar with the RMRR/unity-map tables from the firmware.
> > > > >
> > > >
> > > > Bjorn had a patchset[1] to inherit the config from firmware/bootloader
> > > > when arm-smmu is probed which handles that part of the problem.  My
> > > > patch is intended to be used on top of his patchset.  This seems to me
> > > > like the best solution, if we don't have control over the firmware.
> > >
> > > Hmm, but the feedback from Robin on the thread you cite was that this should
> > > be generalised to look more like RMRR, so there seems to be a clear message
> > > here.
> > >
> >
> > Perhaps it is a lack of creativity, or lack of familiarity w/ iommu vs
> > virtualization, but I'm not quite seeing how RMRR would help.. in
> > particular when dealing with both DT and ACPI cases.
>
> Well, I suppose we'd have something for DT and something for ACPI and we'd
> try to make them look similar enough that we don't need lots of divergent
> code in the kernel. The RMRR-like description would describe that, for a
> particular device, a specific virt:phys mapping needs to exist in the
> small window between initialising the SMMU and re-initialising the device
> (GPU).

For both DT and ACPI (or perhaps more accurately UEFI and non-UEFI) we
often don't have much/any control of the firmware.  In the UEFI case,
we can at least get the physical address of the scanout buffer from
EFI GOP (since VA=PA at that point).  In either case we could get the
iova by reading back controller state.  We kinda just need the iommu
driver to not change anything about the context bank the display is
using until the display driver is ready to install it's own
pagetables.

Initially I just want to shut down display, and then bring it back up
w/ my own pagetables.. but eventually, once iommu/clk/genpd issues are
sorted upstream, I'm planning to read out more completely the display
state, and remap the existing scanout buffer at same iova in my own
pagetables/iommu_domain, for a flicker-free display handover... that
is a lot more work but at least it is self contained in the display
(and bridge/panel) drivers.

> I would prefer this to be framebuffer-specific, since we're already in
> flagrant violation of the arm64 boot requirements wrt ongoing DMA and making
> this too general could lead to all sorts of brain damage. That would
> probably also allow us to limit the flexibility, by mandating things like
> alignment and memory attributes.

I'd be pretty happy if we could convince qcom to use EFI GOP on
android devices too..

Although there is a lot more activity these days with people bringing
upstream support to various existing android phones/tablets.. and I'd
like to see that continue without downstream hacks due to lack of
control over firmware.

> Having said that, I just realised I'm still a bit confused about the
> problem: why does the bootloader require SMMU translation for the GPU at
> all? If we could limit this whole thing to be identity-mapped/bypassed,
> then all we need is a per-device flag in the firmware to indicate that the
> SMMU should be initialised to allow passthrough for transactions originating
> from that device.

I was chatting last night w/ Bjorn on IRC.. and he mentioned that it
looked like TTBRn was 0x0.  Which I wasn't expecting, and I didn't
realize was a legit thing.  Maybe the purpose is to allow display to
access memory w/ iova==pa but disallow memory access from other
devices using different context banks of the same iommu?  Maybe this
makes more sense to you?

> > So I kinda prefer, when possible, if arm-smmu can figure out what is going
> > on by looking at the hw state at boot (since that approach would work
> > equally well for DT and ACPI).
>
> That's not going to fly.
>
> Forcing Linux to infer the state of the system by effectively parsing the
> hardware configuration directly is fragile, error-prone and may not even be
> possible in the general case. Worse, if this goes wrong, the symptoms are
> very likely to be undiagnosable memory corruption, which is pretty awful in
> my opinion.

So, I guess in a DT world, we could have some boot-on; flag in the
device node.. that tells the iommu driver the stream-id(s) which might
be in use.  I guess the iommu driver would still need to map that back
to context bank, and then leave that CB and stream<->CB mapping alone.
But I think that would at least prevent "false positives", which I
think is what you are worrying about.

I'm not sure how this would work for ACPI, but tbh I haven't looked
yet at how iommu and device are connected w/ ACPI.

> Not only would you need separate parsing code for every IOMMU out there,
> but you'd also need to make Linux aware of device aspects that it otherwise
> doesn't care about, just in case the firmware decided to use them.
> Furthermore, running an older kernel on newer hardware (which may have some
> extensions), could cause the parsing to silently ignore parts of the device
> that indicate memory regions which are in use. On top of that, there made be
> device-global state that we are unable to reconfigure and that affect
> devices other than the ones in question.

I'm not sure you can avoid having *some* amount of code in each iommu
driver, since the exact meaning of iommu-cells can be different.. but
I guess we could come up with a generic way of determining which
device(s) attached to an iommu might be active when the iommu driver
probes.

> So no, I'm very much against this approach and the solution absolutely needs
> to come in the form of a more abstract description from firmware.
>
> > I *think* (but need to confirm if Bjorn hasn't already) that the
> > memory for the pagetables that firmware/bootloader sets up is already
> > removed from the memory map efi passes to kernel, so we don't need to
> > worry about kernel stomping in-use pagetables.
>
> It's precisely this sort of fragility that makes me nervous about this whole
> approach.

See above about TTBRn==null.. although if there were actually
pagetables, they would need to be reserved memory, otherwise I guess
windows would also have a problem w/ stomping pagetables.

BR,
-R
