Return-Path: <linux-arm-msm+bounces-84774-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B33ACAFF52
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Dec 2025 13:42:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B5E4C301BEB8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Dec 2025 12:42:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42BC02FF66A;
	Tue,  9 Dec 2025 12:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VmMtZLeW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE71C2D837E;
	Tue,  9 Dec 2025 12:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765284164; cv=none; b=pJy/9DnJd1iGD+FzI4aSCx1M2rnR7aokBLccAA0wf8OZdbk4RjZqt6BLad9pD1j3IgiNYsDjc0ssJRcGhQn5BFaXR3y7cSEHgj0CQXT52sl6ykvL+x7MZPZssXTzkT8ynFXT3qXNovqkqQAk9zlKJHN8xLDoch8mWNkv7qqVClY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765284164; c=relaxed/simple;
	bh=X0dIigBpBTfN5uOyTH4p3Ehm5WMvWgCEIuw/x+RLe8Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=JWli88aK7Qfse16uJPZfaLSs1G9a6eKc+8ys/TJudIxRFInq6kI7LC9hfA/MIn1o0usb471D5CimNgAna/e4lkulBCTNY6oQc+xQ2ekFfpheT1VKz48tKIDb4Px80lbHdLtoJnoeXm2GTSTLsPoh+IrHZMYHzbkggNLxdJjoMcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VmMtZLeW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B99NDWe2559530;
	Tue, 9 Dec 2025 12:42:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mDBkNQuiyeJv0uTEzB3eaKAO0+LqdXknLAeFZkY7lnw=; b=VmMtZLeW6patswbW
	fqDH3g7RtfVhEXUPqFMl7HKL6GmPksjP4TWMvjFQbuX9vMdyHiBP+ukYNGMvbben
	Q0upyO+ysvEzF1yK2nBf7HaJAoFl43Yy/h4o0eXOePHp9ABAjFA1FHHu9g9l0f0+
	Bv+3ukyEw6SrYF2p6GRkKJuxHCFrHaT7/C+5OpY/D3g86pnlGVXcZdTAvuW0z/2s
	X+q55OVlcEOlwkqSkzDKl09RcmuMUvzn874vbc8Se2JS8IREQ93OvQtR7lQB5sw0
	T+lF0Gnuli6qIS5IbakVDSHpw7J9d2haMnWzjM4vKM57nCebOcSKb0gf2OuutJsd
	wlmZ4g==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axesf10gu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Dec 2025 12:42:32 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5B9CgU2g031954
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 Dec 2025 12:42:31 GMT
Received: from [10.233.71.148] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 9 Dec
 2025 04:42:27 -0800
Message-ID: <008da9e5-e561-4eb0-8d08-c50294d7ac68@quicinc.com>
Date: Tue, 9 Dec 2025 20:42:24 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] coresight: cti: Add Qualcomm extended CTI support
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Yingchao Deng
	<quic_yingdeng@quicinc.com>
CC: <alexander.shishkin@linux.intel.com>, <coresight@lists.linaro.org>,
        <james.clark@linaro.org>, <jinlong.mao@oss.qualcomm.com>,
        <leo.yan@arm.com>, <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_jinlmao@quicinc.com>, <suzuki.poulose@arm.com>,
        <tingwei.zhang@oss.qualcomm.com>, Mike Leach
	<mike.leach@linaro.org>
References: <CAJ9a7Vg9Efi-5eecfiUF82_Qq8Jg9imN5q1-VKYZoPVUxNpjhA@mail.gmail.com>
 <20251209081649.105623-1-yingchao.deng@oss.qualcomm.com>
 <d55ed203-b0f4-4453-81cf-1d8dcd6494ed@oss.qualcomm.com>
Content-Language: en-US
From: "Yingchao Deng (Consultant)" <quic_yingdeng@quicinc.com>
In-Reply-To: <d55ed203-b0f4-4453-81cf-1d8dcd6494ed@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: APGBvcQ9wBxg099gR2sWAm_UMtkg0uNy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDA5MiBTYWx0ZWRfXyykCIVT3atI7
 n6pAWMLaM106cWWE2RZahXeq8q3l/+1Wl1VrQr2zUHMAhV8MgTmp9rXEavsXRlRELnnjE0j8rO3
 kTzF1ddDGx7snqpZ/pLO+wVJjZB4hhKPFiPu7rJVf52jvEhd6KvSfqj7RrEG06bskLEfTvUoz5A
 zbFgpFfIIatfR5b3bu0ef4a4mndlF/qMib5suVs9rILJrNwONnOol0OgUWirUEem/C4B0+U34Xg
 hbiLfMFp+D/GyVtnIYt+ZXZ5wTI+518VJCDrDxus5Pcrahpgfg8eJp2CAWsjnLMv1tinDMERObF
 OTGdXsUh0FRRlPFHwSdlaWiFJoOrmOeEaU0nSDGFQSj6+kiyrUdTwIoT+AZ3YFVJdCmi/xZmS9/
 1k8h8VWxKWVBimIAUzXmJ8AJcVFd+Q==
X-Authority-Analysis: v=2.4 cv=fMc0HJae c=1 sm=1 tr=0 ts=69381938 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=YEAwvyTCDeMyiG0rFjwA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: APGBvcQ9wBxg099gR2sWAm_UMtkg0uNy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_03,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512090092


On 12/9/2025 7:03 PM, Jie Gan wrote:
>
>
> On 12/9/2025 4:16 PM, Yingchao Deng wrote:
>> Hi Leo & Mike
>>
>> Based on Leo’s suggestions, I created a new patch, but there are 
>> three points that do not fully align with his recommendations:
>>
>>      1. The helper function for returning the register address now 
>> returns only the offset, because returning the full address would 
>> conflict with cti_write_single_reg.
>>      2. For registers such as triginstatus1...3, I defined additional 
>> macros CTITRIGINSTATUS1...3. This is because CTITRIGINSTATUS + 0x4 
>> equals CTITRIGOUTSTATUS, and to avoid conflicts with existing macros, 
>> I chose numbers starting from 0x1000 for the new definitions.
>>      3. Regarding the visibility of attributes for triginstatus1...3, 
>> since coresight_cti_reg produces an anonymous variable that cannot be 
>> directly referenced, I used coresight_cti_regs_attrs[i] to obtain the 
>> attribute corresponding to triginstatus1.
>>
>> I appreciate both suggestions. After reviewing them, I lean toward 
>> Mike's approach.
>>
>> Signed-off-by: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
>> ---
>>   .../hwtracing/coresight/coresight-cti-core.c  |  52 +++++--
>>   .../hwtracing/coresight/coresight-cti-sysfs.c |  72 ++++++++--
>>   drivers/hwtracing/coresight/coresight-cti.h   |   3 +-
>>   drivers/hwtracing/coresight/qcom-cti.h        | 136 ++++++++++++++++++
>>   4 files changed, 238 insertions(+), 25 deletions(-)
>>   create mode 100644 drivers/hwtracing/coresight/qcom-cti.h
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-cti-core.c 
>> b/drivers/hwtracing/coresight/coresight-cti-core.c
>> index f9970e40dd59..d2b0b46f2846 100644
>> --- a/drivers/hwtracing/coresight/coresight-cti-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-cti-core.c
>> @@ -21,7 +21,7 @@
>>
>>   #include "coresight-priv.h"
>>   #include "coresight-cti.h"
>> -
>> +#include "qcom-cti.h"
>>   /*
>>    * CTI devices can be associated with a PE, or be connected to 
>> CoreSight
>>    * hardware. We have a list of all CTIs irrespective of CPU bound or
>> @@ -70,15 +70,16 @@ void cti_write_all_hw_regs(struct cti_drvdata 
>> *drvdata)
>>
>>       /* write the CTI trigger registers */
>>       for (i = 0; i < config->nr_trig_max; i++) {
>> -        writel_relaxed(config->ctiinen[i], drvdata->base + CTIINEN(i));
>> +        writel_relaxed(config->ctiinen[i],
>> +                drvdata->base + cti_reg_addr_with_nr(drvdata, 
>> CTIINEN(0), i));
>>           writel_relaxed(config->ctiouten[i],
>> -                   drvdata->base + CTIOUTEN(i));
>> +                drvdata->base + cti_reg_addr_with_nr(drvdata, 
>> CTIOUTEN(0), i));
>>       }
>>
>>       /* other regs */
>> -    writel_relaxed(config->ctigate, drvdata->base + CTIGATE);
>> -    writel_relaxed(config->asicctl, drvdata->base + ASICCTL);
>> -    writel_relaxed(config->ctiappset, drvdata->base + CTIAPPSET);
>> +    writel_relaxed(config->ctigate, drvdata->base + 
>> cti_reg_addr(drvdata, CTIGATE));
>> +    writel_relaxed(config->asicctl, drvdata->base + 
>> cti_reg_addr(drvdata, ASICCTL));
>> +    writel_relaxed(config->ctiappset, drvdata->base + 
>> cti_reg_addr(drvdata, CTIAPPSET));
>>
>>       /* re-enable CTI */
>>       writel_relaxed(1, drvdata->base + CTICONTROL);
>> @@ -201,7 +202,7 @@ void cti_write_intack(struct device *dev, u32 
>> ackval)
>>       raw_spin_lock(&drvdata->spinlock);
>>       /* write if enabled */
>>       if (cti_active(config))
>> -        cti_write_single_reg(drvdata, CTIINTACK, ackval);
>> +        cti_write_single_reg(drvdata, cti_reg_addr(drvdata, 
>> CTIINTACK), ackval);
>>       raw_spin_unlock(&drvdata->spinlock);
>>   }
>>
>> @@ -214,6 +215,9 @@ void cti_write_intack(struct device *dev, u32 
>> ackval)
>>   /* DEVID[19:16] - number of CTM channels */
>>   #define CTI_DEVID_CTMCHANNELS(devid_val) ((int) BMVAL(devid_val, 
>> 16, 19))
>>
>> +/* DEVARCH[31:21] - ARCHITECT */
>> +#define CTI_DEVARCH_ARCHITECT(devarch_val) ((int)BMVAL(devarch_val, 
>> 21, 31))
>> +
>>   static int cti_set_default_config(struct device *dev,
>>                     struct cti_drvdata *drvdata)
>>   {
>> @@ -394,9 +398,8 @@ int cti_channel_trig_op(struct device *dev, enum 
>> cti_chan_op op,
>>
>>       /* update the local register values */
>>       chan_bitmask = BIT(channel_idx);
>> -    reg_offset = (direction == CTI_TRIG_IN ? CTIINEN(trigger_idx) :
>> -              CTIOUTEN(trigger_idx));
>> -
>> +    reg_offset = (direction == CTI_TRIG_IN ? 
>> cti_reg_addr_with_nr(drvdata, CTIINEN(0), trigger_idx):
>> +                         cti_reg_addr_with_nr(drvdata, CTIOUTEN(0), 
>> trigger_idx));
>>       raw_spin_lock(&drvdata->spinlock);
>>
>>       /* read - modify write - the trigger / channel enable value */
>> @@ -452,7 +455,7 @@ int cti_channel_gate_op(struct device *dev, enum 
>> cti_chan_gate_op op,
>>       if (err == 0) {
>>           config->ctigate = reg_value;
>>           if (cti_active(config))
>> -            cti_write_single_reg(drvdata, CTIGATE, reg_value);
>> +            cti_write_single_reg(drvdata, cti_reg_addr(drvdata, 
>> CTIGATE), reg_value);
>>       }
>>       raw_spin_unlock(&drvdata->spinlock);
>>       return err;
>> @@ -479,19 +482,19 @@ int cti_channel_setop(struct device *dev, enum 
>> cti_chan_set_op op,
>>       case CTI_CHAN_SET:
>>           config->ctiappset |= chan_bitmask;
>>           reg_value  = config->ctiappset;
>> -        reg_offset = CTIAPPSET;
>> +        reg_offset = cti_reg_addr(drvdata, CTIAPPSET);
>>           break;
>>
>>       case CTI_CHAN_CLR:
>>           config->ctiappset &= ~chan_bitmask;
>>           reg_value = chan_bitmask;
>> -        reg_offset = CTIAPPCLEAR;
>> +        reg_offset = cti_reg_addr(drvdata, CTIAPPCLEAR);
>>           break;
>>
>>       case CTI_CHAN_PULSE:
>>           config->ctiappset &= ~chan_bitmask;
>>           reg_value = chan_bitmask;
>> -        reg_offset = CTIAPPPULSE;
>> +        reg_offset = cti_reg_addr(drvdata, CTIAPPPULSE);
>>           break;
>>
>>       default:
>> @@ -895,6 +898,7 @@ static int cti_probe(struct amba_device *adev, 
>> const struct amba_id *id)
>>       struct coresight_desc cti_desc;
>>       struct coresight_platform_data *pdata = NULL;
>>       struct resource *res = &adev->res;
>> +    u32 devarch;
>>
>>       /* driver data*/
>>       drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
>> @@ -981,9 +985,27 @@ static int cti_probe(struct amba_device *adev, 
>> const struct amba_id *id)
>>       drvdata->csdev_release = drvdata->csdev->dev.release;
>>       drvdata->csdev->dev.release = cti_device_release;
>>
>> +    /* check architect value*/
>> +    devarch = readl_relaxed(drvdata->base + CORESIGHT_DEVARCH);
>> +    if (CTI_DEVARCH_ARCHITECT(devarch) == ARCHITECT_QCOM) {
>> +        drvdata->is_qcom_cti = 1;
>> +
>> +        /*
>> +         * QCOM CTI does not implement Claimtag functionality as
>> +         * per CoreSight specification, but its CLAIMSET register
>> +         * is incorrectly initialized to 0xF. This can mislead
>> +         * tools or drivers into thinking the component is claimed.
>> +         *
>> +         * Reset CLAIMSET to 0 to reflect that no claims are active.
>> +         */
>> +        drvdata->csdev->claim_tag_info = CS_CLAIM_TAG_NOT_IMPL;
>> +        //writel_relaxed(0, drvdata->base + CORESIGHT_CLAIMSET);
>> +    }
>> +
>>       /* all done - dec pm refcount */
>>       pm_runtime_put(&adev->dev);
>> -    dev_info(&drvdata->csdev->dev, "CTI initialized\n");
>> +    dev_info(&drvdata->csdev->dev, "%s CTI initialized\n",
>> +                    drvdata->is_qcom_cti ? "QCOM" : "");
>>       return 0;
>>
>>   pm_release:
>> diff --git a/drivers/hwtracing/coresight/coresight-cti-sysfs.c 
>> b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
>> index a9df77215141..5d23a138b4a7 100644
>> --- a/drivers/hwtracing/coresight/coresight-cti-sysfs.c
>> +++ b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
>> @@ -13,7 +13,7 @@
>>   #include <linux/sysfs.h>
>>
>>   #include "coresight-cti.h"
>> -
>> +#include "qcom-cti.h"
>>   /*
>>    * Declare the number of static declared attribute groups
>>    * Value includes groups + NULL value at end of table.
>> @@ -183,7 +183,7 @@ static ssize_t coresight_cti_reg_show(struct 
>> device *dev,
>>       pm_runtime_get_sync(dev->parent);
>>       raw_spin_lock(&drvdata->spinlock);
>>       if (drvdata->config.hw_powered)
>> -        val = readl_relaxed(drvdata->base + cti_attr->off);
>> +        val = readl_relaxed(drvdata->base + cti_reg_addr(drvdata, 
>> cti_attr->off));
>>       raw_spin_unlock(&drvdata->spinlock);
>>       pm_runtime_put_sync(dev->parent);
>>       return sysfs_emit(buf, "0x%x\n", val);
>> @@ -204,7 +204,7 @@ static __maybe_unused ssize_t 
>> coresight_cti_reg_store(struct device *dev,
>>       pm_runtime_get_sync(dev->parent);
>>       raw_spin_lock(&drvdata->spinlock);
>>       if (drvdata->config.hw_powered)
>> -        cti_write_single_reg(drvdata, cti_attr->off, val);
>> +        cti_write_single_reg(drvdata,  cti_reg_addr(drvdata, 
>> cti_attr->off), val);
>>       raw_spin_unlock(&drvdata->spinlock);
>>       pm_runtime_put_sync(dev->parent);
>>       return size;
>> @@ -267,7 +267,7 @@ static ssize_t cti_reg32_show(struct device *dev, 
>> char *buf,
>>       raw_spin_lock(&drvdata->spinlock);
>>       if ((reg_offset >= 0) && cti_active(config)) {
>>           CS_UNLOCK(drvdata->base);
>> -        val = readl_relaxed(drvdata->base + reg_offset);
>> +        val = readl_relaxed(drvdata->base + cti_reg_addr(drvdata, 
>> reg_offset));
>>           if (pcached_val)
>>               *pcached_val = val;
>>           CS_LOCK(drvdata->base);
>> @@ -300,7 +300,7 @@ static ssize_t cti_reg32_store(struct device 
>> *dev, const char *buf,
>>
>>       /* write through if offset and enabled */
>>       if ((reg_offset >= 0) && cti_active(config))
>> -        cti_write_single_reg(drvdata, reg_offset, val);
>> +        cti_write_single_reg(drvdata,  cti_reg_addr(drvdata, 
>> reg_offset), val);
>>       raw_spin_unlock(&drvdata->spinlock);
>>       return size;
>>   }
>> @@ -389,7 +389,7 @@ static ssize_t inen_store(struct device *dev,
>>
>>       /* write through if enabled */
>>       if (cti_active(config))
>> -        cti_write_single_reg(drvdata, CTIINEN(index), val);
>> +        cti_write_single_reg(drvdata, cti_reg_addr_with_nr(drvdata, 
>> CTIINEN(0), index), val);
>>       raw_spin_unlock(&drvdata->spinlock);
>>       return size;
>>   }
>> @@ -428,7 +428,7 @@ static ssize_t outen_store(struct device *dev,
>>
>>       /* write through if enabled */
>>       if (cti_active(config))
>> -        cti_write_single_reg(drvdata, CTIOUTEN(index), val);
>> +        cti_write_single_reg(drvdata, cti_reg_addr_with_nr(drvdata, 
>> CTIOUTEN(0), index), val);
>>       raw_spin_unlock(&drvdata->spinlock);
>>       return size;
>>   }
>> @@ -470,7 +470,7 @@ static ssize_t appclear_store(struct device *dev,
>>
>>       /* write through if enabled */
>>       if (cti_active(config))
>> -        cti_write_single_reg(drvdata, CTIAPPCLEAR, val);
>> +        cti_write_single_reg(drvdata,  cti_reg_addr(drvdata, 
>> CTIAPPCLEAR), val);
>>       raw_spin_unlock(&drvdata->spinlock);
>>       return size;
>>   }
>> @@ -491,7 +491,7 @@ static ssize_t apppulse_store(struct device *dev,
>>
>>       /* write through if enabled */
>>       if (cti_active(config))
>> -        cti_write_single_reg(drvdata, CTIAPPPULSE, val);
>> +        cti_write_single_reg(drvdata,  cti_reg_addr(drvdata, 
>> CTIAPPPULSE), val);
>>       raw_spin_unlock(&drvdata->spinlock);
>>       return size;
>>   }
>> @@ -513,18 +513,36 @@ static struct attribute 
>> *coresight_cti_regs_attrs[] = {
>>       &dev_attr_appclear.attr,
>>       &dev_attr_apppulse.attr,
>>       coresight_cti_reg(triginstatus, CTITRIGINSTATUS),
>> +    coresight_cti_reg(triginstatus1, CTITRIGINSTATUS1),
>> +    coresight_cti_reg(triginstatus2, CTITRIGINSTATUS2),
>> +    coresight_cti_reg(triginstatus3, CTITRIGINSTATUS3),
>>       coresight_cti_reg(trigoutstatus, CTITRIGOUTSTATUS),
>> +    coresight_cti_reg(trigoutstatus1, CTITRIGOUTSTATUS1),
>> +    coresight_cti_reg(trigoutstatus2, CTITRIGOUTSTATUS2),
>> +    coresight_cti_reg(trigoutstatus3, CTITRIGOUTSTATUS3),
>>       coresight_cti_reg(chinstatus, CTICHINSTATUS),
>>       coresight_cti_reg(choutstatus, CTICHOUTSTATUS),
>>   #ifdef CONFIG_CORESIGHT_CTI_INTEGRATION_REGS
>>       coresight_cti_reg_rw(itctrl, CORESIGHT_ITCTRL),
>>       coresight_cti_reg(ittrigin, ITTRIGIN),
>> +    coresight_cti_reg(ittrigin1, ITTRIGIN1),
>> +    coresight_cti_reg(ittrigin2, ITTRIGIN2),
>> +    coresight_cti_reg(ittrigin3, ITTRIGIN3),
>>       coresight_cti_reg(itchin, ITCHIN),
>>       coresight_cti_reg_rw(ittrigout, ITTRIGOUT),
>> +    coresight_cti_reg_rw(ittrigout1, ITTRIGOUT1),
>> +    coresight_cti_reg_rw(ittrigout2, ITTRIGOUT2),
>> +    coresight_cti_reg_rw(ittrigout3, ITTRIGOUT3),
>>       coresight_cti_reg_rw(itchout, ITCHOUT),
>>       coresight_cti_reg(itchoutack, ITCHOUTACK),
>>       coresight_cti_reg(ittrigoutack, ITTRIGOUTACK),
>> +    coresight_cti_reg(ittrigoutack1, ITTRIGOUTACK1),
>> +    coresight_cti_reg(ittrigoutack2, ITTRIGOUTACK2),
>> +    coresight_cti_reg(ittrigoutack3, ITTRIGOUTACK3),
>>       coresight_cti_reg_wo(ittriginack, ITTRIGINACK),
>> +    coresight_cti_reg_wo(ittriginack1, ITTRIGINACK1),
>> +    coresight_cti_reg_wo(ittriginack2, ITTRIGINACK2),
>> +    coresight_cti_reg_wo(ittriginack3, ITTRIGINACK3),
>>       coresight_cti_reg_wo(itchinack, ITCHINACK),
>>   #endif
>>       NULL,
>> @@ -1153,6 +1171,41 @@ int cti_create_cons_sysfs(struct device *dev, 
>> struct cti_drvdata *drvdata)
>>       return err;
>>   }
>>
>> +  static umode_t coresight_cti_regs_is_visible(struct kobject *kobj,
>> +                  struct attribute *attr, int n)
>> +  {
>
> I was thinking can we create a separate attribute_group for added Qcom 
> regs? Let devarch to determine whether to create these sysfs nodes?
>
> Thanks,
> Jie
>
As there seems to be no interface to create an attribute_group within 
another attribute_group, the group would have to reside under the 
.../devices/cti-xxx/ directory. I'm uncertain whether this arrangement 
would be considered acceptable.

Thanks
Yingchao
>> +    struct device *dev = container_of(kobj, struct device, kobj);
>> +    struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
>> +
>> +    /* Mute QCOM CTI registers for standard CTI module */
>> +    if (!drvdata->is_qcom_cti) {
>> +        if (attr == coresight_cti_regs_attrs[10]
>> +         || attr == coresight_cti_regs_attrs[11]
>> +         || attr == coresight_cti_regs_attrs[12]
>> +         || attr == coresight_cti_regs_attrs[14]
>> +         || attr == coresight_cti_regs_attrs[15]
>> +         || attr == coresight_cti_regs_attrs[16]
>> +#ifdef CONFIG_CORESIGHT_CTI_INTEGRATION_REGS
>> +         || attr == coresight_cti_regs_attrs[21]
>> +         || attr == coresight_cti_regs_attrs[22]
>> +         || attr == coresight_cti_regs_attrs[23]
>> +         || attr == coresight_cti_regs_attrs[26]
>> +         || attr == coresight_cti_regs_attrs[27]
>> +         || attr == coresight_cti_regs_attrs[28]
>> +         || attr == coresight_cti_regs_attrs[32]
>> +         || attr == coresight_cti_regs_attrs[33]
>> +         || attr == coresight_cti_regs_attrs[34]
>> +         || attr == coresight_cti_regs_attrs[36]
>> +         || attr == coresight_cti_regs_attrs[37]
>> +         || attr == coresight_cti_regs_attrs[38]
>> +#endif
>> +         )
>> +                  return 0;
>> +          }
>> +
>> +          return attr->mode;
>> +  }
>> +
>>   /* attribute and group sysfs tables. */
>>   static const struct attribute_group coresight_cti_group = {
>>       .attrs = coresight_cti_attrs,
>> @@ -1166,6 +1219,7 @@ static const struct attribute_group 
>> coresight_cti_mgmt_group = {
>>   static const struct attribute_group coresight_cti_regs_group = {
>>       .attrs = coresight_cti_regs_attrs,
>>       .name = "regs",
>> +    .is_visible = coresight_cti_regs_is_visible,
>>   };
>>
>>   static const struct attribute_group coresight_cti_channels_group = {
>> diff --git a/drivers/hwtracing/coresight/coresight-cti.h 
>> b/drivers/hwtracing/coresight/coresight-cti.h
>> index e7b88b07cffe..413d5ef483e8 100644
>> --- a/drivers/hwtracing/coresight/coresight-cti.h
>> +++ b/drivers/hwtracing/coresight/coresight-cti.h
>> @@ -57,7 +57,7 @@ struct fwnode_handle;
>>    * Max of in and out defined in the DEVID register.
>>    * - pick up actual number used from .dts parameters if present.
>>    */
>> -#define CTIINOUTEN_MAX        32
>> +#define CTIINOUTEN_MAX        128
>>
>>   /**
>>    * Group of related trigger signals
>> @@ -181,6 +181,7 @@ struct cti_drvdata {
>>       struct cti_config config;
>>       struct list_head node;
>>       void (*csdev_release)(struct device *dev);
>> +    bool is_qcom_cti;
>>   };
>>
>>   /*
>> diff --git a/drivers/hwtracing/coresight/qcom-cti.h 
>> b/drivers/hwtracing/coresight/qcom-cti.h
>> new file mode 100644
>> index 000000000000..aa41f9425b36
>> --- /dev/null
>> +++ b/drivers/hwtracing/coresight/qcom-cti.h
>> @@ -0,0 +1,136 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +#include "coresight-cti.h"
>> +
>> +#define ARCHITECT_QCOM 0x477
>> +
>> +#define CTITRIGINSTATUS1 0x1000
>> +#define CTITRIGINSTATUS2 0x1001
>> +#define CTITRIGINSTATUS3 0x1002
>> +
>> +#define CTITRIGOUTSTATUS1 0x1003
>> +#define CTITRIGOUTSTATUS2 0x1004
>> +#define CTITRIGOUTSTATUS3 0x1005
>> +
>> +#define ITTRIGIN1 0x1006
>> +#define ITTRIGIN2 0x1007
>> +#define ITTRIGIN3 0x1008
>> +
>> +#define ITTRIGOUT1 0x1009
>> +#define ITTRIGOUT2 0x100A
>> +#define ITTRIGOUT3 0x100B
>> +
>> +#define ITTRIGINACK1 0x100C
>> +#define ITTRIGINACK2 0x100D
>> +#define ITTRIGINACK3 0x100E
>> +
>> +#define ITTRIGOUTACK1 0x100F
>> +#define ITTRIGOUTACK2 0x1010
>> +#define ITTRIGOUTACK3 0x1011
>> +/* CTI programming registers */
>> +#define    QCOM_CTIINTACK        0x020
>> +#define    QCOM_CTIAPPSET        0x004
>> +#define    QCOM_CTIAPPCLEAR    0x008
>> +#define    QCOM_CTIAPPPULSE    0x00C
>> +#define    QCOM_CTIINEN        0x400
>> +#define    QCOM_CTIOUTEN        0x800
>> +#define    QCOM_CTITRIGINSTATUS    0x040
>> +#define    QCOM_CTITRIGINSTATUS1    0x044
>> +#define    QCOM_CTITRIGINSTATUS2    0x048
>> +#define    QCOM_CTITRIGINSTATUS3    0x04C
>> +#define    QCOM_CTITRIGOUTSTATUS    0x060
>> +#define    QCOM_CTITRIGOUTSTATUS1    0x064
>> +#define    QCOM_CTITRIGOUTSTATUS2    0x068
>> +#define    QCOM_CTITRIGOUTSTATUS3    0x06C
>> +#define    QCOM_CTICHINSTATUS    0x080
>> +#define    QCOM_CTICHOUTSTATUS    0x084
>> +#define    QCOM_CTIGATE        0x088
>> +#define    QCOM_ASICCTL        0x08c
>> +/* Integration test registers */
>> +#define    QCOM_ITCHINACK        0xE70
>> +#define    QCOM_ITTRIGINACK    0xE80
>> +#define    QCOM_ITTRIGINACK1    0xE84
>> +#define    QCOM_ITTRIGINACK2    0xE88
>> +#define    QCOM_ITTRIGINACK3    0xE8C
>> +#define    QCOM_ITCHOUT        0xE74
>> +#define    QCOM_ITTRIGOUT        0xEA0
>> +#define    QCOM_ITTRIGOUT1        0xEA4
>> +#define    QCOM_ITTRIGOUT2        0xEA8
>> +#define    QCOM_ITTRIGOUT3        0xEAC
>> +#define    QCOM_ITCHOUTACK        0xE78
>> +#define    QCOM_ITTRIGOUTACK    0xEC0
>> +#define    QCOM_ITTRIGOUTACK1    0xEC4
>> +#define    QCOM_ITTRIGOUTACK2    0xEC8
>> +#define    QCOM_ITTRIGOUTACK3    0xECC
>> +#define    QCOM_ITCHIN        0xE7C
>> +#define    QCOM_ITTRIGIN        0xEE0
>> +#define    QCOM_ITTRIGIN1        0xEE4
>> +#define    QCOM_ITTRIGIN2        0xEE8
>> +#define    QCOM_ITTRIGIN3        0xEEC
>> +
>> +static noinline u32 cti_qcom_reg_off(u32 offset)
>> +{
>> +    switch (offset) {
>> +        case CTIINTACK:        return QCOM_CTIINTACK;
>> +        case CTIAPPSET:        return QCOM_CTIAPPSET;
>> +        case CTIAPPCLEAR:    return QCOM_CTIAPPCLEAR;
>> +        case CTIAPPPULSE:    return QCOM_CTIAPPPULSE;
>> +        case CTIINEN(0):    return QCOM_CTIINEN;
>> +        case CTIOUTEN(0):    return QCOM_CTIOUTEN;
>> +        case CTITRIGINSTATUS:    return QCOM_CTITRIGINSTATUS;
>> +        case CTITRIGINSTATUS1:    return QCOM_CTITRIGINSTATUS1;
>> +        case CTITRIGINSTATUS2:    return QCOM_CTITRIGINSTATUS2;
>> +        case CTITRIGINSTATUS3:    return QCOM_CTITRIGINSTATUS3;
>> +        case CTITRIGOUTSTATUS:    return QCOM_CTITRIGOUTSTATUS;
>> +        case CTITRIGOUTSTATUS1:    return QCOM_CTITRIGOUTSTATUS1;
>> +        case CTITRIGOUTSTATUS2:    return QCOM_CTITRIGOUTSTATUS2;
>> +        case CTITRIGOUTSTATUS3:    return QCOM_CTITRIGOUTSTATUS3;
>> +        case CTICHINSTATUS:        return QCOM_CTICHINSTATUS;
>> +        case CTICHOUTSTATUS:    return QCOM_CTICHOUTSTATUS;
>> +        case CTIGATE:        return QCOM_CTIGATE;
>> +        case ASICCTL:        return QCOM_ASICCTL;
>> +        case ITCHINACK:        return QCOM_ITCHINACK;
>> +        case ITTRIGINACK:    return QCOM_ITTRIGINACK;
>> +        case ITTRIGINACK1:    return QCOM_ITTRIGINACK1;
>> +        case ITTRIGINACK2:    return QCOM_ITTRIGINACK2;
>> +        case ITTRIGINACK3:    return QCOM_ITTRIGINACK3;
>> +        case ITCHOUT:        return QCOM_ITCHOUT;
>> +        case ITTRIGOUT:        return QCOM_ITTRIGOUT;
>> +        case ITTRIGOUT1:    return QCOM_ITTRIGOUT1;
>> +        case ITTRIGOUT2:    return QCOM_ITTRIGOUT2;
>> +        case ITTRIGOUT3:    return QCOM_ITTRIGOUT3;
>> +        case ITCHOUTACK:    return QCOM_ITCHOUTACK;
>> +        case ITTRIGOUTACK:    return QCOM_ITTRIGOUTACK;
>> +        case ITTRIGOUTACK1:    return QCOM_ITTRIGOUTACK1;
>> +        case ITTRIGOUTACK2:    return QCOM_ITTRIGOUTACK2;
>> +        case ITTRIGOUTACK3:    return QCOM_ITTRIGOUTACK3;
>> +        case ITCHIN:               return QCOM_ITCHIN;
>> +        case ITTRIGIN:            return QCOM_ITTRIGIN;
>> +        case ITTRIGIN1:        return QCOM_ITTRIGIN1;
>> +        case ITTRIGIN2:        return QCOM_ITTRIGIN2;
>> +        case ITTRIGIN3:        return QCOM_ITTRIGIN3;
>> +        default:
>> +                    WARN(1, "Unknown offset=%u\n", offset);
>> +                    return 0;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static u32 cti_reg_addr_with_nr(struct cti_drvdata *drvdata,
>> +                                          u32 reg, u32 nr)
>> +{
>> +    /* convert to qcom specific offset */
>> +    if (unlikely(drvdata->is_qcom_cti))
>> +        reg = cti_qcom_reg_off(reg);
>> +
>> +    return reg + sizeof(u32) * nr;
>> +}
>> +
>> +static u32 cti_reg_addr(struct cti_drvdata *drvdata, u32 reg)
>> +{
>> +        return cti_reg_addr_with_nr(drvdata, reg, 0);
>> +}
>> +
>>
>>
>

