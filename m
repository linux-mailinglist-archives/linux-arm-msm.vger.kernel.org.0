Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7A481F17CE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2020 13:26:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729561AbgFHL0y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Jun 2020 07:26:54 -0400
Received: from foss.arm.com ([217.140.110.172]:51570 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729310AbgFHL0y (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Jun 2020 07:26:54 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 915C01FB;
        Mon,  8 Jun 2020 04:26:53 -0700 (PDT)
Received: from [10.57.9.113] (unknown [10.57.9.113])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7FFEC3F73D;
        Mon,  8 Jun 2020 04:26:52 -0700 (PDT)
Subject: Re: [RFC PATCH] iommu/arm-smmu: Remove shutdown callback
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Will Deacon <will@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org
References: <20200607110918.1733-1-saiprakash.ranjan@codeaurora.org>
 <20200608081846.GA1542@willie-the-truck>
 <08c293eefc20bc2c67f2d2639b93f0a5@codeaurora.org>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <e072f61a-d6cf-2e34-efd5-c1db38c5c622@arm.com>
Date:   Mon, 8 Jun 2020 12:26:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <08c293eefc20bc2c67f2d2639b93f0a5@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-06-08 10:13, Sai Prakash Ranjan wrote:
> Hi Will,
> 
> On 2020-06-08 13:48, Will Deacon wrote:
>> On Sun, Jun 07, 2020 at 04:39:18PM +0530, Sai Prakash Ranjan wrote:
>>> Remove SMMU shutdown callback since it seems to cause more
>>> problems than benefits. With this callback, we need to make
>>> sure that all clients/consumers of SMMU do not perform any
>>> DMA activity once the SMMU is shutdown and translation is
>>> disabled. In other words we need to add shutdown callbacks
>>> for all those clients to make sure they do not perform any
>>> DMA or else we see all kinds of weird crashes during reboot
>>> or shutdown. This is clearly not scalable as the number of
>>> clients of SMMU would vary across SoCs and we would need to
>>> add shutdown callbacks to almost all drivers eventually.
>>> This callback was added for kexec usecase where it was known
>>> to cause memory corruptions when SMMU was not shutdown but
>>> that does not directly relate to SMMU because the memory
>>> corruption could be because of the client of SMMU which is
>>> not shutdown properly before booting into new kernel. So in
>>> that case, we need to identify the client of SMMU causing
>>> the memory corruption and add appropriate shutdown callback
>>> to the client rather than to the SMMU.
>>>
>>> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>>> ---
>>>  drivers/iommu/arm-smmu-v3.c | 6 ------
>>>  drivers/iommu/arm-smmu.c    | 6 ------
>>>  2 files changed, 12 deletions(-)
>>
>> This feels like a giant bodge to me and I think that any driver which
>> continues to perform DMA after its ->shutdown() function has been invoked
>> is buggy. Wouldn't that cause problems with kexec(), for example?
>>
> 
> Yes it is definitely a bug in the client driver if DMA is performed
> after shutdown callback of that respective driver is invoked and it must
> be fixed in that driver. But here the problem I was describing is not that,
> most of the drivers do not have a shutdown callback to begin with and 
> adding
> it just because of shutdown dependency on SMMU doesn't seem so well because
> we can have many more such clients in the future and then we have to 
> just go
> on adding the shutdown callbacks everywhere.

Yes, indeed we do. Like it or not, kexec is a thing, and about 98% of 
drivers will have been written without considering it.

If fixing one problem exposes lots of other problems, can you honestly 
say that the best solution is to go back and re-break the original thing?

>> There's a clear shutdown dependency ordering, where the clients of the
>> SMMU need to shutdown before the SMMU itself, but that's not really
>> the SMMU driver's problem to solve.
>>
> 
> The problem with kexec may not be directly related to SMMU as you said
> above if DMA is performed after the client shutdown callback, then its a
> bug in the client driver, so that needs to be fixed in the client driver,
> not the SMMU. So is there any point in having the SMMU shutdown callback?

The point is that kexec needs to return the system to a state as close 
to reset as possible. The SMMU is at least as relevant as any other 
device in that regard, if not far more so - consider if the first kernel 
*did* leave it enabled with whatever left-over translations in place, 
and kexec'ed into another OS that wasn't SMMU-aware...

> As you see, with this SMMU shutdown callback, we need to add shutdown
> callbacks in all the client drivers.

Yes. And if you really want to argue against that, then at least be 
consistent and propose removing shutdown from *all* the IOMMU drivers. 
And then probably propose removing kexec support from all their 
respective architectures... ;)

Robin.
