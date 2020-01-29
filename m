Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3FDB14C9E6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2020 12:49:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726271AbgA2LtI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Jan 2020 06:49:08 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:36550 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726067AbgA2LtH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Jan 2020 06:49:07 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1580298547; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=7ZWaYAxSy8lntsFBFvZAXk81ogRHgObujRrr9xFKq2Y=; b=liVCWbvmRyTwj+zwnwxWtNY0yl5/YifaHdvrgNuvHMFsUG9corVLboCM+gJpFVTYODvAoQnx
 B514r6iotRJAGmOe7hBjGmyEBG3UQ9jDQaIL3O0E3nRhoEcCTx2oaG/75NGl20XYJBByFqTR
 VTkBbyx0+r9zZ4Xv6EHjEu+bc4U=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e31712a.7f4c2c332c38-smtp-out-n01;
 Wed, 29 Jan 2020 11:48:58 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id AC7E8C4479F; Wed, 29 Jan 2020 11:48:58 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.204.79.159] (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sramana)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 40D9EC43383;
        Wed, 29 Jan 2020 11:48:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 40D9EC43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sramana@codeaurora.org
Subject: Re: [PATCH] arm64: Set SSBS for user threads while creation
To:     Catalin Marinas <catalin.marinas@arm.com>
Cc:     will@kernel.org, maz@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <1577106146-8999-1-git-send-email-sramana@codeaurora.org>
 <20200102180145.GE27940@arrakis.emea.arm.com>
From:   Srinivas Ramana <sramana@codeaurora.org>
Message-ID: <0c5cd234-5cfb-d093-06e4-a0edb5c68bf8@codeaurora.org>
Date:   Wed, 29 Jan 2020 17:18:53 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20200102180145.GE27940@arrakis.emea.arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 1/2/2020 11:31 PM, Catalin Marinas wrote:
> On Mon, Dec 23, 2019 at 06:32:26PM +0530, Srinivas Ramana wrote:
>> Current SSBS implementation takes care of setting the
>> SSBS bit in start_thread() for user threads. While this works
>> for tasks launched with fork/clone followed by execve, for cases
>> where userspace would just call fork (eg, Java applications) this
>> leaves the SSBS bit unset. This results in performance
>> regression for such tasks.
>>
>> It is understood that commit cbdf8a189a66 ("arm64: Force SSBS
>> on context switch") masks this issue, but that was done for a
>> different reason where heterogeneous CPUs(both SSBS supported
>> and unsupported) are present. It is appropriate to take care
>> of the SSBS bit for all threads while creation itself.
>>
>> Fixes: 8f04e8e6e29c ("arm64: ssbd: Add support for PSTATE.SSBS rather than trapping to EL3")
>> Signed-off-by: Srinivas Ramana <sramana@codeaurora.org>
> 
> I suppose the parent process cleared SSBS explicitly. Isn't the child

Actually we observe that parent(in case of android, zygote that launches 
the app) does have SSBS bit set. However child doesn't have the bit set.

> after fork() supposed to be nearly identical to the parent? If we did as
> you suggest, someone else might complain that SSBS has been set in the
> child after fork().

I am also wondering why would a userspace process clear SSBS bit loosing 
the performance benefit.
> 
> I think the fix is for user space to set SSBS in the child if it no
> longer needs it.
> 

Sorry for the late response on this.

Thanks,
-- Srinivas R


-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation
Center, Inc., is a member of Code Aurora Forum, a Linux Foundation
Collaborative Project
