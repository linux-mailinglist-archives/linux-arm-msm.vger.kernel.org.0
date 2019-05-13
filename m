Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47E081BD3E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 May 2019 20:37:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726889AbfEMShc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 May 2019 14:37:32 -0400
Received: from usa-sjc-mx-foss1.foss.arm.com ([217.140.101.70]:35884 "EHLO
        foss.arm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726771AbfEMShc (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 May 2019 14:37:32 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 653B480D;
        Mon, 13 May 2019 11:37:31 -0700 (PDT)
Received: from [10.1.196.129] (ostrya.cambridge.arm.com [10.1.196.129])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0AE043F6C4;
        Mon, 13 May 2019 11:37:29 -0700 (PDT)
Subject: Re: [RFC] iommu: arm-smmu: stall support
To:     Rob Clark <robdclark@gmail.com>
Cc:     linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Will Deacon <Will.Deacon@arm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "eric.auger@redhat.com" <eric.auger@redhat.com>,
        "jacob.jun.pan@linux.intel.com" <jacob.jun.pan@linux.intel.com>
References: <20170914194444.32551-1-robdclark@gmail.com>
 <20170919123038.GF8398@8bytes.org>
 <CAF6AEGuutkqjrWk4jagE=p-NwHgxdiPZjjsaFsfwtczK568j+A@mail.gmail.com>
 <20170922090204.GJ8398@8bytes.org>
 <32e3ab2c-a996-c805-2a0d-a2e85deb3a50@arm.com>
 <CAF6AEGuepdKo1Ob2jW66UhYXOTAqOMc3C-XKsK3Rze1QdLobLw@mail.gmail.com>
From:   Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
Message-ID: <571e825d-7f54-2da4-adc0-6b6ac6dae459@arm.com>
Date:   Mon, 13 May 2019 19:37:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAF6AEGuepdKo1Ob2jW66UhYXOTAqOMc3C-XKsK3Rze1QdLobLw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Rob,

On 10/05/2019 19:23, Rob Clark wrote:
> On Fri, Sep 22, 2017 at 2:58 AM Jean-Philippe Brucker
> <jean-philippe.brucker@arm.com> wrote:
>>
>> On 22/09/17 10:02, Joerg Roedel wrote:
>>> On Tue, Sep 19, 2017 at 10:23:43AM -0400, Rob Clark wrote:
>>>> I would like to decide in the IRQ whether or not to queue work or not,
>>>> because when we get a gpu fault, we tend to get 1000's of gpu faults
>>>> all at once (and I really only need to handle the first one).  I
>>>> suppose that could also be achieved by having a special return value
>>>> from the fault handler to say "call me again from a wq"..
>>>>
>>>> Note that in the drm driver I already have a suitable wq to queue the
>>>> work, so it really doesn't buy me anything to have the iommu driver
>>>> toss things off to a wq for me.  Might be a different situation for
>>>> other drivers (but I guess mostly other drivers are using iommu API
>>>> indirectly via dma-mapping?)
>>>
>>> Okay, so since you are the only user for now, we don't need a
>>> work-queue. But I still want the ->resume call-back to be hidden in the
>>> iommu code and not be exposed to users.
>>>
>>> We already have per-domain fault-handlers, so the best solution for now
>>> is to call ->resume from report_iommu_fault() when the fault-handler
>>> returns a special value.
>>
>> The problem is that report_iommu_fault is called from IRQ context by the
>> SMMU driver, so the device driver callback cannot sleep.
>>
>> So if the device driver needs to be able to sleep between fault report and
>> resume, as I understand Rob needs for writing debugfs, we can either:
>>
>> * call report_iommu_fault from higher up, in a thread or workqueue.
>> * split the fault reporting as this patch proposes. The exact same
>>   mechanism is needed for the vSVM work by Intel: in order to inject fault
>>   into the guest, they would like to have an atomic notifier registered by
>>   VFIO for passing down the Page Request, and a new function in the IOMMU
>>   API to resume/complete the fault.
>>
> 
> So I was thinking about this topic again.. I would still like to get
> some sort of async resume so that I can wire up GPU cmdstream/state
> logging on iommu fault (without locally resurrecting and rebasing this
> patch and drm/msm side changes each time I need to debug iommu
> faults)..

We've been working on the new fault reporting API with Jacob and Eric,
and I intend to send it out soon. It is supposed to be used for
reporting faults to guests via VFIO, handling page faults via mm, and
also reporting events directly to device drivers. Please let us know
what works and what doesn't in your case

The most recent version of the patches is at
http://www.linux-arm.org/git?p=linux-jpb.git;a=shortlog;h=refs/heads/sva/api
(git://www.linux-arm.org/linux-jpb.git branch sva/api). Hopefully on the
list sometimes next week, I'll add you on Cc.

In particular, see commits
	iommu: Introduce device fault data
	iommu: Introduce device fault report API
	iommu: Add recoverable fault reporting

The device driver calls iommu_register_device_fault_handler(dev, cb,
data). To report a fault, the SMMU driver calls
iommu_report_device_fault(dev, fault). This calls into the device driver
directly, there isn't any workqueue. If the fault is recoverable (the
SMMU driver set type IOMMU_FAULT_PAGE_REQ rather than
IOMMU_FAULT_DMA_UNRECOV), the device driver calls iommu_page_response()
once it has dealt with the fault (after sleeping if it needs to). This
invokes the SMMU driver's resume callback.

At the moment we use mutexes, so iommu_report_device_fault() can only be
called from an IRQ thread, which is incompatible with the current SMMUv2
driver. Either we need to switch the SMMUv2 driver to an IRQ thread, or
rework the fault handler to be called from an IRQ handler. The reporting
also has to be per device rather than per domain, and I'm not sure if
the SMMUv2 driver can deal with this.

> 
> And I do still prefer the fault cb in irq (or not requiring it in
> wq)..  but on thinking about it, the two ideas aren't entirely
> conflicting, ie. add some flags either when we register handler[1], or
> they could be handled thru domain_set_attr, like:
> 
>  _EXPLICIT_RESUME - iommu API user calls iommu_domain_resume(),
> potentialy from wq/thread after fault handler returns
>  _HANDLER_SLEEPS  - iommu core handles the wq, and calls ops->resume()
> internally
> 
> In both cases, from the iommu driver PoV it just implements
> iommu_ops::resume().. in first case it is called via iommu user either
> from the fault handler or at some point later (ie. wq or thread).
> 
> I don't particularly need the _HANDLER_SLEEPS case (unless I can't
> convince anyone that iommu_domamin_resume() called from outside iommu
> core is a good idea).. so probably I wouldn't wire up the wq plumbing
> for the _HANDLER_SLEEPS case unless someone really wanted me to.
> 
> Since there are more iommu drivers, than places that register fault
> handlers, I like the idea that in either case, from the driver PoV, it
> is just implementing the resume callback.
> 
> [1] currently I only see a few places where fault handlers are
> registered, so changing iommu_set_fault_handler() is really not much
> churn

At the moment we're keeping the new fault reporting mechanism separate
from iommu_set_fault_handler()/report_iommu_fault(), to ease the transition.

Thanks,
Jean
