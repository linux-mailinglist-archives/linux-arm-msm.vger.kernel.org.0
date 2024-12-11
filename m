Return-Path: <linux-arm-msm+bounces-41484-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D299ECD33
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 14:30:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6B1CC1887A35
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 13:30:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D3741A8408;
	Wed, 11 Dec 2024 13:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BD7CQapi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C3481E50B;
	Wed, 11 Dec 2024 13:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733923836; cv=none; b=P1ZJVFCDPR7p2u61Xfj91hXwsvoxsljTUbx/5IiOPwLJaQMqQ5uJXmXTB8rRBjViaFB42FosqudzPvKNwFzIPtuCZgR51yahW2sZSmXWeetpMDGaj/9UW4HXYRPqwZ+FlNXXllC41IA8e3mPhrK6rPZE4Ir46X/S8GyMBlc6DmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733923836; c=relaxed/simple;
	bh=sZolB+hyxd+Tn6GmddRZW5DgLBKU2O0+/zBfxy7lwnw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ZGt5XcXC6uMFuSJuVKv3dfdcHFvuM8CRS+IsfUnpBDqg6ATwzp7m/jiawMqUYxwVrPA/UJUX+T10vEIaAU9J6xDvu+yBxjjIfzepwddhK/uFukynMCjCgTqUGVKIMlmX+yTivfXlAAkzS+0f82RZTM7xch9X52bNjb6usvaDKgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BD7CQapi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BBAokQT006981;
	Wed, 11 Dec 2024 13:30:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bKfCGkIy6fwUHFExaZAO4tE5i1TvOXOvWfVt9fRPnhc=; b=BD7CQapicUXvJZnd
	ozngj2Bklnt3htEaY691nQ9L/HzEXuRqX1G7whLSP18xhD4W0GUztzV4u8TozxA0
	MiWf7MovGBrIq7jkPvh2wd1Qy4viZCztJdz7sSfed9mei4cgvL4pZx19ZQuDXOHR
	PH83GvmmH1PjYbtaPoa2aJWs8LiwDMKBCHFxPb4pZyl2LTxfiGASZ9f+CjrXL6c/
	T5UOnqBn8WPGzRDwC1nnGjj/g+2JrZkPvlH6acQvp4HK/qq21wOosa5+rD/jufP/
	+1hPmZFgCpQUZ+jrFqiuZuQXzbB23F6nMuh24XRhsIKJjBr81mUPLkksEpH853uZ
	79z1Jw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43f0r9t1nb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Dec 2024 13:30:13 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BBDUCuj001364
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Dec 2024 13:30:12 GMT
Received: from [10.219.56.190] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 11 Dec
 2024 05:30:08 -0800
Message-ID: <738f9dc8-0fe4-47e9-b3ff-f19f2f5badb8@quicinc.com>
Date: Wed, 11 Dec 2024 18:59:48 +0530
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
 <CAF6AEGvVteuOOMod6yw9_6eOn2PxAx+BR8sVOHAHp7Ts8XigBw@mail.gmail.com>
 <5696afa2-c4ab-42fe-b29a-6ecee622fbb4@quicinc.com>
 <CAF6AEGuMmdnOmATMy8f+YgGxfrYb5mkG_qgy870wZPebKaZjVQ@mail.gmail.com>
 <04da6036-56c4-4b8c-b75b-b5e96a089efc@quicinc.com>
 <CAF6AEGt-e_4kGyfiO=_oCLX8E3z76zeZ2MbRe1GicZj4hTEu+g@mail.gmail.com>
 <808e1041-0d61-4ee8-9778-0f9b7d0fb719@quicinc.com>
 <CAF6AEGtyc+_2V6qoZCwvRQ_QcC+uCXFXcWRpsQemEfd+rC6R+A@mail.gmail.com>
Content-Language: en-US
From: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
In-Reply-To: <CAF6AEGtyc+_2V6qoZCwvRQ_QcC+uCXFXcWRpsQemEfd+rC6R+A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: oaa2kCTwYGAmsE1PLEDqHOJw06TCW06u
X-Proofpoint-GUID: oaa2kCTwYGAmsE1PLEDqHOJw06TCW06u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015 mlxlogscore=999
 malwarescore=0 lowpriorityscore=0 mlxscore=0 bulkscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412110098



On 12/6/2024 8:48 PM, Rob Clark wrote:
> On Fri, Dec 6, 2024 at 4:36 AM Bibek Kumar Patro
> <quic_bibekkum@quicinc.com> wrote:
>>
>>
>>
>> On 12/4/2024 8:54 PM, Rob Clark wrote:
>>> On Wed, Dec 4, 2024 at 3:28 AM Bibek Kumar Patro
>>> <quic_bibekkum@quicinc.com> wrote:
>>>>
>>>>
>>>>
>>>> On 11/22/2024 10:04 PM, Rob Clark wrote:
>>>>> On Fri, Nov 22, 2024 at 8:20 AM Bibek Kumar Patro
>>>>> <quic_bibekkum@quicinc.com> wrote:
>>>>>>
>>>>>>
>>>>>>
>>>>>> On 11/21/2024 3:40 AM, Rob Clark wrote:
>>>>>>> On Wed, Nov 20, 2024 at 9:17 AM Rob Clark <robdclark@gmail.com> wrote:
>>>>>>>>
>>>>>>>> On Thu, Nov 14, 2024 at 8:10 AM Bibek Kumar Patro
>>>>>>>> <quic_bibekkum@quicinc.com> wrote:
>>>>>>>>>
>>>>>>>>> Add an adreno-smmu-priv interface for drm/msm to call
>>>>>>>>> into arm-smmu-qcom and initiate the PRR bit setup or reset
>>>>>>>>> sequence as per request.
>>>>>>>>>
>>>>>>>>> This will be used by GPU to setup the PRR bit and related
>>>>>>>>> configuration registers through adreno-smmu private
>>>>>>>>> interface instead of directly poking the smmu hardware.
>>>>>>>>>
>>>>>>>>> Suggested-by: Rob Clark <robdclark@gmail.com>
>>>>>>>>> Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
>>>>>>>>> ---
>>>>>>>>>      drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 37 ++++++++++++++++++++++
>>>>>>>>>      drivers/iommu/arm/arm-smmu/arm-smmu.h      |  2 ++
>>>>>>>>>      include/linux/adreno-smmu-priv.h           | 14 ++++++++
>>>>>>>>>      3 files changed, 53 insertions(+)
>>>>>>>>>
>>>>>>>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>>>>>>>> index d26f5aea248e..0e4f3fbda961 100644
>>>>>>>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>>>>>>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>>>>>>>> @@ -16,6 +16,8 @@
>>>>>>>>>
>>>>>>>>>      #define QCOM_DUMMY_VAL -1
>>>>>>>>>
>>>>>>>>> +#define GFX_ACTLR_PRR          (1 << 5)
>>>>>>>>> +
>>>>>>>>>      static struct qcom_smmu *to_qcom_smmu(struct arm_smmu_device *smmu)
>>>>>>>>>      {
>>>>>>>>>             return container_of(smmu, struct qcom_smmu, smmu);
>>>>>>>>> @@ -99,6 +101,32 @@ static void qcom_adreno_smmu_resume_translation(const void *cookie, bool termina
>>>>>>>>>             arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_RESUME, reg);
>>>>>>>>>      }
>>>>>>>>>
>>>>>>>>> +static void qcom_adreno_smmu_set_prr_bit(const void *cookie, bool set)
>>>>>>>>> +{
>>>>>>>>> +       struct arm_smmu_domain *smmu_domain = (void *)cookie;
>>>>>>>>> +       struct arm_smmu_device *smmu = smmu_domain->smmu;
>>>>>>>>> +       struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
>>>>>>>>> +       u32 reg = 0;
>>>>>>>>> +
>>>>>>>>> +       reg =  arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_ACTLR);
>>>>>>>>> +       reg &= ~GFX_ACTLR_PRR;
>>>>>>>>> +       if (set)
>>>>>>>>> +               reg |= FIELD_PREP(GFX_ACTLR_PRR, 1);
>>>>>>>>> +       arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_ACTLR, reg);
>>>>>>>>> +}
>>>>>>>>> +
>>>>>>>>> +static void qcom_adreno_smmu_set_prr_addr(const void *cookie, phys_addr_t page_addr)
>>>>>>>>> +{
>>>>>>>>> +       struct arm_smmu_domain *smmu_domain = (void *)cookie;
>>>>>>>>> +       struct arm_smmu_device *smmu = smmu_domain->smmu;
>>>>>>>>> +
>>>>>>>>> +       writel_relaxed(lower_32_bits(page_addr),
>>>>>>>>> +                               smmu->base + ARM_SMMU_GFX_PRR_CFG_LADDR);
>>>>>>>>> +
>>>>>>>>> +       writel_relaxed(upper_32_bits(page_addr),
>>>>>>>>> +                               smmu->base + ARM_SMMU_GFX_PRR_CFG_UADDR);
>>>>>>>>> +}
>>>>>>>>> +
>>>>>>>>>      #define QCOM_ADRENO_SMMU_GPU_SID 0
>>>>>>>>>
>>>>>>>>>      static bool qcom_adreno_smmu_is_gpu_device(struct device *dev)
>>>>>>>>> @@ -210,6 +238,7 @@ static bool qcom_adreno_can_do_ttbr1(struct arm_smmu_device *smmu)
>>>>>>>>>      static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
>>>>>>>>>                     struct io_pgtable_cfg *pgtbl_cfg, struct device *dev)
>>>>>>>>>      {
>>>>>>>>> +       const struct device_node *np = smmu_domain->smmu->dev->of_node;
>>>>>>>>>             struct adreno_smmu_priv *priv;
>>>>>>>>>
>>>>>>>>>             smmu_domain->cfg.flush_walk_prefer_tlbiasid = true;
>>>>>>>>> @@ -239,6 +268,14 @@ static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
>>>>>>>>>             priv->get_fault_info = qcom_adreno_smmu_get_fault_info;
>>>>>>>>>             priv->set_stall = qcom_adreno_smmu_set_stall;
>>>>>>>>>             priv->resume_translation = qcom_adreno_smmu_resume_translation;
>>>>>>>>> +       priv->set_prr_bit = NULL;
>>>>>>>>> +       priv->set_prr_addr = NULL;
>>>>>>>>> +
>>>>>>>>> +       if (of_device_is_compatible(np, "qcom,smmu-500") &&
>>>>>>>>> +                       of_device_is_compatible(np, "qcom,adreno-smmu")) {
>>>>>>>>
>>>>>>>> fwiw, it seems like PRR actually works on sc7180, which is _not_
>>>>>>>> mmu-500, so I guess the support actually goes back further.
>>>>>>>>
>>>>>>>> I'm curious if we can just rely on this being supported by any hw that
>>>>>>>> has a6xx or newer?
>>>>>>>
>>>>>>>
>>>>>>> Also, unrelated, but we can't assume the smmu is powered when drm
>>>>>>> driver calls set_prr_bit/addr, could you add in runpm get/put around
>>>>>>> the register access?
>>>>>>>
>>>>>>
>>>>>> I see, thanks for this observation.
>>>>>> It's surely a possible case, when they access these registers
>>>>>> SMMU state is off.
>>>>>> I will add the suggested runpm ops around the register access.
>>>>>>
>>>>>>> Otherwise Conner and I have vk sparse residency working now
>>>>>>>
>>>>>>
>>>>>> Sorry, could not get this. Did you mean that vk sparse residency
>>>>>> is working now using this patch?
>>>>>
>>>>> Yes, vk sparse residency is working with this patch (plus addition of
>>>>> runpm get/put, plus drm/msm patches plus turnip patches) ;-)
>>>>>
>>>>
>>>> Thanks for testing the sparse residency feature with our patch Rob,
>>>> I have an additional query regarding the adreno private interfaces.
>>>> Specifically, I was referring to other interfaces such as
>>>> qcom_adreno_smmu_get_fault_info [1]. It appears that we do not have a
>>>> runpm get/put around the register access in this context.
>>>
>>> get_fault_info() is called from the iommu fault handler callback, so
>>> from the fault irq handler, which is why it didn't need the runpm
>>> get/put.  Maybe it is bad to make this assumption about usage, but
>>> then again adreno_smmu_priv isn't really a general purpose interface.
>>>
>>
>> Ah okay, got it.
>> I was just going through all the adreno_smmmu_priv interfaces just
>> to get a better understanding of it's interaction with smmu and it seems
>> like apart from PRR and get_fault_info(), set_ttbr0_cfg(),
>> resume_translation() is also having reg access but not voting.
>> Should we put runpm_put/get here as well or these can be excluded.
>> <Just curious about the thought process behind this, is it because of
>> some sequence when to put a vote, like reg access in middle of smmu
>> power cycle and not in beginning or end.>
> 
> I think we just haven't needed it, or noticed that we needed it,
> outside of setting up prr.
> 
> As I mentioned, get_fault_info() is called from the fault irq, so we
> know the smmu is already powered.
> 

okay got it, that makes sense.

> As far as set_ttbr0_cfg(), it probably works just because
> arm_smmu_write_context_bank() ends up getting called again in the
> resume path, so if the smmu is suspended when set_ttbr0_cfg() is
> called, the writes just get ignored.  But the updated cfg is
> re-applied to the hw when it is resumed.  Probably the same situation
> with resume_translation().. ie. if the smmu is suspended there are no
> translations to resume.
> 
> Maybe it would be more correct in set_ttbr0_cfg() and
> resume_translation() to do a pm_runtime_get_if_in_use() and skip the
> hw writes if the smmu is suspended.
> 
>>
>>>> Could you please clarify whether we need an SMMU vote around register
>>>> access in the case of PRR? IMO, should the users of this callback ensure
>>>> they put a vote before accessing the cb?
>>>
>>> How can drm vote for the smmu device?  I guess it could power up
>>> itself and rely on device-link.. but that is pretty overkill to power
>>> up the entire gpu in this case.  I think it is best for the vote to
>>> happen in the PRR callbacks.
>>>
>>
>> Okay I see, GPU can only power itself up through <gpu_state_get I
>> assume> but won't have exclusive access to power on the smmu only.
>>
>> Incase we go forward to put vote in PRR callback for SMMU, I was
>> planning that we can refactor existing arm_smmu_rpm_put/get() from
>> arm_smmu.c to it's header file so that the same can be used in
>> arm_smmu_qcom.c ? What's your thoughts on this?
> 
> I had briefly thought of doing the same.  But the main reason for
> those helpers is common arm-smmu code that is used on non-qcom
> platforms where runpm is not enabled.  In arm-smmu-qcom.c, we know
> that runpm is enabled, so we could just use  return
> pm_runtime_resume_and_get()/pm_runtime_put_autosuspend() directly.
> 

Ohkay I see, we then do not need pm_runtime_enabled() check for qcom 
platforms before putting the vote.
I am currently modifying this patch only to directly add
pm_runtime_resume_and_get()/pm_runtime_put_autosuspend()
around the register access of PRR related adreno private interfaces.
I will send this updated patch as part of v18 shortly.

Additionally, we can evaluate the use of pm_runtime operations for 
set_ttbr0_cfg() and resume_translation() in a separate series ?

Thanks & regards,
Bibek

> BR,
> -R
> 
>> Thanks & regards,
>> Bibek
>>
>>> BR,
>>> -R
>>>
>>>> [1]:
>>>> https://lore.kernel.org/all/20210610214431.539029-1-robdclark@gmail.com/
>>>>
>>>> Thanks & regards,
>>>> Bibek
>>>>
>>>>> BR,
>>>>> -R
>>>>>
>>>>>> Thanks & regards,
>>>>>> Bibek
>>>>>>
>>>>>>> BR,
>>>>>>> -R
>>>>>>>
>>>>>>>>
>>>>>>>>> +               priv->set_prr_bit = qcom_adreno_smmu_set_prr_bit;
>>>>>>>>> +               priv->set_prr_addr = qcom_adreno_smmu_set_prr_addr;
>>>>>>>>> +       }
>>>>>>>>>
>>>>>>>>>             return 0;
>>>>>>>>>      }
>>>>>>>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
>>>>>>>>> index e2aeb511ae90..2dbf3243b5ad 100644
>>>>>>>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
>>>>>>>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
>>>>>>>>> @@ -154,6 +154,8 @@ enum arm_smmu_cbar_type {
>>>>>>>>>      #define ARM_SMMU_SCTLR_M               BIT(0)
>>>>>>>>>
>>>>>>>>>      #define ARM_SMMU_CB_ACTLR              0x4
>>>>>>>>> +#define ARM_SMMU_GFX_PRR_CFG_LADDR     0x6008
>>>>>>>>> +#define ARM_SMMU_GFX_PRR_CFG_UADDR     0x600C
>>>>>>>>>
>>>>>>>>>      #define ARM_SMMU_CB_RESUME             0x8
>>>>>>>>>      #define ARM_SMMU_RESUME_TERMINATE      BIT(0)
>>>>>>>>> diff --git a/include/linux/adreno-smmu-priv.h b/include/linux/adreno-smmu-priv.h
>>>>>>>>> index c637e0997f6d..614665153b3e 100644
>>>>>>>>> --- a/include/linux/adreno-smmu-priv.h
>>>>>>>>> +++ b/include/linux/adreno-smmu-priv.h
>>>>>>>>> @@ -50,6 +50,18 @@ struct adreno_smmu_fault_info {
>>>>>>>>>       *                 the GPU driver must call resume_translation()
>>>>>>>>>       * @resume_translation: Resume translation after a fault
>>>>>>>>>       *
>>>>>>>>> + * *CAUTION* : PRR callbacks (set_prr_bit/set_prr_addr) are NULL terminated for
>>>>>>>>> + *             targets without PRR support. Exercise caution and verify target
>>>>>>>>> + *             capabilities before invoking these callbacks to prevent potential
>>>>>>>>> + *             runtime errors or unexpected behavior.
>>>>>>>>> + *
>>>>>>>>> + * @set_prr_bit:   Extendible interface to be used by GPU to modify the
>>>>>>>>> + *                ACTLR register bits, currently used to configure
>>>>>>>>> + *                Partially-Resident-Region (PRR) bit for feature's
>>>>>>>>> + *                setup and reset sequence as requested.
>>>>>>>>> + * @set_prr_addr:  Configure the PRR_CFG_*ADDR register with the
>>>>>>>>> + *                physical address of PRR page passed from
>>>>>>>>> + *                GPU driver.
>>>>>>>>>       *
>>>>>>>>>       * The GPU driver (drm/msm) and adreno-smmu work together for controlling
>>>>>>>>>       * the GPU's SMMU instance.  This is by necessity, as the GPU is directly
>>>>>>>>> @@ -67,6 +79,8 @@ struct adreno_smmu_priv {
>>>>>>>>>          void (*get_fault_info)(const void *cookie, struct adreno_smmu_fault_info *info);
>>>>>>>>>          void (*set_stall)(const void *cookie, bool enabled);
>>>>>>>>>          void (*resume_translation)(const void *cookie, bool terminate);
>>>>>>>>> +    void (*set_prr_bit)(const void *cookie, bool set);
>>>>>>>>> +    void (*set_prr_addr)(const void *cookie, phys_addr_t page_addr);
>>>>>>>>>      };
>>>>>>>>>
>>>>>>>>>      #endif /* __ADRENO_SMMU_PRIV_H */
>>>>>>>>> --
>>>>>>>>> 2.34.1
>>>>>>>>>
>>>>>>
>>>>
>>


