Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7F3832C20A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Mar 2021 01:03:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1573560AbhCCVkG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Mar 2021 16:40:06 -0500
Received: from m42-2.mailgun.net ([69.72.42.2]:28801 "EHLO m42-2.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242716AbhCCOyr (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Mar 2021 09:54:47 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1614783267; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=Pg9UcnXmNNJDfqbP+jEVxc2qlx2KGMB67XjQuDCqIh8=;
 b=k07HKTAvYi8zx+vdACfsi4TMkjUavhZibw+a+Mvb/F2gi0yLnB2V7/TVc38CC9xdchmeNOU9
 NWL0nqU+jDLbapBrfRBph2cQVWwmcSkUhGyxlchaB+brpe3M2/6VOjx8F5VVOWhedE/o0fUo
 oyrvxVjscz3j8dqsuH3qz1DKH7A=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 603fa30364e0747df9ec69cf (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 03 Mar 2021 14:53:55
 GMT
Sender: skakit=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9ADD9C433C6; Wed,  3 Mar 2021 14:53:54 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: skakit)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id F090FC433CA;
        Wed,  3 Mar 2021 14:53:53 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 03 Mar 2021 20:23:53 +0530
From:   skakit@codeaurora.org
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Kiran Gunda <kgunda@codeaurora.org>
Subject: Re: [PATCH 1/7] dt-bindings: regulator: Convert regulator bindings to
 YAML format
In-Reply-To: <CAL_JsqLLM9LLUb8r2ZEKfjKxG0tfxuKHchGhG3kVOUG35jgWGg@mail.gmail.com>
References: <1614155592-14060-1-git-send-email-skakit@codeaurora.org>
 <1614155592-14060-2-git-send-email-skakit@codeaurora.org>
 <CAL_JsqLLM9LLUb8r2ZEKfjKxG0tfxuKHchGhG3kVOUG35jgWGg@mail.gmail.com>
Message-ID: <6fd80f9c8d36deee7ed36f9dab5ad5c1@codeaurora.org>
X-Sender: skakit@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Rob,

Thanks for reviewing the patch!

>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: 
>> http://devicetree.org/schemas/regulator/qcom,rpmh-regulator.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Technologies, Inc. RPMh Regulators
>> +
>> +maintainers:
>> +  - David Collins <collinsd@codeaurora.org>
>> +
>> +description:
> 
> I assume you want the formatting here maintained, so you need a '|' at 
> the end.
> 

Ok.

>> +    rpmh-regulator devices support PMIC regulator management via the 
>> Voltage
>> +    Regulator Manager (VRM) and Oscillator Buffer (XOB) RPMh 
>> accelerators.  The APPS
>> +    processor communicates with these hardware blocks via a Resource 
>> State
>> +    Coordinator (RSC) using command packets.  The VRM allows changing 
>> three
>> +    parameters for a given regulator, enable state, output voltage, 
>> and operating
>> +    mode.  The XOB allows changing only a single parameter for a 
>> given regulator,
>> +    its enable state.  Despite its name, the XOB is capable of 
>> controlling the
>> +    enable state of any PMIC peripheral.  It is used for clock 
>> buffers, low-voltage
>> +    switches, and LDO/SMPS regulators which have a fixed voltage and 
>> mode.
>> +
>> +    =======================
>> +    Required Node Structure
>> +    =======================
>> +
>> +    RPMh regulators must be described in two levels of device nodes.  
>> The first
>> +    level describes the PMIC containing the regulators and must 
>> reside within an
>> +    RPMh device node.  The second level describes each regulator 
>> within the PMIC
>> +    which is to be used on the board.  Each of these regulators maps 
>> to a single
>> +    RPMh resource.
>> +
>> +    The names used for regulator nodes must match those supported by 
>> a given PMIC.
>> +    Supported regulator node names are
>> +      For PM8005, smps1 - smps4
>> +      For PM8009, smps1 - smps2, ldo1 - ldo7
>> +      For PM8150, smps1 - smps10, ldo1 - ldo18
>> +      For PM8150L, smps1 - smps8, ldo1 - ldo11, bob, flash, rgb
> 
> flash and rgb aren't documented.
> 

Ok will add them.

>> +      For PM8350, smps1 - smps12, ldo1 - ldo10
>> +      For PM8350C, smps1 - smps10, ldo1 - ldo13, bob
>> +      For PM8998, smps1 - smps13, ldo1 - ldo28, lvs1 - lvs2
>> +      For PMI8998, bob
>> +      For PM6150, smps1 - smps5, ldo1 - ldo19
>> +      For PM6150L, smps1 - smps8, ldo1 - ldo11, bob
>> +      For PMX55, smps1 - smps7, ldo1 - ldo16
>> +
>> +properties:
>> +    compatible:
>> +        enum:
>> +            - qcom,pm8005-rpmh-regulators
>> +            - qcom,pm8009-rpmh-regulators
>> +            - qcom,pm8009-1-rpmh-regulators
>> +            - qcom,pm8150-rpmh-regulators
>> +            - qcom,pm8150l-rpmh-regulators
>> +            - qcom,pm8350-rpmh-regulators
>> +            - qcom,pm8350c-rpmh-regulators
>> +            - qcom,pm8998-rpmh-regulators
>> +            - qcom,pmi8998-rpmh-regulators
>> +            - qcom,pm6150-rpmh-regulators
>> +            - qcom,pm6150l-rpmh-regulators
>> +            - qcom,pmx55-rpmh-regulators
>> +
>> +    qcom,pmic-id:
>> +        description: RPMh resource name suffix used for the 
>> regulators found on
>> +                     this PMIC.  Typical values are "a", "b", "c", 
>> "d", "e", "f".
> 
> Sounds like constraints. Make the values a schema.
> 

Ok

>> +        $ref: /schemas/types.yaml#/definitions/string
>> +
>> +    qcom,always-wait-for-ack:
>> +        description: Boolean flag which indicates that the 
>> application processor
>> +                     must wait for an ACK or a NACK from RPMh for 
>> every request
>> +                     sent for this regulator including those which 
>> are for a
>> +                     strictly lower power state.
>> +        $ref: /schemas/types.yaml#/definitions/string
> 
> Boolean or string?
> 

Ok, will change it to /schemas/types.yaml#/definitions/flag

>> +
>> +patternProperties:
>> +  ".*-supply$":
> 
> You can drop '.*'. That's already the case without '^'.
> 

Ok.

> The supply names need to be defined.
> 

you mean I should define like this "^vdd-s|l([0-9]+)-supply$": ?

>> +    description: phandle of the parent supply regulator of one or 
>> more of the
>> +                 regulators for this PMIC.
>> +
>> +  "^((smps|ldo|lvs)[0-9]*)$":
> 
> s/*/+/ as 1 digit is always required, right?
> 

ok

>> +    type: object
>> +    allOf:
> 
> Don't need allOf.
> 

ok, will drop this.

>> +     - $ref: "regulator.yaml#"
>> +    description: List of regulator parent supply phandles
> 
> This is a node, not a list of phandles.
> 

Okay.

>> +
>> +  "bob$":
> 
> 'foobob' is okay as that would be allowed? If a fixed string, put
> under 'properties'.
> 

It is fixed string, will move it to properties.

>> +    type: object
>> +    allOf:
>> +     - $ref: "regulator.yaml#"
>> +    description: BOB regulator parent supply phandle
>> +
>> +additionalProperties: false
>> +
>> +required:
>> + - compatible
>> + - qcom,pmic-id
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>> +
>> +    pm8998-rpmh-regulators {
>> +        compatible = "qcom,pm8998-rpmh-regulators";
>> +        qcom,pmic-id = "a";
>> +
>> +        vdd-l7-l12-l14-l15-supply = <&pm8998_s5>;
>> +
>> +        smps2 {
>> +            regulator-min-microvolt = <1100000>;
>> +            regulator-max-microvolt = <1100000>;
>> +        };
>> +
>> +        pm8998_s5: smps5 {
> 
> Drop unused labels.
> 

Okay.

>> +            regulator-min-microvolt = <1904000>;
>> +            regulator-max-microvolt = <2040000>;
>> +        };
>> +
>> +        ldo7 {
>> +            regulator-min-microvolt = <1800000>;
>> +            regulator-max-microvolt = <1800000>;
>> +            regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>> +            regulator-allowed-modes =
>> +                <RPMH_REGULATOR_MODE_LPM
>> +                 RPMH_REGULATOR_MODE_HPM>;
>> +            regulator-allow-set-load;
>> +        };
>> +
>> +        lvs1 {
>> +            regulator-min-microvolt = <1800000>;
>> +            regulator-max-microvolt = <1800000>;
>> +        };
>> +    };
>> +
>> +    pmi8998-rpmh-regulators {
>> +        compatible = "qcom,pmi8998-rpmh-regulators";
>> +        qcom,pmic-id = "b";
>> +
>> +        bob {
>> +            regulator-min-microvolt = <3312000>;
>> +            regulator-max-microvolt = <3600000>;
>> +            regulator-allowed-modes =
>> +                <RPMH_REGULATOR_MODE_AUTO
>> +                 RPMH_REGULATOR_MODE_HPM>;
>> +            regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
>> +        };
>> +    };
>> +...
>> --
>> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
>> member
>> of Code Aurora Forum, hosted by The Linux Foundation
>> 

Thanks,
Satya Priya
