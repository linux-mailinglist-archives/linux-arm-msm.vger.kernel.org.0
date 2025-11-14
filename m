Return-Path: <linux-arm-msm+bounces-81850-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 710CFC5D067
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 13:09:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 982293B2FC8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 12:09:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D4B9313E16;
	Fri, 14 Nov 2025 12:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gmy6jgL1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ykcflczz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB562DFA48
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 12:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763122144; cv=none; b=N9OK5k/nAB+8KxJ4aJjkT72xfJzalO7DT0mU53UcRl8i/mrgtw58tmHbJrS/0f5Mp0VAk+ebQZSgRSTSdNhIwFJjw6YH6xLELURpURgX2HsxW0Aq9hnXF9o/q/HdbwMbd8Od/TH42KQKE8DynDBuJPy2cCQZbnUyMn12+Jp0vmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763122144; c=relaxed/simple;
	bh=uN6vX067YSyWkT6H1MCzpwp36cvHNBITPBMNXqprdGk=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=YCAlT2AgNRCWodrG6fKGYBfXcLo44dwRX2rIuHTg8FNxtLvX5qoECorJ1TeDoQF58541/8lIyI1RTPzA0kN0t2CXcmuEXEX2KGJsDAnuKTpUbDWUknP0hyEIhTV3iLuqEBrayYJuGKRj92pW36jDuLNtuBtddDzt4lYJsp/Zco4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gmy6jgL1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ykcflczz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AEBXiop2263213
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 12:09:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	djlvIamP88uSWKSXFTFObQ/yFmQ+cxMViS2ZJbYqFJ8=; b=gmy6jgL1r3oJqfWf
	ibQa1kCUdPLuL4VMFepHhLaBfjvZpa8eMpz3v+if0kBFITxG/vNa0v+nlS0VC/6D
	/eUy+IH/zbwKRy11hMJVGRrHv+sueqZJmQ7D896lFEfzI6jKSH7tw/7ZdLWKmKtI
	zmHnqttfM8hiAZbJRfd5MlqJ1NZUq2gIBjoXqnZVtHCEu7JKJAM5QD+mq3nrSHxu
	T+zhvL3TjLPzhFtI516ZCXR0EBV1B3woKb4s/0HcnfvQOEMZsDmU3BilfIaMMT+9
	uHFgqt9EgnUKDc3yepHbQ6mDF3cK2314LqadLRjF/y9qkflqb4gaOksTe8KamJRe
	nljxiw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adw1j1bcw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 12:09:01 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-295952a4dd6so37534435ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 04:09:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763122141; x=1763726941; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=djlvIamP88uSWKSXFTFObQ/yFmQ+cxMViS2ZJbYqFJ8=;
        b=YkcflczzFDNKwF5xTwFkib3hvVX5zdDrUlpZuRa83VeaFDg8pcOhSD5Vy6Riqe9TLC
         3hrzq/YXwT3dOqzbAvI0OWG86Pk5ewGDAtJE0JUNB3LusKprrWkauPzIaYx1pSfaazzG
         75TNWqmgktmNh1IxAP9RnpIB4wAJB+4lz7MmvDFW6wo0s/cSghXSYSWgk8S/ydHUdJ3y
         xDz5F6icJ8NmRzyntzy5ryzyyuwbg28qdrIiQIqTFcPDYR0OEU7lnhQGP1ZDEXO7mZZB
         sw25iHPgkM3EOFPEK9X3SMW1F5UPWXQAsFQu4JztrQ/efBqWSiollcaPv53BtIqVbU7Q
         cVAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763122141; x=1763726941;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=djlvIamP88uSWKSXFTFObQ/yFmQ+cxMViS2ZJbYqFJ8=;
        b=BlHsUzhbDS7yzzGCVWCRO3nsuZQOS6vPqnUWpBdQhxmDh/pNXWwtDkVtkGs6V8UHLQ
         tMTDp4w4bje0s8jdtMauPOXT/yUKMaE3pfvdk8gbo1biquzHLyaQUtesXHJQQuuiD5FF
         UYRHUXx7SBxpoC3cv9zW6r+qHm1g/ctk72jmWO+AGRMhVThNmpm4FKdRKv4I/ITwsV9R
         4czCLuZsX5i1JoDpdv/1VM9nq9/yaRdN4v1KhZHAZpTLOwiCHBrPR99cwkEdNiDB3V5M
         pP+VJoyk2qLc7Hay2I1o2DvplIwoP1r+wuSzltj0rkwwniOx6gqc4pReUToCJ+2wwDhI
         z66A==
X-Forwarded-Encrypted: i=1; AJvYcCUu8hhFuxhcmdpAMSQbFICKJUwySpgrKRBt0hxwuP/uwQSTp4PrDxjOZRNB7UpFC7nVdZH/lNKunqNAq5zi@vger.kernel.org
X-Gm-Message-State: AOJu0Yyikvrz6c7NsoMkFFMWCq2Li+WQne62jWTGdugwQCM3uX3gJEUC
	Q73/Pz28bIUMMoSgerZjtw8hQ61pvM2FAuoBLHyqmeqEA//IQfUZD/oFdyGdKD313tuUTa67pL6
	OcWWujmQ1gyUcjb0oariNVQCrpM+DwnCUgKKa10euXOUcLSLPfs46fmgjNiQyONDw/UDu
X-Gm-Gg: ASbGncupy2xwQ1hx5IYXFbNiYuDKcZNoTDwbrQJs13WEddB2cJ91IJxZcEhRIe+So9N
	lxy57Pg9TzsvvHJLgsYHvkTLpulaGvW+WNZk0srMmXcnUjiW4tMyW2ezS5wn8X848xK1XJ1lvmO
	PZXdy5xq8vPc9nQsvBHq4Ck9YocbYu0wPp1w2tiMY1ylg/ZtaVjTMxzk+QiwuCZawMw4qBpEANy
	qF/szxs7tmgfG0ImcTLtcxU1WPP+0I+Sb1XO1pX7OkXMpFm0fFtauMGdetHJ0WroVHw1vOBOGmK
	ObaQOkH8yx+4tnlgEC6ISmKkUYz77OgYZkyUq7WMKyz5vFlXRNzgSRfp+8NJ/147x3ag2MRTjFi
	HcHHNLpvFxQEbUxIyuwoYI8o=
X-Received: by 2002:a17:903:249:b0:297:f527:885f with SMTP id d9443c01a7336-2985a40c7c7mr86057055ad.0.1763122140877;
        Fri, 14 Nov 2025 04:09:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGSRcXduJStRkEjpIaI8wBB1y+r2W3c+GWZP9UFC0BdilfKeLYl63dIZH4/YZaDyD3wEO6ndw==
X-Received: by 2002:a17:903:249:b0:297:f527:885f with SMTP id d9443c01a7336-2985a40c7c7mr86056405ad.0.1763122140280;
        Fri, 14 Nov 2025 04:09:00 -0800 (PST)
Received: from [192.168.1.8] ([106.222.229.203])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b921cb6f44sm5156759b3a.0.2025.11.14.04.08.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Nov 2025 04:08:59 -0800 (PST)
Message-ID: <e0e82b22-ecef-4136-834b-ea4a6b00e179@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 17:38:51 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] dt-bindings: display/msm/rgmu: Document A612 RGMU
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Zhang <jie.zhang@oss.qualcomm.com>
References: <20251107-qcs615-spin-2-v2-0-a2d7c4fbf6e6@oss.qualcomm.com>
 <20251107-qcs615-spin-2-v2-3-a2d7c4fbf6e6@oss.qualcomm.com>
 <20251110-persimmon-wombat-of-holiness-6b3f9c@kuoka>
 <f08c8707-eb72-4689-b53b-acd6e3218836@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <f08c8707-eb72-4689-b53b-acd6e3218836@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Jv38bc4C c=1 sm=1 tr=0 ts=69171bdd cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=UUXEStRZTiKyGgBwSCQbmw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=UXIAUNObAAAA:8 a=EUspDBNiAAAA:8
 a=VxizJ4rqJv6xgcLMcuIA:9 a=QEXdDO2ut3YA:10 a=bFq2RbqkfqsA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=sptkURWiP4Gy88Gu7hUp:22 a=a1s67YnXd6TbAZZNj1wK:22
 a=poXaRoVlC6wW9_mwW8W4:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDA5NyBTYWx0ZWRfX3Y8+4Ech59aR
 ajFYWWAK1X899EruxG28tEii/f/iO/rhPpaaUlPKzKzpae29n/DByz9vZIMYfxCK+UHbKn30957
 mRlwSNBuwpgZGxAbCO82k1WYSW7RdbwjxIuhfhM30FshIvLEvM7B6Edpi753mkFnJegrOgBNjuE
 uXoiYHU0Irzf3Ddgfm90QyGkg9y6goWFPwBpwZ/J/Kd3k12g5vPS+gzmiczwUJdc6lZhBcVwowP
 qyv81+jRblhO0i4yMavtx7RY9t6Hv5yMzygC7FC3vJxnTjeSY83XCeK/AYVCJwPEpuTy5a4rDiD
 wjNoa277TbgWZBn8Bj5ZRGDLg+CgYjv2dueqohxTLSDwdIHao40sV5aMrMsjKj30/2ssU+IXKaL
 J9iJ6aO2DHHPscm7n/IKYCGS254dDw==
X-Proofpoint-ORIG-GUID: JMcN4pydKAZNoMefxBmktVh7prNL40f6
X-Proofpoint-GUID: JMcN4pydKAZNoMefxBmktVh7prNL40f6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511140097

On 11/14/2025 5:30 PM, Akhil P Oommen wrote:
> On 11/10/2025 1:21 PM, Krzysztof Kozlowski wrote:
>> On Fri, Nov 07, 2025 at 02:20:08AM +0530, Akhil P Oommen wrote:
>>> From: Jie Zhang <jie.zhang@oss.qualcomm.com>
>>>
>>> RGMU a.k.a Reduced Graphics Management Unit is a small state machine
>>> with the sole purpose of providing IFPC (Inter Frame Power Collapse)
>>> support. Compared to GMU, it doesn't manage GPU clock, voltage
>>> scaling, bw voting or any other functionalities. All it does is detect
>>> an idle GPU and toggle the GDSC switch. As it doesn't access DDR space,
>>> it doesn't require iommu.
>>>
>>> So far, only Adreno 612 GPU has an RGMU core. Document RGMU in the GMU's
>>> schema.
>>>
>>> Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>> ---
>>>  .../devicetree/bindings/display/msm/rgmu.yaml      | 131 +++++++++++++++++++++
>>>  MAINTAINERS                                        |   1 +
>>>  2 files changed, 132 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/display/msm/rgmu.yaml b/Documentation/devicetree/bindings/display/msm/rgmu.yaml
>>> new file mode 100644
>>> index 000000000000..7621556477d0
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/display/msm/rgmu.yaml
>>
>> Filename matching compatible, so qcom,adreno-rgmu.yaml
>>
>>
>>> @@ -0,0 +1,131 @@
>>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>>> +# Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>>> +%YAML 1.2
>>> +---
>>> +
>>> +$id: http://devicetree.org/schemas/display/msm/rgmu.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: RGMU attached to certain Adreno GPUs
>>> +
>>> +maintainers:
>>> +  - Rob Clark <robin.clark@oss.qualcomm.com>
>>> +
>>> +description: |
>>
>> Do not need '|' unless you need to preserve formatting.
>>
>>> +  RGMU (Reduced Graphics Management Unit) IP is present in some GPUs that
>>> +  belong to Adreno A6xx family. It is a small state machine that helps to
>>> +  toggle the GX GDSC (connected to CX rail) to implement IFPC feature and save
>>> +  power.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    items:
>>> +      - const: qcom,adreno-rgmu-612.0
>>> +      - const: qcom,adreno-rgmu
>>> +
>>> +  reg:
>>> +    items:
>>> +      - description: Core RGMU registers
>>> +
>>> +  reg-names:
>>> +    items:
>>> +      - const: gmu
>>
>> Drop reg-names, useless for one entry with same name as the block name.
> 
> Just to confirm, drop only reg-names, but keep 'reg'?

Wait. We should keep 'reg'.

If we remove 'reg-names' here, we cannot use reg-names in DT too because
we are setting additionalProperties to False, right?

-Akhil.

> 
> -Akhil
> 
>>
>>> +
>>> +  clocks:
>>> +    items:
>>> +      - description: GMU clock
>>> +      - description: GPU CX clock
>>> +      - description: GPU AXI clock
>>> +      - description: GPU MEMNOC clock
>>> +      - description: GPU SMMU vote clock
>>> +
>>> +  clock-names:
>>> +    items:
>>> +      - const: gmu
>>> +      - const: cxo
>>> +      - const: axi
>>> +      - const: memnoc
>>> +      - const: smmu_vote
>>> +
>>> +  power-domains:
>>> +    items:
>>> +      - description: CX GDSC power domain
>>> +      - description: GX GDSC power domain
>>> +
>>> +  power-domain-names:
>>> +    items:
>>> +      - const: cx
>>> +      - const: gx
>>> +
>>> +  interrupts:
>>> +    items:
>>> +      - description: GMU OOB interrupt
>>> +      - description: GMU interrupt
>>> +
>>> +  interrupt-names:
>>> +    items:
>>> +      - const: oob
>>> +      - const: gmu
>>> +
>>> +  operating-points-v2: true
>>> +  opp-table:
>>> +    type: object
>>> +
>>> +required:
>>
>> compatible
>>
>>> +  - reg
>>> +  - reg-names
>>> +  - clocks
>>> +  - clock-names
>>> +  - power-domains
>>> +  - power-domain-names
>>> +  - interrupts
>>> +  - interrupt-names
>>
>> Keep the same order as in properties.
>>
>>> +  - operating-points-v2
>>> +
>>> +additionalProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    #include <dt-bindings/clock/qcom,qcs615-gpucc.h>
>>> +    #include <dt-bindings/clock/qcom,qcs615-gcc.h>
>>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>>> +    #include <dt-bindings/power/qcom,rpmhpd.h>
>>> +
>>> +    rgmu: rgmu@506a000 {
>>
>> Drop label.
>>
>> Node names should be generic. See also an explanation and list of
>> examples (not exhaustive) in DT specification:
>> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
>> If you cannot find a name matching your device, please check in kernel
>> sources for similar cases or you can grow the spec (via pull request to
>> DT spec repo).
>>
>> Best regards,
>> Krzysztof
>>
> 


