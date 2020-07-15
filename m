Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8084C22051E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2020 08:37:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728129AbgGOGg6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Jul 2020 02:36:58 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:19409 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728150AbgGOGg4 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Jul 2020 02:36:56 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1594795015; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=Of1lEjQiSIvpTaIAus67/5DrtPGb3n1n8NpZNwoV/Mo=; b=DIEHXGyXmCXXiywpeBMgSCKM4uB49B/U5GOW05DefIhXaWEwbwbFJNHsmwdxAZJSVh08qYmv
 ISBpbJBqft0R3GTXyelMJ25FSfJIyb/gh8UQ2FqiN+g/Mro5aAopa6oCB0YRIjw3uNP9BjPM
 nVUl+PRdLuziC7d81dR+yjFTKxE=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n13.prod.us-east-1.postgun.com with SMTP id
 5f0ea406d3d650842223dbbe (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 15 Jul 2020 06:36:54
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C02F7C43395; Wed, 15 Jul 2020 06:36:53 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,NICE_REPLY_A,
        SPF_NONE,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.109] (unknown [183.82.138.211])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3E6B2C433CA;
        Wed, 15 Jul 2020 06:36:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3E6B2C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=tdas@codeaurora.org
Subject: Re: [PATCH v3 2/4] dt-bindings: clock: Add YAML schemas for LPASS
 clocks on SC7180
To:     Rob Herring <robh@kernel.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org
References: <1591809487-5588-1-git-send-email-tdas@codeaurora.org>
 <1591809487-5588-3-git-send-email-tdas@codeaurora.org>
 <20200617222925.GA2947130@bogus>
From:   Taniya Das <tdas@codeaurora.org>
Message-ID: <0b6927ca-6009-c2c1-c2d1-96bba99cdcc0@codeaurora.org>
Date:   Wed, 15 Jul 2020 12:06:46 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200617222925.GA2947130@bogus>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Rob,

Thanks for the review.

On 6/18/2020 3:59 AM, Rob Herring wrote:
> On Wed, Jun 10, 2020 at 10:48:05PM +0530, Taniya Das wrote:
>> The LPASS(Low Power Audio Subsystem) clock provider have a bunch of generic
>> properties that are needed in a device tree. Also add clock ids for GCC
>> LPASS and LPASS Core clock IDs for LPASS client to request for the clocks.
>>
>> Signed-off-by: Taniya Das <tdas@codeaurora.org>
>> ---
>>   .../bindings/clock/qcom,sc7180-lpasscorecc.yaml    | 98 ++++++++++++++++++++++
>>   include/dt-bindings/clock/qcom,gcc-sc7180.h        |  1 +
>>   .../dt-bindings/clock/qcom,lpasscorecc-sc7180.h    | 29 +++++++
>>   3 files changed, 128 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/clock/qcom,sc7180-lpasscorecc.yaml
>>   create mode 100644 include/dt-bindings/clock/qcom,lpasscorecc-sc7180.h
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,sc7180-lpasscorecc.yaml b/Documentation/devicetree/bindings/clock/qcom,sc7180-lpasscorecc.yaml
>> new file mode 100644
>> index 0000000..5af4048
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/qcom,sc7180-lpasscorecc.yaml
>> @@ -0,0 +1,98 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/clock/qcom,sc7180-lpasscorecc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm LPASS Core Clock Controller Binding for SC7180
>> +
>> +maintainers:
>> +  - Taniya Das <tdas@codeaurora.org>
>> +
>> +description: |
>> +  Qualcomm LPASS core clock control module which supports the clocks and
>> +  power domains on SC7180.
>> +
>> +  See also:
>> +  - dt-bindings/clock/qcom,lpasscorecc-sc7180.h
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - qcom,sc7180-lpasshm
>> +      - qcom,sc7180-lpasscorecc
>> +
>> +  clocks:
>> +    items:
>> +      - description: gcc_lpass_sway clock from GCC
>> +
>> +  clock-names:
>> +    items:
>> +      - const: iface
>> +
>> +  power-domains:
>> +    maxItems: 1
>> +
>> +  '#clock-cells':
>> +    const: 1
>> +
>> +  '#power-domain-cells':
>> +    const: 1
>> +
>> +  reg:
>> +    maxItems: 2
> 
> You need a 'minItems: 1' here instead.
> 

Will update in the next patch.

>> +    items:
>> +      - description: lpass core cc register
>> +      - description: lpass audio cc register
>> +
>> +  reg-names:
>> +    items:
>> +      - const: lpass_core_cc
>> +      - const: lpass_audio_cc
>> +
>> +if:
>> +  properties:
>> +    compatible:
>> +      contains:
>> +        const: qcom,sc7180-lpasshm
>> +then:
>> +  properties:
>> +    reg:
>> +      maxItems: 1
> 
> And need an:
> 
> else:
>    properties:
>      reg:
>        minItems: 2

Will take care of it.
> 
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - clock-names
>> +  - '#clock-cells'
>> +  - '#power-domain-cells'
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/qcom,gcc-sc7180.h>
>> +    #include <dt-bindings/clock/qcom,lpasscorecc-sc7180.h>
>> +    clock-controller@63000000 {
>> +      compatible = "qcom,sc7180-lpasshm";
>> +        reg = <0 0x63000000 0 0x28>;
> 
> Default sizes are 1 cell.

Yes, my bad, will correct in the next patch.
> 
>> +        clocks = <&gcc GCC_LPASS_CFG_NOC_SWAY_CLK>;
>> +        clock-names = "iface";
>> +        #clock-cells = <1>;
>> +        #power-domain-cells = <1>;
>> +    };
>> +
>> +  - |
>> +    clock-controller@62d00000 {
>> +        compatible = "qcom,sc7180-lpasscorecc";
>> +        reg = <0 0x62d00000 0 0x50000>,
>> +            <0 0x62780000 0 0x30000>;
>> +        reg-names = "lpass_core_cc", "lpass_audio_cc";
>> +        clocks = <&gcc GCC_LPASS_CFG_NOC_SWAY_CLK>;
>> +        clock-names = "iface";
>> +        power-domains = <&lpass_hm LPASS_CORE_HM_GDSCR>;
>> +        #clock-cells = <1>;
>> +        #power-domain-cells = <1>;
>> +    };
>> +...
>> diff --git a/include/dt-bindings/clock/qcom,gcc-sc7180.h b/include/dt-bindings/clock/qcom,gcc-sc7180.h
>> index 992b67b..bdf43adc 100644
>> --- a/include/dt-bindings/clock/qcom,gcc-sc7180.h
>> +++ b/include/dt-bindings/clock/qcom,gcc-sc7180.h
>> @@ -138,6 +138,7 @@
>>   #define GCC_MSS_Q6_MEMNOC_AXI_CLK				128
>>   #define GCC_MSS_SNOC_AXI_CLK					129
>>   #define GCC_SEC_CTRL_CLK_SRC					130
>> +#define GCC_LPASS_CFG_NOC_SWAY_CLK				131
>>   
>>   /* GCC resets */
>>   #define GCC_QUSB2PHY_PRIM_BCR					0
>> diff --git a/include/dt-bindings/clock/qcom,lpasscorecc-sc7180.h b/include/dt-bindings/clock/qcom,lpasscorecc-sc7180.h
>> new file mode 100644
>> index 0000000..a55d01d
>> --- /dev/null
>> +++ b/include/dt-bindings/clock/qcom,lpasscorecc-sc7180.h
>> @@ -0,0 +1,29 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (c) 2020, The Linux Foundation. All rights reserved.
>> + */
>> +
>> +#ifndef _DT_BINDINGS_CLK_QCOM_LPASS_CORE_CC_SC7180_H
>> +#define _DT_BINDINGS_CLK_QCOM_LPASS_CORE_CC_SC7180_H
>> +
>> +/* LPASS_CORE_CC clocks */
>> +#define LPASS_LPAAUDIO_DIG_PLL				0
>> +#define LPASS_LPAAUDIO_DIG_PLL_OUT_ODD			1
>> +#define CORE_CLK_SRC					2
>> +#define EXT_MCLK0_CLK_SRC				3
>> +#define LPAIF_PRI_CLK_SRC				4
>> +#define LPAIF_SEC_CLK_SRC				5
>> +#define LPASS_AUDIO_CORE_CORE_CLK			6
>> +#define LPASS_AUDIO_CORE_EXT_MCLK0_CLK			7
>> +#define LPASS_AUDIO_CORE_LPAIF_PRI_IBIT_CLK		8
>> +#define LPASS_AUDIO_CORE_LPAIF_SEC_IBIT_CLK		9
>> +#define LPASS_AUDIO_CORE_SYSNOC_MPORT_CORE_CLK		10
>> +
>> +/* LPASS Core power domains */
>> +#define LPASS_CORE_HM_GDSCR				0
>> +
>> +/* LPASS Audio power domains */
>> +#define LPASS_AUDIO_HM_GDSCR				0
>> +#define LPASS_PDC_HM_GDSCR				1
>> +
>> +#endif
>> -- 
>> Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
>> of the Code Aurora Forum, hosted by the  Linux Foundation.
>>

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

--
