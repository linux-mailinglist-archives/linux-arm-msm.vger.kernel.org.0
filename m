Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 09A021626AF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2020 14:01:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726707AbgBRNBn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Feb 2020 08:01:43 -0500
Received: from mail27.static.mailgun.info ([104.130.122.27]:47314 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726710AbgBRNBl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Feb 2020 08:01:41 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1582030900; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=zg7uOTNhl06Of6m/IGJ2JX7YMKlvKHRPMgNieOllFHI=; b=K+Db1tyMS9Hxx54ZpUlJ+nO1vsRok6I2B85nWyTlmCfdVwGE/flFm4+oo37T1K39W53UXrja
 aoivdm2hssmhnQ6K8RiNH66fzmEMgkVAhmpq1tmHjFsD4OU0/HlDHCgKJ2fzow9AyBSFcBsa
 EuQLo8ifyNHZsZgbBgQcW4ZHdg8=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e4be00f.7fec514f6ce0-smtp-out-n01;
 Tue, 18 Feb 2020 13:01:03 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D22AFC4479C; Tue, 18 Feb 2020 13:01:01 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.204.79.138] (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akdwived)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B5EF1C43383;
        Tue, 18 Feb 2020 13:00:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B5EF1C43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akdwived@codeaurora.org
Subject: Re: [PATCH v4 2/2] Embedded USB Debugger (EUD) driver
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ckadabi@codeaurora.org, tsoni@codeaurora.org,
        bryanh@codeaurora.org, psodagud@codeaurora.org,
        rnayak@codeaurora.org, satyap@codeaurora.org,
        pheragu@codeaurora.org
References: <1580445811-15948-1-git-send-email-akdwived@codeaurora.org>
 <1580445811-15948-3-git-send-email-akdwived@codeaurora.org>
 <20200203193533.GL3948@builder>
 <5808f959-f0fc-85be-4bfa-980b5311adeb@codeaurora.org>
 <20200218033542.GY955802@ripper>
From:   "Dwivedi, Avaneesh Kumar (avani)" <akdwived@codeaurora.org>
Message-ID: <6df14d5f-dbc7-22eb-e4b2-ac5973f6424f@codeaurora.org>
Date:   Tue, 18 Feb 2020 18:30:26 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200218033542.GY955802@ripper>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 2/18/2020 9:05 AM, Bjorn Andersson wrote:
> On Sun 16 Feb 06:14 PST 2020, Dwivedi, Avaneesh Kumar (avani) wrote:
>
>> Thank you very much Bjorn for your comments, will address them and post
>> latest patchset soon.
>>
>> On 2/4/2020 1:05 AM, Bjorn Andersson wrote:
>>> On Thu 30 Jan 20:43 PST 2020, Avaneesh Kumar Dwivedi wrote:
> [..]
>>>> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
>>>> index d0a73e7..6b7c9d0 100644
>>>> --- a/drivers/soc/qcom/Kconfig
>>>> +++ b/drivers/soc/qcom/Kconfig
>>>> @@ -202,4 +202,16 @@ config QCOM_APR
>>>>    	  application processor and QDSP6. APR is
>>>>    	  used by audio driver to configure QDSP6
>>>>    	  ASM, ADM and AFE modules.
>>>> +
>>>> +config QCOM_EUD
>>> Please aim for keeping the sort order in this file (ignore QCOM_APR
>>> which obviously is in the wrong place)
>> Please help to elaborate more, do you mean adding configs in alphabetical
>> order?
> Yes, we want to maintain alphabetical sort order of the config options
> in the Kconfig file. Unfortunately I must have missed this as I picked
> up QCOM_APR - hence my ask to add you entry further up, even if the
> order isn't perfect...
Ok
>
>>>> +       tristate "QTI Embedded USB Debugger (EUD)"
>>>> +       depends on ARCH_QCOM
>>>> +       help
>>>> +         The Embedded USB Debugger (EUD) driver is a driver for the
>>>> +         control peripheral which waits on events like USB attach/detach
>>>> +         and charger enable/disable. The control peripheral further helps
>>>> +         support the USB-based debug and trace capabilities.
>>>> +         This module enables support for Qualcomm Technologies, Inc.
>>>> +         Embedded USB Debugger (EUD).
>>>> +         If unsure, say N.
>>>>    endmenu
> [..]
>>>> +static ssize_t enable_store(struct device *dev,
>>>> +				struct device_attribute *attr,
>>>> +				const char *buf, size_t count)
>>>> +{
>>>> +	struct eud_chip *chip = dev_get_drvdata(dev);
>>>> +	int enable = 0;
>>> You shouldn't need to initialize this as you're checking the return
>>> value of sscanf().
>> OK
>>>> +	int ret = 0;
>>>> +
>>>> +	if (sscanf(buf, "%du", &enable) != 1)
>>>> +		return -EINVAL;
>>>> +
>>>> +	if (enable == EUD_ENABLE_CMD)
>>>> +		ret = enable_eud(chip);
>>> If ret is !0 you should probably return that, rather than count...
>> ok
>>>> +	else if (enable == EUD_DISABLE_CMD)
>>>> +		disable_eud(chip);
>>>> +	if (!ret)
>>> ...and then you don't need this check, or initialize ret to 0 above.
>> ok
>>>> +		chip->enable = enable;
>>> So if I write 42 to "enable" nothing will change in the hardware, but
>>> chip->enable will be 42...
>> will change enable struct member to bool?
> The problem I meant was hat if buf is "42", then you will hit the
> following code path:
>
> int ret = 0;
> sscanf(buf, "%du", &enable);
> chip->enable = 42;
>
> As enable isn't 1 or 0, neither conditional path is taken, but you still
> store the value in chip->enable.
>
> Changing enable to bool won't change this problem, adding an else and
> returning -EINVAL; would.
ok.
>>>> +	return count;
>>>> +}
>>>> +
>>>> +static DEVICE_ATTR_RW(enable);
> [..]
>>>> +static int msm_eud_probe(struct platform_device *pdev)
>>>> +{
>>>> +	struct eud_chip *chip;
>>>> +	struct resource *res;
>>>> +	int ret;
>>>> +
>>>> +	chip = devm_kzalloc(&pdev->dev, sizeof(*chip), GFP_KERNEL);
>>>> +	if (!chip)
>>>> +		return -ENOMEM;
>>>> +
>>>> +	chip->dev = &pdev->dev;
>>>> +	platform_set_drvdata(pdev, chip);
>>>> +
>>>> +	chip->extcon = devm_extcon_dev_allocate(&pdev->dev, eud_extcon_cable);
>>> Aren't we moving away from extcon in favor of the usb role switching
>>> thing?
>> i could see that usb role switch has been implemented for c type connector
>> and that connector is modeled as child of usb controller, but EUD is not a
>> true connector, it intercepts PHY signals and reroute it to USB controller
>> as per EUD Command issued by debug appliaction
>>
>> i am not sure if i need to implement EUD DT node as child of usb controller,
>> if i do so, as per my understanding EUD driver need to set USB controller
>> mode(host or device mode) by calling usb role switch API's, please let me
>> know if my understanding is correct?
>>
> I don't know how to properly represent this, but I would like the USB
> guys to chime in before merging something.

I will check with USB folks if they can give their opinion.

based on that will proceed.

>
>>>> +	if (IS_ERR(chip->extcon))
>>>> +		return PTR_ERR(chip->extcon);
>>>> +
> [..]
>>>> +static const struct of_device_id msm_eud_dt_match[] = {
>>>> +	{.compatible = "qcom,msm-eud"},
>>> Is this the one and only, past and future, version of the EUD hardware
>>> block? Or do we need this compatible to be more specific?
>> EUD h/w  IP is Qualcomm IP, As of now this is only hw IP available, if
>> future version of EUD IP comes, we can modify and add support then?
> You can add additional compatibles, but you can't change this one as
> existing devicetree files must continue to function.
>
> If you have a number of platforms that works with this very same
> implementation then you could make the binding require a specific
> platform and qcom,msm-eud (although qcom,eud should be enough?) and then
> keep the implementation as is.
>
> I.e. dt would say:
> 	compatible = "qcom,sc7180-eud", "qcom,eud";
>
> And driver would match on the latter only, for now.
Ok.
>
> Regards,
> Bjorn

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.
