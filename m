Return-Path: <linux-arm-msm+bounces-680-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A137A7EBF62
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Nov 2023 10:23:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BF98C1C208FC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Nov 2023 09:23:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 334725660;
	Wed, 15 Nov 2023 09:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ImEUHbS8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2544B53B3
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Nov 2023 09:23:15 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB7FFFC;
	Wed, 15 Nov 2023 01:23:13 -0800 (PST)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AF97Rmp015039;
	Wed, 15 Nov 2023 09:22:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=Z6efsJXwUFu57SnFHmqY5uoYxQBd5GJYumVh7ukE1eo=;
 b=ImEUHbS8+MFXUCbRqRtH99isx9VIBuiPVKk0ZQIvMcDGX/gZ90Rbn6hwNfVzphWc/qKF
 LRz6jCKGxEZTIjdNjNrU3RxlVz9A7tXoJGK7sxPoXGEBJJRhf/L/cUS/b7mWXAExZyMW
 JrtDR9ia8IrTEjCP8bTMmsvfzLZqXeowEHuyPstP5YxnGdK3h61SlZTZmGyU/WgAa0Vb
 E1jq5GSeXKlOn1ukWti5iATFzq/9n38yMgFR2pOPZ+cU9+jnOJR6X1m4WAdaK6paXU1B
 S0FkxMuS9n+Gcy9gmokUW0ztmMvapsI5LTNaQoeKVI//lQEbYvtj+xZ4R/eab2xSqgE8 3w== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uck901022-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Nov 2023 09:22:46 +0000
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AF9MjfR016451
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Nov 2023 09:22:45 GMT
Received: from [10.214.66.253] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Wed, 15 Nov
 2023 01:22:40 -0800
Message-ID: <7edad996-f148-42d5-8e72-0334d3b9101f@quicinc.com>
Date: Wed, 15 Nov 2023 14:52:37 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] iommu/arm-smmu: add ACTLR data and support for
 SM8550
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <will@kernel.org>, <robin.murphy@arm.com>, <joro@8bytes.org>,
        <a39.skl@gmail.com>, <konrad.dybcio@linaro.org>,
        <quic_pkondeti@quicinc.com>, <quic_molvera@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
        <linux-kernel@vger.kernel.org>, <qipl.kernel.upstream@quicinc.com>
References: <20231114135654.30475-1-quic_bibekkum@quicinc.com>
 <20231114135654.30475-3-quic_bibekkum@quicinc.com>
 <CAA8EJpr1NzqiuNVZ0YcLpJ=yeOYFbLouAFgN9VMOiKpmoGVdtQ@mail.gmail.com>
From: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
In-Reply-To: <CAA8EJpr1NzqiuNVZ0YcLpJ=yeOYFbLouAFgN9VMOiKpmoGVdtQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: JcdmxFuYrQ-8iFYE9MSHbaXAyZfgd1K2
X-Proofpoint-ORIG-GUID: JcdmxFuYrQ-8iFYE9MSHbaXAyZfgd1K2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-15_07,2023-11-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 clxscore=1015 suspectscore=0 mlxscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311150070



On 11/14/2023 7:42 PM, Dmitry Baryshkov wrote:
> On Tue, 14 Nov 2023 at 15:57, Bibek Kumar Patro
> <quic_bibekkum@quicinc.com> wrote:
>>
>> Add ACTLR data table for SM8550 along with support for
>> same including SM8550 specific implementation operations.
>>
>> Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
>> ---
>>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 92 +++++++++++++++++++++-
>>   1 file changed, 88 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>> index 578c662c7c30..0eaf6f2a2e49 100644
>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>> @@ -25,6 +25,70 @@ struct actlr_data {
>>          u32 actlr;
>>   };
>>
>> +#define PRE_FETCH_1    0
>> +#define PRE_FETCH_2    BIT(8)
>> +#define PRE_FETCH_3    (BIT(9) | BIT(8))
> 
> What is the difference between PRE_FETCH_3 and PRE_FETCH_2? And
> PRE_FETCH_1? Are these real numbers that refer to some amount / count
> or just dummy names?
> 

No,these are not real numbers, but prefetch settings for a particular
perfect configuration.

>> +#define CPRE           BIT(1)          /* Enable context caching in the prefetch buffer */
>> +#define CMTLB          BIT(0)          /* Enable context caching in the macro TLB */
>> +
>> +static const struct actlr_data sm8550_apps_actlr_data[] = {
>> +       { 0x18a0, 0x0000, PRE_FETCH_2 | CPRE | CMTLB },
>> +       { 0x18e0, 0x0000, PRE_FETCH_2 | CPRE | CMTLB },
>> +       { 0x0800, 0x0020, PRE_FETCH_1 | CMTLB },
>> +       { 0x1800, 0x00c0, PRE_FETCH_1 | CMTLB },
>> +       { 0x1820, 0x0000, PRE_FETCH_1 | CMTLB },
>> +       { 0x1860, 0x0000, PRE_FETCH_1 | CMTLB },
>> +       { 0x0c01, 0x0020, PRE_FETCH_3 | CPRE | CMTLB },
>> +       { 0x0c02, 0x0020, PRE_FETCH_3 | CPRE | CMTLB },
>> +       { 0x0c03, 0x0020, PRE_FETCH_3 | CPRE | CMTLB },
>> +       { 0x0c04, 0x0020, PRE_FETCH_3 | CPRE | CMTLB },
>> +       { 0x0c05, 0x0020, PRE_FETCH_3 | CPRE | CMTLB },
>> +       { 0x0c06, 0x0020, PRE_FETCH_3 | CPRE | CMTLB },
>> +       { 0x0c07, 0x0020, PRE_FETCH_3 | CPRE | CMTLB },
>> +       { 0x0c08, 0x0020, PRE_FETCH_3 | CPRE | CMTLB },
>> +       { 0x0c09, 0x0020, PRE_FETCH_3 | CPRE | CMTLB },
>> +       { 0x0c0c, 0x0020, PRE_FETCH_3 | CPRE | CMTLB },
>> +       { 0x0c0d, 0x0020, PRE_FETCH_3 | CPRE | CMTLB },
>> +       { 0x0c0e, 0x0020, PRE_FETCH_3 | CPRE | CMTLB },
>> +       { 0x0c0f, 0x0020, PRE_FETCH_3 | CPRE | CMTLB },
>> +       { 0x1961, 0x0000, PRE_FETCH_3 | CPRE | CMTLB },
>> +       { 0x1962, 0x0000, PRE_FETCH_3 | CPRE | CMTLB },
>> +       { 0x1963, 0x0000, PRE_FETCH_3 | CPRE | CMTLB },
>> +       { 0x1964, 0x0000, PRE_FETCH_3 | CPRE | CMTLB },
>> +       { 0x1965, 0x0000, PRE_FETCH_3 | CPRE | CMTLB },
>> +       { 0x1966, 0x0000, PRE_FETCH_3 | CPRE | CMTLB },
>> +       { 0x1967, 0x0000, PRE_FETCH_3 | CPRE | CMTLB },
>> +       { 0x1968, 0x0000, PRE_FETCH_3 | CPRE | CMTLB },
>> +       { 0x1969, 0x0000, PRE_FETCH_3 | CPRE | CMTLB },
>> +       { 0x196c, 0x0000, PRE_FETCH_3 | CPRE | CMTLB },
>> +       { 0x196d, 0x0000, PRE_FETCH_3 | CPRE | CMTLB },
>> +       { 0x196e, 0x0000, PRE_FETCH_3 | CPRE | CMTLB },
>> +       { 0x196f, 0x0000, PRE_FETCH_3 | CPRE | CMTLB },
>> +       { 0x19c1, 0x0010, PRE_FETCH_3 | CPRE | CMTLB },
>> +       { 0x19c2, 0x0010, PRE_FETCH_3 | CPRE | CMTLB },
>> +       { 0x19c3, 0x0010, PRE_FETCH_3 | CPRE | CMTLB },
>> +       { 0x19c4, 0x0010, PRE_FETCH_3 | CPRE | CMTLB },
>> +       { 0x19c5, 0x0010, PRE_FETCH_3 | CPRE | CMTLB },
>> +       { 0x19c6, 0x0010, PRE_FETCH_3 | CPRE | CMTLB },
>> +       { 0x19c7, 0x0010, PRE_FETCH_3 | CPRE | CMTLB },
>> +       { 0x19c8, 0x0010, PRE_FETCH_3 | CPRE | CMTLB },
>> +       { 0x19c9, 0x0010, PRE_FETCH_3 | CPRE | CMTLB },
>> +       { 0x19cc, 0x0010, PRE_FETCH_3 | CPRE | CMTLB },
>> +       { 0x19cd, 0x0010, PRE_FETCH_3 | CPRE | CMTLB },
>> +       { 0x19ce, 0x0010, PRE_FETCH_3 | CPRE | CMTLB },
>> +       { 0x19cf, 0x0010, PRE_FETCH_3 | CPRE | CMTLB },
>> +       { 0x1c00, 0x0002, PRE_FETCH_2 | CPRE | CMTLB },
>> +       { 0x1c01, 0x0000, PRE_FETCH_1 | CMTLB },
>> +       { 0x1920, 0x0000, PRE_FETCH_2 | CPRE | CMTLB },
>> +       { 0x1923, 0x0000, PRE_FETCH_2 | CPRE | CMTLB },
>> +       { 0x1924, 0x0000, PRE_FETCH_2 | CPRE | CMTLB },
>> +       { 0x1940, 0x0000, PRE_FETCH_2 | CPRE | CMTLB },
>> +       { 0x1941, 0x0004, PRE_FETCH_2 | CPRE | CMTLB },
>> +       { 0x1943, 0x0000, PRE_FETCH_2 | CPRE | CMTLB },
>> +       { 0x1944, 0x0000, PRE_FETCH_2 | CPRE | CMTLB },
>> +       { 0x1947, 0x0000, PRE_FETCH_2 | CPRE | CMTLB },
>> +};
>> +
>>   static struct qcom_smmu *to_qcom_smmu(struct arm_smmu_device *smmu)
>>   {
>>          return container_of(smmu, struct qcom_smmu, smmu);
>> @@ -459,6 +523,16 @@ static const struct arm_smmu_impl sdm845_smmu_500_impl = {
>>          .tlb_sync = qcom_smmu_tlb_sync,
>>   };
>>
>> +
>> +static const struct arm_smmu_impl sm8550_smmu_500_impl = {
>> +       .init_context = qcom_smmu_init_context,
>> +       .cfg_probe = qcom_smmu_cfg_probe,
>> +       .def_domain_type = qcom_smmu_def_domain_type,
>> +       .reset = arm_mmu500_reset,
>> +       .write_s2cr = qcom_smmu_write_s2cr,
>> +       .tlb_sync = qcom_smmu_tlb_sync,
> 
> What is the difference between this one and qcom_smmu_500_impl ?
> 

Noted, will remove this and use qcom_smmu_500_impl instead.
Thanks for pointing this out.
Since inititally the reset ops was different to reset CPRE bit only for 
sm8550 SoC hence sm8550_smmu_500_impl is defined, but now default reset 
ops is modified to set CPRE bit for all SoCs ([PATCH v2 3/3]) so it 
should be fine to use qcom_smmu_500_impl as there's no difference now.

>> +};
>> +
>>   static const struct arm_smmu_impl qcom_adreno_smmu_v2_impl = {
>>          .init_context = qcom_adreno_smmu_init_context,
>>          .def_domain_type = qcom_smmu_def_domain_type,
>> @@ -522,6 +596,11 @@ static const struct qcom_smmu_config qcom_smmu_impl0_cfg = {
>>          .reg_offset = qcom_smmu_impl0_reg_offset,
>>   };
>>
>> +static const struct actlr_config sm8550_actlrcfg = {
>> +       .adata = sm8550_apps_actlr_data,
>> +       .size = ARRAY_SIZE(sm8550_apps_actlr_data),
>> +};
>> +
>>   /*
>>    * It is not yet possible to use MDP SMMU with the bypass quirk on the msm8996,
>>    * there are not enough context banks.
>> @@ -545,16 +624,20 @@ static const struct qcom_smmu_match_data sdm845_smmu_500_data = {
>>          /* Also no debug configuration. */
>>   };
>>
>> +
>> +static const struct qcom_smmu_match_data sm8550_smmu_500_impl0_data = {
>> +       .impl = &sm8550_smmu_500_impl,
>> +       .adreno_impl = &qcom_adreno_smmu_500_impl,
>> +       .cfg = &qcom_smmu_impl0_cfg,
>> +       .actlrcfg = &sm8550_actlrcfg,
>> +};
>> +
>>   static const struct qcom_smmu_match_data qcom_smmu_500_impl0_data = {
>>          .impl = &qcom_smmu_500_impl,
>>          .adreno_impl = &qcom_adreno_smmu_500_impl,
>>          .cfg = &qcom_smmu_impl0_cfg,
>>   };
>>
>> -/*
>> - * Do not add any more qcom,SOC-smmu-500 entries to this list, unless they need
>> - * special handling and can not be covered by the qcom,smmu-500 entry.
>> - */
> 
> NAK, leave this in place.
>

Ack, will address this in next version.

>>   static const struct of_device_id __maybe_unused qcom_smmu_impl_of_match[] = {
>>          { .compatible = "qcom,msm8996-smmu-v2", .data = &msm8996_smmu_data },
>>          { .compatible = "qcom,msm8998-smmu-v2", .data = &qcom_smmu_v2_data },
>> @@ -579,6 +662,7 @@ static const struct of_device_id __maybe_unused qcom_smmu_impl_of_match[] = {
>>          { .compatible = "qcom,sm8250-smmu-500", .data = &qcom_smmu_500_impl0_data },
>>          { .compatible = "qcom,sm8350-smmu-500", .data = &qcom_smmu_500_impl0_data },
>>          { .compatible = "qcom,sm8450-smmu-500", .data = &qcom_smmu_500_impl0_data },
>> +       { .compatible = "qcom,sm8550-smmu-500", .data = &sm8550_smmu_500_impl0_data },
>>          { .compatible = "qcom,smmu-500", .data = &qcom_smmu_500_impl0_data },
>>          { }
>>   };
>> --
>> 2.17.1
>>
> 
> 

