Return-Path: <linux-arm-msm+bounces-65627-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C86BB0A044
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 12:02:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5725F1C4417F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 10:02:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 967D329E0E7;
	Fri, 18 Jul 2025 10:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U92lZ4sZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E0629CB45
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 10:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752832933; cv=none; b=HJqoj59W/7YDlr1KMiVTMXVQPKaokgO2ZGQxcv1N4FJcXwIual8JhVFnyiCTw9ZJ3NCrsPz5olM0wpVGCbmF+/x14P/oFkjJkKLdTM56H0NCfRT021RnxCSBbmQnfJvQq7EtzZF7HvaiHmmoY3hMQNIYkKiy9se3kq0h9KAIKeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752832933; c=relaxed/simple;
	bh=lnhb0ySI0088PB1lUpBys7KbTBrrcl0YpbsujVo0JNQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M3DSYIeLV7kWEtrjjXA81hg7/Cfm9G25g2ooJlUxo8KmVPSYQLFAQ7u9CHJSxo3xRxEpnzvvAuBMkKCDKJhwhK9pGOK2lB241ybyJEZZPlAEtt+Djz8Pj2PJPr2z3hhU7QSuMs3XTuaf3F+dlqqlRka09W6nbNzZWrdfwhwArls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U92lZ4sZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56I8FrJ3008506
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 10:02:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0qM9SPLbl25oSm/rdxT6kzqYyAlEqCsAFiFbYNCk/KI=; b=U92lZ4sZq1sYxuqF
	RMRWx0LbXsEPxrsK63e7P9jHiaiGMuiM8zmv2SGGQczFxgvayYUwoPoSN/UldWba
	I8zOQlmGOnkmyfIGgQDyAP8JSBixPYQ/OqtJg29ZQbMhVaVAuHoJ7RZm3TvnqRJA
	0T1WworjelPkAphBeVHtPoQWCvMElXXm30wK6o5JiHr1UqgWlbGL/wMbZdX3fvuB
	gmAq7QnzFJ7E5OkgaN1ux6Y2cvkaM5kh8HG16l5he1cWtE7vM6E7w2QpUHjjhmcV
	07wLsmpPaxqXqBpyonWdlo65A6nMMpOlgjLmKQS45nvUOitT4T8+AHoiGxtJR+Zy
	WRza7g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufxbb31v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 10:02:10 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ab7a01c38cso4042241cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 03:02:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752832930; x=1753437730;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0qM9SPLbl25oSm/rdxT6kzqYyAlEqCsAFiFbYNCk/KI=;
        b=veKeDGUpaPcFCBJOs7bNdKrprmIB7FpYWH23p27+sduERCoxl8mvMckfwjFWKJ1j6U
         DtKPlKaSRezxHr5iXa4fWXzibCbzAus9D60KBZhopMMOhLgERQ/RnooYDBzerdzovHeq
         VU/m4zlXGdBwHhcnDE5HiPwbmG4BHlfK5CVLa+y3dFyDRkuY4cuZ6XFuRR/B3tERSjCP
         B6N3PvR0KNaiBDBFlR1NSj204aURclmKo7omEMQ/TEbQg31fSYBjQG691rGujyuixqCg
         BPM1yic/CjiVGhRIDQVMUIHxEAoaOGCuE01wDchjxO91C7DM1EAfgn8S1JnB/KQTTFlG
         DCNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbbeV08SmbZLwr9a7gB/kW3ys+BK6A6J/EAOWua+Bvzx3GaVtGv3Gj35ONpRGW+dyvGdaHSyHDtL4WKr02@vger.kernel.org
X-Gm-Message-State: AOJu0YyFc8yAKiKr9C1JAEf73zBX6d82siFZ/x+AzgMBKeDwUiW7uGSq
	iIOv8rt2dUhNSKS3VnQYo49HgrgB8706lDyZVbwY0nPIx2yWzxgLwpfq785eavSfQ1Xbn5BqpIQ
	6Rz8eaB/r99uv6Elxf5e1ewbeUAb0ZBoj/+bflEjcAKeY+dxDXn9JW83WCf9QniVztvUh
X-Gm-Gg: ASbGnctgFhYzVeYRe72G+2E0oGd3Rox6T/IEpufdKIoOwtek7AV04cqKcBE9mdL3wnz
	rvMevyhzyMpOGE7gPq2Ev0RYVRKXVCupRg8yjlyT3yem9x1CmzKh9IcEW2dmVf/cNSu88LAL3z1
	sRuIsfsxH3CMEuo6jUQDHlZrFM/oXwIbc4JwesbZgmzg42YIKYKR9x1As13U4BtTWKIrJIvJ9VZ
	rOdtOeE+QYNeSb7F1zT1+lDTIBlgf6hTqg9EZNbVvVrBTp666T1ZfYsJRu7FbZoOuuFMQ9+YIvh
	55q6i21B3cHsJQkLHoP3Hz1ab+NTojP4Vh6iInCNYL/GJ1nzTw03frbHU5yqoOYOIHVjYvIblLA
	t/3mivDECfEFETaCpE9U2
X-Received: by 2002:ac8:5955:0:b0:4a9:94ab:cc77 with SMTP id d75a77b69052e-4ab90cef17amr66368321cf.14.1752832929464;
        Fri, 18 Jul 2025 03:02:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFC/G+2G5cRghesDAgaxo+7QhMzxQEA27REFMfb98JnxzDJ1nx/GPwKROpl7j1hP9p6gXtFyA==
X-Received: by 2002:ac8:5955:0:b0:4a9:94ab:cc77 with SMTP id d75a77b69052e-4ab90cef17amr66368111cf.14.1752832928839;
        Fri, 18 Jul 2025 03:02:08 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-612c907759bsm734954a12.54.2025.07.18.03.02.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Jul 2025 03:02:07 -0700 (PDT)
Message-ID: <18d013e5-352e-457b-ba96-3dd19f1cbaed@oss.qualcomm.com>
Date: Fri, 18 Jul 2025 12:02:04 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/7] media: dt-bindings: venus: Add qcm2290 dt schema
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, krzk+dt@kernel.org, konradybcio@kernel.org,
        mchehab@kernel.org, andersson@kernel.org, conor+dt@kernel.org,
        amit.kucheria@oss.qualcomm.com, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250715204749.2189875-1-jorge.ramirez@oss.qualcomm.com>
 <20250715204749.2189875-2-jorge.ramirez@oss.qualcomm.com>
 <8a63f517-a443-48e4-9b9c-0c4b362f59f8@linaro.org> <aHiZpnFhhR5O0h97@trex>
 <0bb2867a-393b-46f9-ad6f-1aeee5a3a9d4@kernel.org> <aHjbjw8Z79Xcd/ZJ@trex>
 <aHksJum91s4ZmI56@trex> <5afbaf46-bbb1-47d8-84aa-29b18987564f@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <5afbaf46-bbb1-47d8-84aa-29b18987564f@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: -RzXSiFJy7lL4L33yIykBOr9E1rJTOmw
X-Proofpoint-ORIG-GUID: -RzXSiFJy7lL4L33yIykBOr9E1rJTOmw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDA3OCBTYWx0ZWRfXzJEZIKLXwZ6A
 /ITgcSjYvJ9S18pMbiKzi3n3zEmMfHq0eSWlVHv9xUjsVSM1JVbgOy7DV3MWKu+VbwcWvJTaMYg
 Kgn1aBGGxsUYy9zZ6kV6uTayRV9Q1pL6zYqY3p4H12K9hVaeYOPb7DrN0QULLvZs5RJ5Ryeds1J
 eKiPCD744mZIf4sEHcfYMOZgFoPoaxAfJUnQiMNFwwaKY35oxcd21iWdnOvUeb+YMd4RwwZGgJZ
 CteY6bezmW+btEqaIVMtoEnnSSipg9s2TCnVJh8BG62TDGpYeukH9UarfJ0Xl9QLCv+RbwGiROG
 +q8UQI1N3h2Ktcehc3V73bYygIqebzt+W23AvkxDUCDBPlVsAI9Ed8cmFxYCRRHZE6yedUNNJ3p
 QVNC08UO5B4P2lVics4+6ssUEoZ5GYYuBHOKBTHjHPBiqcYHpUywuQQDm6A8ov05TP4yb/hN
X-Authority-Analysis: v=2.4 cv=Xc2JzJ55 c=1 sm=1 tr=0 ts=687a1ba2 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=wioUFQZao2dT8TSE7RkA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_02,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 priorityscore=1501 adultscore=0 mlxlogscore=999
 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507180078

On 7/18/25 8:27 AM, Krzysztof Kozlowski wrote:
> On 17/07/2025 19:00, Jorge Ramirez wrote:
>> On 17/07/25 13:16:31, Jorge Ramirez wrote:
>>> On 17/07/25 08:45:17, Krzysztof Kozlowski wrote:
>>>> On 17/07/2025 08:35, Jorge Ramirez wrote:
>>>>> On 17/07/25 00:22:53, Bryan O'Donoghue wrote:
>>>>>> On 15/07/2025 21:47, Jorge Ramirez-Ortiz wrote:
>>>>>>> Add a schema for the venus video encoder/decoder on the qcm2290.
>>>>>>>
>>>>>>> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
>>>>>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>>>>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>>>>>> ---
>>>>>>>   .../bindings/media/qcom,qcm2290-venus.yaml    | 127 ++++++++++++++++++
>>>>>>>   1 file changed, 127 insertions(+)
>>>>>>>   create mode 100644 Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
>>>>>>>
>>>>>>> diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
>>>>>>> new file mode 100644
>>>>>>> index 000000000000..0371f8dd91a3
>>>>>>> --- /dev/null
>>>>>>> +++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
>>>>>>> @@ -0,0 +1,127 @@
>>>>>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>>>>>> +%YAML 1.2
>>>>>>> +---
>>>>>>> +$id: http://devicetree.org/schemas/media/qcom,qcm2290-venus.yaml#
>>>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>>>> +
>>>>>>> +title: Qualcomm QCM2290 Venus video encode and decode accelerators
>>>>>>> +
>>>>>>> +maintainers:
>>>>>>> +  - Vikash Garodia <quic_vgarodia@quicinc.com>
>>>>>>
>>>>>> Shouldn't you be on this list ? If you upstream a file I think you should
>>>>>> list yourself as responsible for its glory or its mess.
>>>>>
>>>>> happy to do it. The MAINTAINER's file covered all the files named
>>>>
>>>> This should be the person(s) interested and caring about this hardware,
>>>> which means:
>>>> 1. Subsystem maintainers: no
>>>> 2. Driver maintainers: usually yes
>>>> 3. Author(s) of new hardware support: usually yes
>>>
>>> perfect, will do 
>>>
>>>>
>>>>> schemas/media/*venus* so my understanding was that I shouldn't.
>>>>
>>>> I cannot comment why people decided to go one way or another in other
>>>> code, but it as well could be just incorrect choice thinking only people
>>>> in MAINTAINERS care about hardware.
>>>>
>>>> ...
>>>>
>>>>>>> +
>>>>>>> +        memory-region = <&pil_video_mem>;
>>>>>>> +        iommus = <&apps_smmu 0x860 0x0>,
>>>>>>> +                 <&apps_smmu 0x880 0x0>,
>>>>>>> +                 <&apps_smmu 0x861 0x04>,
>>>>>>> +                 <&apps_smmu 0x863 0x0>,
>>>>>>> +                 <&apps_smmu 0x804 0xe0>;
>>>>>>
>>>>>> You're listing five iommus.
>>>>>>
>>>>>> I understand there's some disagreement about whether or not to list all of
>>>>>> the potential use-cases but, TBH I don't think those are good arguments.
>>>>>>
>>>>>> Unless there's some technical prohibition I can't think of listing all five
>>>>>> maxItems:5 .. let's just do that.
>>>>>
>>>>> since the device tree should describe hardware and not policy, and the
>>>>> driver seems to be able to ignore the unused SIDs I think this is the
>>>>> right thing to do.
>>>>
>>>>
>>>> It was never about the driver but about whether you should describe in
>>>> DTS for non-secure world the entries which are secure world. The answer
>>>> in general is that you can and there will be benefits (e.g. sharing DTS
>>>> with secure world implementations).
>>>
>>> all right, sounds good then, thanks
>>
>> Not sure if I’ve shared this before, but following an internal
>> discussion, I think it’s worth highlighting a functional dependency in
>> the current kernel:
>>
>>  - the driver only works if the first two IOMMUs in the list — the
>> non-secure ones — are placed at the beginning. Reordering them breaks
>> functionality, which introduces unexpected fragility.
>>
>> Regardless, this seems like a valid concern to me — a driver shouldn't
>> rely on the order of phandles — and I just wanted to make sure you're
>> aware of it before I post a v8 (likely sometime next week or the
>> following, as I’ll be taking a short break soon).
> 
> 
> Hm? Order of lists is strictly defined. That's actually an overlook that
> we never do it for iommus, but the core rule stays.

(FWIW "items:" is an ordered list, "enum:" is unordered)

Konrad

