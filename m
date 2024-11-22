Return-Path: <linux-arm-msm+bounces-38868-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 844D69D6212
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 17:21:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 442A02810DB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 16:21:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA6CC1DFD81;
	Fri, 22 Nov 2024 16:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="eDNy4mdT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D676F30C;
	Fri, 22 Nov 2024 16:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732292430; cv=none; b=uCwD9W/Du5Xg329XBXdnb0yGBFhmpSBBtJC/l9qyfw2xY6MHaW42NG3zcO4QhuLnHOSWzESqAVSemGNZG3xcT0TtMbLmnsxpg8677rdgXfa1Ky1nedIcLIUPRSI4q12Ul/XKyXmUYM0LMD6ne2xCCh0K/ovLqZ2o3Yme6PAmcDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732292430; c=relaxed/simple;
	bh=X7g1a+sf2rHnBA+qNLfyggOHT5AGhqtmKOwWFZeLsQ4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:CC:References:
	 In-Reply-To:Content-Type; b=jgiU+I18ZVIqCXiGPPd4am7zRR5XBZaIGvMzZvitr0nM6RF9HKnbQQ6pBRXMCXUyBiDd6tn9ftF5+kb3OAWwraippQAiU2nQPpEEORxjaRObgx+ffGrowsVPw4oo/bzryjUvD9AaqWC0u63SVL551wjQsm+7lNdG2U4RQX6MFic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=eDNy4mdT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AMCXXtp005030;
	Fri, 22 Nov 2024 16:20:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8SIR2kRK3C2T+NtCN30bWcwKcjNSWtzBpjKPvXMD/A8=; b=eDNy4mdT9Qk/COGy
	7kkT5rDD6jFixybv6/g2AZYVzhwhd3FJ+aHzGXCLDcaG5YkqQWrDdNLUAGtNNcJV
	0A0qzm0GUfykIN+XlJq5Ty7qQPqPYn/duxzakqfQzoFsYWAnbEb4Sc7ha7PjSgB4
	dNBCFoacCOF/dwJQf0ZBlhEcEGNCOXzG/twGsQYeFE9Ka47i8CMfW0YzVsinTgWf
	Kxj5+A0OyjMcHYSELPD6rn70RSzsx24uTctFageebTxfdAXjA+91Xxf+uqODy7+x
	aZB/sA0f9NXrqUgk+ZFMk4Wlz3Z2GYq5nLTaKW08r/PKwfv4s4aCM6BsnGLGifSS
	8n2g4A==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 431ea77fxf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 16:20:10 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AMGK9hI019301
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 16:20:09 GMT
Received: from [10.218.27.127] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 22 Nov
 2024 08:20:04 -0800
Message-ID: <5696afa2-c4ab-42fe-b29a-6ecee622fbb4@quicinc.com>
Date: Fri, 22 Nov 2024 21:50:01 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
Subject: Re: [PATCH RESEND v17 3/5] iommu/arm-smmu: add support for PRR bit
 setup
To: Rob Clark <robdclark@gmail.com>
CC: <will@kernel.org>, <robin.murphy@arm.com>, <joro@8bytes.org>,
        <jgg@ziepe.ca>, <jsnitsel@redhat.com>, <robh@kernel.org>,
        <krzysztof.kozlowski@linaro.org>, <quic_c_gdjako@quicinc.com>,
        <dmitry.baryshkov@linaro.org>, <iommu@lists.linux.dev>,
        <linux-arm-msm@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Connor Abbott <cwabbott0@gmail.com>,
        "Rob
 Clark" <robdclark@chromium.org>
References: <20241114160721.1527934-1-quic_bibekkum@quicinc.com>
 <20241114160721.1527934-4-quic_bibekkum@quicinc.com>
 <CAF6AEGuwWsAkRyF-h5Aj3KzM7iksb12HsfJ5Ks+-P8hv60MWFg@mail.gmail.com>
 <CAF6AEGvVteuOOMod6yw9_6eOn2PxAx+BR8sVOHAHp7Ts8XigBw@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAF6AEGvVteuOOMod6yw9_6eOn2PxAx+BR8sVOHAHp7Ts8XigBw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: cka76lyLpvKigEh1sA0mMpD69E_0TB1t
X-Proofpoint-ORIG-GUID: cka76lyLpvKigEh1sA0mMpD69E_0TB1t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 bulkscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1011
 priorityscore=1501 impostorscore=0 malwarescore=0 mlxlogscore=999
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411220137



On 11/21/2024 3:40 AM, Rob Clark wrote:
> On Wed, Nov 20, 2024 at 9:17 AM Rob Clark <robdclark@gmail.com> wrote:
>>
>> On Thu, Nov 14, 2024 at 8:10 AM Bibek Kumar Patro
>> <quic_bibekkum@quicinc.com> wrote:
>>>
>>> Add an adreno-smmu-priv interface for drm/msm to call
>>> into arm-smmu-qcom and initiate the PRR bit setup or reset
>>> sequence as per request.
>>>
>>> This will be used by GPU to setup the PRR bit and related
>>> configuration registers through adreno-smmu private
>>> interface instead of directly poking the smmu hardware.
>>>
>>> Suggested-by: Rob Clark <robdclark@gmail.com>
>>> Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
>>> ---
>>>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 37 ++++++++++++++++++++++
>>>   drivers/iommu/arm/arm-smmu/arm-smmu.h      |  2 ++
>>>   include/linux/adreno-smmu-priv.h           | 14 ++++++++
>>>   3 files changed, 53 insertions(+)
>>>
>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>> index d26f5aea248e..0e4f3fbda961 100644
>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>> @@ -16,6 +16,8 @@
>>>
>>>   #define QCOM_DUMMY_VAL -1
>>>
>>> +#define GFX_ACTLR_PRR          (1 << 5)
>>> +
>>>   static struct qcom_smmu *to_qcom_smmu(struct arm_smmu_device *smmu)
>>>   {
>>>          return container_of(smmu, struct qcom_smmu, smmu);
>>> @@ -99,6 +101,32 @@ static void qcom_adreno_smmu_resume_translation(const void *cookie, bool termina
>>>          arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_RESUME, reg);
>>>   }
>>>
>>> +static void qcom_adreno_smmu_set_prr_bit(const void *cookie, bool set)
>>> +{
>>> +       struct arm_smmu_domain *smmu_domain = (void *)cookie;
>>> +       struct arm_smmu_device *smmu = smmu_domain->smmu;
>>> +       struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
>>> +       u32 reg = 0;
>>> +
>>> +       reg =  arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_ACTLR);
>>> +       reg &= ~GFX_ACTLR_PRR;
>>> +       if (set)
>>> +               reg |= FIELD_PREP(GFX_ACTLR_PRR, 1);
>>> +       arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_ACTLR, reg);
>>> +}
>>> +
>>> +static void qcom_adreno_smmu_set_prr_addr(const void *cookie, phys_addr_t page_addr)
>>> +{
>>> +       struct arm_smmu_domain *smmu_domain = (void *)cookie;
>>> +       struct arm_smmu_device *smmu = smmu_domain->smmu;
>>> +
>>> +       writel_relaxed(lower_32_bits(page_addr),
>>> +                               smmu->base + ARM_SMMU_GFX_PRR_CFG_LADDR);
>>> +
>>> +       writel_relaxed(upper_32_bits(page_addr),
>>> +                               smmu->base + ARM_SMMU_GFX_PRR_CFG_UADDR);
>>> +}
>>> +
>>>   #define QCOM_ADRENO_SMMU_GPU_SID 0
>>>
>>>   static bool qcom_adreno_smmu_is_gpu_device(struct device *dev)
>>> @@ -210,6 +238,7 @@ static bool qcom_adreno_can_do_ttbr1(struct arm_smmu_device *smmu)
>>>   static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
>>>                  struct io_pgtable_cfg *pgtbl_cfg, struct device *dev)
>>>   {
>>> +       const struct device_node *np = smmu_domain->smmu->dev->of_node;
>>>          struct adreno_smmu_priv *priv;
>>>
>>>          smmu_domain->cfg.flush_walk_prefer_tlbiasid = true;
>>> @@ -239,6 +268,14 @@ static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
>>>          priv->get_fault_info = qcom_adreno_smmu_get_fault_info;
>>>          priv->set_stall = qcom_adreno_smmu_set_stall;
>>>          priv->resume_translation = qcom_adreno_smmu_resume_translation;
>>> +       priv->set_prr_bit = NULL;
>>> +       priv->set_prr_addr = NULL;
>>> +
>>> +       if (of_device_is_compatible(np, "qcom,smmu-500") &&
>>> +                       of_device_is_compatible(np, "qcom,adreno-smmu")) {
>>
>> fwiw, it seems like PRR actually works on sc7180, which is _not_
>> mmu-500, so I guess the support actually goes back further.
>>
>> I'm curious if we can just rely on this being supported by any hw that
>> has a6xx or newer?
> 
> 
> Also, unrelated, but we can't assume the smmu is powered when drm
> driver calls set_prr_bit/addr, could you add in runpm get/put around
> the register access?
> 

I see, thanks for this observation.
It's surely a possible case, when they access these registers
SMMU state is off.
I will add the suggested runpm ops around the register access.

> Otherwise Conner and I have vk sparse residency working now
> 

Sorry, could not get this. Did you mean that vk sparse residency
is working now using this patch?

Thanks & regards,
Bibek

> BR,
> -R
> 
>>
>>> +               priv->set_prr_bit = qcom_adreno_smmu_set_prr_bit;
>>> +               priv->set_prr_addr = qcom_adreno_smmu_set_prr_addr;
>>> +       }
>>>
>>>          return 0;
>>>   }
>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
>>> index e2aeb511ae90..2dbf3243b5ad 100644
>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
>>> @@ -154,6 +154,8 @@ enum arm_smmu_cbar_type {
>>>   #define ARM_SMMU_SCTLR_M               BIT(0)
>>>
>>>   #define ARM_SMMU_CB_ACTLR              0x4
>>> +#define ARM_SMMU_GFX_PRR_CFG_LADDR     0x6008
>>> +#define ARM_SMMU_GFX_PRR_CFG_UADDR     0x600C
>>>
>>>   #define ARM_SMMU_CB_RESUME             0x8
>>>   #define ARM_SMMU_RESUME_TERMINATE      BIT(0)
>>> diff --git a/include/linux/adreno-smmu-priv.h b/include/linux/adreno-smmu-priv.h
>>> index c637e0997f6d..614665153b3e 100644
>>> --- a/include/linux/adreno-smmu-priv.h
>>> +++ b/include/linux/adreno-smmu-priv.h
>>> @@ -50,6 +50,18 @@ struct adreno_smmu_fault_info {
>>>    *                 the GPU driver must call resume_translation()
>>>    * @resume_translation: Resume translation after a fault
>>>    *
>>> + * *CAUTION* : PRR callbacks (set_prr_bit/set_prr_addr) are NULL terminated for
>>> + *             targets without PRR support. Exercise caution and verify target
>>> + *             capabilities before invoking these callbacks to prevent potential
>>> + *             runtime errors or unexpected behavior.
>>> + *
>>> + * @set_prr_bit:   Extendible interface to be used by GPU to modify the
>>> + *                ACTLR register bits, currently used to configure
>>> + *                Partially-Resident-Region (PRR) bit for feature's
>>> + *                setup and reset sequence as requested.
>>> + * @set_prr_addr:  Configure the PRR_CFG_*ADDR register with the
>>> + *                physical address of PRR page passed from
>>> + *                GPU driver.
>>>    *
>>>    * The GPU driver (drm/msm) and adreno-smmu work together for controlling
>>>    * the GPU's SMMU instance.  This is by necessity, as the GPU is directly
>>> @@ -67,6 +79,8 @@ struct adreno_smmu_priv {
>>>       void (*get_fault_info)(const void *cookie, struct adreno_smmu_fault_info *info);
>>>       void (*set_stall)(const void *cookie, bool enabled);
>>>       void (*resume_translation)(const void *cookie, bool terminate);
>>> +    void (*set_prr_bit)(const void *cookie, bool set);
>>> +    void (*set_prr_addr)(const void *cookie, phys_addr_t page_addr);
>>>   };
>>>
>>>   #endif /* __ADRENO_SMMU_PRIV_H */
>>> --
>>> 2.34.1
>>>


