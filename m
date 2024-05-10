Return-Path: <linux-arm-msm+bounces-19689-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E935F8C2521
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 14:53:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 186891C2088C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 12:53:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93AF6127B5F;
	Fri, 10 May 2024 12:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ao4uMTdl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E02E2487BC;
	Fri, 10 May 2024 12:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715345587; cv=none; b=cDHHFCQvXfwh5K8TYns5XU7G0Gfb3ileJ9wlcTC/qDbON6HWDIF9/R6KopwuSLerk7Ktke0TAJOF2zZ5a0G8PTw+GiqExjox0uw/lUp3ZZSjkfJGuLabN0BJq2M1/gcNknR4ZH+xNHh0yjxrQSqueV/+Iuk9sbAyGn9dM5v6lPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715345587; c=relaxed/simple;
	bh=YgKa71bFhk1gCVwmj2pTEd1auzogW5T2QB40aMsXhQM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=bcJi/YgbGALXjbXuQKaINZRowbAGoG9J0NmXYpMjdT9VPVAvbHdcfrblfkBy5rlPVSNfdJWqEe8rIxoAnjtVNDBIeUDDj5K7BTxPrU4X47nBfjlvi7oAQyfhCyvOLgQwxx2AyPK+nuvZA+bpbn6YEsLsZdRWeED4Bgmr2D3/Rl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ao4uMTdl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44A2tj2X024585;
	Fri, 10 May 2024 12:52:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=uSlDWBQTrnyVfvIVoW7lWNmU7G4SoSDVW7gKuQekkkU=; b=ao
	4uMTdlG5Q0igFLLB7U35BfQ+vtlsGGxFc7FGZKuSAtt8elwHtRatRSBLyfV3tVc4
	MY1dAC3zxtSR4vLJjKs4J+mpqpN0PZJ9iSxtcHtvBD08ZSwO9CsB1WYJWKBrC0Ed
	NnKHq/pH+v/KLrPKROriA0tGLzpmVBsfFHbehpAxz8sdNAB4oXJP3miSIHvStzSo
	Xyo+iIgFQQQe1Vqofme4TT9MM7g8O+CQ1h5Du0tH7KsYnmPTrRghk2Bll/kQEqM6
	tyHXyMoOTvcNcb6Hp2hIi577f6vIk7whR9SJMHV0sXrduQgOB+EeaDKKoSe2+KYN
	yhlN3wazmZ9EuvTgWnug==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y16w21fnp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 May 2024 12:52:39 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44ACqcx4031415
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 May 2024 12:52:38 GMT
Received: from [10.214.66.253] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 10 May
 2024 05:52:32 -0700
Message-ID: <f2222714-1e00-424e-946d-c314d55541b8@quicinc.com>
Date: Fri, 10 May 2024 18:22:22 +0530
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
Content-Language: en-US
From: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
In-Reply-To: <CAF6AEGs3_wBNo58EbGicFoQuq8--fDohTGv1JSFgoViygLS5Lg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ACFiStFGMk5_YB90eoVNagA6a6nCfFcE
X-Proofpoint-ORIG-GUID: ACFiStFGMk5_YB90eoVNagA6a6nCfFcE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-10_08,2024-05-10_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 clxscore=1011 phishscore=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2405010000 definitions=main-2405100092



On 5/1/2024 12:30 AM, Rob Clark wrote:
> On Tue, Jan 23, 2024 at 7:00 AM Bibek Kumar Patro
> <quic_bibekkum@quicinc.com> wrote:
>>
>> Currently in Qualcomm  SoCs the default prefetch is set to 1 which allows
>> the TLB to fetch just the next page table. MMU-500 features ACTLR
>> register which is implementation defined and is used for Qualcomm SoCs
>> to have a custom prefetch setting enabling TLB to prefetch the next set
>> of page tables accordingly allowing for faster translations.
>>
>> ACTLR value is unique for each SMR (Stream matching register) and stored
>> in a pre-populated table. This value is set to the register during
>> context bank initialisation.
>>
>> Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
>> ---
>>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 61 ++++++++++++++++++++++
>>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h | 16 +++++-
>>   drivers/iommu/arm/arm-smmu/arm-smmu.c      |  5 +-
>>   drivers/iommu/arm/arm-smmu/arm-smmu.h      |  5 ++
>>   4 files changed, 84 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>> index 333daeb18c1c..6004c6d9a7b2 100644
>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>> @@ -215,10 +215,42 @@ static bool qcom_adreno_can_do_ttbr1(struct arm_smmu_device *smmu)
>>          return true;
>>   }
>>
>> +static void qcom_smmu_set_actlr(struct device *dev, struct arm_smmu_device *smmu, int cbndx,
>> +               const struct actlr_config *actlrcfg, const size_t num_actlrcfg)
>> +{
>> +       struct arm_smmu_master_cfg *cfg = dev_iommu_priv_get(dev);
>> +       struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
>> +       struct arm_smmu_smr *smr;
>> +       u16 mask;
>> +       int idx;
>> +       u16 id;
>> +       int i;
>> +       int j;
>> +
>> +       for (i = 0; i < num_actlrcfg; i++) {
>> +               id = actlrcfg[i].sid;
>> +               mask = actlrcfg[i].mask;
>> +
>> +               for_each_cfg_sme(cfg, fwspec, j, idx) {
>> +                       smr = &smmu->smrs[idx];
>> +                       if (smr_is_subset(smr, id, mask)) {
>> +                               arm_smmu_cb_write(smmu, cbndx, ARM_SMMU_CB_ACTLR,
>> +                                               actlrcfg[i].actlr);
> 
> So, this makes ACTLR look like kind of a FIFO.  But I'm looking at
> downstream kgsl's PRR thing (which we'll need to implement vulkan
> sparse residency), and it appears to be wanting to set BIT(5) in ACTLR
> to enable PRR.
> 
>          val = KGSL_IOMMU_GET_CTX_REG(ctx, KGSL_IOMMU_CTX_ACTLR);
>          val |= FIELD_PREP(KGSL_IOMMU_ACTLR_PRR_ENABLE, 1);
>          KGSL_IOMMU_SET_CTX_REG(ctx, KGSL_IOMMU_CTX_ACTLR, val);
> 
> Any idea how this works?  And does it need to be done before or after
> the ACTLR programming done in this patch?
> 
> BR,
> -R
> 

Hi Rob,

Can you please help provide some more clarification on the FIFO part? By 
FIFO are you referring to the storing of ACTLR data in the table?

Thanks for pointing to the downstream implementation of kgsl driver for
the PRR bit. Since kgsl driver is already handling this PRR bit's
setting, this makes setting the PRR BIT(5) by SMMU driver redundant.
Thanks for bringing up this point.
I will send v10 patch series removing this BIT(5) setting from the ACTLR
table.

Thanks & regards,
Bibek

>> +                               break;
>> +                       }
>> +               }
>> +       }
>> +}
>> +
>>   static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
>>                  struct io_pgtable_cfg *pgtbl_cfg, struct device *dev)
>>   {
>> +       struct arm_smmu_device *smmu = smmu_domain->smmu;
>> +       struct qcom_smmu *qsmmu = to_qcom_smmu(smmu);
>> +       const struct actlr_variant *actlrvar;
>> +       int cbndx = smmu_domain->cfg.cbndx;
>>          struct adreno_smmu_priv *priv;
>> +       int i;
>>
>>          smmu_domain->cfg.flush_walk_prefer_tlbiasid = true;
>>
>> @@ -248,6 +280,18 @@ static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
>>          priv->set_stall = qcom_adreno_smmu_set_stall;
>>          priv->resume_translation = qcom_adreno_smmu_resume_translation;
>>
>> +       actlrvar = qsmmu->data->actlrvar;
>> +       if (!actlrvar)
>> +               return 0;
>> +
>> +       for (i = 0; i < qsmmu->data->num_smmu ; i++) {
>> +               if (actlrvar[i].io_start == smmu->ioaddr) {
>> +                       qcom_smmu_set_actlr(dev, smmu, cbndx, actlrvar[i].actlrcfg,
>> +                                      actlrvar[i].num_actlrcfg);
>> +                       break;
>> +               }
>> +       }
>> +
>>          return 0;
>>   }
>>
>> @@ -274,7 +318,24 @@ static const struct of_device_id qcom_smmu_client_of_match[] __maybe_unused = {
>>   static int qcom_smmu_init_context(struct arm_smmu_domain *smmu_domain,
>>                  struct io_pgtable_cfg *pgtbl_cfg, struct device *dev)
>>   {
>> +       struct arm_smmu_device *smmu = smmu_domain->smmu;
>> +       struct qcom_smmu *qsmmu = to_qcom_smmu(smmu);
>> +       const struct actlr_variant *actlrvar;
>> +       int cbndx = smmu_domain->cfg.cbndx;
>> +       int i;
>> +
>>          smmu_domain->cfg.flush_walk_prefer_tlbiasid = true;
>> +       actlrvar = qsmmu->data->actlrvar;
>> +       if (!actlrvar)
>> +               return 0;
>> +
>> +       for (i = 0; i < qsmmu->data->num_smmu ; i++) {
>> +               if (actlrvar[i].io_start == smmu->ioaddr) {
>> +                       qcom_smmu_set_actlr(dev, smmu, cbndx, actlrvar[i].actlrcfg,
>> +                                      actlrvar[i].num_actlrcfg);
>> +                       break;
>> +               }
>> +       }
>>
>>          return 0;
>>   }
>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
>> index f3b91963e234..3f651242de7c 100644
>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
>> @@ -1,6 +1,6 @@
>>   /* SPDX-License-Identifier: GPL-2.0-only */
>>   /*
>> - * Copyright (c) 2022, Qualcomm Innovation Center, Inc. All rights reserved.
>> + * Copyright (c) 2022-2023, Qualcomm Innovation Center, Inc. All rights reserved.
>>    */
>>
>>   #ifndef _ARM_SMMU_QCOM_H
>> @@ -24,8 +24,22 @@ struct qcom_smmu_config {
>>          const u32 *reg_offset;
>>   };
>>
>> +struct actlr_config {
>> +       u16 sid;
>> +       u16 mask;
>> +       u32 actlr;
>> +};
>> +
>> +struct actlr_variant {
>> +       const resource_size_t io_start;
>> +       const struct actlr_config * const actlrcfg;
>> +       const size_t num_actlrcfg;
>> +};
>> +
>>   struct qcom_smmu_match_data {
>> +       const struct actlr_variant * const actlrvar;
>>          const struct qcom_smmu_config *cfg;
>> +       const size_t num_smmu;
>>          const struct arm_smmu_impl *impl;
>>          const struct arm_smmu_impl *adreno_impl;
>>   };
>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>> index d6d1a2a55cc0..0c7f700b27dd 100644
>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>> @@ -990,9 +990,10 @@ static int arm_smmu_find_sme(struct arm_smmu_device *smmu, u16 id, u16 mask)
>>                   * expect simply identical entries for this case, but there's
>>                   * no harm in accommodating the generalisation.
>>                   */
>> -               if ((mask & smrs[i].mask) == mask &&
>> -                   !((id ^ smrs[i].id) & ~smrs[i].mask))
>> +
>> +               if (smr_is_subset(&smrs[i], id, mask))
>>                          return i;
>> +
>>                  /*
>>                   * If the new entry has any other overlap with an existing one,
>>                   * though, then there always exists at least one stream ID
>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
>> index 703fd5817ec1..2e4f65412c6b 100644
>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
>> @@ -501,6 +501,11 @@ static inline void arm_smmu_writeq(struct arm_smmu_device *smmu, int page,
>>                  writeq_relaxed(val, arm_smmu_page(smmu, page) + offset);
>>   }
>>
>> +static inline bool smr_is_subset(struct arm_smmu_smr *smrs, u16 id, u16 mask)
>> +{
>> +       return (mask & smrs->mask) == mask && !((id ^ smrs->id) & ~smrs->mask);
>> +}
>> +
>>   #define ARM_SMMU_GR0           0
>>   #define ARM_SMMU_GR1           1
>>   #define ARM_SMMU_CB(s, n)      ((s)->numpage + (n))
>> --
>> 2.17.1
>>
>>

