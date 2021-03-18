Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A51683409EB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Mar 2021 17:19:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231648AbhCRQSn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Mar 2021 12:18:43 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:25649 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232056AbhCRQSg (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Mar 2021 12:18:36 -0400
X-Greylist: delayed 305 seconds by postgrey-1.27 at vger.kernel.org; Thu, 18 Mar 2021 12:18:35 EDT
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1616084315; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=DKr+tgYgAkXdPo7uYIhenDviFte57zt7ww4oKvub4jw=; b=XjJ6myj95Vx37DGcdisXNojg66zUhzKVVnmc9JpX9OGLq7EgxJsXnbWrzcv0QDATyzR8E+ar
 +mSiZAOSMhzRB/fPMhlb9ZJTojZTk6K4ugEZHpuwgQI6Vg8wiqTxBmcOH8XqIiKb3xR500m5
 ek+vp6inEWpjKFXZnudi2n2+6VU=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 60537c295d70193f885796ed (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 18 Mar 2021 16:13:29
 GMT
Sender: jhugo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 92AF0C43464; Thu, 18 Mar 2021 16:13:28 +0000 (UTC)
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 44A26C433CA;
        Thu, 18 Mar 2021 16:13:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 44A26C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [PATCH v4 1/3] bus: mhi: core: Introduce internal register poll
 helper function
To:     bbhatt@codeaurora.org
Cc:     Loic Poulain <loic.poulain@linaro.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Hemant Kumar <hemantk@codeaurora.org>,
        open list <linux-kernel@vger.kernel.org>,
        =?UTF-8?B?Q2FybCBZaW4o5q635byg5oiQKQ==?= <carl.yin@quectel.com>,
        Naveen Kumar <naveen.kumar@quectel.com>,
        jhugo=codeaurora.org@codeaurora.org
References: <1615419080-26540-1-git-send-email-bbhatt@codeaurora.org>
 <1615419080-26540-2-git-send-email-bbhatt@codeaurora.org>
 <CAMZdPi8CHCVT8G60zOEn0n43vPJW0xx+fufnBFzb7aPXSoMQOw@mail.gmail.com>
 <e04579bf-6641-0038-1aa8-b46f8ab4b984@codeaurora.org>
 <43c83caf8a6b71207b107ac8457f22d6@codeaurora.org>
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <8b458436-dad9-8a8b-f997-9810f1be5d91@codeaurora.org>
Date:   Thu, 18 Mar 2021 10:13:25 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <43c83caf8a6b71207b107ac8457f22d6@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 3/17/2021 3:26 PM, Bhaumik Bhatt wrote:
> On 2021-03-11 11:59 AM, Jeffrey Hugo wrote:
>> On 3/11/2021 1:00 AM, Loic Poulain wrote:
>>> Hi Bhaumik,
>>>
>>> On Thu, 11 Mar 2021 at 00:31, Bhaumik Bhatt <bbhatt@codeaurora.org> 
>>> wrote:
>>>>
>>>> Introduce helper function to allow MHI core driver to poll for
>>>> a value in a register field. This helps reach a common path to
>>>> read and poll register values along with a retry time interval.
>>>>
>>>> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
>>>> ---
>>>>   drivers/bus/mhi/core/internal.h |  3 +++
>>>>   drivers/bus/mhi/core/main.c     | 23 +++++++++++++++++++++++
>>>>   2 files changed, 26 insertions(+)
>>>>
>>>> diff --git a/drivers/bus/mhi/core/internal.h 
>>>> b/drivers/bus/mhi/core/internal.h
>>>> index 6f80ec3..005286b 100644
>>>> --- a/drivers/bus/mhi/core/internal.h
>>>> +++ b/drivers/bus/mhi/core/internal.h
>>>> @@ -643,6 +643,9 @@ int __must_check mhi_read_reg(struct 
>>>> mhi_controller *mhi_cntrl,
>>>>   int __must_check mhi_read_reg_field(struct mhi_controller *mhi_cntrl,
>>>>                                      void __iomem *base, u32 offset, 
>>>> u32 mask,
>>>>                                      u32 shift, u32 *out);
>>>> +int __must_check mhi_poll_reg_field(struct mhi_controller *mhi_cntrl,
>>>> +                                   void __iomem *base, u32 offset, 
>>>> u32 mask,
>>>> +                                   u32 shift, u32 val, u32 delayus);
>>>>   void mhi_write_reg(struct mhi_controller *mhi_cntrl, void __iomem 
>>>> *base,
>>>>                     u32 offset, u32 val);
>>>>   void mhi_write_reg_field(struct mhi_controller *mhi_cntrl, void 
>>>> __iomem *base,
>>>> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
>>>> index 4e0131b..7c7f41a 100644
>>>> --- a/drivers/bus/mhi/core/main.c
>>>> +++ b/drivers/bus/mhi/core/main.c
>>>> @@ -4,6 +4,7 @@
>>>>    *
>>>>    */
>>>>
>>>> +#include <linux/delay.h>
>>>>   #include <linux/device.h>
>>>>   #include <linux/dma-direction.h>
>>>>   #include <linux/dma-mapping.h>
>>>> @@ -37,6 +38,28 @@ int __must_check mhi_read_reg_field(struct 
>>>> mhi_controller *mhi_cntrl,
>>>>          return 0;
>>>>   }
>>>>
>>>> +int __must_check mhi_poll_reg_field(struct mhi_controller *mhi_cntrl,
>>>> +                                   void __iomem *base, u32 offset,
>>>> +                                   u32 mask, u32 shift, u32 val, 
>>>> u32 delayus)
>>>> +{
>>>> +       int ret;
>>>> +       u32 out, retry = (mhi_cntrl->timeout_ms * 1000) / delayus;
>>>> +
>>>> +       while (retry--) {
>>>> +               ret = mhi_read_reg_field(mhi_cntrl, base, offset, 
>>>> mask, shift,
>>>> +                                        &out);
>>>> +               if (ret)
>>>> +                       return ret;
>>>> +
>>>> +               if (out == val)
>>>> +                       return 0;
>>>> +
>>>> +               udelay(delayus);
>>>
>>> Have you read my previous comment?
>>> Do you really want to risk hogging the CPU for several seconds? we
>>> know that some devices take several seconds to start/boot.
>>> Why not using msleep variant here?
>>
>> usleep_range() if there is a desire to stay in us units?
>>
>> Given that the use of this function is for 25ms in one case, I wonder
>> if this warning is applicable:
>> https://elixir.bootlin.com/linux/latest/source/include/linux/delay.h#L28
>>
>> Counter point, 1ms latency over PCIe is not unusual.  I know we've
>> removed the PCIe dependencies from MHI, but PCIe is the real usecase
>> at this time.  Seems like this function could behave a bit weird if
>> the parameter to udelay is something like "100", but the
>> mhi_read_reg_field() call takes significantly longer than that.  Feels
>> like in some scenarios, we could actually exceed the timeout by a
>> non-trivial margin.
>>
>> I guess I'm going back and forth in determining if us scale timing is
>> a benefit in any way.
> Thanks for all the inputs. I think a good idea here would be to use 
> fsleep()
> API as we need to allow any timeout the caller specifies. Also, plan is to
> drop the patch #3 in this series since that will require a busywait due to
> the code being in panic path.
> 
> I don't wish to accommodate another variable here for busywait but that
> would be an option to pick sleep or delay depending on the caller's path.
> 
> Please respond if there are any concerns.

fsleep() would be some improvement, but I think there is still the issue 
Loic points out where if delayus is small, but timeout_ms is large (say 
50us and 25s), this function will end up burning a lot of cpu cycles. 
However that is likely an edge case, and if your poll cycle is that 
small, I think it should be assumed that the event is expected to happen 
quickly, so the full timeout should not be hit.

fsleep() does nothing to address this function possibly taking quite a 
bit longer than the timeout in overall wall time.  Perhaps that is not a 
significant concern though.

-- 
Jeffrey Hugo
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
