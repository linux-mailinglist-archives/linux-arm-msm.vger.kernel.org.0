Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13DE81CB5C2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2020 19:23:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726904AbgEHRXp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 May 2020 13:23:45 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:47411 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726767AbgEHRXo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 May 2020 13:23:44 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1588958623; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=/ShlGgt8pBZ07QCqgaBqW3lEITDpUemdyZJbqV+iVnw=; b=M4fDR/T4tk3EnrFE1Fqh+oQiNTnH7ORlgmWHj0iJZcyKSoZ48T7jp/IWU+ohNYcxXIlYfIcz
 dJobgf6zj76v/WMnafbhKCWBlMqmhIou0z6eM3477HVQ1B1J6JHVIXGfUPke0bt31Kmj5RbP
 gvuoYDHaTmJ3PgY2aAd7kBlxe7w=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5eb5958a.7f8bef7dcf48-smtp-out-n05;
 Fri, 08 May 2020 17:23:22 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E48E7C43636; Fri,  8 May 2020 17:23:20 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.79.43.230] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5F3C0C433F2;
        Fri,  8 May 2020 17:23:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5F3C0C433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
Subject: Re: [PATCH v5] iommu/arm-smmu-qcom: Request direct mapping for modem
 device
To:     Stephen Boyd <swboyd@chromium.org>, joro@8bytes.org,
        robin.murphy@arm.com, will@kernel.org
Cc:     bjorn.andersson@linaro.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, dianders@chromium.org,
        evgreen@chromium.org, mka@chromium.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
References: <20200507192157.6831-1-sibis@codeaurora.org>
 <158888607765.26370.18078298627976225073@swboyd.mtv.corp.google.com>
From:   Sibi Sankar <sibis@codeaurora.org>
Message-ID: <f22f0988-a965-d07b-1830-3f5eae42f299@codeaurora.org>
Date:   Fri, 8 May 2020 22:53:06 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <158888607765.26370.18078298627976225073@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hey Stephen,
Thanks for taking time to review the patch.

On 5/8/20 2:44 AM, Stephen Boyd wrote:
> Quoting Sibi Sankar (2020-05-07 12:21:57)
>> The modem remote processor has two modes of access to the DDR, a direct
>> mode and through a SMMU which requires direct mapping. The configuration
>> of the modem SIDs is handled in TrustZone.
> 
> Is it "The configuration of the modem SIDs is typically handled by
> code running in the ARM CPU's secure mode, i.e. secure EL1"? And is that
> even true? I though it was programmed by EL2.
What I meant to say was qcom implementation of TZ or qcom
proprietary bootloaders. I should have been more specific
and mentioned that the configuration is done at EL2 by QHEE
(Qualcomm's Hypervisor Execution Environment) before we enter
the kernel.

> 
>> On platforms where TrustZone
> 
> TrustZone is always there.
> 
>> is absent this needs to be explicitly done from kernel. Add compatibles
>> for modem to opt in for direct mapping on such platforms.
>>
>> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> 
> Is Sai the author? Or does this need a co-developed-by tag?

I decided to include Sai's S-b just to show I took back
ownership of the patch from his patch series. I'll drop
it in the next re-spin.

> 
>> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
>> ---
>>
>> V5
>>   * Reword commit message and drop unnecessary details
> 
> I don't see any improvement! Probably because I don't understand _why_
> the modem needs a direct mapping. The commit text basically says "we
> need to do it because it isn't done in secure world sometimes". This is
> probably wrong what I wrote below, but I'd like to clarify to confirm my
> understanding. Maybe the commit text should say:

Thanks for taking time to reword the commit message will use
the same with a few corrections.

> 
> The modem remote processor has two access paths to DDR. One path is
> directly connected to DDR and another path goes through an SMMU. The
> SMMU path is configured to be a direct mapping because it's used by
> various peripherals in the modem subsystem. 

I'll use ^^ as is.

> Typically this direct
> mapping is configured by programming modem SIDs into the SMMU when EL2
> responds to a hyp call from the code that loads the modem binary in the
> secure world.

Typically this direct mapping is configured statically at EL2
by QHEE (Qualcomm's Hypervisor Execution Environment) before
the kernel is entered.

> 
> In certain firmware configurations, especially when the kernel is
> entered at EL2, we don't want secure mode to make hyp calls to program
> the SMMU because the kernel is in full control of the SMMU. Let's add
> compatibles here so that we can have the kernel program the SIDs for the
> modem in these cases.

In certain firmware configuration, especially when the kernel is already 
in full control of the SMMU, defer programming the modem SIDs to the
kernel. Let's add compatibles here so that we can have the kernel
program the SIDs for the modem in these cases.

Will/Stephen,
Let me know if the above changes are okay? I'll re-spin the patch
based on your feedback.

> 

-- 
Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc, is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
