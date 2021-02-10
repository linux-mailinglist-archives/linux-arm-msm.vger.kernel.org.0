Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81D7C316809
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Feb 2021 14:30:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230268AbhBJNaY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Feb 2021 08:30:24 -0500
Received: from mail29.static.mailgun.info ([104.130.122.29]:40583 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230150AbhBJNaU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Feb 2021 08:30:20 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1612963805; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=0DSIquUy0YgK60Sjj4iRMHqNsi7hBzR0xi+i+l4kdCU=;
 b=GrHTXH5fqAL3e2UzdjCmIxJBMoYJMdtrJnum4dffYueNuboOdBRCljjfKRAREOR4o+6sNbkf
 1q4B4B5FOCvfmNhYdFMZpmA4uqArNb5ITwMq/5qjIf5eLflyImTEUPzWODYK57TdjKYC/25Q
 DisRJIVCnZ1HofsZnTPFoJOQSqY=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 6023dfb7e3df861f4b278e8b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 10 Feb 2021 13:29:27
 GMT
Sender: kgunda=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A8B29C43464; Wed, 10 Feb 2021 13:29:25 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: kgunda)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6094AC433CA;
        Wed, 10 Feb 2021 13:29:24 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 10 Feb 2021 18:59:24 +0530
From:   kgunda@codeaurora.org
To:     Rob Herring <robh@kernel.org>
Cc:     swboyd@chromium.org, lee.jones@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        mark.rutland@arm.com, linux-arm-msm-owner@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH V5 1/2] mfd: qcom-spmi-pmic: Convert bindings to .yaml
 format
In-Reply-To: <20210111214200.GA3094286@robh.at.kernel.org>
References: <1609329384-15534-1-git-send-email-kgunda@codeaurora.org>
 <1609329384-15534-2-git-send-email-kgunda@codeaurora.org>
 <20210111214200.GA3094286@robh.at.kernel.org>
Message-ID: <c6b04576c27b2d5518760699d9d78967@codeaurora.org>
X-Sender: kgunda@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-01-12 03:12, Rob Herring wrote:
> On Wed, Dec 30, 2020 at 05:26:22PM +0530, Kiran Gunda wrote:
>> Convert the bindings from .txt to .yaml format.
>> 
>> Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
>> ---
>>  .../devicetree/bindings/mfd/qcom,spmi-pmic.txt     |  80 
>> --------------
>>  .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml    | 117 
>> +++++++++++++++++++++
>>  2 files changed, 117 insertions(+), 80 deletions(-)
>>  delete mode 100644 
>> Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt
>>  create mode 100644 
>> Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
> 
>> diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml 
>> b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
>> new file mode 100644
>> index 0000000..b753bdb
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
>> @@ -0,0 +1,117 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm SPMI PMICs multi-function device bindings
>> +
>> +maintainers:
>> +  - Stephen Boyd <sboyd@kernel.org>
>> +  - Kiran Gunda <kgunda@codeaurora.org>
>> +
>> +description: |
>> +  The Qualcomm SPMI PMICs use a QPNP scheme through SPMI interface.
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
> 
> This is outside the scope of this binding.
> 
>> +
>> +patternProperties:
>> +  "^pmic@[0-9]$":
>> +    description: Child PMIC nodes
>> +    type: object
> 
> You've defined spmi_bus and pmic@... as siblings. I assume you meant
> parent/child instead. You'd need to indent all this 4 more spaces.
> 
> However, this is also outside the scope of the binding and should be
> removed.
> 
>> +
>> +    properties:
>> +      compatible:
> 
> So this needs to be at the top level. 'compatible' is also how we 
> decide
> to apply a schema to a node. What you did here will never be applied.
> Introduce an error to the example and see.
> 
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
> 
> You can use 'const' here instead of enum.
> 
Okay. I can address the above comments.
>> +
>> +      reg:
>> +        maxItems: 1
>> +        description:
>> +          Specifies the SPMI USID slave address for this device.
>> +          For more information see bindings/spmi/spmi.txt
>> +
>> +    patternProperties:
>> +      "^[a-zA-Z0-9]$":
>> +        description:
>> +          Each child node of SPMI slave id represents a function of 
>> the PMIC.
>> +          In the example below the rtc device node represents a 
>> peripheral of
>> +          pm8941 SID = 0. The regulator device node represents a 
>> peripheral of
>> +          pm8941 SID = 1.
>> +        type: object
> 
> No, you need to define all the child nodes. This may mean you need to
> split to several schemas if each PMIC has different sub devices.
> 
Currently all the different child node bindings have not been converted 
to .yaml.
That means probably I can't convert this to .yaml unless all the child 
schemas are available?
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
> 
> Not documented nor used anywhere.
> 
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
> 
> Same here.
> 
>> +           regulator-name = "8941_boost";
>> +           };
>> +          };
>> +        };
>> +...
>> --
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
>> Forum,
>>  a Linux Foundation Collaborative Project
>> 
