Return-Path: <linux-arm-msm+bounces-36382-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BCA59B5DFB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 09:35:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 98A7C1F23637
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 08:35:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4017E1E0E0E;
	Wed, 30 Oct 2024 08:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VGbXRyFc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63DBA1E0B67;
	Wed, 30 Oct 2024 08:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730277314; cv=none; b=mQRcLKZ2ayNGj8n5vtxOlYY5EKVBBZU5cpXA/E45qQUrAA2L21Ej+SEm2qdjPrRfvhvM6Ud0DKfGSkK6h3RjcpNp6U8J65VrtFSetClz83XzORPuhZEMwxNtD/q5AusPKn8fdWtgw6xvh5aJxfHRPgSJRXkCVCzf3yaN0R7obSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730277314; c=relaxed/simple;
	bh=8dax5nDbMT3tuvHeE1C9nEpTOwHf2M/p+ymwfRwflFY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ivTY/SwxOHKpIThAdvdi7mse/av/jNuO5bcX05WdlbKoUsSybhhW47LrL5Hvn8ssDZ/C7V7pqUKgJyaBNyZtGK5+65aLO8PK+qi3mocoVvmwusfVTTouY3dyBp6uvPdsv5rqBW6PAUgZ3keKsG2hi1MTTDQmukn2XigzBQaH6wY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VGbXRyFc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49TMYkTR016167;
	Wed, 30 Oct 2024 08:35:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q0IqmQotf9fFKgs6S7Kn0XqzLMyYfONzr0HyvEDAcJw=; b=VGbXRyFcZ2LcgRpi
	HnBnA5j0crg4lNoUBepIMkd5gkCqYQJMD3ZSD9yi5ZmOI5Qm8UXxQnm1NxNPlpWU
	fhwxZcFpkZSO7kcYv2VjXI68RPhJYDHQjFXvVr5fZP2iHMNwMgKvFKsPBSrrONpi
	MsdWvnMRPOyv+kxiKwDHSDCa8PGNDAZR8OmZBVwbvMPNBeGuBCPvMUj1vmuA64yh
	Z4IT8JuB/wkmECSBD8RBzvLfxmslHKfaw/Zqm0S/PvD9WF1ww+M1xZmWltKbvM3x
	l0iG/pYETvIFAt61kZ8uEC1dX1/aKZHjhHKTc+ZzMvG5pfwwmBSCHiUKmTOUEwSj
	y0meRA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42gp4e3frs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Oct 2024 08:35:01 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49U8Z1on013498
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Oct 2024 08:35:01 GMT
Received: from [10.239.133.49] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 30 Oct
 2024 01:34:58 -0700
Message-ID: <4c34c7a2-9ab4-4710-95d2-2e5eaf76658d@quicinc.com>
Date: Wed, 30 Oct 2024 16:34:34 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 RESEND 1/3] coresight-tpdm: Add MCMB dataset support
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>
CC: <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        Tao Zhang
	<quic_taozha@quicinc.com>
References: <20241011064732.8480-1-quic_jinlmao@quicinc.com>
 <20241011064732.8480-2-quic_jinlmao@quicinc.com>
 <111ddb4d-4765-4acd-82ba-efe25b3c4470@arm.com>
Content-Language: en-US
From: Jinlong Mao <quic_jinlmao@quicinc.com>
In-Reply-To: <111ddb4d-4765-4acd-82ba-efe25b3c4470@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 1ME7tc4BgbOf_c2FVNE8181sEBGLcqym
X-Proofpoint-GUID: 1ME7tc4BgbOf_c2FVNE8181sEBGLcqym
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 mlxlogscore=999 clxscore=1015 spamscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0
 mlxscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410300067



On 2024/10/23 17:33, Suzuki K Poulose wrote:
> On 11/10/2024 07:47, Mao Jinlong wrote:
>> MCMB (Multi-lane CMB) is a special form of CMB dataset type. MCMB
>> subunit TPDM has the same number and usage of registers as CMB
>> subunit TPDM. MCMB subunit can be enabled for data collection by
>> writing 1 to the first bit of CMB_CR register. The difference is
>> that MCMB subunit TPDM needs to select the lane and enable it in
>> using it.
>>
>> Signed-off-by: Tao Zhang <quic_taozha@quicinc.com>
>> Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
>> ---
>>   drivers/hwtracing/coresight/coresight-tpda.c |  5 ++-
>>   drivers/hwtracing/coresight/coresight-tpdm.c | 41 +++++++++++++++++---
>>   drivers/hwtracing/coresight/coresight-tpdm.h | 26 ++++++++++++-
>>   3 files changed, 63 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/ 
>> hwtracing/coresight/coresight-tpda.c
>> index bfca103f9f84..e063a31ff88a 100644
>> --- a/drivers/hwtracing/coresight/coresight-tpda.c
>> +++ b/drivers/hwtracing/coresight/coresight-tpda.c
>> @@ -1,6 +1,6 @@
>>   // SPDX-License-Identifier: GPL-2.0
>>   /*
>> - * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights 
>> reserved.
>> + * Copyright (c) 2023-2024 Qualcomm Innovation Center, Inc. All 
>> rights reserved.
>>    */
>>   #include <linux/amba/bus.h>
>> @@ -72,7 +72,8 @@ static int tpdm_read_element_size(struct 
>> tpda_drvdata *drvdata,
>>           rc = fwnode_property_read_u32(dev_fwnode(csdev->dev.parent),
>>                   "qcom,dsb-element-bits", &drvdata->dsb_esize);
>>       }
>> -    if (tpdm_has_cmb_dataset(tpdm_data)) {
>> +
>> +    if (tpdm_has_cmb_dataset(tpdm_data) || 
>> tpdm_has_mcmb_dataset(tpdm_data)) {
> 
> minor nit: All such places could be replaced by
> 
> if (tdpm_data->cmb)
> 
> Because at probe time we allocate the above structure ?
> 
> 
>>           rc = fwnode_property_read_u32(dev_fwnode(csdev->dev.parent),
>>                   "qcom,cmb-element-bits", &drvdata->cmb_esize);
>>       }
>> diff --git a/drivers/hwtracing/coresight/coresight-tpdm.c b/drivers/ 
>> hwtracing/coresight/coresight-tpdm.c
>> index 0726f8842552..58f8c3e804c1 100644
>> --- a/drivers/hwtracing/coresight/coresight-tpdm.c
>> +++ b/drivers/hwtracing/coresight/coresight-tpdm.c
>> @@ -1,6 +1,6 @@
>>   // SPDX-License-Identifier: GPL-2.0
>>   /*
>> - * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights 
>> reserved.
>> + * Copyright (c) 2023-2024 Qualcomm Innovation Center, Inc. All 
>> rights reserved.
>>    */
>>   #include <linux/amba/bus.h>
>> @@ -198,7 +198,8 @@ static umode_t tpdm_cmb_is_visible(struct kobject 
>> *kobj,
>>       struct device *dev = kobj_to_dev(kobj);
>>       struct tpdm_drvdata *drvdata = dev_get_drvdata(dev->parent);
>> -    if (drvdata && tpdm_has_cmb_dataset(drvdata))
>> +    if (drvdata && (tpdm_has_cmb_dataset(drvdata) ||
>> +            tpdm_has_mcmb_dataset(drvdata)))
> 
>      if (drvdata && drvdata->cmb) ?
> 
>>           return attr->mode;
>>       return 0;
>> @@ -246,8 +247,10 @@ static void tpdm_reset_datasets(struct 
>> tpdm_drvdata *drvdata)
>>           drvdata->dsb->trig_type = false;
>>       }
>> -    if (drvdata->cmb)
>> +    if (drvdata->cmb) {
>>           memset(drvdata->cmb, 0, sizeof(struct cmb_dataset));
>> +        drvdata->cmb->trig_ts = true;
>> +    }
>>   }
>>   static void set_dsb_mode(struct tpdm_drvdata *drvdata, u32 *val)
>> @@ -388,7 +391,8 @@ static void tpdm_enable_cmb(struct tpdm_drvdata 
>> *drvdata)
>>   {
>>       u32 val, i;
>> -    if (!tpdm_has_cmb_dataset(drvdata))
>> +    if (!(tpdm_has_cmb_dataset(drvdata) ||
>> +        tpdm_has_mcmb_dataset(drvdata)))
> 
>      if (!drvdata->cmb)
> 
>>           return;
>>       /* Configure pattern registers */
>> @@ -415,6 +419,19 @@ static void tpdm_enable_cmb(struct tpdm_drvdata 
>> *drvdata)
>>           val |= TPDM_CMB_CR_MODE;
>>       else
>>           val &= ~TPDM_CMB_CR_MODE;
>> +
>> +    if (tpdm_has_mcmb_dataset(drvdata)) {
>> +        val &= ~TPDM_CMB_CR_XTRIG_LNSEL;
>> +        /*Set the lane participates in tghe output pattern*/
> 
> minor nit: Leave a single space after '/*' and before '*/'
> 
>> +        val |= FIELD_PREP(TPDM_CMB_CR_XTRIG_LNSEL,
>> +            drvdata->cmb->mcmb->mcmb_trig_lane);
>> +
>> +        /* Set the enablement of the lane */
>> +        val &= ~TPDM_CMB_CR_E_LN;
>> +        val |= FIELD_PREP(TPDM_CMB_CR_E_LN,
>> +            drvdata->cmb->mcmb->mcmb_lane_select);
>> +    }
>> +
>>       /* Set the enable bit of CMB control register to 1 */
>>       val |= TPDM_CMB_CR_ENA;
>>       writel_relaxed(val, drvdata->base + TPDM_CMB_CR);
>> @@ -474,7 +491,8 @@ static void tpdm_disable_cmb(struct tpdm_drvdata 
>> *drvdata)
>>   {
>>       u32 val;
>> -    if (!tpdm_has_cmb_dataset(drvdata))
>> +    if (!(tpdm_has_cmb_dataset(drvdata) ||
>> +        tpdm_has_mcmb_dataset(drvdata)))
> 
>      if (!drvdata->cmb) ?
> 
>>           return;
>>       val = readl_relaxed(drvdata->base + TPDM_CMB_CR);
>> @@ -541,6 +559,19 @@ static int tpdm_datasets_setup(struct 
>> tpdm_drvdata *drvdata)
>>           if (!drvdata->cmb)
>>               return -ENOMEM;
>>       }
>> +
>> +    if (tpdm_has_mcmb_dataset(drvdata) && (!drvdata->cmb)) {
>> +        drvdata->cmb = devm_kzalloc(drvdata->dev,
>> +                        sizeof(*drvdata->cmb), GFP_KERNEL);
>> +        if (!drvdata->cmb)
>> +            return -ENOMEM;
>> +        drvdata->cmb->mcmb = devm_kzalloc(drvdata->dev,
>> +                        sizeof(*drvdata->cmb->mcmb),
>> +                        GFP_KERNEL);
> 
> Please avoid this ^^, instead embed the fields in drvdata as mentioned
> below.
> 
> Is it possible that both CMB and MCMB can be present on the same TPDM ?
> If so, we need to be careful about ^ block ?

CMB and MCMB won't be present on the same TPDM.

> 
> 
>> +        if (!drvdata->cmb->mcmb)
>> +            return -ENOMEM;
>> +    }
>> +
>>       tpdm_reset_datasets(drvdata);
>>       return 0;
>> diff --git a/drivers/hwtracing/coresight/coresight-tpdm.h b/drivers/ 
>> hwtracing/coresight/coresight-tpdm.h
>> index e08d212642e3..2e84daad1a58 100644
>> --- a/drivers/hwtracing/coresight/coresight-tpdm.h
>> +++ b/drivers/hwtracing/coresight/coresight-tpdm.h
>> @@ -1,6 +1,6 @@
>>   /* SPDX-License-Identifier: GPL-2.0 */
>>   /*
>> - * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights 
>> reserved.
>> + * Copyright (c) 2023-2024 Qualcomm Innovation Center, Inc. All 
>> rights reserved.
>>    */
>>   #ifndef _CORESIGHT_CORESIGHT_TPDM_H
>> @@ -9,7 +9,7 @@
>>   /* The max number of the datasets that TPDM supports */
>>   #define TPDM_DATASETS       7
>> -/* CMB Subunit Registers */
>> +/* CMB/MCMB Subunit Registers */
>>   #define TPDM_CMB_CR        (0xA00)
>>   /* CMB subunit timestamp insertion enable register */
>>   #define TPDM_CMB_TIER        (0xA04)
>> @@ -34,6 +34,10 @@
>>   #define TPDM_CMB_TIER_XTRIG_TSENAB    BIT(1)
>>   /* For timestamp fo all trace */
>>   #define TPDM_CMB_TIER_TS_ALL        BIT(2)
>> +/* MCMB trigger lane select */
>> +#define TPDM_CMB_CR_XTRIG_LNSEL        GENMASK(20, 18)
>> +/* MCMB lane enablement */
>> +#define TPDM_CMB_CR_E_LN        GENMASK(17, 10)
>>   /* Patten register number */
>>   #define TPDM_CMB_MAX_PATT        2
>> @@ -112,11 +116,13 @@
>>    * PERIPHIDR0[0] : Fix to 1 if ImplDef subunit present, else 0
>>    * PERIPHIDR0[1] : Fix to 1 if DSB subunit present, else 0
>>    * PERIPHIDR0[2] : Fix to 1 if CMB subunit present, else 0
>> + * PERIPHIDR0[6] : Fix to 1 if MCMB subunit present, else 0
>>    */
>>   #define TPDM_PIDR0_DS_IMPDEF    BIT(0)
>>   #define TPDM_PIDR0_DS_DSB    BIT(1)
>>   #define TPDM_PIDR0_DS_CMB    BIT(2)
>> +#define TPDM_PIDR0_DS_MCMB    BIT(6)
>>   #define TPDM_DSB_MAX_LINES    256
>>   /* MAX number of EDCR registers */
>> @@ -245,6 +251,16 @@ struct dsb_dataset {
>>       bool            trig_type;
>>   };
>> +/**
>> + * struct mcmb_dataset
>> + * @mcmb_trig_lane:       Save data for trigger lane
>> + * @mcmb_lane_select:     Save data for lane enablement
>> + */
>> +struct mcmb_dataset {
>> +    u8        mcmb_trig_lane;
>> +    u8        mcmb_lane_select;
>> +};
>> +
> 
> If it is only these two members, why not embed this in the cmb_dataset ?
> This takes just 2bytes and we are instead allocating 2bytes + 4bytes for 
> storing and additional pointer dereference + error handling of
> allocations etc.
> 
>>   /**
>>    * struct cmb_dataset
>>    * @trace_mode:       Dataset collection mode
>> @@ -267,6 +283,7 @@ struct cmb_dataset {
>>       bool            patt_ts;
>>       bool            trig_ts;
>>       bool            ts_all;
>> +    struct mcmb_dataset    *mcmb;
> 
>      struct             {
>          u8        trig_lane;
>          u8        lane_select;
>      } mcmb;
> 
> ?
> 
> Suzuki
> 
> 
> 
>>   };
>>   /**
>> @@ -334,4 +351,9 @@ static bool tpdm_has_cmb_dataset(struct 
>> tpdm_drvdata *drvdata)
>>   {
>>       return (drvdata->datasets & TPDM_PIDR0_DS_CMB);
>>   }
>> +
>> +static bool tpdm_has_mcmb_dataset(struct tpdm_drvdata *drvdata)
>> +{
>> +    return (drvdata->datasets & TPDM_PIDR0_DS_MCMB);
>> +}
>>   #endif  /* _CORESIGHT_CORESIGHT_TPDM_H */
> 


