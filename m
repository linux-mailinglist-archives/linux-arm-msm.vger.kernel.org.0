Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3DCB3AC1C2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jun 2021 06:05:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229877AbhFREHj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Jun 2021 00:07:39 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:19731 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229466AbhFREHj (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Jun 2021 00:07:39 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1623989130; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=k4HKuaL//VdF5gQIL9VhYemVHmDBvisX1u+MgvW5TN4=; b=OaiAm464chI6fiUWd+BoMSTtK/ENZsTEPsl3nNvv0p+T3We7SZUK3ViTv12e5yen5gSmr5w+
 iWUtHMg4LuBl+pxq0KuAvwxgs5KQs4SAAqw6QAla4iQgRyvrCFFyGgOK3uvrVanAJFq6DMVR
 uX/BZ6dq3d29QY56dOCfkMgnxcE=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 60cc1b6fb6ccaab753fad1d6 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 18 Jun 2021 04:05:03
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9B415C43217; Fri, 18 Jun 2021 04:05:03 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-253.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D7F05C433D3;
        Fri, 18 Jun 2021 04:04:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D7F05C433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     saiprakash.ranjan@codeaurora.org, vdumpa@nvidia.com
Cc:     iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        robin.murphy@arm.com, treding@nvidia.com, will@kernel.org
Subject: Re: [PATCH] iommu/io-pgtable-arm: Optimize partial walk flush for large scatter-gather list
Date:   Fri, 18 Jun 2021 09:34:44 +0530
Message-Id: <20210618040444.17270-1-saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <5eb5146ab51a8fe0b558680d479a26cd@codeaurora.org>
References: <5eb5146ab51a8fe0b558680d479a26cd@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-06-15 17:21, Sai Prakash Ranjan wrote:
> Hi Krishna,
> 
> On 2021-06-14 23:18, Krishna Reddy wrote:
>>> Right but we won't know until we profile the specific usecases or try them in
>>> generic workload to see if they affect the performance. Sure, over invalidation is
>>> a concern where multiple buffers can be mapped to same context and the cache
>>> is not usable at the time for lookup and such but we don't do it for small buffers
>>> and only for large buffers which means thousands of TLB entry mappings in
>>> which case TLBIASID is preferred (note: I mentioned the HW team
>>> recommendation to use it for anything greater than 128 TLB entries) in my
>>> earlier reply. And also note that we do this only for partial walk flush, we are not
>>> arbitrarily changing all the TLBIs to ASID based.
>>
>> Most of the heavy bw use cases does involve processing larger buffers.
>> When the physical memory is allocated dis-contiguously at page_size
>> (let's use 4KB here)
>> granularity, each aligned 2MB chunks IOVA unmap would involve
>> performing a TLBIASID
>> as 2MB is not a leaf. Essentially, It happens all the time during
>> large buffer unmaps and
>> potentially impact active traffic on other large buffers. Depending on how much
>> latency HW engines can absorb, the overflow/underflow issues for ISO
>> engines can be
>> sporadic and vendor specific.
>> Performing TLBIASID as default for all SoCs is not a safe operation.
>>
> 
> Ok so from what I gather from this is that its not easy to test for the
> negative impact and you don't have data on such yet and the behaviour is
> very vendor specific. To add on qcom impl, we have several performance
> improvements for TLB cache invalidations in HW like wait-for-safe(for realtime
> clients such as camera and display) and few others to allow for cache
> lookups/updates when TLBI is in progress for the same context bank, so atleast
> we are good here.
> 
>>
>>> I am no camera expert but from what the camera team mentioned is that there
>>> is a thread which frees memory(large unused memory buffers) periodically which
>>> ends up taking around 100+ms and causing some camera test failures with
>>> frame drops. Parallel efforts are already being made to optimize this usage of
>>> thread but as I mentioned previously, this is *not a camera specific*, lets say
>>> someone else invokes such large unmaps, it's going to face the same issue.
>>
>> From the above, It doesn't look like the root cause of frame drops is
>> fully understood.
>> Why is 100+ms delay causing camera frame drop?  Is the same thread
>> submitting the buffers
>> to camera after unmap is complete? If not, how is the unmap latency
>> causing issue here?
>>
> 
> Ok since you are interested in camera usecase, I have requested for more details
> from the camera team and will give it once they comeback. However I don't think
> its good to have unmap latency at all and that is being addressed by this patch.
> 

As promised, here are some more details shared by camera team:

Mapping of a framework buffer happens at the time of process request and unmapping
of a framework buffer happens once the buffer is available from hardware and result
will be notified to camera framework.
 * When there is a delay in unmapping of a buffer, result notification to framework
   will be delayed and based on pipeline delay depth, new requests from framework
   will be delayed.
 * Camera stack uses internal buffer managers for internal and framework buffers.
   While mapping and unmapping these managers will be accessed, so uses common lock
   and hence is a blocking call. So unmapping delay will cause the delay for mapping
   of a new request and leads to framedrop.

Map and unmap happens in the camera service process context. There is no separate perf
path to perform unmapping.

In Camera stack along with map/unmap delay, additional delays are due to HW. So HW should
be able to get the requests in time from SW to avoid frame drops.

Thanks,
Sai
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
