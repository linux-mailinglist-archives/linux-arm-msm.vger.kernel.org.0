Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67FF43A7D94
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jun 2021 13:51:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230241AbhFOLxM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Jun 2021 07:53:12 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:60920 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230205AbhFOLxL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Jun 2021 07:53:11 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1623757867; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=/ci1rzPoEU+l3HzDBbWn4cIwPVaqw55throQucUw+SI=;
 b=gOUPpS7debx5KdzOtkKKjOWCP7pdkVlb9ZGLSJ2FfVJtPcukaX22daUYwHyxTCcNgBFDbtgt
 kZH8DvbBZmDbG7Ck47f233I4icSdLP7Lk1zbxX+BVtcHtwj+6K8MhNRKtf244G7tOUWTabzC
 bJPmNgbCnKAmld8BWvlRohX5fLU=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 60c8942a8491191eb37b3c85 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 15 Jun 2021 11:51:06
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 67AB3C433F1; Tue, 15 Jun 2021 11:51:06 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4ECE2C433F1;
        Tue, 15 Jun 2021 11:51:05 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 15 Jun 2021 17:21:05 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Krishna Reddy <vdumpa@nvidia.com>,
        Robin Murphy <robin.murphy@arm.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux-foundation.org, Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH] iommu/io-pgtable-arm: Optimize partial walk flush for
 large scatter-gather list
In-Reply-To: <BY5PR12MB376433B3FD0A59EF57C4522DB3319@BY5PR12MB3764.namprd12.prod.outlook.com>
References: <20210609145315.25750-1-saiprakash.ranjan@codeaurora.org>
 <dbcd394a-4d85-316c-5dd0-033546a66132@arm.com>
 <c600e9b2534d54082a5272b508a7985f@codeaurora.org>
 <35bfd245-45e2-8083-b620-330d6dbd7bd7@arm.com>
 <12067ffb8243b220cf03e83aaac3e823@codeaurora.org>
 <266f190e-99ae-9175-cf13-7a77730af389@arm.com>
 <dfdabcdec99a4c6e3bf2b3c5eebe067f@codeaurora.org>
 <61c69d23-324a-85d7-2458-dfff8df9280b@arm.com>
 <BY5PR12MB37646698F37C00381EFF7C77B3349@BY5PR12MB3764.namprd12.prod.outlook.com>
 <07001b4ed6c0a491eacce6e4dc13ab5e@codeaurora.org>
 <BY5PR12MB376480219C42E5FCE0FE0FFBB3349@BY5PR12MB3764.namprd12.prod.outlook.com>
 <f749ba0957b516ab5f0ea57033d308c7@codeaurora.org>
 <BY5PR12MB376433B3FD0A59EF57C4522DB3319@BY5PR12MB3764.namprd12.prod.outlook.com>
Message-ID: <5eb5146ab51a8fe0b558680d479a26cd@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Krishna,

On 2021-06-14 23:18, Krishna Reddy wrote:
>> Right but we won't know until we profile the specific usecases or try 
>> them in
>> generic workload to see if they affect the performance. Sure, over 
>> invalidation is
>> a concern where multiple buffers can be mapped to same context and the 
>> cache
>> is not usable at the time for lookup and such but we don't do it for 
>> small buffers
>> and only for large buffers which means thousands of TLB entry mappings 
>> in
>> which case TLBIASID is preferred (note: I mentioned the HW team
>> recommendation to use it for anything greater than 128 TLB entries) in 
>> my
>> earlier reply. And also note that we do this only for partial walk 
>> flush, we are not
>> arbitrarily changing all the TLBIs to ASID based.
> 
> Most of the heavy bw use cases does involve processing larger buffers.
> When the physical memory is allocated dis-contiguously at page_size
> (let's use 4KB here)
> granularity, each aligned 2MB chunks IOVA unmap would involve
> performing a TLBIASID
> as 2MB is not a leaf. Essentially, It happens all the time during
> large buffer unmaps and
> potentially impact active traffic on other large buffers. Depending on 
> how much
> latency HW engines can absorb, the overflow/underflow issues for ISO
> engines can be
> sporadic and vendor specific.
> Performing TLBIASID as default for all SoCs is not a safe operation.
> 

Ok so from what I gather from this is that its not easy to test for the
negative impact and you don't have data on such yet and the behaviour is
very vendor specific. To add on qcom impl, we have several performance
improvements for TLB cache invalidations in HW like wait-for-safe(for 
realtime
clients such as camera and display) and few others to allow for cache
lookups/updates when TLBI is in progress for the same context bank, so 
atleast
we are good here.

> 
>> I am no camera expert but from what the camera team mentioned is that 
>> there
>> is a thread which frees memory(large unused memory buffers) 
>> periodically which
>> ends up taking around 100+ms and causing some camera test failures 
>> with
>> frame drops. Parallel efforts are already being made to optimize this 
>> usage of
>> thread but as I mentioned previously, this is *not a camera specific*, 
>> lets say
>> someone else invokes such large unmaps, it's going to face the same 
>> issue.
> 
> From the above, It doesn't look like the root cause of frame drops is
> fully understood.
> Why is 100+ms delay causing camera frame drop?  Is the same thread
> submitting the buffers
> to camera after unmap is complete? If not, how is the unmap latency
> causing issue here?
> 

Ok since you are interested in camera usecase, I have requested for more 
details
from the camera team and will give it once they comeback. However I 
don't think
its good to have unmap latency at all and that is being addressed by 
this patch.

> 
>> > If unmap is queued and performed on a back ground thread, would it
>> > resolve the frame drops?
>> 
>> Not sure I understand what you mean by queuing on background thread 
>> but with
>> that or not, we still do the same number of TLBIs and hop through
>> iommu->io-pgtable->arm-smmu to perform the the unmap, so how will that
>> help?
> 
> I mean adding the unmap requests into a queue and processing them from
> a different thread.
> It is not to reduce the TLBIs. But, not to block subsequent buffer
> allocation, IOVA map requests, if they
> are being requested from same thread that is performing unmap. If
> unmap is already performed from
> a different thread, then the issue still need to be root caused to
> understand it fully. Check for any
> serialization issues.
> 

This patch is to optimize unmap latency because of large number of mmio 
writes(TLBIVAs)
wasting CPU cycles and not to fix camera issue which can probably be 
solved by
parallelization. It seems to me like you are ok with the unmap latency 
in general
which we are not and want to avoid that latency.

Hi @Robin, from these discussions it seems they are not ok with the 
change
for all SoC vendor implementations and do not have any data on such 
impact.
As I mentioned above, on QCOM platforms we do have several optimizations 
in HW
for TLBIs and would like to make use of it and reduce the unmap latency.
What do you think, should this be made implementation specific?

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
