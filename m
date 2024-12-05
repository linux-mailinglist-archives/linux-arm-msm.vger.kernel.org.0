Return-Path: <linux-arm-msm+bounces-40615-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 827249E5E7D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 19:53:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 04E9B1884B0C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 18:53:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1057A22B8D3;
	Thu,  5 Dec 2024 18:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="AdZS+3kp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F47C22B8A1;
	Thu,  5 Dec 2024 18:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733424830; cv=none; b=NbAjH8Sqqg6XqL0qUcL6L7pWihMjAZDMDnyhXWzbeVbf+knwKPtTUoU1QqkPzie6/OuMpUzyKYl4Y4Esd37Ve2JQk5hhKPs/kiO4Jr+S7CqccmyrfEVD4rwcI+V4386B9hbXSvzTQSC05UMjtvtes/5Fnu+w9ZZfmU3o4PF3ZMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733424830; c=relaxed/simple;
	bh=UhlkgQWRZUe442CDk2q6o6VCm/gPaOzM4pDcO6+pmhs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=jSsyLUM42Oe3gACC7HHM8JB3ShRvmxyB3OlUIWjBdvDBI570WVF6i+Cbd/DBQqPdt59zIC0awmcf7TRJH430XE/PcwQvKjfI832MtHLGXh02vknK9OaXuh2ehvAf9ff4Wvgs0au+GD5ABhf9rPMnLqV+HJegWC+tWvfTU8mF5qU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=AdZS+3kp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5HaFOd003711;
	Thu, 5 Dec 2024 18:53:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l+UbAPNGKQuooGCTwCiddX+Dh5NpKdED3hZlIbAnc3U=; b=AdZS+3kpJJWdTxFc
	QWEzajBkN3m6jgrepo5yzLRxBptsYinu7aqITgQB0LrGSvxrxs+9amb2hRiuawNS
	oGMOXUKzvn+gyAu3agbZoOeNc/IJByMo85IpECZRD9MtU13BguFQB+vE4n4B2twD
	6FUls6s2HO/vmAvF0+p4DoPsCqTizoMR9Wuo0gJsJdCAfHh8JeIf0LwdsunJJ1UE
	L5uWWiyy6vP3zxMzJSBGLBt+8invBmVse2Li6RcBzcV3/CaFJQBXBCEoEdEoxjEK
	EoMkqtzsNEDHVn+TXavr93QEqdzDrkAhaHX0b42zFBcFjYrCs38CmhrVxpVGK/0s
	EjwgQA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ba0khf2c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Dec 2024 18:53:29 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B5IrSPG018141
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 5 Dec 2024 18:53:28 GMT
Received: from [10.216.35.7] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 5 Dec 2024
 10:53:21 -0800
Message-ID: <4c1df383-6a0a-4bed-8ece-b582712ca4cf@quicinc.com>
Date: Fri, 6 Dec 2024 00:23:16 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
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
 <9beca099-5cf3-42b5-b1f9-fb1551219b18@quicinc.com>
 <CAF6AEGvAOswFTpS5PHrgCsG_2-QN_Bi4YjZbPpV+r3x=9D2aUQ@mail.gmail.com>
 <d2d8d9e9-74b1-4b05-84a2-dcfa204e6e00@quicinc.com>
 <CAF6AEGtBva41Fz0tS4gRwK21ZqzDH5yGrWLY6TMeS6u7OFfS0Q@mail.gmail.com>
Content-Language: en-US
From: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
In-Reply-To: <CAF6AEGtBva41Fz0tS4gRwK21ZqzDH5yGrWLY6TMeS6u7OFfS0Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: K-8EQ6S21n68Yovjo5RNVE_VUPWT9O_U
X-Proofpoint-GUID: K-8EQ6S21n68Yovjo5RNVE_VUPWT9O_U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 mlxscore=0 bulkscore=0 mlxlogscore=999 spamscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412050139



On 12/4/2024 8:51 PM, Rob Clark wrote:
> On Wed, Dec 4, 2024 at 3:27 AM Bibek Kumar Patro
> <quic_bibekkum@quicinc.com> wrote:
>>
>>
>>
>> On 11/22/2024 10:33 PM, Rob Clark wrote:
>>> On Fri, Nov 22, 2024 at 8:19 AM Bibek Kumar Patro
>>> <quic_bibekkum@quicinc.com> wrote:
>>>>
>>>>
>>>>
>>>> On 11/20/2024 10:47 PM, Rob Clark wrote:
>>>>> On Thu, Nov 14, 2024 at 8:10 AM Bibek Kumar Patro
>>>>> <quic_bibekkum@quicinc.com> wrote:
>>>>>>
>>>>>> Add an adreno-smmu-priv interface for drm/msm to call
>>>>>> into arm-smmu-qcom and initiate the PRR bit setup or reset
>>>>>> sequence as per request.
>>>>>>
>>>>>> This will be used by GPU to setup the PRR bit and related
>>>>>> configuration registers through adreno-smmu private
>>>>>> interface instead of directly poking the smmu hardware.
>>>>>>
>>>>>> Suggested-by: Rob Clark <robdclark@gmail.com>
>>>>>> Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
>>>>>> ---
>>>>>>     drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 37 ++++++++++++++++++++++
>>>>>>     drivers/iommu/arm/arm-smmu/arm-smmu.h      |  2 ++
>>>>>>     include/linux/adreno-smmu-priv.h           | 14 ++++++++
>>>>>>     3 files changed, 53 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>>>>> index d26f5aea248e..0e4f3fbda961 100644
>>>>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>>>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>>>>> @@ -16,6 +16,8 @@
>>>>>>
>>>>>>     #define QCOM_DUMMY_VAL -1
>>>>>>
>>>>>> +#define GFX_ACTLR_PRR          (1 << 5)
>>>>>> +
>>>>>>     static struct qcom_smmu *to_qcom_smmu(struct arm_smmu_device *smmu)
>>>>>>     {
>>>>>>            return container_of(smmu, struct qcom_smmu, smmu);
>>>>>> @@ -99,6 +101,32 @@ static void qcom_adreno_smmu_resume_translation(const void *cookie, bool termina
>>>>>>            arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_RESUME, reg);
>>>>>>     }
>>>>>>
>>>>>> +static void qcom_adreno_smmu_set_prr_bit(const void *cookie, bool set)
>>>>>> +{
>>>>>> +       struct arm_smmu_domain *smmu_domain = (void *)cookie;
>>>>>> +       struct arm_smmu_device *smmu = smmu_domain->smmu;
>>>>>> +       struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
>>>>>> +       u32 reg = 0;
>>>>>> +
>>>>>> +       reg =  arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_ACTLR);
>>>>>> +       reg &= ~GFX_ACTLR_PRR;
>>>>>> +       if (set)
>>>>>> +               reg |= FIELD_PREP(GFX_ACTLR_PRR, 1);
>>>>>> +       arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_ACTLR, reg);
>>>>>> +}
>>>>>> +
>>>>>> +static void qcom_adreno_smmu_set_prr_addr(const void *cookie, phys_addr_t page_addr)
>>>>>> +{
>>>>>> +       struct arm_smmu_domain *smmu_domain = (void *)cookie;
>>>>>> +       struct arm_smmu_device *smmu = smmu_domain->smmu;
>>>>>> +
>>>>>> +       writel_relaxed(lower_32_bits(page_addr),
>>>>>> +                               smmu->base + ARM_SMMU_GFX_PRR_CFG_LADDR);
>>>>>> +
>>>>>> +       writel_relaxed(upper_32_bits(page_addr),
>>>>>> +                               smmu->base + ARM_SMMU_GFX_PRR_CFG_UADDR);
>>>>>> +}
>>>>>> +
>>>>>>     #define QCOM_ADRENO_SMMU_GPU_SID 0
>>>>>>
>>>>>>     static bool qcom_adreno_smmu_is_gpu_device(struct device *dev)
>>>>>> @@ -210,6 +238,7 @@ static bool qcom_adreno_can_do_ttbr1(struct arm_smmu_device *smmu)
>>>>>>     static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
>>>>>>                    struct io_pgtable_cfg *pgtbl_cfg, struct device *dev)
>>>>>>     {
>>>>>> +       const struct device_node *np = smmu_domain->smmu->dev->of_node;
>>>>>>            struct adreno_smmu_priv *priv;
>>>>>>
>>>>>>            smmu_domain->cfg.flush_walk_prefer_tlbiasid = true;
>>>>>> @@ -239,6 +268,14 @@ static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
>>>>>>            priv->get_fault_info = qcom_adreno_smmu_get_fault_info;
>>>>>>            priv->set_stall = qcom_adreno_smmu_set_stall;
>>>>>>            priv->resume_translation = qcom_adreno_smmu_resume_translation;
>>>>>> +       priv->set_prr_bit = NULL;
>>>>>> +       priv->set_prr_addr = NULL;
>>>>>> +
>>>>>> +       if (of_device_is_compatible(np, "qcom,smmu-500") &&
>>>>>> +                       of_device_is_compatible(np, "qcom,adreno-smmu")) {
>>>>>
>>>>> fwiw, it seems like PRR actually works on sc7180, which is _not_
>>>>> mmu-500, so I guess the support actually goes back further.
>>>>>
>>>>
>>>> As I checked sc7180 was on previous variant of SMMU,
>>>> so targets on this variant have different steps to set PRR bit.
>>>> <Do not have both prr bit and PRR page registers>.
>>>
>>> Experimentally, I have to set both the PRR LADDR/UADDR regs and
>>> ACTLR.PRR bit on sc7180 to get the sparse-residency tests passing.  So
>>> the underlying hw seems to work in the same way as mmu-500.  _But_
>>> this is on a sc7180 chromebook, the situation might be different
>>> depending on fw on things that have QC hyp.
>>>
>>
>> I checked on sc7180 chipset which is based on the smmu-v2,
>> this time by looking for these offsets specifically. I can see the
>> nomenclature of the PRR related registers are a bit different
>> compared to MMU-500 variant.
>> Also the implementation register is 64 bit instead of
>> dual 32 bit as in case of MMU-500. and PRR bit is not marked in
>> ACTLR register offset.
> 
> Interesting.. in my experiments it needed both the ACTLR.PRR bit set
> and the LADDR/UADDR.  Maybe it was just happy coincidence that two 32b
> writes worked?
> 

I think it's similar to case we discussed [1] in v11
on why not good idea to use writeq on 32bit regs.
So some corner cases for unaligned 32b addresses might get truncated.

[1]: 
https://lore.kernel.org/all/ae35bf9b-4401-4a99-abd7-c0d9d399a46b@quicinc.com/#:~:text=So%20I%20think-,writeq,-for%2064bit%20write


>> So turns out PRR is supported but with some modification and
>> can be carried out with same compatible based approach only - as per
>> my understanding.
>>
>> In current patch plan was to provide support for MMU-500 based targets
>> and won't break any legacy targets, so we can take the PRR support
>> for legacy targets in different series once our evaluation is done on
>> smmu-v2 ?
> 
> I guess it wouldn't be the end of the world, but it would mean that
> drm would need to expose PRR support to userspace separately from
> sparse binding support.  Maybe we need to do that anyways.  (I'm not
> really sure how many different a6xx+smmu-v2 devices are out there, but
> I guess they are all based on the same generation of snapdragon?)
> 

We would need to audit on all the smmu-v2 based devices using a6xx
version before I can comment on this, but mostly it should be in the 
same generation of snapdragon (scxx/smxx).

Thanks & regards,
bibek

> BR,
> -R
> 
>> We would explore more on this PRR feature for smmu-v2 based targets,
>> before supporting it.
>>
>> Thanks & regards,
>> Bibek
>>
>>>> It's MMU-500 targets only where PRR support is with both PRR bit
>>>> and PRR page addr registers. As I was re-visiting our discussions on v13
>>>> regarding this - I remember that's why we started using the SMMU-
>>>> compatible string based PRR procedure selection instead of the reserved-
>>>> memory node. [1] i.e Based on SMMU variant (as selected by compatible
>>>> string), specific sequence will be selected.
>>>>
>>>> So for now only MMU-500 based selection has been supported as part of
>>>> this series and will add subsequent support for other SMMU-variants
>>>> thereafter.
>>>>
>>>>> I'm curious if we can just rely on this being supported by any hw that
>>>>> has a6xx or newer?
>>>>>
>>>>
>>>> I'd need to check on targets which will be based on a6xx onwards, on
>>>> what will be the procedure planned to support PRR feature. I'll update
>>>> the information over this space.
>>>
>>> One of the open questions about the drm/msm sparse-memory patchset is
>>> whether we need to expose to userspace whether PRR is supported, or if
>>> we can just rely on sparse-binding support implying sparse residency
>>> (ie, PRR) support. All a6xx devices support per-process pgtables,
>>> which is the only requirement for basic sparseBinding support.  But
>>> PRR is required to additionally expose
>>> sparseResidencyBuffer/sparseResidencyImage2D.
>>>
>>> I think, long term, turnip probably will want to drop support for
>>> older kernels and remove support for legacy buffer mapping.  But if we
>>> have some a6xx devices without PRR, then to do that we'd need to
>>> decouple sparse binding and sparse residency.  (Vulkan allows a driver
>>> to expose the former without the latter.)
>>>
>>> BR,
>>> -R
>>>
>>>> [1]:
>>>> https://lore.kernel.org/all/5790afa3-f9c0-4720-9804-8a7ff3d91854@quicinc.com/#:~:text=%3E%20I%20guess%20if,part%20as%20well.
>>>>
>>>> Thanks & regards,
>>>> Bibek
>>>>
>>>>> BR,
>>>>> -R
>>>>>
>>>>>> +               priv->set_prr_bit = qcom_adreno_smmu_set_prr_bit;
>>>>>> +               priv->set_prr_addr = qcom_adreno_smmu_set_prr_addr;
>>>>>> +       }
>>>>>>
>>>>>>            return 0;
>>>>>>     }
>>>>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
>>>>>> index e2aeb511ae90..2dbf3243b5ad 100644
>>>>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
>>>>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
>>>>>> @@ -154,6 +154,8 @@ enum arm_smmu_cbar_type {
>>>>>>     #define ARM_SMMU_SCTLR_M               BIT(0)
>>>>>>
>>>>>>     #define ARM_SMMU_CB_ACTLR              0x4
>>>>>> +#define ARM_SMMU_GFX_PRR_CFG_LADDR     0x6008
>>>>>> +#define ARM_SMMU_GFX_PRR_CFG_UADDR     0x600C
>>>>>>
>>>>>>     #define ARM_SMMU_CB_RESUME             0x8
>>>>>>     #define ARM_SMMU_RESUME_TERMINATE      BIT(0)
>>>>>> diff --git a/include/linux/adreno-smmu-priv.h b/include/linux/adreno-smmu-priv.h
>>>>>> index c637e0997f6d..614665153b3e 100644
>>>>>> --- a/include/linux/adreno-smmu-priv.h
>>>>>> +++ b/include/linux/adreno-smmu-priv.h
>>>>>> @@ -50,6 +50,18 @@ struct adreno_smmu_fault_info {
>>>>>>      *                 the GPU driver must call resume_translation()
>>>>>>      * @resume_translation: Resume translation after a fault
>>>>>>      *
>>>>>> + * *CAUTION* : PRR callbacks (set_prr_bit/set_prr_addr) are NULL terminated for
>>>>>> + *             targets without PRR support. Exercise caution and verify target
>>>>>> + *             capabilities before invoking these callbacks to prevent potential
>>>>>> + *             runtime errors or unexpected behavior.
>>>>>> + *
>>>>>> + * @set_prr_bit:   Extendible interface to be used by GPU to modify the
>>>>>> + *                ACTLR register bits, currently used to configure
>>>>>> + *                Partially-Resident-Region (PRR) bit for feature's
>>>>>> + *                setup and reset sequence as requested.
>>>>>> + * @set_prr_addr:  Configure the PRR_CFG_*ADDR register with the
>>>>>> + *                physical address of PRR page passed from
>>>>>> + *                GPU driver.
>>>>>>      *
>>>>>>      * The GPU driver (drm/msm) and adreno-smmu work together for controlling
>>>>>>      * the GPU's SMMU instance.  This is by necessity, as the GPU is directly
>>>>>> @@ -67,6 +79,8 @@ struct adreno_smmu_priv {
>>>>>>         void (*get_fault_info)(const void *cookie, struct adreno_smmu_fault_info *info);
>>>>>>         void (*set_stall)(const void *cookie, bool enabled);
>>>>>>         void (*resume_translation)(const void *cookie, bool terminate);
>>>>>> +    void (*set_prr_bit)(const void *cookie, bool set);
>>>>>> +    void (*set_prr_addr)(const void *cookie, phys_addr_t page_addr);
>>>>>>     };
>>>>>>
>>>>>>     #endif /* __ADRENO_SMMU_PRIV_H */
>>>>>> --
>>>>>> 2.34.1
>>>>>>
>>>>
>>


