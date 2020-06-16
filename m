Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C61221FA7F7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2020 06:53:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726569AbgFPExN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Jun 2020 00:53:13 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:55562 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725306AbgFPExM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Jun 2020 00:53:12 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1592283191; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=TnM1d+LijmPwv3QcoivuaXlgi9UGoODJljwXJ93Cqh0=; b=MobuaUej4PRZZ/UMM3bzi4zFH4jYnfCYuOJYBoevEmz+FQoNkIi25+o+8lwIXy02pIAXHRrO
 mYQqHgDt1BfyYhY6shqymMLk7TK0Uzb7lZutA5HhuqsbgYKIUFku6vfV1MlS6TYZ9bNsvaRZ
 7anTDeSFp6tBxLXzlNjp/Du6YVA=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n11.prod.us-west-2.postgun.com with SMTP id
 5ee8502aad153efa340722a2 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 16 Jun 2020 04:52:58
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id BE0E2C43387; Tue, 16 Jun 2020 04:52:58 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.206.24.160] (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sanm)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4E765C433C8;
        Tue, 16 Jun 2020 04:52:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4E765C433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sanm@codeaurora.org
Subject: Re: [PATCH v7 2/4] usb: dwc3: qcom: Add interconnect support in dwc3
 driver
To:     Matthias Kaehlcke <mka@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
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
From:   "Sandeep Maheswaram (Temp)" <sanm@codeaurora.org>
Message-ID: <3f8fcb0e-387d-e902-9f6b-1fde9d6ae404@codeaurora.org>
Date:   Tue, 16 Jun 2020 10:22:47 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200615194239.GW4525@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 6/16/2020 1:12 AM, Matthias Kaehlcke wrote:
> On Thu, Jun 04, 2020 at 04:16:31AM -0700, Stephen Boyd wrote:
>> Quoting Sandeep Maheswaram (Temp) (2020-06-04 02:43:09)
>>> On 6/3/2020 11:06 PM, Stephen Boyd wrote:
>>>> Quoting Sandeep Maheswaram (2020-03-31 22:15:43)
>>>>> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
>>>>> index 1dfd024..d33ae86 100644
>>>>> --- a/drivers/usb/dwc3/dwc3-qcom.c
>>>>> +++ b/drivers/usb/dwc3/dwc3-qcom.c
>>>>> @@ -285,6 +307,101 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom)
>>>>>           return 0;
>>>>>    }
>>>>>    
>>>>> +
>>>>> +/**
>>>>> + * dwc3_qcom_interconnect_init() - Get interconnect path handles
>>>>> + * @qcom:                      Pointer to the concerned usb core.
>>>>> + *
>>>>> + */
>>>>> +static int dwc3_qcom_interconnect_init(struct dwc3_qcom *qcom)
>>>>> +{
>>>>> +       struct device *dev = qcom->dev;
>>>>> +       int ret;
>>>>> +
>>>>> +       if (!device_is_bound(&qcom->dwc3->dev))
>>>>> +               return -EPROBE_DEFER;
>>>> How is this supposed to work? I see that this was added in an earlier
>>>> revision of this patch series but there isn't any mention of why
>>>> device_is_bound() is used here. It would be great if there was a comment
>>>> detailing why this is necessary. It sounds like maximum_speed is
>>>> important?
>>>>
>>>> Furthermore, dwc3_qcom_interconnect_init() is called by
>>>> dwc3_qcom_probe() which is the function that registers the device for
>>>> qcom->dwc3->dev. If that device doesn't probe between the time it is
>>>> registered by dwc3_qcom_probe() and this function is called then we'll
>>>> fail dwc3_qcom_probe() with -EPROBE_DEFER. And that will remove the
>>>> qcom->dwc3->dev device from the platform bus because we call
>>>> of_platform_depopulate() on the error path of dwc3_qcom_probe().
>>>>
>>>> So isn't this whole thing racy and can potentially lead us to a driver
>>>> probe loop where the wrapper (dwc3_qcom) and the core (dwc3) are probing
>>>> and we're trying to time it just right so that driver for dwc3 binds
>>>> before we setup interconnects? I don't know if dwc3 can communicate to
>>>> the wrapper but that would be more of a direct way to do this. Or maybe
>>>> the wrapper should try to read the DT property for maximum speed and
>>>> fallback to a worst case high bandwidth value if it can't figure it out
>>>> itself without help from dwc3 core.
>>>>
>>> This was added in V4 to address comments from Matthias in V3
>>>
>>> https://patchwork.kernel.org/patch/11148587/
>>>
>> Yes, that why I said:
>>
>> "I see that this was added in an earlier
>>   revision of this patch series but there isn't any mention of why
>>   device_is_bound() is used here. It would be great if there was a comment
>>   detailing why this is necessary. It sounds like maximum_speed is
>>   important?"
>>
>> Can you please respond to the rest of my email?
> I agree with Stephen that using device_is_bound() isn't a good option
> in this case, when I suggested it I wasn't looking at the big picture
> of how probing the core driver is triggered, sorry about that.
>
> Reading the speed from the DT with usb_get_maximum_speed() as Stephen
> suggests would be an option, the inconvenient is that we then
> essentially require the property to be defined, while the core driver
> gets a suitable value from hardware registers. Not sure if the wrapper
> driver could read from the same registers.
>
> One option could be to poll device_is_bound() for 100 ms (or so), with
> sleeps between polls. It's not elegant but would probably work if we
> don't find a better solution.
if (np)
         ret = dwc3_qcom_of_register_core(pdev);
     else
         ret = dwc3_qcom_acpi_register_core(pdev);

     if (ret) {
         dev_err(dev, "failed to register DWC3 Core, err=%d\n", ret);
         goto depopulate;
     }

     ret = dwc3_qcom_interconnect_init(qcom);
     if (ret)
         goto depopulate;

     qcom->mode = usb_get_dr_mode(&qcom->dwc3->dev);

Before calling dwc3_qcom_interconnect_init we are checking

     if (ret) {
         dev_err(dev, "failed to register DWC3 Core, err=%d\n", ret);
         goto depopulate;
     }

Doesn't  this condition confirm the core driver is probed?

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

