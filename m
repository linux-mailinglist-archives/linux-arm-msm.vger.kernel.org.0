Return-Path: <linux-arm-msm+bounces-28515-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B40F1951E57
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 17:16:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4DAA0B22F19
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 15:14:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED16A1B3F11;
	Wed, 14 Aug 2024 15:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Y7JhGhPc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A661AD9D4;
	Wed, 14 Aug 2024 15:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723648463; cv=none; b=Kgl5+uHVJHoJ7bqMcZ+egf/B4iAC2MQewYfOXdZ669zKFqZGb52Uqjsf7rT8adlUeGcvqm3DZtU37JWH1aSuujiXI6l6e/V+wX59Yzgb65ZO4NqAbrcnYP5nN/FVgiTLxOS5z+lRKejrS8ALmM9s99MnpRzk5Z6eBIYfpvp7dto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723648463; c=relaxed/simple;
	bh=/v/ps4Y8cbzJoIBSwxvN5Nge/u0LIt3Un4CN8jfq6uE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=fxSU8qBRrMy54G66Ugi52KiYFzEvE0pbgICkO5iCuM+OBvELz8pevYzY6CNbM6W5SsTNkSOrhWK2z0aAr1pH6/paPoyXc9bwltd4cS7PMxmSHLZskBMl+b9ePZBB3TAL6vNgDgDLrSFhSZH/jipKtDnVy3vIYOruNuzpcvuHO5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Y7JhGhPc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47EAUM2W027646;
	Wed, 14 Aug 2024 15:14:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eVpMWtTM1ORgv9oHD5UJy6luhZg1G8PYkwk3gZbgKls=; b=Y7JhGhPcNWmpe9t5
	VV01sos3y5MYPdXQcGuhv12+smUBH9ZV97IbL04/bE8mBI3sDwVcIQS+TSn+r/EW
	THIj8J7VspLgaQ46vFUL9OY9Z5MGRj/WsMEfitjFF9KwIlh3DyvSU6SjApMzU2Dg
	AL6FcjBjOY6aQHxjkmOp4/MkhrTKotr0NIWLFrJokWlO0d2rLsEogW3PfLx69LCx
	fpvJkeXQQBtYWZM7h7UCx97fSv2ENGtA2AJzejSDD08o3LemNPF6qSM4sznrOT1K
	jlV8G9S2WMYEdbtWnBznLYyMaJthTYx7B2NXfiaArCV7eiaI9X2nhYSodNkUcM43
	3iu5sw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40x3etbhnh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Aug 2024 15:14:09 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47EFE8Er027136
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Aug 2024 15:14:08 GMT
Received: from [10.253.15.254] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 14 Aug
 2024 08:14:03 -0700
Message-ID: <5e84204f-ff47-427c-a077-4e68773ad20e@quicinc.com>
Date: Wed, 14 Aug 2024 23:13:58 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: clock: qcom: Add common PLL clock
 controller for IPQ SoC
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Stephen
 Boyd" <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Konrad Dybcio
	<konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <quic_kkumarcs@quicinc.com>,
        <quic_suruchia@quicinc.com>, <quic_pavir@quicinc.com>,
        <quic_linchen@quicinc.com>, <quic_leiwei@quicinc.com>
References: <20240808-qcom_ipq_cmnpll-v1-0-b0631dcbf785@quicinc.com>
 <20240808-qcom_ipq_cmnpll-v1-1-b0631dcbf785@quicinc.com>
 <81524fee-c32c-405b-b63b-d048dde6ae33@kernel.org>
 <a0fe7735-76fd-4a53-9446-5371e341ba17@quicinc.com>
 <53f25764-41d6-491f-9397-988d3e672189@kernel.org>
Content-Language: en-US
From: Jie Luo <quic_luoj@quicinc.com>
In-Reply-To: <53f25764-41d6-491f-9397-988d3e672189@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 8vwXA-O1Lao4WF03ICb33NZmdBaiB5U7
X-Proofpoint-ORIG-GUID: 8vwXA-O1Lao4WF03ICb33NZmdBaiB5U7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-14_11,2024-08-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 suspectscore=0 impostorscore=0 phishscore=0 clxscore=1015 mlxlogscore=999
 lowpriorityscore=0 priorityscore=1501 spamscore=0 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408140105



On 8/10/2024 7:30 PM, Krzysztof Kozlowski wrote:
> On 09/08/2024 15:01, Jie Luo wrote:
>>>> +  clock-names:
>>>> +    items:
>>>> +      - const: ref
>>>> +      - const: ahb
>>>> +      - const: sys
>>>> +
>>>> +  clock-output-names:
>>>> +    items:
>>>> +      - const: ppe-353mhz
>>>> +      - const: eth0-50mhz
>>>> +      - const: eth1-50mhz
>>>> +      - const: eth2-50mhz
>>>> +      - const: eth-25mhz
>>>
>>> Drop entire property. If the names are fixed, what's the point of having
>>> it in DTS? There is no.
>>
>> We had added the output names here for the reasons below. Can you please
>> let us know your suggestion whether keeping these here is fine?
>>
>> 1.) These output clocks are used as input reference clocks to other
>> consumer blocks. For example, an on-board Ethernet PHY device may be
>> wired to receive a specific clock from the above output clocks as
>> reference clock input, and hence the PHY's DTS node would need to
>> reference a particular index in this output clock array.
>>
>> Without these output clocks being made available in this DTS, the PHY
>> driver in above case would not know the clock specifier to access the
>> handle for the desired input clock.
> 
> That's not true. clock-output-names do not have anything to do with
> clock specifier.
> 
>>
>> 2.) One of the suggestions from the internal code review with Linaro was
>> to name the output clocks specifically based on rate and destination
>> (Ex: 'ppe-353mhz' for fixed rate 353 MHZ output clock connected to
>> Packet Process Engine block), so that the dt-bindings describe the
>> input/output clocks clearly.
> 
> Again, that's unrelated. None of above points address my concern. It's
> like you talk about some entirely different topic. Again:
> clock-output-names have nothing to do with what you want to achieve here.

OK, understand. I will drop this property "clock-output-names" from the
bindings and DTS. These names will instead be defined in the driver. For
the consumer clock device DTS nodes that need to reference these output
clocks, I will export the clock specifiers for these output clocks from
a header file. Hope this approach is fine.

> 
> Best regards,
> Krzysztof
> 


