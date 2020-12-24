Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B3D32E24F5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Dec 2020 07:58:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725833AbgLXG6N (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Dec 2020 01:58:13 -0500
Received: from so254-31.mailgun.net ([198.61.254.31]:39705 "EHLO
        so254-31.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725811AbgLXG6M (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Dec 2020 01:58:12 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1608793073; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=TMXdirVqNRPDa0VZK4x4dwB/fyhhXn5YSoDwuOtELbw=;
 b=FVp3l20WnFjbMsAbMQY+hXVZjE2Tmzr/QcWACxwztmuow+tPJL9Hi6c8abHOGzDwq+xH0nAf
 rl1cTNREhGCcyOrbsX4H1bdTyQ/PVJ9z+PR93lZQ2Em+aU9bhL2+6fI+JoCisCndOftsvfW/
 KQdU+SNrpoNq8i2isEbMoyD4mLY=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n08.prod.us-east-1.postgun.com with SMTP id
 5fe43bd67bc801dc4f1dd25c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 24 Dec 2020 06:57:26
 GMT
Sender: kgunda=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E15B4C43462; Thu, 24 Dec 2020 06:57:25 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: kgunda)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A2DE6C433C6;
        Thu, 24 Dec 2020 06:57:24 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 24 Dec 2020 12:27:24 +0530
From:   kgunda@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        robh@kernel.org
Subject: Re: [PATCH V4 1/2] mfd: qcom-spmi-pmic: Convert bindings to .yaml
 format
In-Reply-To: <160842164192.1580929.12823359876682723808@swboyd.mtv.corp.google.com>
References: <1608279292-24760-1-git-send-email-kgunda@codeaurora.org>
 <1608279292-24760-2-git-send-email-kgunda@codeaurora.org>
 <160842164192.1580929.12823359876682723808@swboyd.mtv.corp.google.com>
Message-ID: <f6922b734a54ff64b1732545dc2f7b1c@codeaurora.org>
X-Sender: kgunda@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-12-20 05:17, Stephen Boyd wrote:
> Quoting Kiran Gunda (2020-12-18 00:14:51)
>> Convert the bindings from .txt to .yaml format.
>> 
>> Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
>> ---
>>  .../devicetree/bindings/mfd/qcom,spmi-pmic.txt     |  80 
>> -------------
>>  .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml    | 127 
>> +++++++++++++++++++++
>>  2 files changed, 127 insertions(+), 80 deletions(-)
>>  delete mode 100644 
>> Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt
>>  create mode 100644 
>> Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
>> 
>> diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt 
>> b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt
>> deleted file mode 100644
>> index 79367a4..0000000
>> --- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt
>> +++ /dev/null
>> @@ -1,80 +0,0 @@
>> -          Qualcomm SPMI PMICs multi-function device bindings
>> -
>> -The Qualcomm SPMI series presently includes PM8941, PM8841 and 
>> PMA8084
>> -PMICs.  These PMICs use a QPNP scheme through SPMI interface.
>> -QPNP is effectively a partitioning scheme for dividing the SPMI 
>> extended
>> -register space up into logical pieces, and set of fixed register
>> -locations/definitions within these regions, with some of these 
>> regions
>> -specifically used for interrupt handling.
>> -
>> -The QPNP PMICs are used with the Qualcomm Snapdragon series SoCs, and 
>> are
>> -interfaced to the chip via the SPMI (System Power Management 
>> Interface) bus.
>> -Support for multiple independent functions are implemented by 
>> splitting the
>> -16-bit SPMI slave address space into 256 smaller fixed-size regions, 
>> 256 bytes
>> -each. A function can consume one or more of these fixed-size register 
>> regions.
>> -
>> -Required properties:
>> -- compatible:      Should contain one of:
>> -                   "qcom,pm8941",
>> -                   "qcom,pm8841",
>> -                   "qcom,pma8084",
>> -                   "qcom,pm8019",
>> -                   "qcom,pm8226",
>> -                   "qcom,pm8110",
>> -                   "qcom,pma8084",
>> -                   "qcom,pmi8962",
>> -                   "qcom,pmd9635",
>> -                   "qcom,pm8994",
>> -                   "qcom,pmi8994",
>> -                   "qcom,pm8916",
>> -                   "qcom,pm8004",
>> -                   "qcom,pm8909",
>> -                   "qcom,pm8950",
>> -                   "qcom,pmi8950",
>> -                   "qcom,pm8998",
>> -                   "qcom,pmi8998",
>> -                   "qcom,pm8005",
>> -                   or generalized "qcom,spmi-pmic".
>> -- reg:             Specifies the SPMI USID slave address for this 
>> device.
>> -                   For more information see:
>> -                   Documentation/devicetree/bindings/spmi/spmi.yaml
>> -
>> -Required properties for peripheral child nodes:
>> -- compatible:      Should contain "qcom,xxx", where "xxx" is a 
>> peripheral name.
>> -
>> -Optional properties for peripheral child nodes:
>> -- interrupts:      Interrupts are specified as a 4-tuple. For more 
>> information
>> -                   see:
>> -                   
>> Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb.txt
>> -- interrupt-names: Corresponding interrupt name to the interrupts 
>> property
>> -
>> -Each child node of SPMI slave id represents a function of the PMIC. 
>> In the
>> -example below the rtc device node represents a peripheral of pm8941
>> -SID = 0. The regulator device node represents a peripheral of pm8941 
>> SID = 1.
>> -
>> -Example:
>> -
>> -       spmi {
>> -               compatible = "qcom,spmi-pmic-arb";
>> -
>> -               pm8941@0 {
>> -                       compatible = "qcom,pm8941", "qcom,spmi-pmic";
>> -                       reg = <0x0 SPMI_USID>;
>> -
>> -                       rtc {
>> -                               compatible = "qcom,rtc";
>> -                               interrupts = <0x0 0x61 0x1 
>> IRQ_TYPE_EDGE_RISING>;
>> -                               interrupt-names = "alarm";
>> -                       };
>> -               };
>> -
>> -               pm8941@1 {
>> -                       compatible = "qcom,pm8941", "qcom,spmi-pmic";
>> -                       reg = <0x1 SPMI_USID>;
>> -
>> -                       regulator {
>> -                               compatible = "qcom,regulator";
>> -                               regulator-name = "8941_boost";
>> -                       };
>> -               };
>> -       };
>> diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml 
>> b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
>> new file mode 100644
>> index 0000000..e458dd1
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
>> @@ -0,0 +1,127 @@
>> +# SPDX-License-Identifier: GPL-2.0
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm SPMI PMICs multi-function device bindings
>> +
>> +maintainers:
>> +  - Stephen Boyd <sboyd@kernel.org>
> 
> Someone at Qualcomm should be the maintainer here. Maybe you?
> 
>> +
>> +description: |
>> +  The Qualcomm SPMI PMICs use a QPNP scheme through SPMI interface.
> 
> What is QPNP?
> 
Qualcomm Plug And Play.
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
>> +  spmi_bus:
>> +    type: object
>> +    description: SPMI bus node
>> +
>> +patternProperties:
>> +  "^pmic@[0-9]$":
>> +    description: Child PMIC nodes
>> +    type: object
>> +
>> +    properties:
>> +      compatible:
>> +        items:
>> +          - enum:
>> +              # Sorted based on subtype ID the device reports
>> +              - qcom,pm8941
>> +              - qcom,pm8841
>> +              - qcom,pma8084
>> +              - qcom,pm8019
>> +              - qcom,pm8226
>> +              - qcom,pm8110
>> +              - qcom,pma8084
>> +              - qcom,pmi8962
>> +              - qcom,pmd9635
>> +              - qcom,pm8994
>> +              - qcom,pmi8994
>> +              - qcom,pm8916
>> +              - qcom,pm8004
>> +              - qcom,pm8909
>> +              - qcom,pm8950
>> +              - qcom,pmi8950
>> +              - qcom,pm8998
>> +              - qcom,pmi8998
>> +              - qcom,pm8005
>> +              - qcom,pm660l
>> +              - qcom,pm660
>> +
>> +          - enum:
>> +              - qcom,spmi-pmic
>> +
>> +      reg:
>> +        maxItems: 1
>> +        description:
>> +          Specifies the SPMI USID slave address for this device.
>> +          For more information see bindings/spmi/spmi.txt
>> +
>> +    patternProperties:
>> +      "@[0-9a-f]$":
> 
> Is that @ sign supposed to be a ^ sign? I thought the child nodes of a
> pmic node were [a-zA-Z0-9-] or some sort of regex like that. Certainly
> not an address that doesn't exist. They look to be things like 'rtc' or
> 'regulator'.
> 
Will fix it in next series.
>> +        description:
>> +          Each child node of SPMI slave id represents a function of 
>> the PMIC.
>> +          In the example below the rtc device node represents a 
>> peripheral of
>> +          pm8941 SID = 0. The regulator device node represents a 
>> peripheral of
>> +          pm8941 SID = 1.
>> +        type: object
>> +
>> +        properties:
>> +          interrupts:
>> +            maxItems: 4
>> +            description:
>> +              Interrupts are specified as a 4-tuple. For more 
>> information
> 
> Seems like minItems is also 4 though, so should be a const 4 instead?
> But then this is about how many interrupts there are, which would be 1
> or 2?  It really can't be known in case there are many interrupts for a
> child node so not sure we need to specify anything.
> 
>> +              see bindings/spmi/qcom,spmi-pmic-arb.txt
>> +
>> +          interrupt-names:
>> +            description:
>> +              Corresponding interrupt name to the interrupts property
> 
> I suspect we should drop these two properties and leave them up to the
> binding for the function, like rtc, or regualator, etc.
> 
Okay. I will remove these properties.
>> +
>> +    required:
>> +      - compatible
>> +      - reg
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/spmi/spmi.h>
>> +
>> +    spmi_bus {
>> +        compatible = "qcom,spmi-pmic-arb";
>> +        #address-cells = <2>;
>> +        #size-cells = <0>;
>> +
>> +        pmic@0 {
>> +         compatible = "qcom,pm8941";
>> +         reg = <0x0 SPMI_USID>;
>> +
>> +         rtc {
>> +           compatible = "qcom,rtc";
>> +           interrupts = <0x0 0x61 0x1 0x1>;
>> +           interrupt-names = "alarm";
>> +          };
>> +        };
>> +
>> +        pmic@1 {
>> +         compatible = "qcom,pm8941";
>> +         reg = <0x1 SPMI_USID>;
>> +
>> +         regulator {
>> +           compatible = "qcom,regulator";
>> +           regulator-name = "8941_boost";
>> +           };
>> +          };
>> +        };
>> +...
