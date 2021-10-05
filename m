Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2A9E422154
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Oct 2021 10:54:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232884AbhJEIzu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Oct 2021 04:55:50 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:52481 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232365AbhJEIzt (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Oct 2021 04:55:49 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1633424039; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=XGvgtp0AX96gfU5biA7tguc9gNgcpbuj4vK8IW5EGAo=; b=JlK0gvzVtzowNhJrmcfHKl5/yeEOi6xZ0eocQJKt4pOPm6NNL38OqckqA/RIgdHqgJ/4IbrW
 2tsy/T75u2dwuAjl2+Bn3CIairtJkbF5MaqW3FWJhefFwTZVBXHgDs9YEBqlkc4OBi33JgbC
 VeWPi6ifBBcz7cqGBXKkE9bt59w=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 615c129247d64efb6deb23ff (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 05 Oct 2021 08:53:38
 GMT
Sender: mkshah=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A25E4C4360D; Tue,  5 Oct 2021 08:53:38 +0000 (UTC)
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 64CBBC4338F;
        Tue,  5 Oct 2021 08:53:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 64CBBC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH v9 1/5] dt-bindings: Introduce SoC sleep stats bindings
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     swboyd@chromium.org, mka@chromium.org, evgreen@chromium.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        agross@kernel.org, dianders@chromium.org, linux@roeck-us.net,
        rnayak@codeaurora.org, lsrao@codeaurora.org,
        Mahesh Sivasubramanian <msivasub@codeaurora.org>,
        devicetree@vger.kernel.org, Lina Iyer <ilina@codeaurora.org>
References: <1630906083-32194-1-git-send-email-mkshah@codeaurora.org>
 <1630906083-32194-2-git-send-email-mkshah@codeaurora.org>
 <YU5d4PhKRvF3wzGX@builder.lan>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <5d6fe646-5110-0fba-fc30-0ff7aad6de03@codeaurora.org>
Date:   Tue, 5 Oct 2021 14:23:30 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YU5d4PhKRvF3wzGX@builder.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 9/25/2021 4:53 AM, Bjorn Andersson wrote:
> On Mon 06 Sep 00:27 CDT 2021, Maulik Shah wrote:
> 
>> From: Mahesh Sivasubramanian <msivasub@codeaurora.org>
>>
>> Add device binding documentation for Qualcomm Technologies, Inc. (QTI)
>> SoC sleep stats driver. The driver is used for displaying SoC sleep
>> statistic maintained by Always On Processor or Resource Power Manager.
>>
>> Cc: devicetree@vger.kernel.org
>> Signed-off-by: Mahesh Sivasubramanian <msivasub@codeaurora.org>
>> Signed-off-by: Lina Iyer <ilina@codeaurora.org>
>> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
>> Reviewed-by: Rob Herring <robh@kernel.org>
>> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
>> ---
>>   .../bindings/soc/qcom/soc-sleep-stats.yaml         | 48 ++++++++++++++++++++++
>>   1 file changed, 48 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/soc/qcom/soc-sleep-stats.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/soc/qcom/soc-sleep-stats.yaml b/Documentation/devicetree/bindings/soc/qcom/soc-sleep-stats.yaml
>> new file mode 100644
>> index 0000000..4161156
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/soc/qcom/soc-sleep-stats.yaml
>> @@ -0,0 +1,48 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/soc/qcom/soc-sleep-stats.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Technologies, Inc. (QTI) SoC sleep stats bindings
>> +
>> +maintainers:
>> +  - Maulik Shah <mkshah@codeaurora.org>
>> +  - Lina Iyer <ilina@codeaurora.org>
> 
> Lina's address is no longer valid.

Removed in v10.

> 
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
>> +    aop_msgram@c3f0048 {
>> +      compatible = "qcom,rpmh-sleep-stats";
>> +      reg = <0x0c3f0048 0x400>;
> 
> As I tested this series I did find it quite odd that the start address
> of this block is $48 bytes into a page and still the length is an even
> $400.
> 
> Is there any single platform where qcom,rpmh-sleep-stats doesn't start
> at an offset of $48 from the beginning of its msgram? Could we move this
> number to the driver?
> 
> Regards,
> Bjorn

Sure, i have moved 0x48 into driver in v10.

Thanks,
Maulik

> 
>> +    };
>> +  # Example of rpm sleep stats
>> +  - |
>> +    rpm_msgram@4690000 {
>> +      compatible = "qcom,rpm-sleep-stats";
>> +      reg = <0x04690000 0x400>;
>> +    };
>> +...
>> -- 
>> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
>> of Code Aurora Forum, hosted by The Linux Foundation
>>

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member of Code Aurora Forum, hosted by The Linux Foundation
