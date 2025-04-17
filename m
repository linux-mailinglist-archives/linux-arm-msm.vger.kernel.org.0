Return-Path: <linux-arm-msm+bounces-54585-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17934A91291
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Apr 2025 07:17:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2507E17E8AA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Apr 2025 05:17:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B63DE1A9B5D;
	Thu, 17 Apr 2025 05:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="TFS22AK8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C0BA94A;
	Thu, 17 Apr 2025 05:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744867062; cv=none; b=A6AyV6h0pXK0lp5wUN8e7vRLEUsiLRYGpwyIPZkeDFZk9snGc0gjNCngAuuPjFhi/dCA1LD2uXQNOPxZUxO3cv7Axquq3cluOgo94cQ6exiUFDXFfqjy2j8JA3ek7x8tB5xKGHwf3bbh7BbB/rJzYReEmzWvGRXz06CqfpeWqmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744867062; c=relaxed/simple;
	bh=7OV+f3vDShZtvnmttlNv71PFVC0bYluxMHaeCMRgshQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=S+RScIo7uXWc0NAfT344P2k43h7Q/A4NRSWhWyh65J/64M3Ljq9VYem5DVwNARgGG7rJGYRU/cD9JssD4EmEA5vAizVBgvR/58MFDnKKVHpfb56JUN8OU73PnDt+qj8TFmdF6ilzrrSi9NpJZTX9uTC0PneWh2JBPNbYKNQDB8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=TFS22AK8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53GKpWHN007009;
	Thu, 17 Apr 2025 05:17:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WU3sld5Jbc9P6ug6bv/f4esZGEWlU/0kEIovdrpINqw=; b=TFS22AK82TJRfVMa
	Ghojh/sufSCQgdGgkISY/xBUkLrUK6K0wnXWDEks077Pfc2BZ091SytpSalLfI11
	FqcrnNF7LEQVDEB2pLupLClEwZlDHRwwR39/wX4WVbWVJUN0WvPjS3l/kI1BUT3A
	A/2tkYYoKi7LVSaCeg27BI+rqtiSR/7rljrkpDosqZuTGYh9kDg8Qvl1ABtUw+oy
	p523zN+oB+YPyDltgiCTpRIFJopHMVXd499vcdu4m+LOnrHKlQFxvms/78xrCFRG
	oY9BpWVvnsinJazk2L9gmQuoPEpDC7cSGSxBM1cg76P/W1M1TbubASrprskxHUXU
	HJYqRA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygd6nt3b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Apr 2025 05:17:33 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53H5HWgN017094
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Apr 2025 05:17:32 GMT
Received: from [10.216.14.157] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 16 Apr
 2025 22:17:28 -0700
Message-ID: <3df9f397-e97c-4224-a388-df6fe211778d@quicinc.com>
Date: Thu, 17 Apr 2025 10:47:25 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] arm64: dts: qcom: Enable TSENS support for QCS615
 SoC
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, <amitk@kernel.org>,
        <rafael@kernel.org>, <daniel.lezcano@linaro.org>,
        <rui.zhang@intel.com>, <lukasz.luba@arm.com>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <andersson@kernel.org>, <konradybcio@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <quic_manafm@quicinc.com>
References: <cover.1744292503.git.quic_gkohli@quicinc.com>
 <76e0ce0e312f691abae7ce0fd422f73306166926.1744292503.git.quic_gkohli@quicinc.com>
 <7f893243-572b-4e23-8f2b-ae364d154107@oss.qualcomm.com>
 <46cd600e-b388-4225-a839-a6af76524efe@quicinc.com>
 <2b889254-2847-4c6b-a01d-3626332dcb0a@oss.qualcomm.com>
Content-Language: en-US
From: Gaurav Kohli <quic_gkohli@quicinc.com>
In-Reply-To: <2b889254-2847-4c6b-a01d-3626332dcb0a@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: eDbCxEdeKkoIdLgsETCxp75LWZwSdVag
X-Proofpoint-GUID: eDbCxEdeKkoIdLgsETCxp75LWZwSdVag
X-Authority-Analysis: v=2.4 cv=ANaQCy7k c=1 sm=1 tr=0 ts=68008eed cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=5R2SSpfT02JEmUF-5wQA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_01,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 mlxlogscore=999 suspectscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504170039



On 4/14/2025 3:23 PM, Konrad Dybcio wrote:
> On 4/14/25 10:28 AM, Gaurav Kohli wrote:
>> thanks for review!
>>
>> On 4/12/2025 5:13 AM, Konrad Dybcio wrote:
>>> On 4/10/25 4:00 PM, Gaurav Kohli wrote:
>>>> Add TSENS and thermal devicetree node for QCS615 SoC.
>>>>
>>>> Signed-off-by: Gaurav Kohli <quic_gkohli@quicinc.com>
>>>> ---
>>>
>>> subject: "arm64: dts: qcom: qcs615: ..">  arch/arm64/boot/dts/qcom/qcs615.dtsi | 281 +++++++++++++++++++++++++++
>>>>    1 file changed, 281 insertions(+)
>>>>
>> will fix this.
>>>> diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
>>>> index edfb796d8dd3..f0d8aed7da29 100644
>>>> --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
>>>> @@ -3668,6 +3668,17 @@ usb_2_dwc3: usb@a800000 {
>>>>                    maximum-speed = "high-speed";
>>>>                };
>>>>            };
>>>> +
>>>> +        tsens0: tsens@c222000 {
>>>> +            compatible = "qcom,qcs615-tsens", "qcom,tsens-v2";
>>>> +            reg = <0x0 0xc263000 0x0 0x1ff>,
>>>> +                <0x0 0xc222000 0x0 0x8>;
>>> Pad the address part to 8 hex digits with leading zeroes> +            interrupts = <GIC_SPI 506 IRQ_TYPE_LEVEL_HIGH>,
>>>
>>> &pdc 26
>>>
>>>> +                    <GIC_SPI 508 IRQ_TYPE_LEVEL_HIGH>;
>>>
>>> &pdc 28
>> we don't want to mark this as wake up capable, so using this approach.
> 
> Why not?
> 
Intention was to avoid wake up, as system is already in lowest state, 
please let me know if you see any concern here.
>>>> +
>>>> +        cpuss-0-thermal {
>>>> +            thermal-sensors = <&tsens0 1>;
>>>> +
>>>> +            trips {
>>>> +
>>>> +                trip-point0 {
>>>> +                    temperature = <115000>;
>>>> +                    hysteresis = <5000>;
>>>> +                    type = "passive";
>>>> +                };
>>>> +
>>>> +                trip-point1 {
>>>> +                    temperature = <118000>;
>>>> +                    hysteresis = <5000>;
>>>> +                    type = "passive";
>>>> +                };
>>>
>>> Please drop the passive trip point for the *CPU* tzones, see
>>>
>>
>> we are using trip-point 0 for cpu idle injection mitigation which i will add in subsequent patches, if you are fine i will add cpu idle injection cooling map in this series only ?
> 
> The folks working on qcs9xxx have made this point too, but I'm lukewarm
> on duplicating meaningless dt description everywhere. I've asked them to
> conduct some measurements on whether random default settings (that would
> be preset in the driver and require no additional dt fluff) show any
> significant difference - if not, we can save up on boilerplate.
> 
> So let's wait to hear back from them on this.
> 
Sure will wait for latest update.
>>> commit 06eadce936971dd11279e53b6dfb151804137836
>>> ("arm64: dts: qcom: x1e80100: Drop unused passive thermal trip points for CPU")
>>>
>>> and add a single critical point instead, see
>>>
>> As critical shutdown is already supported by hardware, so we are not defining here.
> 
> The hardware critical shutdown will literally pull the plug out with the OS
> having no chance to sync the filesystem etc.
> 
> Please define one that's like 5 degC below the hardware limit, so that the
> operating system can try to take some steps to avoid data loss
> 

Sure will post critical in next patch.
> Konrad


