Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0579945B978
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Nov 2021 12:48:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241477AbhKXLv3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Nov 2021 06:51:29 -0500
Received: from m43-7.mailgun.net ([69.72.43.7]:42340 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241424AbhKXLv3 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Nov 2021 06:51:29 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1637754499; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: From: References: Cc: To: Subject: MIME-Version: Date:
 Message-ID: Sender; bh=y5dp9qVb16krcIhH4BFArhiY4mdSLBtL8aE/1Mp+shc=; b=GzuFjFLnMU7vlZakcW8TUeNXsUpMXDs18All40NH6SLT5hWMLDxfAVJWFiM5/O4qPykGDDu1
 /YtRVBmAsigRcFXTdBUX06bF/GIJz+y5X1lP3Ywo82T2yXRcJMl/hqTefcgCYyWgE5M3RsLU
 uzxKFssCLBdbfcV5LLh4a+yj2Dc=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 619e26831abc6f02d0d57358 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 24 Nov 2021 11:48:19
 GMT
Sender: rnayak=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 37AD1C4360C; Wed, 24 Nov 2021 11:48:19 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.1.100] (unknown [49.207.214.117])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0B6E0C4360D;
        Wed, 24 Nov 2021 11:48:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 0B6E0C4360D
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Message-ID: <d333bf45-e9e9-18e8-4c6d-deec7a7385a5@codeaurora.org>
Date:   Wed, 24 Nov 2021 17:18:12 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 2/4] arm64: dts: qcom: sc7280-crd: Add device tree files
 for CRD
Content-Language: en-US
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sboyd@codeaurora.org,
        dianders@chromium.org, kgodara@codeaurora.org
References: <1637650813-16654-1-git-send-email-rnayak@codeaurora.org>
 <1637650813-16654-3-git-send-email-rnayak@codeaurora.org>
 <YZ0TSeXddm+qGJ0/@google.com>
From:   Rajendra Nayak <rnayak@codeaurora.org>
In-Reply-To: <YZ0TSeXddm+qGJ0/@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 11/23/2021 9:44 PM, Matthias Kaehlcke wrote:
> On Tue, Nov 23, 2021 at 12:30:11PM +0530, Rajendra Nayak wrote:
>> CRD (Compute Reference Design) is a sc7280 based board, largely
>> derived from the existing IDP board design with some key deltas
>> 1. has EC and H1 over SPI similar to IDP2
>> 2. touchscreen and trackpad support
>> 3. eDP display
>>
>> We just add the barebones dts file here, subsequent patches will
>> add support for EC/H1 and other components.
>>
>> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
>> ---
>>   arch/arm64/boot/dts/qcom/Makefile       |  1 +
>>   arch/arm64/boot/dts/qcom/sc7280-crd.dts | 31 +++++++++++++++++++++++++++++++
>>   2 files changed, 32 insertions(+)
>>   create mode 100644 arch/arm64/boot/dts/qcom/sc7280-crd.dts
>>
>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
>> index 6b816eb..b18708c 100644
>> --- a/arch/arm64/boot/dts/qcom/Makefile
>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>> @@ -78,6 +78,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-r1-lte.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= sc7280-herobrine.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= sc7280-idp.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= sc7280-idp2.dtb
>> +dtb-$(CONFIG_ARCH_QCOM)	+= sc7280-crd.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= sdm630-sony-xperia-ganges-kirin.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= sdm630-sony-xperia-nile-discovery.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= sdm630-sony-xperia-nile-pioneer.dtb
>> diff --git a/arch/arm64/boot/dts/qcom/sc7280-crd.dts b/arch/arm64/boot/dts/qcom/sc7280-crd.dts
>> new file mode 100644
>> index 0000000..09d02c2
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/sc7280-crd.dts
>> @@ -0,0 +1,31 @@
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +/*
>> + * sc7280 CRD board device tree source
>> + *
>> + * Copyright (c) 2021, The Linux Foundation. All rights reserved.
>> + */
>> +
>> +/dts-v1/;
>> +
>> +#include "sc7280-idp.dtsi"
>> +
>> +/ {
>> +	model = "Qualcomm Technologies, Inc. sc7280 CRD platform";
>> +	compatible = "qcom,sc7280-crd", "google,hoglin-rev0", "qcom,sc7280";
> 
> As per my comment on the binding there should also be a "google,hoglin"
> without a revision suffix, also it seems there are already CRDs with higher
> rev numbers.

right i will remove the -revs for now.

> 
>> +
>> +	aliases {
>> +		serial0 = &uart5;
>> +	};
>> +
>> +	chosen {
>> +		stdout-path = "serial0:115200n8";
>> +	};
>> +};
>> +
>> +&nvme_pwren {
>> +	pins = "gpio51";
>> +};
>> +
>> +&nvme_3v3_regulator {
>> +	gpio = <&tlmm 51 GPIO_ACTIVE_HIGH>;
>> +};
> 
> uber-nit: 'nvme_3v3_regulator' should be before 'nvme_pwren', assuming
> alphabetical/ASCII ordering is used.

thanks will fix
> 

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
