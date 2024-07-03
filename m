Return-Path: <linux-arm-msm+bounces-25148-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEEEA92606C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 14:34:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AEA14B2386C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 12:15:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE1FC143879;
	Wed,  3 Jul 2024 12:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="R4poeBQG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCEFE13B5B2;
	Wed,  3 Jul 2024 12:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720008955; cv=none; b=cx+7/buh1uj49kis5Bx3g3eIU80oXSXsjMiXbDRRQxGElC7sPTvtSMTw863403OQ2ERVyEyp6ykeRsjq+/yQznCnOkZ5qhqC0Ok+EQ5rMwn1Z2UtAt/MGocQ9W06ZnhZBq5JUN15ISd28+h4DE+Vuu6eSAvCTQStqevvL8mbJ9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720008955; c=relaxed/simple;
	bh=8aFMfspRLEOo6IPzvbwXHgrGsOrhS5cXl88/sOCGuQA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=q4Mnw1ZJa5/6mkTi3OobzKN82s3fVhtYrNKnxn1qfgatsqLeIW4bQo96h81uTWxjmqc5sPDEAv8TAGeQvYlaQ61Dwr8d7yQdW0B+B0jlcpK/nzTU885wYc65Gt44xou8lwwjRlS9X4BTUTsi2gWZzjVRvmgf1WjwThFUOURhRSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=R4poeBQG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4637RAbT013551;
	Wed, 3 Jul 2024 12:15:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vL5DbSobXn/jHC3a7cLJryT/RRQz0nCuSMxfmBpv3Aw=; b=R4poeBQGXE9ZmZzS
	PyRDrIrPtIGwp1Q6IJ/GvjInHccwEt3sfpIKheDAnSe4RR/jzaDcGJVYJhXaOYsp
	XvVZpXoYKDW+wAt865AKptr7leUwVSdloMJ6EmOVfIhUvUzYPwM6BcASbb4Whg4X
	42EMtbmTUkRWsCTvPmrQAOdJEEVYkHDDIHAST48EBbNABYl70lNDD5BHZLlrsHJz
	gJk5ke2Ks2+HqukLGsoPkMNVfaOHjmZNaD9BuX4Dxp5p7aqQmoVMP0bmBYaqgf/m
	InlTFImmhqxxsYcBvWpbFD8wXqL4Z+Gt5VBcXlgg+pYLZHmELBnSMS4O+PO4a9eY
	bE0sjA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 402996rswj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Jul 2024 12:15:35 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 463CFVfd021247
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 3 Jul 2024 12:15:31 GMT
Received: from [10.214.66.253] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 3 Jul 2024
 05:15:26 -0700
Message-ID: <6da77880-2ba4-4b02-8b3e-cb0fbd0a9daf@quicinc.com>
Date: Wed, 3 Jul 2024 17:45:23 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 4/6] iommu/arm-smmu: add ACTLR data and support for
 SM8550
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <robdclark@gmail.com>, <will@kernel.org>, <robin.murphy@arm.com>,
        <joro@8bytes.org>, <jgg@ziepe.ca>, <jsnitsel@redhat.com>,
        <robh@kernel.org>, <krzysztof.kozlowski@linaro.org>,
        <quic_c_gdjako@quicinc.com>, <konrad.dybcio@linaro.org>,
        <iommu@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20240628140435.1652374-1-quic_bibekkum@quicinc.com>
 <20240628140435.1652374-5-quic_bibekkum@quicinc.com>
 <ueuhu5xfzp2rnuxzeqqd6cho476adidztgx7oq2tbiufauv6h4@obblpxvqwnno>
Content-Language: en-US
From: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
In-Reply-To: <ueuhu5xfzp2rnuxzeqqd6cho476adidztgx7oq2tbiufauv6h4@obblpxvqwnno>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 6ObqmVHDSOmfe0YG1sf-wP0wkyrMmMHL
X-Proofpoint-ORIG-GUID: 6ObqmVHDSOmfe0YG1sf-wP0wkyrMmMHL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-03_07,2024-07-03_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 mlxscore=0 malwarescore=0 clxscore=1015 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2407030090



On 7/2/2024 12:04 AM, Dmitry Baryshkov wrote:
> On Fri, Jun 28, 2024 at 07:34:33PM GMT, Bibek Kumar Patro wrote:
>> Add ACTLR data table for SM8550 along with support for
>> same including SM8550 specific implementation operations.
>>
>> Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
>> ---
>>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 89 ++++++++++++++++++++++
>>   1 file changed, 89 insertions(+)
>>
>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>> index 77c9abffe07d..b4521471ffe9 100644
>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>> @@ -23,6 +23,85 @@
>>
>>   #define CPRE			(1 << 1)
>>   #define CMTLB			(1 << 0)
>> +#define PREFETCH_SHIFT		8
>> +#define PREFETCH_DEFAULT	0
>> +#define PREFETCH_SHALLOW	(1 << PREFETCH_SHIFT)
>> +#define PREFETCH_MODERATE	(2 << PREFETCH_SHIFT)
>> +#define PREFETCH_DEEP		(3 << PREFETCH_SHIFT)
>> +
>> +static const struct actlr_config sm8550_apps_actlr_cfg[] = {
>> +	{ 0x18a0, 0x0000, PREFETCH_SHALLOW | CPRE | CMTLB },
>> +	{ 0x18e0, 0x0000, PREFETCH_SHALLOW | CPRE | CMTLB },
>> +	{ 0x0800, 0x0020, PREFETCH_DEFAULT | CMTLB },
>> +	{ 0x1800, 0x00c0, PREFETCH_DEFAULT | CMTLB },
>> +	{ 0x1820, 0x0000, PREFETCH_DEFAULT | CMTLB },
>> +	{ 0x1860, 0x0000, PREFETCH_DEFAULT | CMTLB },
>> +	{ 0x0c01, 0x0020, PREFETCH_DEEP | CPRE | CMTLB },
> 
> - Please keep the list sorted

Sure Dmitry, will sort this list in reverse-christmas-tree order
in next iteration. Thanks for this input.

> - Please comment, which devices use these settings.

As discussed in earlier versions of this patch, these table entries
are kind of just blind values for SMMU device, where SMMU do not have
idea on which SID belong to which client. During probe time when the
clients' Stream-ID has corresponding ACTLR entry then the driver would
set value in register.
Also some might have their prefetch settings as proprietary.
Hence did not add the comments for device using these settings.


Thanks & regards,
Bibek

> 
>> +	{ 0x0c02, 0x0020, PREFETCH_DEEP | CPRE | CMTLB },
>> +	{ 0x0c03, 0x0020, PREFETCH_DEEP | CPRE | CMTLB },
>> +	{ 0x0c04, 0x0020, PREFETCH_DEEP | CPRE | CMTLB },
>> +	{ 0x0c05, 0x0020, PREFETCH_DEEP | CPRE | CMTLB },
>> +	{ 0x0c06, 0x0020, PREFETCH_DEEP | CPRE | CMTLB },
>> +	{ 0x0c07, 0x0020, PREFETCH_DEEP | CPRE | CMTLB },
>> +	{ 0x0c08, 0x0020, PREFETCH_DEEP | CPRE | CMTLB },
>> +	{ 0x0c09, 0x0020, PREFETCH_DEEP | CPRE | CMTLB },
>> +	{ 0x0c0c, 0x0020, PREFETCH_DEEP | CPRE | CMTLB },
>> +	{ 0x0c0d, 0x0020, PREFETCH_DEEP | CPRE | CMTLB },
>> +	{ 0x0c0e, 0x0020, PREFETCH_DEEP | CPRE | CMTLB },
>> +	{ 0x0c0f, 0x0020, PREFETCH_DEEP | CPRE | CMTLB },
>> +	{ 0x1961, 0x0000, PREFETCH_DEEP | CPRE | CMTLB },
>> +	{ 0x1962, 0x0000, PREFETCH_DEEP | CPRE | CMTLB },
>> +	{ 0x1963, 0x0000, PREFETCH_DEEP | CPRE | CMTLB },
>> +	{ 0x1964, 0x0000, PREFETCH_DEEP | CPRE | CMTLB },
>> +	{ 0x1965, 0x0000, PREFETCH_DEEP | CPRE | CMTLB },
>> +	{ 0x1966, 0x0000, PREFETCH_DEEP | CPRE | CMTLB },
>> +	{ 0x1967, 0x0000, PREFETCH_DEEP | CPRE | CMTLB },
>> +	{ 0x1968, 0x0000, PREFETCH_DEEP | CPRE | CMTLB },
>> +	{ 0x1969, 0x0000, PREFETCH_DEEP | CPRE | CMTLB },
>> +	{ 0x196c, 0x0000, PREFETCH_DEEP | CPRE | CMTLB },
>> +	{ 0x196d, 0x0000, PREFETCH_DEEP | CPRE | CMTLB },
>> +	{ 0x196e, 0x0000, PREFETCH_DEEP | CPRE | CMTLB },
>> +	{ 0x196f, 0x0000, PREFETCH_DEEP | CPRE | CMTLB },
>> +	{ 0x19c1, 0x0010, PREFETCH_DEEP | CPRE | CMTLB },
>> +	{ 0x19c2, 0x0010, PREFETCH_DEEP | CPRE | CMTLB },
>> +	{ 0x19c3, 0x0010, PREFETCH_DEEP | CPRE | CMTLB },
>> +	{ 0x19c4, 0x0010, PREFETCH_DEEP | CPRE | CMTLB },
>> +	{ 0x19c5, 0x0010, PREFETCH_DEEP | CPRE | CMTLB },
>> +	{ 0x19c6, 0x0010, PREFETCH_DEEP | CPRE | CMTLB },
>> +	{ 0x19c7, 0x0010, PREFETCH_DEEP | CPRE | CMTLB },
>> +	{ 0x19c8, 0x0010, PREFETCH_DEEP | CPRE | CMTLB },
>> +	{ 0x19c9, 0x0010, PREFETCH_DEEP | CPRE | CMTLB },
>> +	{ 0x19cc, 0x0010, PREFETCH_DEEP | CPRE | CMTLB },
>> +	{ 0x19cd, 0x0010, PREFETCH_DEEP | CPRE | CMTLB },
>> +	{ 0x19ce, 0x0010, PREFETCH_DEEP | CPRE | CMTLB },
>> +	{ 0x19cf, 0x0010, PREFETCH_DEEP | CPRE | CMTLB },
>> +	{ 0x1c00, 0x0002, PREFETCH_SHALLOW | CPRE | CMTLB },
>> +	{ 0x1c01, 0x0000, PREFETCH_DEFAULT | CMTLB },
>> +	{ 0x1920, 0x0000, PREFETCH_SHALLOW | CPRE | CMTLB },
>> +	{ 0x1923, 0x0000, PREFETCH_SHALLOW | CPRE | CMTLB },
>> +	{ 0x1924, 0x0000, PREFETCH_SHALLOW | CPRE | CMTLB },
>> +	{ 0x1940, 0x0000, PREFETCH_SHALLOW | CPRE | CMTLB },
>> +	{ 0x1941, 0x0004, PREFETCH_SHALLOW | CPRE | CMTLB },
>> +	{ 0x1943, 0x0000, PREFETCH_SHALLOW | CPRE | CMTLB },
>> +	{ 0x1944, 0x0000, PREFETCH_SHALLOW | CPRE | CMTLB },
>> +	{ 0x1947, 0x0000, PREFETCH_SHALLOW | CPRE | CMTLB },
>> +};
>> +
>> +static const struct actlr_config sm8550_gfx_actlr_cfg[] = {
>> +	{ 0x0000, 0x03ff, PREFETCH_DEEP | CPRE | CMTLB },
>> +};
>> +
>> +static const struct actlr_variant sm8550_actlr[] = {
>> +	{
>> +		.io_start = 0x15000000,
>> +		.actlrcfg = sm8550_apps_actlr_cfg,
>> +		.num_actlrcfg = ARRAY_SIZE(sm8550_apps_actlr_cfg)
>> +	}, {
>> +		.io_start = 0x03da0000,
>> +		.actlrcfg = sm8550_gfx_actlr_cfg,
>> +		.num_actlrcfg = ARRAY_SIZE(sm8550_gfx_actlr_cfg)
>> +	},
>> +};
>>
>>   static struct qcom_smmu *to_qcom_smmu(struct arm_smmu_device *smmu)
>>   {
>> @@ -606,6 +685,15 @@ static const struct qcom_smmu_match_data sdm845_smmu_500_data = {
>>   	/* Also no debug configuration. */
>>   };
>>
>> +
>> +static const struct qcom_smmu_match_data sm8550_smmu_500_impl0_data = {
>> +	.impl = &qcom_smmu_500_impl,
>> +	.adreno_impl = &qcom_adreno_smmu_500_impl,
>> +	.cfg = &qcom_smmu_impl0_cfg,
>> +	.actlrvar = sm8550_actlr,
>> +	.num_smmu = ARRAY_SIZE(sm8550_actlr),
>> +};
>> +
>>   static const struct qcom_smmu_match_data qcom_smmu_500_impl0_data = {
>>   	.impl = &qcom_smmu_500_impl,
>>   	.adreno_impl = &qcom_adreno_smmu_500_impl,
>> @@ -640,6 +728,7 @@ static const struct of_device_id __maybe_unused qcom_smmu_impl_of_match[] = {
>>   	{ .compatible = "qcom,sm8250-smmu-500", .data = &qcom_smmu_500_impl0_data },
>>   	{ .compatible = "qcom,sm8350-smmu-500", .data = &qcom_smmu_500_impl0_data },
>>   	{ .compatible = "qcom,sm8450-smmu-500", .data = &qcom_smmu_500_impl0_data },
>> +	{ .compatible = "qcom,sm8550-smmu-500", .data = &sm8550_smmu_500_impl0_data },
>>   	{ .compatible = "qcom,smmu-500", .data = &qcom_smmu_500_impl0_data },
>>   	{ }
>>   };
>> --
>> 2.34.1
>>
> 

