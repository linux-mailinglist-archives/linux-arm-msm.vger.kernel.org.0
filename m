Return-Path: <linux-arm-msm+bounces-66507-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2F4B10985
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 13:48:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 765B2189D973
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 11:49:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 159AB248F66;
	Thu, 24 Jul 2025 11:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HCJtF2Dy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B3811E7C38;
	Thu, 24 Jul 2025 11:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753357728; cv=none; b=FAOURkZibpmqpF4rOtF+IdqNpfcDy8/qU8Gzm0PSYkSGzkZyOxhSa7/YKxXZSZ/36hHESw/jgoGHo9ODSsKIADSeAIQp6jLR0l+c0lhkDooZ5/ToWl591JFLhyhqrMjYNHFp3BIGNYI2ghNDSeSiunLmC+cR3DA4vba0u/m38S4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753357728; c=relaxed/simple;
	bh=koFp317HkN7Y6KQsboBEjYBIiWnX2q3UJkllsOewxZY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=MLGQmKb7YrQVLg+K0oI2Oa76ruQtcb3lo1wSRJACNc7JZWgtIKZ6po0zHB6fLFo3beQHylhjX4y5btMMgvEmEaPxhscrkx/melgPmWa8VQrEjyLkKZtqX1Jbne6QdWl/3I66/8hO68Sc81OpMvIyLNJFBcGMu3cdjY53G6rzJuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HCJtF2Dy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56O9TdwK022193;
	Thu, 24 Jul 2025 11:48:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+mJ3RqKHYDhYmI/2t5lJUY/5eM8SNZvHOwanyD/oJuQ=; b=HCJtF2DyWBj60RaK
	SCq3w/cy6dQYSbHigVBhiiskg/CGBz/PUXtejZ5YKySy75T3scaWVJRdXmpFjLKq
	nK/FuXk5Ryw1MZbCgHNJMPvgYy0crZW/UQQMAhin/S1cpT+LlDEnMFJ7XHvX4jNN
	JSUKVaSBzBUVyOpaEoJsZ1i987b2IcAeFOAkat3hG2z/+lvku7VPmZxaVnRlP3zO
	PKN6Navb/nEEiiLiIeGVYUKVpgXA3iYyw7MvestrZC0Kx+egm500RJSx2TDYs8cu
	VV2TwO6MLuleEWgF3IaLeFbZaqFccoQzholSkrZoOd5ReBmU9CbS4ZszIjg/wXcX
	LnW99w==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48313kk89s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Jul 2025 11:48:40 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56OBmdZK031545
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Jul 2025 11:48:39 GMT
Received: from [10.216.46.74] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 24 Jul
 2025 04:48:32 -0700
Message-ID: <836d6ead-6620-4bc7-8dc1-d9220e7c83dc@quicinc.com>
Date: Thu, 24 Jul 2025 17:18:27 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 2/4] dt-bindings: mmc: controller: Add
 max-sd-hs-frequency property
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad Dybcio" <konradybcio@kernel.org>,
        Adrian Hunter
	<adrian.hunter@intel.com>
CC: <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_cang@quicinc.com>, <quic_nguyenb@quicinc.com>,
        <quic_rampraka@quicinc.com>, <quic_pragalla@quicinc.com>,
        <quic_sayalil@quicinc.com>, <quic_nitirawa@quicinc.com>,
        <quic_bhaskarv@quicinc.com>, <kernel@oss.qualcomm.com>
References: <20250618072818.1667097-1-quic_sartgarg@quicinc.com>
 <20250618072818.1667097-3-quic_sartgarg@quicinc.com>
 <6040afd9-a2a8-49f0-85e9-95257b938156@kernel.org>
 <9627ed6f-2bb8-40b0-b647-5f659d87f2f9@oss.qualcomm.com>
 <bba062a3-f96c-456b-8e9e-fdeb0dc2d28d@kernel.org>
 <5bdae07b-a7b1-49be-b843-1704981bc63b@oss.qualcomm.com>
 <ffc62906-c3bb-4968-8f7c-fa7ae5028ad5@kernel.org>
 <fd73a142-3b22-407f-8e6d-00f4e1e1c8eb@oss.qualcomm.com>
 <e0e66895-e68a-4420-a61b-98a689798ce4@kernel.org>
 <a6117473-fa38-48db-94a1-892b76abc10f@oss.qualcomm.com>
 <83f88dd5-8c74-4c2f-b94e-6c16dcbd44f1@kernel.org>
From: Sarthak Garg <quic_sartgarg@quicinc.com>
In-Reply-To: <83f88dd5-8c74-4c2f-b94e-6c16dcbd44f1@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDA4OSBTYWx0ZWRfX7T0LjmLcGy7c
 +swmliuZYqIIKDHWJvzH4FK1TVK79xgzJzuS5tLuHsLC3RJE79DbXzk4bPj+cPP5vWU2nkFY+1M
 he0p6e9GnhnigTuYF9K/I3l2Js/Gxop/9xhScp2ChyaF5B2jBIQ/qPQv0nFcwhtSrVp3JXhG6A3
 jag79ikSR2vJFkCuNLo2ys6To4o41ebVHQpJP50NtnUoH3sNmBhCxFUkIv7/Tvyf6Oa3UBDJ/8R
 D8G1aRjhCkZJGyCJ18UQdN7rcHUNr9qObIvuEx73R3tBJy5j/G8smLd2AUauYTpC+Blc0bVXbCp
 cv1qz6zf1F+YfYbX9qsi3HPpFhdwbyprgGXnFc17V4NDIyg4Dji/EgzI/qVOLqITdc82wAuX03H
 4DUqAR8w89A2DHPc56EAD9yZz9N4ZjP4Q5zchHqOTfQFoMapdOiAkTqHU8ezuvwSDc5WHBeN
X-Proofpoint-ORIG-GUID: _sbB_5csx5GOa3_s-XTZsmkiq3wWTN4j
X-Proofpoint-GUID: _sbB_5csx5GOa3_s-XTZsmkiq3wWTN4j
X-Authority-Analysis: v=2.4 cv=C/TpyRP+ c=1 sm=1 tr=0 ts=68821d98 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=k1EdMiZ1uo5d-mV4pycA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_01,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 mlxscore=0 clxscore=1011 impostorscore=0
 mlxlogscore=999 bulkscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507240089



On 7/1/2025 3:00 PM, Krzysztof Kozlowski wrote:
> On 01/07/2025 11:04, Konrad Dybcio wrote:
>>>>>>
>>>>>> Looking at the docs, a number of platforms have various limitations
>>>>>> with regards to frequency at specific speed-modes, some of which seem
>>>>>> to be handled implicitly by rounding in the clock framework's
>>>>>> round/set_rate().
>>>>>>
>>>>>> I can very easily imagine there are either boards or platforms in the
>>>>>> wild, where the speed must be limited for various reasons, maybe some
>>>>>> of them currently don't advertise it (like sm8550 on next/master) to
>>>>>> hide that
>>>>>
>>>>> But there are no such now. The only argument (fact) provided in this
>>>>> patchset is: this is issue specific to SM8550 SoC, not the board. See
>>>>> last patch. Therefore this is compatible-deducible and this makes
>>>>> property without any upstream user.
>>>>
>>>> When one appears, we will have to carry code to repeat what the property
>>>> does, based on a specific compatible.. And all OS implementations will
>>>> have to do the same, instead of parsing the explicit information
>>>
>>> Adding new property in such case will be trivial and simple, unlike
>>> having to maintain unused ABI.
>>>
>>> And it will be unused, because last patch DTS should be rejected on that
>>> basis: adding redundant properties which are already defined by the
>>> compatible.
>>
>> Got some more fresh information.. This apparently *does* vary across
>> boards, as there is a recommended hardware workaround to this rate
>> limitation (requiring an external clock source, which is up to the
>> OEM to implement or not)
> 
> 
> This should be clearly explained in commit msg and the DTS patch
> re-written because it seems it is not a property of the SoC.
> 
> I mean, really, that last patch here makes entire discussion pointless,
> because till it is in the patchset is a proof this is a SoC level property.
> 
> Best regards,
> Krzysztof


Sure I'll update the commit message clearly mentioning it as board 
specific and update the DTS patch and have these changes in board 
specific dts files (for e.g sm8550-mtp.dts).

As rightly stated above this configuration will vary across boards as well.

Regards,
Sarthak

