Return-Path: <linux-arm-msm+bounces-7083-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4924C82B9D1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jan 2024 04:01:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0112328C83C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jan 2024 03:01:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BBB86FD8;
	Fri, 12 Jan 2024 03:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="AptbD9SP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61CF310958;
	Fri, 12 Jan 2024 03:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40C0VPai026367;
	Fri, 12 Jan 2024 03:00:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=rJ0WjpcBZ6LxL7MiG1G9uZoN9W68Z8hvPs3039ksjCY=; b=Ap
	tbD9SPLb6fkDokSV1+O5IClGvHa1FJny8/Nhm3P9Uttvo/ywxJkiurec6juUBaU8
	ESJQZp9cXXt4Q/Ms/FLWtQuwaBW8M4A2I8ZUQX6l5XF2P6ilGNeENFZs29UeuF8o
	EaVSnWoStinVg2X6D+1Y8L2uAbWE6cMlT2DxHD7ZJMdhijHEULFnfvklvJqKmTsW
	R45/9SqsL1d5kdYNCm+T9z3hNUEC5WsGhWOKnwpLOLW1HRGFxT2gH2Nn/+b/pNKI
	RZMeLGgRHNTGuAI1pNAAKCJVFivWtc23TI2+IVnElTLi3l7ExBU3msTxXbr270Yx
	mCBPWsetOJlDLoIBLlrg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vjcvjt9x3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Jan 2024 03:00:46 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40C30j5p011847
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Jan 2024 03:00:45 GMT
Received: from [10.238.139.231] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 11 Jan
 2024 19:00:42 -0800
Message-ID: <d386ca52-d439-4dc1-abea-392b814c1acd@quicinc.com>
Date: Fri, 12 Jan 2024 11:00:39 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v3] arm64: dts: qcom: qcs6490-idp: Add definition
 for three LEDs.
To: Luca Weiss <luca.weiss@fairphone.com>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20240111-lpg-v3-1-811c9e82dae4@quicinc.com>
 <CYBQW9KRHVJS.3UOHTOMRWDWVK@fairphone.com>
From: hui liu <quic_huliu@quicinc.com>
In-Reply-To: <CYBQW9KRHVJS.3UOHTOMRWDWVK@fairphone.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: q4DIxSTEky-Nc4K5VkcM77Og8onHBdDC
X-Proofpoint-ORIG-GUID: q4DIxSTEky-Nc4K5VkcM77Og8onHBdDC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=891 spamscore=0
 adultscore=0 mlxscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2401120020



On 1/11/2024 4:47 PM, Luca Weiss wrote:
> On Thu Jan 11, 2024 at 3:52 AM CET, Hui Liu via B4 Relay wrote:
>> From: Hui Liu <quic_huliu@quicinc.com>
>>
>> Add definition for three LEDs to make sure they can
>> be enabled base on QCOM LPG LED driver.
>>
>> Signed-off-by: Hui Liu <quic_huliu@quicinc.com>
>> ---
>> Changes in v3:
>> - Rephrased commit text and updated the nodes to qcm6490-idp board file.
>> - Link to v2: https://lore.kernel.org/all/20231110-qcom_leds-v2-1-3cad1fbbc65a@quicinc.com/
>>
>> Changes in v2:
>> - Rephrased commit text and updated the nodes to board file.
>> - Link to v1: https://lore.kernel.org/r/20231108-qcom_leds-v1-1-c3e1c8572cb0@quicinc.com
>> ---
>>   arch/arm64/boot/dts/qcom/qcm6490-idp.dts | 25 +++++++++++++++++++++++++
>>   1 file changed, 25 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
>> index 37c91fdf3ab9..f801144a1556 100644
>> --- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
>> @@ -5,6 +5,7 @@
>>   
>>   /dts-v1/;
>>   
>> +#include <dt-bindings/leds/common.h>
>>   #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>>   #include "sc7280.dtsi"
>>   #include "pm7325.dtsi"
>> @@ -414,6 +415,30 @@ vreg_bob_3p296: bob {
>>   	};
>>   };
>>   
>> +&pm8350c_pwm {
>> +	#address-cells = <1>;
>> +	#size-cells = <0>;
>> +	status = "okay";
>> +
>> +	led@1 {
>> +		reg = <1>;
> 
> Hi Hui Liu,
> 
>> +		color = <LED_COLOR_ID_RED>;
>> +		label = "red";
> 
> Please remove the deprecated "label" property. Since you already have
> "color" set you only need to add "function". On phones for the
> notification LED we usually use "function = LED_FUNCTION_STATUS;"
> 
I will remove it at next version, thanks!
> Also depends on what your hardware looks like, if it's 3 separate LEDs
> then with label replaced it would be okay.
> If the 3 LEDs are in one spot (so you can mix the colors with it), then
> please make it a RGB multi-led like e.g. in sm8550-qrd.dts
The 3 LEDs are separate.

> Regards
> Luca
> 
>> +	};
>> +
>> +	led@2 {
>> +		reg = <2>;
>> +		color = <LED_COLOR_ID_GREEN>;
>> +		label = "green";
>> +	};
>> +
>> +	led@3 {
>> +		reg = <3>;
>> +		color = <LED_COLOR_ID_BLUE>;
>> +		label = "blue";
>> +	};
>> +};
>> +
>>   &qupv3_id_0 {
>>   	status = "okay";
>>   };
>>
>> ---
>> base-commit: 17cb8a20bde66a520a2ca7aad1063e1ce7382240
>> change-id: 20231215-lpg-4aadd374811a
>>
>> Best regards,
> 

