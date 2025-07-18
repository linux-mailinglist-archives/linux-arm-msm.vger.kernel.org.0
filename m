Return-Path: <linux-arm-msm+bounces-65631-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 645A9B0A082
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 12:21:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C1DDA1AA5A1E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 10:21:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACBC829DB6C;
	Fri, 18 Jul 2025 10:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A+sjIWnr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D048F299A96
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 10:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752834071; cv=none; b=jOJFjuH9AzyczYX4NQys/2gHo8QC1nX42C4S/gg0Kte2fB0PnBjCxKKn4pSJIm04QWMhV1Xgityu+xJqF0wI5ysJqv35W/hhLdshV2wNluBqJv4RaOA+5cMsZQHD8opCeYtu97uL4k1ghVDFtaeso2C4c6nClNmEwLfxxWKmgl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752834071; c=relaxed/simple;
	bh=pa9NIgjsC0P5S4HCKAQG+9qGcVyKnrVpuMFouUlf/9U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r1YLm3ncSd/3LB934EevFlyshFuVQ8QX1XyZjuCn2q4jsjigilFmPalm1d6jFWhLkY0ocJWyvBRJgrtdXDBo8jy83J6HNz54N1hOSjBk3NePmRJkirGYVNx8bT2BBhg24rmaL9N1yNokbeJHJsPl7S3iJ5d8AiajxsWlYUh9kMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A+sjIWnr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56I6tJ2l030463
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 10:21:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uYTzq52MpCGBT+eC1ew+UqOuS83E3sozycnXKmWlXv8=; b=A+sjIWnrY6iOHtUT
	/60Gr1ZHNKuv5ewOuhbHzmtLMbkmq4ZW+IqNu/vGQBrKBH5QZ5GYDUR324ycu3vU
	zElWQAt4p9gdrjJcnwavPk196akSVTOUR2prqVuHrWMi2iOOo1vqSchBaHrXgzbJ
	h8EMQsipYaZG2kVpzeoG5gv7Hm3f65mf/Nse2l0qqczreRD20Wdmz5dufwim6kiP
	tNsmw77Y+OlBAtWWuzuepIyJg65eqAmmX2KbJ1sxPl/sdcdV9TLtsEV+WajIsink
	pxtavLESYXFVVRvDzuSlw42or0KEke51UsIl1BxsL0OlOyXQENuTTg+4EEoFWVWi
	W3hM8w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47x8x7qy4k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 10:21:08 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7dea65840b8so31552485a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 03:21:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752834068; x=1753438868;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uYTzq52MpCGBT+eC1ew+UqOuS83E3sozycnXKmWlXv8=;
        b=VBethMTO7v/FCwzvKdgfzi0kwqdIG+3DVuY8bZuFtYysKWtLlHr9mMmInZWbs4WT+m
         KeqThKhNgIa6JuIDMsoFBRHFs9XRF3Sku92bHqaM1zUYJxVymkMBdhNHZOYMPNrNyBLz
         5SN1VXL3N1bJB7sCsDEAiWvWdYXuS6yjtEkkvwLkv69Zl8DJzT0g8Mqs4Q3f16oSfrNF
         DbtOz019MvSzIv2maTyPASPPYLLkoPBBN36tJxPF9hMkk6aAEYENxtBsIFPrn2Su03zB
         uGSZh8V82QJMJe+T8T4cRZDznqW+nWyokAR+hI5G9cQKQMVRzZu3rCCAhschextt1FkB
         3itQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWMX79uCuNxBa8DaIUla1iDMu6R97qbxRLor6MRQi5wfl5sONntr9hDTD+Tt4KxxnfYzXYxc6l8lY9D7ge@vger.kernel.org
X-Gm-Message-State: AOJu0Ywnt0gSVvy6wD4x45aVkyz+5ph2Gx7W/ntMF6JSlRIZJwdJFY6g
	U9xpeh3pD/TbpBKJSPOD/1OtUQL/pt50CblEoicCyYqvEbSK5vEk9XoVN08wR3KKaVrhWaTlxiM
	U9ReTMnMP7bdv9+qoJdoAqGysZEqJSx7vC95UNTRe2s9ppJHyYPi/2nAQdgBXnzqCLW/F
X-Gm-Gg: ASbGncs8TPqpJ6bxCzNuQu5jLlrGT5i/EZIu7EBrWkOYYAuWM4dfNTt3a1ba9dDgauN
	Z+V4ue7woC0zr+538DZ1p19C2DFHKieEXsX14ZvaBljkM9yhQa5W80cmYN2EIwSMYFy5Lw4g/LB
	YBpz00SVKf/IeKaLv7uKjPzwUjvyiXoWA7CPTyzZRLFFZEY9iqRSiZO0PovHIBr69X2BUtl7de0
	2MAVT44DbU9vshzSL8ftI+KoamCDUOIXaePTV8j2EXtwzZfQJJcyU1IFIw4EMyckNINt6ku7Qki
	2fQ/2qIPNYGednqFezsjXrZVzvlev5zmC6LgNVHl9T0cz6IWdU/6m5CdL4UeGmhjLHF4bvdwvsM
	zXGBQwEWwKpd9gsoXeISl
X-Received: by 2002:a05:620a:4153:b0:7d0:9ded:31e0 with SMTP id af79cd13be357-7e3429d39b2mr566393185a.0.1752834067517;
        Fri, 18 Jul 2025 03:21:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF62NXlqV72swDIluGB6+YOT5AQLSkqWukkMK+QRiA5v5vLaC0cmxtAlMkiX5BSG4KvNThabA==
X-Received: by 2002:a05:620a:4153:b0:7d0:9ded:31e0 with SMTP id af79cd13be357-7e3429d39b2mr566391985a.0.1752834066809;
        Fri, 18 Jul 2025 03:21:06 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6ca7d4f5sm94449966b.132.2025.07.18.03.21.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Jul 2025 03:21:06 -0700 (PDT)
Message-ID: <b72ae4cf-b107-4117-9289-61b0d550e49c@oss.qualcomm.com>
Date: Fri, 18 Jul 2025 12:21:03 +0200
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
 <18d013e5-352e-457b-ba96-3dd19f1cbaed@oss.qualcomm.com>
 <56d4e911-5bec-458e-acd1-3594a6d8b91d@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <56d4e911-5bec-458e-acd1-3594a6d8b91d@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDA4MSBTYWx0ZWRfXxKjjAtOoodyg
 cR1lFoadVaNjkLTbTTKu5cKOmMDogKjmYugZxhgs616I/+TmHBdFy8/YZWzHGnRlaUi55i/2+I0
 jGcQByzWOjQ5xMWdOd/iIIAK1ndSfxO4V0IIcAf30H15BpuDboBQ5Wz99tmeITQuTE5tEAbbXes
 YfZ1wQor4qNge4klh37p74tfObqu8H4AQuolLwB6Az2YC88lC8rfw4+UnBrvdK2A60JPUwBIckN
 p3dq8Q1vGEk9EEi1BxpNjXGrEDjncm4oU4YGK2kzKbjySWQkTfT9nzkmOEQCA0CxPc7u5SOakNC
 muoLJbQwxVyy3vePIP3z+tz3TwDiEgwTAjasjJAISjzdh9bj67vXbxGmPhA13Csr6/B/xtbndjI
 8zuzLtgMhvjsYEI1umxJxyIuMn7YgRNbW06dAXMPRYuA5tXUeoC3pJzJ51NnTWSKqQunJKqG
X-Proofpoint-GUID: B6KEvHTZHXPgBxl8Ih6TmZZvpn4Nrkb9
X-Proofpoint-ORIG-GUID: B6KEvHTZHXPgBxl8Ih6TmZZvpn4Nrkb9
X-Authority-Analysis: v=2.4 cv=N9YpF39B c=1 sm=1 tr=0 ts=687a2014 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=9ereT2Ao17-wX4KLY_sA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_02,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 mlxlogscore=999 bulkscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 suspectscore=0 impostorscore=0
 phishscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507180081

On 7/18/25 12:04 PM, Krzysztof Kozlowski wrote:
> On 18/07/2025 12:02, Konrad Dybcio wrote:
>> On 7/18/25 8:27 AM, Krzysztof Kozlowski wrote:
>>> On 17/07/2025 19:00, Jorge Ramirez wrote:
>>>> On 17/07/25 13:16:31, Jorge Ramirez wrote:
>>>>> On 17/07/25 08:45:17, Krzysztof Kozlowski wrote:
>>>>>> On 17/07/2025 08:35, Jorge Ramirez wrote:
>>>>>>> On 17/07/25 00:22:53, Bryan O'Donoghue wrote:
>>>>>>>> On 15/07/2025 21:47, Jorge Ramirez-Ortiz wrote:
>>>>>>>>> Add a schema for the venus video encoder/decoder on the qcm2290.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
>>>>>>>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>>>>>>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>>>>>>>> ---
>>>>>>>>>   .../bindings/media/qcom,qcm2290-venus.yaml    | 127 ++++++++++++++++++
>>>>>>>>>   1 file changed, 127 insertions(+)
>>>>>>>>>   create mode 100644 Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
>>>>>>>>>
>>>>>>>>> diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
>>>>>>>>> new file mode 100644
>>>>>>>>> index 000000000000..0371f8dd91a3
>>>>>>>>> --- /dev/null
>>>>>>>>> +++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
>>>>>>>>> @@ -0,0 +1,127 @@
>>>>>>>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>>>>>>>> +%YAML 1.2
>>>>>>>>> +---
>>>>>>>>> +$id: http://devicetree.org/schemas/media/qcom,qcm2290-venus.yaml#
>>>>>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>>>>>> +
>>>>>>>>> +title: Qualcomm QCM2290 Venus video encode and decode accelerators
>>>>>>>>> +
>>>>>>>>> +maintainers:
>>>>>>>>> +  - Vikash Garodia <quic_vgarodia@quicinc.com>
>>>>>>>>
>>>>>>>> Shouldn't you be on this list ? If you upstream a file I think you should
>>>>>>>> list yourself as responsible for its glory or its mess.
>>>>>>>
>>>>>>> happy to do it. The MAINTAINER's file covered all the files named
>>>>>>
>>>>>> This should be the person(s) interested and caring about this hardware,
>>>>>> which means:
>>>>>> 1. Subsystem maintainers: no
>>>>>> 2. Driver maintainers: usually yes
>>>>>> 3. Author(s) of new hardware support: usually yes
>>>>>
>>>>> perfect, will do 
>>>>>
>>>>>>
>>>>>>> schemas/media/*venus* so my understanding was that I shouldn't.
>>>>>>
>>>>>> I cannot comment why people decided to go one way or another in other
>>>>>> code, but it as well could be just incorrect choice thinking only people
>>>>>> in MAINTAINERS care about hardware.
>>>>>>
>>>>>> ...
>>>>>>
>>>>>>>>> +
>>>>>>>>> +        memory-region = <&pil_video_mem>;
>>>>>>>>> +        iommus = <&apps_smmu 0x860 0x0>,
>>>>>>>>> +                 <&apps_smmu 0x880 0x0>,
>>>>>>>>> +                 <&apps_smmu 0x861 0x04>,
>>>>>>>>> +                 <&apps_smmu 0x863 0x0>,
>>>>>>>>> +                 <&apps_smmu 0x804 0xe0>;
>>>>>>>>
>>>>>>>> You're listing five iommus.
>>>>>>>>
>>>>>>>> I understand there's some disagreement about whether or not to list all of
>>>>>>>> the potential use-cases but, TBH I don't think those are good arguments.
>>>>>>>>
>>>>>>>> Unless there's some technical prohibition I can't think of listing all five
>>>>>>>> maxItems:5 .. let's just do that.
>>>>>>>
>>>>>>> since the device tree should describe hardware and not policy, and the
>>>>>>> driver seems to be able to ignore the unused SIDs I think this is the
>>>>>>> right thing to do.
>>>>>>
>>>>>>
>>>>>> It was never about the driver but about whether you should describe in
>>>>>> DTS for non-secure world the entries which are secure world. The answer
>>>>>> in general is that you can and there will be benefits (e.g. sharing DTS
>>>>>> with secure world implementations).
>>>>>
>>>>> all right, sounds good then, thanks
>>>>
>>>> Not sure if I’ve shared this before, but following an internal
>>>> discussion, I think it’s worth highlighting a functional dependency in
>>>> the current kernel:
>>>>
>>>>  - the driver only works if the first two IOMMUs in the list — the
>>>> non-secure ones — are placed at the beginning. Reordering them breaks
>>>> functionality, which introduces unexpected fragility.
>>>>
>>>> Regardless, this seems like a valid concern to me — a driver shouldn't
>>>> rely on the order of phandles — and I just wanted to make sure you're
>>>> aware of it before I post a v8 (likely sometime next week or the
>>>> following, as I’ll be taking a short break soon).
>>>
>>>
>>> Hm? Order of lists is strictly defined. That's actually an overlook that
>>> we never do it for iommus, but the core rule stays.
>>
>> (FWIW "items:" is an ordered list, "enum:" is unordered)
> 
> enum is not a list, but enumeration, meaning one item of multiple values.

Right, need more caffeine

Konrad

