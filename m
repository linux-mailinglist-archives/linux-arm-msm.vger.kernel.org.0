Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48A0B340D02
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Mar 2021 19:31:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232465AbhCRSbY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Mar 2021 14:31:24 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:13745 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232349AbhCRSbI (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Mar 2021 14:31:08 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1616092268; h=Message-ID: References: In-Reply-To: Reply-To:
 Subject: Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=fPCATuh8PR5hX6LNsw9tRpvHJmQ1FsrvN3chUwd2U+U=;
 b=WWANo9eVrY+kld5ZSKJXknf+GRgNCQrY+3J3tEtrLdrykTUUQrJnWI5LUWMhKKUVcqqBttqW
 e4pANPm/riKOzHAao9KMCdOInQULwYPThfFCiSH00gzQjfJ/FwvzEib9iIE7pRcFcfWh3aMb
 GOIU0Pj+q1HEF4/ckqmhzFC+jN4=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 60539c501de5dd7b99a8791f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 18 Mar 2021 18:30:40
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9E054C433ED; Thu, 18 Mar 2021 18:30:39 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 42C8BC433C6;
        Thu, 18 Mar 2021 18:30:38 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 18 Mar 2021 11:30:38 -0700
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     Loic Poulain <loic.poulain@linaro.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        hemantk@codeaurora.org
Cc:     Jeffrey Hugo <jhugo@codeaurora.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        =?UTF-8?Q?Carl_Yin=28=E6=AE=B7=E5=BC=A0=E6=88=90=29?= 
        <carl.yin@quectel.com>, Naveen Kumar <naveen.kumar@quectel.com>,
        jhugo=codeaurora.org@codeaurora.org
Subject: Re: [PATCH v4 1/3] bus: mhi: core: Introduce internal register poll
 helper function
Organization: Qualcomm Innovation Center, Inc.
Reply-To: bbhatt@codeaurora.org
Mail-Reply-To: bbhatt@codeaurora.org
In-Reply-To: <CAMZdPi_GPxTT8Wky84V_FtGxC7cXLeeAi7tqkU9Xj_XxdFcL8Q@mail.gmail.com>
References: <1615419080-26540-1-git-send-email-bbhatt@codeaurora.org>
 <1615419080-26540-2-git-send-email-bbhatt@codeaurora.org>
 <CAMZdPi8CHCVT8G60zOEn0n43vPJW0xx+fufnBFzb7aPXSoMQOw@mail.gmail.com>
 <e04579bf-6641-0038-1aa8-b46f8ab4b984@codeaurora.org>
 <43c83caf8a6b71207b107ac8457f22d6@codeaurora.org>
 <8b458436-dad9-8a8b-f997-9810f1be5d91@codeaurora.org>
 <CAMZdPi_GPxTT8Wky84V_FtGxC7cXLeeAi7tqkU9Xj_XxdFcL8Q@mail.gmail.com>
Message-ID: <7c504fc79dfd3714191672713c6b8e8e@codeaurora.org>
X-Sender: bbhatt@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-03-18 09:43 AM, Loic Poulain wrote:
> On Thu, 18 Mar 2021 at 17:13, Jeffrey Hugo <jhugo@codeaurora.org> 
> wrote:
>> 
>> On 3/17/2021 3:26 PM, Bhaumik Bhatt wrote:
>> > On 2021-03-11 11:59 AM, Jeffrey Hugo wrote:
>> >> On 3/11/2021 1:00 AM, Loic Poulain wrote:
>> >>> Hi Bhaumik,
>> >>>
>> >>> On Thu, 11 Mar 2021 at 00:31, Bhaumik Bhatt <bbhatt@codeaurora.org>
>> >>> wrote:
>> >>>>
>> >>>> Introduce helper function to allow MHI core driver to poll for
>> >>>> a value in a register field. This helps reach a common path to
>> >>>> read and poll register values along with a retry time interval.
>> >>>>
>> >>>> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
>> >>>> ---
>> >>>>   drivers/bus/mhi/core/internal.h |  3 +++
>> >>>>   drivers/bus/mhi/core/main.c     | 23 +++++++++++++++++++++++
>> >>>>   2 files changed, 26 insertions(+)
>> >>>>
>> >>>> diff --git a/drivers/bus/mhi/core/internal.h
>> >>>> b/drivers/bus/mhi/core/internal.h
>> >>>> index 6f80ec3..005286b 100644
>> >>>> --- a/drivers/bus/mhi/core/internal.h
>> >>>> +++ b/drivers/bus/mhi/core/internal.h
>> >>>> @@ -643,6 +643,9 @@ int __must_check mhi_read_reg(struct
>> >>>> mhi_controller *mhi_cntrl,
>> >>>>   int __must_check mhi_read_reg_field(struct mhi_controller *mhi_cntrl,
>> >>>>                                      void __iomem *base, u32 offset,
>> >>>> u32 mask,
>> >>>>                                      u32 shift, u32 *out);
>> >>>> +int __must_check mhi_poll_reg_field(struct mhi_controller *mhi_cntrl,
>> >>>> +                                   void __iomem *base, u32 offset,
>> >>>> u32 mask,
>> >>>> +                                   u32 shift, u32 val, u32 delayus);
>> >>>>   void mhi_write_reg(struct mhi_controller *mhi_cntrl, void __iomem
>> >>>> *base,
>> >>>>                     u32 offset, u32 val);
>> >>>>   void mhi_write_reg_field(struct mhi_controller *mhi_cntrl, void
>> >>>> __iomem *base,
>> >>>> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
>> >>>> index 4e0131b..7c7f41a 100644
>> >>>> --- a/drivers/bus/mhi/core/main.c
>> >>>> +++ b/drivers/bus/mhi/core/main.c
>> >>>> @@ -4,6 +4,7 @@
>> >>>>    *
>> >>>>    */
>> >>>>
>> >>>> +#include <linux/delay.h>
>> >>>>   #include <linux/device.h>
>> >>>>   #include <linux/dma-direction.h>
>> >>>>   #include <linux/dma-mapping.h>
>> >>>> @@ -37,6 +38,28 @@ int __must_check mhi_read_reg_field(struct
>> >>>> mhi_controller *mhi_cntrl,
>> >>>>          return 0;
>> >>>>   }
>> >>>>
>> >>>> +int __must_check mhi_poll_reg_field(struct mhi_controller *mhi_cntrl,
>> >>>> +                                   void __iomem *base, u32 offset,
>> >>>> +                                   u32 mask, u32 shift, u32 val,
>> >>>> u32 delayus)
>> >>>> +{
>> >>>> +       int ret;
>> >>>> +       u32 out, retry = (mhi_cntrl->timeout_ms * 1000) / delayus;
>> >>>> +
>> >>>> +       while (retry--) {
>> >>>> +               ret = mhi_read_reg_field(mhi_cntrl, base, offset,
>> >>>> mask, shift,
>> >>>> +                                        &out);
>> >>>> +               if (ret)
>> >>>> +                       return ret;
>> >>>> +
>> >>>> +               if (out == val)
>> >>>> +                       return 0;
>> >>>> +
>> >>>> +               udelay(delayus);
>> >>>
>> >>> Have you read my previous comment?
>> >>> Do you really want to risk hogging the CPU for several seconds? we
>> >>> know that some devices take several seconds to start/boot.
>> >>> Why not using msleep variant here?
>> >>
>> >> usleep_range() if there is a desire to stay in us units?
>> >>
>> >> Given that the use of this function is for 25ms in one case, I wonder
>> >> if this warning is applicable:
>> >> https://elixir.bootlin.com/linux/latest/source/include/linux/delay.h#L28
>> >>
>> >> Counter point, 1ms latency over PCIe is not unusual.  I know we've
>> >> removed the PCIe dependencies from MHI, but PCIe is the real usecase
>> >> at this time.  Seems like this function could behave a bit weird if
>> >> the parameter to udelay is something like "100", but the
>> >> mhi_read_reg_field() call takes significantly longer than that.  Feels
>> >> like in some scenarios, we could actually exceed the timeout by a
>> >> non-trivial margin.
>> >>
>> >> I guess I'm going back and forth in determining if us scale timing is
>> >> a benefit in any way.
>> > Thanks for all the inputs. I think a good idea here would be to use
>> > fsleep()
>> > API as we need to allow any timeout the caller specifies. Also, plan is to
>> > drop the patch #3 in this series since that will require a busywait due to
>> > the code being in panic path.
>> >
>> > I don't wish to accommodate another variable here for busywait but that
>> > would be an option to pick sleep or delay depending on the caller's path.
>> >
>> > Please respond if there are any concerns.
>> 
>> fsleep() would be some improvement, but I think there is still the 
>> issue
>> Loic points out where if delayus is small, but timeout_ms is large 
>> (say
>> 50us and 25s), this function will end up burning a lot of cpu cycles
>> However that is likely an edge case, and if your poll cycle is that
>> small, I think it should be assumed that the event is expected to 
>> happen
>> quickly, so the full timeout should not be hit.
> 
> Well, my point is that during initial power_up, with a device
> cold-booting, it can take several seconds for it to reach ready state
> (not a corner case). That why timeout_ms can be as large as 20 seconds
> for mhi_pci_modem. If polling is based on busy-wait, that means the
> while loop will not let the CPU running anything else for several
> seconds. Not sure what is the expected meaning of this timeout_ms in
> first place... maybe I just use it badly.
> 
> Moreover, do we need microsecond latency on detecting ready
> transition, this is not a critical path, right?
> 
> Regards,
> Loic
At initial boot, yes, device could take longer to boot.

If we were to force caller to use an interval in the order of 
milliseconds, I'd
still be using fsleep() internally anyway and just multiply the value by 
1000
before passing it on as there's a need to check if the value is greater 
than 20ms
or not.

I don't wish to reinvent the wheel and implement what we already have in 
fsleep()
internally for msec.

It would be recommended that the caller specifies an interval of at 
least 20+
msec but I don't think we can enforce that.

A point in favor of using microseconds is, if we were to expand usage of 
this
API in the future for panic path to do a busywait, we wouldn't have to 
change
the parameters.

3 options:
1. Use msec granularity and implement a partial fsleep for msec within 
the new
API.
2. Use fsleep and leave it as usec granularity.
3. Leave it at usec, and add a busywait boolean allowing caller to 
choose between
udelay() and fsleep() to also allow usage of this API in panic path (for 
patch #3).

I like options 2 and 3. Hemant/Mani, your guidance is welcome.

Thanks,
Bhaumik
---
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum,
a Linux Foundation Collaborative Project
