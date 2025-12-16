Return-Path: <linux-arm-msm+bounces-85347-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 98712CC46A5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 17:49:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 18EBC30EE11D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 16:43:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B197389F62;
	Tue, 16 Dec 2025 12:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="iTAMUgB2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56364389F47;
	Tue, 16 Dec 2025 12:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765888912; cv=none; b=XZKRJnBtllgZS+nosXeRidvAd2hL4/DE+mP6FlV6YCwAHCSmEWR0vaZXVtRVtIKTLlTvvyYYxYzWa3J7tUMOu/Qbhiw8BTtfSFK13P0GBiCm5CYuymvm5MpSkQ+RIhzjSConJk8PTsMzvR8ODMvRbVX9nBI69eKinAI4EADR8Eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765888912; c=relaxed/simple;
	bh=igrJz5IinChEf0Wu0wHbZqglxEYnsfwu7dVCfo/cw+8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=O8pM6M1Ot7pS6gFbLuIJtZStDPs4/jrT8QJ8/lgiIuLqoRRca3gqcK54JfwwXxoI1wMSDncM3EeUa3lAl3oZ5//la9AChjTwPAWjh5Omf1EMbuHoHQQc4kM+04G2j/sR7sLB/BSGv851trPgYIo8BOuMQYderq1rPvsTteZi/gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=iTAMUgB2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BG8JWcU2573384;
	Tue, 16 Dec 2025 12:41:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0FTGuXM3b9FxQwSObO8nfqIcI9r4fRozBYs52eN1tbI=; b=iTAMUgB2kPMXvM4o
	zUgYfEdZHtqD4q4RxYT9bz7XArGGrZoiOFt9k7flAHe6TXhscbDQ9uiKdVvfyONc
	Zy53QnADPXtoAFV382hXxhoyc66ssjsCCadJn2YKbeP70Dd7jOrDasSTAf6tsg4E
	hjqbBg0dK6LEkIC7AKKe74LeCnlZgxHnOM1qiaxkj6jphnxPm4UNhyycpkH4upFo
	U7i5VK+/s2Iak6s71JLilcftqbo1AD9C65OO66WuwT2mN69FtwpDbAUoE4oYArSS
	5jg/oStWcfxSfNY96Rci5xvfWVnt4bqBYV3nf+6OVvnuomXjVWCDPUKrH6KjOxqz
	UjDMHg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b33ths2ta-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Dec 2025 12:41:45 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5BGCfie7012514
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Dec 2025 12:41:44 GMT
Received: from [10.217.216.18] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 16 Dec
 2025 04:41:37 -0800
Message-ID: <b98eb114-6967-4ac4-8b4d-936966a58171@quicinc.com>
Date: Tue, 16 Dec 2025 18:11:32 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/5] arm64: dts: qcom: Add sdhc dll-presets
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Ulf Hansson
	<ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Adrian Hunter
	<adrian.hunter@intel.com>
CC: <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <dmitry.baryshkov@oss.qualcomm.com>, <quic_pragalla@quicinc.com>,
        <quic_sayalil@quicinc.com>, <quic_nitirawa@quicinc.com>,
        <quic_bhaskarv@quicinc.com>, <kernel@oss.qualcomm.com>
References: <20251215120009.3877889-1-quic_rampraka@quicinc.com>
 <20251215120009.3877889-3-quic_rampraka@quicinc.com>
 <0f7c0d5c-7f77-4669-9648-62d008f15b1c@kernel.org>
 <9f5fcce3-b9c0-4aae-b4e0-10475eb5ec9e@kernel.org>
Content-Language: en-US
From: Ram Prakash Gupta <quic_rampraka@quicinc.com>
In-Reply-To: <9f5fcce3-b9c0-4aae-b4e0-10475eb5ec9e@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=ZIPaWH7b c=1 sm=1 tr=0 ts=69415389 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=uJt1xlEP9UPP1VlBNB4A:9 a=QEXdDO2ut3YA:10 a=i6qsmYmKKdoA:10
 a=csto0wWSG80A:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: yyXCEZaQFimc34Z3ujFBiZdvSLQhaT16
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDEwNiBTYWx0ZWRfX2W5aRin6k0T/
 7IkLVpV9Ts9v7/1bPWsJFR1c10WCAzizp5RaQGR+xVaRzx0dr9TAQFtYmbz4s76e+e1HhvBO1vq
 H/E1FLiaG/2cuwKiw6hmVz9Ooqds/uxxcIotFApYOE5I319D4mYyEb+Ip/s9CbG+J2aFibaGWKm
 8HkWo9ACVCF2ooWXXxl5HsgvftY6orv3zZY6Hpm56EWeW5wPw6JQAaPVNTm72+BzZUrkwG7jaD/
 KVTptmeaCwHHEE8B/apP90NuabO6KrKfspPwOw9eELaphq9t8fzsWfPbjj/Qll15rbYUhQdnoPu
 uivBEFkWPjurujMqhBDMi8vRDw98lVfDB0BgQNBdoVMhml7nZV6PGRt0DwwHbGhCjO8tIrz5odZ
 6TDUjjmFz4MN5OFqOHVpr1wUEa2WMw==
X-Proofpoint-ORIG-GUID: yyXCEZaQFimc34Z3ujFBiZdvSLQhaT16
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_02,2025-12-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 priorityscore=1501 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512160106


On 12/15/2025 5:37 PM, Krzysztof Kozlowski wrote:
> On 15/12/2025 13:05, Krzysztof Kozlowski wrote:
>> On 15/12/2025 13:00, Ram Prakash Gupta wrote:
>>> Add sdhc dll-presets for qdu1000 target.
>>>
>>> Signed-off-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/qdu1000.dtsi | 4 ++--
>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>> Please use subject prefixes matching the subsystem. You can get them for
>> example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
>> your patch is touching. For bindings, the preferred subjects are
>> explained here:
>> https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters

sure I missed to add qdu1000:, will add in subject.

>>> diff --git a/arch/arm64/boot/dts/qcom/qdu1000.dtsi b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
>>> index 846e5e5899aa..bc31504d5c8c 100644
>>> --- a/arch/arm64/boot/dts/qcom/qdu1000.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
>>> @@ -912,8 +912,8 @@ sdhc: mmc@8804000 {
>>>  
>>>  			bus-width = <8>;
>>>  
>>> -			qcom,dll-config = <0x0007642c>;
>>> -			qcom,ddr-config = <0x80040868>;
>>> +			qcom,dll-presets = <0x000F64EC 0x0 0x01	0x2C010800 0x80040868>,
>>> +					   <0x0007642C 0x0 0x10 0x2C010800 0x80040868>;
>>
>> That's non-bisectable. You just broke the users of this DTS. Also, case
>> change is not explained and your binding said nothing about deprecating
>> other properties.

right I will update the sequence of dt as last change in the series.

I couldn't get "case change is not explained" but I guess ask is for
explanation why is this change needed. As the soc is using artanis
dll, it needs to have 3 more register values as presets. So in total
2 arrays, for HS400 and HS200, are passed each having 5 elements,
DLL_CONFIG, DLL_CONFIG_2, DLL_CONFIG_3, DLL_USER_CTRL & DDR_CONFIG.
Without these sampling of data would not be optimal and might lead
to CRC errors.

The existing qcom,dll-config or qcom-ddr-config are not deprecated,
as upcoming soc could still be non-artanis and only dll-config and
ddr-config might be needed. But since it was added earlier in qdu1000,
removing it now as the code change is pushed into driver to support
dll-presets.

with QDU1000 there were instance of CRC errors and to fix dll-presets
is used instead of qcom,dll-config & qcom,ddr-config.

I will update the binding as well with more details.

>
> Also, your binding said 10 items, not two.
>
>
> Best regards,
> Krzysztof

Sorry I mistook the elements of array with Items. Will update in binding
to 2 items.


