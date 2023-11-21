Return-Path: <linux-arm-msm+bounces-1285-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A317F2467
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Nov 2023 03:52:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 64696B2170D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Nov 2023 02:52:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34F16111BF;
	Tue, 21 Nov 2023 02:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JqGRycEt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20C76BC;
	Mon, 20 Nov 2023 18:52:19 -0800 (PST)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AL2j2ns024613;
	Tue, 21 Nov 2023 02:52:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=+nVNOvHCtkUHIbgX2CusJOA/8Vx1olNyNipis6Ay9HM=;
 b=JqGRycEtK+zLOPuISUoOiWm89mGjY1Kf/lm2AzEP/Y1jzsFfzCldME6SAeGRpoGNKIyy
 rM0oWUhnnpM4HDA63nEF4dsf2sKAPgaBJhRCW3HscBHGQWsRKfiSEYNB2AknZFPKp/y1
 H8951vdzyzbjyo0hArbOI1ltx/wCSTNTTaTCT8gc3EMp4kR6xPfe9g4csjFZFnJsYL3U
 Ei6sVd//61U6/RHUpwRP1q969hXwomDF9KcT1gHgTJnjM3jReXfaiiSIas4M/XDMm784
 g+H7LP5u5WuTduyOzpYCGEZ5vuOgdmFaMaaFM50opNJdt1PoAMqN1DiXoINypwRahpfK wQ== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uge000p0f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Nov 2023 02:52:11 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AL2qBID005840
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Nov 2023 02:52:11 GMT
Received: from [10.239.132.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 20 Nov
 2023 18:52:07 -0800
Message-ID: <b94312ed-4f6f-4eb0-a50f-6f28a25cc198@quicinc.com>
Date: Tue, 21 Nov 2023 10:52:04 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/16] arm64: dts: qcom: sm8550-aim300: add SM8550 AIM300
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, <agross@kernel.org>,
        <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <conor+dt@kernel.org>, <tglx@linutronix.de>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <-cc=kernel@quicinc.com>
References: <20231117101817.4401-1-quic_tengfan@quicinc.com>
 <20231117101817.4401-7-quic_tengfan@quicinc.com>
 <aecb04cd-805d-4c2d-b6a7-67a47b963ee9@linaro.org>
From: Tengfei Fan <quic_tengfan@quicinc.com>
In-Reply-To: <aecb04cd-805d-4c2d-b6a7-67a47b963ee9@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: LLAtslFsFTtKSxvEniLiwnZ2z-j0jYrr
X-Proofpoint-ORIG-GUID: LLAtslFsFTtKSxvEniLiwnZ2z-j0jYrr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-20_22,2023-11-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 bulkscore=0 malwarescore=0 spamscore=0 clxscore=1015 mlxscore=0
 lowpriorityscore=0 mlxlogscore=999 impostorscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311210019



在 11/17/2023 6:28 PM, Dmitry Baryshkov 写道:
> On 17/11/2023 12:18, Tengfei Fan wrote:
>> Add a minimal DTS for the new QRD8550 board, serial, UFS and USB should
>> be working.
> 
> An explanation of what is AIM300 would be welcomed.
> 
Hi Dmitry,
AIM means Artificial Intelligence Module. This hardware platform can be 
used to develop AI related software based on Qualcomm chipset.
I will also update the explanation of AIM to the new patch series.

>>
>> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/Makefile          |   1 +
>>   arch/arm64/boot/dts/qcom/sm8550-aim300.dts | 490 +++++++++++++++++++++
>>   2 files changed, 491 insertions(+)
>>   create mode 100644 arch/arm64/boot/dts/qcom/sm8550-aim300.dts
>>
>> diff --git a/arch/arm64/boot/dts/qcom/Makefile 
>> b/arch/arm64/boot/dts/qcom/Makefile
>> index d6cb840b7050..ea5d4a07671a 100644
>> --- a/arch/arm64/boot/dts/qcom/Makefile
>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>> @@ -229,5 +229,6 @@ dtb-$(CONFIG_ARCH_QCOM)    += sm8450-hdk.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)    += sm8450-qrd.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)    += sm8450-sony-xperia-nagara-pdx223.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)    += sm8450-sony-xperia-nagara-pdx224.dtb
>> +dtb-$(CONFIG_ARCH_QCOM) += sm8550-aim300.dtb
> 
> My email client suggests that alignment is broken here.
> 
>>   dtb-$(CONFIG_ARCH_QCOM)    += sm8550-mtp.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)    += sm8550-qrd.dtb
>> diff --git a/arch/arm64/boot/dts/qcom/sm8550-aim300.dts 
>> b/arch/arm64/boot/dts/qcom/sm8550-aim300.dts
>> new file mode 100644
>> index 000000000000..202b979da8ca
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/sm8550-aim300.dts
>> @@ -0,0 +1,490 @@
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +/*
>> + * Copyright (c) 2023, Qualcomm Innovation Center, Inc. All rights 
>> reserved.
>> + */
>> +
>> +/dts-v1/;
>> +
>> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>> +#include "sm8550.dtsi"
>> +#include "pm8010.dtsi"
>> +#include "pm8550.dtsi"
>> +#include "pm8550b.dtsi"
>> +#include "pm8550ve.dtsi"
>> +#include "pm8550vs.dtsi"
>> +#include "pmk8550.dtsi"
>> +#include "pmr735d_a.dtsi"
>> +#include "pmr735d_b.dtsi"
>> +
>> +/ {
>> +    model = "Qualcomm Technologies, Inc. SM8550 AIM300";
>> +    compatible = "qcom,sm8550-aim300", "qcom,sm8550";
>> +
>> +    aliases {
>> +        serial0 = &uart7;
>> +    };
>> +
>> +    chosen {
>> +        stdout-path = "serial0:115200n8";
>> +    };
>> +
>> +    pmic-glink {
>> +        compatible = "qcom,sm8550-pmic-glink", "qcom,pmic-glink";
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +        orientation-gpios = <&tlmm 11 GPIO_ACTIVE_HIGH>;
>> +
>> +        connector@0 {
>> +            compatible = "usb-c-connector";
>> +            reg = <0>;
>> +            power-role = "dual";
>> +            data-role = "dual";
>> +
>> +            ports {
>> +                #address-cells = <1>;
>> +                #size-cells = <0>;
>> +
>> +                port@0 {
>> +                    reg = <0>;
>> +
>> +                    pmic_glink_hs_in: endpoint {
>> +                        remote-endpoint = <&usb_1_dwc3_hs>;
>> +                    };
>> +                };
>> +
>> +                port@1 {
>> +                    reg = <1>;
>> +
>> +                    pmic_glink_ss_in: endpoint {
>> +                        remote-endpoint = <&usb_1_dwc3_ss>;
>> +                    };
>> +                };
>> +            };
>> +        };
>> +    };
>> +
>> +    vph_pwr: vph-pwr-regulator {
> 
> It's not demanded, I think, but I'd suggest 'regulator-vph-pwr' to allow 
> all regulators to be grouped together.
> 
>> +        compatible = "regulator-fixed";
>> +        regulator-name = "vph_pwr";
>> +        regulator-min-microvolt = <3700000>;
>> +        regulator-max-microvolt = <3700000>;
>> +
>> +        regulator-always-on;
>> +        regulator-boot-on;
>> +    };
>> +};
> 
> Other than that looks good to me.
> 

-- 
Thx and BRs,
Tengfei Fan

