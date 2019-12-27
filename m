Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 313F912B0F7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Dec 2019 05:35:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727047AbfL0Ef2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Dec 2019 23:35:28 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:15113 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726946AbfL0Ef2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Dec 2019 23:35:28 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1577421327; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=UWTLJHhMYKjpdzVTqqLlwIAkQzLn0eTzuvQ7iSDt/8Y=; b=P939WHrV9K9pjXt1BbEhs6uY8EnYZeHzswN5MvmIqL3ps8CFaLbp1gdiToNGoiMh8gE3o9fq
 CP8HkhUIQYuCOOcxO90EtX6mWHi9zAzb0bzxeJpMDeyre0/TnQTb9gTTqdmzXEW+uxY46ndm
 NR/Ov1MSPhSZTWU7wSC91RhS5Hw=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e058a0c.7fb7254fe0a0-smtp-out-n02;
 Fri, 27 Dec 2019 04:35:24 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9E671C447A2; Fri, 27 Dec 2019 04:35:23 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.206.28.9] (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 307F9C43383;
        Fri, 27 Dec 2019 04:35:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 307F9C43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=tdas@codeaurora.org
Subject: Re: [PATCH v1 1/3] dt-bindings: clock: Add YAML schemas for the QCOM
 MSS clock bindings
To:     Rob Herring <robh@kernel.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org
References: <1575447687-9296-1-git-send-email-tdas@codeaurora.org>
 <0101016ed0006092-b6693b0f-f8c6-428a-9b64-f6e1f4606844-000000@us-west-2.amazonses.com>
 <20191216180144.GA27463@bogus>
From:   Taniya Das <tdas@codeaurora.org>
Message-ID: <03538ce3-c172-e895-0fe0-c52362e16dfd@codeaurora.org>
Date:   Fri, 27 Dec 2019 10:05:15 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20191216180144.GA27463@bogus>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello Rob,

Thanks for the review comments.

On 12/16/2019 11:31 PM, Rob Herring wrote:
> On Wed, Dec 04, 2019 at 08:21:56AM +0000, Taniya Das wrote:
>> The MSS clock provider have a bunch of generic properties that
>> are needed in a device tree. Add a YAML schemas for those.
>>
>> Signed-off-by: Taniya Das <tdas@codeaurora.org>
>> ---
>>   .../devicetree/bindings/clock/qcom,mss.yaml        | 40 ++++++++++++++++++++++
>>   1 file changed, 40 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/clock/qcom,mss.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,mss.yaml b/Documentation/devicetree/bindings/clock/qcom,mss.yaml
>> new file mode 100644
>> index 0000000..4494a6b
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/qcom,mss.yaml
>> @@ -0,0 +1,40 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
> 
> Dual license new bindings please:
> 
> (GPL-2.0-only OR BSD-2-Clause)
> 

Will update the license.

>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/bindings/clock/qcom,mss.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Modem Clock Controller Binding
>> +
>> +maintainers:
>> +  - Taniya Das <tdas@codeaurora.org>
>> +
>> +description: |
>> +  Qualcomm modem clock control module which supports the clocks.
>> +
>> +properties:
>> +  compatible :
>> +    enum:
>> +       - qcom,mss-sc7180
> 
> Normal order is 'qcom,sc7180-mss'.
> 
My bad.
>> +
>> +  '#clock-cells':
>> +    const: 1
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - '#clock-cells'
> 
> Add:
> 
> additionalItems: false
> 

Will add it in the next patch.

>> +
>> +examples:
>> +  # Example of MSS with clock nodes properties for SC7180:
>> +  - |
>> +    clock-controller@41aa000 {
>> +      compatible = "qcom,sc7180-mss";
>> +      reg = <0x041aa000 0x100>;
>> +      reg-names = "cc";
> 
> Not documented, nor necessary.
> 

Will remove this.

>> +      #clock-cells = <1>;
>> +    };
>> +...
>> --
>> Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
>> of the Code Aurora Forum, hosted by the  Linux Foundation.
>>

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

--
