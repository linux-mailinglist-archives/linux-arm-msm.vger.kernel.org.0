Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BBDF340A48
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Mar 2021 17:36:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230465AbhCRQgB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Mar 2021 12:36:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231208AbhCRQfa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Mar 2021 12:35:30 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA5B9C06175F
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Mar 2021 09:35:30 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id y27so1793317pga.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Mar 2021 09:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=N0sQ91xGdRMtUv5DIsRHX0Bo7or+G/JjCVeEZ+5p1Bc=;
        b=JNf2hwUh/9DglvtvUp6hRauJJn/ANVIZyEXpA7+xPdHiCmiH3g6niBuIfM+e2TR29N
         RzJJQgPOteqevtl2MgPPuutbTQMt93nD+qC6E3GErnyCAH+bBHLNFZg2Qpw9XMg3rI5J
         tFSms2fFTqz7EvYfU3+f6yG0eOGFbRFcBkCDkuQwjAhTDLFGLHVgASkjVy5bUHanRnIn
         XBL/hQrzc2wWFCPZoSn2R+J/gjOrB28h7Y32qj//uECQpQA5XkynDPXf9uA9T45Bps+r
         gS8isD6It9FuMFl+eAvENLKc+WxXgTZhxfpYo2oqO+5eJ7e2fWTRtkL/bXtgUJiZWkVU
         L24A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=N0sQ91xGdRMtUv5DIsRHX0Bo7or+G/JjCVeEZ+5p1Bc=;
        b=eg/JzaJVQxOwJKUd95Ic6PcYwxRg2kmVWjRvM1+xnMBxb8kH2el687hDnJEP7cNqxI
         ly4lukCgFfVYMDP4H0IMzE/aJswuqw8FfmbXgf/l2GyC/ee971FMwNigU0JoND+iH86k
         fiHbnGOgIjcD+tD3URVRMAxXDLg1+L9msI1AJd+yHEmJDrgpoLdlO1xePAqmoJN+deiW
         oj4/TAS5XqOgZPYpX3Oqnlw+M8DGJfuCZ5UPnkmLMWFj74gTPBB9dbjg+DZMVMKSzWnT
         ZBeA1pXULvzSBqjprzgFy8az3IASKnwe2NgFbpnetl9+EHqeNTnm2/SPRXAlRxPV+M3N
         b2ZA==
X-Gm-Message-State: AOAM531pu0vz3xaYlqKvHT+fSSzY63V+PxqgAsawQYI8/fF9wEV3Z6tS
        oJNrmSwIEo2GI3Jc6pJLo0Q8vYrQj65dxElUTXcQtcxURj3kFJe0
X-Google-Smtp-Source: ABdhPJwnBk2lyPN56QSGZQ7my1xsFNKrNufikGjgrNDaL05O9CxOqWeKsQ7j3FPIars5a/t4do9JAkWXcyw4aSuClwE=
X-Received: by 2002:a63:2262:: with SMTP id t34mr7839589pgm.303.1616085330176;
 Thu, 18 Mar 2021 09:35:30 -0700 (PDT)
MIME-Version: 1.0
References: <1615419080-26540-1-git-send-email-bbhatt@codeaurora.org>
 <1615419080-26540-2-git-send-email-bbhatt@codeaurora.org> <CAMZdPi8CHCVT8G60zOEn0n43vPJW0xx+fufnBFzb7aPXSoMQOw@mail.gmail.com>
 <e04579bf-6641-0038-1aa8-b46f8ab4b984@codeaurora.org> <43c83caf8a6b71207b107ac8457f22d6@codeaurora.org>
 <8b458436-dad9-8a8b-f997-9810f1be5d91@codeaurora.org>
In-Reply-To: <8b458436-dad9-8a8b-f997-9810f1be5d91@codeaurora.org>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Thu, 18 Mar 2021 17:43:31 +0100
Message-ID: <CAMZdPi_GPxTT8Wky84V_FtGxC7cXLeeAi7tqkU9Xj_XxdFcL8Q@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] bus: mhi: core: Introduce internal register poll
 helper function
To:     Jeffrey Hugo <jhugo@codeaurora.org>,
        Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Hemant Kumar <hemantk@codeaurora.org>,
        open list <linux-kernel@vger.kernel.org>,
        =?UTF-8?B?Q2FybCBZaW4o5q635byg5oiQKQ==?= <carl.yin@quectel.com>,
        Naveen Kumar <naveen.kumar@quectel.com>,
        jhugo=codeaurora.org@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 18 Mar 2021 at 17:13, Jeffrey Hugo <jhugo@codeaurora.org> wrote:
>
> On 3/17/2021 3:26 PM, Bhaumik Bhatt wrote:
> > On 2021-03-11 11:59 AM, Jeffrey Hugo wrote:
> >> On 3/11/2021 1:00 AM, Loic Poulain wrote:
> >>> Hi Bhaumik,
> >>>
> >>> On Thu, 11 Mar 2021 at 00:31, Bhaumik Bhatt <bbhatt@codeaurora.org>
> >>> wrote:
> >>>>
> >>>> Introduce helper function to allow MHI core driver to poll for
> >>>> a value in a register field. This helps reach a common path to
> >>>> read and poll register values along with a retry time interval.
> >>>>
> >>>> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> >>>> ---
> >>>>   drivers/bus/mhi/core/internal.h |  3 +++
> >>>>   drivers/bus/mhi/core/main.c     | 23 +++++++++++++++++++++++
> >>>>   2 files changed, 26 insertions(+)
> >>>>
> >>>> diff --git a/drivers/bus/mhi/core/internal.h
> >>>> b/drivers/bus/mhi/core/internal.h
> >>>> index 6f80ec3..005286b 100644
> >>>> --- a/drivers/bus/mhi/core/internal.h
> >>>> +++ b/drivers/bus/mhi/core/internal.h
> >>>> @@ -643,6 +643,9 @@ int __must_check mhi_read_reg(struct
> >>>> mhi_controller *mhi_cntrl,
> >>>>   int __must_check mhi_read_reg_field(struct mhi_controller *mhi_cntrl,
> >>>>                                      void __iomem *base, u32 offset,
> >>>> u32 mask,
> >>>>                                      u32 shift, u32 *out);
> >>>> +int __must_check mhi_poll_reg_field(struct mhi_controller *mhi_cntrl,
> >>>> +                                   void __iomem *base, u32 offset,
> >>>> u32 mask,
> >>>> +                                   u32 shift, u32 val, u32 delayus);
> >>>>   void mhi_write_reg(struct mhi_controller *mhi_cntrl, void __iomem
> >>>> *base,
> >>>>                     u32 offset, u32 val);
> >>>>   void mhi_write_reg_field(struct mhi_controller *mhi_cntrl, void
> >>>> __iomem *base,
> >>>> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
> >>>> index 4e0131b..7c7f41a 100644
> >>>> --- a/drivers/bus/mhi/core/main.c
> >>>> +++ b/drivers/bus/mhi/core/main.c
> >>>> @@ -4,6 +4,7 @@
> >>>>    *
> >>>>    */
> >>>>
> >>>> +#include <linux/delay.h>
> >>>>   #include <linux/device.h>
> >>>>   #include <linux/dma-direction.h>
> >>>>   #include <linux/dma-mapping.h>
> >>>> @@ -37,6 +38,28 @@ int __must_check mhi_read_reg_field(struct
> >>>> mhi_controller *mhi_cntrl,
> >>>>          return 0;
> >>>>   }
> >>>>
> >>>> +int __must_check mhi_poll_reg_field(struct mhi_controller *mhi_cntrl,
> >>>> +                                   void __iomem *base, u32 offset,
> >>>> +                                   u32 mask, u32 shift, u32 val,
> >>>> u32 delayus)
> >>>> +{
> >>>> +       int ret;
> >>>> +       u32 out, retry = (mhi_cntrl->timeout_ms * 1000) / delayus;
> >>>> +
> >>>> +       while (retry--) {
> >>>> +               ret = mhi_read_reg_field(mhi_cntrl, base, offset,
> >>>> mask, shift,
> >>>> +                                        &out);
> >>>> +               if (ret)
> >>>> +                       return ret;
> >>>> +
> >>>> +               if (out == val)
> >>>> +                       return 0;
> >>>> +
> >>>> +               udelay(delayus);
> >>>
> >>> Have you read my previous comment?
> >>> Do you really want to risk hogging the CPU for several seconds? we
> >>> know that some devices take several seconds to start/boot.
> >>> Why not using msleep variant here?
> >>
> >> usleep_range() if there is a desire to stay in us units?
> >>
> >> Given that the use of this function is for 25ms in one case, I wonder
> >> if this warning is applicable:
> >> https://elixir.bootlin.com/linux/latest/source/include/linux/delay.h#L28
> >>
> >> Counter point, 1ms latency over PCIe is not unusual.  I know we've
> >> removed the PCIe dependencies from MHI, but PCIe is the real usecase
> >> at this time.  Seems like this function could behave a bit weird if
> >> the parameter to udelay is something like "100", but the
> >> mhi_read_reg_field() call takes significantly longer than that.  Feels
> >> like in some scenarios, we could actually exceed the timeout by a
> >> non-trivial margin.
> >>
> >> I guess I'm going back and forth in determining if us scale timing is
> >> a benefit in any way.
> > Thanks for all the inputs. I think a good idea here would be to use
> > fsleep()
> > API as we need to allow any timeout the caller specifies. Also, plan is to
> > drop the patch #3 in this series since that will require a busywait due to
> > the code being in panic path.
> >
> > I don't wish to accommodate another variable here for busywait but that
> > would be an option to pick sleep or delay depending on the caller's path.
> >
> > Please respond if there are any concerns.
>
> fsleep() would be some improvement, but I think there is still the issue
> Loic points out where if delayus is small, but timeout_ms is large (say
> 50us and 25s), this function will end up burning a lot of cpu cycles
> However that is likely an edge case, and if your poll cycle is that
> small, I think it should be assumed that the event is expected to happen
> quickly, so the full timeout should not be hit.

Well, my point is that during initial power_up, with a device
cold-booting, it can take several seconds for it to reach ready state
(not a corner case). That why timeout_ms can be as large as 20 seconds
for mhi_pci_modem. If polling is based on busy-wait, that means the
while loop will not let the CPU running anything else for several
seconds. Not sure what is the expected meaning of this timeout_ms in
first place... maybe I just use it badly.

Moreover, do we need microsecond latency on detecting ready
transition, this is not a critical path, right?

Regards,
Loic
