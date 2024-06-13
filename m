Return-Path: <linux-arm-msm+bounces-22556-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6160B906641
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 10:12:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F343B2824F2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 08:12:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE15B13CAA7;
	Thu, 13 Jun 2024 08:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GnrufG/1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C1513D249;
	Thu, 13 Jun 2024 08:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718266318; cv=none; b=SdqFTC/mECDDcV6kw2TB6KUAl6SqZxJnmiwTYqnpKzxWQYJsrZMkSRfjBPu3cPZq8ecxqfLcOHtuRAPSwfl/+9gi01TyIPaz61DvRFKcqL3SFqXUwkRzKEte4sX7jlUKOAq5roW3JlCbX8hcBrkB0Z2xCJg7DUYyAnqquvA7DTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718266318; c=relaxed/simple;
	bh=8l0OMC12UUyhkBHdUQRWVhs10suXAXmzNXsCYwvKaPs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=qwjJM1AExc2jcrO5TGBTHDmc6ib+Adam1oJtTljOz7tPSme/V5d9RaibVmmiz8CIoSNEy3TQe6qnQZJ4YihR6HbQV/YWM9c3eZznuZKm5tOiNWwVXe9mF896WEfGi0iYdT0yLTN/CaZzYA1DLdmFN8GZWM1IWxktqDdF/cKFOwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GnrufG/1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45CKnIea022423;
	Thu, 13 Jun 2024 08:11:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vIlSnBNEBBbsU7gugO4FJYIKtbEdcbvH7S+qMNNt41k=; b=GnrufG/1zqtlfkiR
	QJl1TzRrFiOp7aZJWMOnrl4GUW6pfWTqfqKZgKNvVszFxywAywcFUr+N53vm7F6U
	g5dENsvmzRu+T5EoKKNmf8oE6CMATz8Q6xGlVkmEe5cOGW2iG/gvq75UPOkeHAGy
	eNEfCwQfXQv+I8hHzk2At7aGPvtfRi/vt5lbl2KsX2IUtH7U/wAnqYHgFui1KwwR
	ojtANJXNJhRNBOi46zqbv2zJfutV59pxohtJID8q4AX5hysY/OSl2nRr0aOXB4sL
	WnNjVjePRHBWZ+ulBWkQ/n1VYIp3tkJCqP39m7laUF9LllSUfMjCua1NAiSO0U9M
	g7KidQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yq4s8knuu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Jun 2024 08:11:22 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45D8BLGL008978
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Jun 2024 08:11:21 GMT
Received: from [10.214.66.253] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 13 Jun
 2024 01:11:16 -0700
Message-ID: <ae35bf9b-4401-4a99-abd7-c0d9d399a46b@quicinc.com>
Date: Thu, 13 Jun 2024 13:41:08 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 6/6] iommu/arm-smmu: add support for PRR bit setup
To: Rob Clark <robdclark@gmail.com>
CC: <will@kernel.org>, <robin.murphy@arm.com>, <joro@8bytes.org>,
        <jgg@ziepe.ca>, <jsnitsel@redhat.com>, <robh@kernel.org>,
        <krzysztof.kozlowski@linaro.org>, <quic_c_gdjako@quicinc.com>,
        <dmitry.baryshkov@linaro.org>, <konrad.dybcio@linaro.org>,
        <iommu@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20240605121713.3596499-1-quic_bibekkum@quicinc.com>
 <20240605121713.3596499-7-quic_bibekkum@quicinc.com>
 <CAF6AEGtSCfQVtNTmwB4Jkec5rDmZsr59z2717H76kwWu0wovsw@mail.gmail.com>
Content-Language: en-US
From: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
In-Reply-To: <CAF6AEGtSCfQVtNTmwB4Jkec5rDmZsr59z2717H76kwWu0wovsw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: qU1PuMKS8gJixTxLBo6AO3Zrjc8uUC-6
X-Proofpoint-ORIG-GUID: qU1PuMKS8gJixTxLBo6AO3Zrjc8uUC-6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-12_12,2024-06-13_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 spamscore=0 mlxscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 mlxlogscore=999 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406130057



On 6/12/2024 12:32 AM, Rob Clark wrote:
> On Wed, Jun 5, 2024 at 5:18 AM Bibek Kumar Patro
> <quic_bibekkum@quicinc.com> wrote:
>>
>> Add an adreno-smmu-priv interface for drm/msm to call
>> into arm-smmu-qcom and initiate the PRR bit setup or reset
>> sequence as per request.
>>
>> This will be used by GPU side to setup the PRR bit and
>> related configuration registers through adreno-smmu private
>> interface instead of directly poking the smmu hardware.
>>
>> Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
>> ---
>>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 21 +++++++++++++++++++++
>>   drivers/iommu/arm/arm-smmu/arm-smmu.h      |  2 ++
>>   include/linux/adreno-smmu-priv.h           |  5 ++++-
>>   3 files changed, 27 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>> index 8dabc26fa10e..2f4ee22f740a 100644
>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>> @@ -28,6 +28,7 @@
>>   #define PREFETCH_SHALLOW       (1 << PREFETCH_SHIFT)
>>   #define PREFETCH_MODERATE      (2 << PREFETCH_SHIFT)
>>   #define PREFETCH_DEEP          (3 << PREFETCH_SHIFT)
>> +#define GFX_ACTLR_PRR          (1 << 5)
>>
>>   static const struct actlr_config sc7280_apps_actlr_cfg[] = {
>>          { 0x0800, 0x24e1, PREFETCH_DEFAULT | CMTLB },
>> @@ -212,6 +213,25 @@ static void qcom_adreno_smmu_resume_translation(const void *cookie, bool termina
>>          arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_RESUME, reg);
>>   }
>>
>> +static void qcom_adreno_smmu_set_actlr_bit(const void *cookie, phys_addr_t page_addr, bool set)
>> +{
> 
> _set_actlr_bit() is a bit more of an implementation detail.  Maybe
> _set_prr() would be a better name?
> 

Yes set_prr sounds more explanatory. Infact Initially planned to name it 
as set_actlr_prr() but later changed it to set_actlr_bit() so to keep 
this interface extendible.
Incase if gfx driver in future wants to control some other ACTLR bit as
well along with PRR bit, then we can extend this same interface to
handle other bits.
So any additional adreno-smmu-priv interface would note be needed, and
set_actlr_bit can itself be used for gfx handling of all required ACTLR 
bits.
I think we can name it set_actlr_prr() for now, and later can change the 
name incase we extend it. What's your thought on this?

> Also, the version of this patch that I typed up (but haven't sent to
> list yet) took a `struct page *` instead of a phys_addr_t.. passing
> NULL would disable PRR, so I didn't need the third arg
> 
>> +       struct arm_smmu_domain *smmu_domain = (void *)cookie;
>> +       struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
>> +       struct arm_smmu_device *smmu = smmu_domain->smmu;
>> +       u32 reg = 0;
>> +
>> +       writel_relaxed(lower_32_bits(page_addr),
>> +                               (void *)smmu->ioaddr + ARM_SMMU_GFX_PRR_CFG_LADDR);
>> +
>> +       writel_relaxed(upper_32_bits(page_addr),
>> +                               (void *)smmu->ioaddr + ARM_SMMU_GFX_PRR_CFG_UADDR);
> 
> I know downstream writes it as upper+lower, but I'd guess we could
> just writeq, couldn't we?
> 

Actually ARM_SMMU_GFX_PRR_CFG_LADDR, ARM_SMMU_GFX_PRR_CFG_UADDR both are 
separate 32 bit registers. So I think writeq for 64bit write might not 
work, as these are not 64 bit registers nor these two are separated by 
64 aligned address.

>> +
>> +       reg =  arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_ACTLR);
>> +       reg |= FIELD_PREP(GFX_ACTLR_PRR, set ? 1 : 0);
> 
> this won't clear the ENABLE_PRR bit if we try to disable it after
> enabling (unless this bit is read-as-zero
> 

Ah okay right, got it. Thanks for pointing this out.
Will take care of this in next version.
will use set/reset in side if() instead with different
bitwise ops for set and reset.


> Also, can we give a name to PRR?  I'm guessing it is something like
> physical-range-remap?

Yes sure. I checked on this, PRR here actually stands for 
partially-resident-region.
So would be better If we add expansion for PRR in a comment ?
Because if we expand PRR in variables/defines then wouldn't
the names become too long?

Thanks & regards,
Bibek

> 
> BR,
> -R
> 
>> +       arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_ACTLR, reg);
>> +
>> +}
>> +
>>   #define QCOM_ADRENO_SMMU_GPU_SID 0
>>
>>   static bool qcom_adreno_smmu_is_gpu_device(struct device *dev)
>> @@ -384,6 +404,7 @@ static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
>>          priv->get_fault_info = qcom_adreno_smmu_get_fault_info;
>>          priv->set_stall = qcom_adreno_smmu_set_stall;
>>          priv->resume_translation = qcom_adreno_smmu_resume_translation;
>> +       priv->set_actlr_bit = qcom_adreno_smmu_set_actlr_bit;
>>
>>          actlrvar = qsmmu->data->actlrvar;
>>          if (!actlrvar)
>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
>> index d9c2ef8c1653..3076bef49e20 100644
>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
>> @@ -154,6 +154,8 @@ enum arm_smmu_cbar_type {
>>   #define ARM_SMMU_SCTLR_M               BIT(0)
>>
>>   #define ARM_SMMU_CB_ACTLR              0x4
>> +#define ARM_SMMU_GFX_PRR_CFG_LADDR     0x6008
>> +#define ARM_SMMU_GFX_PRR_CFG_UADDR     0x600C
>>
>>   #define ARM_SMMU_CB_RESUME             0x8
>>   #define ARM_SMMU_RESUME_TERMINATE      BIT(0)
>> diff --git a/include/linux/adreno-smmu-priv.h b/include/linux/adreno-smmu-priv.h
>> index c637e0997f6d..448e191eeb52 100644
>> --- a/include/linux/adreno-smmu-priv.h
>> +++ b/include/linux/adreno-smmu-priv.h
>> @@ -49,7 +49,9 @@ struct adreno_smmu_fault_info {
>>    *                 before set_ttbr0_cfg().  If stalling on fault is enabled,
>>    *                 the GPU driver must call resume_translation()
>>    * @resume_translation: Resume translation after a fault
>> - *
>> + * @set_actlr_bits: Extendible interface to be used  by GPU to modify the
>> + *                 ACTLR bits, currently used to intitate PRR bit setup or
>> + *                 reset sequence for ACTLR registers as requested.
>>    *
>>    * The GPU driver (drm/msm) and adreno-smmu work together for controlling
>>    * the GPU's SMMU instance.  This is by necessity, as the GPU is directly
>> @@ -67,6 +69,7 @@ struct adreno_smmu_priv {
>>       void (*get_fault_info)(const void *cookie, struct adreno_smmu_fault_info *info);
>>       void (*set_stall)(const void *cookie, bool enabled);
>>       void (*resume_translation)(const void *cookie, bool terminate);
>> +    void (*set_actlr_bit)(const void *cookie, phys_addr_t page_addr, bool set);
>>   };
>>
>>   #endif /* __ADRENO_SMMU_PRIV_H */
>> --
>> 2.34.1
>>

