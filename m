Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2E0BE38F8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2019 18:56:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409921AbfJXQ4s (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Oct 2019 12:56:48 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:34695 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2409957AbfJXQ4s (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Oct 2019 12:56:48 -0400
Received: by mail-wr1-f67.google.com with SMTP id t16so21767982wrr.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Oct 2019 09:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LWnsh1VnfR4T7qI+mFbdH+FaPSq3tYzKSOhcVJg7pFE=;
        b=TprQQJMSs5c2EL0ZtRmgUgoFteZMc6kk8z8q99t3AMCnEpXsLnu4G28yTZWdF0WKXo
         AsSMBmk/91zBhpayKuZIuJkBlm3dserOh1K+z62dIVoFAeAsKg+rGv1I60HSmN99HsIP
         C01PDZELGOOHq9mtM7LDhTxymhHtAY+UnR7GpQVS3waz9aihcgyQQzIz0k4CzgQ/csQ5
         h7spT8IUuo+YF0ffSlAZS1CXC+VoH3L4/dEqvfZ/rWzaVJuGH4nSNhg/X1NB+xy7ivaZ
         g7jYMBnHFJwaAWbzYFwXIZuzK2WEK+yLAWNeI/qTQCD/bms90CFHP07zBRErDkc2SugI
         kzzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LWnsh1VnfR4T7qI+mFbdH+FaPSq3tYzKSOhcVJg7pFE=;
        b=dI9JLuWpWPLb2l9vQu2DiInJrI87FRrhEw31eyLp4G/8TnEvZMsL2SgGuCIMikalpQ
         2vilWBTWH1mIhavPnHvDl+NOtQ6YXqs+XlWLWytXHRi6IG2T+W86JZN/Y1ztleen6UZu
         gc7wa3ZMP4ckn4KDMMuhLW6Tgmx272TjiZGakoqyFv0H5vy8G7jyKDzoJGGWPQvzAVRX
         PutDOG2sQhj9t1BihdQT+oQc3IRkjg7hh+NUtbExv8qmGUwrrarvwnkzju0mtBH+qZJY
         sGgrVBHw/5JlxFqPu8XheZnlqUeY1B1Vj6+z+tf2yf0UBftmFnXGJt150okH7pdWXCHG
         7vOw==
X-Gm-Message-State: APjAAAXe3Jn6D+4eQPplqlKM42oYHaP9DXp0swWHTqQVADhGDkP8JAO2
        y4dWWh5vo6+sZilpbFRueFmgGvNILxC853mpUGsSDg==
X-Google-Smtp-Source: APXvYqz61t1rsPsZIoz2r/3DSS4dQctwFYskEA1EgxIFmFai2Df9wr1NPInU9NDLzWDpQnQ/tmFt/Js31wfFhnIQmPc=
X-Received: by 2002:adf:92e7:: with SMTP id 94mr5061277wrn.199.1571936202863;
 Thu, 24 Oct 2019 09:56:42 -0700 (PDT)
MIME-Version: 1.0
References: <20190301192017.39770-1-dianders@chromium.org> <CAJ+vNU0Ma5nG9_ThLO4cdO+=ivf7rmXiHZonF0HY0xx6X3R6Hw@mail.gmail.com>
 <5dce2964-8761-e7d0-8963-f0f5cb2feb02@arm.com> <CAJ+vNU0Q1-d7YDbAAEMqEcWnniqo6jLdKBbcUTar5=hJ+AC8vQ@mail.gmail.com>
 <1f6f7eb0-e1dc-d5a8-fb38-44c5bd839894@arm.com> <CAJ+vNU1Nd2p-ot2Qkj6vD9yD6gcYM-vm+snNWyt0ChgSqe4tBg@mail.gmail.com>
 <5cf9ec03-f6fb-8227-4ec5-62445038f283@arm.com> <CAJ+vNU28LrroW-XC4X2g3bdN171j0ieZenhYE1TrEM8yvKi=cQ@mail.gmail.com>
 <cb6392ff-fac6-300b-2e04-b34df8c42f28@arm.com> <CAJ+vNU0kDseyqAMKAv+9+aw6wVKjBQcHcGD_8XgCy_KzZTM4Gg@mail.gmail.com>
 <4824ef05-7f57-9aab-cdbd-34b3f857b32b@arm.com>
In-Reply-To: <4824ef05-7f57-9aab-cdbd-34b3f857b32b@arm.com>
From:   Tim Harvey <tharvey@gateworks.com>
Date:   Thu, 24 Oct 2019 09:56:30 -0700
Message-ID: <CAJ+vNU0Ls9RpMwZz+kUu=0nE9eSsz7MBPQGqR_U3u=s+Tq_YGw@mail.gmail.com>
Subject: Re: [PATCH v2] iommu/arm-smmu: Break insecure users by disabling
 bypass by default
To:     Robin Murphy <robin.murphy@arm.com>,
        Jan Glauber <jglauber@cavium.com>,
        Kulkarni Ganapatrao <Ganapatrao.Kulkarni@cavium.com>,
        Robert Richter <rrichter@cavium.com>,
        Aleksey Makarov <aleksey.makarov@cavium.com>,
        "Goutham, Sunil" <Sunil.Goutham@cavium.com>,
        David Daney <ddaney@caviumnetworks.com>
Cc:     Tirumalesh Chalamarla <tchalamarla@caviumnetworks.com>,
        Douglas Anderson <dianders@chromium.org>,
        Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will.deacon@arm.com>,
        linux-arm-msm@vger.kernel.org, evgreen@chromium.org,
        tfiga@chromium.org, Rob Clark <robdclark@gmail.com>,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Oct 4, 2019 at 4:27 PM Robin Murphy <robin.murphy@arm.com> wrote:
>
> On 2019-10-04 9:37 pm, Tim Harvey wrote:
> > On Fri, Oct 4, 2019 at 11:34 AM Robin Murphy <robin.murphy@arm.com> wrote:
> >>
> >> On 04/10/2019 18:13, Tim Harvey wrote:
> >> [...]
> >>>>> No difference... still need 'arm-smmu.disable_bypass=n' to boot. Are
> >>>>> all four iommu-map props above supposed to be the same? Seems to me
> >>>>> they all point to the same thing which looks wrong.
> >>>>
> >>>> Hmm... :/
> >>>>
> >>>> Those mappings just set Stream ID == PCI RID (strictly each one should
> >>>> only need to cover the bus range assigned to that bridge, but it's not
> >>>> crucial) which is the same thing the driver assumes for the mmu-masters
> >>>> property, so either that's wrong and never could have worked anyway -
> >>>> have you tried VFIO on this platform? - or there are other devices also
> >>>> mastering through the SMMU that aren't described at all. Are you able to
> >>>> capture a boot log? The SMMU faults do encode information about the
> >>>> offending ID, and you can typically correlate their appearance
> >>>> reasonably well with endpoint drivers probing.
> >>>>
> >>>
> >>> Robin,
> >>>
> >>> VFIO is enabled in the kernel but I don't know anything about how to
> >>> test/use it:
> >>> $ grep VFIO .config
> >>> CONFIG_KVM_VFIO=y
> >>> CONFIG_VFIO_IOMMU_TYPE1=y
> >>> CONFIG_VFIO_VIRQFD=y
> >>> CONFIG_VFIO=y
> >>> # CONFIG_VFIO_NOIOMMU is not set
> >>> CONFIG_VFIO_PCI=y
> >>> CONFIG_VFIO_PCI_MMAP=y
> >>> CONFIG_VFIO_PCI_INTX=y
> >>> # CONFIG_VFIO_PLATFORM is not set
> >>> # CONFIG_VFIO_MDEV is not set
> >>
> >> No worries - since it's a networking-focused SoC I figured there was a
> >> chance you might be using DPDK or similar userspace drivers with the NIC
> >> VFs, but I was just casting around for a quick and easy baseline of
> >> whether the SMMU works at all (another way would be using Qemu to run a
> >> VM with one or more PCI devices assigned).
> >>
> >>> I do have a boot console yet I'm not seeing any smmu faults at all.
> >>> Perhaps I've mis-diagnosed the issue completely. To be clear when I
> >>> boot with arm-smmu.disable_bypass=y the serial console appears to not
> >>> accept input in userspace and with arm-smmu.disable_bypass=n I'm fine.
> >>> I'm using a buildroot initramfs rootfs for simplicity. The system
> >>> isn't hung as I originally expected as the LED heartbeat trigger
> >>> continues blinking... I just can't get console to accept input.
> >>
> >> Curiouser and curiouser... I'm inclined to suspect that the interrupt
> >> configuration might also be messed up, such that the SMMU is blocking
> >> traffic and jammed up due to pending faults, but you're not getting the
> >> IRQ delivered to find out. Does this patch help reveal anything?
> >>
> >> http://linux-arm.org/git?p=linux-rm.git;a=commitdiff;h=29ac3648b580920692c9b417b2fc606995826517
> >>
> >> (untested, but it's a direct port of the one I've used for SMMUv3 to
> >> diagnose something similar)
> >
> > This shows:
>
> Yay (ish)!
>
> [ and the tangential challenge would be to find out what the real global
> fault interrupt is, 'cause apparently it's not SPI 68... ]
>
> > arm-smmu 830000000000.smmu0: Unexpected global fault, this could be serious
> > arm-smmu 830000000000.smmu0:     GFSR 0x80000002, GFSYNR0 0x00000002,
> > GFSYNR1 0x00000140, GFSYNR2 0x00000000
>
> If that stream ID were a PCI RID, it would be 01:08.0
>
> > arm-smmu 830000000000.smmu0: Unexpected global fault, this could be serious
> > arm-smmu 830000000000.smmu0:     GFSR 0x80000002, GFSYNR0 0x00000002,
> > GFSYNR1 0x00000010, GFSYNR2 0x00000000
>
> And this guy would be 00:02.0
>
> So it seems that either the stream ID mapping is non-trivial (and
> "mmu-masters" couldn't have worked), or there are secret magic endpoints
> writing to memory during boot. Either way it probably needs some input
> from Cavium/Marvell to get straight. In the meantime, unless just
> disabling and ignoring the SMMU altogether is a viable option, I guess
> we have to resign to this being one of those "non-good" reasons for
> needing global bypass :(
>
> Robin.
>
> (note to self: it would probably be useful if we dump GFAR in these logs
> too. These are all writes, so it's possible they could be MSI attempts
> targeting the ITS rather than DMA as such)

Robin,

Thanks for the help here!

I opened up a support issue with Marvell but have not gotten anything
from them in the 2 weeks since (horrible support since Marvell
acquired them) thus I'm adding in some Marvell/Cavium folk active in
other areas of kernel development as a cry for help as OcteonTX iommu
is completely broken in mainline and I think this is the cause of
mainline stability issues I've seen since the 4.14 kernel.

Marvell/Cavium devs... can you please chime in here regarding iommu
configuration issues for CN80xx/CN81XX OcteonTX?

Thanks,

Tim


Tim
