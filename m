Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD7FB33FA77
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Mar 2021 22:27:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233567AbhCQV1P (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Mar 2021 17:27:15 -0400
Received: from m42-10.mailgun.net ([69.72.42.10]:50801 "EHLO
        m42-10.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233494AbhCQV0w (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Mar 2021 17:26:52 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1616016412; h=Message-ID: References: In-Reply-To: Reply-To:
 Subject: Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=rUdJtBfTFgyjFNtc2CQzmWvggSZM/VQac8mm040LRys=;
 b=SmCDfbjNrfyG8CwtDH1OiH27mAga1TN5TtPvoPWD4Jy+soc5vhSU4NoZvH9HI3a5Y5VJofcg
 h8ZOuzli5Hja8Eyteskl9OLflSO2edpcXBfqDrz0QfRnUf5PvZL2JG4ZnJWJ4iyXnKpTxzjX
 mBUPU1o0495TW+QmszknhA6rmAY=
X-Mailgun-Sending-Ip: 69.72.42.10
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 6052741a21031618f65946b9 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 17 Mar 2021 21:26:50
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id EEC44C43465; Wed, 17 Mar 2021 21:26:49 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C86C2C433ED;
        Wed, 17 Mar 2021 21:26:48 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 17 Mar 2021 14:26:48 -0700
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     Loic Poulain <loic.poulain@linaro.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Hemant Kumar <hemantk@codeaurora.org>,
        open list <linux-kernel@vger.kernel.org>,
        =?UTF-8?Q?Carl_Yin=28=E6=AE=B7?= =?UTF-8?Q?=E5=BC=A0=E6=88=90=29?= 
        <carl.yin@quectel.com>, Naveen Kumar <naveen.kumar@quectel.com>,
        jhugo=codeaurora.org@codeaurora.org
Subject: Re: [PATCH v4 1/3] bus: mhi: core: Introduce internal register poll
 helper function
Organization: Qualcomm Innovation Center, Inc.
Reply-To: bbhatt@codeaurora.org
Mail-Reply-To: bbhatt@codeaurora.org
In-Reply-To: <e04579bf-6641-0038-1aa8-b46f8ab4b984@codeaurora.org>
References: <1615419080-26540-1-git-send-email-bbhatt@codeaurora.org>
 <1615419080-26540-2-git-send-email-bbhatt@codeaurora.org>
 <CAMZdPi8CHCVT8G60zOEn0n43vPJW0xx+fufnBFzb7aPXSoMQOw@mail.gmail.com>
 <e04579bf-6641-0038-1aa8-b46f8ab4b984@codeaurora.org>
Message-ID: <43c83caf8a6b71207b107ac8457f22d6@codeaurora.org>
X-Sender: bbhatt@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-03-11 11:59 AM, Jeffrey Hugo wrote:
> On 3/11/2021 1:00 AM, Loic Poulain wrote:
>> Hi Bhaumik,
>> 
>> On Thu, 11 Mar 2021 at 00:31, Bhaumik Bhatt <bbhatt@codeaurora.org> 
>> wrote:
>>> 
>>> Introduce helper function to allow MHI core driver to poll for
>>> a value in a register field. This helps reach a common path to
>>> read and poll register values along with a retry time interval.
>>> 
>>> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
>>> ---
>>>   drivers/bus/mhi/core/internal.h |  3 +++
>>>   drivers/bus/mhi/core/main.c     | 23 +++++++++++++++++++++++
>>>   2 files changed, 26 insertions(+)
>>> 
>>> diff --git a/drivers/bus/mhi/core/internal.h 
>>> b/drivers/bus/mhi/core/internal.h
>>> index 6f80ec3..005286b 100644
>>> --- a/drivers/bus/mhi/core/internal.h
>>> +++ b/drivers/bus/mhi/core/internal.h
>>> @@ -643,6 +643,9 @@ int __must_check mhi_read_reg(struct 
>>> mhi_controller *mhi_cntrl,
>>>   int __must_check mhi_read_reg_field(struct mhi_controller 
>>> *mhi_cntrl,
>>>                                      void __iomem *base, u32 offset, 
>>> u32 mask,
>>>                                      u32 shift, u32 *out);
>>> +int __must_check mhi_poll_reg_field(struct mhi_controller 
>>> *mhi_cntrl,
>>> +                                   void __iomem *base, u32 offset, 
>>> u32 mask,
>>> +                                   u32 shift, u32 val, u32 delayus);
>>>   void mhi_write_reg(struct mhi_controller *mhi_cntrl, void __iomem 
>>> *base,
>>>                     u32 offset, u32 val);
>>>   void mhi_write_reg_field(struct mhi_controller *mhi_cntrl, void 
>>> __iomem *base,
>>> diff --git a/drivers/bus/mhi/core/main.c 
>>> b/drivers/bus/mhi/core/main.c
>>> index 4e0131b..7c7f41a 100644
>>> --- a/drivers/bus/mhi/core/main.c
>>> +++ b/drivers/bus/mhi/core/main.c
>>> @@ -4,6 +4,7 @@
>>>    *
>>>    */
>>> 
>>> +#include <linux/delay.h>
>>>   #include <linux/device.h>
>>>   #include <linux/dma-direction.h>
>>>   #include <linux/dma-mapping.h>
>>> @@ -37,6 +38,28 @@ int __must_check mhi_read_reg_field(struct 
>>> mhi_controller *mhi_cntrl,
>>>          return 0;
>>>   }
>>> 
>>> +int __must_check mhi_poll_reg_field(struct mhi_controller 
>>> *mhi_cntrl,
>>> +                                   void __iomem *base, u32 offset,
>>> +                                   u32 mask, u32 shift, u32 val, u32 
>>> delayus)
>>> +{
>>> +       int ret;
>>> +       u32 out, retry = (mhi_cntrl->timeout_ms * 1000) / delayus;
>>> +
>>> +       while (retry--) {
>>> +               ret = mhi_read_reg_field(mhi_cntrl, base, offset, 
>>> mask, shift,
>>> +                                        &out);
>>> +               if (ret)
>>> +                       return ret;
>>> +
>>> +               if (out == val)
>>> +                       return 0;
>>> +
>>> +               udelay(delayus);
>> 
>> Have you read my previous comment?
>> Do you really want to risk hogging the CPU for several seconds? we
>> know that some devices take several seconds to start/boot.
>> Why not using msleep variant here?
> 
> usleep_range() if there is a desire to stay in us units?
> 
> Given that the use of this function is for 25ms in one case, I wonder
> if this warning is applicable:
> https://elixir.bootlin.com/linux/latest/source/include/linux/delay.h#L28
> 
> Counter point, 1ms latency over PCIe is not unusual.  I know we've
> removed the PCIe dependencies from MHI, but PCIe is the real usecase
> at this time.  Seems like this function could behave a bit weird if
> the parameter to udelay is something like "100", but the
> mhi_read_reg_field() call takes significantly longer than that.  Feels
> like in some scenarios, we could actually exceed the timeout by a
> non-trivial margin.
> 
> I guess I'm going back and forth in determining if us scale timing is
> a benefit in any way.
Thanks for all the inputs. I think a good idea here would be to use 
fsleep()
API as we need to allow any timeout the caller specifies. Also, plan is 
to
drop the patch #3 in this series since that will require a busywait due 
to
the code being in panic path.

I don't wish to accommodate another variable here for busywait but that
would be an option to pick sleep or delay depending on the caller's 
path.

Please respond if there are any concerns.

Thanks,
Bhaumik
---
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum,
a Linux Foundation Collaborative Project
