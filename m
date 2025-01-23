Return-Path: <linux-arm-msm+bounces-45946-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B36A1A289
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 12:06:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EEB7C160A3D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 11:06:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76CB520C46B;
	Thu, 23 Jan 2025 11:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="meZUpVfG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5BB620CCE3;
	Thu, 23 Jan 2025 11:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737630372; cv=none; b=tAUD6EXoMrjN2GOg/s9OD1vRb9dCGyxcDlgq6CUm4qJ+zQVkZpASpnD6DiedgPOCM41t0qragUZ3jJn1iT2c/Txb8QYwEggCShb6kOjFuFOK190P13ozdtFO+0bVuNZN03RxQwtYf3I4+jt0Wtm/kevsHsBKZ5LyeWt0rnF7iGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737630372; c=relaxed/simple;
	bh=0OPxeCXaaST7I2YJryRt3H8Bs0/9JG+W/26h5l/Lvgc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:CC:References:
	 In-Reply-To:Content-Type; b=duCu2gXX3fpuVBrUIcR2YRKG2V1kAtQNW7TE+/neOxsRiKFNUD9l0WOvWrXKKHriqqH2KMLyG6S9UB+SGgN8TPmV66PWbo2AP3SV5WOIj3j8JnCxXsCffK3laV5JkugG0gN3m/68AhsMsgRuvl6LZTTCR5BuVsmCpMCj040NFyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=meZUpVfG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50NA7ZRc010850;
	Thu, 23 Jan 2025 11:06:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hkbDThUgj4Wm8IrStUC8O+skhf/Zrj6LicQtZ8JHeU4=; b=meZUpVfG4Unlxasl
	hf74G9Sv+bJq33ZOBKVwxBumAnGUOTl//tEP8t6888VODhEZimdPYDvPuIwjHgUn
	VDP0ql2FB06+Ta/LooI4WQYRVbvtA7aI/81rY61oFjC90hBwuZqH8Y2oLKpYEobg
	/LsWYpG5H06jeUGnoAMLh200uVShZbfvavnIAoQGcER9zBEUfTCerg2BITx1hXKi
	1ovdJz67RHbpJ+Fuk9RJMSv4EAVRq+S3AdL55jL30C9qefaRTp6iu/AY2qjireoO
	xq6YY6GUq9O8ze9RsgCRp8TewLImcpju0DxNCv3oyop66K8+g7MwCACT0OoJ+T37
	72wdug==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44bkr8g4gs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jan 2025 11:06:03 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50NB622F029165
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jan 2025 11:06:02 GMT
Received: from [10.216.27.211] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 23 Jan
 2025 03:05:54 -0800
Message-ID: <2acb758f-c1ff-426d-a363-befb8f97323f@quicinc.com>
Date: Thu, 23 Jan 2025 16:35:34 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: "Nirmesh Kumar Singh (Temp)" <quic_nkumarsi@quicinc.com>
Subject: Re: [PATCH v3] arm64: dts: qcom: Add industrial mezzanine support for
 qcs6490-rb3gen2
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <kernel@quicinc.com>, <andersson@kernel.org>, <konradybcio@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <quic_akdwived@quicinc.com>, <quic_uchheda@quicinc.com>,
        Sahil Chandna
	<quic_chandna@quicinc.com>
References: <20250122101424.1810844-1-quic_nkumarsi@quicinc.com>
 <f4xffmfwkwrenulklmwzjjmdfdhcf5cwundyfen54e2codrmlj@htzjpvk5vopp>
Content-Language: en-US
In-Reply-To: <f4xffmfwkwrenulklmwzjjmdfdhcf5cwundyfen54e2codrmlj@htzjpvk5vopp>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 3sON8D_5NbAQHt465seadoXtEgcHEZb4
X-Proofpoint-GUID: 3sON8D_5NbAQHt465seadoXtEgcHEZb4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-23_04,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1011
 lowpriorityscore=0 mlxlogscore=999 impostorscore=0 malwarescore=0
 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501230084


On 1/23/2025 12:16 AM, Dmitry Baryshkov wrote:
> On Wed, Jan 22, 2025 at 03:44:24PM +0530, Nirmesh Kumar Singh wrote:
>> Add DTS support for Qualcomm qcs6490-rb3gen2 industrial mezzanine board.
>>
>> Signed-off-by: Sahil Chandna <quic_chandna@quicinc.com>
>> Signed-off-by: Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>
>>
>> ---
>> Changes in v3:
>> - Fixed tpm pinctrl node label.
>> - Addressed comments by Dmitry.
> Which ones? Pleas be more specific in changelogs.
Ack
>
>> - Improved indentation/formatting.
>> - Link to V2: https://lore.kernel.org/all/20250102190155.2593453-1-quic_nkumarsi@quicinc.com/
>>
>> Changes in V2:
>> - Addressed comment by Konrad.
>> - Validated dts bindings with dtb_checks suggested by Krzysztof.
>> - Improved indentation/formatting.
>> - Fixed bug encountered during testing.
>> - Added dtb entry in makefile.
>> - Link to V1: https://lore.kernel.org/all/20241206065156.2573-1-quic_chandna@quicinc.com/
>> ---
>>   arch/arm64/boot/dts/qcom/Makefile             |  4 +++
>>   .../qcs6490-rb3gen2-industrial-mezzanine.dtso | 35 +++++++++++++++++++
>>   2 files changed, 39 insertions(+)
>>   create mode 100644 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
>>
>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
>> index 6ca8db4b8afe..16ac008c58d2 100644
>> --- a/arch/arm64/boot/dts/qcom/Makefile
>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>> @@ -111,6 +111,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcm6490-shift-otter.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-1000.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-4000.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2.dtb
>> +
>> +qcs6490-rb3gen2-industrial-mezzanine-dtbs	:= qcs6490-rb3gen2.dtb qcs6490-rb3gen2-industrial-mezzanine.dtbo
>> +
>> +dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-industrial-mezzanine.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-aim300-aiot.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride-r3.dtb
>> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
>> new file mode 100644
>> index 000000000000..1498f32bd069
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
>> @@ -0,0 +1,35 @@
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +/*
>> + * Copyright (c) 2025, Qualcomm Innovation Center, Inc. All rights reserved.
>> +*/
>> +
>> +/dts-v1/;
>> +/plugin/;
>> +#include <dt-bindings/clock/qcom,gcc-sc7280.h>
>> +#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
>> +
>> +&pm7250b_gpios {
>> +	tpm_spi_reset: tpm-spi-reset-state {
>> +		pins = "gpio5";
>> +		function = "normal";
>> +		power-source = <1>;
>> +		output-high;
>> +		input-disable;
>> +		bias-pull-up;
>> +		qcom,drive-strength = <3>;
>> +	};
>> +};
>> +
>> +&spi11 {
>> +	#address-cells = <1>;
>> +	#size-cells = <0>;
>> +	status = "okay";
>> +
>> +	st33htpm0: tpm@0 {
>> +		compatible = "st,st33htpm-spi", "tcg,tpm_tis-spi";
>> +		reg = <0>;
>> +		spi-max-frequency = <20000000>;
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&tpm_spi_reset>;
> Missing reset-gpios property. Otherwise there is no point in specifying
> the pinctrl.
The community previously rejected the GPIO reset function in the TPM 
driver (tpm_tis_core.c). You can refer to the discussion [1].

 From what I understand from the discussion in the patch, this decision 
was made to prevent software from executing an incorrect reset sequence, 
which could potentially reset the PCR banks of TPM chip.

However, a pinctrl node is necessary to ensure the PMIC GPIO is in the 
correct state as required by the TPM chip.

[1] 
https://lore.kernel.org/lkml/20220407111849.5676-1-LinoSanfilippo@gmx.de/T/#m726d477dbce48c9e345e245f93d60f0aaa6f0994

Thanks,

Nirmesh

>
>> +	};
>> +};
>> -- 
>> 2.34.1
>>

