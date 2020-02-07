Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C4D51155234
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2020 06:57:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726626AbgBGF5x (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Feb 2020 00:57:53 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:17315 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726587AbgBGF5w (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Feb 2020 00:57:52 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1581055071; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=oImciDU87n0xS5Y1LqO5F4996XPNzKk5xGwYO+ozzeY=;
 b=UK8FOQBrvya6aiNKoBRn5zsFQumgsJpj6LbaL7oC6aeiapQN7x4VRP0SZEl63Li6GgfA5Qir
 tir8MuUHeHppNoKLS6li5VJb3/030zkur/HoAPA0ggiBCGk/nLY3Vlnwcx1KWcORmpE/kUeK
 JQEMpPEXlzHKjUxwPEhEcBW1UWU=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e3cfc5e.7fc5a03c2998-smtp-out-n02;
 Fri, 07 Feb 2020 05:57:50 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A741EC433A2; Fri,  7 Feb 2020 05:57:50 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: kgunda)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BA404C433CB;
        Fri,  7 Feb 2020 05:57:49 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 07 Feb 2020 11:27:49 +0530
From:   kgunda@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lee Jones <lee.jones@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        rnayak@codeaurora.org, linux-arm-msm-owner@vger.kernel.org
Subject: Re: [PATCH V3 1/2] mfd: qcom-spmi-pmic: Convert bindings to .yaml
 format
In-Reply-To: <5e3c63d0.1c69fb81.c2bba.0957@mx.google.com>
References: <1580997328-16365-1-git-send-email-kgunda@codeaurora.org>
 <5e3c63d0.1c69fb81.c2bba.0957@mx.google.com>
Message-ID: <b638e342aae1f6866cad33ff408f2894@codeaurora.org>
X-Sender: kgunda@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-02-07 00:36, Stephen Boyd wrote:
> Quoting Kiran Gunda (2020-02-06 05:55:26)
>> Convert the bindings from .txt to .yaml format.
>> 
>> Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
>> ---
> 
> Did something change? Is there a cover letter?
> 
Other than converting the bindings to .yaml not much changed from the 
previous post.
I will log the per patch changes in next post.
>> diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml 
>> b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
>> new file mode 100644
>> index 0000000..affc169
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
>> @@ -0,0 +1,115 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/bindings/mfd/qcom,spmi-pmic.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm SPMI PMICs multi-function device bindings
>> +
>> +maintainers:
>> +  - Lee Jones <lee.jones@linaro.org>
>> +  - Stephen Boyd <sboyd@codeaurora.org>
> 
> Please change this to sboyd@kernel.org
> 
Sorry for that. I will change it in next post.
>> +
>> +description: |
>> +  The Qualcomm SPMI series presently includes PM8941, PM8841 and 
>> PMA8084
>> +  PMICs.  These PMICs use a QPNP scheme through SPMI interface.
> 
> This first sentence will need continual updating. Please drop it.
> 
Sure. Will do it in next post.
>> +  QPNP is effectively a partitioning scheme for dividing the SPMI 
>> extended
>> +  register space up into logical pieces, and set of fixed register
>> +  locations/definitions within these regions, with some of these 
>> regions
>> +  specifically used for interrupt handling.
>> +
>> +  The QPNP PMICs are used with the Qualcomm Snapdragon series SoCs, 
>> and are
>> +  interfaced to the chip via the SPMI (System Power Management 
>> Interface) bus.
>> +  Support for multiple independent functions are implemented by 
>> splitting the
>> +  16-bit SPMI slave address space into 256 smaller fixed-size 
>> regions, 256 bytes
>> +  each. A function can consume one or more of these fixed-size 
>> register regions.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - qcom,pm8941
>> +      - qcom,pm8841
>> +      - qcom,pma8084
>> +      - qcom,pm8019
>> +      - qcom,pm8226
>> +      - qcom,pm8110
>> +      - qcom,pma8084
>> +      - qcom,pmi8962
>> +      - qcom,pmd9635
>> +      - qcom,pm8994
>> +      - qcom,pmi8994
>> +      - qcom,pm8916
>> +      - qcom,pm8004
>> +      - qcom,pm8909
>> +      - qcom,pm8950
>> +      - qcom,pmi8950
>> +      - qcom,pm8998
>> +      - qcom,pmi8998
>> +      - qcom,pm8005
>> +      - qcom,spmi-pmic
> 
> I think we want qcom,spmi-pmic to be there always. To do that we need 
> it
> to look like:
> 
>   compatible:
>     items:
>       enum:
>         - qcom,pm8941
>         ...
>       enum:
>         - qcom,spmi-pmic
> 
Ok.. I will do it next post.
>> +
>> +  reg:
>> +    maxItems: 1
>> +    description:
>> +      Specifies the SPMI USID slave address for this device.
>> +      For more information see 
>> Documentation/devicetree/bindings/spmi/spmi.txt
>> +
>> +patternProperties:
>> +  "^.*@[0-9a-f]+$":
>> +    type: object
>> +    description:
>> +      Each child node of SPMI slave id represents a function of the 
>> PMIC. In the
>> +      example below the rtc device node represents a peripheral of 
>> pm8941
>> +      SID = 0. The regulator device node represents a peripheral of 
>> pm8941 SID = 1.
>> +
>> +    properties:
>> +      compatible:
>> +        description:
>> +          Compatible of the PMIC device.
>> +
>> +      interrupts:
>> +        maxItems: 2
>> +        description:
>> +          Interrupts are specified as a 4-tuple. For more information
>> +          see 
>> Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb.txt
> 
> Just make this bindings/spmi/qcom,spmi-pmic-arb.txt so that  we don't
> have to worry about it.
Ok. Will do it in next post.
  Why is max items 2? Isn't it 4?
Correct. It should be 4. I will correct it.
Is this property
> supposed to be specified at all?
> 
The interrupts are used by many of the PMIC devices. I think better to 
mention it.
>> +
>> +      interrupt-names:
>> +        description:
>> +          Corresponding interrupt name to the interrupts property
> 
> Does this need to be specified either?
> 
The interrupts are used by many of the PMIC devices. I think better to 
mention it.
>> +
>> +    required:
>> +      - compatible
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +
>> +examples:
>> +  - |
>> +    spmi {
>> +        compatible = "qcom,spmi-pmic-arb";
>> +        #address-cells = <2>;
>> +        #size-cells = <0>;
>> +
>> +       pm8941@0 {
> 
> pmic@0
> 
Ok. Will address in next series.
>> +         compatible = "qcom,pm8941";
>> +         reg = <0x0 0x0>;
> 
> Why not include the header file to get the SPMI_USID macro?
> 
Ok. I will include it in next post.
>> +
>> +         rtc {
>> +           compatible = "qcom,rtc";
>> +           interrupts = <0x0 0x61 0x1 0x1>;
>> +           interrupt-names = "alarm";
>> +         };
>> +       };
>> +
>> +       pm8941@1 {
> 
> pmic@1
> 
Ok. Will address in next series.
>> +         compatible = "qcom,pm8941";
>> +         reg = <0x1 0x0>;
>> +
>> +         regulator {
>> +           compatible = "qcom,regulator";
>> +           regulator-name = "8941_boost";
>> +         };
>> +       };
>> +    };
>> +...
>> --
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
>> Forum,
>>  a Linux Foundation Collaborative Project
