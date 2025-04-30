Return-Path: <linux-arm-msm+bounces-56213-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F79AA45C9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 10:45:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AF6B69C4786
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 08:44:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BB8A2185B1;
	Wed, 30 Apr 2025 08:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BH1Dqouy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD8C20D505;
	Wed, 30 Apr 2025 08:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746002642; cv=none; b=BTaBQWO8NJvsrQSEUMxY/OkNvrfdJ31s3JhNG/YOm3AgE+RT324oxeki69RykpFQULFQkGXuT6QAZdKOhFnkKvdpiQjbG+djwmZp+RpFYacgbHZjkK/XKxcra6Jk1wGu96VvWeneP2s8KB1uBn+Y5JpeNzjf7R012xDnuE26p44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746002642; c=relaxed/simple;
	bh=7Co8V1RtFjmvkaayS3lqMKD0JIT+ElCnjx8TinEXKSM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=G9WvH33vd77yf6/EXRw+DIF4FWt0PdgrSzImMcLYISlGVnnHlQlQF6S5TLOVvUFKiPqaaYpqjA3oa+esi8rVQowFz6I/e8O/HGn+h7vu/QJYXxnJAbLoBC2viF5XuznjOFVtrrk0gBRzFL7EbCX0bsDfQ79KzOchKf1y0qmIHao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BH1Dqouy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TLauPr001485;
	Wed, 30 Apr 2025 08:43:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x7SCYQVXeDsdR1GUukXJP3PLvXOUonXD4QOh6Fbe46s=; b=BH1DqouyC9AbTFnh
	OzTHYl4xRsMgNDhOptBGX5sKmJhTGRC/0gFLyEhQcGyjlu+1/7KnbO9q+s/ua7X4
	KWmBmElxo29dBASfMNcx+HE4a+up+WmgTejn2Arb5dZX7c4OnqTrZ3MPpmVUNKI2
	KayDE4jPPRYopRlcKYA/xjrgU6Dpoua5E5DyIKjcPJQb6dpxvhsvZtpvKrqC7aCH
	R7QZnq3mc07uoe2/Zq9218Yy1QYlgLinmebRwt/Zj+nn2x0WM4ns2nKM3k3oDZ0Q
	Ws7GLjFgmzJVRXrWJ0/Pmx1/y1948fhGhwbR3n8x6Lun60+tNVfefhNKZfogBJzF
	q4wIVw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u9sd2h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 08:43:55 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53U8hs0j030071
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 08:43:54 GMT
Received: from [10.218.23.250] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 30 Apr
 2025 01:43:49 -0700
Message-ID: <bda4e8ad-0d72-4a07-90ef-9fa4245fd205@quicinc.com>
Date: Wed, 30 Apr 2025 14:13:47 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: clock: Add Qualcomm SC8180X Camera clock
 controller
From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
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
 <b96f8432-132b-4c16-951e-718e91ec52a5@quicinc.com>
Content-Language: en-US
In-Reply-To: <b96f8432-132b-4c16-951e-718e91ec52a5@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: QCrNemx7V893oaF_4LBMTq-th3DzkxP4
X-Proofpoint-ORIG-GUID: QCrNemx7V893oaF_4LBMTq-th3DzkxP4
X-Authority-Analysis: v=2.4 cv=UZZRSLSN c=1 sm=1 tr=0 ts=6811e2cb cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=gEfo2CItAAAA:8 a=COk6AnOGAAAA:8 a=0wTyN5AiIvhKT9tr5UwA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=sptkURWiP4Gy88Gu7hUp:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDA2MCBTYWx0ZWRfX2wu2tMQMbbmw xVDT0VgxEm6dERnm9TwdAu9YRQjCE0hgErAATkGOhamUlJTN5N36sJGyjf55+715A15YPzseKKT QjA96vCY+ZvejOhR0ZSDRspWuONYV+vGWuXfZpO/KwPkR+M8Fl1ARwfZWXg9Y8PdXOPe0qHV4Dr
 wzRCfYmujpo+hHkZ/EBXJNSV6XQytDKT9RuOakmx9p7INGt6zwQmbDLd/jkfmZoRDAzbpho9ew+ t0MH74P45PxY3fJ+XYq/p8asoLh2M8ewNZzspC16xci6En/65xhzm4QiguN5E8RvfYrtRUSF6FG JWkOUwEIrzGpzzIwjiHix76aPOwhUc+ex2iyu2ti7G5STPvO0PVZrXeofOiRN0PCQMKdyEnamoe
 jbRoe4OfuXJSzgjjq4SxK3BYFmXxjJ2acEjJ6jgpL/4zb7ipTxJegfwR4rhdYQDs3U3AMRKY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 mlxlogscore=999 spamscore=0 priorityscore=1501 impostorscore=0 mlxscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504300060


On 4/24/2025 4:08 PM, Satya Priya Kakitapalli wrote:
>
> On 4/22/2025 5:11 PM, Bryan O'Donoghue wrote:
>> On 22/04/2025 06:42, Satya Priya Kakitapalli wrote:
>>> Add device tree bindings for the camera clock controller on
>>> Qualcomm SC8180X platform.
>>>
>>> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
>>> ---
>>>   .../bindings/clock/qcom,sc8180x-camcc.yaml         |  65 ++++++++
>>>   include/dt-bindings/clock/qcom,sc8180x-camcc.h     | 181 
>>> +++++++++++++++++++++
>>>   2 files changed, 246 insertions(+)
>>>
>>> diff --git 
>>> a/Documentation/devicetree/bindings/clock/qcom,sc8180x-camcc.yaml 
>>> b/Documentation/devicetree/bindings/clock/qcom,sc8180x-camcc.yaml
>>> new file mode 100644
>>> index 
>>> 0000000000000000000000000000000000000000..b17f40ee53a3002b2942869d60773dbecd764134
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/clock/qcom,sc8180x-camcc.yaml
>>> @@ -0,0 +1,65 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/clock/qcom,sc8180x-camcc.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Qualcomm Camera Clock & Reset Controller on SC8180X
>>> +
>>> +maintainers:
>>> +  - Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
>>> +
>>> +description: |
>>
>> You can drop the "|"
>>
>
> okay.
>
>

I tried removing this, but it is throwing below error, in the line "See 
also: include/dt-bindings/clock/qcom,sc8180x-camcc.h" because of usage 
of a colon there.

Error: 
Documentation/devicetree/bindings/clock/qcom,sc8180x-camcc.yaml:16:12: 
mapping values are not allowed in this context

As we are following the same format in all other Qualcomm bindings, I'll 
keep the "|" and "See also:" section as is.


>>> +  Qualcomm camera clock control module provides the clocks, resets and
>>> +  power domains on SC8180X.
>>> +
>>> +  See also: include/dt-bindings/clock/qcom,sc8180x-camcc.h
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: qcom,sc8180x-camcc
>>> +
>>> +  clocks:
>>> +    items:
>>> +      - description: Board XO source
>>> +      - description: Sleep clock source
>>
>> Missing clock-names
>>
>
> Since we are using DT based indexing method, clock names are not 
> required.
>
>
>> A suspicious lack of clock depends here. No AHB clock ?> +
>>> +  power-domains:
>>> +    maxItems: 1
>>> +    description:
>>> +      A phandle and PM domain specifier for the MMCX power domain.
>>> +
>>> +  required-opps:
>>> +    maxItems: 1
>>> +    description:
>>> +      A phandle to an OPP node describing required MMCX performance 
>>> point.
>>> +
>>> +allOf:
>>> +  - $ref: qcom,gcc.yaml#
>>
>> A suspicious lack of clock depends here. No AHB clock ? No dependency 
>> on gcc ?
>>
>> You call out the gcc above.
>>
>> Could you please recheck your list of clock dependencies.
>
> The dependent GCC clocks are marked always on from gcc probe, hence 
> did not mention the dependency here.
>
>
>>
>> ---
>> bod
>

