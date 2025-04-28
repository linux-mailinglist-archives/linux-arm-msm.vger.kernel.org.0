Return-Path: <linux-arm-msm+bounces-55912-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1747BA9EF83
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 13:42:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E4E1C17FD99
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 11:41:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81F08264FAF;
	Mon, 28 Apr 2025 11:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="EO31SXQJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0B3263F4E;
	Mon, 28 Apr 2025 11:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745840429; cv=none; b=gvKVB0Jy7FafRMIbzzJfR6NNa6p6yrbrX9ADA2S+cwYSL8yDcH5jnXYTBQ5Q/hgC1u6MMxSZ7DxE0C8I0OoBGX9I9R2nx4z/4cIW998qXiAeYZwoM7nMJeE4jUHCYFUK3hyb8BVmMJj4C05LnA04Ov9bduqHezuefI/md61aTwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745840429; c=relaxed/simple;
	bh=Yr0OVRKVLcR4kLqw7USdLKGcxixB6myn2j81M3mgoCk=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=ItIXCqtmLHm5XrQLkj9AKtdNhED22dlI4h31gR5J4gcxtBm8gBEV6pQUzBtkWUbQmYSPaofKue8sb8srQ1/UUr8C/jYQiPTcE3P8VTXDzy3gbJK1lTaxRfU3Sf3Qh+i04dQjCXdkSM+7diFbT/FLT1US7nXGMWwsYHhe60pu+Wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=EO31SXQJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SABAQj005953;
	Mon, 28 Apr 2025 11:40:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SnYLMW7hNTuN+uxvXlj0duCk+F+WxlQuRFFtaHZfAIg=; b=EO31SXQJM3+gv2nz
	RWcyhJbFaNLKyQT+Rg6emmInxaTMSx4jN5j8IVerpVMkyBYThmeFmUUcs148YfL6
	Loc9M47Sm8nhjx+v3A2j8P4+2PnRKhABGw30zbqmE6HgVEDmyxqiMTnB4ATwiKAr
	d8ZrVze5yBIIWXzLj22bh9cc2fUOdSeDTYhRa7V3EUGavHkNMRMfYDTknh4Zelc1
	huZZBUhtdY98dCmRdaRglMWfaqHx8PL0je1PG/yNy8z+fWeP8vqlT8U78h6eBGXL
	FatJoMpcATDGSxsobfTazIX5kGxx9ZbsYUf3PDPe7hoVpPKAZ/VZO4zbcCjMYJ9l
	DXAOeg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468muqh6fm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 11:40:15 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53SBeE0h024302
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 11:40:14 GMT
Received: from [10.239.133.49] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 28 Apr
 2025 04:40:10 -0700
Message-ID: <774ba18b-3319-4d20-854b-cc21b48ce3f6@quicinc.com>
Date: Mon, 28 Apr 2025 19:40:08 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] dt-bindings: arm: Add Qualcomm extended CTI
From: Jinlong Mao <quic_jinlmao@quicinc.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Suzuki K Poulose
	<suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>, James Clark
	<james.clark@arm.com>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn
 Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>
References: <20240903121847.6964-1-quic_jinlmao@quicinc.com>
 <20240903121847.6964-2-quic_jinlmao@quicinc.com>
 <8d203417-e3da-4969-87ea-f77cdb720756@kernel.org>
 <04d46109-d499-4e91-88aa-4187145b811d@quicinc.com>
 <cbb1191d-4e90-4887-9227-e4e8761a9b46@kernel.org>
 <b313ab73-850e-4d75-ae19-797a8c6a16f2@quicinc.com>
Content-Language: en-US
In-Reply-To: <b313ab73-850e-4d75-ae19-797a8c6a16f2@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDA5NiBTYWx0ZWRfXyAoJwu1Hy6T8 esh7wK5DFBtawOa4sAyEcv6hjxXB0x/rnLOzvHLBjdDy0+6BeS56YQ4LsLe3FNltmddsxIJT1Vm lmATnlG3b371tZfjdUY3AxPZSVk8DIA/tFusJhg9O0g4zotvKbcYxGK9UbnxtoeMe6dhS4iu15/
 hfMXOVaoPGEg+l1igqcIzLomRsA/4blmrDmetAjjLABfOvAsbGxZK5vs3fyPrvXb+k+KCBLcMxh R1Rs9noJlsdpsPI60Z7VFRJ/aQ0Io2KZJuP5zoYjuhEHNKc4dMbHNFqHiHtW9BB2RUMp9LX0su6 igmdIlsSfYXp4rPCHtZdcIBOJW4QZnxmTXpU27AThS/yL/ZdDYc1K6gi7yLXABKy1wD4XnYJDLA
 iL/MU3+1Y/U5cnGvled5Ii2FHmBbGK1xCOjFdf+ekAtemFrvBuQcM2sAmttbgjNpolND0qbS
X-Proofpoint-GUID: 5iWqGjB5BUTYX3FdkWHbfDIhzJwcoEA3
X-Proofpoint-ORIG-GUID: 5iWqGjB5BUTYX3FdkWHbfDIhzJwcoEA3
X-Authority-Analysis: v=2.4 cv=M/5NKzws c=1 sm=1 tr=0 ts=680f691f cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=68lWJni6-NFX7yfVmSUA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxscore=0 spamscore=0 malwarescore=0 mlxlogscore=999
 adultscore=0 bulkscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280096



On 2025/4/28 16:09, Jinlong Mao wrote:
> 
> 
> On 2025/4/28 15:39, Krzysztof Kozlowski wrote:
>> On 28/04/2025 09:31, Jinlong Mao wrote:
>>>
>>>
>>> On 2024/9/3 20:42, Krzysztof Kozlowski wrote:
>>>> On 03/09/2024 14:18, Mao Jinlong wrote:
>>>>> Add Qualcomm extended CTI support in CTI binding file. Qualcomm
>>>>> extended CTI supports up to 128 triggers.
>>>>>
>>>>> Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
>>>>> ---
>>>>>    .../devicetree/bindings/arm/arm,coresight-cti.yaml | 14 ++++++++ 
>>>>> ++++++
>>>>>    1 file changed, 14 insertions(+)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/arm/arm,coresight- 
>>>>> cti.yaml b/Documentation/devicetree/bindings/arm/arm,coresight- 
>>>>> cti.yaml
>>>>> index 6a73eaa66a42..141efba7c697 100644
>>>>> --- a/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
>>>>> +++ b/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
>>>>> @@ -87,6 +87,10 @@ properties:
>>>>>              - const: arm,coresight-cti-v8-arch
>>>>>              - const: arm,coresight-cti
>>>>>              - const: arm,primecell
>>>>> +      - items:
>>>>> +          - const: qcom,coresight-cti-extended
>>>>
>>>> That's just enum in previous entry/list.
>>> Sorry for the late response. This is a new CTI type. Need the three
>>> items in compatible at the same time, just like other kind of CTIs.
>>
>>
>> Comment stays valid, you did not address it at all.
> Hi Krzysztof,
> 
> Do you mean we only need const: qcom,coresight-cti-extended here ?
> No need const: arm,coresight-cti and const: arm,primecell as they are
> in previous entry/list, right ?
> 

Hi Krzysztof,

Do you mean make changes like this ?
       - items:
           - enum:
             - arm,coresight-cti-v8-arch
             - qcom,coresight-cti-extended
           - const: arm,coresight-cti
           - const: arm,primecell


Thanks
Jinlong Mao

>>
>>>
>>>>
>>>>> +          - const: arm,coresight-cti
>>>>> +          - const: arm,primecell
>>>>>      reg:
>>>>>        maxItems: 1
>>>>> @@ -254,6 +258,16 @@ examples:
>>>>>          clocks = <&soc_smc50mhz>;
>>>>>          clock-names = "apb_pclk";
>>>>>        };
>>>>> +  # minimum extended CTI definition.
>>>>> +  - |
>>>>
>>>> No need for new example. No differences here.
>>> This is a new type CTI.
>>
>>
>> Comment stays valid, you did not address it at all.
>>
>> Best regards,
>> Krzysztof
> 
> _______________________________________________
> CoreSight mailing list -- coresight@lists.linaro.org
> To unsubscribe send an email to coresight-leave@lists.linaro.org


