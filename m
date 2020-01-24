Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6725D148DF4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2020 19:44:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391481AbgAXSoN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Jan 2020 13:44:13 -0500
Received: from mail-il1-f193.google.com ([209.85.166.193]:38342 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391473AbgAXSoM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Jan 2020 13:44:12 -0500
Received: by mail-il1-f193.google.com with SMTP id f5so2416394ilq.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jan 2020 10:44:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2JH3g8dh1GU5H/sR8ZGM8+SPJang7iCUnM35EHBf4U0=;
        b=sUkSU5BA0VaUZ1EqVvXDp51LYwWh8WYDrTrgFbKo+7QPyswRoDgFoi1glh31ryC55F
         joWVg7mLUImUZ4Aid7XBHsWeIuDHvsgy3aDseDuFQtApK7qwAcr9c5yEYP6/M5X1dIrS
         1kPS+k7s42fZJrSBm3SHTA10KKfJ8Pg2qmSaHlRYe4ROGkS19U3MgA7WeKhMI62PuQQc
         278elf6xZJ6AFO46/kc11Jup6m9V36bx6zA7dB0csGj0AODlywdtqP3CxRPcg8zuU99j
         YB8IysZfqhUl8CWnQYf/hrW0+IxYvuG1L+t3ddU798J28xwtHQBnFY2CCtUpsQC2GPDb
         7gPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2JH3g8dh1GU5H/sR8ZGM8+SPJang7iCUnM35EHBf4U0=;
        b=rEkC1t1CIOZ2X1kOifW844Ug3oQd8CSVFFb9Cwf1Y9DWpCly2lfKooXIyHfrl0MAa+
         uisBkqw8xiZ4YOgAjukzGlMgIJv7+LkGJt9jWdH2B+NHltajd0+cEbL/t5howYcAolsb
         n8RM8AkMgrF4jdz82hcp5yTSpHbR1yqivfko/dVucUBYK9NpRLmhLd5dSI6TVxZR6ZEJ
         g/e693itcjmA0taZcmUSAm6GFyVC6VJfn/8h6dlfKEBqigCzdD/LwIel6vQAi150xn9K
         HaP2rf0wrgX2+Sj0YJzEJepJyxEek+WBIzSLCzXLAWpKCLe3ugnK5JDbptv2ZhgJ+wFR
         WgBw==
X-Gm-Message-State: APjAAAX7TJTx1ZvplGSkQdiHJFUgwI6u9C9W7zyV0aGySKXI8iZu2hQV
        ZVjjhFj7MTs2CYQ2UgRsUAGcwB+ENdFsMyqKP9OVY/p2
X-Google-Smtp-Source: APXvYqzcz7qW8iCmlEijtCdDmXnM/4jHbABwlE7vzpx8FPgzBZy4Ux5rA5eM0SAF78/80UKHi7OLzdscbESCeOArY74=
X-Received: by 2002:a92:2907:: with SMTP id l7mr4349749ilg.140.1579891451965;
 Fri, 24 Jan 2020 10:44:11 -0800 (PST)
MIME-Version: 1.0
References: <20191227053215.423811-1-bjorn.andersson@linaro.org>
 <20191227053215.423811-8-bjorn.andersson@linaro.org> <20200110212806.GD11555@xps15>
 <20200122193936.GB3261042@ripper> <CANLsYkx-C9U4W3R3Xo6t3BJBM4UK_i3zuwzhnXMMEQ0-ur+8Kg@mail.gmail.com>
 <20200123171524.GV1511@yoga> <8d92c4b5-4238-23d2-50fc-1a5bdfc2c67b@st.com>
In-Reply-To: <8d92c4b5-4238-23d2-50fc-1a5bdfc2c67b@st.com>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Fri, 24 Jan 2020 11:44:01 -0700
Message-ID: <CANLsYkyhGjrxGiYqtCijwQiMOnvGdpXNKJ0XpxXsFYe=XEY0ZQ@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] remoteproc: qcom: q6v5: Add common panic handler
To:     Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-remoteproc <linux-remoteproc@vger.kernel.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 23 Jan 2020 at 10:49, Arnaud POULIQUEN <arnaud.pouliquen@st.com> wrote:
>
> Hi Bjorn, Mathieu
>
> On 1/23/20 6:15 PM, Bjorn Andersson wrote:
> > On Thu 23 Jan 09:01 PST 2020, Mathieu Poirier wrote:
> >
> >> On Wed, 22 Jan 2020 at 12:40, Bjorn Andersson
> >> <bjorn.andersson@linaro.org> wrote:
> >>>
> >>> On Fri 10 Jan 13:28 PST 2020, Mathieu Poirier wrote:
> >>>
> >>>> On Thu, Dec 26, 2019 at 09:32:14PM -0800, Bjorn Andersson wrote:
> >>>>> Add a common panic handler that invokes a stop request and sleep enough
> >>>>> to let the remoteproc flush it's caches etc in order to aid post mortem
> >>>>> debugging.
> >>>>>
> >>>>> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> >>>>> ---
> >>>>>
> >>>>> Changes since v1:
> >>>>> - None
> >>>>>
> >>>>>  drivers/remoteproc/qcom_q6v5.c | 19 +++++++++++++++++++
> >>>>>  drivers/remoteproc/qcom_q6v5.h |  1 +
> >>>>>  2 files changed, 20 insertions(+)
> >>>>>
> >>>>> diff --git a/drivers/remoteproc/qcom_q6v5.c b/drivers/remoteproc/qcom_q6v5.c
> >>>>> index cb0f4a0be032..17167c980e02 100644
> >>>>> --- a/drivers/remoteproc/qcom_q6v5.c
> >>>>> +++ b/drivers/remoteproc/qcom_q6v5.c
> >>>>> @@ -6,6 +6,7 @@
> >>>>>   * Copyright (C) 2014 Sony Mobile Communications AB
> >>>>>   * Copyright (c) 2012-2013, The Linux Foundation. All rights reserved.
> >>>>>   */
> >>>>> +#include <linux/delay.h>
> >>>>>  #include <linux/kernel.h>
> >>>>>  #include <linux/platform_device.h>
> >>>>>  #include <linux/interrupt.h>
> >>>>> @@ -15,6 +16,8 @@
> >>>>>  #include <linux/remoteproc.h>
> >>>>>  #include "qcom_q6v5.h"
> >>>>>
> >>>>> +#define Q6V5_PANIC_DELAY_MS        200
> >>>>> +
> >>>>>  /**
> >>>>>   * qcom_q6v5_prepare() - reinitialize the qcom_q6v5 context before start
> >>>>>   * @q6v5:  reference to qcom_q6v5 context to be reinitialized
> >>>>> @@ -162,6 +165,22 @@ int qcom_q6v5_request_stop(struct qcom_q6v5 *q6v5)
> >>>>>  }
> >>>>>  EXPORT_SYMBOL_GPL(qcom_q6v5_request_stop);
> >>>>>
> >>>>> +/**
> >>>>> + * qcom_q6v5_panic() - panic handler to invoke a stop on the remote
> >>>>> + * @q6v5:  reference to qcom_q6v5 context
> >>>>> + *
> >>>>> + * Set the stop bit and sleep in order to allow the remote processor to flush
> >>>>> + * its caches etc for post mortem debugging.
> >>>>> + */
> >>>>> +void qcom_q6v5_panic(struct qcom_q6v5 *q6v5)
> >>>>> +{
> >>>>> +   qcom_smem_state_update_bits(q6v5->state,
> >>>>> +                               BIT(q6v5->stop_bit), BIT(q6v5->stop_bit));
> >>>>> +
> >>>>> +   mdelay(Q6V5_PANIC_DELAY_MS);
> >>>>
> >>>> I really wonder if the delay should be part of the remoteproc core and
> >>>> configurable via device tree.  Wanting the remote processor to flush its caches
> >>>> is likely something other vendors will want when dealing with a kernel panic.
> >>>> It would be nice to see if other people have an opinion on this topic.  If not
> >>>> then we can keep the delay here and move it to the core if need be.
> >>>>
> >>>
> >>> I gave this some more thought and what we're trying to achieve is to
> >>> signal the remote processors about the panic and then give them time to
> >>> react, but per the proposal (and Qualcomm downstream iirc) we will do
> >>> this for each remote processor, one by one.
> >>>
> >>> So in the typical case of a Qualcomm platform with 4-5 remoteprocs we'll
> >>> end up giving the first one a whole second to react and the last one
> >>> "only" 200ms.
> >>>
> >>> Moving the delay to the core by iterating over rproc_list calling
> >>> panic() and then delaying would be cleaner imo.
> >>
> >> I agree.
> >>
> >>>
> >>> It might be nice to make this configurable in DT, but I agree that it
> >>> would be nice to hear from others if this would be useful.
> >>
> >> I think the delay has to be configurable via DT if we move this to the
> >> core.  The binding can be optional and default to 200ms if not
> >> present.
> >>
> >
> > How about I make the panic() return the required delay and then we let
> > the core sleep for MAX() of the returned durations?

I like it.

> That way the default
> > is still a property of the remoteproc drivers - and 200ms seems rather
> > arbitrary to put in the core, even as a default.
>
> I agree with Bjorn, the delay should be provided by the platform.
> But in this case i wonder if it is simpler to just let the platform take care it?

If I understand you correctly, that is what Bjorn's original
implementation was doing and it had drawbacks.

> For instance for stm32mp1 the stop corresponds to the reset on the remote processor core. To inform the coprocessor about an imminent shutdown we use a signal relying on a mailbox (cf. stm32_rproc_stop).
> In this case we would need a delay between the signal and the reset, but not after (no cache management).

Here I believe you are referring to the upper limit of 500ms that is
needed for the mbox_send_message() in stm32_rproc_stop() to complete.
Since that is a blocking call I think it would fit with Bjorn's
proposal above if a value of '0' is returned by rproc->ops->panic().
That would mean no further delays are needed (because the blocking
mbox_send_message() would have done the job already).  Let me know if
I'm in the weeds.

>
> Regards,
> Arnaud
> >
> > Regards,
> > Bjorn
> >
