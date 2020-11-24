Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BC912C2EC9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Nov 2020 18:38:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403873AbgKXRiA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Nov 2020 12:38:00 -0500
Received: from m42-4.mailgun.net ([69.72.42.4]:50725 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2403870AbgKXRiA (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Nov 2020 12:38:00 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1606239480; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=t7Lwuzy/Zx47k9drkP15FjSeAGYPsLyxKuQg5RQcorc=; b=FZxE8xHlOnBkMBPwaM9kxz/EQCrO3KiYoZVvi/XwIBQrKFczOrhm5sjArDzbxaN4xVrL8UNo
 2EjKWr3XNaNhJC27y5ebNWCkND9AkEzru3m2Q8UNbJsdFoVIHTqI/f7vQzlhqiUFnIwf4rAO
 0eWRlZ4AuZpz/q4cyMkDnv9xxHY=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 5fbd44f11dba509aae5a0090 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 24 Nov 2020 17:37:53
 GMT
Sender: jhugo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D6493C43463; Tue, 24 Nov 2020 17:37:53 +0000 (UTC)
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2915EC433C6;
        Tue, 24 Nov 2020 17:37:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2915EC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [PATCH v2] bus: mhi: core: Fix device hierarchy issue
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Hemant Kumar <hemantk@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Bhaumik Bhatt <bbhatt@codeaurora.org>
References: <1606234711-20125-1-git-send-email-loic.poulain@linaro.org>
 <b66d5f09-7560-3b82-84a3-b7cf40c9532e@codeaurora.org>
 <CAMZdPi_n0h_S3f7R6H0kZO7PhpKiDLm0k6Cfxusg2+qfv1BerQ@mail.gmail.com>
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <a57f713e-db3e-c974-46b6-6e86f4882e46@codeaurora.org>
Date:   Tue, 24 Nov 2020 10:37:51 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAMZdPi_n0h_S3f7R6H0kZO7PhpKiDLm0k6Cfxusg2+qfv1BerQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/24/2020 9:57 AM, Loic Poulain wrote:
> On Tue, 24 Nov 2020 at 17:36, Jeffrey Hugo <jhugo@codeaurora.org> wrote:
>>
>> On 11/24/2020 9:18 AM, Loic Poulain wrote:
>>> A MHI client device should be child of the MHI controller device.
>>> Today both MHI controller and its MHI clients are direct children
>>> of the same bus device. This patch fixes the hierarchy.
>>
>> Why?
>>
>> I'm not particularly arguing for or against this change (I think it
>> affects me slightly, but not in a breaking way), but this commit text
>> seems pretty generic.  It doesn't really help me understand the
>> relevance of this change.  It seems to be only describing what you are
>> doing, but not the why.  How did you find this?  How does this affect
>> the client drivers?  Does it make something the client drivers care
>> about better?
>>
>> To put this another way, "should" is an opinion, and you've provided no
>> facts to assert why your opinion is superior to others.
> 
> That's right I've not elaborate too much, but it's mainly to respect
> the hierarchy of devices, as it is done for other busses. The
> hierarchy is especially important for things like power management
> ordering (PM core must suspend devices before their controller, wakeup
> the controller before its devices...). Moreover it will also be useful
> for userspace (thanks to sysfs) to determine which devices are behind
> which controllers (and so determine if e.g. QMI and IP channels are
> part of the same device).

This sounds like two relevant usecases which should be mentioned in the 
commit text.

> 
> Regards,
> Loic
> 
> 
> 
>>
>>>
>>> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
>>> ---
>>>    v2: fix commit message
>>>
>>>    drivers/bus/mhi/core/init.c | 10 +++++++++-
>>>    1 file changed, 9 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
>>> index 436221c..c7a7354 100644
>>> --- a/drivers/bus/mhi/core/init.c
>>> +++ b/drivers/bus/mhi/core/init.c
>>> @@ -1137,7 +1137,15 @@ struct mhi_device *mhi_alloc_device(struct mhi_controller *mhi_cntrl)
>>>        device_initialize(dev);
>>>        dev->bus = &mhi_bus_type;
>>>        dev->release = mhi_release_device;
>>> -     dev->parent = mhi_cntrl->cntrl_dev;
>>> +
>>> +     if (mhi_cntrl->mhi_dev) {
>>> +             /* for MHI client devices, parent is the MHI controller device */
>>> +             dev->parent = &mhi_cntrl->mhi_dev->dev;
>>> +     } else {
>>> +             /* for MHI controller device, parent is the bus device (e.g. pci device) */
>>> +             dev->parent = mhi_cntrl->cntrl_dev;
>>> +     }
>>> +
>>>        mhi_dev->mhi_cntrl = mhi_cntrl;
>>>        mhi_dev->dev_wake = 0;
>>>
>>>
>>
>>
>> --
>> Jeffrey Hugo
>> Qualcomm Technologies, Inc. is a member of the
>> Code Aurora Forum, a Linux Foundation Collaborative Project.


-- 
Jeffrey Hugo
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
