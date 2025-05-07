Return-Path: <linux-arm-msm+bounces-57146-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 97454AADFE9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 14:58:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C0489A2AA5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 12:58:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1279525EF87;
	Wed,  7 May 2025 12:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fM4HhE3r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2238428151E;
	Wed,  7 May 2025 12:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746622707; cv=none; b=XY7a2JlNMjjikIu7buDySp2UXQUiA4fCbNUf0LMtjDO9NvlR+6tqba2DeSEVX6OkvcEgbdE/xiOBe5GLmOCIWow9Zms4uNeHjhYJD8YZxkCMa9CQ6Arfu73J0yCuKxEERhvTPKjxUjAoAEjCYC0NwCPqUj1lK4RA9qc69D4zqjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746622707; c=relaxed/simple;
	bh=GkbVILExG2T5wsV1f6v2xMtM7UySyBe2HqRtVz6yeBA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=aAbcfme/syLGZj7XBTYmFK+3cIjoNVBpIlL4HkFU4tvaP4tSvpTgAVho4vs3BK6JCJZwmYms3KwsKYOn93/PUf9azlZTLm9dencLw2fZpPwmkAbjtsmUaPyCShsb0OIonkGoF06/O+h8mf8XzYYSuoevIVhAW0rwevme2VpvZ/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fM4HhE3r; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 547A8W4M009112;
	Wed, 7 May 2025 12:58:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xF+cHM9YchG/d6uxqOT4xkfIqHaWygeEpG9xNO/SoYg=; b=fM4HhE3rjTI6vgKq
	RovSRDh2S6OdesGL6BVSkoQzvAzfIxFEi5uqEOqLbbpHAVW5H90b3NM3etVw6tNs
	cutU5HeqKZI4ARfz7vNoH8E8yB91X6d+m7eHmIGIsA+jTaXaXUWa1vprkBd2dgiN
	MCT1MDJaUPm0W2ESc/AXek8n4FfV/D6aJSsCBCpT3L2bFAm/h1I0j7iPfg/XtQDA
	M57dV3O9eBlpHPx4TpqnGNKQEZTEs/JTOUm5upVjYvgxU3c1bF0QCzmfHpHpetoQ
	eM10kDr7GHnLjSO2zTdUHappNb8sJp6Fcx0ki4X23OnM0N7Z+2fvbbU9sZc1cwrS
	jCmjpw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46g5gh8esu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 12:58:07 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 547Cw6b7009442
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 7 May 2025 12:58:06 GMT
Received: from [10.206.97.61] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 7 May 2025
 05:57:58 -0700
Message-ID: <bd136800-8ef5-4597-b918-41b9f97db14f@quicinc.com>
Date: Wed, 7 May 2025 18:27:54 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 07/11] arm64: dts: qcom: sa8775p-ride: add anx7625 DSI
 to DP bridge nodes
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <robdclark@gmail.com>,
        <sean@poorly.run>, <marijn.suijten@somainline.org>,
        <andersson@kernel.org>, <robh@kernel.org>, <robh+dt@kernel.org>,
        <krzk+dt@kernel.org>, <konradybcio@kernel.org>, <conor+dt@kernel.org>,
        <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>,
        <rfoss@kernel.org>, <Laurent.pinchart@ideasonboard.com>,
        <jonas@kwiboo.se>, <jernej.skrabec@gmail.com>,
        <quic_abhinavk@quicinc.com>, <quic_rajeevny@quicinc.com>,
        <quic_vproddut@quicinc.com>, <quic_jesszhan@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250505094245.2660750-1-quic_amakhija@quicinc.com>
 <20250505094245.2660750-3-quic_amakhija@quicinc.com>
 <grwlmrgi5cfv3jtuki57ug7gsqykpwdf2to2l7di6glfxtb7vz@6id6cpfkrbuh>
 <88b139c4-0a35-4c9e-9993-573fede29b71@quicinc.com>
 <ip2phi56u4yof376t5a5mqhvo3x4oo4blcnirwc6w7eancpm7i@ofcgyfcxdmre>
Content-Language: en-US
From: Ayushi Makhija <quic_amakhija@quicinc.com>
In-Reply-To: <ip2phi56u4yof376t5a5mqhvo3x4oo4blcnirwc6w7eancpm7i@ofcgyfcxdmre>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: OPbtRutEhhwqmylcl9sGmNFyMmVkwavI
X-Authority-Analysis: v=2.4 cv=TqPmhCXh c=1 sm=1 tr=0 ts=681b58df cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=NEAV23lmAAAA:8
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=G6BfOUuto9JBWjMmyeYA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA3MDEyMiBTYWx0ZWRfX/V6kIFbeakdJ
 aDRFF9zCSxC1ASGhT+a8JlCqcMoDMvkPxNNmITI5KPisfu6lx02d936s78YEeA+VEfJaM8VBZwf
 jSavOARuAqzQ3MNltqfYDBrA0GI8zLFfWhK8rwOfIuik0rP1nIBLj7OxYkDy2cO53VRS8kDIGTS
 MEB69tgPOxsnkbIE4WcaQi0MOwYPoaAxWcJF8k0VwQisLKcPdpbnG64L12bfG1n7Y2FLyR9W8f4
 9M7N1h2HO7x9DYR5NoCGO60lkYdJqSB02ZASyU4cTwctMd02gq+W1ilfz+nD4BVoN73GKt2ovDy
 8LKcnl3Aqdj4lVajnV5rMxaVeUye/Aq0FKke4DKmbDKiAvAthOVKaN/XN68C3vU7viF4XL1BPyO
 KJ9thIrF3oKwak0zo/e1rfrFKViYnWNxQLv7lw3lXqtN3xBFizLL73NSAQ923jlOblYgJYVU
X-Proofpoint-ORIG-GUID: OPbtRutEhhwqmylcl9sGmNFyMmVkwavI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-07_04,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 mlxscore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 impostorscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505070122

On 5/6/2025 5:58 PM, Dmitry Baryshkov wrote:
> On Tue, May 06, 2025 at 05:42:50PM +0530, Ayushi Makhija wrote:
>> Hi Dmitry,
>>
>> On 5/5/2025 3:32 PM, Dmitry Baryshkov wrote:
>>> On Mon, May 05, 2025 at 03:12:41PM +0530, Ayushi Makhija wrote:
>>>> Add anx7625 DSI to DP bridge device nodes.
>>>>
>>>> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
>>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>> ---
>>>>  arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 183 +++++++++++++++++++++
>>>>  1 file changed, 183 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
>>>> index 175f8b1e3b2d..de14f3ea8835 100644
>>>> --- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
>>>> @@ -28,6 +28,15 @@ chosen {
>>>>  		stdout-path = "serial0:115200n8";
>>>>  	};
>>>>  
>>>> +	vph_pwr: vph-pwr-regulator {
>>>> +		compatible = "regulator-fixed";
>>>> +		regulator-name = "vph_pwr";
>>>> +		regulator-min-microvolt = <12000000>;
>>>> +		regulator-max-microvolt = <12000000>;
>>>
>>> 12 V, if my eyes don't deceive me.
>>
>> Yes, it's 12V. According to the chipset's power grid, the VPH rail is rated at 12 volts.
>> That's significantly higher than what we typically see on mobile platforms. I guess,
>> this is due to the SA8775P Ride SX being designed for automotive applications, where higher voltage levels are required.
>>
>>>
>>>> +		regulator-always-on;
>>>> +		regulator-boot-on;
>>>> +	};
>>>> +
>>>
>>> [...]
>>>
>>>> +
>>>> +			bridge@58 {
>>>> +				compatible = "analogix,anx7625";
>>>> +				reg = <0x58>;
>>>> +				interrupts-extended = <&io_expander 2 IRQ_TYPE_EDGE_FALLING>;
>>>> +				enable-gpios = <&io_expander 1 GPIO_ACTIVE_HIGH>;
>>>> +				reset-gpios = <&io_expander 0 GPIO_ACTIVE_HIGH>;
>>>> +				vdd10-supply = <&vph_pwr>;
>>>> +				vdd18-supply = <&vph_pwr>;
>>>> +				vdd33-supply = <&vph_pwr>;
>>>
>>> Here you are saying that 1.0V, 1.8V and 3.3V pins are powered on by 12V
>>> supply. I wonder how the board doesn't trigger all fire alarms in the
>>> building.
>>>
>>
>> Let me try to explain the connections from the schematics.
>>
>> In the SA8775P RIDE SX platform, the ANX bridge supplies are connected from the below sources:
>>
>> 1) AVDD1P8 is sourced from the `VREG_1P8` of the backplane card.
>> 2) AVDD3P0 is sourced from the `VREG_3P0` of the backplane card.
>> 3) AVDD1P0 is sourced from the TPS74801 LDO voltage regulator that has `VREG_1P8` connected to
>>    VIN & EN lines, and `VREG_3P0` connected to BIAS line.
>>  
>> The `VREG_1P8` is sourced from a buck converter TPS54618CQRTERQ1 that is using 
>> `VREG_5P0` as VIN and EN_VR1P8_M3P3 as EN signal. 
>> Where the `EN_VR1P8_M3P3` is an output signal from SAK-TC397XX-256F300S BD micro-controller.
>>  
>> Similarly, the `VREG_1P3` and `VREG_5P0` are sourced from another buck converter LM5143QRWGRQ1
>> that is using `VREG_12P0` as VIN and `EN_VR5P0_M3P3` as EN signal.
>> Where the EN_VR5P0_M3P3 is an output from the same micro-controller.
>>  
>> Combining above details, all three ANX bridge supplies are getting enabled by `VREG_12P0` supply,
>> `EN_VR1P8_M3P3` and `EN_VR5P0_M3P3` signals once the SOC is out of reset.
>>  
>> The `VREG_12P0` is directly sourced from `VBATT_IN`.
>>  
>> Since, there is no SW control for ANX bridge supplies and they are getting enabled
>> once the SOC is out of reset, I have used vph-pwr-regulator dummy regulator.
>> I am not sure if it's the right way to handle above scenario. Please let me know if there is other way to do the same.
> 
> Add these regulators as fixed ones, describing the power grid. Consult
> other board files if you are unsure. RB3, RB5, HDKs - all these boards
> have fixed-regulators for the grid.
> 

Hi Dmirty,

After referring the RB3, RB5, HDKs boards example for fixed regulator.

1) Reference 1 (qrb5165-rb5.dts file) (https://github.com/torvalds/linux/blob/master/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts)

In qrb5165-rb5.dts file, If we refer the fixed regulator of lt9611_1v2

lt9611_1v2: lt9611-vdd12-regulator {
                compatible = "regulator-fixed";
                regulator-name = "LT9611_1V2";
                vin-supply = <&vdc_3v3>;
                regulator-min-microvolt = <1200000>;
                regulator-max-microvolt = <1200000>;
        };

Here we can see the vin-supply is vdc_3v3, which is itself is a fixed-regulator.

vdc_3v3: vdc-3v3-regulator {
                compatible = "regulator-fixed";
                regulator-name = "VDC_3V3";
                vin-supply = <&vreg_l11c_3p3>;
                regulator-min-microvolt = <3300000>;
                regulator-max-microvolt = <3300000>;
                regulator-always-on;
        };

Then vin-supply for vdc_3v3 is vreg_l11c_3p3, Which is a RPMH regulator.

 vreg_l11c_3p3: ldo11 {
                        regulator-name = "vreg_l11c_3p3";
                        regulator-min-microvolt = <3296000>;
                        regulator-max-microvolt = <3296000>;
                        regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
                        regulator-always-on;
                };

Do we need to do the same for our vdd10-supply , vdd18-supply and vdd33-supply of anx7625 bridge supplies ?

Example for vdd18-supply (AVDD1P8) (Anx7625 vdd18-supply)

vreg_1p8 : vreg-vdd18-regulator {
	 compatible = "regulator-fixed";
	 regulator-name = "vreg_1p8";
	 vin-supply = <&vreg_5p0>;
	 regulator-min-microvolt = <1800000>;
	 regulator-max-microvolt = <1800000>;
};

Here vreg_1p8 is using vreg_5p0 as vin-supply.

vreg_5p0 : vreg-5p0-regulator {
	 compatible = "regulator-fixed";
	 regulator-name = "vreg_5p0";
	 vin-supply = <&vreg_12p0>;
	 regulator-min-microvolt = <5000000>;
	 regulator-max-microvolt = <5000000>;
};

Here vreg_5p0 is using vreg_12p0 as vin-supply.

vreg_12p0: vreg-12p0-regulator {
	 compatible = "regulator-fixed";
	 regulator-name = "vreg_12p0";
	 regulator-min-microvolt = <12000000>;
	 regulator-max-microvolt = <12000000>;
};

2) Reference 2 (qcs6490-rb3gen2.dts) (https://github.com/torvalds/linux/blob/master/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts)

Or In qcs6490-rb3gen2.dts file, If we refer the fixed regulator of lt9611_1v2

lt9611_1v2: lt9611-vdd12-regulator {
                compatible = "regulator-fixed";
                regulator-name = "LT9611_1V2";

                regulator-min-microvolt = <1200000>;
                regulator-max-microvolt = <1200000>;
 };

There is not any vin-supply here.

Example for vdd18-supply (AVDD1P8) (Anx7625 vdd18-supply)

vreg_1p8 : vreg-vdd18-regulator {
	 compatible = "regulator-fixed";
	 regulator-name = "vreg_1p8";
	 regulator-min-microvolt = <1800000>;
	 regulator-max-microvolt = <1800000>;
};

Let me know, Which way we need to define the our anx7625 bridge supplies.

Thanks,
Ayushi

