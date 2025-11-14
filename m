Return-Path: <linux-arm-msm+bounces-81849-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B533DC5CFC8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 13:01:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 17E0E35B592
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 12:01:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CCD431A576;
	Fri, 14 Nov 2025 12:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C5apUv9V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jymmjqd9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7FAA3191B4
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 12:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763121643; cv=none; b=Mqh3uEKC+qxX5vu1G2hyRyhbxvJEAD+8y4LopdnFO+zc82BVbYocCbihFRTk6oy5yabwTpbRFswoiidN5JJic4UEPreuY8fEMR+oc3a/yUAlw3DfZW04x3TBjKpEE629HadeyiMwTUTewHRNNcof091S+ySjtyKbFycLgrHB05k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763121643; c=relaxed/simple;
	bh=9iQ2RCTrvng8H9uxQwOkK1diONbL/BWWV9goYuQXKaE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qpD1mtp9WKWkRFFC+RhMI8kMGALSc4ViEcRG4Dt4NvIbU3k4/4TkyGZkxsVuDvkFs8VJl3UO4BfZ4bZMGSqUZqexuZL3gBtveV6wt9o9xNjEPQ0kbAXyunHrW92ypEeRhX3qbQO3HWGOSQgnkY9MAnJZTZTrLZt+DJ2opLv/t/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C5apUv9V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jymmjqd9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AE8trgu1431126
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 12:00:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4DLPECZQH/khWur4rvlzIHdP5Pl0LOj0uMKvz2Ew1/w=; b=C5apUv9VaA6lpaH1
	KO30AaVi2i0EK2Nu3MG2bkJLJFrYhZqBPgoNTW7dTeN0QLQV1+I7zmfnU+SkrObE
	tV83rBGTh6JZfPPKpttbgjqraycL5QQFBV/YrMAyxppb6WmOsIQ3UtqxF7Com/np
	rcjCmz4oZq01TSFjtWOHS532BRkJBC1D6fDA2CAFnppo78C3ssV5ucdkYkeLRuLi
	tolA71IlLJcHr5myTUie/ekSebgCbLjfQ/FsNREwSL6GTZKvB45Xqkgfd/ripkg5
	Mi516ps9eFFiEI7xUwEV/RuTC+KbmdqVFafagdTboq86JZos6BGIrIpgh2vHJ5eA
	5aDuwQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9g21j4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 12:00:39 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2954d676f9dso16324525ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 04:00:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763121639; x=1763726439; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4DLPECZQH/khWur4rvlzIHdP5Pl0LOj0uMKvz2Ew1/w=;
        b=jymmjqd9TWrTZyA6LXX0jVK7HzVHdqfF15ai0S1PQuOFHoUlPv0C9WgO+ZaaG3NMZO
         3avyvUfbYOaumibDjzOq+rjjX0NgH+UKTdfDd9nD3gTcErIofSMhSEtDiP/iRxvcCeod
         VOVxNsDzP5a7hFLt3ORN1cX5ayDVccpNnSIs1KU6UmhvLPCO+cDHOF2NQJ6UWv/RACLd
         ir5iqB8oa8DxAi74Q+q3eR4pYfVVV3GqNrJCILQrRlfRhXbz+DRdbDcwb6ipquyiIzHT
         P7cMda0+t+NUZoT/c2pajlCwnlj1DtAzkTJ7wIYBj7QmsWHcBJOI7W0fQE5IJv4YzfBS
         Gs7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763121639; x=1763726439;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4DLPECZQH/khWur4rvlzIHdP5Pl0LOj0uMKvz2Ew1/w=;
        b=stUU9iDXU68aqO7XSkBbXxHnfTujOR3c+e3C86HB0W8SPATgF+Z7jgDIktpxBKZWxE
         hUSVMhSeKpoDDVEu3c5+pd1dWB4FBeTF5VJr0T+KAgQjwVfuCAgdVBlvRlSCBxtXpgJX
         2NmBm/1MjPbtANvRFDc2PJcFG/9qEiax8SrhnBm9Eid+zuOG4dp7mFwKZoCYGcthkXL4
         8dC6wPEXsg0gwuA33OCYdpSxNkB2Ybj9Mk6BzP+cgekcE58u0ahH5R8SGAmfJr5xQnGx
         EblH935rr/W2IFTuXAHri0vcNmYosNnXT3OUJKWEu3+ZjMxMNDpawjTXMTzAZhTIlCfh
         +qcg==
X-Forwarded-Encrypted: i=1; AJvYcCUhocQwGw63/cfLMeJRKAYPsM8+URVEA9JNDfyPzXuKMsdcsWE2qrWGznvzBEvJ41SsSFAmFceMI5oYIPIo@vger.kernel.org
X-Gm-Message-State: AOJu0YwmZJnKQQTsHbwEnUtu4lrd3TnFfn07ikL/gCzPCqHYte64NU/h
	v2DVREmt4/CFhA4Ws3Ui1zYJrYWniUGe2OfHSsMROkrZFhlS2Dvx/4r8TGECeJ3nhCs7LOHNj2a
	wNCsgPWdSpyHDkj4z1Is7jHmxP9WNIdirn3xjsnxRNrMtZaiBQxf+4ZDYLeZH5VNJutXi
X-Gm-Gg: ASbGncsK7njiW6rk7ql6/+1pmOaLwZgcBWrFq24hIqfuhjLxM8utey8cSRUN1hsQEv3
	MXJSet73kLsAw7b+gALIu35HvHkfXcFuNawDQkC9qm3I6IRlWszLpOnshR350Btp7zCy8cEuGbV
	tC9CTAcVNoA+qkW2qjzGJYBpSTY99fJvR0UDMgVpcr0Eei1u5c7ouwbImce7qDLEDJILn6hKCaa
	sNAdvQqAl6E1d4gU2/jQkI0LQBENSiupbw6LmBBBl58LM52+IuuwjyjtO7i8wlrzelkjV1L7bQr
	Bz8qz/mJ8BcXQRMGYHXWH5vqMjJHqiFXKaHWfSxIiWRO40EhNQRkuQEUB1KQkDEiTOmBUTVdTe5
	KITIp1SqFRQO+v4DOEf6wAeE=
X-Received: by 2002:a17:902:ccc3:b0:298:33c9:ed9e with SMTP id d9443c01a7336-2986a73b6f9mr29953355ad.28.1763121638539;
        Fri, 14 Nov 2025 04:00:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFzUH8leg3cJEyWmO2f9+vET2WBdZoPDLVCWtrzI/9fMABfBAcZ6WIX9qxSZRR49c9MNEZAOA==
X-Received: by 2002:a17:902:ccc3:b0:298:33c9:ed9e with SMTP id d9443c01a7336-2986a73b6f9mr29952675ad.28.1763121637765;
        Fri, 14 Nov 2025 04:00:37 -0800 (PST)
Received: from [192.168.1.8] ([106.222.229.203])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c245f8asm53328455ad.37.2025.11.14.04.00.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Nov 2025 04:00:37 -0800 (PST)
Message-ID: <f08c8707-eb72-4689-b53b-acd6e3218836@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 17:30:30 +0530
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
X-Authority-Analysis: v=2.4 cv=L+AQguT8 c=1 sm=1 tr=0 ts=691719e7 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=UUXEStRZTiKyGgBwSCQbmw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=UXIAUNObAAAA:8 a=EUspDBNiAAAA:8
 a=9x9RmpQyoqOX9MKIOEcA:9 a=QEXdDO2ut3YA:10 a=bFq2RbqkfqsA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=sptkURWiP4Gy88Gu7hUp:22 a=a1s67YnXd6TbAZZNj1wK:22
 a=poXaRoVlC6wW9_mwW8W4:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDA5NSBTYWx0ZWRfX9gK2PcCR8rib
 OtDNi2H5QEWSPw1qvP5Vye2NF2XulO4VdBgJfvUpvYXPRJxYR7EMpN+iOmByRsk1qqF0MPWaKZ4
 HArbMI4O9xZSDjjo0mho8tCcm5/qkNRm79Tz/MlIUUzM9bU8KyqjGkPzwMWfAR3t1GWYNpD+QLj
 AmMRM7TN8kA8KQ7gHHS7zyRP9vVVA5g9oWxD08YmkJUkuuFi/6UhDtWk62rsxCugGKAECSWFP3Y
 GOTL6LIGMLAcZoqoXKkhsd+HNY+q95ko1ZUo4aqbwSaLVF8OqEF65OzrX6b5enbxnS7QJUXu0M/
 oUD0xyAEMsrh9CDhW7mBFnb2rxxt/p4+7SziMfWy9cIClArmJMR858w5JwzV2zEjQHnRGKm1qS2
 DAwzvi79hsDDdzVnmhHy6S1PFdbx8Q==
X-Proofpoint-ORIG-GUID: Owng2ty0-uaQQUFtnFphRhq6ZHyQA14T
X-Proofpoint-GUID: Owng2ty0-uaQQUFtnFphRhq6ZHyQA14T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140095

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

Just to confirm, drop only reg-names, but keep 'reg'?

-Akhil

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
> 
> Best regards,
> Krzysztof
> 


