Return-Path: <linux-arm-msm+bounces-58179-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57453AB969B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 09:35:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D9FB3B3B91
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 07:34:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85CFF22652E;
	Fri, 16 May 2025 07:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kxQVDB3G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F712C9A;
	Fri, 16 May 2025 07:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747380908; cv=none; b=IBTihGq3OrhqD8b2kFNMZexkeCPkR6/D5sENm4rsLZY5X81dzVVR85m/NA5QnIpEZ4cJjUx+tu6ZBooL2Ee0i5e9VbY2bxu8eeRvVx7+x2GyYKw2cU2LG0SDNqQMnIG3JvxWjKg1ISl0tGGfHHnCGWhhlxioi/IKn2RAXcuisUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747380908; c=relaxed/simple;
	bh=fHMu131eeC4O5t5ae3yEgP2HF3PgHSd4g5RekRTUeWM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=KFgVBWMkwgY7AGkPezOgWSnfytvIjlPfjdsv95MPHyHD7oiJDRFh/5Nw8flmeQfAobOSbyM+wL7BeoVvvXnW+W3Z7yPNzUj0RNYy208i3HC46nUNfzMqkfnKEQk3BtC+W8qy6dIcQfJmPgCPOoR68IS+S2BnP+LOzdBdPMPSjVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kxQVDB3G; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54G3ExiW020897;
	Fri, 16 May 2025 07:35:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u1JbgsRbFNEarkGxDwy5O4rayeHmdGplE+POraV2bwk=; b=kxQVDB3G8LswSYkc
	sql/AE4/A0m8VL3bA0S+h+tuNk8F85YmrR98aY3xybAABD5dwxpwbMJZ3Wx53Ppc
	veEzwcAuBcXRVarHHYAaLzKmIbzU/QhQwT7qtzfb9QHgfQ04bidUFxGnt9++ar8F
	kmD+WfWzh925JtnHW0qtSbXhExW7Xkkm+aLFyUINOz+Z8+340K+Qgfg6/RLaV8le
	08VXdXKlO6VktppPo1ln66F9Fsm7X15YV8dpy1nxP19H7XoxwpwTG27epTwPXimI
	ugCqXQgJNl0gmpi6Yc8xHBjWR0uh8sRntTQOdjaQOFunLtXSM1a2HxXvesJVHvzw
	jEZ/bQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbew8y1s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 May 2025 07:35:02 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54G7Z1xD029131
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 May 2025 07:35:01 GMT
Received: from [10.253.78.92] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 16 May
 2025 00:34:57 -0700
Message-ID: <db059233-523d-420b-81a7-73b02beef4d1@quicinc.com>
Date: Fri, 16 May 2025 15:34:28 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8550: Add support for camss
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Depeng Shao <quic_depengs@quicinc.com>
References: <20250415-sm8550_camss-v1-1-d4b7daa168ac@quicinc.com>
 <wOxjiEBKO2XU-PikPlT8IMpSGOrP4ocgZEIj_zNhLzzBjySkhGQzupjmJAFhUHcnknLKSASwk33LjBI6WrZ9vg==@protonmail.internalid>
 <1ee8587b-2bf6-418a-9834-8f8cbf1e94d8@oss.qualcomm.com>
 <4e81a1fe-3ee5-4f5f-b958-13e6cf9138f7@linaro.org>
Content-Language: en-US
From: Wenmeng Liu <quic_wenmliu@quicinc.com>
In-Reply-To: <4e81a1fe-3ee5-4f5f-b958-13e6cf9138f7@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: JfCYi8Cyns4Qnjr4tAGPjJ56VDuktMaY
X-Proofpoint-ORIG-GUID: JfCYi8Cyns4Qnjr4tAGPjJ56VDuktMaY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDA3MCBTYWx0ZWRfX0fM2xuQlMEyf
 HXct4P+bLbW/GcumwqRBf3vGFL+32Np/NPFKgvQbJNo6NNzS9r4uoRg+XXVAS1CsV1CNp7GQjNo
 +oqbF8UZXo6OL3e6JEe2i8PPd25BMNtc0C6kuJjlx+JmCnqXM3gCxdrmzCXydEOUSF9OKmdyQbD
 oCkZI78GK5MOA9IBCkuFDzDPNBRo1qxPHv6FtzacGU66T3n6HIoYRJeJ48PS1ajobyB6I0A2Meo
 FmBWfU2VMevXi1BfihspehZVxmcdW3Fk3G24oeDxMsNlQx3nhxBJtAiVlrs/wjalYNobjPqaq1t
 SDD9RTyuN1OpinhuB1CSP2i93dpTy8ErMlVkEj7MlB7gWXfqdsugeUvamzMjwkS+4bHkf6/l0Th
 4OOX9BjRaYYVziaHbLHbTKNx0P0VNIjN/Eloj4OTo0joddQDwmL3rlNJjkKdRpTjERAlZi08
X-Authority-Analysis: v=2.4 cv=LOFmQIW9 c=1 sm=1 tr=0 ts=6826eaa6 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=42mon1cdF7M_iQiDyuAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_03,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=503 impostorscore=0 bulkscore=0
 clxscore=1011 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505160070



On 2025/5/1 9:15, Bryan O'Donoghue wrote:
> On 30/04/2025 12:11, Konrad Dybcio wrote:
>> On 4/15/25 9:38 AM, Wenmeng Liu wrote:
>>> Add support for the camera subsystem on the SM8550 Qualcomm SoC. This
>>> includes bringing up the CSIPHY, CSID, VFE/RDI interfaces.
>>>
>>> SM8550 provides
>>> - 3 x VFE, 3 RDI per VFE
>>> - 2 x VFE Lite, 4 RDI per VFE
>>> - 3 x CSID
>>> - 2 x CSID Lite
>>> - 8 x CSI PHY
>>>
>>> Co-developed-by: Depeng Shao <quic_depengs@quicinc.com>
>>> Signed-off-by: Depeng Shao <quic_depengs@quicinc.com>
>>> Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
>>> ---
>>
>> [...]
>>
>>> +                     <GIC_SPI 604 IRQ_TYPE_EDGE_RISING>,
>>> +                     <GIC_SPI 688 IRQ_TYPE_EDGE_RISING>,
>>
>> It *may* be 689 instead but I'm not 100% sure
>>
>> Otherwise the numbers look good
>>
>> Bryan, Vlad, please also take a look
>>
>> Konrad
>>
> 
> +                     <GIC_SPI 688 IRQ_TYPE_EDGE_RISING>,
> This should be 689 yes
> 
> ---
> bod

Hi Bryan,Konrad,

I confirmed that the value is 688 instead of 689. The documentation 
incorrectly listed it as 689. To CC linux-media, I have resent the patch:
https://lore.kernel.org/linux-arm-msm/20250516072707.388332-1-quic_wenmliu@quicinc.com/

Thanks,
wenmeng

