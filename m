Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CCEC3AE2DA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jun 2021 07:47:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229597AbhFUFtx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Jun 2021 01:49:53 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:10555 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229479AbhFUFtw (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Jun 2021 01:49:52 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1624254458; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=dd/c0WzWEfKMbrpV11k4uuAZn72RvTRCSkxT5YGla6U=;
 b=h/tCvTqElJdF9kMly4CB1B1ce5AMjVXVub6EeDvjQJkiHh/iYTRegbjPW22AIkgoMFDSADXH
 Twx05c8YXWLo8A7/RlgEUC6cH3dPDmsBRLpw2n3JIHpe4sQBRPk5/Uua6Oq78AagYDHHfjpY
 Rhcn++optMqlIM9WKglKvgs5Gbk=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 60d027fa8491191eb3ea9f4e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 21 Jun 2021 05:47:38
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B895FC43143; Mon, 21 Jun 2021 05:47:37 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 84534C433F1;
        Mon, 21 Jun 2021 05:47:36 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 21 Jun 2021 11:17:36 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Doug Anderson <dianders@chromium.org>
Cc:     Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>,
        Joerg Roedel <joro@8bytes.org>,
        "list@263.net:IOMMU DRIVERS , Joerg Roedel <joro@8bytes.org>," 
        <iommu@lists.linux-foundation.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Thierry Reding <treding@nvidia.com>,
        Tomasz Figa <tfiga@chromium.org>
Subject: Re: [PATCHv2 2/3] iommu/io-pgtable: Optimize partial walk flush for
 large scatter-gather list
In-Reply-To: <CAD=FV=WA_mBnxv-D3YOYUkDAAcYgktFgnw2zeTkMneqFxBg=yg@mail.gmail.com>
References: <cover.1623981933.git.saiprakash.ranjan@codeaurora.org>
 <150fc7ab1c7f9b70a95dae1f4bc3b9018c0f9e04.1623981933.git.saiprakash.ranjan@codeaurora.org>
 <CAD=FV=WA_mBnxv-D3YOYUkDAAcYgktFgnw2zeTkMneqFxBg=yg@mail.gmail.com>
Message-ID: <716fbc51ec73434e325d84752a471e89@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 2021-06-19 03:39, Doug Anderson wrote:
> Hi,
> 
> On Thu, Jun 17, 2021 at 7:51 PM Sai Prakash Ranjan
> <saiprakash.ranjan@codeaurora.org> wrote:
>> 
>> Currently for iommu_unmap() of large scatter-gather list with page 
>> size
>> elements, the majority of time is spent in flushing of partial walks 
>> in
>> __arm_lpae_unmap() which is a VA based TLB invalidation invalidating
>> page-by-page on iommus like arm-smmu-v2 (TLBIVA) which do not support
>> range based invalidations like on arm-smmu-v3.2.
>> 
>> For example: to unmap a 32MB scatter-gather list with page size 
>> elements
>> (8192 entries), there are 16->2MB buffer unmaps based on the pgsize 
>> (2MB
>> for 4K granule) and each of 2MB will further result in 512 TLBIVAs 
>> (2MB/4K)
>> resulting in a total of 8192 TLBIVAs (512*16) for 16->2MB causing a 
>> huge
>> overhead.
>> 
>> So instead use tlb_flush_all() callback (TLBIALL/TLBIASID) to 
>> invalidate
>> the entire context for partial walk flush on select few platforms 
>> where
>> cost of over-invalidation is less than unmap latency
> 
> It would probably be worth punching this description up a little bit.
> Elsewhere you said in more detail why this over-invalidation is less
> of a big deal for the Qualcomm SMMU. It's probably worth saying
> something like that here, too. Like this bit paraphrased from your
> other email:
> 
> On qcom impl, we have several performance improvements for TLB cache
> invalidations in HW like wait-for-safe (for realtime clients such as
> camera and display) and few others to allow for cache lookups/updates
> when TLBI is in progress for the same context bank.
> 

Sure will add this info as well in the next version.

> 
>> using the newly
>> introduced quirk IO_PGTABLE_QUIRK_TLB_INV_ALL. We also do this for
>> non-strict mode given its all about over-invalidation saving time on
>> individual unmaps and non-deterministic generally.
> 
> As per usual I'm mostly clueless, but I don't quite understand why you
> want this new behavior for non-strict mode. To me it almost seems like
> the opposite? Specifically, non-strict mode is already outside the
> critical path today and so there's no need to optimize it. I'm
> probably not explaining myself clearly, but I guess i'm thinking:
> 
> a) today for strict, unmap is in the critical path and it's important
> to get it out of there. Getting it out of the critical path is so
> important that we're willing to over-invalidate to speed up the
> critical path.
> 
> b) today for non-strict, unmap is not in the critical path.
> 
> So I would almost expect your patch to _disable_ your new feature for
> non-strict mappings, not auto-enable your new feature for non-strict
> mappings.
> 
> If I'm babbling, feel free to ignore. ;-) Looking back, I guess Robin
> was the one that suggested the behavior you're implementing, so it's
> more likely he's right than I am. ;-)
> 

Thanks for taking a look. Non-strict mode is only for leaf entries and
dma domains and this optimization is for non-leaf entries and is 
applicable
for both, see __arm_lpae_unmap(). In other words, if you have 
iommu.strict=0
(non-strict mode) and try unmapping a large sg buffer as the problem 
described
in the commit text, you would still go via this path in unmap and see 
the
delay without this patch. So what Robin suggested is that, let's do this
unconditionally for all users with non-strict mode as opposed to only
restricting it to implementation specific in case of strict mode.

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
