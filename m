Return-Path: <linux-arm-msm+bounces-1124-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2DD87F1048
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 11:25:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4DA9CB20F8A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 10:25:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A10FF12E48;
	Mon, 20 Nov 2023 10:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="aiHhMCy+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1892EA4;
	Mon, 20 Nov 2023 02:25:45 -0800 (PST)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AK55xPM024798;
	Mon, 20 Nov 2023 10:25:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=HARuH2/uywFft0s3b5vZDnvbX98avvpKAPa/J9pF1To=;
 b=aiHhMCy+MP/oLPFNtu9+mmoVBTo6YCXXwiQ41DhpeKLjvDSuvjJEiu1alWARN6yc2fnU
 cDY/HazMUcuzMMNZw+9D75AOSx0r/78ZRDS2pdf+OantOSL0KcDviTCWuLzOTe5c1JQs
 jyO8mxqT3jkWoVabitgxxbznCRu2FOOxoQY0vFrzS71wJIBwx+IED12CheEMbvEJvsKe
 v7PyaV26ZSW7Hqo7ooq57GOJrwTr1xtzGDs9W7BscQLFIgdcasOHlQFQ0zqFluBXoNrk
 bKiaVaNuMRgRh6nc8SFKzIlrW2WL46Twm2Ua1XQ0IaB7mKL+o3uDLrb2EQ4hDhUQRCl+ Kg== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uepjhkjvx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Nov 2023 10:25:13 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AKAPCrO030524
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Nov 2023 10:25:12 GMT
Received: from [10.214.66.253] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 20 Nov
 2023 02:25:07 -0800
Message-ID: <350c2fbe-a04d-4bcb-a7a9-cf9ca34ba10b@quicinc.com>
Date: Mon, 20 Nov 2023 15:54:59 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] iommu/arm-smmu: introduction of ACTLR for custom
 prefetcher settings
Content-Language: en-US
To: Robin Murphy <robin.murphy@arm.com>, <will@kernel.org>, <joro@8bytes.org>,
        <dmitry.baryshkov@linaro.org>, <a39.skl@gmail.com>,
        <konrad.dybcio@linaro.org>, <quic_pkondeti@quicinc.com>,
        <quic_molvera@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
        <qipl.kernel.upstream@quicinc.com>
References: <20231114135654.30475-1-quic_bibekkum@quicinc.com>
 <20231114135654.30475-2-quic_bibekkum@quicinc.com>
 <372885ab-b24d-44ae-afb8-76755bcd6e21@arm.com>
 <2a65a498-6a0f-445c-9c00-9e9e4fbc3a98@quicinc.com>
 <23944508-1054-4a31-b119-66f006cf10de@arm.com>
From: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
In-Reply-To: <23944508-1054-4a31-b119-66f006cf10de@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: DiKnjHq3dS0rSM4JfvEThUf_sXV90UNx
X-Proofpoint-GUID: DiKnjHq3dS0rSM4JfvEThUf_sXV90UNx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-20_08,2023-11-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 mlxlogscore=999 clxscore=1015 suspectscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311200070



On 11/15/2023 8:34 PM, Robin Murphy wrote:
> On 2023-11-15 12:32 pm, Bibek Kumar Patro wrote:
>>
>>
>> On 11/14/2023 10:25 PM, Robin Murphy wrote:
>>> On 14/11/2023 1:56 pm, Bibek Kumar Patro wrote:
>>>> Currently in Qualcomm  SoCs the default prefetch is set to 1 which 
>>>> allows
>>>> the TLB to fetch just the next page table. MMU-500 features ACTLR
>>>> register which is implementation defined and is used for Qualcomm SoCs
>>>> to have a prefetch setting of 1/3/7/15 enabling TLB to prefetch
>>>> the next set of page tables accordingly allowing for faster 
>>>> translations.
>>>>
>>>> ACTLR value is unique for each SMR (Stream matching register) and 
>>>> stored
>>>> in a pre-populated table. This value is set to the register during
>>>> context bank initialisation.
>>>>
>>>> Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
>>>> ---
>>>>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 41 
>>>> ++++++++++++++++++++++
>>>>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h |  2 ++
>>>>   drivers/iommu/arm/arm-smmu/arm-smmu.c      |  5 +--
>>>>   drivers/iommu/arm/arm-smmu/arm-smmu.h      |  5 +++
>>>>   4 files changed, 51 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c 
>>>> b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>>> index 549ae4dba3a6..578c662c7c30 100644
>>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>>> @@ -14,6 +14,17 @@
>>>>
>>>>   #define QCOM_DUMMY_VAL    -1
>>>>
>>>> +struct actlr_config {
>>>> +    const struct actlr_data *adata;
>>>> +    size_t size;
>>>> +};
>>>> +
>>>> +struct actlr_data {
>>>> +    u16 sid;
>>>> +    u16 mask;
>>>
>>> Do we need to worry about masks? If you're already assuming that any 
>>> SMR will be programmed to match a superset of the data here, surely a 
>>> single unique ID per device would suffice?
>>>

Thanks for this comment. I see now, only assuming smrs might not be able
to correctly set the ACTLR values for all the context banks without the
index. it should be smr = smmu->smrs[idx] instead of smr = smmu->smrs
or it will be considering the single SMR for all the associated devices.

>>
>> If you refer to the arm_smmu_set_actlr below, mask would be needed as 
>> we would check for mask along with sid as well while assigning actlr 
>> configuration. Also with mask no of actlr entries can be reduces as
>> with out mask we have to have entry for each sid.
> 
> But why? As far as I can tell, the design in patch #2 is to have a 
> single data entry for each distinct device, since you're expecting to 
> see a single SMR programmed to match at least the full id/mask range of 
> the entry. However any SMR which matches that full range will by 
> definition also match any smaller subset of that range as well, so we 
> can uniquely identify any device in this context from just any *one* of 
> its IDs, thus we could store less data and have simpler matching logic.
> 

I was going though your earlier reply once again and noticed we would
need to mention the context bank index against the smr as well to take
the right ACTLR value, as I replied to your earlier response above.

>>>> +    u32 actlr;
>>>> +};
>>>> +
>>>>   static struct qcom_smmu *to_qcom_smmu(struct arm_smmu_device *smmu)
>>>>   {
>>>>       return container_of(smmu, struct qcom_smmu, smmu);
>>>> @@ -261,9 +272,36 @@ static const struct of_device_id 
>>>> qcom_smmu_client_of_match[] __maybe_unused = {
>>>>       { }
>>>>   };
>>>>
>>>> +static void arm_smmu_set_actlr(struct arm_smmu_device *smmu, int idx,
>>>> +        const struct actlr_config *actlrcfg)
>>>> +{
>>>> +    struct arm_smmu_smr *smr = smmu->smrs;

It would be smr = smmu->smrs[idx] instead of smr = smmu->smrs to get
sid of individual device attached to corresponding context bank.

>>>> +    int i;
>>>> +    u16 id;
>>>> +    u16 mask;
>>>> +
>>>> +    for (i = 0; i < actlrcfg->size; ++i) {
>>>> +        id = actlrcfg->adata[i].sid;
>>>> +        mask = actlrcfg->adata[i].mask;
>>>> +        if (!smr_is_subset(*smr, id, mask))
>>>
>>> How well have you tested this? ;)
>>>
>>
>> Well, this logic has worked pretty good for us till now in our
>> downstream implementation. :) (During testing as well this logic 
>> helped to better match the SMRs instead of manually mathcing the mask 
>> and SID which missed some SIDs)
>> Also this is already being used to arm_smmu_find_sme hence packaged this
>> logic in a wrapper to be used in other places as well(including ACTLR
>> register setting case here.)
> 
> 1) Look at what you're matching the id and mask values *against*
> 

Got this now. Will take care of this in next version.

> 2) Look at the polarity of the condition
> 
> 3) Consider the old saying "two wrongs don't make a right"
> 

Noted.

>>>> +            arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_ACTLR,
>>>> +                    actlrcfg->adata[i].actlr);
>>>> +    }
>>>> +}
>>>> +
>>>>   static int qcom_smmu_init_context(struct arm_smmu_domain 
>>>> *smmu_domain,
>>>>           struct io_pgtable_cfg *pgtbl_cfg, struct device *dev)
>>>>   {
>>>> +    struct arm_smmu_device *smmu = smmu_domain->smmu;
>>>> +    struct qcom_smmu *qsmmu = to_qcom_smmu(smmu);
>>>> +    const struct actlr_config *actlrcfg;
>>>> +    int idx = smmu_domain->cfg.cbndx;
>>>> +
>>>> +    if (qsmmu->actlrcfg) {
>>>> +        actlrcfg = qsmmu->actlrcfg;
>>>> +        arm_smmu_set_actlr(smmu, idx, actlrcfg);
>>>> +    }
>>>> +
>>>>       smmu_domain->cfg.flush_walk_prefer_tlbiasid = true;
>>>>
>>>>       return 0;
>>>> @@ -467,6 +505,9 @@ static struct arm_smmu_device 
>>>> *qcom_smmu_create(struct arm_smmu_device *smmu,
>>>>       qsmmu->smmu.impl = impl;
>>>>       qsmmu->cfg = data->cfg;
>>>>
>>>> +    if (data->actlrcfg && (data->actlrcfg->size))
>>>> +        qsmmu->actlrcfg = data->actlrcfg;
>>>
>>> Do we really need to replicate multiple parts of the data, or would 
>>> it be sensible to just replace qsmmu->cfg with qsmmu->data and handle 
>>> the further dereferences in the places that want them?
>>>
>>>> +
>>>>       return &qsmmu->smmu;
>>>>   }
>>>>
>>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h 
>>>> b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
>>>> index 593910567b88..4b6862715070 100644
>>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
>>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
>>>> @@ -9,6 +9,7 @@
>>>>   struct qcom_smmu {
>>>>       struct arm_smmu_device smmu;
>>>>       const struct qcom_smmu_config *cfg;
>>>> +    const struct actlr_config *actlrcfg;
>>>>       bool bypass_quirk;
>>>>       u8 bypass_cbndx;
>>>>       u32 stall_enabled;
>>>> @@ -25,6 +26,7 @@ struct qcom_smmu_config {
>>>>   };
>>>>
>>>>   struct qcom_smmu_match_data {
>>>> +    const struct actlr_config *actlrcfg;
>>>>       const struct qcom_smmu_config *cfg;
>>>>       const struct arm_smmu_impl *impl;
>>>>       const struct arm_smmu_impl *adreno_impl;
>>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c 
>>>> b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>>>> index d6d1a2a55cc0..8e4faf015286 100644
>>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
>>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>>>> @@ -990,9 +990,10 @@ static int arm_smmu_find_sme(struct 
>>>> arm_smmu_device *smmu, u16 id, u16 mask)
>>>>            * expect simply identical entries for this case, but there's
>>>>            * no harm in accommodating the generalisation.
>>>>            */
>>>> -        if ((mask & smrs[i].mask) == mask &&
>>>> -            !((id ^ smrs[i].id) & ~smrs[i].mask))
>>>> +
>>>> +        if (smr_is_subset(smrs[i], id, mask))
>>>>               return i;
>>>> +
>>>>           /*
>>>>            * If the new entry has any other overlap with an existing 
>>>> one,
>>>>            * though, then there always exists at least one stream ID
>>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h 
>>>> b/drivers/iommu/arm/arm-smmu/arm-smmu.h
>>>> index 703fd5817ec1..b1638bbc41d4 100644
>>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
>>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
>>>> @@ -501,6 +501,11 @@ static inline void arm_smmu_writeq(struct 
>>>> arm_smmu_device *smmu, int page,
>>>>           writeq_relaxed(val, arm_smmu_page(smmu, page) + offset);
>>>>   }
>>>>
>>>> +static inline bool smr_is_subset(struct arm_smmu_smr smrs, u16 id, 
>>>> u16 mask)
>>>
>>> Hmm, that name reads as implying the opposite of what it actually 
>>> tests, not to mention that passing structs by value is a bit horrid 
>>> as well :(
>>>
>>
>> It might be okay to name it as subset_of_smr() though. You have any 
>> other naming suggestion in mind which could correctly describe the
>> logic?
> 
> As above I think the ideal answer is to avoid the reason for factoring 
> it out at all, by using a simpler matching process to begin with.
>

As per the approach mentioned above to use the context bank index,
this same approach should be okay to go forward with.

Thanks Robin for you above comments, I have noted the inputs and will
take care of this in next version.

Thanks & regards,
Bibek

> Thanks,
> Robin.

