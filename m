Return-Path: <linux-arm-msm+bounces-63675-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B9AAF8D15
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 11:01:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B28A93BDE6F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 08:59:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F11828C026;
	Fri,  4 Jul 2025 08:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S2L7S3/a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14B51E1C3F
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Jul 2025 08:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751619114; cv=none; b=DU0zJOx3P5rD3iNw1NauNjfxCy6mC+BRWkPh9kDKgV9c7nv7uxdxMSyUtIeKHjFErCaFKza5rFDm0qGgkPDXTmDH0hMGZJR8IAg9iXj8N/E4o4oW189pVucV8wg4LXerzAtm+1SoAIKunymMD/Nk2TccC15KUgnolAxdqMkAQ5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751619114; c=relaxed/simple;
	bh=yk7qosRnx0eOI4j1ITuzzy6/1oMiAdFL9WJAu1EtCW4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=kyelf9w0UrMtD7Co7Q3l+wRNeYVNWdUiS5dt4FpHouKmEJthaS7YLGHItqLcDrbyzng2aC7MB7ARJehrGNZxGAsEESdv6bf/v+DWxio4p0dhJREJ+lugqR48e7L5VCc7quHb+0E35p/Vir8kMvM3dTtdM+ex7GcX6M+norhTV+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S2L7S3/a; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56438NqY026748
	for <linux-arm-msm@vger.kernel.org>; Fri, 4 Jul 2025 08:51:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AZR6M9UH+ORRWSUKy7bTgigDZ2Mla2YST+gR8xNyJPk=; b=S2L7S3/aGUrjW3GG
	vaKph1KhhA7nSh11pR6m3PAYoj/RgX289xEHjoCROmGs4HQsC2CUSvtbQFtzLD6m
	fjfXwpa7jHgapUwr+TguzWdPlSug9D90k3CAhLyIBtSj9Tlf3YdwU4EVkwMtlwcB
	wJGt58GrJh4Z2Bate0J8mXx4YfRJg5Unh1+KAGdhX5JatQvnIiCTWJphglTyi50e
	r3XMoKEfmGN/Ki08ON8rSOIoBvBP/VvVPEMsncXy8RcvX2omDLLrLHdi2tJns001
	iwXMZtxA0yjcNpxghYZy16p3r5eJAJS2ZO1zvaJwArCtYbb6aox51fiyAXrzp0P4
	QsVEIA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j802axv7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 04 Jul 2025 08:51:51 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-31218e2d5b0so1513471a91.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Jul 2025 01:51:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751619110; x=1752223910;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AZR6M9UH+ORRWSUKy7bTgigDZ2Mla2YST+gR8xNyJPk=;
        b=hoxQtxvOXUbFuHjLrKNSEW7ENxxp8R8QJNWYVKa2UYSTOPD/+r1Kn8J7xVogTB8zVs
         mHzgNXUepK07jf06B1s3j0bIgN9jehcVMx1cktfDMq9EKI2wOZQGQSz/XH67T9+nt1L0
         VV9YflfRjC0Uk++9IP71U6jS6rmbM4tr50QfVMLPhd9iUCSkasWfugwTQ9d9tNRvXk6z
         cQNkQUwLZtJk3olkQGz8MDyiOvia1VWch1P7Ed++/JESgiP7f3UGINXA5d32SoIrSw2V
         wuDP9iUdjcHfF52Jl1a/0sfNnoCXnkKE74EH5DXor5NwEnSXIpfP+jtGriCEkDd2JtT+
         9fhg==
X-Gm-Message-State: AOJu0Yy3UuRMUkW77xDKhyofqcPq6zXkhGCogN5RbnL4erp08YyXdOut
	cjEPrabZWC+OqQVaax2u1q8lkqACRkkDkC6oHAWzMFTQJdFqDh6sZfC+qnrMewGI3q87/TULajb
	OHdSCESuN0iPY7qkLY+ytQV7Zba+KsiZ6RQuF7XW1FamuPO7sGA5ZRs+/TX9BTaQZWXNd
X-Gm-Gg: ASbGnctYUJSjnBVuwOGqugS4exAJufAi2LGlqnycueujxhxfcUmM+bGdVr8ZGUBHoIM
	PSXBgkndCkaYWcLYp25XbD/rngEnYVtaKtlnM7MUlPP4wDgObtV/3wE2QJWs7MwlvSOOWj2iBjd
	OkXVuIb2HnomK2VBVZVFWj8eYCXPB/KhZDOL9IAmYwuXkjMtrmbb0Y3N4PYEyHEwbwgPuwZGdgk
	7dbqXhIF3HTX0NBea2DJ1eF8Bl4po2J7JsYmPWRIgKJ7vqD2jq+AMK/NKvAfudBxrqi10tCB+tY
	uaibrJs/Zt6KaWjFsaiRuVDalxgG5YxFUJJhHpf8hHksMt0e4xeKxNpFN56KRYw=
X-Received: by 2002:a17:90b:4a81:b0:312:e279:9ccf with SMTP id 98e67ed59e1d1-31aac432867mr2650946a91.5.1751619109720;
        Fri, 04 Jul 2025 01:51:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGjHONIzeZBcmHDs0wQAo/69TAD7L3QCa4R8AjRrd36Wfaj0nIqIpoFwuQZvSMwqbOAfbsgpw==
X-Received: by 2002:a17:90b:4a81:b0:312:e279:9ccf with SMTP id 98e67ed59e1d1-31aac432867mr2650903a91.5.1751619109127;
        Fri, 04 Jul 2025 01:51:49 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31a9cc675absm4678341a91.19.2025.07.04.01.51.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 01:51:48 -0700 (PDT)
Message-ID: <735a84f4-25b7-431e-9280-aed34e9254a1@oss.qualcomm.com>
Date: Fri, 4 Jul 2025 14:21:44 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] dt-bindings: sram: qcom,imem: Document Qualcomm IPQ
 SoC's IMEM compatibles
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250702-imem-v1-0-12d49b1ceff0@oss.qualcomm.com>
 <20250702-imem-v1-1-12d49b1ceff0@oss.qualcomm.com>
 <a68f46f0-8053-4d9f-96f7-55de33bb301f@kernel.org>
 <37695966-1d7c-46c3-9717-30da4e8d1930@oss.qualcomm.com>
 <e1424499-718a-41c8-b729-0ea96bb6a172@kernel.org>
 <b5481363-ab6e-4b27-8a5c-d766f64e5169@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <b5481363-ab6e-4b27-8a5c-d766f64e5169@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: TrP_uWQlmXpMCcg5i6MlCVRaHCYmCgvd
X-Authority-Analysis: v=2.4 cv=YPWfyQGx c=1 sm=1 tr=0 ts=68679627 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=2Hie-wN6ZoqyeGEPU0sA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: TrP_uWQlmXpMCcg5i6MlCVRaHCYmCgvd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDA2OCBTYWx0ZWRfX5zKHFop+I1mi
 4P3QIoSVSA4RzvZsOhEqTPdyX/ETPnCgP9YKClUeBaw13ZGYvui/6ZKLyfsezkqfyHWQJaKyrv1
 xQWXNCVumkTEnyfBfOR8eZ+rKqkeayu9XK2gjknlLzB8mjfVXV/z7etbGROMo3JDT2NaAP2VzHV
 VuOxAYD+kQ84AdzGWDm08sEADHEM0aJFBWnKLYvteLyohHmxwAsBloKXMeWujgFHvqPeeakan80
 GILj0N2sXv2nP41YhK2Pt8h60hSsn3UGpjHB9hq9ZO0pVgj4pBgGq+Tw6a/4m3K6gXVAAIO+JAj
 neXguhL730GMVNlyHfpwbat6LZdaNfk5t+F/1W9Xnve0+zZko4HsVDHozTc5kd7Wl9jCVZ0Vznj
 NdwSqWSjB3bsOmMKy6EldHtkuPFNomEKhYLVDCjha2Vtd+H+/Ljhz8pJJbTBdS6uLxxfn9z2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_03,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507040068


On 7/2/2025 4:29 PM, Kathiravan Thirumoorthy wrote:
>
> On 7/2/2025 4:18 PM, Krzysztof Kozlowski wrote:
>> On 02/07/2025 12:46, Kathiravan Thirumoorthy wrote:
>>> On 7/2/2025 3:49 PM, Krzysztof Kozlowski wrote:
>>>> On 02/07/2025 12:17, Kathiravan Thirumoorthy wrote:
>>>>> IMEM is present in the Qualcomm's IPQ SoCs as well. Document the 
>>>>> same.
>>>>>
>>>>> Signed-off-by: Kathiravan Thirumoorthy 
>>>>> <kathiravan.thirumoorthy@oss.qualcomm.com>
>>>>> ---
>>>>>    Documentation/devicetree/bindings/sram/qcom,imem.yaml | 6 ++++++
>>>>>    1 file changed, 6 insertions(+)
>>>> Where is the changelog? This is not a v1.
>>> This is the v1. The series[1] I pointed out describes only for the
>>> IPQ5424 SoC. Since I have added few more SoCs, thought v1 is the
>>> appropriate numbering.
>>>
>>> [1]
>>> https://lore.kernel.org/linux-arm-msm/20250610-wdt_reset_reason-v5-0-2d2835160ab5@oss.qualcomm.com/ 
>>>
>> But IPQ5424 is already there, so you reworked that patch.
> Okay, so this should be V6?


Let me drop the IPQ5424 support and send the V2. I hope that is fine.


>>
>>
>>>>> diff --git a/Documentation/devicetree/bindings/sram/qcom,imem.yaml 
>>>>> b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
>>>>> index 
>>>>> 72d35e30c439ccf4901d937f838fe7c7a81f33b1..48e2f332e0e9fc9fa4147fa12d9c6c70a77fafda 
>>>>> 100644
>>>>> --- a/Documentation/devicetree/bindings/sram/qcom,imem.yaml
>>>>> +++ b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
>>>>> @@ -18,6 +18,12 @@ properties:
>>>>>        items:
>>>>>          - enum:
>>>>>              - qcom,apq8064-imem
>>>>> +          - qcom,ipq8074-imem
>>>>> +          - qcom,ipq6018-imem
>>>>> +          - qcom,ipq5018-imem
>>>>> +          - qcom,ipq9574-imem
>>>>> +          - qcom,ipq5332-imem
>>>>> +          - qcom,ipq5424-imem
>>>> Random order, no, follow existing style. This applies for every qcom
>>>> binding and you received such feedbacks in the past.
>>> Apologies — I arranged them based on the evolutionary order of SoCs.
>> Where is such ordering documented? How is it expressed in your internal
>> guideline for example?
> I made the mistake unintentionally and apologized for the same!
>>
>> Best regards,
>> Krzysztof

