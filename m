Return-Path: <linux-arm-msm+bounces-69874-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB54B2D422
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 08:38:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 856D4175939
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 06:38:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBAB322A817;
	Wed, 20 Aug 2025 06:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jBQgBuxI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34D535336A;
	Wed, 20 Aug 2025 06:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755671890; cv=none; b=aTYOor9fQx747COYwJcAUGL26YkmYVVHvINCylmothkrL21jqP0NIvSb3adsMYlQ0hSgjs4joSBeboJsnfQl2WW3gazka6ldOMlieuACA/wKxCkKbuaDA2lGWUUglwZEt2ml2VaOYI78ZTB4Ak33IO5w5JmcoQUvwxwZzNkjU8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755671890; c=relaxed/simple;
	bh=+U6ld1iOfEhR8TxN/eQkKRpzew4eQlS5g+HYESpXTOk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=MNThriwsh5pQXvYuRhHyyUwUe3NTpaj93U40NlBbBZvuSibZcnL3i6TSk1sI6Wwr/ejo7j5VnZVvZxOFr7Fd6vOdlLS5eNpu6JrnE/JDtQUR5EEE5IQGNDyLZ9ryiVSKigvBeo79avJKUpc5MerknaVK8+4jNvY1iwbUlasjBkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jBQgBuxI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57K1p3Pj021262;
	Wed, 20 Aug 2025 06:38:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jyu59zrtUvE/zad1Cgw8ZOa/vxAmIKD3+iAD66jXfY4=; b=jBQgBuxI5XCvYYds
	QuOhroGBB7BlGgg9ixR88qt9reIfNI2pYVeIhu9UkV8jVKA45G75LvRhr9gvIJZo
	NPvuVGvBA1kqamtmtgpRKLtXIhycZTqZmqrDpVdb1XLYKBLI12uLQOiLD4S/u7Vc
	3FNONe7CyqdR/nuUhPvr8fUmhYjTC4x0juk0aoUEjxVsbLDpkDur5wPFsQOjALjk
	tmAtpiLGkTuRMqelqoBEAZG/bOBZTmfY0rg5nfX2K4VivmoKDNaZw+8xJUVJkcOa
	8WvzbRevhcXL35C85cQel7hTYpHACx95AinNh2jGvc+KVCcbzDUHC1GcnQfpo+Sz
	MwIVMA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n5290nfr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Aug 2025 06:38:04 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57K6c39F024136
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Aug 2025 06:38:03 GMT
Received: from [10.216.14.39] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 19 Aug
 2025 23:38:00 -0700
Message-ID: <b453b8ff-a460-4ccd-9019-aed746a7d52d@quicinc.com>
Date: Wed, 20 Aug 2025 12:07:57 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 2/2] phy: qcom-qmp-ufs: Add regulator loads for SM8650
 and SM8750
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: <vkoul@kernel.org>, <kishon@kernel.org>, <mani@kernel.org>,
        <andersson@kernel.org>, <konradybcio@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
References: <20250819222832.8471-1-quic_nitirawa@quicinc.com>
 <20250819222832.8471-3-quic_nitirawa@quicinc.com>
 <ger4kizeltjwalfuwu4dpfjiskrv2okgo5c7d6n3pb24yaxgfo@nkcndblyx3il>
Content-Language: en-US
From: Nitin Rawat <quic_nitirawa@quicinc.com>
In-Reply-To: <ger4kizeltjwalfuwu4dpfjiskrv2okgo5c7d6n3pb24yaxgfo@nkcndblyx3il>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: BQvDRfkUthZMWI5Gn7a_DJzQDd4m8iFZ
X-Proofpoint-ORIG-GUID: BQvDRfkUthZMWI5Gn7a_DJzQDd4m8iFZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX/2to/qJcLkvr
 6BEkScyV+2tK1n25Lf74iJWDNmFjNYJv9dyTwtCuUNIMCo2Ze9Q1CUIF6tK8+Ml5hYV7dtqdqGH
 7WVUmQzJ3sZxj9jwZoSDpV0ssOS5q3WRiRZ0Wa9+a+0fs+wglIm+Qghem5gPuakmoYoP6MRSio9
 ggdXJ68P1zaoRW0fI1CW776wq/sclyasrJSdpSv4jYii3r8HCJXOB/T/pEy8fOUaj7Nkb1PlIS+
 3kBeOtx733tNUsFWJeRuMdnZPlVFuuF3kzCXrjNT592V+5J7RyLwCvOqk02c0GHM3nObhxPXqSf
 YVNTulS0cc/TzXss1IpuRqeG2rMq2i0ddQJkZ2DcN9pMDtel9URH8ZgGfVlywf1/KYaHwbwMdgg
 VsFYt4x+P9G2IDGPh1AQgJVvqAB9yQ==
X-Authority-Analysis: v=2.4 cv=SPkblOvH c=1 sm=1 tr=0 ts=68a56d4c cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=nb8l9q_sgcfmG5NmqRQA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013



On 8/20/2025 6:19 AM, Dmitry Baryshkov wrote:
> On Wed, Aug 20, 2025 at 03:58:26AM +0530, Nitin Rawat wrote:
>> Add regulator load voting support for SM8650 and SM8750 platforms by
>> introducing dedicated regulator bulk data arrays with their load
>> values.
>>
>> The load requirements are:
>> - SM8650: vdda-phy (205mA), vdda-pll (17.5mA)
>> - SM8750: vdda-phy (213mA), vdda-pll (18.3mA)
>>
>> This ensures stable operation and proper power management for these
>> platforms where regulators are shared between the QMP USB PHY and
>> other IP blocks by setting appropriate regulator load currents during PHY
>> operations.
>>
>> Configurations without specific load requirements will continue to work
>> unchanged, as init_load_uA remains zero-initialized when .init_load_uA
>> is not provided.
> 
> Can we please get configuration for the rest of the platforms?

Hi Dmitry,

If you're okay with it, can I merge the configuration for the remaining 
platforms in the next patch series after I complete testing on all 
remaining platforms.

Regards,
Nitin

> 
>>
>> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
>> ---
>>   drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 19 +++++++++++++++----
>>   1 file changed, 15 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
>> index aaa88ca0ef07..1c3ce0fa6adf 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
>> @@ -1170,6 +1170,17 @@ static const struct regulator_bulk_data qmp_phy_vreg_l[] = {
>>   	{ .supply = "vdda-pll" },
>>   };
>>
>> +/* Regulator bulk data with load values for specific configurations */
>> +static const struct regulator_bulk_data sm8650_ufsphy_vreg_l[] = {
>> +	{ .supply = "vdda-phy", .init_load_uA = 205000 },
>> +	{ .supply = "vdda-pll", .init_load_uA = 17500 },
>> +};
>> +
>> +static const struct regulator_bulk_data sm8750_ufsphy_vreg_l[] = {
>> +	{ .supply = "vdda-phy", .init_load_uA = 213000 },
>> +	{ .supply = "vdda-pll", .init_load_uA = 18300 },
>> +};
>> +
>>   static const struct qmp_ufs_offsets qmp_ufs_offsets = {
>>   	.serdes		= 0,
>>   	.pcs		= 0xc00,
>> @@ -1638,8 +1649,8 @@ static const struct qmp_phy_cfg sm8650_ufsphy_cfg = {
>>   		.max_gear	= UFS_HS_G5,
>>   	},
>>
>> -	.vreg_list		= qmp_phy_vreg_l,
>> -	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
>> +	.vreg_list		= sm8650_ufsphy_vreg_l,
>> +	.num_vregs		= ARRAY_SIZE(sm8650_ufsphy_vreg_l),
>>   	.regs			= ufsphy_v6_regs_layout,
>>   };
>>
>> @@ -1676,8 +1687,8 @@ static const struct qmp_phy_cfg sm8750_ufsphy_cfg = {
>>   		.max_gear	= UFS_HS_G5,
>>   	},
>>
>> -	.vreg_list		= qmp_phy_vreg_l,
>> -	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
>> +	.vreg_list		= sm8750_ufsphy_vreg_l,
>> +	.num_vregs		= ARRAY_SIZE(sm8750_ufsphy_vreg_l),
>>   	.regs			= ufsphy_v6_regs_layout,
>>
>>   };
>> --
>> 2.48.1
>>
> 


