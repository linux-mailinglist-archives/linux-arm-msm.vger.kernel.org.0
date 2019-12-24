Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB5AF129EFA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2019 09:30:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726076AbfLXIaQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Dec 2019 03:30:16 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:20498 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726102AbfLXIaP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Dec 2019 03:30:15 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1577176215; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=ZRku7WBdBHXtA+hx/XFQP6Kg96ShJ6vt8/K+Drr0o4M=; b=vJQiuStNDyQzvaU5Y8uGxVrgHgmTlCB+bJAe+puP08MnY4Qq30HBCcmvNvtzr5buUxwj6R4L
 mw3c6M+9wMIMaUQE6eW7Jt1jTIbShEfeTtt5Y9Nr15sLyt9Ha68aYC2eP4UzwQtaxK75SYsQ
 8ZNPwEykebnSPx2NkZwEPuRsTdM=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e01cc93.7fc3cdf25928-smtp-out-n03;
 Tue, 24 Dec 2019 08:30:11 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5D66FC433CB; Tue, 24 Dec 2019 08:30:11 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.204.79.159] (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sramana)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 65DB0C43383;
        Tue, 24 Dec 2019 08:30:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 65DB0C43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sramana@codeaurora.org
Subject: Re: [PATCH] arm64: Set SSBS for user threads while creation
To:     Anshuman Khandual <anshuman.khandual@arm.com>, will@kernel.org,
        catalin.marinas@arm.com, maz@kernel.org, will.deacon@arm.com
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <1577106146-8999-1-git-send-email-sramana@codeaurora.org>
 <d490d6ce-8b07-ce79-4580-ac80f239312a@arm.com>
From:   Srinivas Ramana <sramana@codeaurora.org>
Message-ID: <3a50c921-b37b-ea3d-1b9e-87113d3d3fd3@codeaurora.org>
Date:   Tue, 24 Dec 2019 14:00:05 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <d490d6ce-8b07-ce79-4580-ac80f239312a@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/24/2019 12:36 PM, Anshuman Khandual wrote:
> 
> 
> On 12/23/2019 06:32 PM, Srinivas Ramana wrote:
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
> 
> So this fixes the situation (i.e low performance) from the creation time
> of a task with fork() which will never see a subsequent execve, till it
> gets context switched for the very first time ?
> 
Yes, that is correct.

>>
>> Fixes: 8f04e8e6e29c ("arm64: ssbd: Add support for PSTATE.SSBS rather than trapping to EL3")
>> Signed-off-by: Srinivas Ramana <sramana@codeaurora.org>
>> ---
>>   arch/arm64/kernel/process.c | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
>> index 71f788cd2b18..a8f05cc39261 100644
>> --- a/arch/arm64/kernel/process.c
>> +++ b/arch/arm64/kernel/process.c
>> @@ -399,6 +399,13 @@ int copy_thread(unsigned long clone_flags, unsigned long stack_start,
>>   		 */
>>   		if (clone_flags & CLONE_SETTLS)
>>   			p->thread.uw.tp_value = childregs->regs[3];
>> +
>> +		if (arm64_get_ssbd_state() != ARM64_SSBD_FORCE_ENABLE) {
>> +			if (is_compat_thread(task_thread_info(p)))
>> +				set_compat_ssbs_bit(childregs);
>> +			else
>> +				set_ssbs_bit(childregs);
>> +		}
>>   	} else {
>>   		memset(childregs, 0, sizeof(struct pt_regs));
>>   		childregs->pstate = PSR_MODE_EL1h;
>>

Thanks,
-- Srinivas R

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation
Center, Inc., is a member of Code Aurora Forum, a Linux Foundation
Collaborative Project
