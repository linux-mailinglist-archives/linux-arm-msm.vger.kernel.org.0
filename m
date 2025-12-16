Return-Path: <linux-arm-msm+bounces-85352-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B65B1CC3504
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 14:45:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8211030D8466
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 13:39:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FBB335580B;
	Tue, 16 Dec 2025 12:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="eLAiQ/ms"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D53793557EE;
	Tue, 16 Dec 2025 12:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765889480; cv=none; b=nypk1jCxL2g4Wts688K7hwT72R2Eqa7Kjgm46wEy+tnNroR3kMHexhzsPfnTsIbg9IMFfzzxySMYY86qNGm3d6dwInmdemr8ngOlHUGd2+uEW0/koWRVQgk89GN6ww41eqAZw2KikMh4LCYtWwNIujEr5iqbiLIpx97d6kCO+XU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765889480; c=relaxed/simple;
	bh=w20aSyMI8PJtafB/H7NdphB3pXroCMHxh3M4bbSfwlU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=s8bUL/o9efoAIgc/ZqYUEv3MpW2OWjNS57XtVDnU4C+aXw0EDXUulUe9uQnImeOZAN210X2nvRbfyM0mAKymkUhD7Rsds65cmCxM3gJSvRzOihy99OfTm70RLsHw1YVMsZyJbbx61dWJv8WcTikLWolIjJwqqrNesmmduIuX0fQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=eLAiQ/ms; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BGC7IGt3708638;
	Tue, 16 Dec 2025 12:51:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dxk5RC9Q9tFvzZbYUFy8PiPH+tcTYf2iKQcvjtGt9m0=; b=eLAiQ/ms0+5ah/XR
	jWIC2vCroaFiopgE1X67sNBVaqLLpQU6AL2A+l8DWMK9FPjqTC3ZfD4QOh+FI8Ne
	yRema28DqAZF0imrVY8omO3KKSGde2XKbaI8XllecRPr3hzS0iQ2rWtbeRhcCUbY
	c2Sz2faPpnheab3y1CB8pDeYJrzxrZDrLCi6tXJwVyHBmhv9MUlY1qgVcknLO5Wv
	bNyPWryHBDyLXh7ENtclYg3Jsqoc5kZg9dHLOeI3RMLctTX/IHSkxk8Fh5+ba2PY
	BySA8Flo1GKo4CyZABVRU4z5q9RcF2NPn/hMl0pJFDWvJqJavG/wSdmKdsexB2G7
	9jdrLw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b375b05e0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Dec 2025 12:51:14 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5BGCpDwI018533
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Dec 2025 12:51:13 GMT
Received: from [10.217.216.18] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 16 Dec
 2025 04:51:09 -0800
Message-ID: <00485066-d537-4f8f-a579-efa33e69a56f@quicinc.com>
Date: Tue, 16 Dec 2025 18:21:05 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/5] dt-bindings: mmc: Add dll-presets values for HS400
 and HS200 modes
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
        <dmitry.baryshkov@oss.qualcomm.com>
References: <20251215120009.3877889-1-quic_rampraka@quicinc.com>
 <20251215120009.3877889-2-quic_rampraka@quicinc.com>
 <03819cd6-9f19-4c28-806b-17c7596e5299@kernel.org>
 <1fc9ac39-231b-4fce-a354-22a21d126363@kernel.org>
Content-Language: en-US
From: Ram Prakash Gupta <quic_rampraka@quicinc.com>
In-Reply-To: <1fc9ac39-231b-4fce-a354-22a21d126363@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDEwOSBTYWx0ZWRfX3ocbL7CNeEPJ
 /JaqJCYcJKeBVKb99vRN6ZFctxa1K0Umphiracse5cJkETfJ7guy3feTDBjBnnFK5Y6K+atIinn
 sWe1Y+XOkSuAON+v9mtGr3VImoxpZuNJmKvpEXNYMGTgALYrXfPIIW7DRod7aXF4zLb4Pe4/lqs
 if5XeWQY4tC++5Z/QK+XQDsQr7GGFmIdkUi4gTpEX4go0d+3cBAV6GT4b42ZWOCUkfJRUq6ROcK
 7z1vkbYgHEZbl9i48E6P3KTnNVnhBwZu+rWe6Vq0rygXhdyg7UmUDxzuLktdqH/ZKyK3/aohPUU
 62afrMYwVTqzn/0ABF4hH6nbL2iETEprGM7c2PWS+bh0WQ2A5iJQ0IBMxSbUvwdG8GlqoTkt1yl
 +E14WrgNp2nsaoQq9uTwLk7cePS5Og==
X-Proofpoint-GUID: SoWcdD4mUz5blGdT3DsbVLaNa5wF2sdX
X-Proofpoint-ORIG-GUID: SoWcdD4mUz5blGdT3DsbVLaNa5wF2sdX
X-Authority-Analysis: v=2.4 cv=T9qBjvKQ c=1 sm=1 tr=0 ts=694155c2 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=llHt_Jtit41v_MIMWOYA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_02,2025-12-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0
 adultscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512160109


On 12/15/2025 5:41 PM, Krzysztof Kozlowski wrote:
> On 15/12/2025 13:06, Krzysztof Kozlowski wrote:
>> On 15/12/2025 13:00, Ram Prakash Gupta wrote:
>>> From: Sachin Gupta <quic_sachgupt@quicinc.com>
>>>
>>> Document the 'dll-presets' property for MMC device tree bindings.
>>> The 'dll-presets' property defines the DLL configurations for HS400
>>> and HS200 modes.
>>>
>>> QC SoCs can have 0 to 4 SDHCI instances, and each one may need
>>> different tuning.
>>>
>>> Signed-off-by: Sachin Gupta <quic_sachgupt@quicinc.com>
>>> Signed-off-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
>>> ---
>>>  Documentation/devicetree/bindings/mmc/sdhci-msm.yaml | 5 +++++
>>>  1 file changed, 5 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
>>> index 938be8228d66..a1a16e6e12ce 100644
>>> --- a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
>>> +++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
>>> @@ -140,6 +140,11 @@ properties:
>>>      $ref: /schemas/types.yaml#/definitions/uint32
>>>      description: platform specific settings for DLL_CONFIG reg.
>>>  
>>> +  qcom,dll-presets:
>>> +    maxItems: 10
>>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>>> +    description: platform specific settings for DLL registers.
>>
>> So look at your DTS - this is clearly incomplete now. So obvious. I
>> don't understand why you were hiding the DTS change, you just make
>> review more difficult.
>>
>> Anyway, your DTS says you replace some other DLL properties and nothing
>> in the binding or commit msg explains that. Neither the reason nor the
>> impact.

Sorry dt change was not pushed earlier, will add dt change as well
going forward.

The existing qcom,dll-config or qcom-ddr-config are not deprecated,
but certainly I will add below in commit regarding the issue as well
which is observed without this change as below:

"Document the 'dll-presets' property for MMC device tree bindings.
The 'dll-presets' property defines the DLL configurations for HS400
and HS200 modes.

It have 2 arrays of 5 elements each for HS400 and HS200 mode.
The 5 elements are DLL_CONFIG, DLL_CONFIG_2,DLL_CONFIG_3, DLL_USER_CTRL
and DDR_CONFIG.

dll-presets fixes instances of CRC error observed with targets having
artanis dll.

QC SoCs can have 0 to 4 SDHCI instances, and each one may need
different tuning using dll-presets."

> Plus it looks like you are adding some meaning to the entries, judging
> by the DTS. DTS suggested something here is e.g. DLL_CONFIG, so that
> meaning - including different modes - needs description in the schema in
> items.
>
> Best regards,
> Krzysztof

I will update the schema description as well with the 2 modes and 5 elements
of it and will update the MaxItems to 2.

Thanks,
Ram


