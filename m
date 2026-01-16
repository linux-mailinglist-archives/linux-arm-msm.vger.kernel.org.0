Return-Path: <linux-arm-msm+bounces-89396-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 42504D31A18
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 14:15:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BC9033000DCD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 13:15:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1582923FC54;
	Fri, 16 Jan 2026 13:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uTK8Sny2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE39C23D7F7;
	Fri, 16 Jan 2026 13:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768569307; cv=none; b=EL7F78oP/7iy3KRNN4KFASkmnYZEYbp+KNLBxBgdRQ7pMrviUrQTf1Zxm2+h50lzHos0INyMEVINxXvPmAlnfBMPo8pIRu4VtTxhjo3HlXxxK0hIJAcK1yHxTc5XQhT4XgQ1MvE6mWtHT078DhMGw3F3N//XLoeNeHaZ9qlwGTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768569307; c=relaxed/simple;
	bh=lemSNLJq0q0WrTxFXNntL4UfBhjsMGUXFL6M5acURZk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DV9EduNZN5AqQskgMeDPNNfipsbJ/BemvG3x/Dc7cCy9q3AclRhCr4xryZcnAz92KWcPmEcHn3eL/PRM6gQlaCTmJpMXslcs/ylOe4vrAUWAOtppM4lQvWve9aq5eoXXIezm2Gw7YfrXBGAOc+4fPqeZ3Y/DM3AvhEGF/1cRdNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uTK8Sny2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE166C116C6;
	Fri, 16 Jan 2026 13:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768569307;
	bh=lemSNLJq0q0WrTxFXNntL4UfBhjsMGUXFL6M5acURZk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=uTK8Sny2Wcgu0sn3rdx+j4aXaEB7fGQJ0hCKXJbqP445lqeCvgPULWQpekynMtPtb
	 /TH0ulz62fxkK4W07otBoLAdMO9LJe3d7UtAqX4rCQzh+iRhrVB5EKYd31jJx017YI
	 UKMPkISyat0utnxRlV1FAWHbQD/lCgm4C5I3uhGA1IBytg0EvU9K6adroeeY3k7poQ
	 dRNcsvVFgFSNemylJk18AibhfxY7b7altypjFPA79OyHeoMhMvzxwPmA8+Fn4IR+wT
	 I7cWXbuhm9ody+s3E2KraDj/0s3kKU18WNv7Mcyxebilb4nRdGklgE3ZfhL/NHNhXp
	 TQDWkRrP2PQRA==
Message-ID: <6020af2a-5baa-4594-8cbc-bf7241f0128e@kernel.org>
Date: Fri, 16 Jan 2026 14:15:02 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: display: msm: qcm2290-mdss: Fix
 iommus property
To: Sumit Garg <sumit.garg@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, akhilpo@oss.qualcomm.com,
 vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com,
 robin.clark@oss.qualcomm.com, lumag@kernel.org,
 loic.poulain@oss.qualcomm.com, jorge.ramirez@oss.qualcomm.com,
 linux-kernel@vger.kernel.org, Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20260116062004.237356-1-sumit.garg@kernel.org>
 <20260116062004.237356-2-sumit.garg@kernel.org>
 <20260116-transparent-dexterous-nightingale-c029cb@quoll>
 <aWo0t1EoVhStmOj7@sumit-xelite>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <aWo0t1EoVhStmOj7@sumit-xelite>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/01/2026 13:53, Sumit Garg wrote:
> On Fri, Jan 16, 2026 at 09:46:54AM +0100, Krzysztof Kozlowski wrote:
>> On Fri, Jan 16, 2026 at 11:50:02AM +0530, Sumit Garg wrote:
>>> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
>>>
>>> Fix IOMMU DT propety for display via dropping SMMU stream IDs which
>>> relates to secure context bank. Assigning Linux kernel (HLOS) VMID
>>> to secure context bank stream IDs is incorrect.
>>>
>>> The min value is added for iommus property to ensure in future when
>>> secure context bank stream IDs are properly supported then the iommus
>>> property is extensible.
>>>
>>> These DT bindings changes should be backwards compatible.
>>>
>>> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
>>> ---
>>>  .../devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml   | 5 ++---
>>>  1 file changed, 2 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
>>> index f0cdb5422688..5c888f07bc0b 100644
>>> --- a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
>>> +++ b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
>>> @@ -33,6 +33,7 @@ properties:
>>>        - const: core
>>>  
>>>    iommus:
>>> +    minItems: 1
>>
>> Same comment as other changes like that, which I already gave guideline
>> - you need to list the items (minItems stay), because you now claim the
>> order matters and is strictly defined.
> 
> Not sure if I claimed that order matters now but rather the secure bank
> stream IDs were incorrectly represented earlier in the DT.

The code claims this by saying that one specific entry is allowed, so
that entry is somehow distinctive, special, different than the other entry.

> 
> There has been ongoing disscusion related to how stream ID associated
> with different translation context can be represented in DT here [1].
> With that only the secure bank stream IDs can be properly represented.
> 
> Here I just followed the approach taken by Adreno GPU bindings for the
> iommus property [2].
> 
> [2] Documentation/devicetree/bindings/display/msm/gpu.yaml +82

Such justifications are pointless. What about commit msg which explains
why this was added? What about entire public discussion happening with
this patch? What about all previous revisions of that patch and
discussions leading to this piece of code? So you just found few lines
of code, ignored entire background and any other arguments, and copied
it here.

That's the approach - I found a piece of some buggy code, so I can do
the same.

Again, we discussed it 2-3 months ago for the same patch and I gave
exactly same reason why this patch is incomplete.


Best regards,
Krzysztof

