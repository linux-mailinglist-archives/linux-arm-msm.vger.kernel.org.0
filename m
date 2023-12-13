Return-Path: <linux-arm-msm+bounces-4510-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E166D810CA5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Dec 2023 09:42:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6F5F91F2119D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Dec 2023 08:42:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 869941EB2F;
	Wed, 13 Dec 2023 08:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="iB7k1AMs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3034DE8;
	Wed, 13 Dec 2023 00:42:45 -0800 (PST)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BD7r1ak003468;
	Wed, 13 Dec 2023 08:42:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=iAjFsOwENPi7BwNpFRzZmgyc+Bw78gJRbpoqxoD3c+8=; b=iB
	7k1AMsrq9g5IUpWmOdaYFr7oaRThtRqe4xwvgpK3P0raEYOnMFYYOIwxSDg3Kclo
	zGlmm86Ga0ulaewGvxBSLIf7O6pRunrpS0h4aJBxw8kGAatTkviJIp4IgZ8TnT8Z
	XkS1ZNUEuaVmsNdA+SlRruFbElUNAZFEaQS9IRDaqxAtIo4tJ2+tZz4ZrK4rFLtc
	9lL6gPGs65SzYRotQN2ug7pZqwdjzOdfCM0RDe3cXNLZ2gXhCDQ5gkl3t15m7KAT
	qacubV4svHcADlLnPWeVgOV+c+AoppUOxsafr6zxqkM5GHwD77gjLtbaURovBOcr
	E7nK1MujQB4X0NITXyaQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uy4kjgp4e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Dec 2023 08:42:31 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BD8gUgD029301
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Dec 2023 08:42:30 GMT
Received: from [10.253.13.71] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 13 Dec
 2023 00:42:25 -0800
Message-ID: <d8e723f0-2c51-402b-9464-7e4a928cf748@quicinc.com>
Date: Wed, 13 Dec 2023 16:42:22 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] dt-bindings: net: ipq4019-mdio: Document ipq5332
 platform
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
CC: <agross@kernel.org>, <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
        <pabeni@redhat.com>, <krzysztof.kozlowski+dt@linaro.org>,
        <conor+dt@kernel.org>, <andrew@lunn.ch>, <hkallweit1@gmail.com>,
        <linux@armlinux.org.uk>, <robert.marko@sartura.hr>,
        <linux-arm-msm@vger.kernel.org>, <netdev@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_srichara@quicinc.com>
References: <20231212115151.20016-1-quic_luoj@quicinc.com>
 <20231212115151.20016-6-quic_luoj@quicinc.com>
 <20231212200641.GA2331615-robh@kernel.org>
From: Jie Luo <quic_luoj@quicinc.com>
In-Reply-To: <20231212200641.GA2331615-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 34yrAcRTHXBHQBaobTMc3Bf9q-h_bjus
X-Proofpoint-ORIG-GUID: 34yrAcRTHXBHQBaobTMc3Bf9q-h_bjus
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 lowpriorityscore=0 mlxscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 mlxlogscore=999 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312130061



On 12/13/2023 4:06 AM, Rob Herring wrote:
> On Tue, Dec 12, 2023 at 07:51:50PM +0800, Luo Jie wrote:
>> Update the yaml file for the new DTS properties.
>>
>> 1. cmn-reference-clock for the CMN PLL source clock select.
>> 2. clock-frequency for MDIO clock frequency config.
>> 3. add uniphy AHB & SYS GCC clocks.
>> 4. add reset-gpios for MDIO bus level reset.
>>
>> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
>> ---
>>   .../bindings/net/qcom,ipq4019-mdio.yaml       | 157 +++++++++++++++++-
>>   1 file changed, 153 insertions(+), 4 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/net/qcom,ipq4019-mdio.yaml b/Documentation/devicetree/bindings/net/qcom,ipq4019-mdio.yaml
>> index 3407e909e8a7..9546a6ad7841 100644
>> --- a/Documentation/devicetree/bindings/net/qcom,ipq4019-mdio.yaml
>> +++ b/Documentation/devicetree/bindings/net/qcom,ipq4019-mdio.yaml
>> @@ -20,6 +20,8 @@ properties:
>>             - enum:
>>                 - qcom,ipq6018-mdio
>>                 - qcom,ipq8074-mdio
>> +              - qcom,ipq9574-mdio
>> +              - qcom,ipq5332-mdio
>>             - const: qcom,ipq4019-mdio
> 
> A driver can function without knowing about all these new registers and
> clocks? If not, then it can't be compatible with "qcom,ipq4019-mdio".

Yes, the driver can work without knowing the compatible string.
the configuration is decided by the DT property defined or not.

> 
>>   
>>     "#address-cells":
>> @@ -30,19 +32,71 @@ properties:
>>   
>>     reg:
>>       minItems: 1
>> -    maxItems: 2
>> +    maxItems: 5
>>       description:
>> -      the first Address and length of the register set for the MDIO controller.
>> -      the second Address and length of the register for ethernet LDO, this second
>> -      address range is only required by the platform IPQ50xx.
>> +      the first Address and length of the register set for the MDIO controller,
>> +      the optional second, third and fourth address and length of the register
>> +      for ethernet LDO, these three address range are required by the platform
>> +      IPQ50xx/IPQ5332/IPQ9574, the last address and length is for the CMN clock
>> +      to select the reference clock.
>> +
>> +  reg-names:
>> +    minItems: 1
>> +    maxItems: 5
>>   
>>     clocks:
>> +    minItems: 1
>>       items:
>>         - description: MDIO clock source frequency fixed to 100MHZ
>> +      - description: UNIPHY0 AHB clock source frequency fixed to 100MHZ
>> +      - description: UNIPHY1 AHB clock source frequency fixed to 100MHZ
>> +      - description: UNIPHY0 SYS clock source frequency fixed to 24MHZ
>> +      - description: UNIPHY1 SYS clock source frequency fixed to 24MHZ
> 
> These are all clock inputs to this h/w block and not some other clocks
> you want to manage?

Yes, for ipq5332, these 5 clocks are need to be managed, for the legacy 
platform such as ipq8074, only MDIO clock is needed.

No other more clock needs to be managed for the current IPQ platforms.

> 
>>   
>>     clock-names:
>> +    minItems: 1
>>       items:
>>         - const: gcc_mdio_ahb_clk
>> +      - const: gcc_uniphy0_ahb_clk
>> +      - const: gcc_uniphy1_ahb_clk
>> +      - const: gcc_uniphy0_sys_clk
>> +      - const: gcc_uniphy1_sys_clk
> 
> "gcc" is presumably the name of the clock controller in QCom chips.
> Well, the clock source should not be part of the binding. The names
> should be local for what they are for. So drop 'gcc_'. And '_clk' is
> also redundant, so drop it too. Unfortunately you are stuck with the
> name of the 1st entry.

Yes, gcc is the name of QCOM SOC clock controller.
will remove the "gcc_" and "_clk" for the new added clocks.

we should keep the existed DT gcc_mdio_ahb_clk unmodified, right?
since it has been used in the current device tree.

> 
>> +
>> +  cmn-reference-clock:
>> +    oneOf:
>> +      - items:
>> +          - enum:
>> +              - 0   # CMN PLL reference internal 48MHZ
>> +              - 1   # CMN PLL reference external 25MHZ
>> +              - 2   # CMN PLL reference external 31250KHZ
>> +              - 3   # CMN PLL reference external 40MHZ
>> +              - 4   # CMN PLL reference external 48MHZ
>> +              - 5   # CMN PLL reference external 50MHZ
>> +              - 6   # CMN PLL reference internal 96MHZ
>> +
>> +  clock-frequency:
>> +    oneOf:
>> +      - items:
>> +          - enum:
>> +              - 12500000
>> +              - 6250000
>> +              - 3125000
>> +              - 1562500
>> +              - 781250
>> +              - 390625
>> +    description:
>> +      The MDIO bus clock that must be output by the MDIO bus hardware,
>> +      only the listed frequecies above can be configured, other frequency
>> +      will cause malfunction. If absent, the default hardware value is used.
>> +
>> +  reset-gpios:
>> +    maxItems: 1
>> +
>> +  reset-assert-us:
>> +    maxItems: 1
>> +
>> +  reset-deassert-us:
>> +    maxItems: 1
>>   
>>   required:
>>     - compatible
>> @@ -61,6 +115,8 @@ allOf:
>>                 - qcom,ipq5018-mdio
>>                 - qcom,ipq6018-mdio
>>                 - qcom,ipq8074-mdio
>> +              - qcom,ipq5332-mdio
>> +              - qcom,ipq9574-mdio
>>       then:
>>         required:
>>           - clocks
>> @@ -70,6 +126,40 @@ allOf:
>>           clocks: false
>>           clock-names: false
>>   
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - qcom,ipq5332-mdio
>> +    then:
>> +      properties:
>> +        clocks:
>> +          minItems: 5
>> +          maxItems: 5
>> +        reg-names:
>> +          items:
>> +            - const: mdio
>> +            - const: eth_ldo1
>> +            - const: eth_ldo2
>> +            - const: cmn_blk
> 
> Perhaps cmn_blk should come 2nd, so all the variants have the same entry
> indices. Then you can move this to the top level and just say 'minItems:
> 4' here.

Thanks Rob for the suggestion, i will update to move cmn_blk to the 2nd
location.

> 
> 
>> +
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - qcom,ipq9574-mdio
>> +    then:
>> +      properties:
>> +        reg-names:
>> +          items:
>> +            - const: mdio
>> +            - const: eth_ldo1
>> +            - const: eth_ldo2
>> +            - const: eth_ldo3
>> +            - const: cmn_blk
> 
> And 'minItems: 5' here.
> 
> The ipq9574 adds the CMN block, but none of the clocks? Weird.
> 
> Rob

For ipq9574, only mdio clock is needed, the uniphy ahb and sys clock is
not needed to configure.

Yes, there is some Ethernet design delta between ipq9574 and ipq5332.

