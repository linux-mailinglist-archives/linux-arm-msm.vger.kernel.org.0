Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 94FED1444A5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jan 2020 19:55:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729099AbgAUSzE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Jan 2020 13:55:04 -0500
Received: from foss.arm.com ([217.140.110.172]:47514 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729080AbgAUSzD (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Jan 2020 13:55:03 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5481D1FB;
        Tue, 21 Jan 2020 10:55:03 -0800 (PST)
Received: from [10.1.196.37] (e121345-lin.cambridge.arm.com [10.1.196.37])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5A2343F6C4;
        Tue, 21 Jan 2020 10:55:02 -0800 (PST)
Subject: Re: [PATCH v3 2/5] iommu/arm-smmu: Add support for split pagetables
To:     iommu@lists.linux-foundation.org, will@kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Joerg Roedel <joro@8bytes.org>
References: <1576514271-15687-1-git-send-email-jcrouse@codeaurora.org>
 <1576514271-15687-3-git-send-email-jcrouse@codeaurora.org>
 <a38fe02a-4f84-f032-8c9d-4ecf72a87a55@arm.com>
 <20200121171127.GA5025@jcrouse1-lnx.qualcomm.com>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <0bd9df86-887b-ce94-432e-0cc7fb7cc897@arm.com>
Date:   Tue, 21 Jan 2020 18:54:59 +0000
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200121171127.GA5025@jcrouse1-lnx.qualcomm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21/01/2020 5:11 pm, Jordan Crouse wrote:
[...]
>> I'm looking at iommu_aux_attach_device() and friends, and it appears pretty
>> achievable to hook that up in a workable manner, even if it's just routed
>> straight through to the impl to only work within qcom-specific parameters to
>> begin with. I figure the first aux_attach_dev sanity-checks that the main
>> domain is using TTBR1 with a compatible split, sets TTBR0 and updates the
>> merged TCR value at that point. For subsequent calls it shouldn't need to do
>> much more than sanity-check that a new aux domain has the same parameters as
>> the existing one(s) (and again, such checks could potentially even start out
>> as just "this is OK by construction" comments). I guess we'd probably want a
>> count of the number of 'live' aux domains so we can simply disable TTBR0 on
>> the final aux_detach_dev without having to keep detailed track of whatever
>> the GPU has actually context switched in the hardware. Can you see any holes
>> in that idea?
> 
> Let me repeat this back just to be sure we're on the same page. When the quirk
> is enabled on the primary domain, we'll set up TTBR1 and leave TTBR0 disabled.
> Then, when the first aux domain is attached we will set up that io_ptgable
> to enable TTBR0 and then let the GPU do what the GPU does until the last aux is
> detached and we can switch off TTBR0 again.
> 
> I like this. I'll have to do a bit more exploration because the original aux
> design assumed that we didn't need to touch the hardware and I'm not sure if
> there are any resource contention issues between the primary domain and the aux
> domain. Luckily, these should be solvable if they exist (and the original design
> didn't take into account the TLB flush problem so this was likely something we
> had to do anyway).

Yeah, sounds like you've got it (somehow I'd completely forgotten that 
you'd already prototyped the aux domain part, and I only re-read the 
cover letter after sending that review...). TBH it's not massively 
different, just being a bit more honest about the intermediate hardware 
state. As long as we can rely on all aux domains being equivalent and 
the GPU never writing nonsense to TTBR0, then all arm-smmu really wants 
to care about is whether there's *something* live or not at any given 
time, so attach (with quirk) does:

	TTBR1 = primary_domain->ttbr
	TCR = primary_domain->tcr | EPD0

then attach_aux comes along and adds:

	TTBR0 = aux_domain->ttbr
	TCR = primary_doman->tcr | aux_domain->tcr

such that arm-smmu can be happy that TTBR0 is always pointing at *some* 
valid pagetable from that point on regardless of what subsequently 
happens underneath, and nobody need touch TCR until the party's 
completely over.

>> I haven't thought it through in detail, but it also feels like between
>> aux_attach_dev and/or the TTBR1 quirk in attach_dev there ought to be enough
>> information to influence the context bank allocation or shuffle any existing
>> domains such that you can ensure that the right thing ends up in magic
>> context 0 when it needs to be. That could be a pretty neat and robust way to
>> finally put that to bed.
> 
> I'll try to wrap my brain around this as well. Seems like we could do a magic
> swizzle of the SID mappings but I'm not sure how we could safely pull that off
> on an existing domain. Maybe I'm overthinking it.

What I'm imagining isn't all that far from how we do normal domain 
attach, except instead of setting up the newly-allocated context for a 
new domain you simply clone the existing context into it, and instead of 
having a given device's set of Stream IDs to retarget you'd just scan 
though the S2CRs checking cbndx and rewriting as appropriate. Then 
finally rewrite domain->cfg.cbndx and the old context is all yours.

> I'll spin up a new copy of the TTBR1 quirk patch and revive the aux domain stuff
> and then we can go from there.

Sounds good, thanks!

Robin.
