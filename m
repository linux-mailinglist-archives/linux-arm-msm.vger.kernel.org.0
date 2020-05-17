Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57F5E1D66C0
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2020 11:20:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727045AbgEQJUy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 17 May 2020 05:20:54 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:52318 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727063AbgEQJUy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 17 May 2020 05:20:54 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1589707253; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=EZN0CULOm4NwZwJjvBqZsRyMbaIBRiK1d1VBS60zGhY=; b=VG6H7XtP6jXLljoyFEmHYjgN0E/Oum5sS5j9cwG41TNTCJZO3jGpBBlY+OYn8gb1oUTszaFl
 1YbOaonPmuzj2Rr5IESF/1xd/jZhsPVtogfnBMzR4Nc0mF6c1iJC+g8ZmIA1zmhpyNh3rf65
 PUMfXyhS/iUq9kAQBIjDqRlHrf0=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 5ec101f05d62762fd427d2b0 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sun, 17 May 2020 09:20:48
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id BB5EBC43637; Sun, 17 May 2020 09:20:47 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.102] (unknown [183.82.140.80])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B94E1C433D2;
        Sun, 17 May 2020 09:20:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B94E1C433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=tdas@codeaurora.org
Subject: Re: [PATCH v1 2/4] dt-bindings: clock: Add YAML schemas for LPASS
 clocks on SC7180
To:     Rob Herring <robh@kernel.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org
References: <1585338485-31820-1-git-send-email-tdas@codeaurora.org>
 <1585338485-31820-3-git-send-email-tdas@codeaurora.org>
 <20200405020946.GA6110@bogus>
From:   Taniya Das <tdas@codeaurora.org>
Message-ID: <c6800c88-c4cd-17bd-f32c-e980d896aaff@codeaurora.org>
Date:   Sun, 17 May 2020 14:50:41 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200405020946.GA6110@bogus>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello Rob,

Thanks for the review.

On 4/5/2020 7:39 AM, Rob Herring wrote:

>> +
>> +  reg:
>> +    minItems: 1
>> +    maxItems: 2
> 
> Need to define what each one is when there are 2.
> 

Yes will define them in the next patch.

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
>> +        clocks = <&gcc GCC_LPASS_CFG_NOC_SWAY_CLK>;
>> +        clock-names = "gcc_lpass_sway";
>> +        power-domains = <&lpass_hm LPASS_CORE_HM_GDSCR>;
>> +        #clock-cells = <1>;
>> +        #power-domain-cells = <1>;
>> +    };
>> +...


>   /* GCC resets */
>>   #define GCC_QUSB2PHY_PRIM_BCR					0
>> diff --git a/include/dt-bindings/clock/qcom,lpasscorecc-sc7180.h b/include/dt-bindings/clock/qcom,lpasscorecc-sc7180.h
>> new file mode 100644
>> index 0000000..9466d5e
>> --- /dev/null
>> +++ b/include/dt-bindings/clock/qcom,lpasscorecc-sc7180.h
>> @@ -0,0 +1,28 @@
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
>> +/* LPASS power domains */
>> +#define LPASS_CORE_HM_GDSCR				0
>> +
>> +#define LPASS_AUDIO_HM_GDSCR				0
> 
> Kind of odd that 2 are the same value.
> 

These GDSCs are from two different domains. I will update the comments 
in the next patch.

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
