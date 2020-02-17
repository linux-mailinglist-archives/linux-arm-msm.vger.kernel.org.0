Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BCA2C160B82
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2020 08:22:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726646AbgBQHWD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Feb 2020 02:22:03 -0500
Received: from mail27.static.mailgun.info ([104.130.122.27]:46872 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726026AbgBQHWD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Feb 2020 02:22:03 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1581924122; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=RVXzwdCbtUWEWBOIihoNF8UhzVKLa7Q1JGTDr4FkWw8=; b=dNPg46kAIg9i/bAc90rb0nkoiKBxyds1JEH2MXGe3l4KhzdgHv7/zVXqAUFPrTQUu/8UqVVk
 jB8mejIsndnCH5af+pDD57gw/KaoO3Fx0/W4EmLb6fqY+WINnPHe1NwU2PglhXRCzZ865XXj
 JztJ03+ygaxdNQevCDY0BmNNwL8=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e4a3f19.7f4a237e7d50-smtp-out-n01;
 Mon, 17 Feb 2020 07:22:01 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C76E0C4479C; Mon, 17 Feb 2020 07:22:01 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.100] (unknown [103.140.231.108])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akdwived)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B0638C43383;
        Mon, 17 Feb 2020 07:21:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B0638C43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akdwived@codeaurora.org
Subject: Re: [PATCH v4 2/2] Embedded USB Debugger (EUD) driver
To:     Greg KH <greg@kroah.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ckadabi@codeaurora.org, tsoni@codeaurora.org,
        bryanh@codeaurora.org, psodagud@codeaurora.org,
        rnayak@codeaurora.org, satyap@codeaurora.org,
        pheragu@codeaurora.org
References: <1580445811-15948-1-git-send-email-akdwived@codeaurora.org>
 <1580445811-15948-3-git-send-email-akdwived@codeaurora.org>
 <20200207100438.GA627905@kroah.com>
 <06d21fa5-0115-9478-5cf1-e710446f8311@codeaurora.org>
 <20200216163554.GA48157@kroah.com>
From:   "Dwivedi, Avaneesh Kumar (avani)" <akdwived@codeaurora.org>
Message-ID: <018ad503-8959-f2be-f4d1-fd06ff24417a@codeaurora.org>
Date:   Mon, 17 Feb 2020 12:51:52 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200216163554.GA48157@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 2/16/2020 10:05 PM, Greg KH wrote:
> On Sun, Feb 16, 2020 at 09:52:19PM +0530, Dwivedi, Avaneesh Kumar (avani) wrote:
>> On 2/7/2020 3:34 PM, Greg KH wrote:
>>> On Fri, Jan 31, 2020 at 10:13:31AM +0530, Avaneesh Kumar Dwivedi wrote:
>>>> Add support for control peripheral of EUD (Embedded USB Debugger) to
>>>> listen to events such as USB attach/detach, charger enable/disable, pet
>>>> EUD to indicate software is functional. Reusing the platform device kobj,
>>>> sysfs entry 'enable' is created to enable or disable EUD.
>>>>
>>>> Signed-off-by: Satya Durga Srinivasu Prabhala <satyap@codeaurora.org>
>>>> Signed-off-by: Prakruthi Deepak Heragu <pheragu@codeaurora.org>
>>>> Signed-off-by: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
>>>> ---
>>>>    Documentation/ABI/stable/sysfs-driver-msm-eud |   5 +
>>>>    drivers/soc/qcom/Kconfig                      |  12 +
>>>>    drivers/soc/qcom/Makefile                     |   1 +
>>>>    drivers/soc/qcom/eud.c                        | 329 ++++++++++++++++++++++++++
>>>>    4 files changed, 347 insertions(+)
>>>>    create mode 100644 Documentation/ABI/stable/sysfs-driver-msm-eud
>>>>    create mode 100644 drivers/soc/qcom/eud.c
>>>>
>>>> diff --git a/Documentation/ABI/stable/sysfs-driver-msm-eud b/Documentation/ABI/stable/sysfs-driver-msm-eud
>>>> new file mode 100644
>>>> index 0000000..d96ae05
>>>> --- /dev/null
>>>> +++ b/Documentation/ABI/stable/sysfs-driver-msm-eud
>>>> @@ -0,0 +1,5 @@
>>>> +What:           /sys/bus/platform/drivers/msm-eud/enable
>>>> +Date:           Jan 2020
>>>> +Contact:        Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
>>>> +Description:    Enable/Disable use of eud device.
>>> What are valid values to be used here?
>> it should be bool variable relying on 0 or 1.
> Then document it.
OK
>
>>>> +Users:          User space debug application which intend to use EUD h/w block.
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
>>>> +       tristate "QTI Embedded USB Debugger (EUD)"
>>>> +       depends on ARCH_QCOM
>>> Why not let everyone test build this?
>> EUD is Qualcomm IP, shall not it be associated with ARCH_QCOM?
> No, why can't everyone buid it for testing?  What about when I want to
> build a generic arm64 kernel to run on multiple SoCs?
>
> Do not put dependancies in here that you really do not have.  There's no
> reason for this to be limited to that one chip, right?  And if you allow
> others to build the code, you will get proper bug reports when things
> break, and others will fix them, which is what you want.
>
> I think the ARCH_RANDOM_SOC_NAME is totally broken and needs to be, at
> most, just an arch-specific thing, if even that.
>
> Look at almost all other kernel drivers, they do not have those types of
> dependancies.
Will check and address concerns.
>
>>>> +	chip = devm_kzalloc(&pdev->dev, sizeof(*chip), GFP_KERNEL);
>>>> +	if (!chip)
>>>> +		return -ENOMEM;
>>>> +
>>>> +	chip->dev = &pdev->dev;
>>> No reference counting???
>> you mean get/put_device?
> yes.
>
> thanks,
>
> greg k-h
Thank you very much Greg for your time to review.

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.
