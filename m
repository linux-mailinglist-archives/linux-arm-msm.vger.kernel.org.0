Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D841F354CD1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Apr 2021 08:25:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237795AbhDFGZy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Apr 2021 02:25:54 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:12713 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237334AbhDFGZy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Apr 2021 02:25:54 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1617690347; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=f92wVMK9bCrrW0j7gjmYx05GftzaGTr5ndyjqBMq6ps=; b=AWdcv3/uYbBVPHVROYI//p67YMdsTfvXOBi/C4Akm+499JJglSQueFwUNNbK7++iWA/OYoL2
 pAC6uFw2bIBKmRt0I+nd8VLX2leSoyA/hamM0HwZbW2bFsKRziBRvpbbrOusizO3X3qTLeuA
 OqyMgRkklfgryjxZ3Ih5/IcpIMU=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 606bfee68807bcde1d9bf856 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 06 Apr 2021 06:25:42
 GMT
Sender: mkshah=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C8DF4C433CA; Tue,  6 Apr 2021 06:25:42 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [192.168.29.129] (unknown [49.36.71.14])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C46FBC433CA;
        Tue,  6 Apr 2021 06:25:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C46FBC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [PATCH v6 1/4] dt-bindings: Introduce SoC sleep stats bindings
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     swboyd@chromium.org, mka@chromium.org, evgreen@chromium.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        agross@kernel.org, dianders@chromium.org, linux@roeck-us.net,
        rnayak@codeaurora.org, ilina@codeaurora.org, lsrao@codeaurora.org,
        Mahesh Sivasubramanian <msivasub@codeaurora.org>,
        devicetree@vger.kernel.org
References: <1612448508-9179-1-git-send-email-mkshah@codeaurora.org>
 <1612448508-9179-2-git-send-email-mkshah@codeaurora.org>
 <YEuhxqDRly658D9S@builder.lan>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <3d131469-965a-0a31-a04c-5881feb41b13@codeaurora.org>
Date:   Tue, 6 Apr 2021 11:55:33 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <YEuhxqDRly658D9S@builder.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 3/12/2021 10:45 PM, Bjorn Andersson wrote:
> On Thu 04 Feb 08:21 CST 2021, Maulik Shah wrote:
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
>>   .../bindings/soc/qcom/soc-sleep-stats.yaml         | 46 ++++++++++++++++++++++
>>   1 file changed, 46 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/soc/qcom/soc-sleep-stats.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/soc/qcom/soc-sleep-stats.yaml b/Documentation/devicetree/bindings/soc/qcom/soc-sleep-stats.yaml
>> new file mode 100644
>> index 0000000..1e012ba
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/soc/qcom/soc-sleep-stats.yaml
>> @@ -0,0 +1,46 @@
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
>> +examples:
>> +  # Example of rpmh sleep stats
>> +  - |
>> +    rpmh-sleep-stats@c3f0000 {
>> +      compatible = "qcom,rpmh-sleep-stats";
>> +      reg = <0 0x0c3f0000 0 0x400>;
> The example is built with #address-cells = <1> and #size-cells = <1>, so
> this needs to be reg = <0x0c3f0000 0x400>.
>
> Regards,
> Bjorn

Thanks, Fixed in v7.

Thanks,
Maulik
>
>> +    };
>> +  # Example of rpm sleep stats
>> +  - |
>> +    rpm-sleep-stats@4690000 {
>> +      compatible = "qcom,rpm-sleep-stats";
>> +      reg = <0 0x04690000 0 0x400>;
>> +    };
>> +...
>> -- 
>> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
>> of Code Aurora Forum, hosted by The Linux Foundation
>>
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

