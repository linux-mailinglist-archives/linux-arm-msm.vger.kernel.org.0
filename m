Return-Path: <linux-arm-msm+bounces-78654-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 31906C03BD3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 01:03:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D6DC73B1DCC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 23:03:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44A0B2580D1;
	Thu, 23 Oct 2025 23:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nFn7V/Hx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F259463
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 23:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761260621; cv=none; b=bgZ3MqAjbtPXpSRJ8UClN/5K3NsWTVwqmcCQp/f5HuAKUAuRN2qzWUNEBOgI4TjSukHW/V/YC6AiMc+oxCjSvY0cVlpFjj4Jw6z43kzm1SYQNiNsrO5pzkVlLBhnUUECnnnyoQG6zkj+thXzMOmSsHfL+kbAQOJomarCw7nm/Uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761260621; c=relaxed/simple;
	bh=Uf6vdpIMhqiFJb2Ai7F4KgvzXlqs5AJUHLFC4w3AEhc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qz3Nmw6d/qiOUxXthVczwxGqDUEQeDrldMK96XXIk7is8V0ZRetGIlvEZ1Y6/m+1yh87M9dY32v4618mQ9wpp+0s0Lj+++4fg3+++xLqzYy/t/DWmyiNWH1IMhYHMzWgv/dwSGgJKHlwUoN/2jvDki/wUz6dh9zZLnuYepa4dag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nFn7V/Hx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59NE8wi0011684
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 23:03:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yz1FKwyZ35REPRPl+uTbA1pbxfFaVvWgZK3KBVlHQrM=; b=nFn7V/Hxn/9SxRiV
	HuusfQEbGGC8kY0kotHJ6ONBJGcwf4Xjd8az1bUbTgdGFfQMYn+tbMDu7bo/6XuY
	USgE9RcKgFAz1p6MYTVUpsOCDNU/skWVTyJVAVXb0bdMVMYEoayYN5vRa7UYWq53
	w1MqyW7Dii5y9kdFl01YHkAnPReVEQ5cpK37IXPfUrUMIU5aWm17JVC6KkmLjKsq
	Tc+R9ldesbK0IbkPLM/unDKkMy8Nb52MtxdAUN0sG9YvABGwNlXUi/Mz0/D3p2fK
	BbyYw/lBy97XUOUzUYFT6fRiYpKmOLjxnLwLQYu/UWZDU5vUb26JcOMyDYwIu7Op
	9nCddQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49y524cbw5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 23:03:38 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-28973df6a90so11721615ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 16:03:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761260618; x=1761865418;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yz1FKwyZ35REPRPl+uTbA1pbxfFaVvWgZK3KBVlHQrM=;
        b=MyPnurLCArhn3xnYYG4fN0O23r/t8qCa/ubc9FmCY1rgFuI+ZbW+Sf7wj1qZPpvylG
         sQjIZ7GVOVlXMPNd93R8AsFVlWKj6ECrUuK9UnZGR/nGDrfjLkQii6DlkwXYd+AE1r2W
         kYV+eF3hqVcFWXtbEH7dQFG5QW35ySv8OdVNpZNWuYrfRfx6AwK2kSm17Jxc9tCFS2La
         4YAnvjSzYeg5LQsb8NrwOmSGUUI9ijdWWcEl4jVbwK3n+RD7C8owINqemNKKgU/8z4ew
         xJdMs0FcFEAbkcTZFN+1kw4JHgVqGjaHsas8L925mtPPji6TMn/E6wlFr6WgJ9K7XHEi
         RFtw==
X-Gm-Message-State: AOJu0Ywdo97PKa6woLHK+VEAwE6jLbKvLYq+SKy6hAnD+vkFf+sFTPk3
	pasI92fDC+8WkMAeTZyp7PcoEDZNAsjhLV5Pz5ieNQMAhSBF+paR5u9VCswa9JkDZfT3mk7uLX5
	gbv2RraHygF7xYXG010aotgydM/i7cbBVHN53CDVD1Q6FhSHIUM2b3/6UjA5dI9OiEmZk
X-Gm-Gg: ASbGncsJ1+V94OisWAldqgWSzdyyTTlAGXbr9rw2fCY9DKvn+kd3DV3ei6Ia6Dze6X+
	KOraG/0ssUwzN/6KXXDzrOvdwUxW0liTf3LKUFnRVycNA4TM8FIPH5ZC8YL8A7xhSSle03WGl3K
	Bhl+NAOAkavWAB81WuNSnWisAVUoS7Asufmu4Kr3nUN++VJNmhTawU7x8HYm5y5TNNJUSZr+diF
	HuqLN3UUU4fo0O/f7nTBeKRoC11diEFpS38MLlTy+U5u+0KoZW4xzceNzpqNEXLifXkGqOIQ4e4
	jnWZyGEjphQNnwkMcXfXzW/R8fRtZijNSg3Hclbn/b38cI4cXPBNceRqik6TMx44xbOnFo8b7hy
	I0XdcuXZZYumHLBZRgsww3pQ=
X-Received: by 2002:a17:903:244b:b0:290:9a31:26da with SMTP id d9443c01a7336-290c9d31109mr329081825ad.16.1761260617697;
        Thu, 23 Oct 2025 16:03:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+gtW3iL5YfktBLtM22DaFOWiosZsm9piWaW0gD11XXUYwJYStL7NWGN9b5nOT3GQP6iSqfA==
X-Received: by 2002:a17:903:244b:b0:290:9a31:26da with SMTP id d9443c01a7336-290c9d31109mr329081175ad.16.1761260617079;
        Thu, 23 Oct 2025 16:03:37 -0700 (PDT)
Received: from [192.168.1.5] ([106.222.232.102])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2946de0c927sm35158665ad.46.2025.10.23.16.03.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 16:03:36 -0700 (PDT)
Message-ID: <f677f8ee-d635-4131-8ee2-8ca6ead43095@oss.qualcomm.com>
Date: Fri, 24 Oct 2025 04:33:28 +0530
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
 <181af756-09a1-4694-98c4-53cea556e172@oss.qualcomm.com>
 <ff37b635-b3dc-4180-8eae-e798ef6ce55a@kernel.org>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <ff37b635-b3dc-4180-8eae-e798ef6ce55a@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDE1NSBTYWx0ZWRfX7BXpaK70M24l
 ofUePkjn2udOCBsdwHWTkDR0ap6s59zYkB/E4fwjNQS5eVFoVOc/Z3ahkgl2/wR8V5UvGsw0nGF
 0IJAl9gKWnsAV8r1wmYrWkKNvvcELngfSdPSY3zaJctctbKoBUrHQQOlW2ZFf6836RdcJ7I23tQ
 Nd40JP/w3g28Tj7kctHNRccEUMTnkUHrSKnHIvp2pdpFr+ZJQQrS3zSjK6X86U+qmaEo25g8ptL
 ldRHVJlNHKM9gHGdhmLZ+0ABrJNHqRtB1iOemiPFSWLZX97BC7UMeVLKZpj9aL+0BhI65xiukFw
 xyG9InofmLjDv1CjSECWQqy+wwWjcKFDX6k3E4XWk/bJwC7V007xjkPRNrORHUuIP3R3LX+YRf/
 3KGqcs+1UrTyOV0RCWpLL9C12Xz+0g==
X-Authority-Analysis: v=2.4 cv=Uotu9uwB c=1 sm=1 tr=0 ts=68fab44a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=OORdEvYNKPdDRPFHMUl15A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Oc1YgfMCT3OOBMc9zysA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: 4VI8ZFViXG8gHMToEX14tGv6SDsgUjQK
X-Proofpoint-ORIG-GUID: 4VI8ZFViXG8gHMToEX14tGv6SDsgUjQK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 adultscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510220155

On 10/22/2025 12:49 AM, Krzysztof Kozlowski wrote:
> On 21/10/2025 17:51, Akhil P Oommen wrote:
>> On 10/19/2025 2:43 PM, Krzysztof Kozlowski wrote:
>>> On 17/10/2025 19:08, Akhil P Oommen wrote:
>>>> RGMU a.k.a Reduced Graphics Management Unit is a small state machine
>>>> with the sole purpose of providing IFPC (Inter Frame Power Collapse)
>>>> support. Compared to GMU, it doesn't manage GPU clock, voltage
>>>> scaling, bw voting or any other functionalities. All it does is detect
>>>> an idle GPU and toggle the GDSC switch. As it doesn't access DDR space,
>>>> it doesn't require iommu.
>>>>
>>>> So far, only Adreno 612 GPU has an RGMU core. Document RGMU in the GMU's
>>>> schema.
>>>>
>>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>> ---
>>>>  .../devicetree/bindings/display/msm/gmu.yaml       | 98 +++++++++++++++++-----
>>>>  1 file changed, 79 insertions(+), 19 deletions(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
>>>> index afc1879357440c137cadeb2d9a74ae8459570a25..a262d41755f09f21f607bf7a1fd567f386595f39 100644
>>>> --- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
>>>> +++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
>>>> @@ -26,6 +26,9 @@ properties:
>>>>        - items:
>>>>            - pattern: '^qcom,adreno-gmu-x[1-9][0-9][0-9]\.[0-9]$'
>>>>            - const: qcom,adreno-gmu
>>>> +      - items:
>>>> +          - const: qcom,adreno-rgmu-612.0
>>>> +          - const: qcom,adreno-rgmu
>>>>        - const: qcom,adreno-gmu-wrapper
>>>>  
>>>>    reg:
>>>> @@ -45,24 +48,30 @@ properties:
>>>>      maxItems: 7
>>>>  
>>>>    interrupts:
>>>> -    items:
>>>> -      - description: GMU HFI interrupt
>>>> -      - description: GMU interrupt
>>>
>>>
>>> Both stay, just explain what is the first interrupt. You should not drop
>>> descriptions here. Look at every other binding - of course except that
>>> terrible Adreno GPU which is anti-example.
>>
>> Do you mean we should use a OneOf and list both combo? Or elaborate the
>> description of the first interrupt to include OOB too? Something like:
>>
>> - description: HFI interrupt on GMU and OOB interrupt on RGMU.
> 
> Yes, like that.
> 
>>
>> Sorry, I am a bit confused.
>>
>>>
>>>> +    minItems: 2
>>>> +    maxItems: 2
>>>>  
>>>>    interrupt-names:
>>>> -    items:
>>>> -      - const: hfi
>>>> -      - const: gmu
>>>> +    oneOf:
>>>> +      - items:
>>>> +          - const: hfi
>>>> +            description: GMU HFI interrupt
>>>
>>> No, descriptions never go to xxx-names, but to xxx.
>>>
>>>> +          - const: gmu
>>>> +            description: GMU interrupt
>>>> +      - items:
>>>> +          - const: oob
>>>> +            description: GMU OOB interrupt
>>>> +          - const: gmu
>>>> +            description: GMU interrupt
>>>> +
>>>>  
>>>>    power-domains:
>>>> -    items:
>>>> -      - description: CX power domain
>>>> -      - description: GX power domain
>>>> +    minItems: 2
>>>> +    maxItems: 3
>>>
>>> No.
>> I will keep the 'description'. Here, RGMU has 3 power domains instead of
>> 2. I suppose we should add the description for the 3rd power domain here
>> and keep 'minItems: 2' property to override the default 3?
> 
> Yes.
> 
>>
>>>
>>>>  
>>>>    power-domain-names:
>>>> -    items:
>>>> -      - const: cx
>>>> -      - const: gx
>>>> +    minItems: 2
>>>> +    maxItems: 3
>>>
>>>
>>> No. Why?
>> Same as above.
>>
>>>
>>>>  
>>>>    iommus:
>>>>      maxItems: 1
>>>> @@ -86,6 +95,44 @@ required:
>>>>  additionalProperties: false
>>>>  
>>>>  allOf:
>>>> +  - if:
>>>> +      properties:
>>>> +        compatible:
>>>> +          contains:
>>>> +            const: qcom,adreno-rgmu-612.0
>>>> +    then:
>>>> +      properties:
>>>> +        reg:
>>>> +          items:
>>>> +            - description: Core RGMU registers
>>>> +        reg-names:
>>>> +          items:
>>>> +            - const: gmu
>>>> +        clocks:
>>>> +          items:
>>>> +            - description: GMU clock
>>>> +            - description: GPU CX clock
>>>> +            - description: GPU AXI clock
>>>> +            - description: GPU MEMNOC clock
>>>> +            - description: GPU SMMU vote clock
>>>> +        clock-names:
>>>> +          items:
>>>> +            - const: gmu
>>>> +            - const: cxo
>>>> +            - const: axi
>>>> +            - const: memnoc
>>>> +            - const: smmu_vote
>>>> +        power-domains:
>>>> +          items:
>>>> +            - description: CX power domain
>>>> +            - description: GX power domain
>>>> +            - description: VDD_CX power domain
>>>> +        power-domain-names:
>>>> +          items:
>>>> +            - const: cx
>>>> +            - const: gx
>>>> +            - const: vdd_cx
>>>
>>> This does not make even sense. Why did you remove the the common list
>>> from  power-domain-names?
>>>
>>>> +
>>>>    - if:
>>>>        properties:
>>>>          compatible:
>>>> @@ -313,13 +360,26 @@ allOf:
>>>>            items:
>>>>              - const: gmu
>>>>      else:
>>>> -      required:
>>>> -        - clocks
>>>> -        - clock-names
>>>> -        - interrupts
>>>> -        - interrupt-names
>>>> -        - iommus
>>>> -        - operating-points-v2
>>>> +      if:
>>>> +        properties:
>>>> +          compatible:
>>>> +            contains:
>>>> +              const: qcom,adreno-rgmu
>>>> +      then:
>>>> +        required:
>>>> +          - clocks
>>>> +          - clock-names
>>>> +          - interrupts
>>>> +          - interrupt-names
>>>> +          - operating-points-v2
>>>> +      else:
>>>
>>> No. Don't nest multiple ifs.
>>
>> I guess we should split this. I will add a 'required' constraint to the
>> rgmu constraints above. And apply the below 'required' constraint
>> specifically to 'qcom,adreno-gmu' instead of the 'else' fallback case.
>>
>> Please let me know if you have any suggestion.
> 
> Maybe the binding is getting to complicated and RGMU should have its own.

There is just a single chipset with RGMU and we haven't seen another one
in the last 8 yrs. So it is very unlikely we will see another one again.
So I feel it is not worth splitting this file just for RGMU.

Let me send another revision and let's take a call after that.

-Akhil.

> 
> 
> Best regards,
> Krzysztof

