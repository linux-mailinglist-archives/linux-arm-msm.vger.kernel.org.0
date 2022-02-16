Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2AB9D4B84CE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Feb 2022 10:50:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232463AbiBPJtz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Feb 2022 04:49:55 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:40798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232493AbiBPJtw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Feb 2022 04:49:52 -0500
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6779F2B4D80;
        Wed, 16 Feb 2022 01:49:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1645004977; x=1676540977;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=81bV3NmRZ61agZvCLeeJYXOL3xLeaeIO2Ye5ysvG/tg=;
  b=ijY0Ve/OjuyhL468d/ManHyI2Z7T6h40rvaoB7ktakFeLaEN3g3k02UM
   YTNdsfw6dEnuE82dqqSuNBKO5wN6BF5//Aa/78mFRjW6G1ARZ0yXcA1t7
   +San+iVzkXqPuQ0hAB3tARr6lCjnG+MvymBWG2UAUDgmBgPR5jaGq1smb
   0=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 16 Feb 2022 01:49:36 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2022 01:49:35 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Wed, 16 Feb 2022 01:49:35 -0800
Received: from [10.216.17.95] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Wed, 16 Feb
 2022 01:49:30 -0800
Subject: Re: [PATCH V6 2/6] dt-bindings: mfd: pm8008: Add regulators node
To:     Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
CC:     Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Das Srinagesh <gurus@codeaurora.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_collinsd@quicinc.com>,
        <quic_subbaram@quicinc.com>, <quic_jprakash@quicinc.com>
References: <1644915231-7308-1-git-send-email-quic_c_skakit@quicinc.com>
 <1644915231-7308-3-git-send-email-quic_c_skakit@quicinc.com>
 <CAE-0n53CLquafH2fOWa2rX1H=q+CvEU2qNwL3TAY+jWkk8q8sQ@mail.gmail.com>
From:   "Satya Priya Kakitapalli (Temp)" <quic_c_skakit@quicinc.com>
Message-ID: <1d352a57-8f03-f65b-9560-d19ebd9f2d16@quicinc.com>
Date:   Wed, 16 Feb 2022 15:19:26 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAE-0n53CLquafH2fOWa2rX1H=q+CvEU2qNwL3TAY+jWkk8q8sQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 2/16/2022 7:34 AM, Stephen Boyd wrote:
> Quoting Satya Priya (2022-02-15 00:53:47)
>> Add regulators node and their supply nodes. Add separate compatible
>> "qcom,pm8008-regulators" to differentiate between pm8008 infra
>> and pm8008 regulators mfd devices.
>>
>> Signed-off-by: Satya Priya <quic_c_skakit@quicinc.com>
>> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Please remove my tag.


Okay


>> Reviewed-by: Rob Herring <robh@kernel.org>
>> ---
>> Changes in V2:
>>   - As per Rob's comments changed "pm8008[a-z]?-regulator" to
>>     "^pm8008[a-z]?-regulators".
>>
>> Changes in V3:
>>   - Fixed bot errors.
>>   - As per stephen's comments, changed "^pm8008[a-z]?-regulators$" to
>>     "regulators".
>>
>> Changes in V4:
>>   - Changed compatible string to "qcom,pm8008-regulators"
>>
>> Changes in V5:
>>   - Remove compatible for regulators node.
>>   - Move supply nodes of the regulators to chip level.
>>
>> Changes in V6:
>>   - No changes.
>>
>>   .../devicetree/bindings/mfd/qcom,pm8008.yaml       | 49 +++++++++++++++++++---
>>   1 file changed, 44 insertions(+), 5 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
>> index ec3138c..1ec43f7 100644
>> --- a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
>> +++ b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
>> @@ -44,6 +46,25 @@ properties:
>>     "#size-cells":
>>       const: 0
>>
>> +  vdd_l1_l2-supply:
>> +    description: Input supply phandle of ldo1 and ldo2 regulators.
>> +
>> +  vdd_l3_l4-supply:
>> +    description: Input supply phandle of ldo3 and ldo4 regulators.
>> +
>> +  vdd_l5-supply:
>> +    description: Input supply phandle of ldo5 regulator.
>> +
>> +  vdd_l6-supply:
>> +    description: Input supply phandle of ldo6 regulator.
>> +
>> +  vdd_l7-supply:
>> +    description: Input supply phandle of ldo7 regulator.
>> +
>> +  regulators:
>> +    type: object
>> +    $ref: "../regulator/qcom,pm8008-regulator.yaml#"
>> +
>>   patternProperties:
>>     "^gpio@[0-9a-f]+$":
>>       type: object
>> @@ -88,10 +109,8 @@ patternProperties:
>>   required:
>>     - compatible
>>     - reg
>> -  - interrupts
>>     - "#address-cells"
>>     - "#size-cells"
>> -  - "#interrupt-cells"
> Shouldn't interrupts and interrupt-cells still be required for
> qcom,pm8008?


No, these are not strictly required.


> This binding seems like it is for two different nodes.


This binding is for the same node with different SIDs 8 and 9, having 
different set of peripherals.


>>   additionalProperties: false
>>
>> @@ -102,7 +121,7 @@ examples:
>>       qupv3_se13_i2c {
>>         #address-cells = <1>;
>>         #size-cells = <0>;
>> -      pm8008i@8 {
>> +      pm8008_infra: pm8008@8 {
>>           compatible = "qcom,pm8008";
>>           reg = <0x8>;
>>           #address-cells = <1>;
>> @@ -123,6 +142,26 @@ examples:
>>             #interrupt-cells = <2>;
>>           };
>>         };
>> -    };
>>
>> +      pm8008_regulators: pm8008@9 {
>> +        compatible = "qcom,pm8008";
> Isn't this supposed to be "qcom,pm8008-regulators"?


Yes, I'll correct this.


>> +        reg = <0x9>;
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        vdd_l1_l2-supply = <&vreg_s8b_1p2>;
>> +        vdd_l3_l4-supply = <&vreg_s1b_1p8>;
>> +        vdd_l5-supply = <&vreg_bob>;
>> +        vdd_l6-supply = <&vreg_bob>;
>> +        vdd_l7-supply = <&vreg_bob>;
>> +
>> +        regulators {
> I still don't get the need for this extra container. Please remove it.


Okay.


>> +          pm8008_l1: ldo1 {
>> +            regulator-name = "pm8008_l1";
>> +            regulator-min-microvolt = <950000>;
>> +            regulator-max-microvolt = <1300000>;
>> +          };
>> +        };
>> +      };
>> +    };
