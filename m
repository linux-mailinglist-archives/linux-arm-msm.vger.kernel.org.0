Return-Path: <linux-arm-msm+bounces-51131-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56258A5DB12
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 12:09:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CFBF03B8563
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 11:08:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E6F923E355;
	Wed, 12 Mar 2025 11:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="El9+EmJE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5086423E23D;
	Wed, 12 Mar 2025 11:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741777741; cv=none; b=LmmOXRMZQr6eUywJ90NyDU0yw0pFJRPgTGwiUIQHOl4ZHe4UPuP9PL0Xfoksdv3w0jLVSWIR5/TKrgZAStuGMfhJFS+wzDY+lxwUMiOTQilqlYo0J03zEgNXiFWCB0O2b6Sq1z4/4a7lfLGk4HmMxDLfWfK9KilKCLBxZZHWZ/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741777741; c=relaxed/simple;
	bh=Ol88tGjQk2fHY5OIHsfsrf/9VqBV/CmCkQ8iDSCl8Vg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:CC:References:
	 In-Reply-To:Content-Type; b=Q8+K4xkG9GsRs4ZnvKV/k395MG8Rgd4vNyLb7Cnpr3qj0Uvo/9lFhDHBpeGwpwVqmPOHClaiN+mWZvc17jQtkxkCnaA6O+uuxcne/H2YOT1b/JWWNFcN88T+GXVR3Ud8Xl5Z9KBZ4PFsg75odsMsgaX984CvKQpRXdXV1diWzW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=El9+EmJE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52CAAf9h018494;
	Wed, 12 Mar 2025 11:08:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YfTTSFIhmiy4elkuZVQ+KVYofiIlI+u5oaVMrWj83uw=; b=El9+EmJEsmFCtpSV
	lg4AAnFmzxsglScqtUPOZFCtmGIHHgCyLuXlkWE8ua6zQzcR6dbBZnP7N13V1sPC
	CVs+ryxH++sABCLyTFZj7TX6oLfg2h/x38KjGEDxrtCTxFoxNa4lwGFGDeLrzFZF
	p582BqK30ZuHgbw2PsCKYUoTXHnM9kbpc2W14MDnpXqg7uMn4JYSz3h3Dpeh6U0k
	el7Z8VxxBBJBPLB6EPcMR4VBtKCx9IxSH1GT7CtSxxHszBI9lZHIUV42eY3gK7lL
	yKcDs4okP1PeyvKUeA35o26Xh30Xblo6ScBHZcx4KJceYh7EOQGC8Y7iBaa7Ks3i
	7Ima9Q==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45au50a4s7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Mar 2025 11:08:54 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52CB8rfD032440
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Mar 2025 11:08:53 GMT
Received: from [10.216.15.23] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 12 Mar
 2025 04:08:46 -0700
Message-ID: <18c65add-2d98-4b4d-a098-2a257bd1856b@quicinc.com>
Date: Wed, 12 Mar 2025 16:38:43 +0530
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
        <quic_akdwived@quicinc.com>, <quic_uchheda@quicinc.com>
References: <20250122101424.1810844-1-quic_nkumarsi@quicinc.com>
 <f4xffmfwkwrenulklmwzjjmdfdhcf5cwundyfen54e2codrmlj@htzjpvk5vopp>
 <2acb758f-c1ff-426d-a363-befb8f97323f@quicinc.com>
 <q4fyimr2wydbwb7x6mhzip2wsixifhd4okxe3noqxzn366oq7i@nkecmifs2y4f>
Content-Language: en-US
In-Reply-To: <q4fyimr2wydbwb7x6mhzip2wsixifhd4okxe3noqxzn366oq7i@nkecmifs2y4f>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: WDGCpRszho-scuM6suC5D_WRbnM1IMQP
X-Proofpoint-ORIG-GUID: WDGCpRszho-scuM6suC5D_WRbnM1IMQP
X-Authority-Analysis: v=2.4 cv=a4ow9VSF c=1 sm=1 tr=0 ts=67d16b46 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=pdpMw43Hk2bYUvsZUcoA:9
 a=QEXdDO2ut3YA:10 a=RVmHIydaz68A:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-12_04,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 clxscore=1015 spamscore=0 malwarescore=0 impostorscore=0 phishscore=0
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 bulkscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503120077


On 1/23/2025 4:48 PM, Dmitry Baryshkov wrote:
> On Thu, Jan 23, 2025 at 04:35:34PM +0530, Nirmesh Kumar Singh (Temp) wrote:
>> On 1/23/2025 12:16 AM, Dmitry Baryshkov wrote:
>>> On Wed, Jan 22, 2025 at 03:44:24PM +0530, Nirmesh Kumar Singh wrote:
>>>> Add DTS support for Qualcomm qcs6490-rb3gen2 industrial mezzanine board.
>>>>
>>>> Signed-off-by: Sahil Chandna <quic_chandna@quicinc.com>
>>>> Signed-off-by: Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>
>>>>
>>>> ---
>>>> Changes in v3:
>>>> - Fixed tpm pinctrl node label.
>>>> - Addressed comments by Dmitry.
>>> Which ones? Pleas be more specific in changelogs.
>> Ack
>>>> - Improved indentation/formatting.
>>>> - Link to V2: https://lore.kernel.org/all/20250102190155.2593453-1-quic_nkumarsi@quicinc.com/
>>>>
>>>> Changes in V2:
>>>> - Addressed comment by Konrad.
>>>> - Validated dts bindings with dtb_checks suggested by Krzysztof.
>>>> - Improved indentation/formatting.
>>>> - Fixed bug encountered during testing.
>>>> - Added dtb entry in makefile.
>>>> - Link to V1: https://lore.kernel.org/all/20241206065156.2573-1-quic_chandna@quicinc.com/
>>>> ---
>>>>    arch/arm64/boot/dts/qcom/Makefile             |  4 +++
>>>>    .../qcs6490-rb3gen2-industrial-mezzanine.dtso | 35 +++++++++++++++++++
>>>>    2 files changed, 39 insertions(+)
>>>>    create mode 100644 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
>>>> index 6ca8db4b8afe..16ac008c58d2 100644
>>>> --- a/arch/arm64/boot/dts/qcom/Makefile
>>>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>>>> @@ -111,6 +111,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcm6490-shift-otter.dtb
>>>>    dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-1000.dtb
>>>>    dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-4000.dtb
>>>>    dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2.dtb
>>>> +
>>>> +qcs6490-rb3gen2-industrial-mezzanine-dtbs	:= qcs6490-rb3gen2.dtb qcs6490-rb3gen2-industrial-mezzanine.dtbo
>>>> +
>>>> +dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-industrial-mezzanine.dtb
>>>>    dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-aim300-aiot.dtb
>>>>    dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride.dtb
>>>>    dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride-r3.dtb
>>>> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
>>>> new file mode 100644
>>>> index 000000000000..1498f32bd069
>>>> --- /dev/null
>>>> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
>>>> @@ -0,0 +1,35 @@
>>>> +// SPDX-License-Identifier: BSD-3-Clause
>>>> +/*
>>>> + * Copyright (c) 2025, Qualcomm Innovation Center, Inc. All rights reserved.
>>>> +*/
>>>> +
>>>> +/dts-v1/;
>>>> +/plugin/;
>>>> +#include <dt-bindings/clock/qcom,gcc-sc7280.h>
>>>> +#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
>>>> +
>>>> +&pm7250b_gpios {
>>>> +	tpm_spi_reset: tpm-spi-reset-state {
>>>> +		pins = "gpio5";
>>>> +		function = "normal";
>>>> +		power-source = <1>;
>>>> +		output-high;
>>>> +		input-disable;
>>>> +		bias-pull-up;
>>>> +		qcom,drive-strength = <3>;
>>>> +	};
>>>> +};
>>>> +
>>>> +&spi11 {
>>>> +	#address-cells = <1>;
>>>> +	#size-cells = <0>;
>>>> +	status = "okay";
>>>> +
>>>> +	st33htpm0: tpm@0 {
>>>> +		compatible = "st,st33htpm-spi", "tcg,tpm_tis-spi";
>>>> +		reg = <0>;
>>>> +		spi-max-frequency = <20000000>;
>>>> +		pinctrl-names = "default";
>>>> +		pinctrl-0 = <&tpm_spi_reset>;
>>> Missing reset-gpios property. Otherwise there is no point in specifying
>>> the pinctrl.
>> The community previously rejected the GPIO reset function in the TPM driver
>> (tpm_tis_core.c). You can refer to the discussion [1].
>>
>>  From what I understand from the discussion in the patch, this decision was
>> made to prevent software from executing an incorrect reset sequence, which
>> could potentially reset the PCR banks of TPM chip.
>>
>> However, a pinctrl node is necessary to ensure the PMIC GPIO is in the
>> correct state as required by the TPM chip.
> No, pinctrl is not a replacement for GPIO calls. Please don't force GPIO
> levels using pinctrl.
>
> Also, at least tpm-common.yaml defines reset-gpios. So declaring a GPIO
> using that property is a proper course of actions.
>
> The discussion clearly stated: if the GPIO is under software control,
> then it should be clear that PCRs do not work in such a system. Please
> consider implementing that suggestion.

Thanks for the inputs! We re-worked our H/W to make the default GPIO 
state to high

which is required for this chip to work properly. I will re-send patch 
removing the pinctrl

nodes, as it is not required with the re-worked H/W.

>> [1] https://lore.kernel.org/lkml/20220407111849.5676-1-LinoSanfilippo@gmx.de/T/#m726d477dbce48c9e345e245f93d60f0aaa6f0994
>>
>> Thanks,
>>
>> Nirmesh
>>
>>>> +	};
>>>> +};
>>>> -- 
>>>> 2.34.1
>>>>

