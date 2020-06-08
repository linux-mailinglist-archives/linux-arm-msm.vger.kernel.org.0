Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C688F1F1A69
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2020 15:50:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728472AbgFHNud (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Jun 2020 09:50:33 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:56159 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729674AbgFHNuc (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Jun 2020 09:50:32 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1591624231; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=BeW+XFvH8gEbAcXx9Jn4/gY3Kx/KL0fZNhe2EoXlSQQ=;
 b=g7Qus5qzgMO2ImAOIPzc7iElmZVy8uFuVM1nxr18I7bw1V0MgjqZbUsCZnW0Dogap32w9Oe3
 SSnM+lqDEJg4KfUNFfYTbOpicnuJd1PsFdtMyfMKGPWPYRzwyKsEfXE9p2muBQqJ/sr6GOuq
 PTbKZK+0deCAldtbgh+H3IpF+5Y=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 5ede421a5c89e47d732ac7df (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 08 Jun 2020 13:50:18
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5805BC433CB; Mon,  8 Jun 2020 13:50:18 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 376ACC433CA;
        Mon,  8 Jun 2020 13:50:17 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Mon, 08 Jun 2020 19:20:17 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [RFC PATCH] iommu/arm-smmu: Remove shutdown callback
In-Reply-To: <e072f61a-d6cf-2e34-efd5-c1db38c5c622@arm.com>
References: <20200607110918.1733-1-saiprakash.ranjan@codeaurora.org>
 <20200608081846.GA1542@willie-the-truck>
 <08c293eefc20bc2c67f2d2639b93f0a5@codeaurora.org>
 <e072f61a-d6cf-2e34-efd5-c1db38c5c622@arm.com>
Message-ID: <c5a86b3a5a8a6d32e094b6ebde23f869@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Robin,

On 2020-06-08 16:56, Robin Murphy wrote:
> On 2020-06-08 10:13, Sai Prakash Ranjan wrote:
>> Hi Will,
>> 
>> On 2020-06-08 13:48, Will Deacon wrote:
>>> On Sun, Jun 07, 2020 at 04:39:18PM +0530, Sai Prakash Ranjan wrote:
>>>> Remove SMMU shutdown callback since it seems to cause more
>>>> problems than benefits. With this callback, we need to make
>>>> sure that all clients/consumers of SMMU do not perform any
>>>> DMA activity once the SMMU is shutdown and translation is
>>>> disabled. In other words we need to add shutdown callbacks
>>>> for all those clients to make sure they do not perform any
>>>> DMA or else we see all kinds of weird crashes during reboot
>>>> or shutdown. This is clearly not scalable as the number of
>>>> clients of SMMU would vary across SoCs and we would need to
>>>> add shutdown callbacks to almost all drivers eventually.
>>>> This callback was added for kexec usecase where it was known
>>>> to cause memory corruptions when SMMU was not shutdown but
>>>> that does not directly relate to SMMU because the memory
>>>> corruption could be because of the client of SMMU which is
>>>> not shutdown properly before booting into new kernel. So in
>>>> that case, we need to identify the client of SMMU causing
>>>> the memory corruption and add appropriate shutdown callback
>>>> to the client rather than to the SMMU.
>>>> 
>>>> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>>>> ---
>>>>  drivers/iommu/arm-smmu-v3.c | 6 ------
>>>>  drivers/iommu/arm-smmu.c    | 6 ------
>>>>  2 files changed, 12 deletions(-)
>>> 
>>> This feels like a giant bodge to me and I think that any driver which
>>> continues to perform DMA after its ->shutdown() function has been 
>>> invoked
>>> is buggy. Wouldn't that cause problems with kexec(), for example?
>>> 
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
> Yes, indeed we do. Like it or not, kexec is a thing, and about 98% of
> drivers will have been written without considering it.
> 
> If fixing one problem exposes lots of other problems, can you honestly
> say that the best solution is to go back and re-break the original
> thing?
> 

No, definitely not. I was under the wrong impression that *kexec thing*
was more due to the client driver bugs rather than the SMMU.

>>> There's a clear shutdown dependency ordering, where the clients of 
>>> the
>>> SMMU need to shutdown before the SMMU itself, but that's not really
>>> the SMMU driver's problem to solve.
>>> 
>> 
>> The problem with kexec may not be directly related to SMMU as you said
>> above if DMA is performed after the client shutdown callback, then its 
>> a
>> bug in the client driver, so that needs to be fixed in the client 
>> driver,
>> not the SMMU. So is there any point in having the SMMU shutdown 
>> callback?
> 
> The point is that kexec needs to return the system to a state as close
> to reset as possible. The SMMU is at least as relevant as any other
> device in that regard, if not far more so - consider if the first
> kernel *did* leave it enabled with whatever left-over translations in
> place, and kexec'ed into another OS that wasn't SMMU-aware...
> 

Yes understood. I wrongly assumed that the kexec problem was more
of a client driver bugs rather than SMMU. But I see that we indeed
need to shutdown SMMU as any other driver.

>> As you see, with this SMMU shutdown callback, we need to add shutdown
>> callbacks in all the client drivers.
> 
> Yes. And if you really want to argue against that, then at least be
> consistent and propose removing shutdown from *all* the IOMMU drivers.
> And then probably propose removing kexec support from all their
> respective architectures... ;)
> 

Not my intention to break or remove kexec, hence the RFC tag :)
As for the consistent part, out of 18 iommu drivers only 5
have shutdown callbacks, so nothing much to remove there and
kexec is broken there probably. However I got your point and
will drop this patch.

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
