Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCBF931CFB4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Feb 2021 18:56:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230364AbhBPRzv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Feb 2021 12:55:51 -0500
Received: from m42-2.mailgun.net ([69.72.42.2]:21785 "EHLO m42-2.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231349AbhBPRzr (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Feb 2021 12:55:47 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1613498124; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=v2r/A4u/DEGh6E43wIk4/GzPgPxFg96myIuqXz0pkHk=; b=u/xswbmupxbw96yDe41ufKlzKug6/jtxgU6E62YAysNgasbsavmrAO6DeY07Zz04lR9N2JAv
 XGDAsM/WDaV3xRszVfF5/hGIQ+h7Aq3zKCtJbe68350fd4nEU4YxMoXT4jFdT1U2p8rUAHDl
 XnFgilBxSCQyO9qkyzDJOmFQW20=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 602c070506bddda9df324d66 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 16 Feb 2021 17:55:17
 GMT
Sender: jhugo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E12D0C433C6; Tue, 16 Feb 2021 17:55:16 +0000 (UTC)
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E2B5EC433ED;
        Tue, 16 Feb 2021 17:55:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E2B5EC433ED
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [PATCH] bus: mhi: core: Use current ee in intvec handler for
 syserr
To:     bbhatt@codeaurora.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1613176814-29171-1-git-send-email-jhugo@codeaurora.org>
 <20210216073228.GD5082@thinkpad>
 <478ca42796c2a049cdbead6900d1b489@codeaurora.org>
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <b3706688-62e6-b0d7-000b-01f69c4266fd@codeaurora.org>
Date:   Tue, 16 Feb 2021 10:55:15 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <478ca42796c2a049cdbead6900d1b489@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2/16/2021 10:36 AM, Bhaumik Bhatt wrote:
> On 2021-02-15 11:32 PM, Manivannan Sadhasivam wrote:
>> On Fri, Feb 12, 2021 at 05:40:14PM -0700, Jeffrey Hugo wrote:
>>> The intvec handler stores the caches ee in a local variable for use in
>>> processing the intvec.  When determining if a syserr is a fatal error or
>>> not, the intvec handler is using the cached version, when it should be
>>> using the current ee read from the device.  Currently, the device could
>>> be in the PBL ee as the result of a fatal error, but the cached ee might
>>> be AMSS, which would cause the intvec handler to incorrectly signal a
>>> non-fatal syserr.
>>>
>>> Fixes: 3000f85b8f47 ("bus: mhi: core: Add support for basic PM 
>>> operations")
>>> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
>>
>> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>>
>> Thanks,
>> Mani
>>
>>> ---
>>>  drivers/bus/mhi/core/main.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
>>> index 4e0131b..f182736 100644
>>> --- a/drivers/bus/mhi/core/main.c
>>> +++ b/drivers/bus/mhi/core/main.c
>>> @@ -448,7 +448,7 @@ irqreturn_t mhi_intvec_threaded_handler(int 
>>> irq_number, void *priv)
>>>          wake_up_all(&mhi_cntrl->state_event);
>>>
>>>          /* For fatal errors, we let controller decide next step */
>>> -        if (MHI_IN_PBL(ee))
>>> +        if (MHI_IN_PBL(mhi_cntrl->ee))
>>>              mhi_cntrl->status_cb(mhi_cntrl, MHI_CB_FATAL_ERROR);
>>>          else
>>>              mhi_pm_sys_err_handler(mhi_cntrl);
>>> -- 
>>> Qualcomm Technologies, Inc. is a member of the
>>> Code Aurora Forum, a Linux Foundation Collaborative Project.
>>>
> 
> This was being fixed by my patch series for execution environment.
> 
> I should just send the most important of my patches as one line fixers 
> from now on.

Its been an issue for some 9 months now.  I really don't care how it 
gets fixed, but it seems to be past time for it to be fixed.

Sending simple little fixes on their own seems to accelerate the review 
process of those fixes, and doesn't hold them back if some "dependency" 
in a series has comments which need to be fixed.  It is a judgement call 
to determine if a set of fixes should be sent together or not, but I 
personally try to send individual patches when I can.

-- 
Jeffrey Hugo
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
