Return-Path: <linux-arm-msm+bounces-68258-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E83B2002F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 09:20:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 47D44174B0E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 07:20:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD7CA2BE7C2;
	Mon, 11 Aug 2025 07:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="haQpP/2g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BCE7198E91;
	Mon, 11 Aug 2025 07:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754896835; cv=none; b=SaG+0am18z0nHIMIFtrrNB0Qch4/KI8D968sxgAez567S2Np04mdKuG3yUgM7xH27cJeDrZVQ3hbqG17DyHS+BRWjlcYYM0R+3eGpOsov1fEgfpm4n8zs2QhmY5sgJ6OnaVPfmS5L0tmKfJOTb0UUCmuFO0E1ghjJFWa2khgx1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754896835; c=relaxed/simple;
	bh=rjMF5I0VciWnnIE8+pPP+oPn6uH2X8pjFgDqE+j2Ep4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=fdlMqSxH+MAoGrGrbbkgZqtKmWS9kbsKfzeM79nJObMJikag0ZfLDBtu/LjLx3AVM9Oe0cOM39Ctgx7U1RWol+AvwwO3r8VU1UedO+78Qac0iUJZlVBK1g/4StTf6FJeFajzPZ0GPfHB7JecAwjhbCS6gu2kV8bay0ySQRqTBwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=haQpP/2g; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57AKWDoQ032054;
	Mon, 11 Aug 2025 07:20:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F6PyLsl2AAIrmnsmx4C8ByvqxJzlrU8Vx53Jsr0KJdU=; b=haQpP/2gB9b7Ezc4
	BO5Psnx3sJ/RDi6dpOQrrWli9VHmFZNZgMLxUZtq1wUGaFqvfwfcMGUeC91pmcYM
	PseP8Or/5MZ83gt3qmmYwIsVSiy993jvalKjHEUMJ1xYSjm5VV5ETqWkPQ3wcO5C
	DDXs/2jLXoiZAvAaQZxRQ2Z1B4D0D6alYk+SBP6vtA2P9ADgqkv6TFo2C8saDQfT
	OuOu1GqqYiSrRTJSyVH/pSyvqhkjXhydPLuNaHvnFm+d8msrxFYEeeleIMhfNY1n
	bvBuNVqYX1hF08ygo4bPbdjxKVVFgBUeSGAQ0ANelZfHZtl5AdrCCTeXB0l2G3kx
	wR6eqA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dygmbdgu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Aug 2025 07:20:30 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57B7KUHR013754
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Aug 2025 07:20:30 GMT
Received: from [10.151.36.85] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 11 Aug
 2025 00:20:26 -0700
Message-ID: <eb344d1e-22af-4ff8-9ddd-316a9968e5d7@quicinc.com>
Date: Mon, 11 Aug 2025 12:50:23 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: dts: qcom: ipq5424: add i2c nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>,
        <kathiravan.thirumoorthy@oss.qualcomm.com>
References: <20250711111418.3980520-1-quic_mmanikan@quicinc.com>
 <9597ab85-6c91-4e76-b160-0257bc4c5412@oss.qualcomm.com>
Content-Language: en-US
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
In-Reply-To: <9597ab85-6c91-4e76-b160-0257bc4c5412@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzNSBTYWx0ZWRfXwd/Y6dSywtre
 GzrsrTpmHQycDoNevCN+ivoviLhnDl19qDk/DI+lXu61eE7AYdbK6CQ6+oLCDLaSCbUyobH+YqS
 AZZLZmjb8tj/MacxqePL/HMqHs02DsrW2b5yr1nQpwctyn8dXLZySpA7I2NbQ++9Q+WDUYG7wW1
 BSvrlMrz4X0eBJPfTT734bRVKMSUQn0xZd/KNi44NObdqTO6flLSHNpicFAYl9TLtXR2O5pR27h
 jd27J6IY9C3C/FECwqVll0fgC9+dyPZLEYoZfk9Wkwqx+jkz79M3LMXwoVYZ1mOR9tmqYiiEMMn
 F9lbYsOb+0hj5IWs2jxRFSGZFWZcTd0e1oyLlEqryeQq+sC6oMeQkiMjGz7MVqFwJa1Ole2ewm8
 snChB+Ds
X-Authority-Analysis: v=2.4 cv=FvMF/3rq c=1 sm=1 tr=0 ts=689999be cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=X5u_7EEaSWp0MH8HeZ0A:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: br-GE2EKZ6P4dGLb19U4OFWG5NiipgeR
X-Proofpoint-ORIG-GUID: br-GE2EKZ6P4dGLb19U4OFWG5NiipgeR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090035



On 7/30/2025 5:13 PM, Konrad Dybcio wrote:
> On 7/11/25 1:14 PM, Manikanta Mylavarapu wrote:
>> Serial engines 2 and 3 on the IPQ5424 support I2C. The I2C instance
>> operates on serial engine 2, designated as i2c0, and on serial engine 3,
>> designated as i2c1. Add both the i2c0 and i2c1 nodes.
>>
>> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
>> ---
>>  arch/arm64/boot/dts/qcom/ipq5424.dtsi | 22 ++++++++++++++++++++++
>>  1 file changed, 22 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
>> index 66bd2261eb25..858b9c714a13 100644
>> --- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
>> @@ -425,6 +425,28 @@ uart1: serial@1a84000 {
>>  				interrupts = <GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH>;
>>  			};
>>  
>> +			i2c0: i2c@1a88000 {
>> +				compatible = "qcom,geni-i2c";
>> +				reg = <0 0x01a88000 0 0x4000>;
>> +				clocks = <&gcc GCC_QUPV3_I2C0_CLK>;
>> +				clock-names = "se";
>> +				interrupts = <GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH>;
>> +				assigned-clocks = <&gcc GCC_QUPV3_I2C0_CLK>;
>> +				assigned-clock-rates = <64000000>;
> 
> This is very wrong, the in-driver handling should be enough.
> If not, add an opp-table.
> 

Hi Konrad,

Thank you for your review and valuable feedback.
I will incorporate an opp-table entry with a 64MHz frequency and submit a revised patch.

Thanks & Regards,
Manikanta.


