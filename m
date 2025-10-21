Return-Path: <linux-arm-msm+bounces-78198-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7BABF7801
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 17:51:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 53EB13565B1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 15:51:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A750D342C91;
	Tue, 21 Oct 2025 15:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e/F25Tl+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BFB7340D8C
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 15:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761061910; cv=none; b=cetw0HLKjDX/TJKwCHVu8fXrnjN7AhClHdcqh99s6EJShrFXDaaZp0uEKMDYCN99VkDLgD/L120p2XLh/1nckvDCV/ItKrk04vkWuNFteEEWjvzB6XIZpNN6vQUCU7EgL9nzU2vDutTOIPimX5AxpLlBvuxrgGYS4TJOq+iucgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761061910; c=relaxed/simple;
	bh=HeH8kNlcx3ibvgPdvwTGJTHubnRG4vvQXdwSeXq1lIA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=inI5xu2UZsih2s+kfIlZEPiY291q//yLhAQ01Vm3mTTF7HGG/SLB6mQS5G/QafTs5KDLdRODrxdQncxgJVJpIw4by9pJS4kJ4neEmqXzQSVXutML7CC1v/C6s9ytAtfQGHRefwvR7B/6CbSrsN4YJ4x99h4NDNjbOCI+1vn9gMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e/F25Tl+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59LEmiVo031052
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 15:51:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QA+SGH9BRJ0ma1obWpO6OlmiAFE4VJLnzS8FLoARyTE=; b=e/F25Tl+h8sWHYgN
	qvrc5p3XKsRTka3smGrVa7k1Z424Gz+NAR3Uu2VZ39/0qVMtqp/smSTvk3v1rhdG
	BaHNf/VBKEVRfqcc5Lls4EIvBkfyPPbjHunncXpK7CXHVMTteGpv3TB87SJHOSVK
	kBuVupPida5ih416imHw7K8x5mrXzusNjGUFCn4ZNAf2oqkceWxyzTq5SkSL+owf
	48xHeMBmw2EN/NCIiJrncG3DsMXURpN28ewI/rXyEFeclrzA4mJlNaCwa8znshCj
	S38wQpcn03Yk//QCuHvf9YhqrB+1P1A7zPwLHy9i4o3CA6UfgT8xP8bq3zRolFvS
	ZbseKg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v42k96ef-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 15:51:46 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-781171fe1c5so5500610b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 08:51:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761061906; x=1761666706;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QA+SGH9BRJ0ma1obWpO6OlmiAFE4VJLnzS8FLoARyTE=;
        b=C5q61HfnK2J2N78oZeJjg6GWNIAK2XlGXlBY8EzZRh5erTSw5HzfaDlFL7idZKi3aL
         aynntvnDx8rw+c6Jl/35fG77/jZlxO1p7FvsB+GOrJO8EGjrhQoDS6zY9D+wvUlx5c2/
         p7umOPyh9xSt34UoNFRVTGvQTOWmRYGUiVAz17FoSR8R3jnhr/nCYa2LTqw1bpcdvxsn
         egC+9TruBjcst79VFD/P6MOrt/eg0mdPaYLOwV5Ach3ffDS+Qt9/RLx8N3AsWhWRNvIh
         PwuFus2vxwlF6PGjKmFYuxqQXf/S7jP8tjv+O4vRHEzYXwdiFWfkL4Ji2+zfPUzHMsgr
         JySA==
X-Gm-Message-State: AOJu0Ywb4m756mADoNB0YmQy+cwIa94BpihpOH1UkZh0yYdVAbNrCAMc
	o7zjTFgNlpLpraPvDP04sMW1ND1T90qTZHMJMA0phic4HEHntBtyZTiKwTFv6ntuNOoxBh/sB6L
	DeOwk1amm/nb7LDFAUExuNnJ0qgn3I+5U/z2g57uI9DV1aHXX3F5Q0k8TYoJ+am2jnI9i
X-Gm-Gg: ASbGncvsuNaPJj/Npyna5DmCf4fNmtT83xaULcdqFJ6Uh9KLf26BAQyVRZPLXY0Ln9J
	6VQWygUt1M6sdUZZfVAMS7+xe311MsGdrV6SftOhnhWG/RhLNI87fjL3UDjK5orJ0pt1HE9Fkrp
	6aLqU5qMNRj8e/GwYOzgpBd35uRPUMcztDpUhC2zPIIwqG3Oqf+v39lAMAV0vuFrPIQAfeFJNLn
	1KUG8gNZiyXhmLGAKZedUgjdvjlhrYmrbl5fn0uWsqzW5NpLSOu/W1ctqQhk+wJEf9gej+X1eXN
	BPubQUqoWKchkN1l5juuhYXaUjNmujMNNAmjIYaOKMivgwsC3yx4MERXC2Z+gXTLeEgfSsna8AP
	ZJfE/TyAKoKPmu/QFC/33cQ==
X-Received: by 2002:a05:6a21:99a0:b0:32d:b925:276b with SMTP id adf61e73a8af0-334a8523dc3mr22535837637.4.1761061905409;
        Tue, 21 Oct 2025 08:51:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHpQcvweF2xt590lxQ0r+ZD4/+/QPgjpSYlH4eFm6Hkm1wvNrCcND/jZo/4fo2HgPZ9UZ6iw==
X-Received: by 2002:a05:6a21:99a0:b0:32d:b925:276b with SMTP id adf61e73a8af0-334a8523dc3mr22535788637.4.1761061904855;
        Tue, 21 Oct 2025 08:51:44 -0700 (PDT)
Received: from [10.204.104.20] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a2301211besm11597489b3a.68.2025.10.21.08.51.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 08:51:44 -0700 (PDT)
Message-ID: <181af756-09a1-4694-98c4-53cea556e172@oss.qualcomm.com>
Date: Tue, 21 Oct 2025 21:21:37 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] dt-bindings: display/msm/gmu: Document A612 RGMU
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Clark <robin.clark@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
References: <20251017-qcs615-spin-2-v1-0-0baa44f80905@oss.qualcomm.com>
 <20251017-qcs615-spin-2-v1-3-0baa44f80905@oss.qualcomm.com>
 <8f3f4874-2e82-473e-87bd-e3bd58089b90@kernel.org>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <8f3f4874-2e82-473e-87bd-e3bd58089b90@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: hSPfkbYokbUkGiuxy-PpWTqEVxS3CwXG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAzMSBTYWx0ZWRfXwD6NxXa/1DJH
 QfSVAFRTJO3EWPMeOhJe5XeRzxSZgH7oefjVq0mINVjhoTi7Fbx6V+t199IxphpHYz56nyrvXCw
 0N9P4Bo75NVpa6vmuqCrM/6sVa1a0Ix16SVRjOhnuVOMPWv1ZJS4WSu+DkD95cIu26l7Xb/4pl/
 qTXSe/CUdeQFw2HPclFQroMJYIS/zwNob4bfhEDD6Bb7CgzTr3BaQya/crzBW1mo92ElIdqie7C
 +HDuPmidJPL7QbVEI6TzzUWT3/VtW+qHLa53uCBe7/0lQPOzrv4uLr44YHHFnxcgwDzPpqRaIyN
 ewNDR1mLpbXIByTh2aQZAWVw0T9pYMhIvVLJ9fgKtGyX3jrtxc1JQ4qLSTL+VM0IxGF8t2KUgrJ
 wwVV33V8zRVSSFuioSAUIyXTcHP/Pw==
X-Authority-Analysis: v=2.4 cv=QYNrf8bv c=1 sm=1 tr=0 ts=68f7ac12 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=0jTnGb_4dxt76ar0_UAA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: hSPfkbYokbUkGiuxy-PpWTqEVxS3CwXG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-21_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180031

On 10/19/2025 2:43 PM, Krzysztof Kozlowski wrote:
> On 17/10/2025 19:08, Akhil P Oommen wrote:
>> RGMU a.k.a Reduced Graphics Management Unit is a small state machine
>> with the sole purpose of providing IFPC (Inter Frame Power Collapse)
>> support. Compared to GMU, it doesn't manage GPU clock, voltage
>> scaling, bw voting or any other functionalities. All it does is detect
>> an idle GPU and toggle the GDSC switch. As it doesn't access DDR space,
>> it doesn't require iommu.
>>
>> So far, only Adreno 612 GPU has an RGMU core. Document RGMU in the GMU's
>> schema.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>  .../devicetree/bindings/display/msm/gmu.yaml       | 98 +++++++++++++++++-----
>>  1 file changed, 79 insertions(+), 19 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
>> index afc1879357440c137cadeb2d9a74ae8459570a25..a262d41755f09f21f607bf7a1fd567f386595f39 100644
>> --- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
>> @@ -26,6 +26,9 @@ properties:
>>        - items:
>>            - pattern: '^qcom,adreno-gmu-x[1-9][0-9][0-9]\.[0-9]$'
>>            - const: qcom,adreno-gmu
>> +      - items:
>> +          - const: qcom,adreno-rgmu-612.0
>> +          - const: qcom,adreno-rgmu
>>        - const: qcom,adreno-gmu-wrapper
>>  
>>    reg:
>> @@ -45,24 +48,30 @@ properties:
>>      maxItems: 7
>>  
>>    interrupts:
>> -    items:
>> -      - description: GMU HFI interrupt
>> -      - description: GMU interrupt
> 
> 
> Both stay, just explain what is the first interrupt. You should not drop
> descriptions here. Look at every other binding - of course except that
> terrible Adreno GPU which is anti-example.

Do you mean we should use a OneOf and list both combo? Or elaborate the
description of the first interrupt to include OOB too? Something like:

- description: HFI interrupt on GMU and OOB interrupt on RGMU.

Sorry, I am a bit confused.

> 
>> +    minItems: 2
>> +    maxItems: 2
>>  
>>    interrupt-names:
>> -    items:
>> -      - const: hfi
>> -      - const: gmu
>> +    oneOf:
>> +      - items:
>> +          - const: hfi
>> +            description: GMU HFI interrupt
> 
> No, descriptions never go to xxx-names, but to xxx.
> 
>> +          - const: gmu
>> +            description: GMU interrupt
>> +      - items:
>> +          - const: oob
>> +            description: GMU OOB interrupt
>> +          - const: gmu
>> +            description: GMU interrupt
>> +
>>  
>>    power-domains:
>> -    items:
>> -      - description: CX power domain
>> -      - description: GX power domain
>> +    minItems: 2
>> +    maxItems: 3
> 
> No.
I will keep the 'description'. Here, RGMU has 3 power domains instead of
2. I suppose we should add the description for the 3rd power domain here
and keep 'minItems: 2' property to override the default 3?

> 
>>  
>>    power-domain-names:
>> -    items:
>> -      - const: cx
>> -      - const: gx
>> +    minItems: 2
>> +    maxItems: 3
> 
> 
> No. Why?
Same as above.

> 
>>  
>>    iommus:
>>      maxItems: 1
>> @@ -86,6 +95,44 @@ required:
>>  additionalProperties: false
>>  
>>  allOf:
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: qcom,adreno-rgmu-612.0
>> +    then:
>> +      properties:
>> +        reg:
>> +          items:
>> +            - description: Core RGMU registers
>> +        reg-names:
>> +          items:
>> +            - const: gmu
>> +        clocks:
>> +          items:
>> +            - description: GMU clock
>> +            - description: GPU CX clock
>> +            - description: GPU AXI clock
>> +            - description: GPU MEMNOC clock
>> +            - description: GPU SMMU vote clock
>> +        clock-names:
>> +          items:
>> +            - const: gmu
>> +            - const: cxo
>> +            - const: axi
>> +            - const: memnoc
>> +            - const: smmu_vote
>> +        power-domains:
>> +          items:
>> +            - description: CX power domain
>> +            - description: GX power domain
>> +            - description: VDD_CX power domain
>> +        power-domain-names:
>> +          items:
>> +            - const: cx
>> +            - const: gx
>> +            - const: vdd_cx
> 
> This does not make even sense. Why did you remove the the common list
> from  power-domain-names?
> 
>> +
>>    - if:
>>        properties:
>>          compatible:
>> @@ -313,13 +360,26 @@ allOf:
>>            items:
>>              - const: gmu
>>      else:
>> -      required:
>> -        - clocks
>> -        - clock-names
>> -        - interrupts
>> -        - interrupt-names
>> -        - iommus
>> -        - operating-points-v2
>> +      if:
>> +        properties:
>> +          compatible:
>> +            contains:
>> +              const: qcom,adreno-rgmu
>> +      then:
>> +        required:
>> +          - clocks
>> +          - clock-names
>> +          - interrupts
>> +          - interrupt-names
>> +          - operating-points-v2
>> +      else:
> 
> No. Don't nest multiple ifs.

I guess we should split this. I will add a 'required' constraint to the
rgmu constraints above. And apply the below 'required' constraint
specifically to 'qcom,adreno-gmu' instead of the 'else' fallback case.

Please let me know if you have any suggestion.

-Akhil>
>> +        required:
>> +          - clocks
>> +          - clock-names
>> +          - interrupts
>> +          - interrupt-names
>> +          - iommus
>> +          - operating-points-v2
>>  
>>  examples:
>>    - |
>>
> 
> 
> Best regards,
> Krzysztof


