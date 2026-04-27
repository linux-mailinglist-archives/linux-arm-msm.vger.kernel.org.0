Return-Path: <linux-arm-msm+bounces-104641-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qM2OD54T72l85wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104641-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 09:43:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A892B46E837
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 09:43:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7C0D530073D4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 07:43:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB4883822B2;
	Mon, 27 Apr 2026 07:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OjA8+4cE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E01D379987;
	Mon, 27 Apr 2026 07:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777275789; cv=none; b=YENOjOnpo+OeOzHDkoQAUoZ58Yl85ReA2WtSLhO6JFYJa95Bt7fukMctdAcAbV6i1ZNPWxlav0UvsJCLTATVyyP2ksJJsSoi0h8YxHef9Tj641V5fBt3ghm6CACv0KYTuEb40z2GZA/BvvdE2ZXgZ+k+zKpnN6gkXEHmTohWWb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777275789; c=relaxed/simple;
	bh=K8PfeVs7C6+WhrZfZ70QMURIbuRDPsFpX63TBuhoWAo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=VIonviN/qJvnA19WjLP8XZw0KJqzM2LnWS6DdF5Xr5kih5jI8G2FvX3x/ZU+6t0kxjayjMsFtb0Ie6GBGYnRcKf40y2dCOlaVPcyJHRN3QgBL9BADBtRzYSzNpD9xxL7yIHaiiXV1ziPvwvAxHpUyCqTcePtA3EQFWyHpgDnqYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=OjA8+4cE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R64Za62583841;
	Mon, 27 Apr 2026 07:43:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XY5/B5BmXIfc07c7SIF9IfKpOKxShfT31vQUiNN9UJ8=; b=OjA8+4cE+3CxDrXS
	07iNsY1al6bjhGytHw1qpdgBQl3Js24TBW5SscCOyH2hBaxSQhRHFaTCMVCx3D3E
	57ohr+JyTkYsx/vy0KA8HkMjZFxtnx8V3s6DuR/zOSNAFQVL3yTDlyyadSzGl8tj
	TrcqKSRehLe3mqgSJ5N/0YJOnsTGAvNjisiN2+lL8+p58gqFZkaNZk9InsxNpnxg
	1eRGBZd+EWT9cBoNai/xEimBrZLpZEr3PCwUYLu8XkGKWKyJc+jpRKuy6SZD17i4
	S58FHvS8VDafGi8aRB9rWimRj7g/Z9xDVKQAqadhZ85MzWqEnTZ2YWejXLzdu3kG
	jF1PzQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt26xgbgb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Apr 2026 07:42:59 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTPS id 63R7gwUW029695
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Apr 2026 07:42:58 GMT
Received: from [10.233.71.148] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 27 Apr
 2026 00:42:55 -0700
Message-ID: <4a76f9aa-d3f6-4841-a883-022a0c56fc9c@quicinc.com>
Date: Mon, 27 Apr 2026 15:42:53 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/4] coresight: cti: add Qualcomm extended CTI
 identification and quirks
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Yingchao Deng
	<yingchao.deng@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        "Leo
 Yan" <leo.yan@arm.com>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>
CC: <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        Jinlong Mao
	<jinlong.mao@oss.qualcomm.com>,
        Tingwei Zhang
	<tingwei.zhang@oss.qualcomm.com>,
        Yingchao Deng <quic_yingdeng@quicinc.com>
References: <20260426-extended-cti-v8-0-23b900a4902f@oss.qualcomm.com>
 <20260426-extended-cti-v8-3-23b900a4902f@oss.qualcomm.com>
 <337789c5-7311-4613-9daf-915fcae0c6fc@oss.qualcomm.com>
Content-Language: en-US
From: "Yingchao Deng (Consultant)" <quic_yingdeng@quicinc.com>
In-Reply-To: <337789c5-7311-4613-9daf-915fcae0c6fc@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-GUID: 5wbLSuJlrNdLT7ism9sx_pV8ekLs61BY
X-Proofpoint-ORIG-GUID: 5wbLSuJlrNdLT7ism9sx_pV8ekLs61BY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDA4MSBTYWx0ZWRfX9KjknpFSa+DJ
 N8bJuqoS7aMzNXrsQPh47eH1dRW1hm/ifNP8t30CkLLLE55OBzkwD/GDvye6AV1/P8L/CoEU4Bf
 IyAu0spo7bx05cPz6nI/IHX/NXfS3pJ4ROoD0YtqddVQcBhdFDlbS+8WUoE5fMYzLseaJXnbNu4
 7lgPh2Cpbf51f1VB38Yo/7K3aN5oGkhBC0XJ+5YTdtDJPmUeDQBpAbi/IM6+FwEZAt2qBIIedDF
 Es5Lu/MTpoqS1FsZ4nXILdq9afjcVdI0gGkACDSHboSUx5+m0frYNOiTox/nsoYZ3PmdS8BuzXH
 lwY6OP8e9zy9jEWJOQpHDOP88CSvfp0DFRrO+Tk2Koa2cn/JHSLfWPNLzPeQ8q9jGKAJ+ZQypzQ
 2D1HJyVfL2Na2ffVua5nbF8//+jK1xMT8zIUW+HoBPI436RbwhQ2THFRKY7rAa068VPmk07E/vE
 inYqq4808c+XLRhZltQ==
X-Authority-Analysis: v=2.4 cv=FM8rAeos c=1 sm=1 tr=0 ts=69ef1383 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=N0EiosT1q-aN2Bz525kA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0 phishscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270081
X-Rspamd-Queue-Id: A892B46E837
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[quicinc.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[quicinc.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-104641-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[quicinc.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:dkim,quicinc.com:mid,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[quic_yingdeng@quicinc.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]


On 4/27/2026 3:39 PM, Jie Gan wrote:
>
>
> On 4/26/2026 5:44 PM, Yingchao Deng wrote:
>> Qualcomm implements an extended variant of the ARM CoreSight CTI with a
>> different register layout and vendor-specific behavior. While the
>> programming model remains largely compatible, the register offsets 
>> differ
>> from the standard ARM CTI and require explicit handling.
>>
>> Detect Qualcomm CTIs via the DEVARCH register and record this in the CTI
>> driver data. Introduce a small mapping layer to translate standard CTI
>> register offsets to Qualcomm-specific offsets, allowing the rest of the
>> driver to use a common register access path.
>>
>> Additionally, handle a Qualcomm-specific quirk where the CLAIMSET
>> register is incorrectly initialized to a non-zero value, which can cause
>> tools or drivers to assume the component is already claimed. Clear the
>> register during probe to reflect the actual unclaimed state.
>>
>> No functional change is intended for standard ARM CTI devices.
>>
>> Co-developed-by: Jinlong Mao <jinlong.mao@oss.qualcomm.com>
>> Signed-off-by: Jinlong Mao <jinlong.mao@oss.qualcomm.com>
>> Signed-off-by: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
>> ---
>>   drivers/hwtracing/coresight/coresight-cti-core.c | 28 +++++++++-
>>   drivers/hwtracing/coresight/coresight-cti.h      |  4 +-
>>   drivers/hwtracing/coresight/qcom-cti.h           | 65 
>> ++++++++++++++++++++++++
>>   3 files changed, 95 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-cti-core.c 
>> b/drivers/hwtracing/coresight/coresight-cti-core.c
>> index c4cbeb64365b..b1c69a3e9b99 100644
>> --- a/drivers/hwtracing/coresight/coresight-cti-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-cti-core.c
>> @@ -21,6 +21,7 @@
>>     #include "coresight-priv.h"
>>   #include "coresight-cti.h"
>> +#include "qcom-cti.h"
>>     /*
>>    * CTI devices can be associated with a PE, or be connected to 
>> CoreSight
>> @@ -47,6 +48,10 @@ static void __iomem *cti_reg_addr(struct 
>> cti_drvdata *drvdata, int reg)
>>       u32 offset = CTI_REG_CLR_NR(reg);
>>       u32 nr = CTI_REG_GET_NR(reg);
>>   +    /* convert to qcom specific offset */
>> +    if (unlikely(drvdata->is_qcom_cti))
>
> I prefer to drop the unlikely here, let the cpu do the branch predictor.
>
>> +        offset = cti_qcom_reg_off(offset);
>> +
>>       return drvdata->base + offset + sizeof(u32) * nr;
>>   }
>>   @@ -170,6 +175,9 @@ void cti_write_intack(struct device *dev, u32 
>> ackval)
>>   /* DEVID[19:16] - number of CTM channels */
>>   #define CTI_DEVID_CTMCHANNELS(devid_val) ((int) BMVAL(devid_val, 
>> 16, 19))
>>   +/* DEVARCH[31:21] - ARCHITECT */
>> +#define CTI_DEVARCH_ARCHITECT(devarch_val) ((int)BMVAL(devarch_val, 
>> 21, 31))
>> +
>>   static int cti_set_default_config(struct device *dev,
>>                     struct cti_drvdata *drvdata)
>>   {
>> @@ -700,6 +708,7 @@ static int cti_probe(struct amba_device *adev, 
>> const struct amba_id *id)
>>       struct coresight_desc cti_desc;
>>       struct coresight_platform_data *pdata = NULL;
>>       struct resource *res = &adev->res;
>> +    u32 devarch;
>>         /* driver data*/
>>       drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
>> @@ -724,6 +733,22 @@ static int cti_probe(struct amba_device *adev, 
>> const struct amba_id *id)
>>         raw_spin_lock_init(&drvdata->spinlock);
>>   +    devarch = readl_relaxed(drvdata->base + CORESIGHT_DEVARCH);
>> +    if (CTI_DEVARCH_ARCHITECT(devarch) == ARCHITECT_QCOM) {
>> +        drvdata->is_qcom_cti = true;
>> +        /*
>> +         * QCOM CTI does not implement Claimtag functionality as
>> +         * per CoreSight specification, but its CLAIMSET register
>> +         * is incorrectly initialized to 0xF. This can mislead
>> +         * tools or drivers into thinking the component is claimed.
>> +         *
>> +         * Reset CLAIMSET to 0 to reflect that no claims are active.
>> +         */
>> +        CS_UNLOCK(drvdata->base);
>> +        writel_relaxed(0, drvdata->base + CORESIGHT_CLAIMSET);
>> +        CS_LOCK(drvdata->base);
>> +    }
>> +
>>       /* initialise CTI driver config values */
>>       ret = cti_set_default_config(dev, drvdata);
>>       if (ret)
>> @@ -780,7 +805,8 @@ static int cti_probe(struct amba_device *adev, 
>> const struct amba_id *id)
>>         /* all done - dec pm refcount */
>>       pm_runtime_put(&adev->dev);
>> -    dev_info(&drvdata->csdev->dev, "CTI initialized\n");
>> +    dev_info(&drvdata->csdev->dev,
>> +         "%sCTI initialized\n", drvdata->is_qcom_cti ? "QCOM " : "");
>>       return 0;
>>   }
>>   diff --git a/drivers/hwtracing/coresight/coresight-cti.h 
>> b/drivers/hwtracing/coresight/coresight-cti.h
>> index dd1ba44518c4..2598601e7b93 100644
>> --- a/drivers/hwtracing/coresight/coresight-cti.h
>> +++ b/drivers/hwtracing/coresight/coresight-cti.h
>> @@ -55,10 +55,11 @@ struct fwnode_handle;
>>   /*
>>    * CTI CSSoc 600 has a max of 32 trigger signals per direction.
>>    * CTI CSSoc 400 has 8 IO triggers - other CTIs can be impl def.
>> + * QCOM CTI supports up to 128 trigger signals per direction.
>>    * Max of in and out defined in the DEVID register.
>>    * - pick up actual number used from .dts parameters if present.
>>    */
>> -#define CTIINOUTEN_MAX        32
>> +#define CTIINOUTEN_MAX        128
>>     /*
>>    * Encode CTI register offset and register index in one u32:
>> @@ -188,6 +189,7 @@ struct cti_drvdata {
>>       raw_spinlock_t spinlock;
>>       struct cti_config config;
>>       struct list_head node;
>> +    bool is_qcom_cti;
>
> missed document.
>
> Thanks,
> Jie
>
will update.

Thanks,
Yingchao
>>   };
>>     /*
>> diff --git a/drivers/hwtracing/coresight/qcom-cti.h 
>> b/drivers/hwtracing/coresight/qcom-cti.h
>> new file mode 100644
>> index 000000000000..fd1bf07d7cb4
>> --- /dev/null
>> +++ b/drivers/hwtracing/coresight/qcom-cti.h
>> @@ -0,0 +1,65 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#ifndef _CORESIGHT_QCOM_CTI_H
>> +#define _CORESIGHT_QCOM_CTI_H
>> +
>> +#include "coresight-cti.h"
>> +
>> +#define ARCHITECT_QCOM 0x477
>> +
>> +/* CTI programming registers */
>> +#define QCOM_CTIINTACK        0x020
>> +#define QCOM_CTIAPPSET        0x004
>> +#define QCOM_CTIAPPCLEAR    0x008
>> +#define QCOM_CTIAPPPULSE    0x00C
>> +#define QCOM_CTIINEN        0x400
>> +#define QCOM_CTIOUTEN        0x800
>> +#define QCOM_CTITRIGINSTATUS    0x040
>> +#define QCOM_CTITRIGOUTSTATUS    0x060
>> +#define QCOM_CTICHINSTATUS    0x080
>> +#define QCOM_CTICHOUTSTATUS    0x084
>> +#define QCOM_CTIGATE        0x088
>> +#define QCOM_ASICCTL        0x08C
>> +/* Integration test registers */
>> +#define QCOM_ITCHINACK        0xE70
>> +#define QCOM_ITTRIGINACK    0xE80
>> +#define QCOM_ITCHOUT        0xE74
>> +#define QCOM_ITTRIGOUT        0xEA0
>> +#define QCOM_ITCHOUTACK        0xE78
>> +#define QCOM_ITTRIGOUTACK    0xEC0
>> +#define QCOM_ITCHIN        0xE7C
>> +#define QCOM_ITTRIGIN        0xEE0
>> +
>> +static noinline u32 cti_qcom_reg_off(u32 offset)
>> +{
>> +    switch (offset) {
>> +    case CTIINTACK:        return QCOM_CTIINTACK;
>> +    case CTIAPPSET:        return QCOM_CTIAPPSET;
>> +    case CTIAPPCLEAR:    return QCOM_CTIAPPCLEAR;
>> +    case CTIAPPPULSE:    return QCOM_CTIAPPPULSE;
>> +    case CTIINEN:        return QCOM_CTIINEN;
>> +    case CTIOUTEN:        return QCOM_CTIOUTEN;
>> +    case CTITRIGINSTATUS:    return QCOM_CTITRIGINSTATUS;
>> +    case CTITRIGOUTSTATUS:    return QCOM_CTITRIGOUTSTATUS;
>> +    case CTICHINSTATUS:    return QCOM_CTICHINSTATUS;
>> +    case CTICHOUTSTATUS:    return QCOM_CTICHOUTSTATUS;
>> +    case CTIGATE:        return QCOM_CTIGATE;
>> +    case ASICCTL:        return QCOM_ASICCTL;
>> +    case ITCHINACK:        return QCOM_ITCHINACK;
>> +    case ITTRIGINACK:    return QCOM_ITTRIGINACK;
>> +    case ITCHOUT:        return QCOM_ITCHOUT;
>> +    case ITTRIGOUT:        return QCOM_ITTRIGOUT;
>> +    case ITCHOUTACK:    return QCOM_ITCHOUTACK;
>> +    case ITTRIGOUTACK:    return QCOM_ITTRIGOUTACK;
>> +    case ITCHIN:        return QCOM_ITCHIN;
>> +    case ITTRIGIN:        return QCOM_ITTRIGIN;
>> +
>> +    default:
>> +        return offset;
>> +    }
>> +}
>> +
>> +#endif  /* _CORESIGHT_QCOM_CTI_H */
>>
>

