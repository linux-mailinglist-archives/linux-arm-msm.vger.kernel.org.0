Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B03F3CC681
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Oct 2019 01:27:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730711AbfJDX1b (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Oct 2019 19:27:31 -0400
Received: from foss.arm.com ([217.140.110.172]:56584 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728913AbfJDX1b (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Oct 2019 19:27:31 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 92CEE15AD;
        Fri,  4 Oct 2019 16:27:30 -0700 (PDT)
Received: from [192.168.1.124] (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CFF9E3F68E;
        Fri,  4 Oct 2019 16:27:28 -0700 (PDT)
Subject: Re: [PATCH v2] iommu/arm-smmu: Break insecure users by disabling
 bypass by default
To:     Tim Harvey <tharvey@gateworks.com>
Cc:     Tirumalesh Chalamarla <tchalamarla@caviumnetworks.com>,
        Douglas Anderson <dianders@chromium.org>,
        Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will.deacon@arm.com>,
        linux-arm-msm@vger.kernel.org, evgreen@chromium.org,
        tfiga@chromium.org, Rob Clark <robdclark@gmail.com>,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org,
        open list <linux-kernel@vger.kernel.org>
References: <20190301192017.39770-1-dianders@chromium.org>
 <CAJ+vNU0Ma5nG9_ThLO4cdO+=ivf7rmXiHZonF0HY0xx6X3R6Hw@mail.gmail.com>
 <5dce2964-8761-e7d0-8963-f0f5cb2feb02@arm.com>
 <CAJ+vNU0Q1-d7YDbAAEMqEcWnniqo6jLdKBbcUTar5=hJ+AC8vQ@mail.gmail.com>
 <1f6f7eb0-e1dc-d5a8-fb38-44c5bd839894@arm.com>
 <CAJ+vNU1Nd2p-ot2Qkj6vD9yD6gcYM-vm+snNWyt0ChgSqe4tBg@mail.gmail.com>
 <5cf9ec03-f6fb-8227-4ec5-62445038f283@arm.com>
 <CAJ+vNU28LrroW-XC4X2g3bdN171j0ieZenhYE1TrEM8yvKi=cQ@mail.gmail.com>
 <cb6392ff-fac6-300b-2e04-b34df8c42f28@arm.com>
 <CAJ+vNU0kDseyqAMKAv+9+aw6wVKjBQcHcGD_8XgCy_KzZTM4Gg@mail.gmail.com>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <4824ef05-7f57-9aab-cdbd-34b3f857b32b@arm.com>
Date:   Sat, 5 Oct 2019 00:27:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CAJ+vNU0kDseyqAMKAv+9+aw6wVKjBQcHcGD_8XgCy_KzZTM4Gg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2019-10-04 9:37 pm, Tim Harvey wrote:
> On Fri, Oct 4, 2019 at 11:34 AM Robin Murphy <robin.murphy@arm.com> wrote:
>>
>> On 04/10/2019 18:13, Tim Harvey wrote:
>> [...]
>>>>> No difference... still need 'arm-smmu.disable_bypass=n' to boot. Are
>>>>> all four iommu-map props above supposed to be the same? Seems to me
>>>>> they all point to the same thing which looks wrong.
>>>>
>>>> Hmm... :/
>>>>
>>>> Those mappings just set Stream ID == PCI RID (strictly each one should
>>>> only need to cover the bus range assigned to that bridge, but it's not
>>>> crucial) which is the same thing the driver assumes for the mmu-masters
>>>> property, so either that's wrong and never could have worked anyway -
>>>> have you tried VFIO on this platform? - or there are other devices also
>>>> mastering through the SMMU that aren't described at all. Are you able to
>>>> capture a boot log? The SMMU faults do encode information about the
>>>> offending ID, and you can typically correlate their appearance
>>>> reasonably well with endpoint drivers probing.
>>>>
>>>
>>> Robin,
>>>
>>> VFIO is enabled in the kernel but I don't know anything about how to
>>> test/use it:
>>> $ grep VFIO .config
>>> CONFIG_KVM_VFIO=y
>>> CONFIG_VFIO_IOMMU_TYPE1=y
>>> CONFIG_VFIO_VIRQFD=y
>>> CONFIG_VFIO=y
>>> # CONFIG_VFIO_NOIOMMU is not set
>>> CONFIG_VFIO_PCI=y
>>> CONFIG_VFIO_PCI_MMAP=y
>>> CONFIG_VFIO_PCI_INTX=y
>>> # CONFIG_VFIO_PLATFORM is not set
>>> # CONFIG_VFIO_MDEV is not set
>>
>> No worries - since it's a networking-focused SoC I figured there was a
>> chance you might be using DPDK or similar userspace drivers with the NIC
>> VFs, but I was just casting around for a quick and easy baseline of
>> whether the SMMU works at all (another way would be using Qemu to run a
>> VM with one or more PCI devices assigned).
>>
>>> I do have a boot console yet I'm not seeing any smmu faults at all.
>>> Perhaps I've mis-diagnosed the issue completely. To be clear when I
>>> boot with arm-smmu.disable_bypass=y the serial console appears to not
>>> accept input in userspace and with arm-smmu.disable_bypass=n I'm fine.
>>> I'm using a buildroot initramfs rootfs for simplicity. The system
>>> isn't hung as I originally expected as the LED heartbeat trigger
>>> continues blinking... I just can't get console to accept input.
>>
>> Curiouser and curiouser... I'm inclined to suspect that the interrupt
>> configuration might also be messed up, such that the SMMU is blocking
>> traffic and jammed up due to pending faults, but you're not getting the
>> IRQ delivered to find out. Does this patch help reveal anything?
>>
>> http://linux-arm.org/git?p=linux-rm.git;a=commitdiff;h=29ac3648b580920692c9b417b2fc606995826517
>>
>> (untested, but it's a direct port of the one I've used for SMMUv3 to
>> diagnose something similar)
> 
> This shows:

Yay (ish)!

[ and the tangential challenge would be to find out what the real global 
fault interrupt is, 'cause apparently it's not SPI 68... ]

> arm-smmu 830000000000.smmu0: Unexpected global fault, this could be serious
> arm-smmu 830000000000.smmu0:     GFSR 0x80000002, GFSYNR0 0x00000002,
> GFSYNR1 0x00000140, GFSYNR2 0x00000000

If that stream ID were a PCI RID, it would be 01:08.0

> arm-smmu 830000000000.smmu0: Unexpected global fault, this could be serious
> arm-smmu 830000000000.smmu0:     GFSR 0x80000002, GFSYNR0 0x00000002,
> GFSYNR1 0x00000010, GFSYNR2 0x00000000

And this guy would be 00:02.0

So it seems that either the stream ID mapping is non-trivial (and 
"mmu-masters" couldn't have worked), or there are secret magic endpoints 
writing to memory during boot. Either way it probably needs some input 
from Cavium/Marvell to get straight. In the meantime, unless just 
disabling and ignoring the SMMU altogether is a viable option, I guess 
we have to resign to this being one of those "non-good" reasons for 
needing global bypass :(

Robin.

(note to self: it would probably be useful if we dump GFAR in these logs 
too. These are all writes, so it's possible they could be MSI attempts 
targeting the ITS rather than DMA as such)

> arm-smmu 830000000000.smmu0: Unexpected global fault, this could be serious
> arm-smmu 830000000000.smmu0:     GFSR 0x80000002, GFSYNR0 0x00000002,
> GFSYNR1 0x00000010, GFSYNR2 0x00000000
> arm-smmu 830000000000.smmu0: Unexpected global fault, this could be serious
> arm-smmu 830000000000.smmu0:     GFSR 0x80000002, GFSYNR0 0x00000002,
> GFSYNR1 0x00000010, GFSYNR2 0x00000000
> arm-smmu 830000000000.smmu0: Unexpected global fault, this could be serious
> arm-smmu 830000000000.smmu0:     GFSR 0x80000002, GFSYNR0 0x00000002,
> GFSYNR1 0x00000010, GFSYNR2 0x00000000
> arm-smmu 830000000000.smmu0: Unexpected global fault, this could be serious
> arm-smmu 830000000000.smmu0:     GFSR 0x80000002, GFSYNR0 0x00000002,
> GFSYNR1 0x00000010, GFSYNR2 0x00000000
> arm-smmu 830000000000.smmu0: Unexpected global fault, this could be serious
> arm-smmu 830000000000.smmu0:     GFSR 0x80000002, GFSYNR0 0x00000002,
> GFSYNR1 0x00000010, GFSYNR2 0x00000000
> arm-smmu 830000000000.smmu0: Unexpected global fault, this could be serious
> arm-smmu 830000000000.smmu0:     GFSR 0x80000002, GFSYNR0 0x00000002,
> GFSYNR1 0x00000010, GFSYNR2 0x00000000
> arm-smmu 830000000000.smmu0: Unexpected global fault, this could be serious
> arm-smmu 830000000000.smmu0:     GFSR 0x80000002, GFSYNR0 0x00000002,
> GFSYNR1 0x00000010, GFSYNR2 0x00000000
> arm-smmu 830000000000.smmu0: Unexpected global fault, this could be serious
> arm-smmu 830000000000.smmu0:     GFSR 0x80000002, GFSYNR0 0x00000002,
> GFSYNR1 0x00000010, GFSYNR2 0x00000000
> ...
> arm-smmu 830000000000.smmu0: Unexpected global fault, this could be serious
> arm-smmu 830000000000.smmu0:     GFSR 0x80000002, GFSYNR0 0x00000002,
> GFSYNR1 0x00000010, GFSYNR2 0x00000000
> ^^^ these two repeat over and over
> 
>>
>> That said, it's also puzzling that no other drivers are reporting DMA
>> errors or timeouts either - is there any chance that some device is set
>> running by the firmware/bootloader and not taken over by a kernel driver?
>>
> 
> anything is possible - I'm using the Cavium 'BDK' as boot firmware to
> configure the board which sits in from of arm trusted firmare and
> bootloader.
> 
> Tim
> 
