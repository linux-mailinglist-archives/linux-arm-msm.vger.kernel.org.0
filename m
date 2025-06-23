Return-Path: <linux-arm-msm+bounces-62112-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CCDDAE4C12
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 19:44:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 97C5A3ACDC9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 17:44:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C0C02D3A68;
	Mon, 23 Jun 2025 17:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="A75J2zGu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F52829DB7F;
	Mon, 23 Jun 2025 17:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750700664; cv=none; b=dAYkM65mD86ZxeJcQPM0Jivk70km1CcMmTv+nANj2CQsL1Ih1l3eEZs09bcSwbk6lJ5mtbVAnzQz2yTKin3zEARsLY2BhnVAh57Rrrg4gIzG0hRxxjZhqZ4uu3k3dj9yri0s6slliuNM4ThUb29/IbUySMOcSzZtYeZ5RsmGX58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750700664; c=relaxed/simple;
	bh=buFR86CbEJajgXCGgjs9OpR+12x9UYnUmlkj20EIlKI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=PYyF8Sv8DS/weiCkFd378kGsF3xMyoh9rW9IawEetyO/kJ+HPwuTGFuzHZ3SZamH8M2MnrymckoDwYCFrYR2PbRxPXfGqe7PHu6sXinfeUc68dJIsZTpL7N0rq7fjVhXUdT1q9NwraFboBhRmy5+Lw1GOl6zYj/7HflJfvZAxIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=A75J2zGu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55NDRsAW017023;
	Mon, 23 Jun 2025 17:44:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hJF3Ty1czmm05Sp7DzaIycn/BLZzZuhUo+jJUKr3vbM=; b=A75J2zGuJVT+SOGy
	4VyDI/ATaeCZn49OyxJUwsHdPawxtJldJaUogZ7ffOwXToj17y+7xZQXZJJwHCr/
	iMv/lEefeitFl1sLh1HaSJxoIzZwyvOfLn+DrdIQ4+XBQbDLeJXyy9V99V6HkMG0
	EGlPEKJa8eQfLAGr7RZD/sXTFN4wW5uqpW8MMBTcX8fmxv1WKU6Cr+ArWe244yoh
	PGn9KPn65n5PuK807hVYyNoS1S+2h8Ta5VgDl4jnWUMIlx6IlUCb/6CPMxwZTdY7
	neE5L0gi+zrTYg74ZlySnmElqp2Uhm77SBkT7XqAfdAMuY2PBgiBGOAwrd1hujeZ
	hlBN1w==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f7ttrrgq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Jun 2025 17:44:16 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55NHiFvx031964
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Jun 2025 17:44:15 GMT
Received: from [10.216.15.27] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 23 Jun
 2025 10:44:09 -0700
Message-ID: <3d2e9354-40a5-4908-a6a6-cfc8afd4c702@quicinc.com>
Date: Mon, 23 Jun 2025 23:14:05 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: clock: qcom,sm8450-videocc: Add minItems
 property
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Stephen
 Boyd" <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy
	<vladimir.zapolskiy@linaro.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        "Imran Shaik" <quic_imrashai@quicinc.com>,
        Taniya Das
	<quic_tdas@quicinc.com>,
        "Satya Priya Kakitapalli"
	<quic_skakitap@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "kernel test robot" <lkp@intel.com>
References: <20250618-sm8450-videocc-camcc-bindings-single-pd-fix-v1-0-02e83aeba280@quicinc.com>
 <20250618-sm8450-videocc-camcc-bindings-single-pd-fix-v1-1-02e83aeba280@quicinc.com>
 <4657c6d8-8454-478a-aac3-114c6194b72e@linaro.org>
 <5ed72663-da54-46a4-8f44-1ceda4a7d0d9@quicinc.com>
 <6068badd-8d33-4660-aef8-81de15d9b566@linaro.org>
 <ffe32102-cc55-4f86-b945-ae77a4e163bd@oss.qualcomm.com>
 <aswg6zjmyi4pcx75uzfj5byadkx5gof2yfpjcu7fspbuniatrg@dy52pmcrgnoc>
Content-Language: en-US
From: Jagadeesh Kona <quic_jkona@quicinc.com>
In-Reply-To: <aswg6zjmyi4pcx75uzfj5byadkx5gof2yfpjcu7fspbuniatrg@dy52pmcrgnoc>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=QINoRhLL c=1 sm=1 tr=0 ts=68599270 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10
 a=OLmTynEB7P0R7dDm6R4A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 51Nswkb2jdWpOy211cosqsGxp41t7AdK
X-Proofpoint-GUID: 51Nswkb2jdWpOy211cosqsGxp41t7AdK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDEwOSBTYWx0ZWRfX/l1mE2PqlSIy
 U1ftgDj+n/lLjJsNRkz5hSPAEXMaSVRqN5UNc2tCKAKEERdMuHKDt7AC4RarQk8C8hXJLhpgq/o
 mQqbQk3aOZHXOySl5z4mANAhmB5NKySuIL0cCk8cSXRYR5ULNb0bdKA6Cc6X8o3IkoJylThLKZl
 24qwyUEJK3y7v2n3rDHATj1g+/bTfK6I5vaoAziQCHbmm4T/dqi3h1e7/fGpBSkwjHO8xO8jmMd
 YFUuDlnZxR8ZdLE6KtmbpVsn0uS+LdOV8ZXyHLZ7jRGuIPHHEZ6jY3YRsOuU+dROuBlDkH/sZlT
 0nTyEENazdxTB21z6nKAMAyr7KH7qeOcLsBABTn2kwJEBrPJVz8ejgXXPsKk6BpbVVYOLE4n7R9
 TvLlM8UieLG3fGGO2RGe1bk9CT6EsYMe+tjOxJAcyCN8x8Bz/CPgy4xnFxN6R3pYqjT5LpgJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-23_05,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0 mlxscore=0
 clxscore=1015 mlxlogscore=999 bulkscore=0 suspectscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506230109



On 6/21/2025 3:04 AM, Dmitry Baryshkov wrote:
> On Fri, Jun 20, 2025 at 07:39:06PM +0200, Konrad Dybcio wrote:
>> On 6/20/25 7:56 AM, Krzysztof Kozlowski wrote:
>>> On 19/06/2025 12:20, Jagadeesh Kona wrote:
>>>>
>>>>
>>>> On 6/18/2025 11:56 AM, Krzysztof Kozlowski wrote:
>>>>> On 17/06/2025 21:07, Jagadeesh Kona wrote:
>>>>>> Add minItems as 1 for power-domains and required-opps properties
>>>>>> to allow this binding to be compatible with both single and multiple
>>>>>> power domains.
>>>>>
>>>>> This is your hardware, so you know how it works thus I expect here
>>>>> arguments why this is correct from the hardware point of view. Without
>>>>> this, it is impossible to judge whether this is a correct change.
>>>>>
>>>>> If I overlook this now, it will be used in discussions by other qcom
>>>>> engineers, so unfortunately you see, you need to prepare perfect commits
>>>>> now...
>>>>>
>>>>
>>>> These clk controllers mainly require MMCX power domain to be enabled to access
>>>> the clock registers. But to configure the cam & video PLLs in probe, an additional
>>>> MXC power domain also needs to be enabled.
>>>
>>>
>>> Then your patch is not correct. Anyway, you should explain the hardware
>>> in commit msg, why this domain is optional in the hardware.
>>>
>>>>
>>>> Since the initial DTS changes only added MMCX power domain, this change is required
>>>> to be backward compatible with older DTS and avoid ABI breakage as discussed in below
>>>> thread.
>>>
>>>
>>> So you send incorrect hardware description allowing something which will
>>> not work? Or how exactly?
>>

The initial videocc with single power domain works fine, but in that case the
PLL's work with default sub-optimal configuration settings and below PLL
warning during bootup was reported during video iris testing. 

[    3.327753] Lucid PLL latch failed. Output may be unstable!

The multi PD support helps to fix the above warning.  


>> So I think there's a mistake in understanding the backwards compatibility
>> paradigm here.
>>
>> There exists a single, objectively correct and represented in hardware,
>> list of required power-domains and the commit that caused the schema
>> validation errors was essentially "align YAML with reality" which should
>> be coupled with an immediate DT update to match and we forget about the
>> incomplete past
> 
> I'd second that. Let's make sure that the _driver_ works with old DT.
> But we don't have to support old DT in schema.
> 

Yes, The driver code is already backward compatible with the older DT.

Thanks,
Jagadeesh

