Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D55141F72C1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2020 06:15:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726387AbgFLEPs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Jun 2020 00:15:48 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:26622 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725845AbgFLEPs (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Jun 2020 00:15:48 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1591935347; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=qOBjRzQMndVJEIv6uF7Wx6Dgh2zeX7Iww1fuxfR2S3I=; b=d+1yXJrMGA3GTsrMeQxj9ehn1rDROWmgWRHtufDYo9WFKveqHwSfdG4v8rRcKst3CHBG7UZf
 Wd46JNU3Mc2aQo+itBcdBaHKwkYgmkffrFjnR6DN1Q7RFl26ppvYJvya771C7jPPCsruiMtx
 cQu3J1zt8iPtiUfrmc01BnlAJDo=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n08.prod.us-west-2.postgun.com with SMTP id
 5ee301595866879c7691efbc (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 12 Jun 2020 04:15:21
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 8B986C43395; Fri, 12 Jun 2020 04:15:21 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.110.17.171] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3145FC433CB;
        Fri, 12 Jun 2020 04:15:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3145FC433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=wcheng@codeaurora.org
Subject: Re: [PATCH 1/3] usb: typec: Add QCOM PMIC typec detection driver
To:     Randy Dunlap <rdunlap@infradead.org>,
        heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        mark.rutland@arm.com, robh+dt@kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        jackp@codeaurora.org, bryan.odonoghue@linaro.org
References: <20200609205851.30113-1-wcheng@codeaurora.org>
 <20200609205851.30113-2-wcheng@codeaurora.org>
 <ccfc3e7c-d1ce-27bd-b24c-df5fbc468449@infradead.org>
From:   Wesley Cheng <wcheng@codeaurora.org>
Message-ID: <47651298-f94c-c487-d346-41abfb8a80a7@codeaurora.org>
Date:   Thu, 11 Jun 2020 21:15:19 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <ccfc3e7c-d1ce-27bd-b24c-df5fbc468449@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 6/9/2020 2:20 PM, Randy Dunlap wrote:
> On 6/9/20 1:58 PM, Wesley Cheng wrote:
>> diff --git a/drivers/usb/typec/Kconfig b/drivers/usb/typec/Kconfig
>> index 559dd06..8de2520 100644
>> --- a/drivers/usb/typec/Kconfig
>> +++ b/drivers/usb/typec/Kconfig
>> @@ -73,6 +73,17 @@ config TYPEC_TPS6598X
>>  	  If you choose to build this driver as a dynamically linked module, the
>>  	  module will be called tps6598x.ko.
>>
> 
> Hi,
> Please spell "Type-C" like all of the other drivers do.
> 
>> +config TYPEC_QCOM_PMIC
>> +	tristate "Qualcomm PMIC USB typec driver"
>> +	depends on ARCH_QCOM
>> +	help
>> +	  Driver for supporting role switch over the Qualcomm PMIC.  This will
>> +	  handle the type C role and orientation detection reported by the QCOM
>> +	  PMIC if the PMIC has the capability to handle type C detection.
>> +
>> +	  It will also enable the VBUS output to connected devices when a
>> +	  DFP connection is made.
>> +
>>  source "drivers/usb/typec/mux/Kconfig"
>>  
>>  source "drivers/usb/typec/altmodes/Kconfig"

Hi Randy,

Will do.

Thanks
> 
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
