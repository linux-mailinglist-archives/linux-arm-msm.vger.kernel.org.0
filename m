Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC235455D2B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Nov 2021 14:59:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231986AbhKROCJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Nov 2021 09:02:09 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:36787 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231848AbhKROCH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Nov 2021 09:02:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1637243947; x=1668779947;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=SHRzlI9IOqhVEUvv8yRyRNjixW4+joD+VQ66SbP/hoo=;
  b=WFAYNj+1bWHmZrrUzfA1JA2woQ9L4mraM3zcEvllAje3n928kAnnmdnD
   6L7y6X/0wA9k9qqtI8dA1RKZwa+sPxP1yRZ1oUEXhcs+ZDg9Exfrazz2e
   ywpf9P+kHInmvhkp4xfI09K5qwyqIPqd8IbQorcFl7XHaHdYFNJDVenWl
   0=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 18 Nov 2021 05:59:07 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2021 05:59:06 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Thu, 18 Nov 2021 05:59:06 -0800
Received: from [10.216.52.30] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Thu, 18 Nov
 2021 05:59:02 -0800
Subject: Re: [PATCH V3 1/4] regulator: dt-bindings: Add pm8008 regulator
 bindings
To:     Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
CC:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, <subbaram@codeaurora.org>,
        Das Srinagesh <gurus@codeaurora.org>,
        <linux-arm-msm@vger.kernel.org>, Lee Jones <lee.jones@linaro.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <1635434072-32055-1-git-send-email-quic_c_skakit@quicinc.com>
 <1635434072-32055-2-git-send-email-quic_c_skakit@quicinc.com>
 <CAE-0n53G4dwj6yLV6G3VehzzKLW-A5q8v=Ld6RFS7QXm5TjsOA@mail.gmail.com>
From:   "Satya Priya Kakitapalli (Temp)" <quic_c_skakit@quicinc.com>
Message-ID: <292d03f6-9575-b3d9-4f0e-014e6284f515@quicinc.com>
Date:   Thu, 18 Nov 2021 19:28:59 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CAE-0n53G4dwj6yLV6G3VehzzKLW-A5q8v=Ld6RFS7QXm5TjsOA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 10/29/2021 1:36 AM, Stephen Boyd wrote:
> Quoting Satya Priya (2021-10-28 08:14:29)
>> diff --git a/Documentation/devicetree/bindings/regulator/qcom,pm8008-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,pm8008-regulator.yaml
>> new file mode 100644
>> index 0000000..cc624d1
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/regulator/qcom,pm8008-regulator.yaml
>> @@ -0,0 +1,74 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/regulator/qcom,pm8008-regulator.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Technologies, Inc. PM8008 Regulator bindings
>> +
>> +maintainers:
>> +  - Satya Priya <skakit@codeaurora.org>
>> +
>> +description:
>> +  Qualcomm Technologies, Inc. PM8008 is an I2C controlled PMIC
>> +  containing 7 LDO regulators.
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,pm8008-regulator
> Maybe qcom,pm8008-regulators because there's more than one?
Okay
>> +
>> +  "#address-cells":
>> +    const: 1
>> +
>> +  "#size-cells":
>> +    const: 0
>> +
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
>> +patternProperties:
>> +  "^l[1-7]@[0-9a-f]+$":
>> +    type: object
>> +
>> +    $ref: "regulator.yaml#"
>> +
>> +    description: PM8008 regulator peripherals of PM8008 regulator device
>> +
>> +    properties:
>> +      reg:
>> +        maxItems: 1
>> +        description: Base address of the regulator.
>> +
>> +      regulator-name: true
>> +
>> +      regulator-min-dropout-voltage-microvolt:
> This needs to move to regulator.yaml in a separate patch.
Okay
>> +        description:
>> +          Specifies the minimum voltage in microvolts that the parent
>> +          supply regulator must output, above the output of this
>> +          regulator.
>> +
