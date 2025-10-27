Return-Path: <linux-arm-msm+bounces-78886-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 599E1C0D5BA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 13:01:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD112407367
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 11:54:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E459E3009C1;
	Mon, 27 Oct 2025 11:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QlKYGKsE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD692FF654;
	Mon, 27 Oct 2025 11:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761566039; cv=none; b=ZcdLeGAh2Dg3x4syXbxkhLOuBpsy7OCz/UhbtxOwINEOUmAirCUpwUxh/XJtoiHx1RmY4YX6mUHuv3OkuIsOUdpiT1EpmJz9PjY2jkt7sGdyhRP5/orx5ySk4CzKT4Sow8EuPfthSyF6FRoX0kpXAdkMKThoPbEZj4mKnWLG4+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761566039; c=relaxed/simple;
	bh=uKQ3KXnvoFnQVXBenAS5vSsKDUxIPcvN+uC0/uRTINU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=uU3xNPXl/xWf5WKBcpgefSZAZGJrceSbKpuz/v8OPxVLpkp94uT+BbE3N+19znl1yXiS5r55oimWlLbME+ud8c8smvSJKskS9HELFNyzeSH63+luVOU2V1ES/+kMz2fGQGoXTlhL6e/XnQufygcegJ2Bh4TATXStApL4MxgfHzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QlKYGKsE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59R8KUpv853418;
	Mon, 27 Oct 2025 11:53:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T8AlCSPbxa0/4b/Qnm6NCQnzb0HpZIMUHXWQRunT52M=; b=QlKYGKsEnsUtNs+Y
	Q1g9Yx4JCEFxQyNS7EkPIp5+dtgvsk4qfqszAUWlMVelV10h4i8bTprOOdmYTiL1
	m5akfdxW1mo3nYa/nHCETWpumKyPp5ZlP+VTHDwTdoLiR4Kiv/MgL+nMws+Sbnrn
	CM4xBOgOq1CESqB1PHf2MRRtDtuYKJ+WIuB/PELydxNzwOfszWftdl1lgyT/Ea1/
	doP2JXuchH8TX4RqwxViRnFggkgEMZ3rSROK/F9JAl4HeX/7egC+Wo0yzy8QCkzE
	ClOpo02fSERt6PYaDHvCdqNiIM6MbqWNIIr9L8ZVtN1hIGd+CoP9wbiDe+qTxzPV
	c+1GCA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a1ud1su4e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Oct 2025 11:53:55 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 59RBrtXe028582
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Oct 2025 11:53:55 GMT
Received: from [10.151.36.85] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Mon, 27 Oct
 2025 04:53:51 -0700
Message-ID: <35a3434c-9408-472d-8575-6efa2ea28e12@quicinc.com>
Date: Mon, 27 Oct 2025 17:23:51 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: dts: qcom: ipq5424: add gpio regulator for cpu
 power supply
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_srichara@quicinc.com>,
        <quic_varada@quicinc.com>, <kathiravan.thirumoorthy@oss.qualcomm.com>
References: <20251023040224.1485946-1-quic_mmanikan@quicinc.com>
 <3xxdcekqzn6hxc2zoavsge3s53czavpfs2evc3ot37aivw4rib@uee2g2mem3hx>
Content-Language: en-US
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
In-Reply-To: <3xxdcekqzn6hxc2zoavsge3s53czavpfs2evc3ot37aivw4rib@uee2g2mem3hx>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDExMSBTYWx0ZWRfX2G+F1vz7FAph
 /crtNSTpOnwidBENMyUXM5qG+j9FvzZFN/uw1IHiCxVbGBA/bMrniLoZDECZktkvmzubzNwPqNM
 zzcfWMdUETSAOwy5FGxvHZ6A0aVtzskLywXXUNQs7GY/djm6o5md7v+Ymg8QjUQEbOzRjmXaAUT
 mZ9RWpFf2Fs9AoDrmtouxK143r6XfLtrM04vmTEROYYPdNGeOkIMPDNJ7U4pyr4kysdJ3kyf4+A
 To6IEsd2caPRBaTLqwpNt9hqk6tqOcYrwjrpirdq22w6V1KuNko29IQbcpvoh+vyw/keFPFBhmR
 639I/0OicjmNRiBStIOAPG7uqfncYDWGfG2OHs00JNC3toF9Pho4QICex1zJnVUEYINZ2ugbc20
 VSI7sEiuTBbm2KaFmcronHrk5PT8dw==
X-Proofpoint-GUID: ivnvOsvaH_SZ4N8A-wThQ-grBmd2EwOK
X-Proofpoint-ORIG-GUID: ivnvOsvaH_SZ4N8A-wThQ-grBmd2EwOK
X-Authority-Analysis: v=2.4 cv=UqNu9uwB c=1 sm=1 tr=0 ts=68ff5d53 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=uQvMgEUVd491ROOkyBoA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_05,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1011 spamscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510270111



On 10/23/2025 7:42 PM, Dmitry Baryshkov wrote:
> On Thu, Oct 23, 2025 at 09:32:24AM +0530, Manikanta Mylavarapu wrote:
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
>> +
>> +		pinctrl-0 = <&regulator_gpio_default>;
>> +		pinctrl-names = "default";
> 
> 'vreg' > 'usb'
> 

Hi Dmitry,

Thank you for reviewing the patch.
I will incorporate the suggested change in the next version.

Thanks & Regards,
Manikanta.

