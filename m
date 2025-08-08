Return-Path: <linux-arm-msm+bounces-68130-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6B0B1EB91
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Aug 2025 17:21:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ACCFF1898BC3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Aug 2025 15:20:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9090C2836AF;
	Fri,  8 Aug 2025 15:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="d5pTy9tC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F3E4283C87;
	Fri,  8 Aug 2025 15:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754666417; cv=none; b=AK+hTAER3s5hyUqBgqnr/+8k7kem5QvS8FgG7KMizEdDoCw3c8VHQugWGPGPwoQE5oWXy0BMWRzQ4Tg6FV6yRkU9mQ7btSg1Au2zVQwXUVfRYdbwH8VMzjsTI7t54xxcHMxXwhVGV8vZWhXDLjWkJb+/gbfKmGXPtUTlB6U8boY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754666417; c=relaxed/simple;
	bh=bz4INqk5MS19bwx/1q9o5BeO8oO9JV4/LsKmtt5ip24=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=nP+guWDSM5yTHauBweKog++ArK5E7YXH1Bs2CztfllHns4UIxnUwqNchSkZXKFOYReD1wCM/omWeQR69Khgf5XvaSa9CdG3UhCgsF9ubd4rM65I9ENYPB6EC1S26vOALk7pETpudO7HeFopjfIkYeWT257n9wis52k2kr1vBktk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=d5pTy9tC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 578F5NKf000995;
	Fri, 8 Aug 2025 15:20:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H+21hjpa8XJ6XRd6SoHfWWI7noNUkNVcdDwUeOUPVmo=; b=d5pTy9tCVXZOwHWY
	SJwANfzhsGw3MowAgZIpVLwGfGVWlNLP1Mf2BrpcFVNZQGBn+y9o+Wz2ZcqWzLDB
	7weNpMZac7PgFYuheU9WfbDW0uDzfZAbCrfxRDalgGlD53x2uxV8wbyXkG0c2Kjo
	bAZjkS+lfFm690bRJsV4RwLE/5l2910tA0DBo/VC4yp0pEkhRLe/kuwQkiJ/wHDJ
	H/8OePvTA6bjYrB049yozUYZiloFhzFTygqAQh+9KVx4dpk/Chd4XagE9hpwuHjK
	0QallPYYw/iesthsjjTXqkE6DWflT+knGtHO2cVz3VnFoJBAWhtAGgv2A2EUlu4i
	DAYljw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpw3ac7y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Aug 2025 15:20:04 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 578FK2Sx026396
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 8 Aug 2025 15:20:02 GMT
Received: from [10.216.30.51] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 8 Aug
 2025 08:19:55 -0700
Message-ID: <5e32be05-0dbd-4d6f-879d-8ce97fb430ba@quicinc.com>
Date: Fri, 8 Aug 2025 20:49:45 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1 2/4] arm64: dts: qcom: sm8750: add max-microamp for UFS
 PHY and PLL supplies
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>
CC: <vkoul@kernel.org>, <kishon@kernel.org>, <mani@kernel.org>,
        <conor+dt@kernel.org>, <bvanassche@acm.org>, <andersson@kernel.org>,
        <neil.armstrong@linaro.org>, <dmitry.baryshkov@oss.qualcomm.com>,
        <konradybcio@kernel.org>, <krzk+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
References: <20250806154340.20122-1-quic_nitirawa@quicinc.com>
 <20250806154340.20122-3-quic_nitirawa@quicinc.com>
 <20250808-calm-boa-of-swiftness-a4a7ce@kuoka>
 <9af71063-0629-4ccc-bc76-3fb588677bf4@oss.qualcomm.com>
 <292907f3-25d6-40d9-be6e-b6b83e646d73@kernel.org>
Content-Language: en-US
From: Nitin Rawat <quic_nitirawa@quicinc.com>
In-Reply-To: <292907f3-25d6-40d9-be6e-b6b83e646d73@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOCBTYWx0ZWRfX78XoknspEosh
 3OXl0pK59Pa75jpfRdrwTq7trc7HCBDexXL4ZIsyp1LdiYmJbw4jKndVDQJz7SpZ5gLsjoeBUFM
 Hi6pkPDFQYy7JueFxwvOOoi/BJKVHmbA/qct4sytFFInvj5w3cJceCV+k0IPVqknyRLaKJIVDfQ
 6XsJEuE4kxfb8hD07+KyJvll6lNtro1lnNo+bRuwnKArUe63j6mh9s+xjenbutWnbEB7fU0RZWn
 xR39RmRE6dhtzHCwjq1d9ibh3MeRR1mYJ/fqGuFG4/BV4kmnsN1YxUuLqPgTdlg3blLnPomMVA9
 5tCQWFaC4AQDe8u7sB6dINeXq9t35d/S/vLRZF1WwEEabxDKhHSrCP/R84MY13cuprq8inB+gwZ
 eXUeCHX0
X-Authority-Analysis: v=2.4 cv=J8Cq7BnS c=1 sm=1 tr=0 ts=689615a4 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10
 a=x0E13wpUDKbC8JPA_PIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: ByLAag_KUVeJdsX6CF77K1wWPjNQXd1S
X-Proofpoint-ORIG-GUID: ByLAag_KUVeJdsX6CF77K1wWPjNQXd1S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-08_04,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508060008



On 8/8/2025 3:09 PM, Krzysztof Kozlowski wrote:
> On 08/08/2025 10:58, Konrad Dybcio wrote:
>> On 8/8/25 9:29 AM, Krzysztof Kozlowski wrote:
>>> On Wed, Aug 06, 2025 at 09:13:38PM +0530, Nitin Rawat wrote:
>>>> Add `vdda-phy-max-microamp` and `vdda-pll-max-microamp` properties to
>>>> the UFS PHY node in the device tree.
>>>>
>>>> These properties define the maximum current (in microamps) expected
>>>> from the PHY and PLL regulators. This allows the PHY driver to
>>>> configure regulator load accurately and ensure proper regulator
>>>> mode based on load requirements.
>>>
>>> That's not the property of phy, but regulator.
>>>
>>> Also reasoning is here incomplete - you just post downstream code. :/
>>
>> The reason for this change is good, but perhaps not explained clearly
>>
>> All of these values refer to the maximum current draw that needs to be
>> allocated on a shared voltage supply for this peripheral (because the
> 
> 
> It sounds very different than how much it can be drawn. How much can be
> drawn is the property of the regulator. The regulator knows how much
> current it can support.

Consumers are aware of their dynamic load requirements, which can vary 
at runtime—this awareness is not reciprocal. The power grid is designed 
based on the collective load requirements of all clients sharing the 
same power rail.

Since regulators can operate in multiple modes for power optimization, 
each consumer is expected to vote for its runtime power needs. These 
votes help the regulator framework maintain the regulator in the 
appropriate mode, ensuring stable and efficient operation across all 
clients.


Stability issues can arise if each consumer does not vote for its own 
load requirement.
For example, consider a scenario where a single regulator is shared by 
two consumers.

If the first client requests low-power mode by voting for zero or a 
minimal load to regulator framework during its driver's LPM sequence, 
and the second client (e.g., UFS PHY) has not voted for its own load 
requirement through the regulator framework, the regulator may 
transition to low-power mode. This can lead to issues for the second 
client, which expects a higher power state to operate correctly.


> 
> 
>> supply's capabilities change depending on the maximum potential load
>> at any given time, which the regulator driver must be aware of)
>>
>> This is a property of a regulator *consumer*, i.e. if we had a chain
>> of LEDs hanging off of this supply, we'd need to specify NUM_LEDS *
>> MAX_CURR under the "led chain" device, to make sure that if the
>> aggregated current requirements go over a certain threshold (which is
>> unknown to Linux and hidden in RPMh fw), the regulator can be
>> reconfigured to allow for a higher current draw (likely at some
>> downgrade to efficiency)
> 
> 
> The problem is that rationale is downstream. Instead I want to see some
> reason: e.g. datasheets, spec, type of UFS device (that was the argument
> in the driver patch discussion).


The PHY load requirements for consumers such as UFS, USB, PCIe are 
defined by Qualcomm’s PHY IP and are well-documented in Qualcomm’s 
datasheets and power grid documentation. These values can depending on 
the process or technology node, board design, and even the chip foundry 
used.

As a result, the load values can differ across SoCs or may be even 
board(unlikely though) due to variations in any of these parameters.


Regards,
Nitin



> 
> The only argument here for given value is: downstream has it.
> 
> Best regards,
> Krzysztof


