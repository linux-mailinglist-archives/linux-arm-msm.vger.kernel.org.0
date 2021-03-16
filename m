Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C39533DD85
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Mar 2021 20:29:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236918AbhCPT3M (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Mar 2021 15:29:12 -0400
Received: from m42-2.mailgun.net ([69.72.42.2]:47298 "EHLO m42-2.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240445AbhCPT2z (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Mar 2021 15:28:55 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1615922932; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=it/42LkBB9Nfwqq5ksT70ob4KuhBVB5LnojuZobYYw8=; b=svgqVfZ3TLftQtwOP6MRKtj/dBj58liQrE0T+JHm/YcolTMZwkdXd9rEwm9fS4lPXWABfFk/
 GePE5TQRTRq4pK8G9RMGSzqVUhTobZLblh2v6hCo9Y5pcSsqPA+jz5ugoCJKHlrTt+EYHxk1
 SFUUvsInpuaSohkb/PUOMB1LSAQ=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 605106ec6dc1045b7ded3138 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 16 Mar 2021 19:28:44
 GMT
Sender: jhugo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C1A48C433ED; Tue, 16 Mar 2021 19:28:43 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.226.59.216] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A382CC43461;
        Tue, 16 Mar 2021 19:28:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A382CC43461
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [PATCH v2 RESEND] bus: mhi: core: Wait for ready state after
 reset
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1615408918-7242-1-git-send-email-jhugo@codeaurora.org>
 <20210316061433.GG1798@thinkpad>
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <9a1544fd-aa46-0410-41aa-a18d62e2bc1a@codeaurora.org>
Date:   Tue, 16 Mar 2021 13:28:41 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210316061433.GG1798@thinkpad>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 3/16/2021 12:14 AM, Manivannan Sadhasivam wrote:
> On Wed, Mar 10, 2021 at 01:41:58PM -0700, Jeffrey Hugo wrote:
>> After the device has signaled the end of reset by clearing the reset bit,
>> it will automatically reinit MHI and the internal device structures.  Once
>> That is done, the device will signal it has entered the ready state.
>>
>> Signaling the ready state involves sending an interrupt (MSI) to the host
>> which might cause IOMMU faults if it occurs at the wrong time.
>>
>> If the controller is being powered down, and possibly removed, then the
>> reset flow would only wait for the end of reset.  At which point, the host
>> and device would start a race.  The host may complete its reset work, and
>> remove the interrupt handler, which would cause the interrupt to be
>> disabled in the IOMMU.  If that occurs before the device signals the ready
>> state, then the IOMMU will fault since it blocked an interrupt.  While
>> harmless, the fault would appear like a serious issue has occurred so let's
>> silence it by making sure the device hits the ready state before the host
>> completes its reset processing.
>>
>> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
>> ---
>>   drivers/bus/mhi/core/pm.c | 17 ++++++++++++++++-
>>   1 file changed, 16 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
>> index adb0e80..414da4f 100644
>> --- a/drivers/bus/mhi/core/pm.c
>> +++ b/drivers/bus/mhi/core/pm.c
>> @@ -467,7 +467,7 @@ static void mhi_pm_disable_transition(struct mhi_controller *mhi_cntrl)
>>   
>>   	/* Trigger MHI RESET so that the device will not access host memory */
>>   	if (!MHI_PM_IN_FATAL_STATE(mhi_cntrl->pm_state)) {
>> -		u32 in_reset = -1;
>> +		u32 in_reset = -1, ready = 0;
>>   		unsigned long timeout = msecs_to_jiffies(mhi_cntrl->timeout_ms);
>>   
>>   		dev_dbg(dev, "Triggering MHI Reset in device\n");
>> @@ -490,6 +490,21 @@ static void mhi_pm_disable_transition(struct mhi_controller *mhi_cntrl)
>>   		 * hence re-program it
>>   		 */
>>   		mhi_write_reg(mhi_cntrl, mhi_cntrl->bhi, BHI_INTVEC, 0);
>> +
>> +		if (!MHI_IN_PBL(mhi_get_exec_env(mhi_cntrl))) {
>> +			/* wait for ready to be set */
>> +			ret = wait_event_timeout(mhi_cntrl->state_event,
>> +						 mhi_read_reg_field(mhi_cntrl,
>> +							mhi_cntrl->regs,
>> +							MHISTATUS,
>> +							MHISTATUS_READY_MASK,
>> +							MHISTATUS_READY_SHIFT,
>> +							&ready)
>> +						 || ready, timeout);
>> +			if (!ret || !ready)
>> +				dev_warn(dev,
>> +					"Device failed to enter READY state\n");
> 
> Wouldn't dev_err be more appropriate here provided that we might get IOMMU fault
> anytime soon?

I supposed.  Didn't feel like a "true" error because nothing has 
actually failed, the chance of the IOMMU fault is low, and I couldn't 
enumerate what would be the expected action for the system user to take 
if they saw this as an error.

I don't have a particularly strong opinion one way or the other.  I 
figured warn was the more conservative option here.

Will change.

-- 
Jeffrey Hugo
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
