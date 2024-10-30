Return-Path: <linux-arm-msm+bounces-36451-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C118A9B63D7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 14:15:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DD6521C2095E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 13:15:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EC9D224EA;
	Wed, 30 Oct 2024 13:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Nrcb2qem"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 177604C70;
	Wed, 30 Oct 2024 13:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730294133; cv=none; b=BxU2l8tmx40lqw3n7eLUhSDCeo7EgBg/FtTzzN2vx1MksIQns3A7e3RghKkjEeHpaLvHLKySgWbFtpNPkIr/HTjm1yU3Zo+Q/sdVvJA9SJyo4L1XLzTECuUiFNF596glKiexoeL67NtLoIlpgg0QDBWGgqPOVzUpRIbosjSs5e4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730294133; c=relaxed/simple;
	bh=g3Kudg5s2OoJX9ugDcOOuSscq4wxGYE3GAIl+D14X0Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ud1k8AUgiPyJJ8kXSUxY7WEz34C2RW9VnQ3w6kAut1m+QBrbKOCpWbiKgtDEEnrKtVbQlEFffGpDwYRPep8l75dHUlXK4Kp9zfLZRM8nDJTqnOKcOaattUQkeX5GMPGQbQpvbhC+XOxpzeSf46vFcaRbhxwIaV2PW2SzwDYbFDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Nrcb2qem; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49UAGdiR003518;
	Wed, 30 Oct 2024 13:15:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L01krVP3z9rM5ag6/AUOhX5ue+SUlImtX///jvB79ho=; b=Nrcb2qemhgrr4WiG
	AvgXlC0NeNaHpN3mXNXhywvVoYT3uuSgKvs0+uXdyZDhcUpTcy3W6FKLOOj8QxvT
	XsFhD2NBVfRKG19z7G8x4RSuy9PFilFoHFqBfCA+9cOjw4pN5fXyPvg0xjpYAUQa
	cyHnhbSLZ0HLOGhNgSq7tgwyAcOE/KRxmqtLe7tZXXHnqF3VHKq/yy6azS57UNcB
	VpW78zQtHFiGRAiFuLsoQq4+feUJ1Yzp57mm+EyiKJdAsXQixMUw1u7L/4+u9M/n
	E7vXoFMXiY55QC8tqcgWIy2r/0fAO1sOuN0OGug4QiRYFvtSOnI3XpxZvCSMSD2a
	YQbJ7Q==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42gp4e49x9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Oct 2024 13:15:12 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49UDFCk9014871
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Oct 2024 13:15:12 GMT
Received: from [10.214.66.253] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 30 Oct
 2024 06:14:28 -0700
Message-ID: <531d0144-e027-4589-b4ef-79f02583df8b@quicinc.com>
Date: Wed, 30 Oct 2024 18:44:01 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 3/5] iommu/arm-smmu: add support for PRR bit setup
To: Robin Murphy <robin.murphy@arm.com>, <robdclark@gmail.com>,
        <will@kernel.org>, <joro@8bytes.org>, <jgg@ziepe.ca>,
        <jsnitsel@redhat.com>, <robh@kernel.org>,
        <krzysztof.kozlowski@linaro.org>, <quic_c_gdjako@quicinc.com>,
        <dmitry.baryshkov@linaro.org>
CC: <iommu@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20241008125410.3422512-1-quic_bibekkum@quicinc.com>
 <20241008125410.3422512-4-quic_bibekkum@quicinc.com>
 <2d651f1b-4f51-4984-903f-7f5a14151f84@arm.com>
Content-Language: en-US
From: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
In-Reply-To: <2d651f1b-4f51-4984-903f-7f5a14151f84@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: y90caqi81YViAChCh_u5QQ9iVQPcYj5P
X-Proofpoint-GUID: y90caqi81YViAChCh_u5QQ9iVQPcYj5P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 mlxlogscore=999 clxscore=1015 spamscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0
 mlxscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410300104



On 10/29/2024 6:59 PM, Robin Murphy wrote:
> On 2024-10-08 1:54 pm, Bibek Kumar Patro wrote:
>> Add an adreno-smmu-priv interface for drm/msm to call
>> into arm-smmu-qcom and initiate the PRR bit setup or reset
>> sequence as per request.
>>
>> This will be used by GPU to setup the PRR bit and related
>> configuration registers through adreno-smmu private
>> interface instead of directly poking the smmu hardware.
>>
>> Suggested-by: Rob Clark <robdclark@gmail.com>
>> Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
>> ---
>>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 37 ++++++++++++++++++++++
>>   drivers/iommu/arm/arm-smmu/arm-smmu.h      |  2 ++
>>   include/linux/adreno-smmu-priv.h           | 10 +++++-
>>   3 files changed, 48 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/ 
>> iommu/arm/arm-smmu/arm-smmu-qcom.c
>> index 6e0a2a43e45a..38ac9cab763b 100644
>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>> @@ -25,6 +25,7 @@
>>
>>   #define CPRE            (1 << 1)
>>   #define CMTLB            (1 << 0)
>> +#define GFX_ACTLR_PRR        (1 << 5)
>>
>>   static struct qcom_smmu *to_qcom_smmu(struct arm_smmu_device *smmu)
>>   {
>> @@ -109,6 +110,40 @@ static void 
>> qcom_adreno_smmu_resume_translation(const void *cookie, bool termina
>>       arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_RESUME, reg);
>>   }
>>
>> +static void qcom_adreno_smmu_set_prr_bit(const void *cookie, bool set)
>> +{
>> +    struct arm_smmu_domain *smmu_domain = (void *)cookie;
>> +    struct arm_smmu_device *smmu = smmu_domain->smmu;
>> +    const struct device_node *np = smmu->dev->of_node;
>> +    struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
>> +    u32 reg = 0;
>> +
>> +    if (of_device_is_compatible(np, "qcom,smmu-500") &&
>> +            of_device_is_compatible(np, "qcom,adreno-smmu")) {
> 
> These conditions aren't going to change between calls - wouldn't it make 
> more sense to conditionally assign the callbacks in the first place? Not 
> the biggest deal if this is a one-off context-setup type thing, just 
> that it looks a little funky.
> 

Let me know if you want to pursue this still.
 From the current PRR implementation in the graphics
vendor layer, this seems to be just setup kind-of thing.
Also if we keep this conditional check before assigning callbacks,
and vendor layer caller won't be having any such check,
wouldn't it be an issue in unsupported platforms (!qcom,smmu-500 or 
!qcom,adreno-smmu)
as the callbacks won't be assigned?
So as per my understanding I think it would be safe to keep the 
condition check here?

Thanks & regards,
Bibek


> Thanks,
> Robin.
> 
>> +        reg =  arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_ACTLR);
>> +        reg &= ~GFX_ACTLR_PRR;
>> +        if (set)
>> +            reg |= FIELD_PREP(GFX_ACTLR_PRR, 1);
>> +        arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_ACTLR, reg);
>> +    }
>> +}
>> +
>> +static void qcom_adreno_smmu_set_prr_addr(const void *cookie, 
>> phys_addr_t page_addr)
>> +{
>> +    struct arm_smmu_domain *smmu_domain = (void *)cookie;
>> +    struct arm_smmu_device *smmu = smmu_domain->smmu;
>> +    const struct device_node *np = smmu->dev->of_node;
>> +
>> +    if (of_device_is_compatible(np, "qcom,smmu-500") &&
>> +            of_device_is_compatible(np, "qcom,adreno-smmu")) {
>> +        writel_relaxed(lower_32_bits(page_addr),
>> +                    smmu->base + ARM_SMMU_GFX_PRR_CFG_LADDR);
>> +
>> +        writel_relaxed(upper_32_bits(page_addr),
>> +                    smmu->base + ARM_SMMU_GFX_PRR_CFG_UADDR);
>> +    }
>> +}
>> +
>>   #define QCOM_ADRENO_SMMU_GPU_SID 0
>>
>>   static bool qcom_adreno_smmu_is_gpu_device(struct device *dev)
>> @@ -249,6 +284,8 @@ static int qcom_adreno_smmu_init_context(struct 
>> arm_smmu_domain *smmu_domain,
>>       priv->get_fault_info = qcom_adreno_smmu_get_fault_info;
>>       priv->set_stall = qcom_adreno_smmu_set_stall;
>>       priv->resume_translation = qcom_adreno_smmu_resume_translation;
>> +    priv->set_prr_bit = qcom_adreno_smmu_set_prr_bit;
>> +    priv->set_prr_addr = qcom_adreno_smmu_set_prr_addr;
>>
>>       return 0;
>>   }
>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/ 
>> arm/arm-smmu/arm-smmu.h
>> index e2aeb511ae90..2dbf3243b5ad 100644
>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
>> @@ -154,6 +154,8 @@ enum arm_smmu_cbar_type {
>>   #define ARM_SMMU_SCTLR_M        BIT(0)
>>
>>   #define ARM_SMMU_CB_ACTLR        0x4
>> +#define ARM_SMMU_GFX_PRR_CFG_LADDR    0x6008
>> +#define ARM_SMMU_GFX_PRR_CFG_UADDR    0x600C
>>
>>   #define ARM_SMMU_CB_RESUME        0x8
>>   #define ARM_SMMU_RESUME_TERMINATE    BIT(0)
>> diff --git a/include/linux/adreno-smmu-priv.h b/include/linux/adreno- 
>> smmu-priv.h
>> index c637e0997f6d..03466eb16933 100644
>> --- a/include/linux/adreno-smmu-priv.h
>> +++ b/include/linux/adreno-smmu-priv.h
>> @@ -49,7 +49,13 @@ struct adreno_smmu_fault_info {
>>    *                 before set_ttbr0_cfg().  If stalling on fault is 
>> enabled,
>>    *                 the GPU driver must call resume_translation()
>>    * @resume_translation: Resume translation after a fault
>> - *
>> + * @set_prr_bit:   Extendible interface to be used by GPU to modify the
>> + *           ACTLR register bits, currently used to configure
>> + *           Partially-Resident-Region (PRR) bit for feature's
>> + *           setup and reset sequence as requested.
>> + * @set_prr_addr:  Configure the PRR_CFG_*ADDR register with the
>> + *           physical address of PRR page passed from
>> + *           GPU driver.
>>    *
>>    * The GPU driver (drm/msm) and adreno-smmu work together for 
>> controlling
>>    * the GPU's SMMU instance.  This is by necessity, as the GPU is 
>> directly
>> @@ -67,6 +73,8 @@ struct adreno_smmu_priv {
>>       void (*get_fault_info)(const void *cookie, struct 
>> adreno_smmu_fault_info *info);
>>       void (*set_stall)(const void *cookie, bool enabled);
>>       void (*resume_translation)(const void *cookie, bool terminate);
>> +    void (*set_prr_bit)(const void *cookie, bool set);
>> +    void (*set_prr_addr)(const void *cookie, phys_addr_t page_addr);
>>   };
>>
>>   #endif /* __ADRENO_SMMU_PRIV_H */
>> -- 
>> 2.34.1
>>


