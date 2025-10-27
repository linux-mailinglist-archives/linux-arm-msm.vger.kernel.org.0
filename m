Return-Path: <linux-arm-msm+bounces-78885-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id D83C5C0D4DF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 12:54:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 778DB34A746
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 11:54:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E6342FF65C;
	Mon, 27 Oct 2025 11:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ASprHnPc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7747B2FFDC4;
	Mon, 27 Oct 2025 11:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761566033; cv=none; b=gqjCw5tE3G7L5WF/3dPCbR55zKCzHYxTQc2uHX85suZ99C5O1dkVtNAA6isnoVUj1mpEzQksSwMLc9a/yh2hXmQSssKF/NyIecdrGMWLlwk8jOWCPL3SPct4gB9M2F4sj5ONt3LOvT7mk0AvMYHzxy39zA2YDgUu35AS4hMx76g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761566033; c=relaxed/simple;
	bh=zb3LmjKMdTsE/23Ls/C03d5WBb44lvvLGPhVNVFIFAw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=d4QN0VI+QAW55kBAVDHGDR2MjlR6XZ2yK8zgoxghBLjbQ6kqfj8hVUrUUjN3iEvtyM2tf48FuSlglt0M0NH6wrsY+BIisCiSjuV4kpibe8g0oo/ZpAXdoBRF8HeCzGZ/Ae3Y1D0iGv3qFxlW6A+dkQAgxtWUA2TLURekiJ7g6SI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ASprHnPc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59R7Jugj2059256;
	Mon, 27 Oct 2025 11:53:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I17/ShseTwfgvQD+mq64ZZYhrO8g6oyyuc/4cqZ4IBQ=; b=ASprHnPcQx2oZ0FJ
	+WwsLK6E6SWBTvpasGhxx2+4iJ7JxJ0o/s0UJNkZsJJmnZ2xVypFtLgLBoOQCnfA
	pw6OACw+RYFmCocDJDxB/hHb7wT0/puZoaeJUYLN74E8aAbyJgEffXN47fIhngd3
	1Hv8l5OGf6r9IMgqcm5hIJ0F/RnXJzvoFJqLq8tjKzoExBv9CSTa+xoaYB2i2I9E
	zDbCkCDFjh4UJfAX94ENjRaeflOu91KdUwmDSNQSWIu+zL+lZTeoOZovxHlQDvBY
	VY7/7jUmeMbjJ9Y4T2LTU6v2OQlX3AcI6KifJL+ZfZo4HfCOby5x6MF4Ul91Ws1f
	YgAsDg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a248p8r2k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Oct 2025 11:53:49 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 59RBrmSK028769
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Oct 2025 11:53:48 GMT
Received: from [10.151.36.85] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Mon, 27 Oct
 2025 04:53:44 -0700
Message-ID: <4265f8a8-b26d-45b3-9fdc-5438ea9e931b@quicinc.com>
Date: Mon, 27 Oct 2025 17:23:41 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: dts: qcom: ipq5424: add gpio regulator for cpu
 power supply
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>,
        <kathiravan.thirumoorthy@oss.qualcomm.com>
References: <20251023040224.1485946-1-quic_mmanikan@quicinc.com>
 <cb166706-af7d-40e7-84d5-57c028755cdf@oss.qualcomm.com>
Content-Language: en-US
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
In-Reply-To: <cb166706-af7d-40e7-84d5-57c028755cdf@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=Zvzg6t7G c=1 sm=1 tr=0 ts=68ff5d4d cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=P6RpQUbBFH0ivqSx824A:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDExMSBTYWx0ZWRfX3X6g5faMpRGR
 csf2wz131aL5iB0P2+fSR3keuH5mzoMnAQ72jWPTlSAVcjWzKIMDxj9bGNAeoZccV82A2ztz5wx
 qjLbQwelkUuhaHn30k9ZT4gJDH9k01D+2XCigqrKmSZZJ9E4swnwSALvjPuspYDCocMaY8Cmhj5
 AHz02h2LXGANwFzqDISP+knBL4diiFdDqjvx9Kn9RiA/m8ach3/fRfNKf8eZ1pfGefbbBYPVfCu
 +pVvO+PsIbF0pdUduTwWommzE3KHqUx1Pr7rk2aerP0ymIxTREEvuoOU8JcAP513mFrA5EPB9E3
 T0CwSJB1w1M2sugf00OkVLAYKEQgowN31aB5kLQ/McLCKFdnXbsblokzd5yNZhK7cqP1LVXA25j
 KmhgrCozk1oyhBkMPCp6jVriLBJY2Q==
X-Proofpoint-ORIG-GUID: 0oWPdAvH1pvfpenSnqSxVcvWhmsi1Xor
X-Proofpoint-GUID: 0oWPdAvH1pvfpenSnqSxVcvWhmsi1Xor
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_05,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510270111



On 10/23/2025 8:03 PM, Konrad Dybcio wrote:
> On 10/23/25 6:02 AM, Manikanta Mylavarapu wrote:
>> Add a GPIO-controlled regulator node for the CPU rail on the
>> IPQ5424 RDP466 platform. This regulator supports two voltage
>> levels 850mV and 1000mV.
>>
>> Update CPU nodes to reference the regulator via the `cpu-supply`
>> property, and add the required pinctrl configuration for GPIO17.
>>
>> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
>> ---
>>  arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts | 24 +++++++++++++++++++++
>>  arch/arm64/boot/dts/qcom/ipq5424.dtsi       |  4 ++++
>>  2 files changed, 28 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
>> index 738618551203..6d14eb2fe821 100644
>> --- a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
>> +++ b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
>> @@ -46,6 +46,23 @@ led-0 {
>>  		};
>>  	};
>>  
>> +	vreg_apc: regulator-vreg-apc {
>> +		compatible = "regulator-gpio";
>> +		regulator-name = "vreg_apc";
>> +		regulator-min-microvolt = <850000>;
>> +		regulator-max-microvolt = <1000000>;
>> +		regulator-boot-on;
>> +		regulator-always-on;
>> +		regulator-ramp-delay = <250>;
>> +
>> +		gpios = <&tlmm 17 GPIO_ACTIVE_HIGH>;
>> +		gpios-states = <1>;
>> +		states = <850000 0>, <1000000 1>;
> 
> Atop Dmitry's comment, please make the states entries 1 a line

Hi Konrad,

Thank you for reviewing the patch.
I will incorporate the suggested change in the next version.

Thanks & Regards,
Manikanta.


