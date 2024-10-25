Return-Path: <linux-arm-msm+bounces-35861-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 263649B01F8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 14:14:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 957211F22CCD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 12:14:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CD59202637;
	Fri, 25 Oct 2024 12:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ESf501mK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE7D1F81AF;
	Fri, 25 Oct 2024 12:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729858477; cv=none; b=Q/fafcLDqgYL/7+PWb2NbdpiNfK6zymIH0Ybw9HFLlZYwp3VM6+zM27HjOVo4vb2XBY040k1Tp3Y4KmOvqKS35lV3C0Cv/6U5fWxQbuO3+y+j5VPWryy++s8iNhx592dc/ktZo/EmKSu3M2W6aaP5vAxJsHYldI8OuWVS/SHXUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729858477; c=relaxed/simple;
	bh=f+rHu7ZQEJPbWcyuZPxTcWQL0ZS02pwDvuHMybNTepY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=O6z0iOH7KpZq89vSD6pEqMcEqZqtySGqQ4/HxBdCo+LMZh5ANNVRddr8AllTnf/uTt44JYbtBWkA0FZwKp71dpqXOSYeArXGx5TgIXPTcMQdfkfGHmRIFesrTY3HMhQ+TXTSTqJG4az8LGVx7n9wyL0RAmbxGHfYCM+v9dt7+i4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ESf501mK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49PB2LML001170;
	Fri, 25 Oct 2024 12:14:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l2umKUDZroJhKWGugCA3KI+nJ29nYBg6+yfjh//bdgw=; b=ESf501mKksOL8WaZ
	oHthjn1WorQOyADQLZeoCbY9tMA5wX+EEfTL4g2R3v7Gjd5tSVe1570esSqINzES
	vU+DN4p7Su8wRLfNUZbWoPUhtK9o04nNXR0cL1if+WtiMYQwPooSaglCxxPqn/fj
	bPeQTr4fWz/kOHcFITl8TTNXN+VmSJjTRqCfRZXTKbDxJyRlyZF27IUfGK+XvDW8
	IzuXLOrKAk/HTLnKoEdDZYZmPEUl8X6EandEhhQNwFcplkY9E3C3JiFyOYs2KNkA
	lntzj3bWmEHh7a5dhXwk97g7IvCR5LhjcqKdPL4uxQ1wAQ2aUsyQyGVGwx2+k685
	rH/QXg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42ga3s06b8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 12:14:24 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49PCENWY003953
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 12:14:23 GMT
Received: from [10.239.132.205] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 25 Oct
 2024 05:14:17 -0700
Message-ID: <6b70789a-a63b-42e6-beb0-9500cbe99ce7@quicinc.com>
Date: Fri, 25 Oct 2024 20:14:15 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/7] arm64: dts: qcom: add base QCS615 RIDE dts
To: Bjorn Andersson <andersson@kernel.org>
CC: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, <kernel@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        Tingguo Cheng
	<quic_tingguoc@quicinc.com>
References: <20241022-add_initial_support_for_qcs615-v4-0-0a551c6dd342@quicinc.com>
 <20241022-add_initial_support_for_qcs615-v4-6-0a551c6dd342@quicinc.com>
 <4bhsuysjm2uwkk52g4pkspiadsf5y4m2afotj7ggo2lnj24ip2@yqkijcdkiloj>
From: Lijuan Gao <quic_lijuang@quicinc.com>
In-Reply-To: <4bhsuysjm2uwkk52g4pkspiadsf5y4m2afotj7ggo2lnj24ip2@yqkijcdkiloj>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: qCoYAuai4UbGPRAqXxGarM2Wbazx9fa8
X-Proofpoint-GUID: qCoYAuai4UbGPRAqXxGarM2Wbazx9fa8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 mlxscore=0 priorityscore=1501 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410250092



在 10/23/2024 10:09 AM, Bjorn Andersson 写道:
> On Tue, Oct 22, 2024 at 04:54:34PM GMT, Lijuan Gao wrote:
> 
> "arm64: dts: qcom: add base QCS615 RIDE dts"
>           ^ You already have dts here     ^ no need to put it here again
> 
> 
> I'd suggest that we make the subject "arm64: dts: qcom: Add QCS615 RIDE board"
> 

Got it, I will update the title in the next version.

>> Add initial support for Qualcomm QCS615 RIDE board and enable
>> the QCS615 RIDE board to shell with uart console.
>>
>> [Tingguo: added regulator nodes]
> 
> Are you saying:
> - Lijuan wrote the patch
> - Lijuan signed the certificate of origin (i.e. he's allowed to
>    contribute its content)
> - Tingguo added regulator nodes
> - Tingguo signed the certificate of origin (i.e. patch was based on work
>    that was certified)
>    
> Or are you saying:
> "Tingguo and I developed this patch in pair programming fashion"
> 
> If so, I'd suggest dropping the "[Tingguo:...]" line.
> 
Yes, I wrote the base patch and Tingguo added the regulator nodes. I 
will update the commit message with "Written with help from Tingguo 
Cheng (added regulator nodes)" as suggested in the initial dtsi comments

>> Co-developed-by: Tingguo Cheng <quic_tingguoc@quicinc.com>
>> Signed-off-by: Tingguo Cheng <quic_tingguoc@quicinc.com>
>> Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/Makefile        |   1 +
>>   arch/arm64/boot/dts/qcom/qcs615-ride.dts | 219 +++++++++++++++++++++++++++++++
>>   2 files changed, 220 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
>> index 065bb19481c1..f14643187cac 100644
>> --- a/arch/arm64/boot/dts/qcom/Makefile
>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>> @@ -110,6 +110,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcm6490-idp.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= qcm6490-shift-otter.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-1000.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-4000.dtb
>> +dtb-$(CONFIG_ARCH_QCOM)	+= qcs615-ride.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-aim300-aiot.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= qdu1000-idp.dtb
>> diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>> new file mode 100644
>> index 000000000000..ee6cab3924a6
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>> @@ -0,0 +1,219 @@
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +/*
>> + * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +/dts-v1/;
>> +
>> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>> +#include "qcs615.dtsi"
>> +/ {
>> +	model = "Qualcomm Technologies, Inc. QCS615 Ride";
>> +	compatible = "qcom,qcs615-ride", "qcom,qcs615";
>> +	chassis-type = "embedded";
>> +
>> +	aliases {
>> +		serial0 = &uart0;
>> +	};
>> +
>> +	chosen {
>> +		stdout-path = "serial0:115200n8";
>> +	};
>> +
>> +	clocks {
>> +		sleep_clk: sleep-clk {
>> +			compatible = "fixed-clock";
>> +			clock-frequency = <32000>;
>> +			#clock-cells = <0>;
>> +		};
>> +
>> +		xo_board_clk: xo-board-clk {
>> +			compatible = "fixed-clock";
>> +			clock-frequency = <38400000>;
>> +			#clock-cells = <0>;
>> +		};
>> +	};
>> +};
>> +
>> +&apps_rsc {
>> +	regulators-0 {
>> +		compatible = "qcom,pm8150-rpmh-regulators";
>> +		qcom,pmic-id = "a";
>> +
>> +		vreg_s3a: smps3 {
> 
> You don't reference any of these regulators.
> 
> Can you please confirm that when you boot the qcs615 ride device with
> this dtb it actually boots with a debug uart and does not crash when the
> regulator framework disable all these "unused" regulators?
> 
> Regards,
> Bjorn
> 
Yes, the device booted successfully. The regulator is part of Tingguo’s 
PMIC-related modifications. The RPMhpd, which UART depends on, is also 
part of this series of changes. The regulator will be used later, so 
both of them were added.

>> +			regulator-name = "vreg_s3a";
>> +			regulator-min-microvolt = <600000>;
>> +			regulator-max-microvolt = <650000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_s4a: smps4 {
>> +			regulator-name = "vreg_s4a";
>> +			regulator-min-microvolt = <1800000>;
>> +			regulator-max-microvolt = <1829000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_s5a: smps5 {
>> +			regulator-name = "vreg_s5a";
>> +			regulator-min-microvolt = <1896000>;
>> +			regulator-max-microvolt = <2040000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_s6a: smps6 {
>> +			regulator-name = "vreg_s6a";
>> +			regulator-min-microvolt = <1304000>;
>> +			regulator-max-microvolt = <1404000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l1a: ldo1 {
>> +			regulator-name = "vreg_l1a";
>> +			regulator-min-microvolt = <488000>;
>> +			regulator-max-microvolt = <852000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
>> +			regulator-allow-set-load;
>> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
>> +						   RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l2a: ldo2 {
>> +			regulator-name = "vreg_l2a";
>> +			regulator-min-microvolt = <1650000>;
>> +			regulator-max-microvolt = <3100000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
>> +			regulator-allow-set-load;
>> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
>> +						   RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l3a: ldo3 {
>> +			regulator-name = "vreg_l3a";
>> +			regulator-min-microvolt = <1000000>;
>> +			regulator-max-microvolt = <1248000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
>> +			regulator-allow-set-load;
>> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
>> +						   RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l5a: ldo5 {
>> +			regulator-name = "vreg_l5a";
>> +			regulator-min-microvolt = <875000>;
>> +			regulator-max-microvolt = <975000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>> +			regulator-allow-set-load;
>> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
>> +						   RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l7a: ldo7 {
>> +			regulator-name = "vreg_l7a";
>> +			regulator-min-microvolt = <1800000>;
>> +			regulator-max-microvolt = <1900000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>> +			regulator-allow-set-load;
>> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
>> +						   RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l8a: ldo8 {
>> +			regulator-name = "vreg_l8a";
>> +			regulator-min-microvolt = <1150000>;
>> +			regulator-max-microvolt = <1350000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>> +			regulator-allow-set-load;
>> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
>> +						   RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l10a: ldo10 {
>> +			regulator-name = "vreg_l10a";
>> +			regulator-min-microvolt = <2950000>;
>> +			regulator-max-microvolt = <3312000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>> +			regulator-allow-set-load;
>> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
>> +						   RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l11a: ldo11 {
>> +			regulator-name = "vreg_l11a";
>> +			regulator-min-microvolt = <1232000>;
>> +			regulator-max-microvolt = <1260000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
>> +			regulator-allow-set-load;
>> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
>> +						   RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l12a: ldo12 {
>> +			regulator-name = "vreg_l12a";
>> +			regulator-min-microvolt = <1800000>;
>> +			regulator-max-microvolt = <1890000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
>> +			regulator-allow-set-load;
>> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
>> +						   RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l13a: ldo13 {
>> +			regulator-name = "vreg_l13a";
>> +			regulator-min-microvolt = <3000000>;
>> +			regulator-max-microvolt = <3230000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
>> +			regulator-allow-set-load;
>> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
>> +						   RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l15a: ldo15 {
>> +			regulator-name = "vreg_l15a";
>> +			regulator-min-microvolt = <1800000>;
>> +			regulator-max-microvolt = <1904000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
>> +			regulator-allow-set-load;
>> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
>> +						   RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l16a: ldo16 {
>> +			regulator-name = "vreg_l16a";
>> +			regulator-min-microvolt = <3000000>;
>> +			regulator-max-microvolt = <3312000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
>> +			regulator-allow-set-load;
>> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
>> +						   RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l17a: ldo17 {
>> +			regulator-name = "vreg_l17a";
>> +			regulator-min-microvolt = <2950000>;
>> +			regulator-max-microvolt = <3312000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +	};
>> +};
>> +
>> +&gcc {
>> +	clocks = <&rpmhcc RPMH_CXO_CLK>,
>> +		 <&rpmhcc RPMH_CXO_CLK_A>,
>> +		 <&sleep_clk>;
>> +};
>> +
>> +&qupv3_id_0 {
>> +	status = "okay";
>> +};
>> +
>> +&rpmhcc {
>> +	clocks = <&xo_board_clk>;
>> +};
>> +
>> +&uart0 {
>> +	status = "okay";
>> +};
>> +
>> +&watchdog {
>> +	clocks = <&sleep_clk>;
>> +};
>>
>> -- 
>> 2.46.0
>>

-- 
Thx and BRs
Lijuan Gao


