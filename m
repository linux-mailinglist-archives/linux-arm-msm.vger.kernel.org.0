Return-Path: <linux-arm-msm+bounces-28975-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 111DB956B51
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Aug 2024 14:57:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 87F64B2100F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Aug 2024 12:57:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4FF316BE0A;
	Mon, 19 Aug 2024 12:57:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4062916131C;
	Mon, 19 Aug 2024 12:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724072240; cv=none; b=cVVsuaMU/qFc8tmoGjDIYYPNfPLzstvYaBTI98tBOJRj08Bpm0z+cutLubnuyJ1zMBNYlVxCum2U8kQLn0AA3TSS91v1h00UN/UVHU8mN5yU4QCmdpZx0+EIUZIh3tECjGNgb8SC7IGnYCIn+Rvukqjelnhh7xlzFE67qBPD3NM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724072240; c=relaxed/simple;
	bh=lakgPcIw7qUBbL2ZLM0qTThrZs/JFj0UeFbwr+dhzj0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wc+byZuWG8mnK15QvHuv5Csz0OR11pmEDyl1mz9sWawBzUfs0aQ6PuvQNfkCXkGby732exZFqY/kZzZC/Zvm1fRLWSiYQ0Uc8diW/6drfQzcqDyHD2O1gCv2GFgb8JbGlx9yJ1fflCYNlVlnCyLRpTgL9sysJV2olVvTc4DAfa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8F910339;
	Mon, 19 Aug 2024 05:57:42 -0700 (PDT)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 87BB83F73B;
	Mon, 19 Aug 2024 05:57:14 -0700 (PDT)
Message-ID: <17893776-9666-4bbe-b5fc-c3fe977d0337@arm.com>
Date: Mon, 19 Aug 2024 13:57:12 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: arm-smmu: Add
 qcom,last-ctx-bank-reserved
To: Marc Gonzalez <mgonzalez@freebox.fr>, Rob Herring <robh@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, Will Deacon <will@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, iommu@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Arnaud Vrac <avrac@freebox.fr>,
 Pierre-Hugues Husson <phhusson@freebox.fr>,
 Marijn Suijten <marijn.suijten@somainline.org>
References: <20240814-smmu-v1-0-3d6c27027d5b@freebox.fr>
 <20240814-smmu-v1-1-3d6c27027d5b@freebox.fr>
 <20240818152515.GA104481-robh@kernel.org>
 <30489eee-075b-461b-ab43-c8807d667630@freebox.fr>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <30489eee-075b-461b-ab43-c8807d667630@freebox.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/08/2024 12:37 pm, Marc Gonzalez wrote:
> On 18/08/2024 17:25, Rob Herring wrote:
> 
>> On Wed, Aug 14, 2024 at 03:59:55PM +0200, Marc Gonzalez wrote:
>>
>>> On qcom msm8998, writing to the last context bank of lpass_q6_smmu
>>> (base address 0x05100000) produces a system freeze & reboot.
>>>
>>> Specifically, here:
>>>
>>> 	qsmmu->bypass_cbndx = smmu->num_context_banks - 1;
>>> 	arm_smmu_cb_write(smmu, qsmmu->bypass_cbndx, ARM_SMMU_CB_SCTLR, 0);
>>>
>>> and here:
>>>
>>> 	arm_smmu_write_context_bank(smmu, i);
>>> 	arm_smmu_cb_write(smmu, i, ARM_SMMU_CB_FSR, ARM_SMMU_CB_FSR_FAULT);
>>>
>>> It is likely that FW reserves the last context bank for its own use,
>>> thus a simple work-around would be: DON'T USE IT in Linux.
>>>
>>> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
>>> ---
>>>   Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 6 ++++++
>>>   1 file changed, 6 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>>> index 280b4e49f2191..f9b23aef351b0 100644
>>> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>>> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>>> @@ -204,6 +204,12 @@ properties:
>>>         access to SMMU configuration registers. In this case non-secure aliases of
>>>         secure registers have to be used during SMMU configuration.
>>>   
>>> +  qcom,last-ctx-bank-reserved:
>>> +    type: boolean
>>> +    description:
>>> +      FW reserves the last context bank of this SMMU for its own use.
>>> +      If Linux tries to use it, Linux gets nuked.
>>
>> How is this Qualcomm specific? Presumably any implementation could do
>> this if there's no way to properly partition things. Robin?
> 
> Obviously, there is nothing Qualcomm specific about reserving
> an SMMU context bank for the FW / hypervisor, other than it
> appears that qcom is the first to do it; or at least the
> LPASS SMMU on qcom msm8998 is the first known SMMU where such
> a work-around is required.

Yes, the Qualcomm-specific aspect is that it's Qualcomm's hypervisor 
which is broken and reporting a larger number in its emulated 
SMMU_IDR1.NUMCB than the number of context banks it's actually willing 
to emulate.

> What is the correct nomenclature?
> 
> Can we just drop the vendor prefix if a property is generic
> across vendors? But does it require a subsystem prefix like
> "iommu" in order to not clash with generic props in other subsystems?

I guess if we *were* to consider a generic property to endorse violating 
the SMMU architecture, then it would logically be vendored to Arm as the 
owner of the SMMU architecture. However I am strongly against that idea, 
not only because I obviously don't want to normalise hypervisors 
emulating non-architectural behaviour which every DT-consuming OS will 
have to understand how to work around, but it's also less than great for 
the user to have a workaround that's not compatible with existing DTBs.

Luckily, in this case it seems straightforward enough to be able to see 
that if we have a "qcom,msm8996-smmu-v2" with 13 context banks then we 
should just treat it as if it has 12 - it's also notable that it only 
reports NUMSMRG=12, so we couldn't use more than that many S1 context 
banks at once anyway.

Thanks,
Robin.

>> Also, this property isn't very flexible. What happens when it is not the
>> last bank or more than 1 bank reserved? This should probably be a mask
>> instead.
> 
> OK, I'm getting conflicting requests here.
> 
> Bjorn has recommended dropping the property altogether:
> 
>> It also seems, as the different SMMUs in this platform behave
>> differently it might be worth giving them further specific compatibles,
>> in which case we could just check if it's the qcom,msm8998-lpass-smmu,
>> instead of inventing a property for this quirk.
> 
> 
> I'll send a patch series in line with Bjorn's request.
> 
> Regards
> 

