Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24BB01F59B7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2020 19:10:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728366AbgFJRKS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Jun 2020 13:10:18 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:16921 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728453AbgFJRKR (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Jun 2020 13:10:17 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1591809015; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=lRsUeRw4SM1OoD2yO8uodGdtCaf8iVQ+liw9JBhOcEU=; b=vDE6rbqtNeEi4v0r8w/pLMeca2/CbqFz4dZ8CS/HExZVlwe8gokhFE4UV34DFalXuIb+wmWH
 g81P60dKCbSfo6XkNGq7JcyhSdLM6mA2cAMmyp5N7/suWwIL9EZ31b8yKDdlaT0WF/jmnOXj
 8wzHDeJ3o07Rqh51fOvpXz1SPTY=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n11.prod.us-east-1.postgun.com with SMTP id
 5ee113ec356bcc26ab018f16 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 10 Jun 2020 17:10:04
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 643CCC433C6; Wed, 10 Jun 2020 17:10:03 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.0
Received: from [192.168.0.104] (unknown [183.82.139.165])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A5AF2C433CA;
        Wed, 10 Jun 2020 17:09:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A5AF2C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=tdas@codeaurora.org
Subject: Re: [PATCH v2 2/4] dt-bindings: clock: Add YAML schemas for LPASS
 clocks on SC7180
To:     Rob Herring <robh@kernel.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org
References: <1589707344-8871-1-git-send-email-tdas@codeaurora.org>
 <1589707344-8871-3-git-send-email-tdas@codeaurora.org>
 <20200528202512.GA608913@bogus>
From:   Taniya Das <tdas@codeaurora.org>
Message-ID: <05e62adc-9dce-721c-55dc-a4554ece92e2@codeaurora.org>
Date:   Wed, 10 Jun 2020 22:39:56 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200528202512.GA608913@bogus>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Thanks for your review.

On 5/29/2020 1:55 AM, Rob Herring wrote:
> On Sun, May 17, 2020 at 02:52:22PM +0530, Taniya Das wrote:
>> The LPASS(Low Power Audio Subsystem) clock provider have a bunch of generic
>> properties that are needed in a device tree. Also add clock ids for GCC
>> LPASS and LPASS Core clock IDs for LPASS client to request for the clocks.
>>
>> Signed-off-by: Taniya Das <tdas@codeaurora.org>
>> ---
>>   .../bindings/clock/qcom,sc7180-lpasscorecc.yaml    | 101 +++++++++++++++++++++
>>   include/dt-bindings/clock/qcom,gcc-sc7180.h        |   1 +
>>   .../dt-bindings/clock/qcom,lpasscorecc-sc7180.h    |  29 ++++++
>>   3 files changed, 131 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/clock/qcom,sc7180-lpasscorecc.yaml
>>   create mode 100644 include/dt-bindings/clock/qcom,lpasscorecc-sc7180.h
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,sc7180-lpasscorecc.yaml b/Documentation/devicetree/bindings/clock/qcom,sc7180-lpasscorecc.yaml
>> new file mode 100644
>> index 0000000..c025a0ae
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/qcom,sc7180-lpasscorecc.yaml
>> @@ -0,0 +1,101 @@
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
>> +      - const: gcc_lpass_sway
>> +
>> +  power-domains:
>> +    items:
>> +      - description: LPASS CORE HM GSDCR
> 
> For single entry, 'maxItems: 1' is enough.

Will take of it in the next patch.

>> +
>> +  '#clock-cells':
>> +    const: 1
>> +
>> +  '#power-domain-cells':
>> +    const: 1
>> +
>> +  reg:
>> +    minItems: 1
>> +    maxItems: 2
>> +    items:
>> +      - description: lpass audio cc register
>> +      - description: lpass core cc register
> 
> audio then core
> 
>> +
>> +  reg-names:
>> +    items:
>> +      - const: lpass_core_cc
>> +      - const: lpass_audio_cc
> 
> core then audio?
> 

My bad, will take care of it.

> 2 reg-names required, but 1 reg allowed?
> 

Update to use maxItems: 2 in the next patch.

>> +
>> +if:
>> +  properties:
>> +    compatible:
>> +      contains:
>> +        const: qcom,sc7180-lpasshm
>> +then:
>> +  properties:
>> +    reg:
>> +      items:
>> +        - description: lpass hm core register
> 
> reg-names allowed in this case?
> 
> Ideally, this would have just 'maxItems: 1' to just disallow the 2nd
> entry above.
> 

Yes, I would take care of this too.

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
>> +        clocks = <&gcc GCC_LPASS_CFG_NOC_SWAY_CLK>;
>> +        clock-names = "gcc_lpass_sway";
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
>> +        clock-names = "gcc_lpass_sway";
>> +        power-domains = <&lpass_hm LPASS_CORE_HM_GDSCR>;
>> +        #clock-cells = <1>;
>> +        #power-domain-cells = <1>;
>> +    };
>> +...
>> diff --git a/include/dt-bindings/clock/qcom,gcc-sc7180.h b/include/dt-bindings/clock/qcom,gcc-sc7180.h
>> index 1258fd0..439476c 100644
>> --- a/include/dt-bindings/clock/qcom,gcc-sc7180.h
>> +++ b/include/dt-bindings/clock/qcom,gcc-sc7180.h
>> @@ -137,6 +137,7 @@
>>   #define GCC_MSS_NAV_AXI_CLK					127
>>   #define GCC_MSS_Q6_MEMNOC_AXI_CLK				128
>>   #define GCC_MSS_SNOC_AXI_CLK					129
>> +#define GCC_LPASS_CFG_NOC_SWAY_CLK				130
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
