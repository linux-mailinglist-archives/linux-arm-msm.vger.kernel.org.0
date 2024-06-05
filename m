Return-Path: <linux-arm-msm+bounces-21756-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6104B8FCE76
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 15:09:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AA453B22416
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 13:07:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA37119AA57;
	Wed,  5 Jun 2024 12:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="eU4JHSLT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A84519AA41;
	Wed,  5 Jun 2024 12:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717590141; cv=none; b=c8VIkmwNWtc8jv1kiumV1nx1cXVZkxYd/XheM79+GSHz7bpmrfRDst33zsgiCcPSXt60rfY65IJ/zSUtyR3Ka0bZ40bvRvyTJboPaLgumtSi6vUVoTZ3K/xyJzbFO7h2tZaAOH58xs1PitWaslwyhYqsQv7nfnkxAGU+BVVgpD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717590141; c=relaxed/simple;
	bh=5PIqmk04EpxPfoDzSvogVN9pWORgaXhjn7g+gykLrxI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=lLDo1edFLZPQM1ZJZXQPAfP4hmQCLDXugceoCE6x58PK1T4ibJaYmve2I1m0krUMDOx0aM3Wkbil5g2/j83p3VgaBh1bwRgL/D5P+Kk8Nt8jP1footdSdjM2Eru9mYWGVkIzGLtW30NtbW1KW2s4ctB++3kxEJF+Ou1U4PiCF20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=eU4JHSLT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 455B1ZaR031042;
	Wed, 5 Jun 2024 12:21:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JlC8xCa5L983STcm1YpIefgILyOyCLHxYmIDVUr6YMI=; b=eU4JHSLT5sFSlugX
	sOKllOhnabOfYJoi+LWSQJrXbUV8md/kja+WNIG5Up+wRRhRLB3LzUygii6tKO7K
	BDxhj2h4xmUN6tEfLyHSYnHQNfuBymQLwtAXeOzwmQjj43o98nbjN6FsKXFwEbAe
	9wooVXr5Y0qJqWiorXbvdlEth2Gm6+DcqIil9wTk6r34ZHRR22LDNE0bdGmdzAm8
	jxtUMB1N4hiBAsJNBZB17GR/V/sjNJCrd8/WKk/1FbLuV6PlgEJF3KHO7t3UqXWy
	loVysDm09gzjmQb/FBx558RjiR+IRq8LlRnM9/4OsMyLX1YjelzOrsP5dx7wk887
	5teBiQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yj87rhy3w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 12:21:58 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 455CLv2d006945
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 5 Jun 2024 12:21:57 GMT
Received: from [10.214.66.253] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 5 Jun 2024
 05:21:50 -0700
Message-ID: <dc6efedd-5c0c-4e2c-b3b4-6661517beb6f@quicinc.com>
Date: Wed, 5 Jun 2024 17:51:47 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 4/5] iommu/arm-smmu: add ACTLR data and support for
 SM8550
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
References: <20240116150411.23876-1-quic_bibekkum@quicinc.com>
 <20240116150411.23876-5-quic_bibekkum@quicinc.com>
 <CAF6AEGsO+qxMPG8P5gPwt2KUvNscuUbLZ9OzHNGKJA_=bnoshw@mail.gmail.com>
Content-Language: en-US
From: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
In-Reply-To: <CAF6AEGsO+qxMPG8P5gPwt2KUvNscuUbLZ9OzHNGKJA_=bnoshw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: -sNQRoRtfgk9xeJZRAdj0Pghzm4bSLvB
X-Proofpoint-ORIG-GUID: -sNQRoRtfgk9xeJZRAdj0Pghzm4bSLvB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-05_02,2024-06-05_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 spamscore=0 mlxlogscore=999 adultscore=0 lowpriorityscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406050094



On 6/4/2024 10:43 PM, Rob Clark wrote:
> On Tue, Jan 16, 2024 at 7:06 AM Bibek Kumar Patro
> <quic_bibekkum@quicinc.com> wrote:
>>
>> Add ACTLR data table for SM8550 along with support for
>> same including SM8550 specific implementation operations.
>>
>> Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
>> ---
>>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 85 ++++++++++++++++++++++
>>   1 file changed, 85 insertions(+)
>>
>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>> index e6fad02aae92..26acfbdafd0f 100644
>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>> @@ -23,6 +23,12 @@
>>
>>   #define CPRE                   (1 << 1)
>>   #define CMTLB                  (1 << 0)
>> +#define PREFETCH_SHIFT         8
>> +#define PREFETCH_DEFAULT       0
>> +#define PREFETCH_SHALLOW       (1 << PREFETCH_SHIFT)
>> +#define PREFETCH_MODERATE      (2 << PREFETCH_SHIFT)
>> +#define PREFETCH_DEEP          (3 << PREFETCH_SHIFT)
>> +#define PREFETCH_SWITCH_GFX    (5 << 3)
> 
> so, PREFETCH_SWITCH_GFX seems to actually be two things, b5 is
> actually PRR_ENABLE and b3 is ??
> 

only b5 is not prr related bit as I checked now, will drop b3
and use this field for PRR bit only.

Thanks & regards,
Bibek

> Probably you should drop the PRR_ENABLE, and perhaps give b3 a better name
>  > BR,
> -R
> 

Thanks & regards,
Bibek
>>
>>   struct actlr_config {
>>          u16 sid;
>> @@ -30,6 +36,75 @@ struct actlr_config {
>>          u32 actlr;
>>   };
>>
>> +static const struct actlr_config sm8550_apps_actlr_cfg[] = {
>> +       { 0x18a0, 0x0000, PREFETCH_SHALLOW | CPRE | CMTLB },
>> +       { 0x18e0, 0x0000, PREFETCH_SHALLOW | CPRE | CMTLB },
>> +       { 0x0800, 0x0020, PREFETCH_DEFAULT | CMTLB },
>> +       { 0x1800, 0x00c0, PREFETCH_DEFAULT | CMTLB },
>> +       { 0x1820, 0x0000, PREFETCH_DEFAULT | CMTLB },
>> +       { 0x1860, 0x0000, PREFETCH_DEFAULT | CMTLB },
>> +       { 0x0c01, 0x0020, PREFETCH_DEEP | CPRE | CMTLB },
>> +       { 0x0c02, 0x0020, PREFETCH_DEEP | CPRE | CMTLB },
>> +       { 0x0c03, 0x0020, PREFETCH_DEEP | CPRE | CMTLB },
>> +       { 0x0c04, 0x0020, PREFETCH_DEEP | CPRE | CMTLB },
>> +       { 0x0c05, 0x0020, PREFETCH_DEEP | CPRE | CMTLB },
>> +       { 0x0c06, 0x0020, PREFETCH_DEEP | CPRE | CMTLB },
>> +       { 0x0c07, 0x0020, PREFETCH_DEEP | CPRE | CMTLB },
>> +       { 0x0c08, 0x0020, PREFETCH_DEEP | CPRE | CMTLB },
>> +       { 0x0c09, 0x0020, PREFETCH_DEEP | CPRE | CMTLB },
>> +       { 0x0c0c, 0x0020, PREFETCH_DEEP | CPRE | CMTLB },
>> +       { 0x0c0d, 0x0020, PREFETCH_DEEP | CPRE | CMTLB },
>> +       { 0x0c0e, 0x0020, PREFETCH_DEEP | CPRE | CMTLB },
>> +       { 0x0c0f, 0x0020, PREFETCH_DEEP | CPRE | CMTLB },
>> +       { 0x1961, 0x0000, PREFETCH_DEEP | CPRE | CMTLB },
>> +       { 0x1962, 0x0000, PREFETCH_DEEP | CPRE | CMTLB },
>> +       { 0x1963, 0x0000, PREFETCH_DEEP | CPRE | CMTLB },
>> +       { 0x1964, 0x0000, PREFETCH_DEEP | CPRE | CMTLB },
>> +       { 0x1965, 0x0000, PREFETCH_DEEP | CPRE | CMTLB },
>> +       { 0x1966, 0x0000, PREFETCH_DEEP | CPRE | CMTLB },
>> +       { 0x1967, 0x0000, PREFETCH_DEEP | CPRE | CMTLB },
>> +       { 0x1968, 0x0000, PREFETCH_DEEP | CPRE | CMTLB },
>> +       { 0x1969, 0x0000, PREFETCH_DEEP | CPRE | CMTLB },
>> +       { 0x196c, 0x0000, PREFETCH_DEEP | CPRE | CMTLB },
>> +       { 0x196d, 0x0000, PREFETCH_DEEP | CPRE | CMTLB },
>> +       { 0x196e, 0x0000, PREFETCH_DEEP | CPRE | CMTLB },
>> +       { 0x196f, 0x0000, PREFETCH_DEEP | CPRE | CMTLB },
>> +       { 0x19c1, 0x0010, PREFETCH_DEEP | CPRE | CMTLB },
>> +       { 0x19c2, 0x0010, PREFETCH_DEEP | CPRE | CMTLB },
>> +       { 0x19c3, 0x0010, PREFETCH_DEEP | CPRE | CMTLB },
>> +       { 0x19c4, 0x0010, PREFETCH_DEEP | CPRE | CMTLB },
>> +       { 0x19c5, 0x0010, PREFETCH_DEEP | CPRE | CMTLB },
>> +       { 0x19c6, 0x0010, PREFETCH_DEEP | CPRE | CMTLB },
>> +       { 0x19c7, 0x0010, PREFETCH_DEEP | CPRE | CMTLB },
>> +       { 0x19c8, 0x0010, PREFETCH_DEEP | CPRE | CMTLB },
>> +       { 0x19c9, 0x0010, PREFETCH_DEEP | CPRE | CMTLB },
>> +       { 0x19cc, 0x0010, PREFETCH_DEEP | CPRE | CMTLB },
>> +       { 0x19cd, 0x0010, PREFETCH_DEEP | CPRE | CMTLB },
>> +       { 0x19ce, 0x0010, PREFETCH_DEEP | CPRE | CMTLB },
>> +       { 0x19cf, 0x0010, PREFETCH_DEEP | CPRE | CMTLB },
>> +       { 0x1c00, 0x0002, PREFETCH_SHALLOW | CPRE | CMTLB },
>> +       { 0x1c01, 0x0000, PREFETCH_DEFAULT | CMTLB },
>> +       { 0x1920, 0x0000, PREFETCH_SHALLOW | CPRE | CMTLB },
>> +       { 0x1923, 0x0000, PREFETCH_SHALLOW | CPRE | CMTLB },
>> +       { 0x1924, 0x0000, PREFETCH_SHALLOW | CPRE | CMTLB },
>> +       { 0x1940, 0x0000, PREFETCH_SHALLOW | CPRE | CMTLB },
>> +       { 0x1941, 0x0004, PREFETCH_SHALLOW | CPRE | CMTLB },
>> +       { 0x1943, 0x0000, PREFETCH_SHALLOW | CPRE | CMTLB },
>> +       { 0x1944, 0x0000, PREFETCH_SHALLOW | CPRE | CMTLB },
>> +       { 0x1947, 0x0000, PREFETCH_SHALLOW | CPRE | CMTLB },
>> +};
>> +
>> +static const struct actlr_config sm8550_gfx_actlr_cfg[] = {
>> +       { 0x0000, 0x03ff, PREFETCH_SWITCH_GFX | PREFETCH_DEEP | CPRE | CMTLB },
>> +};
>> +
>> +static const struct actlr_variant sm8550_actlr[] = {
>> +       { .io_start = 0x15000000, .actlrcfg = sm8550_apps_actlr_cfg,
>> +                       .num_actlrcfg = ARRAY_SIZE(sm8550_apps_actlr_cfg) },
>> +       { .io_start = 0x03da0000, .actlrcfg = sm8550_gfx_actlr_cfg,
>> +                       .num_actlrcfg = ARRAY_SIZE(sm8550_gfx_actlr_cfg) },
>> +};
>> +
>>   static struct qcom_smmu *to_qcom_smmu(struct arm_smmu_device *smmu)
>>   {
>>          return container_of(smmu, struct qcom_smmu, smmu);
>> @@ -601,6 +676,15 @@ static const struct qcom_smmu_match_data sdm845_smmu_500_data = {
>>          /* Also no debug configuration. */
>>   };
>>
>> +
>> +static const struct qcom_smmu_match_data sm8550_smmu_500_impl0_data = {
>> +       .impl = &qcom_smmu_500_impl,
>> +       .adreno_impl = &qcom_adreno_smmu_500_impl,
>> +       .cfg = &qcom_smmu_impl0_cfg,
>> +       .actlrvar = sm8550_actlr,
>> +       .num_smmu = ARRAY_SIZE(sm8550_actlr),
>> +};
>> +
>>   static const struct qcom_smmu_match_data qcom_smmu_500_impl0_data = {
>>          .impl = &qcom_smmu_500_impl,
>>          .adreno_impl = &qcom_adreno_smmu_500_impl,
>> @@ -635,6 +719,7 @@ static const struct of_device_id __maybe_unused qcom_smmu_impl_of_match[] = {
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
>>

