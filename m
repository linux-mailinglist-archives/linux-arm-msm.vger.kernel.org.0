Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C411514D882
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jan 2020 11:00:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726967AbgA3KA1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Jan 2020 05:00:27 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:7296 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726893AbgA3KA1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Jan 2020 05:00:27 -0500
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 00U9vUEL009871;
        Thu, 30 Jan 2020 11:00:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=83piUCyi5cY/Ri6y2b7iI9qZlnP4hgj7C7S5t82mr8Y=;
 b=cq8dGT/aa7wy3v1l+5VrG0lfurJQuid5Ax4OcUDRx1QmUCnrg5L+Un9AxF+TeiT0qxa6
 cyHfhtP77yOijGl51c3IKfqFygt6saHjHrK9jlbziW9TMZqDfkY8f+oxUEuypMY+nXKv
 Yr601ynjB0Ygx938/hhjtqUw8cOeOLBHLS47bOXRnYzi3v1nBjr4XHgjCEH0CKyEJVMF
 HNNcZvlErv61jXMJurmC86rpMOehzYVy4bXRpLuJ8whIjaTsgIrlpoNH+grb4GkJTenW
 ZbCi7/mxAS/N3cdn1D/0yceoNbghkJZklaUrBA1D7h1jfw46gB8kMr5FQTvXq3EMi03U gQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2xrbpb7ue9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 30 Jan 2020 11:00:14 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BDB56100038;
        Thu, 30 Jan 2020 11:00:13 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8A4D52AF167;
        Thu, 30 Jan 2020 11:00:13 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.46) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 30 Jan
 2020 11:00:12 +0100
Subject: Re: [PATCH v2 7/8] remoteproc: qcom: q6v5: Add common panic handler
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-remoteproc <linux-remoteproc@vger.kernel.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>
References: <20191227053215.423811-1-bjorn.andersson@linaro.org>
 <20191227053215.423811-8-bjorn.andersson@linaro.org>
 <20200110212806.GD11555@xps15> <20200122193936.GB3261042@ripper>
 <CANLsYkx-C9U4W3R3Xo6t3BJBM4UK_i3zuwzhnXMMEQ0-ur+8Kg@mail.gmail.com>
 <20200123171524.GV1511@yoga> <8d92c4b5-4238-23d2-50fc-1a5bdfc2c67b@st.com>
 <CANLsYkyhGjrxGiYqtCijwQiMOnvGdpXNKJ0XpxXsFYe=XEY0ZQ@mail.gmail.com>
 <d1f632b2-dff3-401d-f8f5-2d41d1589c79@st.com> <20200129201546.GA31696@xps15>
From:   Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Message-ID: <4e7aae03-95ce-6786-a62b-139546b17e27@st.com>
Date:   Thu, 30 Jan 2020 11:00:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200129201546.GA31696@xps15>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG5NODE3.st.com (10.75.127.15) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-01-30_02:2020-01-28,2020-01-30 signatures=0
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 1/29/20 9:15 PM, Mathieu Poirier wrote:
> On Mon, Jan 27, 2020 at 10:46:05AM +0100, Arnaud POULIQUEN wrote:
>>
>>
>> On 1/24/20 7:44 PM, Mathieu Poirier wrote:
>>> On Thu, 23 Jan 2020 at 10:49, Arnaud POULIQUEN <arnaud.pouliquen@st.com> wrote:
>>>>
>>>> Hi Bjorn, Mathieu
>>>>
>>>> On 1/23/20 6:15 PM, Bjorn Andersson wrote:
>>>>> On Thu 23 Jan 09:01 PST 2020, Mathieu Poirier wrote:
>>>>>
>>>>>> On Wed, 22 Jan 2020 at 12:40, Bjorn Andersson
>>>>>> <bjorn.andersson@linaro.org> wrote:
>>>>>>>
>>>>>>> On Fri 10 Jan 13:28 PST 2020, Mathieu Poirier wrote:
>>>>>>>
>>>>>>>> On Thu, Dec 26, 2019 at 09:32:14PM -0800, Bjorn Andersson wrote:
>>>>>>>>> Add a common panic handler that invokes a stop request and sleep enough
>>>>>>>>> to let the remoteproc flush it's caches etc in order to aid post mortem
>>>>>>>>> debugging.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>>>>>>>>> ---
>>>>>>>>>
>>>>>>>>> Changes since v1:
>>>>>>>>> - None
>>>>>>>>>
>>>>>>>>>  drivers/remoteproc/qcom_q6v5.c | 19 +++++++++++++++++++
>>>>>>>>>  drivers/remoteproc/qcom_q6v5.h |  1 +
>>>>>>>>>  2 files changed, 20 insertions(+)
>>>>>>>>>
>>>>>>>>> diff --git a/drivers/remoteproc/qcom_q6v5.c b/drivers/remoteproc/qcom_q6v5.c
>>>>>>>>> index cb0f4a0be032..17167c980e02 100644
>>>>>>>>> --- a/drivers/remoteproc/qcom_q6v5.c
>>>>>>>>> +++ b/drivers/remoteproc/qcom_q6v5.c
>>>>>>>>> @@ -6,6 +6,7 @@
>>>>>>>>>   * Copyright (C) 2014 Sony Mobile Communications AB
>>>>>>>>>   * Copyright (c) 2012-2013, The Linux Foundation. All rights reserved.
>>>>>>>>>   */
>>>>>>>>> +#include <linux/delay.h>
>>>>>>>>>  #include <linux/kernel.h>
>>>>>>>>>  #include <linux/platform_device.h>
>>>>>>>>>  #include <linux/interrupt.h>
>>>>>>>>> @@ -15,6 +16,8 @@
>>>>>>>>>  #include <linux/remoteproc.h>
>>>>>>>>>  #include "qcom_q6v5.h"
>>>>>>>>>
>>>>>>>>> +#define Q6V5_PANIC_DELAY_MS        200
>>>>>>>>> +
>>>>>>>>>  /**
>>>>>>>>>   * qcom_q6v5_prepare() - reinitialize the qcom_q6v5 context before start
>>>>>>>>>   * @q6v5:  reference to qcom_q6v5 context to be reinitialized
>>>>>>>>> @@ -162,6 +165,22 @@ int qcom_q6v5_request_stop(struct qcom_q6v5 *q6v5)
>>>>>>>>>  }
>>>>>>>>>  EXPORT_SYMBOL_GPL(qcom_q6v5_request_stop);
>>>>>>>>>
>>>>>>>>> +/**
>>>>>>>>> + * qcom_q6v5_panic() - panic handler to invoke a stop on the remote
>>>>>>>>> + * @q6v5:  reference to qcom_q6v5 context
>>>>>>>>> + *
>>>>>>>>> + * Set the stop bit and sleep in order to allow the remote processor to flush
>>>>>>>>> + * its caches etc for post mortem debugging.
>>>>>>>>> + */
>>>>>>>>> +void qcom_q6v5_panic(struct qcom_q6v5 *q6v5)
>>>>>>>>> +{
>>>>>>>>> +   qcom_smem_state_update_bits(q6v5->state,
>>>>>>>>> +                               BIT(q6v5->stop_bit), BIT(q6v5->stop_bit));
>>>>>>>>> +
>>>>>>>>> +   mdelay(Q6V5_PANIC_DELAY_MS);
>>>>>>>>
>>>>>>>> I really wonder if the delay should be part of the remoteproc core and
>>>>>>>> configurable via device tree.  Wanting the remote processor to flush its caches
>>>>>>>> is likely something other vendors will want when dealing with a kernel panic.
>>>>>>>> It would be nice to see if other people have an opinion on this topic.  If not
>>>>>>>> then we can keep the delay here and move it to the core if need be.
>>>>>>>>
>>>>>>>
>>>>>>> I gave this some more thought and what we're trying to achieve is to
>>>>>>> signal the remote processors about the panic and then give them time to
>>>>>>> react, but per the proposal (and Qualcomm downstream iirc) we will do
>>>>>>> this for each remote processor, one by one.
>>>>>>>
>>>>>>> So in the typical case of a Qualcomm platform with 4-5 remoteprocs we'll
>>>>>>> end up giving the first one a whole second to react and the last one
>>>>>>> "only" 200ms.
>>>>>>>
>>>>>>> Moving the delay to the core by iterating over rproc_list calling
>>>>>>> panic() and then delaying would be cleaner imo.
>>>>>>
>>>>>> I agree.
>>>>>>
>>>>>>>
>>>>>>> It might be nice to make this configurable in DT, but I agree that it
>>>>>>> would be nice to hear from others if this would be useful.
>>>>>>
>>>>>> I think the delay has to be configurable via DT if we move this to the
>>>>>> core.  The binding can be optional and default to 200ms if not
>>>>>> present.
>>>>>>
>>>>>
>>>>> How about I make the panic() return the required delay and then we let
>>>>> the core sleep for MAX() of the returned durations?
>>>
>>> I like it.
>>>
>>>> That way the default
>>>>> is still a property of the remoteproc drivers - and 200ms seems rather
>>>>> arbitrary to put in the core, even as a default.
>>>>
>>>> I agree with Bjorn, the delay should be provided by the platform.
>>>> But in this case i wonder if it is simpler to just let the platform take care it?
>>>
>>> If I understand you correctly, that is what Bjorn's original
>>> implementation was doing and it had drawbacks.
>> Yes, 
>> Please tell me if i missed something, the only drawback seems mentioned is the accumulative delay.
> 
> Yes, that is correct.
> 
>> Could you elaborate how to implement the delay in remote proc core for multi rproc instance.
>> Here is my view:
>> To optimize the delay it would probably be necessary to compute:
>> - the delay based on an initial date,
>> - the delay requested by each rproc instance,
>> - the delay elapsed in each rproc panic ops.
>> Feasible but not straight forward... 
>> So I suppose that you are thinking about a solution based on the store of the max delay that would be applied after last panic() return?
> 
> Yes
> 
>> anyway, how do you determine the last rproc instance? seems that a prerequisite would be that the panic ops is mandatory... 
> 
> Each ->panic() should return the amount of time to way or 0 if no delay is
> required.  If an rpoc doesn't implement ->panic() then it is treated as 0.
> From there wait for the maximum time that was collected.
> 
> It would be possible to do something more complicated like taking timestamps
> everytime a ->panic() returns and optimize the time to wait for but that may be
> for a future set.  The first implementation could go with an simple heuristic as
> detailed above.
Seems reasonable. 
A last point. i don't know if the case is realistic so i prefer to mention it:
we can imagine that a rproc platform driver already manages a panic (for instance a video decoder driver that uses a coprocessor).
In this case there is a risk that the rproc is remove during the panic. 
Depending on the panic sequence ordering this could generate a side effect (no delay as last rproc panic ops could be never called).
But seems not too tricky to take it into account in remoteproc core.
> 
>>
>> I'm not familiar with panic mechanism, but how panic ops are scheduled in SMP? Does panics ops would be treated in parallel (using msleep instead of mdelay)?
>> In this case delays could not be cumulative...
> 
> The processor that triggered the panic sequentially runs the notifier registered
> with the panic_notifier_list.  Other processors are instructed to take
> themselves offline.  As such there won't be multiple ->panic() running
> concurrently. 
Thank you for that explanation!

Regards,
Arnaud
> 
>>
>>>
>>>> For instance for stm32mp1 the stop corresponds to the reset on the remote processor core. To inform the coprocessor about an imminent shutdown we use a signal relying on a mailbox (cf. stm32_rproc_stop).
>>>> In this case we would need a delay between the signal and the reset, but not after (no cache management).
>>>
>>> Here I believe you are referring to the upper limit of 500ms that is
>>> needed for the mbox_send_message() in stm32_rproc_stop() to complete.
>>> Since that is a blocking call I think it would fit with Bjorn's
>>> proposal above if a value of '0' is returned by rproc->ops->panic().
>>> That would mean no further delays are needed (because the blocking
>>> mbox_send_message() would have done the job already).  Let me know if
>>> I'm in the weeds.
>> Yes you are :), this is what i thought, if delay implemented in core.
> 
> Not sure I understand your last reply but I _think_ we are saying the same
> thing.
> 
>>
>> Regards,
>> Arnaud
>>
>>>
>>>>
>>>> Regards,
>>>> Arnaud
>>>>>
>>>>> Regards,
>>>>> Bjorn
>>>>>
