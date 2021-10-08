Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23804426639
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Oct 2021 10:50:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229853AbhJHIwt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Oct 2021 04:52:49 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:38970 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229673AbhJHIwr (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Oct 2021 04:52:47 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1633683052; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=ssTCzAJW4KsbNSp7XkqqLGqNhNhRH4PblSGftvSlO10=; b=Jsq5+iTLC+kp1LymT9ivOxZcsauKntQXUC/A9vDfPP0VQijPiPriTebetaKSAwnVrVAFgZRH
 AO2vNzFwJ9/ubhFwAHln03/Mw0qCAHckG/Bvhplmm2Kf+HV8+FxaZOErL6VQNjgq2yioalxl
 yfi6wXXmCJe5uNVovChZJ5cGDmw=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 6160065a446c6db0cb94b58d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 08 Oct 2021 08:50:34
 GMT
Sender: mkshah=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 45283C43460; Fri,  8 Oct 2021 08:50:33 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [192.168.29.129] (unknown [49.36.85.177])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C2662C4338F;
        Fri,  8 Oct 2021 08:50:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org C2662C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH v11 1/5] dt-bindings: Introduce QCOM Sleep stats bindings
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     swboyd@chromium.org, mka@chromium.org, evgreen@chromium.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, agross@kernel.org,
        dianders@chromium.org, linux@roeck-us.net, rnayak@codeaurora.org,
        lsrao@codeaurora.org, devicetree@vger.kernel.org
References: <1633600649-7164-1-git-send-email-mkshah@codeaurora.org>
 <1633600649-7164-2-git-send-email-mkshah@codeaurora.org>
 <YV9PN1JNPhVQb8jN@gerhold.net>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <b4c26217-67b1-516a-325f-a58e321c4e09@codeaurora.org>
Date:   Fri, 8 Oct 2021 14:20:24 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YV9PN1JNPhVQb8jN@gerhold.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Stephan,

On 10/8/2021 1:20 AM, Stephan Gerhold wrote:
> On Thu, Oct 07, 2021 at 03:27:25PM +0530, Maulik Shah wrote:
>> From: Mahesh Sivasubramanian <msivasub@codeaurora.org>
>>
>> Add device binding documentation for Qualcomm Technologies, Inc. (QTI)
>> Sleep stats driver. The driver is used for displaying Sleep statistic maintained
>> by Always On Processor or Resource Power Manager.
>>
>> Cc: devicetree@vger.kernel.org
>> Signed-off-by: Mahesh Sivasubramanian <msivasub@codeaurora.org>
>> Signed-off-by: Lina Iyer <ilina@codeaurora.org>
>> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
>> Reviewed-by: Rob Herring <robh@kernel.org>
>> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
>> ---
>>   .../bindings/soc/qcom/qcom-sleep-stats.yaml        | 47 ++++++++++++++++++++++
>>   1 file changed, 47 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom-sleep-stats.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom-sleep-stats.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom-sleep-stats.yaml
>> new file mode 100644
>> index 0000000..5213daf
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom-sleep-stats.yaml
>> @@ -0,0 +1,47 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/soc/qcom/qcom-sleep-stats.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Technologies, Inc. (QTI) Sleep stats bindings
>> +
>> +maintainers:
>> +  - Maulik Shah <mkshah@codeaurora.org>
>> +
>> +description:
>> +  Always On Processor/Resource Power Manager maintains statistics of the SoC
>> +  sleep modes involving powering down of the rails and oscillator clock.
>> +
>> +  Statistics includes SoC sleep mode type, number of times low power mode were
>> +  entered, time of last entry, time of last exit and accumulated sleep duration.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - qcom,rpmh-sleep-stats
>> +      - qcom,rpm-sleep-stats
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  # Example of rpmh sleep stats
>> +  - |
>> +    sram@c3f0000 {
>> +      compatible = "qcom,rpmh-sleep-stats";
>> +      reg = <0x0c3f0000 0x400>;
>> +    };
>> +  # Example of rpm sleep stats
>> +  - |
>> +    sram@4690000 {
>> +      compatible = "qcom,rpm-sleep-stats";
>> +      reg = <0x04690000 0x400>;
>> +    };
> 
> Does this region really only contain "rpm-*sleep*-stats"? AFAICT this is
> really a more generic memory region where various offsets are read from.

Right the area contains all kind of sleep stats/logs.

> 
> These are all the offsets in msm8998-pm.dtsi downstream [1]:
>    ...9000c: rpm-rail-stats offset
>    ...90014: rpm-sleep-stats offset (RPM_DYNAMIC_ADDR in your driver)
>    ...90018: rpm-log offset
>    ...9001c: "RPM FREE HEAP SPACE"
> 
> How would you set up any of the other drivers if the entire region
> is declared as "rpm-sleep-stats"?

We don't need to setup other drivers.
The idea is to have single stats driver (qcom_sleep_stats) that can be 
enahanced to to read other stats also on both RPM/ PRMH targets.

Today this driver reads only sleep stats from offset 0x90014.
if in future say, we want to read rpm-rail-stats from offset 0x9000c 
then it can be added in the existing driver.

In the rpm data, add one more entry to indicate reading rpm-rail-stats,
something like below and add new compatible flag for the target, may be
"qcom,rpm-sleep-stats-legacy" and should work like,

#define RPM_RAIL_STATS_ADDR 0xc

static const struct stats_config rpm_data = {
         .stats_offset = 0,
         .num_records = 2,
         .appended_stats_avail = true,
         .dynamic_offset = true,
         .rpm_rail_stats = true,
};

and check in driver probe like

         if (config->rpm_rail_stats) {
	//create rpm rail stats related files.
         }

Similarly for other rpm-logs / any other stats can be added in same driver.

Hope this clarifies.

> 
> Perhaps this region should have a more generic name that represents what
> it actually is and not only one of the information it contains, similar
> to "qcom,rpm-msg-ram"?

sram looks good to me. Actually on RPM targets its RPM data ram and RPMH 
targets its msgram. To keep the name common sram is used here.

Thanks,
Maulik

> 
> Thanks,
> Stephan
> 
> [1]: https://source.codeaurora.org/quic/la/kernel/msm-4.4/tree/arch/arm/boot/dts/qcom/msm8998-pm.dtsi?h=LA.UM.8.4.1.c25#n271
> 

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member of Code Aurora Forum, hosted by The Linux Foundation
