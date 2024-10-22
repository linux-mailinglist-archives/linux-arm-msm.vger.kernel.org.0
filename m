Return-Path: <linux-arm-msm+bounces-35361-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5904A9A9C79
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 10:26:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DEB5E1F23031
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 08:26:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A994916DECB;
	Tue, 22 Oct 2024 08:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="WiJO+2IF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59EE15E5D3;
	Tue, 22 Oct 2024 08:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729585601; cv=none; b=KsESNnGmIwrBJJKVSzw4Ad4z/DStKtaK/lA3LaYdm/8B7k0pg6r8KlaFjq2GUitj9cNHQg4UK0Gv/41KquMN43uJs8oeT0STIV7vSAvXuwxrbeAVgeyFKXjJRJ62ConXFmPXRzpeLv5I1gVfsx7RCLRpZAApfJBOjj2jd9NONVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729585601; c=relaxed/simple;
	bh=C7aO/hzpziBeQuSjPv/OlqgzNUUSYqTi5CFAiBfPcBM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=uoVFEzfHzSro+fmgecF8aqykun8nKfbc8xx0DJjb9PFmiKugvs6F9H2/znpbbAXZ2tK8CrMHsFMirRpeR/eyH5YUNSsz92jt2z11cp7wMVbzaDCexK/pELJZx4HdLanBiyeSYOtFsxr7ksjSkDemEjlyZVCui5iBUzm9kBAUG0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=WiJO+2IF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49LMjsTv016524;
	Tue, 22 Oct 2024 08:26:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zYF2TqaxyaMS2H/S0OkwQv2lL4FsThRAvPYU3A4I+Ng=; b=WiJO+2IFSM3du+MA
	6b+95a4f2hgQ3wcgwW3c14mmdX9u8uxsuLYz4ayNiTirCcijNJhZ8P3HYygfABJ/
	guNhZrY8zBY2FZI7eQwm/m5xfRReHIJPnk11W7JcxM4Qd6kobWJL+hxhhXBJMYgM
	Wk+OJXNL8MuOV3kM85aZ4kNr8xPgCQJ/qNPuJn1CA+6TveCHyDcH9utx99Wh8XV6
	RFjJOPfZEm5YE3387zBs/m2X+hR8xvcQUdj8FDk2gG71N2D+cf9c+l1ujMZwGSw0
	p4qxktqrGUY/FVcvP5AK00Atf22P8dOevjO+3Ku1eu1Ef1++r0rGAAj3sgTX+JUF
	IN3Ttw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42c6rbfhg6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Oct 2024 08:26:35 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49M8QYdv004384
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Oct 2024 08:26:34 GMT
Received: from [10.231.207.28] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 22 Oct
 2024 01:26:28 -0700
Message-ID: <5c23a6bd-e233-4b02-86cf-902d2c57c382@quicinc.com>
Date: Tue, 22 Oct 2024 16:26:25 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: qcs615: Adds SPMI bus, PMIC and
 peripherals
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <quic_fenglinw@quicinc.com>, <quic_tingweiz@quicinc.com>,
        <kernel@quicinc.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20241014-adds-spmi-pmic-peripherals-for-qcs615-v1-1-8a3c67d894d8@quicinc.com>
 <p7fw7jjfawbnk2vb7zdtr2dp3ni4g2uuiwvt6o4qva53zyrpvd@kokibgaidfzb>
Content-Language: en-US
From: Tingguo Cheng <quic_tingguoc@quicinc.com>
In-Reply-To: <p7fw7jjfawbnk2vb7zdtr2dp3ni4g2uuiwvt6o4qva53zyrpvd@kokibgaidfzb>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: dA6k_AItRCXgdYRRhbcXfPWfoIaJyuIs
X-Proofpoint-GUID: dA6k_AItRCXgdYRRhbcXfPWfoIaJyuIs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 malwarescore=0 mlxscore=0 suspectscore=0 spamscore=0
 impostorscore=0 phishscore=0 mlxlogscore=999 lowpriorityscore=0
 clxscore=1011 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410220054



On 10/14/2024 6:53 PM, Dmitry Baryshkov wrote:
> On Mon, Oct 14, 2024 at 06:08:17PM +0800, Tingguo Cheng wrote:
>> Create a new file qcs615-pmic.dtsi to add on-board PMIC and peripher-
>> als in the PMIC that controlled by SPMI bus. The peripherals include
>> GPIO, RTC, PON, power key and resin-key for QCS615 platform. The power
>> key and volume down key are controlled by PMIC PON hardware on QCS615.
> 
> Why do you need a separate file? Unless there is a good reason such
> configuration should be split between the pmic.dtsi and the board file.
> 
One reason is that I use upstream as 
template(x1ee80100,sc8180x,sa8775p...), they all have 
platform-pmics.dtsi alongside.

On the other hand, qcs615-pmic.dtsi contains only the PMIC's 
peripherals, creating a new file can eliminate duplicate code if there 
are any other new boards with pmm6155au as their PMIC(similar to 
x1e80100-lenovo-xxx/x1e80100-microsoft-xxxx, where "x1e80100-pmics.dtsi" 
has been included).
> BTW, what is the PMIC id for pmm6155au? Is it a real PMIC or a version
> of some other PMIC?
> 
pmm6155au is the PMIC id(Silk scree). It's a real PMIC for qcs615.Maybe 
I should use the name qcs615-pmics.dtsi instead of qcs6150-pmic.dtsi to 
align with other platforms.
>>
>> Signed-off-by: Tingguo Cheng <quic_tingguoc@quicinc.com>
>> ---
>> This patch depends on the patch series:
>> - https://lore.kernel.org/all/20240926-add_initial_support_for_qcs615-v3-0-e37617e91c62@quicinc.com/
>> ---
>>   arch/arm64/boot/dts/qcom/qcs615-pmic.dtsi | 56 +++++++++++++++++++++++++++++++
>>   arch/arm64/boot/dts/qcom/qcs615-ride.dts  |  1 +
>>   arch/arm64/boot/dts/qcom/qcs615.dtsi      | 23 +++++++++++++
>>   3 files changed, 80 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs615-pmic.dtsi b/arch/arm64/boot/dts/qcom/qcs615-pmic.dtsi
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..d5e98503bb32aa6c75f9a9c613d562c6140ddf14
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/qcs615-pmic.dtsi
>> @@ -0,0 +1,56 @@
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +/*
>> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +#include <dt-bindings/input/input.h>
>> +#include <dt-bindings/spmi/spmi.h>
>> +
>> +&spmi_bus {
>> +	pmm6155au_0: pmic@0 {
>> +		compatible = "qcom,spmi-pmic";
>> +		reg = <0x0 SPMI_USID>;
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +
>> +		pmm6155au_0_pon: pon@800 {
>> +			compatible = "qcom,pm8998-pon";
>> +			reg = <0x800>;
>> +
>> +			pon_pwrkey: pwrkey {
>> +				compatible = "qcom,pm8941-pwrkey";
>> +				interrupts = <0x0 0x8 0x0 IRQ_TYPE_EDGE_BOTH>;
>> +				debounce = <15625>;
>> +				bias-pull-up;
>> +				linux,code = <KEY_POWER>;
>> +			};
>> +
>> +			pon_resin: resin {
>> +				compatible = "qcom,pm8941-resin";
>> +				interrupts = <0x0 0x8 0x1 IRQ_TYPE_EDGE_BOTH>;
>> +				debounce = <15625>;
>> +				bias-pull-up;
>> +				linux,code = <KEY_VOLUMEDOWN>;
>> +			};
>> +		};
>> +
>> +		pmm6155au_0_rtc: rtc@6100 {
>> +			compatible = "qcom,pm8941-rtc";
>> +			reg = <0x6100>, <0x6200>;
>> +			reg-names = "rtc", "alarm";
>> +			interrupts = <0x0 0x61 0x1 IRQ_TYPE_EDGE_RISING>;
>> +			allow-set-time;
>> +		};
>> +
>> +		pmm6155au_0_gpios: gpio@c000 {
>> +			compatible = "qcom,pm8150-gpio";
>> +			reg = <0xc000>;
>> +			gpio-controller;
>> +			gpio-ranges = <&pmm6155au_0_gpios 0 0 12>;
>> +			#gpio-cells = <2>;
>> +			interrupt-controller;
>> +			#interrupt-cells = <2>;
>> +		};
>> +	};
>> +};
>> +
>> diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>> index 4ef969a6af150933c72a7a83374a5a2657eebc1b..b79c22730920e3097425e1d1933e744205b3c18e 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>> @@ -6,6 +6,7 @@
>>   
>>   #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>>   #include "qcs615.dtsi"
>> +#include "qcs615-pmic.dtsi"
>>   / {
>>   	model = "Qualcomm Technologies, Inc. QCS615 Ride";
>>   	compatible = "qcom,qcs615-ride", "qcom,qcs615";
>> diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
>> index ac4c4c751da1fbb28865877555ba317677bc6bd2..9793161db515a2ef1df6465c8d0a04a11e71ffc1 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
>> @@ -517,6 +517,29 @@ sram@c3f0000 {
>>   			reg = <0x0 0x0c3f0000 0x0 0x400>;
>>   		};
>>   
>> +		spmi_bus: qcom,spmi@c440000 {
>> +			compatible = "qcom,spmi-pmic-arb";
>> +			reg = <0x0 0xc440000 0x0 0x1100>,
>> +			      <0x0 0xc600000 0x0 0x2000000>,
>> +			      <0x0 0xe600000 0x0 0x100000>,
>> +			      <0x0 0xe700000 0x0 0xa0000>,
>> +			      <0x0 0xc40a000 0x0 0x26000>;
>> +			reg-names = "core",
>> +				    "chnls",
>> +				    "obsrvr",
>> +				    "intr",
>> +				    "cnfg";
>> +			interrupts-extended = <&pdc 1 IRQ_TYPE_LEVEL_HIGH>;
>> +			interrupt-names = "periph_irq";
>> +			interrupt-controller;
>> +			#interrupt-cells = <4>;
>> +			#address-cells = <2>;
>> +			#size-cells = <0>;
>> +			cell-index = <0>;
>> +			qcom,channel = <0>;
>> +			qcom,ee = <0>;
>> +		};
>> +
>>   		intc: interrupt-controller@17a00000 {
>>   			compatible = "arm,gic-v3";
>>   			reg = <0x0 0x17a00000 0x0 0x10000>,     /* GICD */
>>
>> ---
>> base-commit: c83f0b825741bcb9d8a7be67c63f6b9045d30f5a
>> change-id: 20240929-adds-spmi-pmic-peripherals-for-qcs615-16ee53179a7d
>> prerequisite-change-id: 20240924-add_initial_support_for_qcs615-a01bb2dd4650:v3
>> prerequisite-patch-id: 09782474af7eecf1013425fd34f9d2f082fb3616
>> prerequisite-patch-id: 624720e543d7857e46d3ee49b8cea413772deb4c
>> prerequisite-patch-id: 04ca722967256efddc402b7bab94136a5174b0b9
>> prerequisite-patch-id: ab88a42ec69ad90e8509c9c5b7c6bdd595a7f783
>> prerequisite-patch-id: 918724fafe43acaa4c4b980bfabe36e9c3212cd1
>> prerequisite-patch-id: 91cb230c6d129ff21c24d124fad9e37a66cb6a22
>> prerequisite-patch-id: 57afeee80c9aa069ee243f5a5b634702867d20f1
>>
>> Best regards,
>> -- 
>> Tingguo Cheng <quic_tingguoc@quicinc.com>
>>
> 

-- 
Thank you & BRs
Tingguo


