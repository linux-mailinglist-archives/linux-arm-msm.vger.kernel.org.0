Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 541F41A4DB4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2020 05:56:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726678AbgDKD4Z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Apr 2020 23:56:25 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:59111 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726676AbgDKD4Y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Apr 2020 23:56:24 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586577385; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=oalPl2CS9AIelSHim6uYF/0X3b0FIeVCWAC33NxRrxg=; b=F1/KuQPjOhze2ZFrxx27YcgPA8PU6uFjGjt/VPRuSC9HVdmjUvrMVjSHL0wALtE0GN6J3est
 C/AXdUYVoINLotCNbJgr7eaHcyJMGLnGy7vBNcCSJ7F71P2gii5//oWAMa5iKHZlHVyIrMO2
 0ZbovfL1EjEc1/Xf7NfDzvCPDqs=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e913fe8.7fcf59aa63e8-smtp-out-n04;
 Sat, 11 Apr 2020 03:56:24 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E77E9C433BA; Sat, 11 Apr 2020 03:56:23 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.110.2.190] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7259CC433CB;
        Sat, 11 Apr 2020 03:56:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7259CC433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=wcheng@codeaurora.org
Subject: Re: [PATCH v3 1/4] dt-bindings: phy: Add binding for qcom,usb-hs-7nm
To:     Stephen Boyd <sboyd@kernel.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, mark.rutland@arm.com,
        mturquette@baylibre.com, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        vinod.koul@linaro.org
References: <1586298209-4589-1-git-send-email-wcheng@codeaurora.org>
 <1586298209-4589-2-git-send-email-wcheng@codeaurora.org>
 <158657118788.199533.6157625397469536329@swboyd.mtv.corp.google.com>
From:   Wesley Cheng <wcheng@codeaurora.org>
Message-ID: <6ee1a80b-e19d-072d-ad50-37af65853e3e@codeaurora.org>
Date:   Fri, 10 Apr 2020 20:56:21 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <158657118788.199533.6157625397469536329@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 4/10/2020 7:13 PM, Stephen Boyd wrote:
> Quoting Wesley Cheng (2020-04-07 15:23:26)
>> diff --git a/Documentation/devicetree/bindings/phy/qcom,usb-hs-7nm.yaml b/Documentation/devicetree/bindings/phy/qcom,usb-hs-7nm.yaml
>> new file mode 100644
>> index 0000000..7292e27
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/phy/qcom,usb-hs-7nm.yaml
>> @@ -0,0 +1,76 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: "http://devicetree.org/schemas/phy/qcom,usb-hs-7nm.yaml#"
>> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
>> +
>> +title: Qualcomm Synopsys 7nm High-Speed USB PHY
>> +
>> +maintainers:
>> +  - Wesley Cheng <wcheng@codeaurora.org>
>> +
>> +description: |
>> +  Qualcomm Hi-Speed 7nm USB PHY
> 
> High?
> 

Hi Stephen,

Will fix it.

>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - qcom,usb-snps-hs-7nm-phy
>> +      - qcom,sm8150-usb-hs-phy
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  "#phy-cells":
>> +    const: 0
>> +
>> +  clocks:
>> +    items:
>> +      - description: rpmhcc ref clock
>> +
>> +  clock-names:
>> +    items:
>> +      - const: ref
>> +
>> +  resets:
>> +    items:
>> +      - description: PHY core reset
>> +
>> +  vdda-pll-supply:
>> +    description: phandle to the regulator VDD supply node.
>> +
>> +  vdda18-supply:
>> +    description: phandle to the regulator 1.8V supply node.
>> +
>> +  vdda33-supply:
>> +    description: phandle to the regulator 3.3V supply node.
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - "#phy-cells"
>> +  - clocks
>> +  - clock-names
>> +  - resets
>> +  - vdda-pll-supply
>> +  - vdda18-supply
>> +  - vdda33-supply
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/qcom,rpmh.h>
>> +    #include <dt-bindings/clock/qcom,gcc-sm8150.h>
>> +    usb_1_hsphy: phy@88e2000 {
> 
> Is the label necessary? Best to drop it if not.
> 

I'll drop the label.

>> +        compatible = "qcom,sm8150-usb-hs-phy";
>> +        reg = <0 0x088e2000 0 0x400>;
>> +        status = "disabled";
> 
> I think we can leave out status in examples.
> 

Will do.

>> +        #phy-cells = <0>;
>> +
>> +        clocks = <&rpmhcc RPMH_CXO_CLK>;
>> +        clock-names = "ref";
>> +
>> +        resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
>> +    };
>> +...
>> \ No newline at end of file
> 
> Why no newline at end of file?
> 

Got it, I'll add a newline.

>> -- 
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
>> a Linux Foundation Collaborative Project

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
