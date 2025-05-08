Return-Path: <linux-arm-msm+bounces-57290-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8D5AB0082
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 18:32:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A2EB09E79A8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 16:31:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC6FB27B4E2;
	Thu,  8 May 2025 16:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="iNEthzJI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB8B24B1E79;
	Thu,  8 May 2025 16:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746721918; cv=none; b=LCprfYnkvRqzyR00VBqqt14gLu3UM7fZsEEF4ZNhO4owY8QuLY4BO/zIw+xbqy7RKgidBfWPdMcvmGH3//jCRq2RS2O8lb6k4wexBQ4gaJ3YGD765cc27UeySRhOavm11IGcdbZYmCRJNJbcFwcS+gfSG6BsunXfBTVNAR2L6ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746721918; c=relaxed/simple;
	bh=O/ZmNe+410S2nqNTMA7ugr+NgA0JOguTle5Z5EevO1g=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=IEIKX4P4hJ6R5+L1srTL+0KSu7thNitossKj2CnoPslbDd4lVtIHaVVvZ1zWJ6ZrxMrrcQ+uGaouqOf2K7MYNhl5C+w2iYNWSC5uFE6nt4l/bo0IkiWt8ZYTqPnTkJ8r2EFNLVrt/XMlDzVr5lnZdgmG8jJBOaaI8wTamheaqPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=iNEthzJI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 548DN0Pk031703;
	Thu, 8 May 2025 16:31:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TLDraU5yYWo2QDJhJrSUX8HzrO8GDxTRvhb9/AzR7VQ=; b=iNEthzJI0hR1t3yL
	rfWfvPBhWRSBI9jI99yAgLzTeBWVOIU6S326/RczaYJrTGgZIp9r9/98tLbxp600
	/zF+0xYG9x7j/SSQSBL1b8NfqLfV2mkyMi4wxaV+T0CAWgPiWrZytcdxZgfvVNES
	/ckHaLdClhF8b2ktZBKE6gKYS1AAMaUZ1UTkYzCjCdqMSxcRymgfkPCc2NaA7H6j
	8VTCH9jG1PJNUrdtUCM2RWl+4VauzprVvsql5dQkzsQcJewkPEREBmU6KnEEV6xj
	LqCWNyLrdqE8cqo6HVLXOWcLLXppYKA+wcd7OLYgyRudZwwioPsaFjTXAWlnX1iS
	QXLJYQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnpghxc7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 May 2025 16:31:52 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 548GVpSB021847
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 8 May 2025 16:31:51 GMT
Received: from [10.216.33.253] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 8 May 2025
 09:31:47 -0700
Message-ID: <4d922876-d78c-47f0-a467-a01d9754fb2d@quicinc.com>
Date: Thu, 8 May 2025 22:01:42 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] arm64: dts: qcom: sc7280: Add WSA SoundWire and
 LPASS support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <cros-qcom-dts-watchers@chromium.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@oss.qualcomm.com>, Mohammad Rafi Shaik <quic_mohs@quicinc.com>
References: <20250429092430.21477-1-quic_pkumpatl@quicinc.com>
 <20250429092430.21477-3-quic_pkumpatl@quicinc.com>
 <7bd9fd43-7159-48a2-bf0a-712de9cb2bc0@oss.qualcomm.com>
Content-Language: en-US
From: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
In-Reply-To: <7bd9fd43-7159-48a2-bf0a-712de9cb2bc0@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=Ao/u3P9P c=1 sm=1 tr=0 ts=681cdc78 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=vC_a7ZyuHw2JGkk7z40A:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDE0NCBTYWx0ZWRfXx+dwtTNnNMx3
 pp07e3p6XfK/6BGIYwbsuXWsNPQ+q4gPtdGJ9iVfiP4mtjIJJuQFTnUQQ6KATW9IZkSNLK8T/P5
 w5I3+mJFryKqoHFgbGLdI4NtqG30WC7ziWeMqysQhBzTneKUNvlwDePXtDzVEeDXbKJPpuJ+IpT
 cAAqV1gf2KbDytpAayMriSIL6NkRvQa2nbHc/AO1Ig3xvtZzAy8dB2AShOywDMe5PbeAqy3vhZf
 qxAj8z+5oYTo4g/shzQ4XCT92CTFm1nxjiZCMXRTvyydW5zbgyox4zl0WbczbH5WNG54FkNtybL
 udA/OkiTlL9PKfXUuSY5bBSJw/ESK4b0cg3Li2QQbHnySOnbYlz6yRW24VETOeMbJ04Yg7A9Gba
 PQh9MFDaRDSh1ufr41walkaAR9J6vLjC48xubWO2ShxOpslZps7QTvRHwbSlO7rNO1VdOvQw
X-Proofpoint-GUID: cPgxvvB2tztcRPtJSX2xaHUk-cLPl-Tv
X-Proofpoint-ORIG-GUID: cPgxvvB2tztcRPtJSX2xaHUk-cLPl-Tv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_05,2025-05-08_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505080144



On 4/29/2025 4:21 PM, Konrad Dybcio wrote:
> On 4/29/25 11:24 AM, Prasad Kumpatla wrote:
>> From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
>>
>> Add WSA LPASS macro Codec along with SoundWire controller.
>>
>> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
>> Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
>> Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/sc7280.dtsi | 68 ++++++++++++++++++++++++++++
>>   1 file changed, 68 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> index 3453740c0d14..d4aacb97a18c 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> @@ -2601,6 +2601,64 @@
>>   			status = "disabled";
>>   		};
>>   
>> +		lpass_wsa_macro: codec@3240000 {
>> +			compatible = "qcom,sc7280-lpass-wsa-macro";
>> +			reg = <0x0 0x03240000 0x0 0x1000>;
>> +
>> +			clocks = <&lpass_aon LPASS_AON_CC_TX_MCLK_CLK>,
>> +				 <&lpass_aon LPASS_AON_CC_TX_MCLK_2X_CLK>,
>> +				 <&lpass_va_macro>;
>> +			clock-names = "mclk", "npl", "fsgen";
> 
> Please make this a vertical list
Ack>
>> +
>> +			pinctrl-names = "default";
>> +			pinctrl-0 = <&lpass_wsa_swr_clk>, <&lpass_wsa_swr_data>;
> 
> property-n
> property-names
> 
> across all changes, please
> 
> [...]
Ack>
>> +		swr2: soundwire@3250000 {
>> +			compatible = "qcom,soundwire-v1.6.0";
>> +			reg = <0x0 0x03250000 0x0 0x2000>;
>> +
>> +			interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>;
>> +			clocks = <&lpass_wsa_macro>;
>> +			clock-names = "iface";
>> +
>> +			resets = <&lpass_audiocc LPASS_AUDIO_SWR_WSA_CGCR>;
>> +			reset-names = "swr_audio_cgcr";
>> +
>> +			qcom,din-ports = <2>;
> 
> The computer tells me it should be 3
For swr2 - soundwire version-V1.6.0 contains din-ports as 2 only. Please 
refer below link
https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/tree/arch/arm64/boot/dts/qcom/sc8280xp.dtsi#n2931

Thanks,
Prasad>
> 
> Konrad


