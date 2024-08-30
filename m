Return-Path: <linux-arm-msm+bounces-30215-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EF88D965DC7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 12:01:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2002E1C22779
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 10:01:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CA1F17BB03;
	Fri, 30 Aug 2024 10:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gAVPbM2n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F10F137745;
	Fri, 30 Aug 2024 10:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725012088; cv=none; b=lzKKueCBUaMcseaLzLlZ1v3JQEpuuItorsoDKLxMvYXayE7ZkpF6lp08OsR5zkmq8+ZZRyGjCdGCRNfqwYo9iRIEk4QtoK0Fd98WH8bHbbks4uLnmyIWNJ92Hq7gSghz/IlXBnrYmkjehu8bCwMHLZ/upQWfyc/QbRKxD1L9Dzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725012088; c=relaxed/simple;
	bh=3gEEC4Ok+koYvLUVDxue9rWqkYti5189hpAZpkMKn5M=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:CC:References:
	 In-Reply-To:Content-Type; b=mJHaI64NBQY/+i71T09UDLL3VB5qfquCOr/zu/B1yWNjY7IMZc2nA26n2tLE8gkPMEFikHbi6llpXk6ddpxcfscszjL0yhABvfd+rLTwQnvi7qO4cTweSeDT2UhKAauPNbVDOE/EnlNg55XGDHxuKawi7+UYmxslkG1kaZL9dmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gAVPbM2n; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47U867fo026218;
	Fri, 30 Aug 2024 10:01:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DYk8xpnFqCsmU51gGjLMAjTQwUjVEAesOfknEHqYUYg=; b=gAVPbM2n/uocP5cU
	f8zGtWMOnfah4gSBxO6pANEOXCKh2MlWJsr27YupR632uOmy0dcNfQT//gXMGvf5
	R9c1M5UHHCG6AMkbHg6Pn1Tx9HXTDJLeb32GfIiKzp4DYaecN+rPwLDNfqEU+pv4
	RuAocxzDxoqZp9ynCNMJ9fZR/vWERWTQ+YJVBjEd2QQaDuSbz1cEW8ZFLAla+FNp
	95+rbxdtVBw4RHq84ebr79eGWb16Eq+5w+K5dhpCx7py8TwTZpuVU1rZMCu0u4Vy
	QVq/107Qt0FhdyY/nl0P3Z3lKhs50dJZRv8BVVXibs5qdBylOGP0HymaAGq7QS1w
	8baDjw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41a612p6jv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 Aug 2024 10:01:05 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47UA13Ja003560
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 Aug 2024 10:01:03 GMT
Received: from [10.214.66.253] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 30 Aug
 2024 03:00:59 -0700
Message-ID: <b335452a-977e-41cc-9424-a2244fbe20de@quicinc.com>
Date: Fri, 30 Aug 2024 15:30:16 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
Subject: Re: [PATCH v14 5/6] iommu/arm-smmu: add ACTLR data and support for
 SC7280
To: Will Deacon <will@kernel.org>
CC: <robdclark@gmail.com>, <robin.murphy@arm.com>, <joro@8bytes.org>,
        <jgg@ziepe.ca>, <jsnitsel@redhat.com>, <robh@kernel.org>,
        <krzysztof.kozlowski@linaro.org>, <quic_c_gdjako@quicinc.com>,
        <dmitry.baryshkov@linaro.org>, <konrad.dybcio@linaro.org>,
        <iommu@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20240816174259.2056829-1-quic_bibekkum@quicinc.com>
 <20240816174259.2056829-6-quic_bibekkum@quicinc.com>
 <20240823155918.GD525@willie-the-truck>
 <3ae75a75-1717-40b6-9149-bc3673d520d6@quicinc.com>
 <20240827124714.GB4772@willie-the-truck>
Content-Language: en-US
In-Reply-To: <20240827124714.GB4772@willie-the-truck>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: LscdnjTnYV7YYH3hD7yDGq0DEoiWdYci
X-Proofpoint-ORIG-GUID: LscdnjTnYV7YYH3hD7yDGq0DEoiWdYci
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-30_04,2024-08-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 spamscore=0 mlxlogscore=999 adultscore=0 suspectscore=0 mlxscore=0
 bulkscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2408300075



On 8/27/2024 6:17 PM, Will Deacon wrote:
> On Mon, Aug 26, 2024 at 04:33:24PM +0530, Bibek Kumar Patro wrote:
>>
>>
>> On 8/23/2024 9:29 PM, Will Deacon wrote:
>>> On Fri, Aug 16, 2024 at 11:12:58PM +0530, Bibek Kumar Patro wrote:
>>>> Add ACTLR data table for SC7280 along with support for
>>>> same including SC7280 specific implementation operations.
>>>>
>>>> Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
>>>> ---
>>>>    drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 58 +++++++++++++++++++++-
>>>>    1 file changed, 57 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>>> index dc143b250704..a776c7906c76 100644
>>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>>> @@ -31,6 +31,55 @@
>>>>    #define PREFETCH_MODERATE	(2 << PREFETCH_SHIFT)
>>>>    #define PREFETCH_DEEP		(3 << PREFETCH_SHIFT)
>>>>
>>>> +static const struct actlr_config sc7280_apps_actlr_cfg[] = {
>>>> +	{ 0x0800, 0x04e0, PREFETCH_DEFAULT | CMTLB },
>>>> +	{ 0x0900, 0x0402, PREFETCH_SHALLOW | CPRE | CMTLB },
>>>> +	{ 0x0901, 0x0000, PREFETCH_SHALLOW | CPRE | CMTLB },
>>>> +	{ 0x0d01, 0x0000, PREFETCH_SHALLOW | CPRE | CMTLB },
>>>> +	{ 0x1181, 0x0420, PREFETCH_DEEP | CPRE | CMTLB },
>>>> +	{ 0x1182, 0x0420, PREFETCH_DEEP | CPRE | CMTLB },
>>>> +	{ 0x1183, 0x0420, PREFETCH_DEEP | CPRE | CMTLB },
>>>> +	{ 0x1184, 0x0420, PREFETCH_DEEP | CPRE | CMTLB },
>>>> +	{ 0x1185, 0x0420, PREFETCH_DEEP | CPRE | CMTLB },
>>>> +	{ 0x1186, 0x0420, PREFETCH_DEEP | CPRE | CMTLB },
>>>> +	{ 0x1187, 0x0420, PREFETCH_DEEP | CPRE | CMTLB },
>>>> +	{ 0x1188, 0x0420, PREFETCH_DEEP | CPRE | CMTLB },
>>>> +	{ 0x1189, 0x0420, PREFETCH_DEEP | CPRE | CMTLB },
>>>> +	{ 0x118b, 0x0420, PREFETCH_DEEP | CPRE | CMTLB },
>>>> +	{ 0x118c, 0x0420, PREFETCH_DEEP | CPRE | CMTLB },
>>>> +	{ 0x118d, 0x0420, PREFETCH_DEEP | CPRE | CMTLB },
>>>> +	{ 0x118e, 0x0420, PREFETCH_DEEP | CPRE | CMTLB },
>>>> +	{ 0x118f, 0x0420, PREFETCH_DEEP | CPRE | CMTLB },
>>>> +	{ 0x2000, 0x0020, PREFETCH_DEFAULT | CMTLB },
>>>> +	{ 0x2040, 0x0000, PREFETCH_DEFAULT | CMTLB },
>>>> +	{ 0x2062, 0x0000, PREFETCH_DEFAULT | CMTLB },
>>>> +	{ 0x2080, 0x0020, PREFETCH_DEFAULT | CMTLB },
>>>> +	{ 0x20c0, 0x0020, PREFETCH_DEFAULT | CMTLB },
>>>> +	{ 0x2100, 0x0020, PREFETCH_DEFAULT | CMTLB },
>>>> +	{ 0x2140, 0x0000, PREFETCH_DEFAULT | CMTLB },
>>>> +	{ 0x2180, 0x0020, PREFETCH_SHALLOW | CPRE | CMTLB },
>>>> +	{ 0x2181, 0x0004, PREFETCH_SHALLOW | CPRE | CMTLB },
>>>> +	{ 0x2183, 0x0000, PREFETCH_SHALLOW | CPRE | CMTLB },
>>>> +	{ 0x2184, 0x0020, PREFETCH_SHALLOW | CPRE | CMTLB },
>>>> +	{ 0x2187, 0x0000, PREFETCH_SHALLOW | CPRE | CMTLB },
>>>> +};
>>>> +
>>>> +static const struct actlr_config sc7280_gfx_actlr_cfg[] = {
>>>> +	{ 0x0000, 0x07ff, PREFETCH_DEEP | CPRE | CMTLB },
>>>> +};
>>>
>>> It's Will "stuck record" Deacon here again to say that I don't think
>>> this data belongs in the driver.
>>>
>>
>> Hi Will,
>>
>> It will be difficult to reach a consensus here, with Robin and the DT folks
>> okay to keep it in the driver, while you believe it doesn't belong there.
>>
>> Robin, Rob, could you please share your thoughts on concluding the placement
>> of this prefetch data?
>>
>> As discussed earlier [1], the prefetch value for each client doesn’t define
>> the hardware topology and is implementation-defined register writes used by
>> the software driver.
> 
> It does reflect the hardware topology though, doesn't it? Those magic hex
> masks above refer to stream ids, so the table is hard-coding the prefetch
> values for particular matches.

That is correct in the sense that stream id is mapped to context bank
where these configurations are applied.
However the other part of it is implementation-defined register/values
for which community opinion was register/value kind of data, should not
belong to device tree and are not generally approved of.

Would also like to point out that the prefetch values are recommended
settings and doesn’t mean these are the only configuration which would
work for the soc.
So the SID-to-prefetch isn't strictly SoC defined but is a software
configuration, IMO.

> If I run on a different SoC configuration > with the same table, then the prefetch settings will be applied to the
> wrong devices. How is that not hardware topology?
> 

The configuration table is tied to SoC compatible string however as I
mentioned above, its basically a s/w recommended setting.
(using prefetch settings other than the recommended values e.g 
PREFECH_DEFAULT instead of PREFETCH_DEEP would not render the device 
unusable unlike changing stream-ids which can make it unusable).

Since it is implementation specific we cannot have a generic DT binding,
tying stream ids to these recommended settings.
Even with qcom specific binding due to dependency on implementation, not
sure if we would be able to maintain consistency.

So from maintenance perspective carrying these in driver appear to be
simpler/flexible. And if it doesn’t violate existing precedence, we
would prefer to carry it that way.

This parallels how _"QoS settings"_ are handled within the driver 
(similar to this example [1]).

[1]. 
https://lore.kernel.org/linux-arm-msm/20231030-sc8280xp-dpu-safe-lut-v1-1-6d485d7b428f@quicinc.com/#t

Thanks & regards,
Bibek

> WIll

