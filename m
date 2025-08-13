Return-Path: <linux-arm-msm+bounces-69047-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 841DDB254B0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 22:48:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 66921621AA5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 20:47:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6019825EF81;
	Wed, 13 Aug 2025 20:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="h5kEcq1U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD9B1F3B9E;
	Wed, 13 Aug 2025 20:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755118047; cv=none; b=Xc+g4tv5KUD47GA0Be4qelnZ5tttYvcaVZlO3EDAnvFIb2OrsFaIQIKR3mtljEjSZbrvYqD14VbvlXJTLAbS2L/dbed0NX12jDENyUTBThb0N4PFBUYkhIK3fxRES3bzVj4lSFGUmfEnVIzMQDCvmY431CWw6v+249/4z/QCCXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755118047; c=relaxed/simple;
	bh=jJ1cBtJw6JliBhmjT/0AntCbKa+I5hSke8o2xyUE/50=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=bCgbWvnSW3/t/+Cp3p459rA6sZSq2zIdd2vA9nQTpPIyvugF2iGgtcRT7A1CoqcUPf3o7lbJEFBgax+3Qcs3al+IXgp9lm7tL93+Uc//5PS9B0VZr+sVYXxOIwD3BMX2KRRk3J3lvEnDqhQoIpPrLML+CzWmSQcS5PArSm/bojw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=h5kEcq1U; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DBLdnt023971;
	Wed, 13 Aug 2025 20:47:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rs7wtH6LdR98sZjYL4DLDsySGPlJJZ6AL8nA/khRlrY=; b=h5kEcq1U8nitrjFq
	OMVR7wV2agR08vLdkhPSetzySp9t+m6qNhZKp40WkmAVd4CdYv9uevX/Qp4jF2Y5
	nmquXJMyMdu1WADa6deLwXycAqLLbevLCpwUy4cRRxXXwatBRg9V1fMT96+1DrVT
	ltFdtI8pkFJZgQiG8XXGEoBjSKL/9ITmD9hG5eaDJMNYDMMtxvQDgkaa8HCRtvNL
	v7VmCCXkscWMeE85Q7PWuOlmBzj2/0AHjmj86uBWw5Lb8ZX2wqsOnBR3HZtlXAdH
	E1NhlMoHGPa0wcgoZ/McD3XX9qU95lGbeyEphKvu1SnWjQQFNPy8jCZrbOE2WSXS
	JyFbeg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48gr9rsvcq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 20:47:15 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57DKlEE4016361
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 20:47:15 GMT
Received: from [10.216.55.173] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 13 Aug
 2025 13:47:09 -0700
Message-ID: <4e996a17-c996-4194-b57d-128e7d05e8ad@quicinc.com>
Date: Thu, 14 Aug 2025 02:17:04 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1 2/4] arm64: dts: qcom: sm8750: add max-microamp for UFS
 PHY and PLL supplies
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: Manivannan Sadhasivam <mani@kernel.org>,
        Krzysztof Kozlowski
	<krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, <vkoul@kernel.org>,
        <kishon@kernel.org>, <conor+dt@kernel.org>, <bvanassche@acm.org>,
        <andersson@kernel.org>, <neil.armstrong@linaro.org>,
        <konradybcio@kernel.org>, <krzk+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
References: <20250806154340.20122-1-quic_nitirawa@quicinc.com>
 <20250806154340.20122-3-quic_nitirawa@quicinc.com>
 <20250808-calm-boa-of-swiftness-a4a7ce@kuoka>
 <9af71063-0629-4ccc-bc76-3fb588677bf4@oss.qualcomm.com>
 <292907f3-25d6-40d9-be6e-b6b83e646d73@kernel.org>
 <5e32be05-0dbd-4d6f-879d-8ce97fb430ba@quicinc.com>
 <rh3qxu2rijpjswfash3rpmmh6sw47l3b6j5p5upti6zffknasz@cywwm3fypghd>
 <89ab7e51-f82e-465a-aa22-1ccb8e7a0f6d@quicinc.com>
 <ljythvl2yfilcnmgdwt2cyyefxmgl54osll5e76qn7njadhgqq@rwrl3dy6ykt3>
Content-Language: en-US
From: Nitin Rawat <quic_nitirawa@quicinc.com>
In-Reply-To: <ljythvl2yfilcnmgdwt2cyyefxmgl54osll5e76qn7njadhgqq@rwrl3dy6ykt3>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEzMDA5NCBTYWx0ZWRfX+Jpg+HZUGy71
 GdpuCMe5Xd2IgTfp+AF4YryseqNntuG12d02ay4s4cFQUzpxoVdAWF4HLqRPgZuk+IIP3Hr5CiV
 WNsnZVWW25EyUxYIoP0R6fIQQR1L00o1y1TjGWBhC/wZS2QbMAyUF6ebg1HI573NFtGE83n/dZr
 bEboj5MYxe17zEeJd1lPGABMHxMnyfzX/9YtOs7enZ3C3M6AHx2x7BUlUv1Xa8iotCGEfsRoGdt
 xeLghWRiMbzzu2eqWC4/A1jhSBbocvhCTen36U7Tbw95gkOj1kJ42HWqgW12wGLSNb2vbWxDzrl
 QZ2Yj19BXB8sIXOjpn9rybztRTBloJTPuiMbj3aPrcKvOrwlFyOEdw8V4AUjpjrY39Elql6/i7r
 d/FKzllo
X-Authority-Analysis: v=2.4 cv=NIrV+16g c=1 sm=1 tr=0 ts=689cf9d3 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10
 a=MBlCXbtx4y3c8zbCj10A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: X15fmfcYpaZVSSpbYs4CM75upDHndglW
X-Proofpoint-GUID: X15fmfcYpaZVSSpbYs4CM75upDHndglW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_01,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0
 spamscore=0 malwarescore=0 phishscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508130094



On 8/12/2025 4:22 PM, Dmitry Baryshkov wrote:
> On Tue, Aug 12, 2025 at 01:25:02AM +0530, Nitin Rawat wrote:
>>
>>
>> On 8/9/2025 4:37 PM, Manivannan Sadhasivam wrote:
>>> On Fri, Aug 08, 2025 at 08:49:45PM GMT, Nitin Rawat wrote:
>>>>
>>>>
>>>> On 8/8/2025 3:09 PM, Krzysztof Kozlowski wrote:
>>>>> On 08/08/2025 10:58, Konrad Dybcio wrote:
>>>>>> On 8/8/25 9:29 AM, Krzysztof Kozlowski wrote:
>>>>>>> On Wed, Aug 06, 2025 at 09:13:38PM +0530, Nitin Rawat wrote:
>>>>>>>> Add `vdda-phy-max-microamp` and `vdda-pll-max-microamp` properties to
>>>>>>>> the UFS PHY node in the device tree.
>>>>>>>>
>>>>>>>> These properties define the maximum current (in microamps) expected
>>>>>>>> from the PHY and PLL regulators. This allows the PHY driver to
>>>>>>>> configure regulator load accurately and ensure proper regulator
>>>>>>>> mode based on load requirements.
>>>>>>>
>>>>>>> That's not the property of phy, but regulator.
>>>>>>>
>>>>>>> Also reasoning is here incomplete - you just post downstream code. :/
>>>>>>
>>>>>> The reason for this change is good, but perhaps not explained clearly
>>>>>>
>>>>>> All of these values refer to the maximum current draw that needs to be
>>>>>> allocated on a shared voltage supply for this peripheral (because the
>>>>>
>>>>>
>>>>> It sounds very different than how much it can be drawn. How much can be
>>>>> drawn is the property of the regulator. The regulator knows how much
>>>>> current it can support.
>>>>
>>>> Consumers are aware of their dynamic load requirements, which can vary at
>>>> runtime—this awareness is not reciprocal. The power grid is designed based
>>>> on the collective load requirements of all clients sharing the same power
>>>> rail.
>>>>
>>>> Since regulators can operate in multiple modes for power optimization, each
>>>> consumer is expected to vote for its runtime power needs. These votes help
>>>> the regulator framework maintain the regulator in the appropriate mode,
>>>> ensuring stable and efficient operation across all clients.
>>>>
>>>>
>>>> Stability issues can arise if each consumer does not vote for its own load
>>>> requirement.
>>>> For example, consider a scenario where a single regulator is shared by two
>>>> consumers.
>>>>
>>>> If the first client requests low-power mode by voting for zero or a minimal
>>>> load to regulator framework during its driver's LPM sequence, and the second
>>>> client (e.g., UFS PHY) has not voted for its own load requirement through
>>>> the regulator framework, the regulator may transition to low-power mode.
>>>> This can lead to issues for the second client, which expects a higher power
>>>> state to operate correctly.
>>>>
>>>
>>> I think we all agree on consumers setting the load for shared regulators, but
>>> the naming and description of the DT property is what causing confusion here.
>>> There is no way the consumers can set the *max* current draw for a shared
>>> regulator. They can only request load as per their requirement. But the max
>>> current draw is a regulator constraint.
>>
>> To avoid confusion with regulator-level constraints, I'm open to renaming
>> the property vdda-phy-max-microamp to something more descriptive, such as
>> vdda-phy-client-peak-load-microamp or vdda-phy-peak-load-microamp. Along
>> with updating the description, this would better reflect the property's
>> actual intent: to specify the maximum current a client may draw during peak
>> operation, rather than implying it defines the regulator’s maximum
>> capability.
> 
> Move them into the driver please.

Sure Dmitry. I’ll will take care of this in next patchset.

Thanks,
Nitin


> 
>>
>>
>> Having said that, I had a follow-up discussion with the PHY designer to
>> confirm whether this value could vary at the board level. Based on their
>> response, it's a fixed value for the SoC and does not change across
>> different boards(atleast for now). Therefore, I can remove from device tree
>> and replaced with hardcoded, per-compatible data in the driver.
>>
>>>
>>>>
>>>>>
>>>>>
>>>>>> supply's capabilities change depending on the maximum potential load
>>>>>> at any given time, which the regulator driver must be aware of)
>>>>>>
>>>>>> This is a property of a regulator *consumer*, i.e. if we had a chain
>>>>>> of LEDs hanging off of this supply, we'd need to specify NUM_LEDS *
>>>>>> MAX_CURR under the "led chain" device, to make sure that if the
>>>>>> aggregated current requirements go over a certain threshold (which is
>>>>>> unknown to Linux and hidden in RPMh fw), the regulator can be
>>>>>> reconfigured to allow for a higher current draw (likely at some
>>>>>> downgrade to efficiency)
>>>>>
>>>>>
>>>>> The problem is that rationale is downstream. Instead I want to see some
>>>>> reason: e.g. datasheets, spec, type of UFS device (that was the argument
>>>>> in the driver patch discussion).
>>>>
>>>>
>>>> The PHY load requirements for consumers such as UFS, USB, PCIe are defined
>>>> by Qualcomm’s PHY IP and are well-documented in Qualcomm’s datasheets and
>>>> power grid documentation. These values can depending on the process or
>>>> technology node, board design, and even the chip foundry used.
>>>>
>>>> As a result, the load values can differ across SoCs or may be even
>>>> board(unlikely though) due to variations in any of these parameters.
>>>>
>>>
>>> Okay. This goes into the commit message and possibly some part of it to property
>>> description also.
>>
>>
>>
>>
>>>
>>> - Mani
>>>
>>
> 


