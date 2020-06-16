Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 735511FA789
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2020 06:21:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725768AbgFPEVt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Jun 2020 00:21:49 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:26985 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725790AbgFPEVs (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Jun 2020 00:21:48 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1592281308; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=VBaa9anjVyZuOVcnVhJ3bee8Mi6f3nkfkVONvj0umUQ=; b=j3fwn+Z5C+43OvSWHCvHWHlOR3eOrOfJVYEnkthyNgVnQ2xjtzq8cXZdyO8YRlMAslmv9YMe
 fPNBrd4mpkPp5OMDT+U5mHd151SrCktnvzw5xFmDoisMFuvJCcRLJTtof/XqK7YF9KlTI+HY
 rUK6WFlwBiBTWJ5F0cztKsx4ygc=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 5ee848c76bebe35debb63552 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 16 Jun 2020 04:21:27
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id F2AEAC433A1; Tue, 16 Jun 2020 04:21:26 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.110.37.174] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 62303C433C8;
        Tue, 16 Jun 2020 04:21:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 62303C433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=wcheng@codeaurora.org
Subject: Re: [PATCH v2 4/6] regulator: Add support for QCOM PMIC VBUS booster
To:     Randy Dunlap <rdunlap@infradead.org>, robh+dt@kernel.org,
        heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        mark.rutland@arm.com, broonie@kernel.org, lgirdwood@gmail.com,
        agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        lijun.kernel@gmail.com, jackp@codeaurora.org,
        bryan.odonoghue@linaro.org
References: <20200612231918.8001-1-wcheng@codeaurora.org>
 <20200612231918.8001-5-wcheng@codeaurora.org>
 <6d23c903-abec-e2f8-1e63-c062211748c3@infradead.org>
From:   Wesley Cheng <wcheng@codeaurora.org>
Message-ID: <b8fe3da7-4494-7d7e-f5f1-f94826ebb831@codeaurora.org>
Date:   Mon, 15 Jun 2020 21:21:24 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <6d23c903-abec-e2f8-1e63-c062211748c3@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 6/12/2020 8:28 PM, Randy Dunlap wrote:
> On 6/12/20 4:19 PM, Wesley Cheng wrote:
>> diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
>> index 074a2ef55943..f9165f9f9051 100644
>> --- a/drivers/regulator/Kconfig
>> +++ b/drivers/regulator/Kconfig
>> @@ -797,6 +797,16 @@ config REGULATOR_QCOM_SPMI
>>  	  Qualcomm SPMI PMICs as a module. The module will be named
>>  	  "qcom_spmi-regulator".
>>  
>> +config REGULATOR_QCOM_USB_VBUS
>> +	tristate "Qualcomm USB Vbus regulator driver"
>> +	depends on SPMI || COMPILE_TEST
>> +	help
>> +	  If you say yes to this option, support will be included for the
>> +	  regulator used to enable the VBUS output.
>> +
>> +	  Say M here if you want to include support for enabling the VBUS output
>> +	  as a module. The module will be named "qcom_usb-regulator".
> 
> Hi,
> Shouldn't that module name match what is in the Makefile?
> 
> 

Thanks, Randy.  Missed this as I was going back and forth on the file
name.  Thanks for the catch.

>> +
>>  config REGULATOR_RC5T583
>>  	tristate "RICOH RC5T583 Power regulators"
>>  	depends on MFD_RC5T583
>> diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
>> index c0d6b96ebd78..cbab28aa7b56 100644
>> --- a/drivers/regulator/Makefile
>> +++ b/drivers/regulator/Makefile
>> @@ -89,6 +89,7 @@ obj-$(CONFIG_REGULATOR_QCOM_RPM) += qcom_rpm-regulator.o
>>  obj-$(CONFIG_REGULATOR_QCOM_RPMH) += qcom-rpmh-regulator.o
>>  obj-$(CONFIG_REGULATOR_QCOM_SMD_RPM) += qcom_smd-regulator.o
>>  obj-$(CONFIG_REGULATOR_QCOM_SPMI) += qcom_spmi-regulator.o
>> +obj-$(CONFIG_REGULATOR_QCOM_USB_VBUS) += qcom_usb_vbus-regulator.o
>>  obj-$(CONFIG_REGULATOR_PALMAS) += palmas-regulator.o
>>  obj-$(CONFIG_REGULATOR_PFUZE100) += pfuze100-regulator.o
>>  obj-$(CONFIG_REGULATOR_PV88060) += pv88060-regulator.o
> 
> 
> thanks.
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
