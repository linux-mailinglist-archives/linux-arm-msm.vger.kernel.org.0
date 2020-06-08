Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00FAB1F1A7E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2020 16:02:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729833AbgFHOCN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Jun 2020 10:02:13 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:25112 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726092AbgFHOCM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Jun 2020 10:02:12 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1591624931; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=tEdZ6QUxV0aIalkZh0RUwZLDn+U3wprRkWo1uaBu5Io=;
 b=BxO8zwnsQcaobtqJpzUw3xHdSEax5KrNEqA05lGuVNnj8tU0M51rtvfe+rFFiTivfOC/65f1
 tS3KaL4aBi4A5dC7+gTnW0w3mtXVi9nXUbkV20mnxFbW68uA4txun1C9QIPJGsnlP5cw2aTj
 jctt0WOyEHnyjCRvpdniWhcIgQU=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 5ede44b4754b690164dac634 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 08 Jun 2020 14:01:24
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 7CF70C43395; Mon,  8 Jun 2020 14:01:24 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7F59CC433C6;
        Mon,  8 Jun 2020 14:01:23 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 08 Jun 2020 19:31:23 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Will Deacon <will@kernel.org>
Cc:     Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [RFC PATCH] iommu/arm-smmu: Remove shutdown callback
In-Reply-To: <20200608113852.GA3108@willie-the-truck>
References: <20200607110918.1733-1-saiprakash.ranjan@codeaurora.org>
 <20200608081846.GA1542@willie-the-truck>
 <08c293eefc20bc2c67f2d2639b93f0a5@codeaurora.org>
 <20200608113852.GA3108@willie-the-truck>
Message-ID: <dbd12d8017fc6b84232be7359437eb3b@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Will,

On 2020-06-08 17:08, Will Deacon wrote:
> On Mon, Jun 08, 2020 at 02:43:03PM +0530, Sai Prakash Ranjan wrote:
>> On 2020-06-08 13:48, Will Deacon wrote:
>> > On Sun, Jun 07, 2020 at 04:39:18PM +0530, Sai Prakash Ranjan wrote:
>> > > Remove SMMU shutdown callback since it seems to cause more
>> > > problems than benefits. With this callback, we need to make
>> > > sure that all clients/consumers of SMMU do not perform any
>> > > DMA activity once the SMMU is shutdown and translation is
>> > > disabled. In other words we need to add shutdown callbacks
>> > > for all those clients to make sure they do not perform any
>> > > DMA or else we see all kinds of weird crashes during reboot
>> > > or shutdown. This is clearly not scalable as the number of
>> > > clients of SMMU would vary across SoCs and we would need to
>> > > add shutdown callbacks to almost all drivers eventually.
>> > > This callback was added for kexec usecase where it was known
>> > > to cause memory corruptions when SMMU was not shutdown but
>> > > that does not directly relate to SMMU because the memory
>> > > corruption could be because of the client of SMMU which is
>> > > not shutdown properly before booting into new kernel. So in
>> > > that case, we need to identify the client of SMMU causing
>> > > the memory corruption and add appropriate shutdown callback
>> > > to the client rather than to the SMMU.
>> > >
>> > > Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>> > > ---
>> > >  drivers/iommu/arm-smmu-v3.c | 6 ------
>> > >  drivers/iommu/arm-smmu.c    | 6 ------
>> > >  2 files changed, 12 deletions(-)
>> >
>> > This feels like a giant bodge to me and I think that any driver which
>> > continues to perform DMA after its ->shutdown() function has been
>> > invoked
>> > is buggy. Wouldn't that cause problems with kexec(), for example?
>> >
>> 
>> Yes it is definitely a bug in the client driver if DMA is performed
>> after shutdown callback of that respective driver is invoked and it 
>> must
>> be fixed in that driver. But here the problem I was describing is not 
>> that,
>> most of the drivers do not have a shutdown callback to begin with and 
>> adding
>> it just because of shutdown dependency on SMMU doesn't seem so well 
>> because
>> we can have many more such clients in the future and then we have to 
>> just go
>> on adding the shutdown callbacks everywhere.
> 
> I'm not sure why you're trying to treat these cases differently. It's 
> also
> not "just because of SMMU", is it? Like I said, kexec() would be broken
> regardless.
> 
> The bottom line is that after running ->shutdown() (or skipping it if 
> it's
> not implemented) for a driver, then the device must no longer perform 
> DMA.
> 

Yes it's not just because of SMMU. Now I understand that we indeed need
to shutdown SMMU like any other driver and we need to fix the client
drivers as well.

>> > There's a clear shutdown dependency ordering, where the clients of the
>> > SMMU need to shutdown before the SMMU itself, but that's not really
>> > the SMMU driver's problem to solve.
>> >
>> 
>> The problem with kexec may not be directly related to SMMU as you said
>> above if DMA is performed after the client shutdown callback, then its 
>> a
>> bug in the client driver, so that needs to be fixed in the client 
>> driver,
>> not the SMMU. So is there any point in having the SMMU shutdown 
>> callback?
> 
> Given that the SMMU mediates DMA transactions for all upstream masters
> based on in-memory data (e.g. page tables), then I think it's a /very/
> good idea to tear that down as part of the shutdown callback before
> the memory is effectively free()d.
> 
> One thing I would be in favour of is changing the ->shutdown() code to
> honour disable_bypass=1 so that we put the SMMU in an aborting state
> instead of passthrough. Would that help at all? It would at least
> avoid the memory corruption on missing shutdown callback.
> 

This would be good, however this would then mask the fact that it is
client drivers who are buggy and if we stop seeing issues, then no one
will bother fixing the client drivers. So we better go ahead and fix
the client drivers first and I will drop this patch.

>> As you see, with this SMMU shutdown callback, we need to add shutdown
>> callbacks in all the client drivers.
> 
> I don't see the problem with that. Why is it a problem?
> 

Not a problem, I wanted to confirm if kexec issue was indeed only due to
client driver bugs or SMMU has also some contribution. We have already
started adding client driver shutdown callbacks [1][2], but I also
wanted to get this clarified, so sent this patch as RFC.

[1] - 
https://lore.kernel.org/lkml/1591009402-681-1-git-send-email-mkrishn@codeaurora.org/
[2] - 
https://lore.kernel.org/lkml/28123d1e19f235f97555ee36a5ed8b52d20cbdea.1590947174.git.saiprakash.ranjan@codeaurora.org/

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
