Return-Path: <linux-arm-msm+bounces-55249-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F06C4A9A04B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 06:58:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 34200446C9D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 04:58:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 917F41B393A;
	Thu, 24 Apr 2025 04:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Ge90cB5+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACDD3F510;
	Thu, 24 Apr 2025 04:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745470706; cv=none; b=Y3JggFUL57YcUgpWoHc58eqD3rYIKd4Lb0sTAFSs2SbHDnUb7b0V5eGsH4C21QwCgklNd9tKYXnXOWUdHPtQ8tBdDvdXBAMlmSG75NIbSPb8Uu33olWi2OwDpGtVbfadfgAeEQY0yJ+nndYfKPwjb4OXBVbBUMxeZQ4xyI3gPwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745470706; c=relaxed/simple;
	bh=NKzNdaluXSVs1xuyl2Bc99askplP/dBRdcoKIu9xMcE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=lTZZSAOKDYoRLcjqDo0SL10nyQHV26Jv7mAr6lEc8nU/N/czHW57wJhLo96Bt0mA8IvvVM3d6wbtPojKfKLOyEzUBPeEawguMBc33iNCy9vUpFrRFToZn1Q/ZLi0T+fnA1RbesSEWDKzcAaFTBoUgM+q3c0qzP9jjBg9PlKQcJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Ge90cB5+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0F5Yq016949;
	Thu, 24 Apr 2025 04:58:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hOTTS59x6n2u6ZmixLAUeuTlKIUgYNhY+0VoqIpfdCc=; b=Ge90cB5+uJI3MgvB
	WAyLwLu3ulqcBBgFGIw14E/0DDchvv/UGZMx3axRjmfRyNRmDmGpVxCEnGqCMWY4
	vyvaqAcaLaQBf7T5WeuD7J2UluQamsHPWdi8kjMLFe3pkueo12OzQgTQslpN7Yyn
	IJSaWqxuup72mf/knNwpGeLxtOXzKXJyp5ue7I6SB5o1nUdNiYXBkNjlgUSdIZQE
	VNIp1z+ldFuSEWNOQlOJ7/zsdxvjCLTjdNQi0r/scJCROImnljm06KcjhmHvJCG3
	Kv4D2QRMRjFG6X5hJqMbKBoZWGeTzHDuuGYSGPCyANLFJNtdkXGSXFe4f8fe4EMk
	ghTNuA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh147ep-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 04:58:20 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53O4wJBr014408
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 04:58:19 GMT
Received: from [10.217.217.202] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 23 Apr
 2025 21:58:16 -0700
Message-ID: <e5cdf1e6-5a02-4271-92d3-42093a8e5bec@quicinc.com>
Date: Thu, 24 Apr 2025 10:28:07 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: qcom: add initial support for qcom
 sa8255p-ride
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: Deepti Jaggi <quic_djaggi@quicinc.com>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <quic_psodagud@quicinc.com>,
        <quic_ptalari@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250422231249.871995-1-quic_djaggi@quicinc.com>
 <0482cd6b-53ca-41eb-8721-a83ce8a7c733@quicinc.com>
 <agbftnk7uqj6e2zyw3igxlp3cctl6xhk6ix4gp6u5dot7nf3fm@cipkx222ffo5>
Content-Language: en-US
From: Shazad Hussain <quic_shazhuss@quicinc.com>
In-Reply-To: <agbftnk7uqj6e2zyw3igxlp3cctl6xhk6ix4gp6u5dot7nf3fm@cipkx222ffo5>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ATL_-RxtzVD2Wrmd9qf9FPAsNsXmgdp_
X-Authority-Analysis: v=2.4 cv=OY6YDgTY c=1 sm=1 tr=0 ts=6809c4ec cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=CfkQHp0pE3PK7BQ2rswA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: ATL_-RxtzVD2Wrmd9qf9FPAsNsXmgdp_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDAyOSBTYWx0ZWRfX8D1a3H9LED6N YM3kPb85jjivBng3geQfSLIjxzyVGAhqLdsRr2OHmi44mjHGKfYPdaaFecvYzzkWO9Pl3tLvEe2 C1qzlFsH+Jw7iHX3jEjppFP/ycKA1cp9mzDT5DwcACsy4Di91nooOJzFyOjalkY93Dl/bs8asHf
 4Of2GuX+Zt8T4yaTopAAn6VbOamyj9TBxbDAp+Qk4ybknoFAlOV2v6cPYRUR8sF8Iwq9F1avtPe XWj+8kftEGG22jhkEKOqDI2OtCGxbvvxWHTPGw3K1aJ9mppSfG1El9wyn2unWj/m2A1v7Xj7TJr yl8e9LukRJVRL8+UdfYPhsvtyC7RBl85/7zr1AjpSazqK/a5/zbc/BcIjhgPUOszjXeb69KZHf9
 bYOmg15ZgaVnzdXIFSRFMrDpaxNZQIe07l/wMweGmenf+aE1O0o5tkWWVIAIsD2IJwI7th81
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_01,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=999 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240029



On 4/23/2025 7:32 PM, Dmitry Baryshkov wrote:
> On Wed, Apr 23, 2025 at 10:16:57AM +0530, Shazad Hussain wrote:
>>
>>
>> On 4/23/2025 4:42 AM, Deepti Jaggi wrote:
>>> From: Nikunj Kela <quic_nkela@quicinc.com>
>>>
>>> This adds basic support for the Qualcomm sa8255p platform and the
>>> reference board: sa8255p-ride. The dt files describe the basics of the
>>> SoC and enable booting to shell with ramdisk.
>>>
>>> The Qualcomm automotive sa8255p SoC utilizes firmware to configure platform
>>> resources such as clocks, interconnects, and TLMM. Device drivers request
>>> these resources through the SCMI power and performance protocols. The SCMI
>>> platform supports resource aggregation and handles parallel requests from
>>> agents, with each driver having a dedicated SCMI channel for communication.
>>>
>>> Co-developed-by: Shazad Hussain <quic_shazhuss@quicinc.com>
>>> Signed-off-by: Shazad Hussain <quic_shazhuss@quicinc.com>
>>> Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
>>> Signed-off-by: Deepti Jaggi <quic_djaggi@quicinc.com>
>>> ---
>>> This patch is dependent on [2] for booting to shell and DT bindings.
>>>
>>> Changes in v3:
>>>           Removed the patches from original series [1].
>>>           Added arm,max-msg and arm,max-msg-size DT property in scmi nodes.
>>>           Changed max-rx-timeout-ms to arm,max-rx-timeout-ms in scmi nodes.
>>>           Updated commit text.
>>>           Reordered range property for qupv3_id_0, qupv3_id_1 and qupv3_id_3 nodes.
>>>           Reordered vendor property(#qcom,sensors) for tsens* nodes.
>>>           Changed cache labels to lower case.
>>>           Removed unused i2c,spi and tlmm nodes.
>>>           Updated reserved memory nodes.
>>>
>>> Changes in v2:
>>>           Removed scmichannels label and alias
>>>           Modified scmi node name to conform to schema
>>>           Moved status property to be the last one in scmi instances
>>>           Changed to lower case for cpu labels
>>>           Added fallback compatible for tlmm node
>>>
>>> [1]: https://lore.kernel.org/all/20240903220240.2594102-1-quic_nkela@quicinc.com/
>>> [2]: https://lore.kernel.org/all/20250418151235.27787-1-quic_ptalari@quicinc.com/
>>> ---
>>>    arch/arm64/boot/dts/qcom/Makefile           |    1 +
>>>    arch/arm64/boot/dts/qcom/sa8255p-pmics.dtsi |   80 +
>>>    arch/arm64/boot/dts/qcom/sa8255p-ride.dts   |   94 +
>>>    arch/arm64/boot/dts/qcom/sa8255p-scmi.dtsi  | 2440 +++++++++++++++++++
>>>    arch/arm64/boot/dts/qcom/sa8255p.dtsi       | 2075 ++++++++++++++++
>>>    5 files changed, 4690 insertions(+)
>>>    create mode 100644 arch/arm64/boot/dts/qcom/sa8255p-pmics.dtsi
>>>    create mode 100644 arch/arm64/boot/dts/qcom/sa8255p-ride.dts
>>>    create mode 100644 arch/arm64/boot/dts/qcom/sa8255p-scmi.dtsi
>>>    create mode 100644 arch/arm64/boot/dts/qcom/sa8255p.dtsi
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
>>> index adb4d026bcc4..7437e51e5849 100644
>>> --- a/arch/arm64/boot/dts/qcom/Makefile
>>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>>> @@ -134,6 +134,7 @@ qrb5165-rb5-vision-mezzanine-dtbs	:= qrb5165-rb5.dtb qrb5165-rb5-vision-mezzanin
>>>    dtb-$(CONFIG_ARCH_QCOM)	+= qrb5165-rb5-vision-mezzanine.dtb
>>>    dtb-$(CONFIG_ARCH_QCOM)	+= qru1000-idp.dtb
>>>    dtb-$(CONFIG_ARCH_QCOM)	+= sa8155p-adp.dtb
>>> +dtb-$(CONFIG_ARCH_QCOM)	+= sa8255p-ride.dtb
>>>    dtb-$(CONFIG_ARCH_QCOM)	+= sa8295p-adp.dtb
>>>    dtb-$(CONFIG_ARCH_QCOM)	+= sa8540p-ride.dtb
>>>    dtb-$(CONFIG_ARCH_QCOM)	+= sa8775p-ride.dtb
>>> diff --git a/arch/arm64/boot/dts/qcom/sa8255p-pmics.dtsi b/arch/arm64/boot/dts/qcom/sa8255p-pmics.dtsi
>>> new file mode 100644
>>> index 000000000000..b00c2b05cef7
>>> --- /dev/null
>>> +++ b/arch/arm64/boot/dts/qcom/sa8255p-pmics.dtsi
>>> @@ -0,0 +1,80 @@
>>> +// SPDX-License-Identifier: BSD-3-Clause
>>> +/*
>>> + * Copyright (c) 2024-2025, Qualcomm Innovation Center, Inc. All rights reserved.
>>> + */
>>> +
>>> +/ {
>>> +	thermal-zones {
>>> +		pmm8654au_0_thermal: pm8255-0-thermal {
>>> +			polling-delay-passive = <100>;
>>> +
>>> +			trips {
>>> +				trip0 {
>>> +					temperature = <105000>;
>>> +					hysteresis = <0>;
>>> +					type = "passive";
>>> +				};
>>> +
>>> +				trip1 {
>>> +					temperature = <125000>;
>>> +					hysteresis = <0>;
>>> +					type = "critical";
>>> +				};
>>> +			};
>>> +		};
>>> +
>>> +		pmm8654au_1_thermal: pm8255-1-thermal {
>>> +			polling-delay-passive = <100>;
>>> +
>>> +			trips {
>>> +				trip0 {
>>> +					temperature = <105000>;
>>> +					hysteresis = <0>;
>>> +					type = "passive";
>>> +				};
>>> +
>>> +				trip1 {
>>> +					temperature = <125000>;
>>> +					hysteresis = <0>;
>>> +					type = "critical";
>>> +				};
>>> +			};
>>> +		};
>>> +
>>> +		pmm8654au_2_thermal: pm8255-2-thermal {
>>> +			polling-delay-passive = <100>;
>>> +
>>> +			trips {
>>> +				trip0 {
>>> +					temperature = <105000>;
>>> +					hysteresis = <0>;
>>> +					type = "passive";
>>> +				};
>>> +
>>> +				trip1 {
>>> +					temperature = <125000>;
>>> +					hysteresis = <0>;
>>> +					type = "critical";
>>> +				};
>>> +			};
>>> +		};
>>> +
>>> +		pmm8654au_3_thermal: pm8255-3-thermal {
>>> +			polling-delay-passive = <100>;
>>> +
>>> +			trips {
>>> +				trip0 {
>>> +					temperature = <105000>;
>>> +					hysteresis = <0>;
>>> +					type = "passive";
>>> +				};
>>> +
>>> +				trip1 {
>>> +					temperature = <125000>;
>>> +					hysteresis = <0>;
>>> +					type = "critical";
>>> +				};
>>> +			};
>>> +		};
>>> +	};
>>> +};
>>
>> PMIC is handled by firmware on this SoC and in my openion we do not need
>> to have a dedicated sa8255p-pmics.dtsi only to have thermal zones nodes.
>> Can we keep these pmic thermal zones to sa8255p.dtsi with other thermal
>> zones nodes ?
> 
> For the PMIC? No, they are not a part of the SoC.

Thanks Dmitry for the clarification !

-Shazad

> 



