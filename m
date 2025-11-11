Return-Path: <linux-arm-msm+bounces-81293-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4CAC4E9EB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 15:56:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9D8A418C07CF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 14:52:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF02E303C8D;
	Tue, 11 Nov 2025 14:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mywPlpaJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FBtcegKL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B277282EB
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 14:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762872731; cv=none; b=k5iIjVscfKHM/f9Lf4lKIBGD3kF1VnK7mk/8yfNbigpzYXoeDCoOY7xROvl0IP3ynrBuXHxNv3DdQjPKWxGcWgw7SQYB4oHsyHI2Br3NDD18I/mxqv4Xfgt2Gth7YrGiM9jQqTPngzuFEY+W6Odo8xrEDdGsU6x9ClY8/XzX2/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762872731; c=relaxed/simple;
	bh=+b1MljAj3XUhNIOhKIjBU6UNm1915Kq92GlNaJckOEQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LnSswHSyBiD0NT+Ol/DUmQgg2R2WK9jLIqZewE+aFCG5Pwb3Hdg46kC/1dnPM7CKY0qn94/rI+dWUZ9SB3dA9zlHoN531lc953+lUaGL2ffy+EiJoaPgxOVqIC8RXI4Xji57Fukl1Je72VjMIv+AtLZSUbag2QjOnpKC4p/KgIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mywPlpaJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FBtcegKL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ABBGBjM2165207
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 14:52:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wEL2b4o4woVn7YImhKI7d/0wBJBkLCWFh9YogBdPmPg=; b=mywPlpaJTknD9eFR
	+LZImcREnhWYRLXEfPToGsGwF+OX/lSEIYYFEX4ZCBgozv8mys5+tpoLrHtN23rX
	yuocgRqYDfskfiESTcAvUMwHLu+Da4kMP7BFLAAlG/MBrY8u15v55KkC8IhC2a7U
	1mLFINtr7ag4I+cK0w5BNDaJ5paaPWsk4TaJARMw7lSyJ+wB5SYrtTcovu+tcyWH
	W093cXvUH75aQi+Tg8ZXs5AJMyVg1RW//zs/60RvmiGwXwHRB66sjtN2+Bw2fGFQ
	8ElNYuswumaNSu3zPjiUs70ea43SbokVgT44OrH4EcLqterb2AnMZtI56reQo8So
	wGQIag==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abxhhhm51-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 14:52:09 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-340d3b1baafso7817854a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 06:52:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762872729; x=1763477529; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wEL2b4o4woVn7YImhKI7d/0wBJBkLCWFh9YogBdPmPg=;
        b=FBtcegKLLp9bKcDucXFAy6yefYWCwK1kUV48s46cUm1cNp9iqv2pZcc49IqiOEEIC0
         svvYIgZlVMCdmiBRoZ56a9YI6+vYfVGzE6kyAlbu3SERPCPqWJ/R2/9YCUkgcBEU7A5L
         sfbmQlTNcWA1YpFz++DAbgGJDFNq9uOT3mPP1g0TAuzlGlZh6VdQdDjzGGIc4AjgYWme
         fz9muAnkETErZksJpGHmWMdf2oZPEVyBmv3DovmFnQlfcNUgF6GfhJEsTRIEZMUMR6nu
         xauAhUPUFrSz4LWtODOkqeJwWvSKBqZJbZKGJnYjpl0Z/VYXv7YjYLJK6JkJ5XZvmPi4
         I/fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762872729; x=1763477529;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wEL2b4o4woVn7YImhKI7d/0wBJBkLCWFh9YogBdPmPg=;
        b=Sr1vfWIT+HdVlxSVY75DErK210pfROfpEobqh64sdR9ogcsvdrHWy3c0mHZWZ3B3wx
         tdf9WwoWwZjSDSDgCKYe62jT2ZcBbvEpSzSg7ZWG/qLPeAE+wi/lnhRZxbeOXP+nrA3Y
         K6d7in2jYSY0PRPzhVh6ZKGvmInRIHUdgemzknAitg02mnf2kI3WNpsRKFz7rzgZZrO/
         luC068q9mPFxfWfpqDWbvk5BNw0BYR98an+Gk/s/vLp5shUfFL1lVtJ9n+XEFZBDfcmJ
         ZxcnhSW3qhy+J3xJjjX9VhMg2bpgla2rZfUvdxc8XRgIEzdZ7M1pzDnBaaWxGwsM0pka
         v6PA==
X-Forwarded-Encrypted: i=1; AJvYcCXlN0KIf6vqjcP8DXXaFpQOfA0BlHZ5VTKYHBHVauhopFacOZXe92PL9x/DLcV/klbtgpTXaxFl8v3usoxn@vger.kernel.org
X-Gm-Message-State: AOJu0Yweib7KdmdYZmYkLssH5piBm1uJlUGRrn+OwqYKwyUJNAar4nDf
	peROI51g4Y7+xATiYS1wkIEO9RsgGG81/qSpD1aXVI6ocRDr4wamtdSiA2kFKORLTyXvOWBfe6j
	2pcJ0uZa3tiKJvmi3W3UJJPc6e3qUkL0p7gzkdJoa2v4JBSMu7Cy+h1ALpmqgGohaWpbr
X-Gm-Gg: ASbGncv84Q6npQk4lNu/jY5Q+CLLGLJ+SYnT+XMqJOfoRyWTRvC4L5nOOAXlc2N+ZuA
	IsEnxrgvuK6IeKj1RANk/j7j7FS0jAwmZZddMf870bYWuJrLU0V/aRrJ4puQzCzWDY/eo/gjA4e
	5ank/2JhqL16KkzziJvqu+4YGtACI97697QGlEgyw0wVpQgtRx4WZvHZiRhduGjbxzTGvJuqlST
	8UkSUNpgk+h2cNsQqiMij/nhwPklGkzNS1uURzvka/CDSO/yvSZ2HqOW43YSEJJosyajr7BKMqa
	8HvcwiytYsnl9LW8HzyKGrwJDFHV5zXo/XRNGcDnQp/ckvjKNwv9fgOu5RWYU3ru0KsE3WuDJBh
	+D8Ui/zAULrvJ4z3frPqfEw==
X-Received: by 2002:a17:90b:4c8a:b0:340:fb6a:cb4c with SMTP id 98e67ed59e1d1-3436cd064efmr16227983a91.30.1762872728703;
        Tue, 11 Nov 2025 06:52:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHPNkW8hxtm48MCmWzwGS5Xaut0loCR++uqJQRZWgnCErEm9erUxXbzVLKElqgpRN181cAIlQ==
X-Received: by 2002:a17:90b:4c8a:b0:340:fb6a:cb4c with SMTP id 98e67ed59e1d1-3436cd064efmr16227916a91.30.1762872728121;
        Tue, 11 Nov 2025 06:52:08 -0800 (PST)
Received: from [10.206.103.12] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-343d0173239sm1432594a91.16.2025.11.11.06.52.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Nov 2025 06:52:07 -0800 (PST)
Message-ID: <07221941-4546-4153-b845-594be006e79a@oss.qualcomm.com>
Date: Tue, 11 Nov 2025 20:21:59 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] dt-bindings: display/msm/rgmu: Document A612 RGMU
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
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20251110-persimmon-wombat-of-holiness-6b3f9c@kuoka>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Pc3yRyhd c=1 sm=1 tr=0 ts=69134d99 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=UXIAUNObAAAA:8 a=EUspDBNiAAAA:8
 a=9x9RmpQyoqOX9MKIOEcA:9 a=QEXdDO2ut3YA:10 a=bFq2RbqkfqsA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=sptkURWiP4Gy88Gu7hUp:22 a=a1s67YnXd6TbAZZNj1wK:22
 a=poXaRoVlC6wW9_mwW8W4:22
X-Proofpoint-ORIG-GUID: i3l7fGyosF2ISYx5E3VKcN2wVqCVjh9l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTExMDEyMCBTYWx0ZWRfX72XnhNMBCVxk
 rJryDDESs7HZB5yGw2LdWQVTJYIeltlL4f0UuRMBYYbjttr0hLOIg3NkIJCh2FOCnnPVX/jSZNH
 +HP8niHbpDWRk9WfROmN4Xm3EawAKqO8WrRHBEGOerb05JTN0SDUFpcPr6TPbal41pSsSgLyht5
 hO1imMA9lYoqXEgJ+OGy1iZd+N4rpkTc+1AsHVroyBM6iT4Outp2g1ZnrtAjsKigPFQKSMUiBsk
 U5mbAJOnBkObYemrLrkTw6YCxNuiH6OBVFty/Ivcj03tI7u3+7znVNbq7sZTlQ1PHT8w186m3z6
 g0tZvhgiIj7wfHcGfEVZOHoMxjkcsnz9LIbHxUE+tgvpXwZKfz/1bynhLrSCAG/UaZoLn8JSUWp
 +ExFJK5ArNo92XKj8bG4a892opLu6Q==
X-Proofpoint-GUID: i3l7fGyosF2ISYx5E3VKcN2wVqCVjh9l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-11_02,2025-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 clxscore=1015
 suspectscore=0 priorityscore=1501 bulkscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511110120

On 11/10/2025 1:21 PM, Krzysztof Kozlowski wrote:
> On Fri, Nov 07, 2025 at 02:20:08AM +0530, Akhil P Oommen wrote:
>> From: Jie Zhang <jie.zhang@oss.qualcomm.com>
>>
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
>> Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>  .../devicetree/bindings/display/msm/rgmu.yaml      | 131 +++++++++++++++++++++
>>  MAINTAINERS                                        |   1 +
>>  2 files changed, 132 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/rgmu.yaml b/Documentation/devicetree/bindings/display/msm/rgmu.yaml
>> new file mode 100644
>> index 000000000000..7621556477d0
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/msm/rgmu.yaml
> 
> Filename matching compatible, so qcom,adreno-rgmu.yaml
> 
> 
>> @@ -0,0 +1,131 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +# Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> +%YAML 1.2
>> +---
>> +
>> +$id: http://devicetree.org/schemas/display/msm/rgmu.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: RGMU attached to certain Adreno GPUs
>> +
>> +maintainers:
>> +  - Rob Clark <robin.clark@oss.qualcomm.com>
>> +
>> +description: |
> 
> Do not need '|' unless you need to preserve formatting.
> 
>> +  RGMU (Reduced Graphics Management Unit) IP is present in some GPUs that
>> +  belong to Adreno A6xx family. It is a small state machine that helps to
>> +  toggle the GX GDSC (connected to CX rail) to implement IFPC feature and save
>> +  power.
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - const: qcom,adreno-rgmu-612.0
>> +      - const: qcom,adreno-rgmu
>> +
>> +  reg:
>> +    items:
>> +      - description: Core RGMU registers
>> +
>> +  reg-names:
>> +    items:
>> +      - const: gmu
> 
> Drop reg-names, useless for one entry with same name as the block name.
> 
>> +
>> +  clocks:
>> +    items:
>> +      - description: GMU clock
>> +      - description: GPU CX clock
>> +      - description: GPU AXI clock
>> +      - description: GPU MEMNOC clock
>> +      - description: GPU SMMU vote clock
>> +
>> +  clock-names:
>> +    items:
>> +      - const: gmu
>> +      - const: cxo
>> +      - const: axi
>> +      - const: memnoc
>> +      - const: smmu_vote
>> +
>> +  power-domains:
>> +    items:
>> +      - description: CX GDSC power domain
>> +      - description: GX GDSC power domain
>> +
>> +  power-domain-names:
>> +    items:
>> +      - const: cx
>> +      - const: gx
>> +
>> +  interrupts:
>> +    items:
>> +      - description: GMU OOB interrupt
>> +      - description: GMU interrupt
>> +
>> +  interrupt-names:
>> +    items:
>> +      - const: oob
>> +      - const: gmu
>> +
>> +  operating-points-v2: true
>> +  opp-table:
>> +    type: object
>> +
>> +required:
> 
> compatible
> 
>> +  - reg
>> +  - reg-names
>> +  - clocks
>> +  - clock-names
>> +  - power-domains
>> +  - power-domain-names
>> +  - interrupts
>> +  - interrupt-names
> 
> Keep the same order as in properties.
> 
>> +  - operating-points-v2
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/qcom,qcs615-gpucc.h>
>> +    #include <dt-bindings/clock/qcom,qcs615-gcc.h>
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/power/qcom,rpmhpd.h>
>> +
>> +    rgmu: rgmu@506a000 {
> 
> Drop label.
> 
> Node names should be generic. See also an explanation and list of
> examples (not exhaustive) in DT specification:
> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
> If you cannot find a name matching your device, please check in kernel
> sources for similar cases or you can grow the spec (via pull request to
> DT spec repo).

I guess we can use 'gmu' here as that name is already in use for other
chipsets?

Ack for all other suggestions. Will update the patch.

-Akhil

> 
> Best regards,
> Krzysztof
> 


