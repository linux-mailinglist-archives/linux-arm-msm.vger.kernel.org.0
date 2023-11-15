Return-Path: <linux-arm-msm+bounces-708-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C30A7EC65E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Nov 2023 15:53:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F0C9EB20A6F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Nov 2023 14:53:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 196862EAFC;
	Wed, 15 Nov 2023 14:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571F12C871
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Nov 2023 14:53:09 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 107678E;
	Wed, 15 Nov 2023 06:53:08 -0800 (PST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 706491FB;
	Wed, 15 Nov 2023 06:53:53 -0800 (PST)
Received: from [10.57.83.164] (unknown [10.57.83.164])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E01893F641;
	Wed, 15 Nov 2023 06:53:05 -0800 (PST)
Message-ID: <c75d107a-44cb-4df3-b583-13719df1f8be@arm.com>
Date: Wed, 15 Nov 2023 14:53:04 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] iommu/arm-smmu: introduction of ACTLR for custom
 prefetcher settings
Content-Language: en-GB
To: Bibek Kumar Patro <quic_bibekkum@quicinc.com>, will@kernel.org,
 joro@8bytes.org, dmitry.baryshkov@linaro.org, a39.skl@gmail.com,
 konrad.dybcio@linaro.org, quic_pkondeti@quicinc.com, quic_molvera@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 qipl.kernel.upstream@quicinc.com
References: <20231114135654.30475-1-quic_bibekkum@quicinc.com>
 <20231114135654.30475-2-quic_bibekkum@quicinc.com>
 <372885ab-b24d-44ae-afb8-76755bcd6e21@arm.com>
 <40282b6e-9524-4a88-97ca-3ce890317279@quicinc.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <40282b6e-9524-4a88-97ca-3ce890317279@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2023-11-15 1:54 pm, Bibek Kumar Patro wrote:
> 
>>> @@ -467,6 +505,9 @@ static struct arm_smmu_device 
>>> *qcom_smmu_create(struct arm_smmu_device *smmu,
>>>       qsmmu->smmu.impl = impl;
>>>       qsmmu->cfg = data->cfg;
>>>
>>> +    if (data->actlrcfg && (data->actlrcfg->size))
>>> +        qsmmu->actlrcfg = data->actlrcfg;
>>
>> Do we really need to replicate multiple parts of the data, or would it 
>> be sensible to just replace qsmmu->cfg with qsmmu->data and handle the 
>> further dereferences in the places that want them?
>>
> 
> Mm, could not understand this properly. :( Could you help explain more 
> please?
> As per my understanding aren't data and qsmmu different structures.
> qcom_smmu is a superset of arm_smmu housing additonal properties
> and qcom_smmu_match_data is kind of a superset of arm_smmu_impl with
> additional specific implmentations, so both needs to be in place?
> Apologies if I understood your statement incorrectly.

My point is that the data is static and constant, so there's really no 
point storing multiple pointers into different bits of it. So rather than:

	qsmmu->cfg = data->cfg;
	qssmu->actlrcfg = data->actlrcfg;
	...
	do_something(qsmmu->cfg);
	...
	do_other_thing(qsmmu->actlrcfg);

we can just store the one pointer and have:

	qsmmu->data = data;
	...
	do_something(qsmmu->data->cfg);
	...
	do_other_thing(qsmmu->data->actlrcfg);

Thanks,
Robin.

>>> +
>>>       return &qsmmu->smmu;
>>>   }
>>>
>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h 
>>> b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
>>> index 593910567b88..4b6862715070 100644
>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
>>> @@ -9,6 +9,7 @@
>>>   struct qcom_smmu {
>>>       struct arm_smmu_device smmu;
>>>       const struct qcom_smmu_config *cfg;
>>> +    const struct actlr_config *actlrcfg;
>>>       bool bypass_quirk;
>>>       u8 bypass_cbndx;
>>>       u32 stall_enabled;
>>> @@ -25,6 +26,7 @@ struct qcom_smmu_config {
>>>   };
>>>

