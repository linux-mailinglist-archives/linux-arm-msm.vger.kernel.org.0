Return-Path: <linux-arm-msm+bounces-54966-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F02DA97285
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Apr 2025 18:24:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4E22F3A30C7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Apr 2025 16:23:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2629D281359;
	Tue, 22 Apr 2025 16:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KFFGJpO1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477BF19F42F;
	Tue, 22 Apr 2025 16:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745338997; cv=none; b=QUGIl1Qai63fG1wMOchTejNYYXWDj6iDFFUKXQS/PAMgkYZ6yqm1EHMfluDAaxMBCbE6xERTc8bh1YcgM3sPVB8ZGM6ghyev6AWEPmGXY72BISB1v1KyuSDL2h0+62OGK01KLiHUxlGDuzWbCTgnTLb/xAxZGzRYBZbXsgI1M2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745338997; c=relaxed/simple;
	bh=Oad193bVydQGs1G8YxGaKsY+n+t7oPHeApz8EPMvtxg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=DbeBkb5kN5yZfaAOecgVv5J2cLlOUyseTmAKNqpbb7ySN3hdlA7os2Gu7680l1yh/IS08p7QgDg79QBE18lHxxLaQXKTD0UdCREWJB72Yg+KnEPDjy1Ff1cQQSLaIRoGBz4vJskV+9TdzbeHxw2eNBVImbWpdH0cklsn19vuilE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KFFGJpO1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53MCoBxv006082;
	Tue, 22 Apr 2025 16:23:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3+nuXbr2sSvbHmwT/QDKKWLfcltehTKGMqnO581Bql0=; b=KFFGJpO17wHri5CE
	wEXr6IQDXXlaUf9NAQTvRHkZsawJOBFzIh8ZQIrE2v1YhNtGUABWR1xfu6qwTGqF
	VhPlzUUdq+lh6Wp+sSGQwT9/K241FE0Q3CZmaEz4N6s8M+SMyTO7OjA2ARDUX6Qj
	OWzltTFhWtfoQficTaJByFBOFofN4e/KXApQyC1yGkeYSm1HdfkCn7SOEdNoFH4w
	mhELV5ylkebCNBGzBzBqOL1f1NtMBTWTHiebFnitJ7No5obOo2qPMvLNrSVscnDo
	e6qzafGpIBl7NCCQqwucPF/96qPz4TVfnQHZG2H2mujpNtZUvnIH8clnQQwHTghM
	7iV5Xw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46435jgax5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Apr 2025 16:23:08 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53MGN7IT009702
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Apr 2025 16:23:07 GMT
Received: from [10.216.4.61] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 22 Apr
 2025 09:23:03 -0700
Message-ID: <5be729d9-aef0-4c35-a09e-06bb24ad5427@quicinc.com>
Date: Tue, 22 Apr 2025 21:52:59 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/8] arm64: dts: qcom: sc7280: Add WSA SoundWire and
 LPASS support
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
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
References: <20250317054151.6095-1-quic_pkumpatl@quicinc.com>
 <NEOU_bSQGIua5HanDOIfAKJq_XghfrHr5H_120hNUkXtFyurq1rHIe-4_cKpCtH7rr4MJzu89TrHWrpxUfR0_Q==@protonmail.internalid>
 <20250317054151.6095-3-quic_pkumpatl@quicinc.com>
 <9fd63681-28c3-4797-9ed0-f4b05e77e330@linaro.org>
Content-Language: en-US
From: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
In-Reply-To: <9fd63681-28c3-4797-9ed0-f4b05e77e330@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=EOYG00ZC c=1 sm=1 tr=0 ts=6807c26c cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=SpwO9IhAAyP49T1mwoIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: l3htXu3c7S_uMD42e52exv54Qt98Ln3k
X-Proofpoint-ORIG-GUID: l3htXu3c7S_uMD42e52exv54Qt98Ln3k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_08,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0 impostorscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504220122


On 3/27/2025 4:32 AM, Bryan O'Donoghue wrote:
> On 17/03/2025 05:41, Prasad Kumpatla wrote:
>> From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
>>
>> Add WSA macroLPASS Codecs along with SoundWire controller.
>>
>> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
>> Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
>> Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/sc7280.dtsi | 68 ++++++++++++++++++++++++++++
>>   1 file changed, 68 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi 
>> b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> index 39fbd3c40e47..90b2f6e2b7c0 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> @@ -2602,6 +2602,64 @@ swr1: soundwire@3230000 {
>>               status = "disabled";
>>           };
>>
>> +        lpass_wsa_macro: codec@3240000 {
>> +            compatible = "qcom,sc7280-lpass-wsa-macro";
>> +            reg = <0x0 0x03240000 0x0 0x1000>;
>> +
>> +            pinctrl-names = "default";
>> +            pinctrl-0 = <&lpass_wsa_swr_clk>, <&lpass_wsa_swr_data>;
>> +
>> +            clocks = <&lpass_aon LPASS_AON_CC_TX_MCLK_CLK>,
>> +                 <&lpass_aon LPASS_AON_CC_TX_MCLK_2X_CLK>,
>> +                 <&lpass_va_macro>;
>> +            clock-names = "mclk", "npl", "fsgen";
>
> clocks* go before pinctrl*
ACK,
>
>> +
>> +            power-domains = <&lpass_hm 
>> LPASS_CORE_CC_LPASS_CORE_HM_GDSC>,
>> +                    <&lpass_aon LPASS_AON_CC_LPASS_AUDIO_HM_GDSC>;
>> +            power-domain-names = "macro", "dcodec";
>> +
>> +            #clock-cells = <0>;
>> +            clock-output-names = "mclk";
>> +            #sound-dai-cells = <1>;
>> +
>> +            status = "disabled";
>> +        };
>> +
>> +        swr2: soundwire@3250000 {
>> +            compatible = "qcom,soundwire-v1.6.0";
>> +            reg = <0x0 0x03250000 0x0 0x2000>;
>> +
>> +            interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>;
>> +            clocks = <&lpass_wsa_macro>;
>> +            clock-names = "iface";
>> +
>> +            qcom,din-ports = <2>;
>> +            qcom,dout-ports = <6>;
>> +
>> +            resets = <&lpass_audiocc LPASS_AUDIO_SWR_WSA_CGCR>;
>> +            reset-names = "swr_audio_cgcr";
>
> vendor prefixes should come after standard names
>
> Documentation/devicetree/bindings/dts-coding-style.rst
> "Order of Properties in Device Node"

ACK, will check and update in next patch version.

Thanks,
Prasad

>
>> +
>> +            qcom,ports-sinterval-low = /bits/ 8 <0x07 0x1f 0x3f 0x07
>> +                                0x1f 0x3f 0x0f 0x0f>;
>> +            qcom,ports-offset1 = /bits/ 8 <0x01 0x02 0x0c 0x06 0x12 
>> 0x0d 0x07 0x0a>;
>> +            qcom,ports-offset2 = /bits/ 8 <0xff 0x00 0x1f 0xff 0x00 
>> 0x1f 0x00 0x00>;
>> +            qcom,ports-hstart = /bits/ 8 <0xff 0xff 0xff 0xff 0xff 
>> 0xff 0xff 0xff>;
>> +            qcom,ports-hstop = /bits/ 8 <0xff 0xff 0xff 0xff 0xff 
>> 0xff 0xff 0xff>;
>> +            qcom,ports-word-length = /bits/ 8 <0xff 0xff 0xff 0xff 
>> 0xff 0xff 0xff 0xff>;
>> +            qcom,ports-block-pack-mode = /bits/ 8 <0xff 0xff 0x01 
>> 0xff 0xff 0x01
>> +                                   0xff 0xff>;
>> +            qcom,ports-block-group-count = /bits/ 8 <0xff 0xff 0xff 
>> 0xff 0xff 0xff
>> +                                0xff 0xff>;
>> +            qcom,ports-lane-control = /bits/ 8 <0xff 0xff 0xff 0xff 
>> 0xff 0xff
>> +                                0xff 0xff>;
>> +
>> +            #address-cells = <2>;
>> +            #size-cells = <0>;
>> +            #sound-dai-cells = <1>;
>> +
>> +            status = "disabled";
>> +        };
>> +
>>           lpass_audiocc: clock-controller@3300000 {
>>               compatible = "qcom,sc7280-lpassaudiocc";
>>               reg = <0 0x03300000 0 0x30000>,
>> @@ -2808,6 +2866,16 @@ lpass_tx_swr_data: tx-swr-data-state {
>>                   pins = "gpio1", "gpio2", "gpio14";
>>                   function = "swr_tx_data";
>>               };
>> +
>> +            lpass_wsa_swr_clk: wsa-swr-clk-state {
>> +                pins = "gpio10";
>> +                function = "wsa_swr_clk";
>> +            };
>> +
>> +            lpass_wsa_swr_data: wsa-swr-data-state {
>> +                pins = "gpio11";
>> +                function = "wsa_swr_data";
>> +            };
>>           };
>>
>>           gpu: gpu@3d00000 {
>> -- 
>> 2.34.1
>>
>>
>

