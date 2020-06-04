Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0D131EE1A5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2020 11:43:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728083AbgFDJnb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Jun 2020 05:43:31 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:31994 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726299AbgFDJna (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Jun 2020 05:43:30 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1591263809; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=ptxzvOIILTUUiR4YCCWVTeqV1s61jkQ9pE3WHk/M/wg=; b=c6rSAyt27X58Tp7SGjgklexYNbJ9i3puc2ryO8wxm2SrB53ffLgAN6zXhaSEm6t7HjZ69a2B
 tJsAW7Udfbq92yxwpAcj8foX7ooSLpxWhCT5+3hH5YodZ7xu9JTEzQsb+/pSvuJYizE8nHU4
 dhnOioMrd75+3WS4WlY59dbmsR0=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n14.prod.us-east-1.postgun.com with SMTP id
 5ed8c23676fccbb4c8c9b655 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 04 Jun 2020 09:43:18
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B7140C43387; Thu,  4 Jun 2020 09:43:17 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.206.24.160] (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sanm)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 87E81C433C6;
        Thu,  4 Jun 2020 09:43:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 87E81C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sanm@codeaurora.org
Subject: Re: [PATCH v7 2/4] usb: dwc3: qcom: Add interconnect support in dwc3
 driver
To:     Stephen Boyd <swboyd@chromium.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Doug Anderson <dianders@chromium.org>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>,
        Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
References: <1585718145-29537-1-git-send-email-sanm@codeaurora.org>
 <1585718145-29537-3-git-send-email-sanm@codeaurora.org>
 <159120577830.69627.13288547914742515702@swboyd.mtv.corp.google.com>
From:   "Sandeep Maheswaram (Temp)" <sanm@codeaurora.org>
Message-ID: <d9ccf188-4f00-d3ac-ba0f-73f06c087553@codeaurora.org>
Date:   Thu, 4 Jun 2020 15:13:09 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <159120577830.69627.13288547914742515702@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 6/3/2020 11:06 PM, Stephen Boyd wrote:
> Quoting Sandeep Maheswaram (2020-03-31 22:15:43)
>> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
>> index 1dfd024..d33ae86 100644
>> --- a/drivers/usb/dwc3/dwc3-qcom.c
>> +++ b/drivers/usb/dwc3/dwc3-qcom.c
>> @@ -76,8 +85,13 @@ struct dwc3_qcom {
>>          enum usb_dr_mode        mode;
>>          bool                    is_suspended;
>>          bool                    pm_suspended;
>> +       struct icc_path         *usb_ddr_icc_path;
>> +       struct icc_path         *apps_usb_icc_path;
>>   };
>>   
>> +static int dwc3_qcom_interconnect_enable(struct dwc3_qcom *qcom);
>> +static int dwc3_qcom_interconnect_disable(struct dwc3_qcom *qcom);
> Please get rid of these. We shouldn't need forward declarations.
Will do in next version.
>
>> +
>>   static inline void dwc3_qcom_setbits(void __iomem *base, u32 offset, u32 val)
>>   {
>>          u32 reg;
>> @@ -285,6 +307,101 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom)
>>          return 0;
>>   }
>>   
>> +
>> +/**
>> + * dwc3_qcom_interconnect_init() - Get interconnect path handles
>> + * @qcom:                      Pointer to the concerned usb core.
>> + *
>> + */
>> +static int dwc3_qcom_interconnect_init(struct dwc3_qcom *qcom)
>> +{
>> +       struct device *dev = qcom->dev;
>> +       int ret;
>> +
>> +       if (!device_is_bound(&qcom->dwc3->dev))
>> +               return -EPROBE_DEFER;
> How is this supposed to work? I see that this was added in an earlier
> revision of this patch series but there isn't any mention of why
> device_is_bound() is used here. It would be great if there was a comment
> detailing why this is necessary. It sounds like maximum_speed is
> important?
>
> Furthermore, dwc3_qcom_interconnect_init() is called by
> dwc3_qcom_probe() which is the function that registers the device for
> qcom->dwc3->dev. If that device doesn't probe between the time it is
> registered by dwc3_qcom_probe() and this function is called then we'll
> fail dwc3_qcom_probe() with -EPROBE_DEFER. And that will remove the
> qcom->dwc3->dev device from the platform bus because we call
> of_platform_depopulate() on the error path of dwc3_qcom_probe().
>
> So isn't this whole thing racy and can potentially lead us to a driver
> probe loop where the wrapper (dwc3_qcom) and the core (dwc3) are probing
> and we're trying to time it just right so that driver for dwc3 binds
> before we setup interconnects? I don't know if dwc3 can communicate to
> the wrapper but that would be more of a direct way to do this. Or maybe
> the wrapper should try to read the DT property for maximum speed and
> fallback to a worst case high bandwidth value if it can't figure it out
> itself without help from dwc3 core.
>
This was added in V4 to address comments from Matthias in V3

https://patchwork.kernel.org/patch/11148587/

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

