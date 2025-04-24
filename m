Return-Path: <linux-arm-msm+bounces-55365-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F30A9AABB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 12:45:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AC8993A6BF7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 10:45:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CFCC253957;
	Thu, 24 Apr 2025 10:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="eAnF73cH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA67F230BC0;
	Thu, 24 Apr 2025 10:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745491148; cv=none; b=fsZW4u1HgIvmh89lKNTByRyWW/O/fVHQxX4jGa/EKE6VUhtPbUHIfYC9cWteg3Rqd5VBchOfkHtVgdqJLII7dYWD0tQOpdG/Nn3X595wQI5PHA9RAhJMed4SbUCe/pfIAenA34KyemrKWYTaze+bwJ/2ZVIZvPni4jsBq0yy7Q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745491148; c=relaxed/simple;
	bh=DNvaXNusjp6R/FxdT1jzd/9TXXRCp+XeHa/VzRjwn3A=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=rNTUlDJBrESMRyeT+q0ibXMrJmVDiOZvs0kqk17itJwOARDomljbeeYAzhzBSIvUhQu0HtT2ffywB/fBsv6RFURySNgSlCIT0B3nO9YkrbnOnhOPPV6G7uTrdEUzIvHd4tNGryiB860k+w/2AWEjTGTj9l2MDdAMv7Wa/kJBte4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=eAnF73cH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53OAGNtX016950;
	Thu, 24 Apr 2025 10:39:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/yV223ZqSxcppzUedvUqCEykHcoIR+TJDiCESH34vPE=; b=eAnF73cHoMkbSK9F
	QLgZfdJwKWvs3vQxk0zgSE7ZstyGAhZ7M8f1HFJ+2hF1x+FjvVkJRif2Jwv1CNYp
	VGcf4q4NvaiIm756jHW1sx8IG6MRPhpfs+6CGzZjSdi9AFIx+TbcdEDoVOMnvoiu
	cfQsAWgIBbvh4QQe/5PPZATayORmcGzvakpyDEOo5wiSklW979FkY69I1iSr+LLx
	TLGWJGVTGibLQkIZks5heHoXE+Z7IaChCLN+ucB9yWoMPIaPqRjoJ3cC2rZNPf1x
	AXrmTynmVAX7QnplzUXkElWfhX34t6zLymPJd5HoMY6LzCcqBv08ccS4i8W1WKoL
	L8rCUQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh1562j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 10:39:02 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53OAd1FK025035
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 10:39:01 GMT
Received: from [10.218.23.250] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 24 Apr
 2025 03:38:55 -0700
Message-ID: <b96f8432-132b-4c16-951e-718e91ec52a5@quicinc.com>
Date: Thu, 24 Apr 2025 16:08:50 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: clock: Add Qualcomm SC8180X Camera clock
 controller
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Stephen
 Boyd" <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        "Jagadeesh
 Kona" <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250422-sc8180x-camcc-support-v1-0-691614d13f06@quicinc.com>
 <H56Iba_grof22uzTtGCI-APhiDAGSejNod6jsSVIykm9ijaaj7PWqyszShCEGjIpM2wCLOn4a3Vfb8Hjziqklg==@protonmail.internalid>
 <20250422-sc8180x-camcc-support-v1-1-691614d13f06@quicinc.com>
 <621d8556-f95b-4cbe-809b-864417f0d48a@linaro.org>
Content-Language: en-US
From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
In-Reply-To: <621d8556-f95b-4cbe-809b-864417f0d48a@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: zPbsRIsarlX68VHBjDPEsnHLlsIj26HJ
X-Authority-Analysis: v=2.4 cv=OY6YDgTY c=1 sm=1 tr=0 ts=680a14c6 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=gEfo2CItAAAA:8 a=COk6AnOGAAAA:8 a=CIINWzuxR8hvsKXtIHkA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=sptkURWiP4Gy88Gu7hUp:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: zPbsRIsarlX68VHBjDPEsnHLlsIj26HJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA3MCBTYWx0ZWRfX55gsXNHjuq6/ b+NikVvwT0xB3z+niVpf4PcZWUu+V+TZ5kLNR2rIESh3Fuw9bbcqTT6+xJBboQbYN1dB1hjIu3q Kcx2WO3hjSwjpHSX0vJY3fTyZEAEz+1hbypYa3UFuxllbJAOkn9YlqkWVr1ANJLOZUx91oIa9wx
 KSdoaIMwVrJySXL4dXOK3hCjGxHvKR548nvB6PWgbwfqb5JDtm2kYAO4StWmz7Nt2Utwe5rckw0 ogkbOQojs1wdO/QcjZpZuYjafzHmXoucKs6rxgfgfySe0r72jK8LUitEo+vhHqvB0F3bZyVAu1l 1OkjR4xQ/EG/SQgU7F6A2IzyL7xedq2cFKbpeNKNkAKPfZANwzCX+rIF1PL3kRFictallYpsPvP
 29/b8QlVjqc9/nU9il38M8/lAmvCGbw+HhrXRdZuLCf/Q5nZIRFcPxhlGWNH3BwDNkaNFwQC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_05,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 clxscore=1011 malwarescore=0
 mlxlogscore=999 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240070


On 4/22/2025 5:11 PM, Bryan O'Donoghue wrote:
> On 22/04/2025 06:42, Satya Priya Kakitapalli wrote:
>> Add device tree bindings for the camera clock controller on
>> Qualcomm SC8180X platform.
>>
>> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
>> ---
>>   .../bindings/clock/qcom,sc8180x-camcc.yaml         |  65 ++++++++
>>   include/dt-bindings/clock/qcom,sc8180x-camcc.h     | 181 
>> +++++++++++++++++++++
>>   2 files changed, 246 insertions(+)
>>
>> diff --git 
>> a/Documentation/devicetree/bindings/clock/qcom,sc8180x-camcc.yaml 
>> b/Documentation/devicetree/bindings/clock/qcom,sc8180x-camcc.yaml
>> new file mode 100644
>> index 
>> 0000000000000000000000000000000000000000..b17f40ee53a3002b2942869d60773dbecd764134
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/qcom,sc8180x-camcc.yaml
>> @@ -0,0 +1,65 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/clock/qcom,sc8180x-camcc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Camera Clock & Reset Controller on SC8180X
>> +
>> +maintainers:
>> +  - Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
>> +
>> +description: |
>
> You can drop the "|"
>

okay.


>> +  Qualcomm camera clock control module provides the clocks, resets and
>> +  power domains on SC8180X.
>> +
>> +  See also: include/dt-bindings/clock/qcom,sc8180x-camcc.h
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,sc8180x-camcc
>> +
>> +  clocks:
>> +    items:
>> +      - description: Board XO source
>> +      - description: Sleep clock source
>
> Missing clock-names
>

Since we are using DT based indexing method, clock names are not required.


> A suspicious lack of clock depends here. No AHB clock ?> +
>> +  power-domains:
>> +    maxItems: 1
>> +    description:
>> +      A phandle and PM domain specifier for the MMCX power domain.
>> +
>> +  required-opps:
>> +    maxItems: 1
>> +    description:
>> +      A phandle to an OPP node describing required MMCX performance 
>> point.
>> +
>> +allOf:
>> +  - $ref: qcom,gcc.yaml#
>
> A suspicious lack of clock depends here. No AHB clock ? No dependency 
> on gcc ?
>
> You call out the gcc above.
>
> Could you please recheck your list of clock dependencies.

The dependent GCC clocks are marked always on from gcc probe, hence did 
not mention the dependency here.


>
> ---
> bod

