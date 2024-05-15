Return-Path: <linux-arm-msm+bounces-19884-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 48DC28C6826
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 May 2024 16:01:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 67E061C21D67
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 May 2024 14:01:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B3A613F432;
	Wed, 15 May 2024 13:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="eEiXG3Qq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB83D13EFE1;
	Wed, 15 May 2024 13:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715781595; cv=none; b=SNl0xr/ZF36T8QCqzqPGLqzSl04qFFgVip0YgqM+H2R5oFGp03gVfIEGm5GgUlWNPJkFyGhFhykeFusEVgOFsmy+5asFF61VJ0T9rcQQwRF1S7rUWauKSzXOeoFYQajT85h7TxUZlhtkPPqbh3S7esMFnXD4wQyjsOEfy/eQSBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715781595; c=relaxed/simple;
	bh=HI9sEg2PY5gK9l089T6Qt71BxAKgWbrwXUQv/RxqEuA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=UGpsBv6YI/YCFmF//2B8keWcc7+DZ5JpNQF9/eexBei5wybGMVacQ2E/8Kirt5qsqgem1dYdTcI+SwGoRb23HyOBqyqWu2BzLjvsLzJrp/ezU3WIdNoI9jcHaUWKC2WMK/OC5C9vF82Kdbma8Qa6hlrcxqo7tkNdfVrpbzajAHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=eEiXG3Qq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44F913K9015135;
	Wed, 15 May 2024 13:59:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=MAMUx9Kpg2hnXKCzFKYPnEF7sx/vhFkFZuHYF4l76K4=; b=eE
	iXG3Qq9FUxta/ZXZhtNWe35eWl2qN7QL+mbEN2WN7JGHUETQDGtea8TsxcST9QpI
	QdgPoqqH/ZX12mZxLPIeRWValf7TVwG2msJ06dR23WUm7GNMjtI5sPvXKS8x0qvj
	Szezi+Z7/T8oDfIZBi/tdgVetL0p4nnXtTQh1BoskxmtF0xHUDJkqBgd2lgVelL3
	M7hRUSuZ+RnTZU1K8EgqzLb1GJbqlD76RW2SkArTaDcLJ3goloQgL42UwX6dLcQ9
	/D6wPLHslic746EpgSodYSVEX+fu6EZvs+538ZNK3wghc9PtiLMxKtTpcn54G5Cv
	WzSvybxOmDD/GcXGiafg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y20w211w7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 May 2024 13:59:23 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44FDxMf2030039
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 May 2024 13:59:22 GMT
Received: from [10.214.66.253] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 15 May
 2024 06:59:13 -0700
Message-ID: <51a69ed6-3aad-497c-9b9c-a2f64a57200f@quicinc.com>
Date: Wed, 15 May 2024 19:29:05 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/5] iommu/arm-smmu: introduction of ACTLR for custom
 prefetcher settings
To: Rob Clark <robdclark@gmail.com>
CC: <will@kernel.org>, <robin.murphy@arm.com>, <joro@8bytes.org>,
        <dmitry.baryshkov@linaro.org>, <konrad.dybcio@linaro.org>,
        <jsnitsel@redhat.com>, <quic_bjorande@quicinc.com>, <mani@kernel.org>,
        <quic_eberman@quicinc.com>, <robdclark@chromium.org>,
        <u.kleine-koenig@pengutronix.de>, <robh@kernel.org>,
        <vladimir.oltean@nxp.com>, <quic_pkondeti@quicinc.com>,
        <quic_molvera@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
        <linux-kernel@vger.kernel.org>
References: <20240123144543.9405-1-quic_bibekkum@quicinc.com>
 <20240123144543.9405-4-quic_bibekkum@quicinc.com>
 <CAF6AEGs3_wBNo58EbGicFoQuq8--fDohTGv1JSFgoViygLS5Lg@mail.gmail.com>
 <f2222714-1e00-424e-946d-c314d55541b8@quicinc.com>
 <CAF6AEGtm-KweFdMFvahH1pWmpOq7dW_p0Xe_13aHGWt0jSbg8w@mail.gmail.com>
Content-Language: en-US
From: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
In-Reply-To: <CAF6AEGtm-KweFdMFvahH1pWmpOq7dW_p0Xe_13aHGWt0jSbg8w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: WJRfjIV4CY9Uy5O8r50hfYgyCHsp_sS9
X-Proofpoint-GUID: WJRfjIV4CY9Uy5O8r50hfYgyCHsp_sS9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-15_07,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=999 mlxscore=0 phishscore=0 adultscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2405010000 definitions=main-2405150098



On 5/11/2024 1:18 AM, Rob Clark wrote:
> On Fri, May 10, 2024 at 5:52 AM Bibek Kumar Patro
> <quic_bibekkum@quicinc.com> wrote:
>>
>>
>>
>> On 5/1/2024 12:30 AM, Rob Clark wrote:
>>> On Tue, Jan 23, 2024 at 7:00 AM Bibek Kumar Patro
>>> <quic_bibekkum@quicinc.com> wrote:
>>>>
>>>> Currently in Qualcomm  SoCs the default prefetch is set to 1 which allows
>>>> the TLB to fetch just the next page table. MMU-500 features ACTLR
>>>> register which is implementation defined and is used for Qualcomm SoCs
>>>> to have a custom prefetch setting enabling TLB to prefetch the next set
>>>> of page tables accordingly allowing for faster translations.
>>>>
>>>> ACTLR value is unique for each SMR (Stream matching register) and stored
>>>> in a pre-populated table. This value is set to the register during
>>>> context bank initialisation.
>>>>
>>>> Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
>>>> ---
>>>>    drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 61 ++++++++++++++++++++++
>>>>    drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h | 16 +++++-
>>>>    drivers/iommu/arm/arm-smmu/arm-smmu.c      |  5 +-
>>>>    drivers/iommu/arm/arm-smmu/arm-smmu.h      |  5 ++
>>>>    4 files changed, 84 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>>> index 333daeb18c1c..6004c6d9a7b2 100644
>>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>>> @@ -215,10 +215,42 @@ static bool qcom_adreno_can_do_ttbr1(struct arm_smmu_device *smmu)
>>>>           return true;
>>>>    }
>>>>
>>>> +static void qcom_smmu_set_actlr(struct device *dev, struct arm_smmu_device *smmu, int cbndx,
>>>> +               const struct actlr_config *actlrcfg, const size_t num_actlrcfg)
>>>> +{
>>>> +       struct arm_smmu_master_cfg *cfg = dev_iommu_priv_get(dev);
>>>> +       struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
>>>> +       struct arm_smmu_smr *smr;
>>>> +       u16 mask;
>>>> +       int idx;
>>>> +       u16 id;
>>>> +       int i;
>>>> +       int j;
>>>> +
>>>> +       for (i = 0; i < num_actlrcfg; i++) {
>>>> +               id = actlrcfg[i].sid;
>>>> +               mask = actlrcfg[i].mask;
>>>> +
>>>> +               for_each_cfg_sme(cfg, fwspec, j, idx) {
>>>> +                       smr = &smmu->smrs[idx];
>>>> +                       if (smr_is_subset(smr, id, mask)) {
>>>> +                               arm_smmu_cb_write(smmu, cbndx, ARM_SMMU_CB_ACTLR,
>>>> +                                               actlrcfg[i].actlr);
>>>
>>> So, this makes ACTLR look like kind of a FIFO.  But I'm looking at
>>> downstream kgsl's PRR thing (which we'll need to implement vulkan
>>> sparse residency), and it appears to be wanting to set BIT(5) in ACTLR
>>> to enable PRR.
>>>
>>>           val = KGSL_IOMMU_GET_CTX_REG(ctx, KGSL_IOMMU_CTX_ACTLR);
>>>           val |= FIELD_PREP(KGSL_IOMMU_ACTLR_PRR_ENABLE, 1);
>>>           KGSL_IOMMU_SET_CTX_REG(ctx, KGSL_IOMMU_CTX_ACTLR, val);
>>>
>>> Any idea how this works?  And does it need to be done before or after
>>> the ACTLR programming done in this patch?
>>>
>>> BR,
>>> -R
>>>
>>
>> Hi Rob,
>>
>> Can you please help provide some more clarification on the FIFO part? By
>> FIFO are you referring to the storing of ACTLR data in the table?
> 
> Yeah, I mean it is writing the same ACTLR register multiple times to
> program the table.  I'm wondering if that means we need to program the
> table in a particular order compared to setting the PRR bit?  Like do
> we need to program PRR bit first, or last?
> 

Right Rob, this is the redundancy I am talking about, PRR bit's 
implementation is independent from SMMU ACTLR settings which should be
managed by KGSL driver.
We do not need to write the same register multiple times.

PRR bit can be independently programmed in any order wrt. to ACTLR table 
programming but for the case which is explained by you below I have 
suggested the order inline as per my understanding.

> I'm planning on adding an adreno_smmu_priv interface so that drm/msm
> can call into arm-smmu-qcom to setup the PRR bit and the related
> PRR_CFG_LADDR/PRR_CFG_UADDR registers.  And I'm just wondering if
> there is an ordering constraint wrt. when qcom_smmu_set_actlr() is
> called?

I see, thanks for clarification.
Since you are planning to add PRR bit + related registers'
configurations inside arm-smmu-qcom, then it would be better
to do it only after qcom_smmu_set_actlr() is called.

Reason being, if the PRR bit and related registers configuration is done
before hand, calling qcom_smmu_set_actlr() will just override other 
bits(including PRR bit) apart from the required bits since 
qcom_smmu_set_actlr() is doing only a write operation.

Thanks & regards,
Bibek

> 
> BR,
> -R
> 
>> Thanks for pointing to the downstream implementation of kgsl driver for
>> the PRR bit. Since kgsl driver is already handling this PRR bit's
>> setting, this makes setting the PRR BIT(5) by SMMU driver redundant.
>> Thanks for bringing up this point.
>> I will send v10 patch series removing this BIT(5) setting from the ACTLR
>> table.
>>
>> Thanks & regards,
>> Bibek
>>
>>>> +                               break;
>>>> +                       }
>>>> +               }
>>>> +       }
>>>> +}
>>>> +
>>>>    static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
>>>>                   struct io_pgtable_cfg *pgtbl_cfg, struct device *dev)
>>>>    {
>>>> +       struct arm_smmu_device *smmu = smmu_domain->smmu;
>>>> +       struct qcom_smmu *qsmmu = to_qcom_smmu(smmu);
>>>> +       const struct actlr_variant *actlrvar;
>>>> +       int cbndx = smmu_domain->cfg.cbndx;
>>>>           struct adreno_smmu_priv *priv;
>>>> +       int i;
>>>>
>>>>           smmu_domain->cfg.flush_walk_prefer_tlbiasid = true;
>>>>
>>>> @@ -248,6 +280,18 @@ static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
>>>>           priv->set_stall = qcom_adreno_smmu_set_stall;
>>>>           priv->resume_translation = qcom_adreno_smmu_resume_translation;
>>>>
>>>> +       actlrvar = qsmmu->data->actlrvar;
>>>> +       if (!actlrvar)
>>>> +               return 0;
>>>> +
>>>> +       for (i = 0; i < qsmmu->data->num_smmu ; i++) {
>>>> +               if (actlrvar[i].io_start == smmu->ioaddr) {
>>>> +                       qcom_smmu_set_actlr(dev, smmu, cbndx, actlrvar[i].actlrcfg,
>>>> +                                      actlrvar[i].num_actlrcfg);
>>>> +                       break;
>>>> +               }
>>>> +       }
>>>> +
>>>>           return 0;
>>>>    }
>>>>
>>>> @@ -274,7 +318,24 @@ static const struct of_device_id qcom_smmu_client_of_match[] __maybe_unused = {
>>>>    static int qcom_smmu_init_context(struct arm_smmu_domain *smmu_domain,
>>>>                   struct io_pgtable_cfg *pgtbl_cfg, struct device *dev)
>>>>    {
>>>> +       struct arm_smmu_device *smmu = smmu_domain->smmu;
>>>> +       struct qcom_smmu *qsmmu = to_qcom_smmu(smmu);
>>>> +       const struct actlr_variant *actlrvar;
>>>> +       int cbndx = smmu_domain->cfg.cbndx;
>>>> +       int i;
>>>> +
>>>>           smmu_domain->cfg.flush_walk_prefer_tlbiasid = true;
>>>> +       actlrvar = qsmmu->data->actlrvar;
>>>> +       if (!actlrvar)
>>>> +               return 0;
>>>> +
>>>> +       for (i = 0; i < qsmmu->data->num_smmu ; i++) {
>>>> +               if (actlrvar[i].io_start == smmu->ioaddr) {
>>>> +                       qcom_smmu_set_actlr(dev, smmu, cbndx, actlrvar[i].actlrcfg,
>>>> +                                      actlrvar[i].num_actlrcfg);
>>>> +                       break;
>>>> +               }
>>>> +       }
>>>>
>>>>           return 0;
>>>>    }
>>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
>>>> index f3b91963e234..3f651242de7c 100644
>>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
>>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
>>>> @@ -1,6 +1,6 @@
>>>>    /* SPDX-License-Identifier: GPL-2.0-only */
>>>>    /*
>>>> - * Copyright (c) 2022, Qualcomm Innovation Center, Inc. All rights reserved.
>>>> + * Copyright (c) 2022-2023, Qualcomm Innovation Center, Inc. All rights reserved.
>>>>     */
>>>>
>>>>    #ifndef _ARM_SMMU_QCOM_H
>>>> @@ -24,8 +24,22 @@ struct qcom_smmu_config {
>>>>           const u32 *reg_offset;
>>>>    };
>>>>
>>>> +struct actlr_config {
>>>> +       u16 sid;
>>>> +       u16 mask;
>>>> +       u32 actlr;
>>>> +};
>>>> +
>>>> +struct actlr_variant {
>>>> +       const resource_size_t io_start;
>>>> +       const struct actlr_config * const actlrcfg;
>>>> +       const size_t num_actlrcfg;
>>>> +};
>>>> +
>>>>    struct qcom_smmu_match_data {
>>>> +       const struct actlr_variant * const actlrvar;
>>>>           const struct qcom_smmu_config *cfg;
>>>> +       const size_t num_smmu;
>>>>           const struct arm_smmu_impl *impl;
>>>>           const struct arm_smmu_impl *adreno_impl;
>>>>    };
>>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>>>> index d6d1a2a55cc0..0c7f700b27dd 100644
>>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
>>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>>>> @@ -990,9 +990,10 @@ static int arm_smmu_find_sme(struct arm_smmu_device *smmu, u16 id, u16 mask)
>>>>                    * expect simply identical entries for this case, but there's
>>>>                    * no harm in accommodating the generalisation.
>>>>                    */
>>>> -               if ((mask & smrs[i].mask) == mask &&
>>>> -                   !((id ^ smrs[i].id) & ~smrs[i].mask))
>>>> +
>>>> +               if (smr_is_subset(&smrs[i], id, mask))
>>>>                           return i;
>>>> +
>>>>                   /*
>>>>                    * If the new entry has any other overlap with an existing one,
>>>>                    * though, then there always exists at least one stream ID
>>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
>>>> index 703fd5817ec1..2e4f65412c6b 100644
>>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
>>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
>>>> @@ -501,6 +501,11 @@ static inline void arm_smmu_writeq(struct arm_smmu_device *smmu, int page,
>>>>                   writeq_relaxed(val, arm_smmu_page(smmu, page) + offset);
>>>>    }
>>>>
>>>> +static inline bool smr_is_subset(struct arm_smmu_smr *smrs, u16 id, u16 mask)
>>>> +{
>>>> +       return (mask & smrs->mask) == mask && !((id ^ smrs->id) & ~smrs->mask);
>>>> +}
>>>> +
>>>>    #define ARM_SMMU_GR0           0
>>>>    #define ARM_SMMU_GR1           1
>>>>    #define ARM_SMMU_CB(s, n)      ((s)->numpage + (n))
>>>> --
>>>> 2.17.1
>>>>
>>>>

