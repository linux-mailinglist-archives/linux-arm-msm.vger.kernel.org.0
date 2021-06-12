Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 161E03A4C47
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Jun 2021 04:46:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229985AbhFLCso (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Jun 2021 22:48:44 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:62818 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229584AbhFLCso (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Jun 2021 22:48:44 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1623466005; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=j7qyuZEIWve0Yp35tsM69fI9OIKOGtzrOcSGMsRKDag=;
 b=GJWtBmyoz15aoGapRcWx/qdY/+QQ7X9npCbONS5Kc4Q0tH5kXgmLur5khh2NJD3jdnSvWEAk
 qdm8hZGiRflGBDDvBB/f9w2oYXG/wnOhWnIaS4FcVqS33xlBbbaQtB1q88nT9QzS338NzXmo
 3zJm/PJa+29b5ycXin8mwqw69aQ=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 60c42008e27c0cc77f36b888 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 12 Jun 2021 02:46:32
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A5F7BC4323A; Sat, 12 Jun 2021 02:46:31 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C9627C433F1;
        Sat, 12 Jun 2021 02:46:30 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Sat, 12 Jun 2021 08:16:30 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Krishna Reddy <vdumpa@nvidia.com>,
        Robin Murphy <robin.murphy@arm.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux-foundation.org, Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH] iommu/io-pgtable-arm: Optimize partial walk flush for
 large scatter-gather list
In-Reply-To: <BY5PR12MB376480219C42E5FCE0FE0FFBB3349@BY5PR12MB3764.namprd12.prod.outlook.com>
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
Message-ID: <f749ba0957b516ab5f0ea57033d308c7@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Krishna,

On 2021-06-11 22:19, Krishna Reddy wrote:
> Hi Sai,
>> >> > No, the unmap latency is not just in some test case written, the
>> >> > issue is very real and we have workloads where camera is reporting
>> >> > frame drops because of this unmap latency in the order of 100s of
>> milliseconds.
> 
>> Not exactly, this issue is not specific to camera. If you look at the 
>> numbers in the
>> commit text, even for the test device its the same observation. It 
>> depends on
>> the buffer size we are unmapping which affects the number of TLBIs 
>> issue. I am
>> not aware of any such HW side bw issues for camera specifically on 
>> QCOM
>> devices.
> 
> It is clear that reducing number of TLBIs  reduces the umap API
> latency. But, It is
> at the expense of throwing away valid tlb entries.
> Quantifying the impact of arbitrary invalidation of valid tlb entries
> at context level is not straight forward and
> use case dependent. The side-effects might be rare or won't be known
> until they are noticed.

Right but we won't know until we profile the specific usecases or try 
them
in generic workload to see if they affect the performance. Sure, over
invalidation is a concern where multiple buffers can be mapped to same 
context
and the cache is not usable at the time for lookup and such but we don't 
do it
for small buffers and only for large buffers which means thousands of 
TLB entry
mappings in which case TLBIASID is preferred (note: I mentioned the HW 
team
recommendation to use it for anything greater than 128 TLB entries) in 
my earlier
reply. And also note that we do this only for partial walk flush, we are 
not
arbitrarily changing all the TLBIs to ASID based.

> Can you provide more details on How the unmap latency is causing
> camera to drop frames?
> Is unmap performed in the perf path?

I am no camera expert but from what the camera team mentioned is that
there is a thread which frees memory(large unused memory buffers)
periodically which ends up taking around 100+ms and causing some camera 
test
failures with frame drops. Parallel efforts are already being made to 
optimize
this usage of thread but as I mentioned previously, this is *not a 
camera
specific*, lets say someone else invokes such large unmaps, it's going 
to face
the same issue.

> If unmap is queued and performed on a back ground thread, would it
> resolve the frame drops?

Not sure I understand what you mean by queuing on background thread but 
with
that or not, we still do the same number of TLBIs and hop through
iommu->io-pgtable->arm-smmu to perform the the unmap, so how will that 
help?

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
