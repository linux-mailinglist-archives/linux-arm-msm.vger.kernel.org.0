Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACE363191B8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Feb 2021 18:59:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230452AbhBKR7C (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Feb 2021 12:59:02 -0500
Received: from so15.mailgun.net ([198.61.254.15]:34654 "EHLO so15.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231499AbhBKR4h (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Feb 2021 12:56:37 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1613066161; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=/SXN84APFbIiVpRHneySmieV66r2cg+BeMSnAfogVHI=; b=tQGlsZkXb3X8QEPBIib4cYaa0Vd7Q34SD/LAbxRQUuNqDQpz59OtKr4tEVqQ4Ze6ePmdZu5/
 4hP+Qk9SF+8kN54MMVq3pxmNvGw3uYk6xpZYDATTwW/nKwr7sS5cA3xYrn7yA4yxTQJq5y5F
 TJQx9akXi01FPsthfmk9sGiBemQ=
X-Mailgun-Sending-Ip: 198.61.254.15
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 60256f984bd23a05aeda17dd (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 11 Feb 2021 17:55:36
 GMT
Sender: jhugo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E890FC43465; Thu, 11 Feb 2021 17:55:35 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.226.59.216] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D4E61C433ED;
        Thu, 11 Feb 2021 17:55:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D4E61C433ED
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [PATCH] mhi: pci_generic: Ensure device readiness before starting
 MHI
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Hemant Kumar <hemantk@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
References: <1613063283-12029-1-git-send-email-loic.poulain@linaro.org>
 <fa8c8c21-4c07-cdcc-0ce7-76945905f0d0@codeaurora.org>
 <CAMZdPi8rguNCgQ1rahmtBsen40nOA=d+w9smhK4uN+jeDW01SQ@mail.gmail.com>
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <6cf90335-ad7f-9e72-651e-dd3beb709d1f@codeaurora.org>
Date:   Thu, 11 Feb 2021 10:55:34 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAMZdPi8rguNCgQ1rahmtBsen40nOA=d+w9smhK4uN+jeDW01SQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2/11/2021 10:47 AM, Loic Poulain wrote:
> On Thu, 11 Feb 2021 at 18:13, Jeffrey Hugo <jhugo@codeaurora.org> wrote:
>>
>> On 2/11/2021 10:08 AM, Loic Poulain wrote:
>>> The PCI device may have not been bound from cold boot and be in
>>> undefined state, or simply not yet ready for MHI operations. This
>>> change ensures that the MHI layer is reset to initial state and
>>> ready for MHI initialization and power up.
>>>
>>> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
>>> ---
>>>    drivers/bus/mhi/pci_generic.c | 23 +++++++++++++++++++++++
>>>    1 file changed, 23 insertions(+)
>>>
>>> diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
>>> index c20f59e..bfa0a1e 100644
>>> --- a/drivers/bus/mhi/pci_generic.c
>>> +++ b/drivers/bus/mhi/pci_generic.c
>>> @@ -17,6 +17,8 @@
>>>    #include <linux/timer.h>
>>>    #include <linux/workqueue.h>
>>>
>>> +#include "core/internal.h"
>>> +
>>>    #define MHI_PCI_DEFAULT_BAR_NUM 0
>>>
>>>    #define MHI_POST_RESET_DELAY_MS 500
>>> @@ -391,6 +393,22 @@ static void health_check(struct timer_list *t)
>>>        mod_timer(&mhi_pdev->health_check_timer, jiffies + HEALTH_CHECK_PERIOD);
>>>    }
>>>
>>> +static void __mhi_sw_reset(struct mhi_controller *mhi_cntrl)
>>> +{
>>> +     unsigned int max_wait_ready = 200;
>>> +
>>> +     mhi_pci_write_reg(mhi_cntrl, mhi_cntrl->regs + MHICTRL,
>>> +                       MHICTRL_RESET_MASK);
>>> +
>>> +     while (mhi_get_mhi_state(mhi_cntrl) != MHI_STATE_READY) {
>>> +             if (!max_wait_ready--) {
>>> +                     dev_warn(mhi_cntrl->cntrl_dev, "Not ready\n");
>>> +                     break;
>>> +             }
>>> +             msleep(50);
>>> +     }
>>> +}
>>> +
>>>    static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>>>    {
>>>        const struct mhi_pci_dev_info *info = (struct mhi_pci_dev_info *) id->driver_data;
>>> @@ -451,6 +469,9 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>>>                goto err_unregister;
>>>        }
>>>
>>> +     /* Before starting MHI, ensure device is in good initial state */
>>> +     __mhi_sw_reset(mhi_cntrl);
>>> +
>>>        err = mhi_sync_power_up(mhi_cntrl);
>>>        if (err) {
>>>                dev_err(&pdev->dev, "failed to power up MHI controller\n");
>>> @@ -532,6 +553,8 @@ static void mhi_pci_reset_done(struct pci_dev *pdev)
>>>                return;
>>>        }
>>>
>>> +     __mhi_sw_reset(mhi_cntrl);
>>> +
>>>        err = mhi_sync_power_up(mhi_cntrl);
>>>        if (err) {
>>>                dev_err(&pdev->dev, "failed to power up MHI controller\n");
>>>
>>
>> So, I'm curious, how does this actually work?
>>
>>   From what I can see, you define SBL images.  If those get loaded by the
>> PBL, it doesn't happen over MHI.  PBL will not move MHI to ready state,
>> except in the specific instance of a fatal error.
> 
> I defined generic SBL images for flashless controller versions, but
> mine is not, and so it boots directly in mission mode.
> 
>>
>> Your above change works if the device comes up straight in mission mode
>> (AMSS), but if it comes up in PBL, you are going to hit the timeout and
>> dev_warn() every time.
> 
> Ok, I thought we should get into MHI ready state, whatever the
> 'execution environment'... So I definitely need to take that into
> consideration. thanks.

I could see where you could think that, which is why I commented.  I 
didn't want you to run into issues later, assuming those issues are 
valid to you.

MHI only gets into the ready state via EEs which drive MHI.  PBL 
famously does not drive MHI because PBL is encoded into hardware and 
extremely difficult to fix, so it is generally designed with the mantra 
of "simpler is more reliable".

Hopefully I didn't throw a wrench in things for you.  Just trying to 
save you some pain later.

-- 
Jeffrey Hugo
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
