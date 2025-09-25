Return-Path: <linux-arm-msm+bounces-75016-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F24BB9E1C8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 10:47:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A8ED57AFC81
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 08:45:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06731275B16;
	Thu, 25 Sep 2025 08:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RfK8Hqs8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE1F7464;
	Thu, 25 Sep 2025 08:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758790019; cv=none; b=r9iJDYBgxxeFhxGExuRKl8YoJCaXoVwBqn65MNRK7RTF3mzUCMH3uLFdH/avUagJ3F14fs6znXcYm6/+bDH9/iEGWhGnyfUgeoHJhCvLWjn/ARWeQ1usNkCzRauy2Y0UOReYeEIenhnLZX73vUxWQGNga1Sva5CALdSSxD5jAK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758790019; c=relaxed/simple;
	bh=a6bb2nj6NtBB2fEO782kxxy9x6EakI5l4BzC32Fd2xM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Q6Jyef/2qwxQywx+2VIV8M/d6kf/F3ueknXcB14M5oUym7/vgiNm8MrCbqdB0dCS7Hbah0luG3l3eBk0wrindo13UmXukYZavD1Q1dtzGjCYlUbDyNW5FN0tg/yH7QerPsUYebXox5WPo1huF884Spq+UseJMKs3XH71ihx2FEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RfK8Hqs8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P100KY019923;
	Thu, 25 Sep 2025 08:46:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NCYggp0oa3WS+sCeY8ACSU0jLeJBxV/981+lAQ+y5O0=; b=RfK8Hqs85bKUsyMs
	bYnzOOIDZ3Fx6Q0tIw3eDqXCasT5IKaVRqR2U2pOSMpf4OWUi7E4w+qLIxryGAg+
	L7LQ0hsjQgyY/pAT2pnjeYHCcRwS29KK4Y7N1bt0gJQ+Az+Mcge5ipASTge+Y5cI
	WAR4mlv8UlXYIX2ZOJsVi2Vvkv+9oWh+0FRq01Ru19g8fP8uPdS7rkDbXxGD/+xo
	gfxl2x2jOMQwCNsjfJE5EHvfRSV/IeXvev2bX6AijGhkrQwWX6xZLUwez2Zwr2iP
	kvERFJhEFWW1rkUXyAJxR93pGBYi95KSPvIxVAciuWnT/QOzlMt/vcHrvIRayH9O
	M27xOg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bjpe0nb8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Sep 2025 08:46:44 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 58P8khjG009910
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Sep 2025 08:46:43 GMT
Received: from [10.217.216.93] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Thu, 25 Sep
 2025 01:46:36 -0700
Message-ID: <8c558ac3-541b-47c4-be4b-c9101997de7c@quicinc.com>
Date: Thu, 25 Sep 2025 14:16:33 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] dt-bindings: clock: qcom: Add support for CAMCC for
 Kaanapali
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Jingyi Wang
	<jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong
	<neil.armstrong@linaro.org>,
        Vladimir Zapolskiy
	<vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio
	<konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Krzysztof
 Kozlowski" <krzysztof.kozlowski@linaro.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <aiqun.yu@oss.qualcomm.com>,
        <tingwei.zhang@oss.qualcomm.com>, <trilok.soni@oss.qualcomm.com>,
        <yijie.yang@oss.qualcomm.com>
References: <20250924-knp-mmclk-v1-0-d7ea96b4784a@oss.qualcomm.com>
 <20250924-knp-mmclk-v1-3-d7ea96b4784a@oss.qualcomm.com>
 <4315205b-5320-4a8f-a707-45f5eb35ae51@linaro.org>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <4315205b-5320-4a8f-a707-45f5eb35ae51@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: gOvyCpm6vRwXejT-0a-kF1xyV2XwLYVE
X-Authority-Analysis: v=2.4 cv=Pc//hjhd c=1 sm=1 tr=0 ts=68d50174 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8
 a=BqXNtYeTnhAdVobpDk4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: gOvyCpm6vRwXejT-0a-kF1xyV2XwLYVE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDAyMCBTYWx0ZWRfX65GoAxFnLvyI
 Qrijn0Zu+PzQFzUPIg52Ichvy2AZiJSXtFPOdDQAYPxj7njHZJ4X18rXKvEfSFmRO7msZDanMtC
 IckvCcGHYSB5yH6tW/LkyvFj9NMqsM+Hkp7i5XmZl9orod3o797L1koAShPpyjUxoSr5sevlWC9
 fcQ3jS0zp6oJfToQb1PxVbC8sqwmQNzlwsSc6gFf2BX/jpzh8zggb1iOLbmvJ1sVpYBv2WY6+Ky
 zZ/+mrpfLlEdjsiibKFsw/P2kssUcj7tbqCKxYTH0AV+j8B7VQiITQBKIFfH8ZLuUbVR2b0pA/2
 bXOPxbWewug2L4eYbUdL4/LRfT9FzvFnkITnVqi9H5rI5W3MiG/1nP/OMi67/SAcIE11F22opiO
 wWyZIvXc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 spamscore=0 suspectscore=0 clxscore=1011 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509230020



On 9/25/2025 2:09 PM, Bryan O'Donoghue wrote:
> On 25/09/2025 00:56, Jingyi Wang wrote:
>> From: Taniya Das <taniya.das@oss.qualcomm.com>
>>
>> Update the compatible and the bindings for CAMCC support on Kaanapali
>> SoC.
>>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> ---
>>   .../bindings/clock/qcom,sm8450-camcc.yaml          |   8 +-
>>   .../clock/qcom,kaanapali-cambistmclkcc.h           |  33 +++++
>>   include/dt-bindings/clock/qcom,kaanapali-camcc.h   | 147 +++++++++++
>> ++++++++++
>>   3 files changed, 187 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-
>> camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-
>> camcc.yaml
>> index dbfcc399f10b..54b04ecf67c1 100644
>> --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
>> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
>> @@ -12,9 +12,11 @@ maintainers:
>>     description: |
>>     Qualcomm camera clock control module provides the clocks, resets
>> and power
>> -  domains on SM8450.
>> +  domains on SM8450 SoCs.
> 
> This change is not about adding Kaanapali.

Agree.

> 
>>       See also:
>> +    include/dt-bindings/clock/qcom,kaanapali-camcc.h
>> +    include/dt-bindings/clock/qcom,kaanapali-cambistmclkcc.h
> 
> What's so special about Kanaanapli that it needs two headers for this ?
> 

There are two camera clock controllers one has the regular clocks and
the other is for the mclks of the camera clock controller.


> 
>>       include/dt-bindings/clock/qcom,sm8450-camcc.h
>>       include/dt-bindings/clock/qcom,sm8550-camcc.h
>>       include/dt-bindings/clock/qcom,sm8650-camcc.h
>> @@ -22,6 +24,8 @@ description: |
>>   properties:
>>     compatible:
>>       enum:
>> +      - qcom,kaanapali-cambistmclkcc
>> +      - qcom,kaanapali-camcc
>>         - qcom,sm8450-camcc
>>         - qcom,sm8475-camcc
>>         - qcom,sm8550-camcc
>> @@ -63,6 +67,8 @@ allOf:
>>           compatible:
>>             contains:
>>               enum:
>> +              - qcom,kaanapali-cambistmclkcc
>> +              - qcom,kaanapali-camcc
>>                 - qcom,sm8450-camcc
>>                 - qcom,sm8550-camcc
>>       then:
>> diff --git a/include/dt-bindings/clock/qcom,kaanapali-cambistmclkcc.h
>> b/include/dt-bindings/clock/qcom,kaanapali-cambistmclkcc.h
>> new file mode 100644
>> index 000000000000..ddb083b5289e
>> --- /dev/null
>> +++ b/include/dt-bindings/clock/qcom,kaanapali-cambistmclkcc.h
>> @@ -0,0 +1,33 @@
>> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#ifndef _DT_BINDINGS_CLK_QCOM_CAM_BIST_MCLK_CC_KAANAPALI_H
>> +#define _DT_BINDINGS_CLK_QCOM_CAM_BIST_MCLK_CC_KAANAPALI_H
>> +
>> +/* CAM_BIST_MCLK_CC clocks */
>> +#define CAM_BIST_MCLK_CC_DEBUG_CLK                0
>> +#define CAM_BIST_MCLK_CC_DEBUG_DIV_CLK_SRC            1
>> +#define CAM_BIST_MCLK_CC_MCLK0_CLK                2
>> +#define CAM_BIST_MCLK_CC_MCLK0_CLK_SRC                3
>> +#define CAM_BIST_MCLK_CC_MCLK1_CLK                4
>> +#define CAM_BIST_MCLK_CC_MCLK1_CLK_SRC                5
>> +#define CAM_BIST_MCLK_CC_MCLK2_CLK                6
>> +#define CAM_BIST_MCLK_CC_MCLK2_CLK_SRC                7
>> +#define CAM_BIST_MCLK_CC_MCLK3_CLK                8
>> +#define CAM_BIST_MCLK_CC_MCLK3_CLK_SRC                9
>> +#define CAM_BIST_MCLK_CC_MCLK4_CLK                10
>> +#define CAM_BIST_MCLK_CC_MCLK4_CLK_SRC                11
>> +#define CAM_BIST_MCLK_CC_MCLK5_CLK                12
>> +#define CAM_BIST_MCLK_CC_MCLK5_CLK_SRC                13
>> +#define CAM_BIST_MCLK_CC_MCLK6_CLK                14
>> +#define CAM_BIST_MCLK_CC_MCLK6_CLK_SRC                15
>> +#define CAM_BIST_MCLK_CC_MCLK7_CLK                16
>> +#define CAM_BIST_MCLK_CC_MCLK7_CLK_SRC                17
>> +#define CAM_BIST_MCLK_CC_PLL0                    18
>> +#define CAM_BIST_MCLK_CC_PLL_TEST_CLK                19
>> +#define CAM_BIST_MCLK_CC_PLL_TEST_DIV_CLK_SRC            20
>> +#define CAM_BIST_MCLK_CC_SLEEP_CLK                21
>> +
>> +#endif
> 
> BIST == Built In Self Test ?
> 
> Can this not just be put into one camcc header ?

These are two different clock controllers CAMCC and CAM_BIST_MCLK they
should not be in the same header.

> 
>> diff --git a/include/dt-bindings/clock/qcom,kaanapali-camcc.h b/
>> include/dt-bindings/clock/qcom,kaanapali-camcc.h
>> new file mode 100644
>> index 000000000000..58835136b356
>> --- /dev/null
>> +++ b/include/dt-bindings/clock/qcom,kaanapali-camcc.h
>> @@ -0,0 +1,147 @@
>> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#ifndef _DT_BINDINGS_CLK_QCOM_CAM_CC_KAANAPALI_H
>> +#define _DT_BINDINGS_CLK_QCOM_CAM_CC_KAANAPALI_H
>> +
>> +/* CAM_CC clocks */
>> +#define CAM_CC_CAM_TOP_AHB_CLK                    0
>> +#define CAM_CC_CAM_TOP_FAST_AHB_CLK                1
>> +#define CAM_CC_CAMNOC_DCD_XO_CLK                2
>> +#define CAM_CC_CAMNOC_NRT_AXI_CLK                3
>> +#define CAM_CC_CAMNOC_NRT_CRE_CLK                4
>> +#define CAM_CC_CAMNOC_NRT_IPE_NPS_CLK                5
>> +#define CAM_CC_CAMNOC_NRT_OFE_MAIN_CLK                6
>> +#define CAM_CC_CAMNOC_RT_AXI_CLK                7
>> +#define CAM_CC_CAMNOC_RT_AXI_CLK_SRC                8
>> +#define CAM_CC_CAMNOC_RT_IFE_LITE_CLK                9
>> +#define CAM_CC_CAMNOC_RT_TFE_0_MAIN_CLK                10
>> +#define CAM_CC_CAMNOC_RT_TFE_1_MAIN_CLK                11
>> +#define CAM_CC_CAMNOC_RT_TFE_2_MAIN_CLK                12
>> +#define CAM_CC_CAMNOC_XO_CLK                    13
>> +#define CAM_CC_CCI_0_CLK                    14
>> +#define CAM_CC_CCI_0_CLK_SRC                    15
>> +#define CAM_CC_CCI_1_CLK                    16
>> +#define CAM_CC_CCI_1_CLK_SRC                    17
>> +#define CAM_CC_CCI_2_CLK                    18
>> +#define CAM_CC_CCI_2_CLK_SRC                    19
>> +#define CAM_CC_CORE_AHB_CLK                    20
>> +#define CAM_CC_CPHY_RX_CLK_SRC                    21
>> +#define CAM_CC_CRE_AHB_CLK                    22
>> +#define CAM_CC_CRE_CLK                        23
>> +#define CAM_CC_CRE_CLK_SRC                    24
>> +#define CAM_CC_CSI0PHYTIMER_CLK                    25
>> +#define CAM_CC_CSI0PHYTIMER_CLK_SRC                26
>> +#define CAM_CC_CSI1PHYTIMER_CLK                    27
>> +#define CAM_CC_CSI1PHYTIMER_CLK_SRC                28
>> +#define CAM_CC_CSI2PHYTIMER_CLK                    29
>> +#define CAM_CC_CSI2PHYTIMER_CLK_SRC                30
>> +#define CAM_CC_CSI3PHYTIMER_CLK                    31
>> +#define CAM_CC_CSI3PHYTIMER_CLK_SRC                32
>> +#define CAM_CC_CSI4PHYTIMER_CLK                    33
>> +#define CAM_CC_CSI4PHYTIMER_CLK_SRC                34
>> +#define CAM_CC_CSI5PHYTIMER_CLK                    35
>> +#define CAM_CC_CSI5PHYTIMER_CLK_SRC                36
>> +#define CAM_CC_CSID_CLK                        37
>> +#define CAM_CC_CSID_CLK_SRC                    38
>> +#define CAM_CC_CSID_CSIPHY_RX_CLK                39
>> +#define CAM_CC_CSIPHY0_CLK                    40
>> +#define CAM_CC_CSIPHY1_CLK                    41
>> +#define CAM_CC_CSIPHY2_CLK                    42
>> +#define CAM_CC_CSIPHY3_CLK                    43
>> +#define CAM_CC_CSIPHY4_CLK                    44
>> +#define CAM_CC_CSIPHY5_CLK                    45
>> +#define CAM_CC_DRV_AHB_CLK                    46
>> +#define CAM_CC_DRV_XO_CLK                    47
>> +#define CAM_CC_FAST_AHB_CLK_SRC                    48
>> +#define CAM_CC_GDSC_CLK                        49
>> +#define CAM_CC_ICP_0_AHB_CLK                    50
>> +#define CAM_CC_ICP_0_CLK                    51
>> +#define CAM_CC_ICP_0_CLK_SRC                    52
>> +#define CAM_CC_ICP_1_AHB_CLK                    53
>> +#define CAM_CC_ICP_1_CLK                    54
>> +#define CAM_CC_ICP_1_CLK_SRC                    55
>> +#define CAM_CC_IFE_LITE_AHB_CLK                    56
>> +#define CAM_CC_IFE_LITE_CLK                    57
>> +#define CAM_CC_IFE_LITE_CLK_SRC                    58
>> +#define CAM_CC_IFE_LITE_CPHY_RX_CLK                59
>> +#define CAM_CC_IFE_LITE_CSID_CLK                60
>> +#define CAM_CC_IFE_LITE_CSID_CLK_SRC                61
>> +#define CAM_CC_IPE_NPS_AHB_CLK                    62
>> +#define CAM_CC_IPE_NPS_CLK                    63
>> +#define CAM_CC_IPE_NPS_CLK_SRC                    64
>> +#define CAM_CC_IPE_NPS_FAST_AHB_CLK                65
>> +#define CAM_CC_IPE_PPS_CLK                    66
>> +#define CAM_CC_IPE_PPS_FAST_AHB_CLK                67
>> +#define CAM_CC_JPEG_CLK                        68
>> +#define CAM_CC_JPEG_CLK_SRC                    69
>> +#define CAM_CC_OFE_AHB_CLK                    70
>> +#define CAM_CC_OFE_ANCHOR_CLK                    71
>> +#define CAM_CC_OFE_ANCHOR_FAST_AHB_CLK                72
>> +#define CAM_CC_OFE_CLK_SRC                    73
>> +#define CAM_CC_OFE_HDR_CLK                    74
>> +#define CAM_CC_OFE_HDR_FAST_AHB_CLK                75
>> +#define CAM_CC_OFE_MAIN_CLK                    76
>> +#define CAM_CC_OFE_MAIN_FAST_AHB_CLK                77
>> +#define CAM_CC_PLL0                        78
>> +#define CAM_CC_PLL0_OUT_EVEN                    79
>> +#define CAM_CC_PLL0_OUT_ODD                    80
>> +#define CAM_CC_PLL1                        81
>> +#define CAM_CC_PLL1_OUT_EVEN                    82
>> +#define CAM_CC_PLL2                        83
>> +#define CAM_CC_PLL2_OUT_EVEN                    84
>> +#define CAM_CC_PLL3                        85
>> +#define CAM_CC_PLL3_OUT_EVEN                    86
>> +#define CAM_CC_PLL4                        87
>> +#define CAM_CC_PLL4_OUT_EVEN                    88
>> +#define CAM_CC_PLL5                        89
>> +#define CAM_CC_PLL5_OUT_EVEN                    90
>> +#define CAM_CC_PLL6                        91
>> +#define CAM_CC_PLL6_OUT_EVEN                    92
>> +#define CAM_CC_PLL6_OUT_ODD                    93
>> +#define CAM_CC_PLL7                        94
>> +#define CAM_CC_PLL7_OUT_EVEN                    95
>> +#define CAM_CC_QDSS_DEBUG_CLK                    96
>> +#define CAM_CC_QDSS_DEBUG_CLK_SRC                97
>> +#define CAM_CC_QDSS_DEBUG_XO_CLK                98
>> +#define CAM_CC_SLEEP_CLK                    99
>> +#define CAM_CC_SLOW_AHB_CLK_SRC                    100
>> +#define CAM_CC_TFE_0_BAYER_CLK                    101
>> +#define CAM_CC_TFE_0_BAYER_FAST_AHB_CLK                102
>> +#define CAM_CC_TFE_0_CLK_SRC                    103
>> +#define CAM_CC_TFE_0_MAIN_CLK                    104
>> +#define CAM_CC_TFE_0_MAIN_FAST_AHB_CLK                105
>> +#define CAM_CC_TFE_1_BAYER_CLK                    106
>> +#define CAM_CC_TFE_1_BAYER_FAST_AHB_CLK                107
>> +#define CAM_CC_TFE_1_CLK_SRC                    108
>> +#define CAM_CC_TFE_1_MAIN_CLK                    109
>> +#define CAM_CC_TFE_1_MAIN_FAST_AHB_CLK                110
>> +#define CAM_CC_TFE_2_BAYER_CLK                    111
>> +#define CAM_CC_TFE_2_BAYER_FAST_AHB_CLK                112
>> +#define CAM_CC_TFE_2_CLK_SRC                    113
>> +#define CAM_CC_TFE_2_MAIN_CLK                    114
>> +#define CAM_CC_TFE_2_MAIN_FAST_AHB_CLK                115
>> +#define CAM_CC_TRACENOC_TPDM_1_CMB_CLK                116
>> +#define CAM_CC_XO_CLK_SRC                    117
>> +
>> +/* CAM_CC power domains */
>> +#define CAM_CC_IPE_0_GDSC                    0
>> +#define CAM_CC_OFE_GDSC                        1
>> +#define CAM_CC_TFE_0_GDSC                    2
>> +#define CAM_CC_TFE_1_GDSC                    3
>> +#define CAM_CC_TFE_2_GDSC                    4
>> +#define CAM_CC_TITAN_TOP_GDSC                    5
>> +
>> +/* CAM_CC resets */
>> +#define CAM_CC_DRV_BCR                        0
>> +#define CAM_CC_ICP_BCR                        1
>> +#define CAM_CC_IPE_0_BCR                    2
>> +#define CAM_CC_OFE_BCR                        3
>> +#define CAM_CC_QDSS_DEBUG_BCR                    4
>> +#define CAM_CC_TFE_0_BCR                    5
>> +#define CAM_CC_TFE_1_BCR                    6
>> +#define CAM_CC_TFE_2_BCR                    7
>> +
>> +#endif
>>
> 
> 


