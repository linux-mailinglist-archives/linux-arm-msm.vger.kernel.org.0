Return-Path: <linux-arm-msm+bounces-56194-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 19674AA4214
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 07:01:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 488A81B62C2D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 05:01:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FC8C2AF19;
	Wed, 30 Apr 2025 05:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YLrXo4YM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47BEFEC2;
	Wed, 30 Apr 2025 05:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745989288; cv=none; b=l90Q8vbOnWQPmnySpC1mF/fbYj2ZCIB3b7GGvhNJPHkWsBEefZVoVoOkzV66O0IRZiGOnWUCLabJeTLPveZaVy3Wcl9ARjcxWrAgB4Ui74CHZZkDDX6PzsCmeVt41t162SN7JTMNt/47EXGIsQUfokYqnVeKlkAISmbCtgd+mFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745989288; c=relaxed/simple;
	bh=SHYXxoFgaXiYqZPqs2AGQl+X/4o4ptm1z+faoy0xqSs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=CRfTLfcFouiWVwSO1W+EIp4k5sKX+exNidh3DYvvJCYIpWLofTum2hpAeTQd7y4bchze0POpnhm0rm1KovSTB+l19kAcZ9Km9P7ig3obttr+GFEbfS5CEiWzp4qAC2zMCuwavh+BfYnm0MntCcDI+Y0SwRUTxwui20LHIGAUZgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YLrXo4YM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TLaLNe020908;
	Wed, 30 Apr 2025 05:01:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MoO94F9INyJM5dUZAvor15RuNFa9ToFOlM0nUC7v1lQ=; b=YLrXo4YMf0itZdEr
	b5soe+sICnQ94IafB4vWYcTYoMeT6BaOgHbwL0a09Jub6cHaAIVz1LMbRXACgFlS
	J/lxwlU/m0oD2YO2ERz1SAI0b75cELQj3OqygqS7PvS1znTIL//wbCo6BH3taQxP
	PyK9gDDG9BHhVTac7nvUtnG08UqiwWqjFwgJYvpIvn1HZUp3L5ftgC/mfYGWGj7+
	Fhi/Y9gW1guBn5yTF2VLe7gEHcBJmFJaZvYvj6r9uIfap4q1mcvjO4OKHmv0lE9v
	YpVWoDq9PD6HI5RfiRgjv2Bd7WQPDClmH4Ed5is2QaQWGbZuQx5pif7/S8Lxf8Q+
	VPl25A==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u1ru94-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 05:01:21 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53U51K7p002133
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 05:01:20 GMT
Received: from [10.218.23.250] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 29 Apr
 2025 22:01:16 -0700
Message-ID: <f93ad19f-be77-4bba-988e-9328c67cd761@quicinc.com>
Date: Wed, 30 Apr 2025 10:31:13 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: clock: Add Qualcomm SC8180X Camera clock
 controller
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Stephen
 Boyd" <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        "Jagadeesh
 Kona" <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250422-sc8180x-camcc-support-v1-0-691614d13f06@quicinc.com>
 <20250422-sc8180x-camcc-support-v1-1-691614d13f06@quicinc.com>
 <a4149ac8-7e47-48a9-84ef-42aa367d014e@linaro.org>
Content-Language: en-US
From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
In-Reply-To: <a4149ac8-7e47-48a9-84ef-42aa367d014e@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=G5AcE8k5 c=1 sm=1 tr=0 ts=6811aea1 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=gEfo2CItAAAA:8 a=COk6AnOGAAAA:8 a=ZukvfIeAY5YyO8ZDUFMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=sptkURWiP4Gy88Gu7hUp:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDAzMiBTYWx0ZWRfX5W2JgKD+YMcu FN7UEYW6zdW/v9c3haQnd2iB0CtxwTEXADIW1K3Hhq4AEjGZm5eC587wE+Pr9UGA3jYDdIPRfyS bcpXga8+r3ED3LcQSk1VsLZlwExkS8C8PVq3KBn8sqHuaHHmI1CdtNTMO3YcKwlyalLq7+98C+J
 xHx+9oifTIXvHpBlouaIcmQ3Ns3FDXresGE8OQQXJqEWQIu3DKqLUgy4Xj6p6HR7DUuOXmV0N6+ toNu9x0L2HfQ+wZ65BHyr1uzdtIuRFKpFYy/D54avpzeQGCJ8u6CrUyan+Ll1J1YAVCf0+djy96 /l7Q8HBiTFPTFs+DvveaCWhvml0zM2x5Gu55DlG0DYW2UK5Ak3ojdmX0TnFTeSZkxpHBDxboC+H
 kNi6bSInQiizUDKxzg+pWXTgQ1EBHYHgNjl1Va0iJI28bTal8TYVjpFjC7jK49bp1ayuBvOo
X-Proofpoint-GUID: ntuiGcgsIbznuWZKe0VznswMRhvfryEO
X-Proofpoint-ORIG-GUID: ntuiGcgsIbznuWZKe0VznswMRhvfryEO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 impostorscore=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 adultscore=0 mlxscore=0 malwarescore=0 suspectscore=0
 clxscore=1011 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504300032


On 4/26/2025 7:33 PM, Vladimir Zapolskiy wrote:
> On 4/22/25 08:42, Satya Priya Kakitapalli wrote:
>> Add device tree bindings for the camera clock controller on
>> Qualcomm SC8180X platform.
>>
>> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
>> ---
>>   .../bindings/clock/qcom,sc8180x-camcc.yaml         |  65 ++++++++
>>   include/dt-bindings/clock/qcom,sc8180x-camcc.h     | 181 
>> +++++++++++++++++++++
>>   2 files changed, 246 insertions(+)
>>
>> diff --git 
>> a/Documentation/devicetree/bindings/clock/qcom,sc8180x-camcc.yaml 
>> b/Documentation/devicetree/bindings/clock/qcom,sc8180x-camcc.yaml
>> new file mode 100644
>> index 
>> 0000000000000000000000000000000000000000..b17f40ee53a3002b2942869d60773dbecd764134
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/qcom,sc8180x-camcc.yaml
>> @@ -0,0 +1,65 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/clock/qcom,sc8180x-camcc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Camera Clock & Reset Controller on SC8180X
>> +
>> +maintainers:
>> +  - Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
>> +
>> +description: |
>> +  Qualcomm camera clock control module provides the clocks, resets and
>> +  power domains on SC8180X.
>> +
>> +  See also: include/dt-bindings/clock/qcom,sc8180x-camcc.h
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,sc8180x-camcc
>> +
>> +  clocks:
>> +    items:
>> +      - description: Board XO source
>
> From sc8180x_rpmh_clocks[] in clk/qcom/clk-rpmh.c I get that there is
> RPMH_CXO_CLK_A clock also, shall it be added to this list then?
>
> If yes, and taking into account Konrad's ask for GCC_CAMERA_AHB_CLK, it
> implies that the new dt bindings can be omitted, instead please consider
> to add the 'qcom,sc8180x-camcc' compatible into qcom,sa8775p-camcc.yaml.
>
> However still there is a difference, qcom,sa8775p-camcc and 
> qcom,qcs8300-camcc
> does not contain 'required-opps' property, it might be an omission over
> there though, please double check it. The ultimate goal would be to get
> a shorter list of different camcc dt bindings.


The RPMH_CXO_CLK_A clock is not needed for this, and "required-opps" is 
needed to keep the rail above retention, hence it is better to keep the 
separate bindings for this.


>
>> +      - description: Sleep clock source
>> +
>> +  power-domains:
>> +    maxItems: 1
>> +    description:
>> +      A phandle and PM domain specifier for the MMCX power domain.
>> +
>> +  required-opps:
>> +    maxItems: 1
>> +    description:
>> +      A phandle to an OPP node describing required MMCX performance 
>> point.
>> +
>> +allOf:
>> +  - $ref: qcom,gcc.yaml#
>> +
>> +required:
>> +  - compatible
>> +  - clocks
>> +  - power-domains
>> +  - required-opps
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/qcom,gcc-sc8180x.h>
>> +    #include <dt-bindings/clock/qcom,rpmh.h>
>> +    #include <dt-bindings/power/qcom-rpmpd.h>
>> +    clock-controller@ad00000 {
>> +      compatible = "qcom,sc8180x-camcc";
>> +      reg = <0x0ad00000 0x20000>;
>> +      clocks = <&rpmhcc RPMH_CXO_CLK>,
>> +               <&sleep_clk>;
>> +      power-domains = <&rpmhpd SC8180X_MMCX>;
>> +      required-opps = <&rpmhpd_opp_low_svs>;
>> +
>> +      #clock-cells = <1>;
>> +      #reset-cells = <1>;
>> +      #power-domain-cells = <1>;
>> +    };
>> +...
>
> -- 
> Best wishes,
> Vladimir

