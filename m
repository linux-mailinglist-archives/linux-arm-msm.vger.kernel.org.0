Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CECA62165C0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2020 07:11:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727097AbgGGFLq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jul 2020 01:11:46 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:14135 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727046AbgGGFLq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jul 2020 01:11:46 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1594098704; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=iJ1b9PLO/bxp0y4unq/jkiqf45yay0HTXCX57824wro=; b=mySypNmQd4MxUoGZ/zG9weQltQiaRoR40tRpoQMWX3hbYaN9whNUQAJRURZxBW6hgZuxPn0F
 k5NDBkbRGme+wTq1psTtya0RfVsXLYP3YAlIJb3ffYCc5c1o/bq4+KzVzC7xmo+tn/j2G8cV
 Mi7lesV72ujvPMgWt4p5uEeydLI=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n11.prod.us-east-1.postgun.com with SMTP id
 5f04040419b27ae9ce6ec779 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 07 Jul 2020 05:11:32
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C4733C4339C; Tue,  7 Jul 2020 05:11:31 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.206.24.160] (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sanm)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A1516C433C6;
        Tue,  7 Jul 2020 05:11:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A1516C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sanm@codeaurora.org
Subject: Re: [PATCH v7 2/4] usb: dwc3: qcom: Add interconnect support in dwc3
 driver
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Stephen Boyd <swboyd@chromium.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Doug Anderson <dianders@chromium.org>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>,
        Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
References: <1585718145-29537-1-git-send-email-sanm@codeaurora.org>
 <1585718145-29537-3-git-send-email-sanm@codeaurora.org>
 <159120577830.69627.13288547914742515702@swboyd.mtv.corp.google.com>
 <d9ccf188-4f00-d3ac-ba0f-73f06c087553@codeaurora.org>
 <159126939154.69627.13027312816468830595@swboyd.mtv.corp.google.com>
 <20200615194239.GW4525@google.com>
 <3f8fcb0e-387d-e902-9f6b-1fde9d6ae404@codeaurora.org>
 <20200616203849.GY4525@google.com> <20200630224243.GH39073@google.com>
From:   "Sandeep Maheswaram (Temp)" <sanm@codeaurora.org>
Message-ID: <8ac28471-7c0a-1850-6560-50da0d734445@codeaurora.org>
Date:   Tue, 7 Jul 2020 10:41:24 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200630224243.GH39073@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 7/1/2020 4:12 AM, Matthias Kaehlcke wrote:
> On Tue, Jun 16, 2020 at 01:38:49PM -0700, Matthias Kaehlcke wrote:
>> On Tue, Jun 16, 2020 at 10:22:47AM +0530, Sandeep Maheswaram (Temp) wrote:
>>> On 6/16/2020 1:12 AM, Matthias Kaehlcke wrote:
>>>> On Thu, Jun 04, 2020 at 04:16:31AM -0700, Stephen Boyd wrote:
>>>>> Quoting Sandeep Maheswaram (Temp) (2020-06-04 02:43:09)
>>>>>> On 6/3/2020 11:06 PM, Stephen Boyd wrote:
>>>>>>> Quoting Sandeep Maheswaram (2020-03-31 22:15:43)
>>>>>>>> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
>>>>>>>> index 1dfd024..d33ae86 100644
>>>>>>>> --- a/drivers/usb/dwc3/dwc3-qcom.c
>>>>>>>> +++ b/drivers/usb/dwc3/dwc3-qcom.c
>>>>>>>> @@ -285,6 +307,101 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom)
>>>>>>>>            return 0;
>>>>>>>>     }
>>>>>>>> +
>>>>>>>> +/**
>>>>>>>> + * dwc3_qcom_interconnect_init() - Get interconnect path handles
>>>>>>>> + * @qcom:                      Pointer to the concerned usb core.
>>>>>>>> + *
>>>>>>>> + */
>>>>>>>> +static int dwc3_qcom_interconnect_init(struct dwc3_qcom *qcom)
>>>>>>>> +{
>>>>>>>> +       struct device *dev = qcom->dev;
>>>>>>>> +       int ret;
>>>>>>>> +
>>>>>>>> +       if (!device_is_bound(&qcom->dwc3->dev))
>>>>>>>> +               return -EPROBE_DEFER;
>>>>>>> How is this supposed to work? I see that this was added in an earlier
>>>>>>> revision of this patch series but there isn't any mention of why
>>>>>>> device_is_bound() is used here. It would be great if there was a comment
>>>>>>> detailing why this is necessary. It sounds like maximum_speed is
>>>>>>> important?
>>>>>>>
>>>>>>> Furthermore, dwc3_qcom_interconnect_init() is called by
>>>>>>> dwc3_qcom_probe() which is the function that registers the device for
>>>>>>> qcom->dwc3->dev. If that device doesn't probe between the time it is
>>>>>>> registered by dwc3_qcom_probe() and this function is called then we'll
>>>>>>> fail dwc3_qcom_probe() with -EPROBE_DEFER. And that will remove the
>>>>>>> qcom->dwc3->dev device from the platform bus because we call
>>>>>>> of_platform_depopulate() on the error path of dwc3_qcom_probe().
>>>>>>>
>>>>>>> So isn't this whole thing racy and can potentially lead us to a driver
>>>>>>> probe loop where the wrapper (dwc3_qcom) and the core (dwc3) are probing
>>>>>>> and we're trying to time it just right so that driver for dwc3 binds
>>>>>>> before we setup interconnects? I don't know if dwc3 can communicate to
>>>>>>> the wrapper but that would be more of a direct way to do this. Or maybe
>>>>>>> the wrapper should try to read the DT property for maximum speed and
>>>>>>> fallback to a worst case high bandwidth value if it can't figure it out
>>>>>>> itself without help from dwc3 core.
>>>>>>>
>>>>>> This was added in V4 to address comments from Matthias in V3
>>>>>>
>>>>>> https://patchwork.kernel.org/patch/11148587/
>>>>>>
>>>>> Yes, that why I said:
>>>>>
>>>>> "I see that this was added in an earlier
>>>>>    revision of this patch series but there isn't any mention of why
>>>>>    device_is_bound() is used here. It would be great if there was a comment
>>>>>    detailing why this is necessary. It sounds like maximum_speed is
>>>>>    important?"
>>>>>
>>>>> Can you please respond to the rest of my email?
>>>> I agree with Stephen that using device_is_bound() isn't a good option
>>>> in this case, when I suggested it I wasn't looking at the big picture
>>>> of how probing the core driver is triggered, sorry about that.
>>>>
>>>> Reading the speed from the DT with usb_get_maximum_speed() as Stephen
>>>> suggests would be an option, the inconvenient is that we then
>>>> essentially require the property to be defined, while the core driver
>>>> gets a suitable value from hardware registers. Not sure if the wrapper
>>>> driver could read from the same registers.
>>>>
>>>> One option could be to poll device_is_bound() for 100 ms (or so), with
>>>> sleeps between polls. It's not elegant but would probably work if we
>>>> don't find a better solution.
>>> if (np)
>>>          ret = dwc3_qcom_of_register_core(pdev);
>>>      else
>>>          ret = dwc3_qcom_acpi_register_core(pdev);
>>>
>>>      if (ret) {
>>>          dev_err(dev, "failed to register DWC3 Core, err=%d\n", ret);
>>>          goto depopulate;
>>>      }
>>>
>>>      ret = dwc3_qcom_interconnect_init(qcom);
>>>      if (ret)
>>>          goto depopulate;
>>>
>>>      qcom->mode = usb_get_dr_mode(&qcom->dwc3->dev);
>>>
>>> Before calling dwc3_qcom_interconnect_init we are checking
>>>
>>>      if (ret) {
>>>          dev_err(dev, "failed to register DWC3 Core, err=%d\n", ret);
>>>          goto depopulate;
>>>      }
>>>
>>> Doesn't  this condition confirm the core driver is probed?
>> Not really:
>>
>> // called under the hood by of_platform_populate()
>> static int really_probe(struct device *dev, struct device_driver *drv)
>> {
>> 	...
>>
>> 	if (dev->bus->probe) {
>> 		ret = dev->bus->probe(dev);
>> 		if (ret)
>> 			goto probe_failed;
>> 	} else if (drv->probe) {
>> 		ret = drv->probe(dev);
>> 	        if (ret)
>> 	       		goto probe_failed;
>>          }
>>
>> 	...
>>
>> probe_failed:
>> 	...
>>
>> 	/*
>>           * Ignore errors returned by ->probe so that the next driver can try
>>           * its luck.
>>           */
>>          ret = 0;
>>
>> 	...
>>
>> 	return ret;
>> }
>>
>> As a result of_platform_populate() in dwc3_qcom_of_register_core()
>> returns 0 even when probing the device failed:
>>
>> [    0.244339] dwc3-qcom a6f8800.usb: DBG: populate
>> [    0.244772] dwc3 a600000.dwc3: DBG: dwc3_probe
>> [    0.245237] dwc3 a600000.dwc3: DBG: dwc3_probe err: -517
>> [    0.245264] dwc3-qcom a6f8800.usb: DBG: populate (done)
>> [    0.245317] dwc3-qcom a6f8800.usb: DBG: dwc3_qcom_interconnect_init() failed: -517
>>
>> Probe fails because the interconnect stuff isn't ready yet, otherwise
>> it could access invalid data.
>>
>> A later _populate() is successful and the probing of the core is done
>> synchronously, i.e. after _populate() the core driver is fully
>> initialized:
>>
>> [    3.898106] dwc3-qcom a6f8800.usb: DBG: populate
>> [    3.908356] dwc3 a600000.dwc3: DBG: dwc3_probe
>> [    4.205104] dwc3 a600000.dwc3: DBG: dwc3_probe (done)
>> [    4.210305] dwc3-qcom a6f8800.usb: DBG: populate (done)
>>
>> The synchronous probing in _populate() suggests that using device_is_bound()
>> would actually be a valid option, either the core device was successfully
>> probed or not, there should be no race.
>>
>> I sent a patch that adds this check to dwc3_qcom_of_register_core(), which
>> is less confusing and makes clear that the core device is valid unless
>> this function returns an error:
>>
>>    https://lore.kernel.org/patchwork/patch/1257279/
>>
>> It might make sense to add your "driver core:Export the symbol
>> device_is_bound" patch, mine and this one to a single series.
>  From the discussion on "driver core:Export the symbol device_is_bound"
> (https://patchwork.kernel.org/patch/11584225/) it is clear that
> this won't fly. The split dwc3 driver is considered a broken
> design.
>
> This is what Rob Herring said:
>
>    We never should have had this split either in the DT binding nor
>    driver(s) as if the SoC wrapper crap and licensed IP block are
>    independent things. The thing to do here is either make the DWC3 code
>    a library which drivers call (e.g. SDHCI) or add hooks into the DWC3
>    driver for platform specifics (e.g. Designware PCI). Neither is a
>    simple solution though.
>
> That seems to be the desirable solution in the longer term, but it
> doesn't seem reasonable to me to expect you to fix this design issue
> to add interconnect support.
>
> Some possible options to move forward:
>
> - try to determine the max speed without involving the core device
> - select a reasonable default when 'maximum-speed' is not specified
> - use the core device to determine the max speed and pray

Can we do as below to get speed

qcom->max_speed = usb_get_maximum_speed(&qcom->dwc3->dev);

as they were doing similarly in below code to get mode

qcom->mode = usb_get_dr_mode(&qcom->dwc3->dev);

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

