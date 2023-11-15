Return-Path: <linux-arm-msm+bounces-667-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E397EBCD0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Nov 2023 06:43:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F3A812811C8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Nov 2023 05:43:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6A472E84A;
	Wed, 15 Nov 2023 05:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VlnGLmxM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 268B07E
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Nov 2023 05:43:13 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCCF79D;
	Tue, 14 Nov 2023 21:43:11 -0800 (PST)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AF5Ngqe029055;
	Wed, 15 Nov 2023 05:42:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=06vo+hOZCypC/Yt4DCMoryI8vVUWZoEa9NR+znzs0/0=;
 b=VlnGLmxMY0VWHVlZs84OkJcJywZqUac1i/yA5f+0jw4BYZNiyKVmfClLP8Y3+j5ozpO1
 izWJ55Wi0WBBe2txnXQSmBD6tq3bt6fZ1rzPc38OBepFU6BcXWF/VWnzyOjPNlgWgRdG
 opjBnKSVR6eknRIIe1giqZinHcsUOVS29oj5+gr6dnVZ4HD3A4/eglGaOeXnYRnA+/Af
 OMhiejEhrMOBvP9OH24EFXw/Oh7nbwT+nRXDd5Gjc7bUg4GpVK2dorXsBo4g4NkUS4oN
 LIguFpStvaF8Ga9pig1UBDfKPJDwykD9Lt7Ww1GHGii4qc3DwH6p0mJoq8xhOLO8U7/O ug== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ucg2u90h0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Nov 2023 05:42:46 +0000
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AF5gkre018324
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Nov 2023 05:42:46 GMT
Received: from [10.214.66.253] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Tue, 14 Nov
 2023 21:42:40 -0800
Message-ID: <980c0ad0-6405-4c2f-8469-3a97581fb2a6@quicinc.com>
Date: Wed, 15 Nov 2023 11:12:31 +0530
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
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <will@kernel.org>, <robin.murphy@arm.com>, <joro@8bytes.org>,
        <a39.skl@gmail.com>, <konrad.dybcio@linaro.org>,
        <quic_pkondeti@quicinc.com>, <quic_molvera@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
        <linux-kernel@vger.kernel.org>, <qipl.kernel.upstream@quicinc.com>
References: <20231114135654.30475-1-quic_bibekkum@quicinc.com>
 <20231114135654.30475-2-quic_bibekkum@quicinc.com>
 <CAA8EJpoNttUbxNvU0xC2kQjLV==wK_te2x=Kxrw0O+joGBipOA@mail.gmail.com>
From: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
In-Reply-To: <CAA8EJpoNttUbxNvU0xC2kQjLV==wK_te2x=Kxrw0O+joGBipOA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: HLzEcaQD0MzKu2U3EhqFk5ZMAuCsvP3D
X-Proofpoint-GUID: HLzEcaQD0MzKu2U3EhqFk5ZMAuCsvP3D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-15_04,2023-11-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 bulkscore=0 spamscore=0 impostorscore=0 mlxscore=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=971
 adultscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311060000 definitions=main-2311150042



On 11/14/2023 7:38 PM, Dmitry Baryshkov wrote:
> On Tue, 14 Nov 2023 at 15:57, Bibek Kumar Patro
> <quic_bibekkum@quicinc.com> wrote:
>>
>> Currently in Qualcomm  SoCs the default prefetch is set to 1 which allows
>> the TLB to fetch just the next page table. MMU-500 features ACTLR
>> register which is implementation defined and is used for Qualcomm SoCs
>> to have a prefetch setting of 1/3/7/15 enabling TLB to prefetch
>> the next set of page tables accordingly allowing for faster translations.
>>
>> ACTLR value is unique for each SMR (Stream matching register) and stored
>> in a pre-populated table. This value is set to the register during
>> context bank initialisation.
>>
>> Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
>> ---
>>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 41 ++++++++++++++++++++++
>>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h |  2 ++
>>   drivers/iommu/arm/arm-smmu/arm-smmu.c      |  5 +--
>>   drivers/iommu/arm/arm-smmu/arm-smmu.h      |  5 +++
>>   4 files changed, 51 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>> index 549ae4dba3a6..578c662c7c30 100644
>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>> @@ -14,6 +14,17 @@
>>
>>   #define QCOM_DUMMY_VAL -1
>>
>> +struct actlr_config {
>> +       const struct actlr_data *adata;
>> +       size_t size;
> 
> Merge this into struct qcom_smmu_match_data.
> 

Just saw your response on the other thread in v1 patch,
let me try again once to accomodate into single structure
as suggested

>> +};
>> +
>> +struct actlr_data {
>> +       u16 sid;
>> +       u16 mask;
>> +       u32 actlr;
>> +};
>> +
>>   static struct qcom_smmu *to_qcom_smmu(struct arm_smmu_device *smmu)
>>   {
>>          return container_of(smmu, struct qcom_smmu, smmu);
>> @@ -261,9 +272,36 @@ static const struct of_device_id qcom_smmu_client_of_match[] __maybe_unused = {
>>          { }
>>   };
>>
>> +static void arm_smmu_set_actlr(struct arm_smmu_device *smmu, int idx,
>> +               const struct actlr_config *actlrcfg)
>> +{
>> +       struct arm_smmu_smr *smr = smmu->smrs;
>> +       int i;
>> +       u16 id;
>> +       u16 mask;
>> +
>> +       for (i = 0; i < actlrcfg->size; ++i) {
>> +               id = actlrcfg->adata[i].sid;
>> +               mask = actlrcfg->adata[i].mask;
>> +               if (!smr_is_subset(*smr, id, mask))
>> +                       arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_ACTLR,
>> +                                       actlrcfg->adata[i].actlr);
>> +       }
>> +}
>> +
>>   static int qcom_smmu_init_context(struct arm_smmu_domain *smmu_domain,
>>                  struct io_pgtable_cfg *pgtbl_cfg, struct device *dev)
>>   {
>> +       struct arm_smmu_device *smmu = smmu_domain->smmu;
>> +       struct qcom_smmu *qsmmu = to_qcom_smmu(smmu);
>> +       const struct actlr_config *actlrcfg;
>> +       int idx = smmu_domain->cfg.cbndx;
>> +
>> +       if (qsmmu->actlrcfg) {
>> +               actlrcfg = qsmmu->actlrcfg;
>> +               arm_smmu_set_actlr(smmu, idx, actlrcfg);
>> +       }
>> +
>>          smmu_domain->cfg.flush_walk_prefer_tlbiasid = true;
>>
>>          return 0;
>> @@ -467,6 +505,9 @@ static struct arm_smmu_device *qcom_smmu_create(struct arm_smmu_device *smmu,
>>          qsmmu->smmu.impl = impl;
>>          qsmmu->cfg = data->cfg;
>>
>> +       if (data->actlrcfg && (data->actlrcfg->size))
>> +               qsmmu->actlrcfg = data->actlrcfg;
>> +
>>          return &qsmmu->smmu;
>>   }
>>
>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
>> index 593910567b88..4b6862715070 100644
>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
>> @@ -9,6 +9,7 @@
>>   struct qcom_smmu {
>>          struct arm_smmu_device smmu;
>>          const struct qcom_smmu_config *cfg;
>> +       const struct actlr_config *actlrcfg;
>>          bool bypass_quirk;
>>          u8 bypass_cbndx;
>>          u32 stall_enabled;
>> @@ -25,6 +26,7 @@ struct qcom_smmu_config {
>>   };
>>
>>   struct qcom_smmu_match_data {
>> +       const struct actlr_config *actlrcfg;
>>          const struct qcom_smmu_config *cfg;
>>          const struct arm_smmu_impl *impl;
>>          const struct arm_smmu_impl *adreno_impl;
>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>> index d6d1a2a55cc0..8e4faf015286 100644
>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>> @@ -990,9 +990,10 @@ static int arm_smmu_find_sme(struct arm_smmu_device *smmu, u16 id, u16 mask)
>>                   * expect simply identical entries for this case, but there's
>>                   * no harm in accommodating the generalisation.
>>                   */
>> -               if ((mask & smrs[i].mask) == mask &&
>> -                   !((id ^ smrs[i].id) & ~smrs[i].mask))
>> +
>> +               if (smr_is_subset(smrs[i], id, mask))
>>                          return i;
>> +
>>                  /*
>>                   * If the new entry has any other overlap with an existing one,
>>                   * though, then there always exists at least one stream ID
>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
>> index 703fd5817ec1..b1638bbc41d4 100644
>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
>> @@ -501,6 +501,11 @@ static inline void arm_smmu_writeq(struct arm_smmu_device *smmu, int page,
>>                  writeq_relaxed(val, arm_smmu_page(smmu, page) + offset);
>>   }
>>
>> +static inline bool smr_is_subset(struct arm_smmu_smr smrs, u16 id, u16 mask)
>> +{
>> +       return (mask & smrs.mask) == mask && !((id ^ smrs.id) & ~smrs.mask);
>> +}
>> +
>>   #define ARM_SMMU_GR0           0
>>   #define ARM_SMMU_GR1           1
>>   #define ARM_SMMU_CB(s, n)      ((s)->numpage + (n))
>> --
>> 2.17.1
>>
> 
> 
> --
> With best wishes
> Dmitry


regards,
Bibek

