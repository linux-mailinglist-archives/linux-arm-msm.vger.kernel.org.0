Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3A5E3A390A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jun 2021 02:54:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231140AbhFKA42 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Jun 2021 20:56:28 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:32015 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231192AbhFKA42 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Jun 2021 20:56:28 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1623372871; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=dcfJebiUK44kAjvGVha7ugPfEUhpoyAPBqW17zs14Co=;
 b=RUzeZI8uduZGWl1MeLgveqgSa6V/r9h48oGULm+6WUiKkYQK0WZIi01Db4zqa5Z8yMl2+cgK
 4OR8TQ6wOlpt5YpTVSmP47IlxaERPqRXpMGUPusyyK+475O/l2PyktbnZorsZGX0UZdNzCBh
 5fIaoc5L4bWgJ0kR//cBxkTHv5U=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 60c2b42fabfd22a3dca34415 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 11 Jun 2021 00:54:07
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 142B1C4360C; Fri, 11 Jun 2021 00:54:07 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5D9D1C4338A;
        Fri, 11 Jun 2021 00:54:06 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 11 Jun 2021 06:24:06 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Krishna Reddy <vdumpa@nvidia.com>
Cc:     Robin Murphy <robin.murphy@arm.com>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH] iommu/io-pgtable-arm: Optimize partial walk flush for
 large scatter-gather list
In-Reply-To: <BY5PR12MB37646698F37C00381EFF7C77B3349@BY5PR12MB3764.namprd12.prod.outlook.com>
References: <20210609145315.25750-1-saiprakash.ranjan@codeaurora.org>
 <dbcd394a-4d85-316c-5dd0-033546a66132@arm.com>
 <c600e9b2534d54082a5272b508a7985f@codeaurora.org>
 <35bfd245-45e2-8083-b620-330d6dbd7bd7@arm.com>
 <12067ffb8243b220cf03e83aaac3e823@codeaurora.org>
 <266f190e-99ae-9175-cf13-7a77730af389@arm.com>
 <dfdabcdec99a4c6e3bf2b3c5eebe067f@codeaurora.org>
 <61c69d23-324a-85d7-2458-dfff8df9280b@arm.com>
 <BY5PR12MB37646698F37C00381EFF7C77B3349@BY5PR12MB3764.namprd12.prod.outlook.com>
Message-ID: <07001b4ed6c0a491eacce6e4dc13ab5e@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Krishna,

On 2021-06-11 06:07, Krishna Reddy wrote:
>> > No, the unmap latency is not just in some test case written, the issue
>> > is very real and we have workloads where camera is reporting frame
>> > drops because of this unmap latency in the order of 100s of milliseconds.
>> > And hardware team recommends using ASID based invalidations for
>> > anything larger than 128 TLB entries. So yes, we have taken note of
>> > impacts here before going this way and hence feel more inclined to
>> > make this qcom specific if required.
> 
> Seems like the real issue here is not the unmap API latency.
> It should be the high number of back to back SMMU TLB invalidate
> register writes that is resulting
> in lower ISO BW to Camera and overflow. Isn't it?
> Even Tegra186 SoC has similar issue and HW team recommended to rate
> limit the number of
> back to back SMMU tlb invalidate registers writes. The subsequent
> Tegra194 SoC has a dedicated SMMU for
> ISO clients to avoid the impact of TLB invalidates from NISO clients on 
> ISO BW.
> 

Not exactly, this issue is not specific to camera. If you look at
the numbers in the commit text, even for the test device its the
same observation. It depends on the buffer size we are unmapping
which affects the number of TLBIs issue. I am not aware of any
such HW side bw issues for camera specifically on QCOM devices.

Thanks,
Sai

>>> Thinking some more, I
>>> wonder if the Tegra folks might have an opinion to add here, given
>>> that their multiple-SMMU solution was seemingly about trying to get
>>> enough TLB and pagetable walk bandwidth in the first place?
> 
> While it is good to reduce the number of tlb register writes, Flushing
> all TLB entries at context granularity arbitrarily
> can have negative impact on active traffic and BW. I don't have much
> data on possible impact at this point.
> Can the flushing at context granularity be made a quirk than
> performing it as default?
> 
> -KR

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
