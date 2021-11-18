Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BFA5455D02
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Nov 2021 14:51:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231740AbhKRNx7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Nov 2021 08:53:59 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:31017 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231620AbhKRNx6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Nov 2021 08:53:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1637243458; x=1668779458;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=CJR1fG+YuzhuLB13jNgULGuZOsS9eMa1X46m29OB0Jc=;
  b=UlkDNl3PvICGB2KcQTblpE2caVQvshmPnltZoGDD4/9mZZmvWptFTgvk
   tkaaGWf0Y7jgJ1cmrdJ9AG/oKDVvYLv63bo0mjniikqABM7gZCa+++pYk
   RUqgBsxMk8AaeiJ/pi6gUBvWhkv0YzNVLvZL15k2JMbNCy45gQc0Mn+Lj
   s=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 18 Nov 2021 05:50:57 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2021 05:50:56 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Thu, 18 Nov 2021 05:50:56 -0800
Received: from [10.216.52.30] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Thu, 18 Nov
 2021 05:50:51 -0800
Subject: Re: [PATCH V3 4/4] arm64: dts: qcom: sc7280: Add pm8008 regulators
 support for sc7280-idp
To:     Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
CC:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, <collinsd@codeurora.org>,
        <subbaram@codeaurora.org>, Das Srinagesh <gurus@codeaurora.org>,
        <linux-arm-msm@vger.kernel.org>, Lee Jones <lee.jones@linaro.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <1635434072-32055-1-git-send-email-quic_c_skakit@quicinc.com>
 <1635434072-32055-5-git-send-email-quic_c_skakit@quicinc.com>
 <CAE-0n53kp5M6LG2iwaJeysQDrJD1AvcctEd6xjVdTXs5ddhu2w@mail.gmail.com>
From:   "Satya Priya Kakitapalli (Temp)" <quic_c_skakit@quicinc.com>
Message-ID: <66f2eb4b-eb63-1d21-46da-c78085d3ae92@quicinc.com>
Date:   Thu, 18 Nov 2021 19:20:11 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CAE-0n53kp5M6LG2iwaJeysQDrJD1AvcctEd6xjVdTXs5ddhu2w@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 10/29/2021 2:10 AM, Stephen Boyd wrote:
> Quoting Satya Priya (2021-10-28 08:14:32)
>> Add pm8008 regulators support for sc7280 idp.
>>
>> Signed-off-by: Satya Priya <quic_c_skakit@quicinc.com>
>> ---
>> Changes in V2:
>>   - As per Stephen's comments, replaced '_' with '-' for node names.
>>
>> Changes in V3:
>>   - Changed the regulator node names as l1, l2 etc
>>   - Changed "pm8008-regulators" to "regulators"
>>   - Changed "qcom,min-dropout-voltage" to "regulator-min-dropout-voltage-microvolt"
>>
>>   arch/arm64/boot/dts/qcom/sc7280-idp.dtsi | 103 +++++++++++++++++++++++++++++++
>>   1 file changed, 103 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
>> index d623d71..493575b 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
>> @@ -309,6 +309,97 @@
>>          };
>>   };
>>
>> +&i2c1 {
>> +       #address-cells = <1>;
>> +       #size-cells = <0>;
>> +       status = "okay";
>> +
>> +       pm8008_chip: pm8008@8 {
> If this is going to be copy/pasted wherever devices that use pm8008 live
> then it's probably better to make a new file like we do for other pmics.
Sounds good, I'll do that.
> Maybe something like
>
> &pm8008_i2c {
> 	<All the generic stuff in here like reg properties and
> 	address/size cells and compatible>
> };
>
> and then have each board set the min/max voltages and min dropout
> properties. Then we can include the pm8008.dtsi file after defining
> which i2c bus it lives on.
>
> pm8008_i2c: i2c5 { };
> #include "pm8008.dtsi"
>
> ...
>
>
> &pm8008_l1 {
> 	regulator-min-microvolt = <...>;
> 	...
> };
>
>> +               compatible = "qcom,pm8008";
>> +               reg = <0x8>;
>> +               #address-cells = <1>;
>> +               #size-cells = <0>;
>> +
>> +               pinctrl-names = "default";
>> +               pinctrl-0 = <&pm8008_active>;
>> +       };
>> +
>> +       pm8008_ldo: pm8008@9 {
>> +               compatible = "qcom,pm8008";
>> +               reg = <0x9>;
>> +               #address-cells = <1>;
>> +               #size-cells = <0>;
>> +
>> +               regulators {
>> +                       compatible = "qcom,pm8008-regulator";
>> +                       #address-cells = <1>;
>> +                       #size-cells = <0>;
>> +
>> +                       vdd_l1_l2-supply = <&vreg_s8b_1p2>;
>> +                       vdd_l3_l4-supply = <&vreg_s1b_1p8>;
>> +                       vdd_l5-supply = <&vreg_bob>;
>> +                       vdd_l6-supply = <&vreg_bob>;
>> +                       vdd_l7-supply = <&vreg_bob>;
>> +
>> +                       pm8008_l1: l1@4000 {
>> +                               reg = <0x4000>;
>> +                               regulator-name = "pm8008_l1";
>> +                               regulator-min-microvolt = <950000>;
>> +                               regulator-max-microvolt = <1300000>;
>> +                               regulator-min-dropout-voltage-microvolt = <96000>;
>> +                       };
>> +
>> +                       pm8008_l2: l2@4100 {
>> +                               reg = <0x4100>;
>> +                               regulator-name = "pm8008_l2";
>> +                               regulator-min-microvolt = <950000>;
>> +                               regulator-max-microvolt = <1250000>;
>> +                               regulator-min-dropout-voltage-microvolt = <24000>;
>> +                       };
>> +
>> +                       pm8008_l3: l3@4200 {
>> +                               reg = <0x4200>;
>> +                               regulator-name = "pm8008_l3";
>> +                               regulator-min-microvolt = <1650000>;
>> +                               regulator-max-microvolt = <3000000>;
>> +                               regulator-min-dropout-voltage-microvolt = <224000>;
>> +                       };
>> +
>> +                       pm8008_l4: l4@4300 {
>> +                               reg = <0x4300>;
>> +                               regulator-name = "pm8008_l4";
>> +                               regulator-min-microvolt = <1504000>;
>> +                               regulator-max-microvolt = <1600000>;
>> +                               regulator-min-dropout-voltage-microvolt = <0>;
>> +                       };
>> +
>> +                       pm8008_l5: l5@4400 {
>> +                               reg = <0x4400>;
>> +                               regulator-name = "pm8008_l5";
>> +                               regulator-min-microvolt = <2600000>;
>> +                               regulator-max-microvolt = <3000000>;
>> +                               regulator-min-dropout-voltage-microvolt = <104000>;
>> +                       };
>> +
>> +                       pm8008_l6: l6@4500 {
>> +                               reg = <0x4500>;
>> +                               regulator-name = "pm8008_l6";
>> +                               regulator-min-microvolt = <2600000>;
>> +                               regulator-max-microvolt = <3000000>;
>> +                               regulator-min-dropout-voltage-microvolt = <112000>;
>> +                       };
>> +
>> +                       pm8008_l7: l7@4600 {
>> +                               reg = <0x4600>;
>> +                               regulator-name = "pm8008_l7";
>> +                               regulator-min-microvolt = <3000000>;
>> +                               regulator-max-microvolt = <3544000>;
>> +                               regulator-min-dropout-voltage-microvolt = <96000>;
>> +                       };
>> +               };
>> +       };
>> +};
>> +
>>   &qfprom {
>>          vcc-supply = <&vreg_l1c_1p8>;
>>   };
>> @@ -437,6 +528,18 @@
>>          };
>>   };
>>
>> +&pm8350c_gpios {
>> +       pm8008-reset {
> Why is it a subnode of a subnode? Shouldn't it be pm8008-active
> directly underneath pm8350c_gpios?
Right, I'll remove the subnode pm8008-reset.
>> +               pm8008_active: pm8008-active {
>> +                       pins = "gpio4";
>> +                       function = "normal";
>> +                       bias-disable;
>> +                       output-high;
>> +                       power-source = <0>;
>> +               };
>> +       };
>> +};
>> +
>>   &qspi_cs0 {
>>          bias-disable;
>>   };
