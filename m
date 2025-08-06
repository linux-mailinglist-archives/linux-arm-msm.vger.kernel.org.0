Return-Path: <linux-arm-msm+bounces-67853-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9703CB1C109
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 09:12:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1DCCF18A615D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 07:12:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69EF2219A79;
	Wed,  6 Aug 2025 07:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lg2CbGkt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D512721883F;
	Wed,  6 Aug 2025 07:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754464311; cv=none; b=ozcdo7vML0JrysNSJuinLhpbt0LtvU4cAaG+4yUE2qQX4aQ+DkqFeOuqws6+4Wy28HVbOnntstiP5XMFkycT0ieZ7wGGeU1Vtmn8p6c0prHGMbE+tsJGEieVrAccBIJQ58JcJTeQC8DrN+Q1VwTWe0aVcU4DLQjhOAbbN2kM1HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754464311; c=relaxed/simple;
	bh=gfaozjvaz6wdYgtpKjqatOemDHU8kiB653mjPP6LRVI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=U+b50nR9WlNJoWR28nuKKvCp+s8AXmzTIUfkNu9Otojcifcy1aoAFSyGrtoXlqJp6fW7At5QpByqXQ9tUBmwMFxdEdEviwQI8JmRtN/ZzMS6VnWXUxWKiFRNxXOcmFvyuVGJUgJkrQ+49Ri7wfJphofSP5wt1+IHlzM2Ld9TqwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lg2CbGkt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5765fhRs031608;
	Wed, 6 Aug 2025 07:11:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NJupqPaBEbADYpoIenQ07A4qoH99hy0BpQoPXB6C8I4=; b=lg2CbGktgeDmGtWT
	qBUOMWT/tAYgP+XYsp8pEMF8qZN/3sMeIFLUHhbiV+026IVShahVbEymmbRuz+60
	z0ZztnM15uZ4wUl/rxphSV2Eg5B4fchl8khuLxZRPKtjV2k67M8+1Wo+B2Orjj+8
	2VuLCIV0RYIT3b9bvlPusQEHZw5LG469ZzSHPQ0OsgG9jzRV3fzdvk1ndyciBitN
	KIlNqiFtXNujeqqBzhNQVg98bxDIQ8m5egJEBvduw7Qu9ml684tpf/5jAo6ixDFE
	KX2urnIF/wcb2+yw8az9KyXfaFuVvAa7i095TIYAZ1ULuFfvOyvGc1MB/Qt2W0V6
	c2FZFQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpyb9us0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Aug 2025 07:11:35 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5767BYsR000953
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 6 Aug 2025 07:11:34 GMT
Received: from [10.133.33.160] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 6 Aug
 2025 00:11:31 -0700
Message-ID: <0a3f1e2c-d83d-4333-9fe4-dbfb4d31e14c@quicinc.com>
Date: Wed, 6 Aug 2025 15:11:28 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] coresight: cti: Add Qualcomm extended CTI support
To: Mike Leach <mike.leach@linaro.org>
CC: Suzuki K Poulose <suzuki.poulose@arm.com>,
        James Clark
	<james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>,
        Yingchao Deng
	<quic_yingdeng@quicinc.com>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>
References: <20250722081405.2947294-1-quic_jinlmao@quicinc.com>
 <20250722081405.2947294-3-quic_jinlmao@quicinc.com>
 <CAJ9a7VhSLdPnVdJfbsCTKLri7i8SKP4WaO9W8=mOU4Wjo0VbyQ@mail.gmail.com>
Content-Language: en-US
From: Jinlong Mao <quic_jinlmao@quicinc.com>
In-Reply-To: <CAJ9a7VhSLdPnVdJfbsCTKLri7i8SKP4WaO9W8=mOU4Wjo0VbyQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX0lcW04RyBG3F
 8ZIAYU1+Csv7c5wBANEqJQJoJqudixSullDpgGBBsBXMK5Mcu8XFSe5Y+AYlY+9+kAAkM5eccOy
 0Vfmrno6nEUoBs4L7FY2CqVgIJiOBW70xTBiUw4PCswydGcq/Dphw7jXkqz7UiEbiiLuN7vCjaj
 YQUFiCNzF5wq6YNjojl5n6HyE2H0mV5/OUbAiVqUpWKorHh4DqAlp/vf70FCT6N/o2A4vYPeC7e
 PDE1UqM30b86t97QDw7zDiA/KUg1ykS+IkpRiGntsWgQAgPeNzJPoUphLfD4Y1+dl/Sf69Q9Xzx
 AT4SXY41A3XqAden3LjvKEUB30kUvWe+1wZ+YBZoJqwNlhhGbP4hVi53LapLOUT7M13C0Fnz7XD
 5AGO6ih9
X-Proofpoint-GUID: AlaPMANx375uNKqdolO407CUdK2ce33m
X-Authority-Analysis: v=2.4 cv=EavIQOmC c=1 sm=1 tr=0 ts=68930027 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=h9B-Kl9yOqkwTstX9HsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: AlaPMANx375uNKqdolO407CUdK2ce33m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_01,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 adultscore=0 bulkscore=0
 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009



On 8/5/2025 4:49 AM, Mike Leach wrote:
> Hi
> 
> On Tue, 22 Jul 2025 at 09:14, Mao Jinlong <quic_jinlmao@quicinc.com> wrote:
>>
>> From: Yingchao Deng <quic_yingdeng@quicinc.com>
>>
>> The QCOM extended CTI is a heavily parameterized version of ARM’s CSCTI.
>> It allows a debugger to send to trigger events to a processor or to send
>> a trigger event to one or more processors when a trigger event occurs
>> on another processor on the same SoC, or even between SoCs. For Qualcomm
>> extended CTI, it supports up to 128 triggers.
>>
>> Signed-off-by: Yingchao Deng <quic_yingdeng@quicinc.com>
>> Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
>> ---
>>   .../hwtracing/coresight/coresight-cti-core.c  | 127 +++++++++++++----
>>   .../coresight/coresight-cti-platform.c        |  16 ++-
>>   .../hwtracing/coresight/coresight-cti-sysfs.c | 128 ++++++++++++++----
>>   drivers/hwtracing/coresight/coresight-cti.h   |  75 +++++-----
>>   4 files changed, 245 insertions(+), 101 deletions(-)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-cti-core.c b/drivers/hwtracing/coresight/coresight-cti-core.c
>> index 8fb30dd73fd2..d6a28df48484 100644
>> --- a/drivers/hwtracing/coresight/coresight-cti-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-cti-core.c
>> @@ -15,6 +15,7 @@
>>   #include <linux/kernel.h>
>>   #include <linux/list.h>
>>   #include <linux/mutex.h>
>> +#include <linux/of.h>
>>   #include <linux/pm_runtime.h>
>>   #include <linux/property.h>
>>   #include <linux/spinlock.h>
>> @@ -22,6 +23,54 @@
>>   #include "coresight-priv.h"
>>   #include "coresight-cti.h"
>>
>> +#define CTI_EXTENDED "qcom,coresight-cti-extended"
>> +
>> +static const int cti_normal_offset[] = {
>> +       [CTIINTACK]             = 0x010,
>> +       [CTIAPPSET]             = 0x014,
>> +       [CTIAPPCLEAR]           = 0x018,
>> +       [CTIAPPPULSE]           = 0x01C,
>> +       [CTIINEN]               = 0x020,
>> +       [CTIOUTEN]              = 0x0A0,
>> +       [CTITRIGINSTATUS]       = 0x130,
>> +       [CTITRIGOUTSTATUS]      = 0x134,
>> +       [CTICHINSTATUS]         = 0x138,
>> +       [CTICHOUTSTATUS]        = 0x13C,
>> +       [CTIGATE]               = 0x140,
>> +       [ASICCTL]               = 0x144,
>> +       [ITCHINACK]             = 0xEDC,
>> +       [ITTRIGINACK]           = 0xEE0,
>> +       [ITCHOUT]               = 0xEE4,
>> +       [ITTRIGOUT]             = 0xEE8,
>> +       [ITCHOUTACK]            = 0xEEC,
>> +       [ITTRIGOUTACK]          = 0xEF0,
>> +       [ITCHIN]                = 0xEF4,
>> +       [ITTRIGIN]              = 0xEF8,
>> +};
>> +
> 
> Why not all CTI registers in these arrays?
> Do not use hardcoded values in here - use the #defines from the header file.

some register offsets are same for QCOM extended CTI and ARM CTI.

> 
> 
>> +static const int cti_extended_offset[] = {
>> +       [CTIINTACK]             = 0x020,
>> +       [CTIAPPSET]             = 0x004,
>> +       [CTIAPPCLEAR]           = 0x008,
>> +       [CTIAPPPULSE]           = 0x00C,
>> +       [CTIINEN]               = 0x400,
>> +       [CTIOUTEN]              = 0x800,
>> +       [CTITRIGINSTATUS]       = 0x040,
>> +       [CTITRIGOUTSTATUS]      = 0x060,
>> +       [CTICHINSTATUS]         = 0x080,
>> +       [CTICHOUTSTATUS]        = 0x084,
>> +       [CTIGATE]               = 0x088,
>> +       [ASICCTL]               = 0x08c,
>> +       [ITCHINACK]             = 0xE70,
>> +       [ITTRIGINACK]           = 0xE80,
>> +       [ITCHOUT]               = 0xE74,
>> +       [ITTRIGOUT]             = 0xEA0,
>> +       [ITCHOUTACK]            = 0xE78,
>> +       [ITTRIGOUTACK]          = 0xEC0,
>> +       [ITCHIN]                = 0xE7C,
>> +       [ITTRIGIN]              = 0xEE0,
>> +};
>> +
> 
> Again use #defines from header - in this case prehaps a new
> qcom-cti.h, #define values QCOM_CTINTACK etc...

I will check.

> 
>>   /*
>>    * CTI devices can be associated with a PE, or be connected to CoreSight
>>    * hardware. We have a list of all CTIs irrespective of CPU bound or
>> @@ -57,6 +106,12 @@ static struct cti_drvdata *cti_cpu_drvdata[NR_CPUS];
>>    */
>>   DEFINE_CORESIGHT_DEVLIST(cti_sys_devs, "cti_sys");
>>
>> +u32 cti_offset(struct cti_drvdata *drvdata, int index, int num)
>> +{
>> +       return (drvdata->is_extended_cti ? cti_extended_offset[index]
>> +                       : cti_normal_offset[index]) + (4 * num);
> 
> have a pointer to the offset array in drvdata and set it at probe
> time. This fn could probalb ybe inlines and then becomes
> 
> return drvdata->offsets[index] + (4 * num);

I will check and update.

> 
> 
>> +}
>> +
>>   /* write set of regs to hardware - call with spinlock claimed */
>>   void cti_write_all_hw_regs(struct cti_drvdata *drvdata)
>>   {
>> @@ -70,15 +125,15 @@ void cti_write_all_hw_regs(struct cti_drvdata *drvdata)
>>
>>          /* write the CTI trigger registers */
>>          for (i = 0; i < config->nr_trig_max; i++) {
>> -               writel_relaxed(config->ctiinen[i], drvdata->base + CTIINEN(i));
>> +               writel_relaxed(config->ctiinen[i], drvdata->base + cti_offset(drvdata, CTIINEN, i));
>>                  writel_relaxed(config->ctiouten[i],
>> -                              drvdata->base + CTIOUTEN(i));
>> +                               drvdata->base + cti_offset(drvdata, CTIOUTEN, i));
>>          }
>>
>>          /* other regs */
>> -       writel_relaxed(config->ctigate, drvdata->base + CTIGATE);
>> -       writel_relaxed(config->asicctl, drvdata->base + ASICCTL);
>> -       writel_relaxed(config->ctiappset, drvdata->base + CTIAPPSET);
>> +       writel_relaxed(config->ctigate, drvdata->base + cti_offset(drvdata, CTIGATE, 0));
>> +       writel_relaxed(config->asicctl, drvdata->base + cti_offset(drvdata, ASICCTL, 0));
>> +       writel_relaxed(config->ctiappset, drvdata->base + cti_offset(drvdata, CTIAPPSET, 0));
>>
>>          /* re-enable CTI */
>>          writel_relaxed(1, drvdata->base + CTICONTROL);
>> @@ -99,10 +154,13 @@ static int cti_enable_hw(struct cti_drvdata *drvdata)
>>          if (config->hw_enabled || !config->hw_powered)
>>                  goto cti_state_unchanged;
>>
>> -       /* claim the device */
>> -       rc = coresight_claim_device(drvdata->csdev);
>> -       if (rc)
>> -               goto cti_err_not_enabled;
>> +       /* There is no relationship between the CLR and SET pair for extended CTI. */
> 
> What does this mean? - these are CoreSight required management
> registers required by software to claim the resource. Are they not
> present of this device or has the functionality of these registers
> been dropped.
> Either way this is no longer a Coresight compatible CTI device without these.
> 
>> +       if (!drvdata->is_extended_cti) {
>> +               /* claim the device */
>> +               rc = coresight_claim_device(drvdata->csdev);
>> +               if (rc)
>> +                       goto cti_err_not_enabled;
>> +       }
>>
>>          cti_write_all_hw_regs(drvdata);
>>
>> @@ -175,7 +233,8 @@ static int cti_disable_hw(struct cti_drvdata *drvdata)
>>          writel_relaxed(0, drvdata->base + CTICONTROL);
>>          config->hw_enabled = false;
>>
>> -       coresight_disclaim_device_unlocked(csdev);
>> +       if (!drvdata->is_extended_cti)
>> +               coresight_disclaim_device_unlocked(csdev);
>>          CS_LOCK(drvdata->base);
>>          raw_spin_unlock(&drvdata->spinlock);
>>          return ret;
>> @@ -270,8 +329,10 @@ int cti_add_connection_entry(struct device *dev, struct cti_drvdata *drvdata,
>>          cti_dev->nr_trig_con++;
>>
>>          /* add connection usage bit info to overall info */
>> -       drvdata->config.trig_in_use |= tc->con_in->used_mask;
>> -       drvdata->config.trig_out_use |= tc->con_out->used_mask;
>> +       bitmap_or(drvdata->config.trig_in_use, drvdata->config.trig_in_use,
>> +                 tc->con_in->used_mask, drvdata->config.nr_trig_max);
>> +       bitmap_or(drvdata->config.trig_out_use, drvdata->config.trig_out_use,
>> +                 tc->con_out->used_mask, drvdata->config.nr_trig_max);
>>
>>          return 0;
>>   }
>> @@ -314,7 +375,6 @@ int cti_add_default_connection(struct device *dev, struct cti_drvdata *drvdata)
>>   {
>>          int ret = 0;
>>          int n_trigs = drvdata->config.nr_trig_max;
>> -       u32 n_trig_mask = GENMASK(n_trigs - 1, 0);
>>          struct cti_trig_con *tc = NULL;
>>
>>          /*
>> @@ -325,8 +385,9 @@ int cti_add_default_connection(struct device *dev, struct cti_drvdata *drvdata)
>>          if (!tc)
>>                  return -ENOMEM;
>>
>> -       tc->con_in->used_mask = n_trig_mask;
>> -       tc->con_out->used_mask = n_trig_mask;
>> +       bitmap_fill(tc->con_in->used_mask, n_trigs);
>> +       bitmap_fill(tc->con_out->used_mask, n_trigs);
>> +
>>          ret = cti_add_connection_entry(dev, drvdata, tc, NULL, "default");
>>          return ret;
>>   }
>> @@ -339,7 +400,6 @@ int cti_channel_trig_op(struct device *dev, enum cti_chan_op op,
>>   {
>>          struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
>>          struct cti_config *config = &drvdata->config;
>> -       u32 trig_bitmask;
>>          u32 chan_bitmask;
>>          u32 reg_value;
>>          int reg_offset;
>> @@ -349,25 +409,23 @@ int cti_channel_trig_op(struct device *dev, enum cti_chan_op op,
>>             (trigger_idx >= config->nr_trig_max))
>>                  return -EINVAL;
>>
>> -       trig_bitmask = BIT(trigger_idx);
>> -
>>          /* ensure registered triggers and not out filtered */
>>          if (direction == CTI_TRIG_IN)   {
>> -               if (!(trig_bitmask & config->trig_in_use))
>> +               if (!(test_bit(trigger_idx, config->trig_in_use)))
>>                          return -EINVAL;
>>          } else {
>> -               if (!(trig_bitmask & config->trig_out_use))
>> +               if (!(test_bit(trigger_idx, config->trig_out_use)))
>>                          return -EINVAL;
>>
>>                  if ((config->trig_filter_enable) &&
>> -                   (config->trig_out_filter & trig_bitmask))
>> +                   test_bit(trigger_idx, config->trig_out_filter))
>>                          return -EINVAL;
>>          }
>>
>>          /* update the local register values */
>>          chan_bitmask = BIT(channel_idx);
>> -       reg_offset = (direction == CTI_TRIG_IN ? CTIINEN(trigger_idx) :
>> -                     CTIOUTEN(trigger_idx));
>> +       reg_offset = (direction == CTI_TRIG_IN ? cti_offset(drvdata, CTIINEN, trigger_idx) :
>> +                       cti_offset(drvdata, CTIOUTEN, trigger_idx));
>>
>>          raw_spin_lock(&drvdata->spinlock);
>>
>> @@ -451,19 +509,19 @@ int cti_channel_setop(struct device *dev, enum cti_chan_set_op op,
>>          case CTI_CHAN_SET:
>>                  config->ctiappset |= chan_bitmask;
>>                  reg_value  = config->ctiappset;
>> -               reg_offset = CTIAPPSET;
>> +               reg_offset = cti_offset(drvdata, CTIAPPSET, 0);
>>                  break;
>>
>>          case CTI_CHAN_CLR:
>>                  config->ctiappset &= ~chan_bitmask;
>>                  reg_value = chan_bitmask;
>> -               reg_offset = CTIAPPCLEAR;
>> +               reg_offset = cti_offset(drvdata, CTIAPPCLEAR, 0);
>>                  break;
>>
>>          case CTI_CHAN_PULSE:
>>                  config->ctiappset &= ~chan_bitmask;
>>                  reg_value = chan_bitmask;
>> -               reg_offset = CTIAPPPULSE;
>> +               reg_offset = cti_offset(drvdata, CTIAPPPULSE, 0);
>>                  break;
>>
>>          default:
>> @@ -857,6 +915,19 @@ static void cti_remove(struct amba_device *adev)
>>          coresight_unregister(drvdata->csdev);
>>   }
>>
>> +static bool of_is_extended_cti(struct device *dev)
>> +{
>> +       struct fwnode_handle *fwnode = dev_fwnode(dev);
>> +
>> +       if (is_of_node(fwnode)) {
>> +               if (of_device_is_compatible(to_of_node(fwnode),
>> +                                           CTI_EXTENDED))
>> +                       return true;
>> +       }
>> +
>> +       return false;
>> +}
>> +
>>   static int cti_probe(struct amba_device *adev, const struct amba_id *id)
>>   {
>>          int ret = 0;
>> @@ -950,9 +1021,11 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
>>          drvdata->csdev_release = drvdata->csdev->dev.release;
>>          drvdata->csdev->dev.release = cti_device_release;
>>
>> +       drvdata->is_extended_cti = of_is_extended_cti(dev);
> 
> Better as drvdata->cti_subtype - see comments below.

I will check and update.

>> +
>>          /* all done - dec pm refcount */
>>          pm_runtime_put(&adev->dev);
>> -       dev_info(&drvdata->csdev->dev, "CTI initialized\n");
>> +       dev_info(&drvdata->csdev->dev, "CTI initialized %d\n", drvdata->is_extended_cti);
>>          return 0;
>>
>>   pm_release:
>> diff --git a/drivers/hwtracing/coresight/coresight-cti-platform.c b/drivers/hwtracing/coresight/coresight-cti-platform.c
>> index d0ae10bf6128..4bef860a0484 100644
>> --- a/drivers/hwtracing/coresight/coresight-cti-platform.c
>> +++ b/drivers/hwtracing/coresight/coresight-cti-platform.c
>> @@ -136,8 +136,8 @@ static int cti_plat_create_v8_etm_connection(struct device *dev,
>>                  goto create_v8_etm_out;
>>
>>          /* build connection data */
>> -       tc->con_in->used_mask = 0xF0; /* sigs <4,5,6,7> */
>> -       tc->con_out->used_mask = 0xF0; /* sigs <4,5,6,7> */
>> +       bitmap_set(tc->con_in->used_mask, 4, 4); /* sigs <4,5,6,7> */
>> +       bitmap_set(tc->con_out->used_mask, 4, 4); /* sigs <4,5,6,7> */
>>
>>          /*
>>           * The EXTOUT type signals from the ETM are connected to a set of input
>> @@ -194,10 +194,10 @@ static int cti_plat_create_v8_connections(struct device *dev,
>>                  goto of_create_v8_out;
>>
>>          /* Set the v8 PE CTI connection data */
>> -       tc->con_in->used_mask = 0x3; /* sigs <0 1> */
>> +       bitmap_set(tc->con_in->used_mask, 0, 2); /* sigs <0 1> */
>>          tc->con_in->sig_types[0] = PE_DBGTRIGGER;
>>          tc->con_in->sig_types[1] = PE_PMUIRQ;
>> -       tc->con_out->used_mask = 0x7; /* sigs <0 1 2 > */
>> +       bitmap_set(tc->con_out->used_mask, 0, 3); /* sigs <0 1 2 > */
>>          tc->con_out->sig_types[0] = PE_EDBGREQ;
>>          tc->con_out->sig_types[1] = PE_DBGRESTART;
>>          tc->con_out->sig_types[2] = PE_CTIIRQ;
>> @@ -213,7 +213,7 @@ static int cti_plat_create_v8_connections(struct device *dev,
>>                  goto of_create_v8_out;
>>
>>          /* filter pe_edbgreq - PE trigout sig <0> */
>> -       drvdata->config.trig_out_filter |= 0x1;
>> +       set_bit(0, drvdata->config.trig_out_filter);
>>
>>   of_create_v8_out:
>>          return ret;
>> @@ -257,7 +257,7 @@ static int cti_plat_read_trig_group(struct cti_trig_grp *tgrp,
>>          if (!err) {
>>                  /* set the signal usage mask */
>>                  for (idx = 0; idx < tgrp->nr_sigs; idx++)
>> -                       tgrp->used_mask |= BIT(values[idx]);
>> +                       set_bit(values[idx], tgrp->used_mask);
>>          }
>>
>>          kfree(values);
>> @@ -331,7 +331,9 @@ static int cti_plat_process_filter_sigs(struct cti_drvdata *drvdata,
>>
>>          err = cti_plat_read_trig_group(tg, fwnode, CTI_DT_FILTER_OUT_SIGS);
>>          if (!err)
>> -               drvdata->config.trig_out_filter |= tg->used_mask;
>> +               bitmap_or(drvdata->config.trig_out_filter,
>> +                         drvdata->config.trig_out_filter,
>> +                         tg->used_mask, drvdata->config.nr_trig_max);
>>
>>          kfree(tg);
>>          return err;
>> diff --git a/drivers/hwtracing/coresight/coresight-cti-sysfs.c b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
>> index 572b80ee96fb..cc680a4b900a 100644
>> --- a/drivers/hwtracing/coresight/coresight-cti-sysfs.c
>> +++ b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
>> @@ -172,9 +172,8 @@ static struct attribute *coresight_cti_attrs[] = {
>>
>>   /* register based attributes */
>>
>> -/* Read registers with power check only (no enable check). */
>> -static ssize_t coresight_cti_reg_show(struct device *dev,
>> -                          struct device_attribute *attr, char *buf)
>> +static ssize_t coresight_cti_mgmt_reg_show(struct device *dev,
>> +                                          struct device_attribute *attr, char *buf)
>>   {
>>          struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
>>          struct cs_off_attribute *cti_attr = container_of(attr, struct cs_off_attribute, attr);
>> @@ -189,6 +188,53 @@ static ssize_t coresight_cti_reg_show(struct device *dev,
>>          return sysfs_emit(buf, "0x%x\n", val);
>>   }
>>
>> +/* Read registers with power check only (no enable check). */
>> +static ssize_t coresight_cti_reg_show(struct device *dev,
>> +                                     struct device_attribute *attr, char *buf)
>> +{
>> +       struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
>> +       struct cs_off_attribute *cti_attr = container_of(attr, struct cs_off_attribute, attr);
>> +       struct cti_config *cfg = &drvdata->config;
>> +       u32 val = 0;
>> +       int i, num;
>> +       ssize_t size = 0;
>> +
>> +       pm_runtime_get_sync(dev->parent);
>> +       raw_spin_lock(&drvdata->spinlock);
>> +       if (drvdata->config.hw_powered) {
>> +               switch (cti_attr->off) {
>> +               case CTICHINSTATUS:
>> +               case CTICHOUTSTATUS:
>> +               case ITCHINACK:
>> +               case ITCHOUT:
>> +               case ITCHOUTACK:
>> +               case ITCHIN:
>> +                       val = readl_relaxed(drvdata->base + cti_offset(drvdata, cti_attr->off, 0));
>> +                       size += sysfs_emit(buf, "0x%x\n", val);
>> +                       break;
>> +
>> +               case CTITRIGINSTATUS:
>> +               case CTITRIGOUTSTATUS:
>> +               case ITTRIGINACK:
>> +               case ITTRIGOUT:
>> +               case ITTRIGOUTACK:
>> +               case ITTRIGIN:
>> +                       num = (cfg->nr_trig_max - 1) / 32;
>> +                       for (i = 0; i <= num; i++) {
>> +                               val = readl_relaxed(drvdata->base +
>> +                                               cti_offset(drvdata, cti_attr->off, i));
>> +                               size += sysfs_emit_at(buf, size, "0x%x ", val);
>> +                       }
>> +                       if (size > 0)
>> +                               buf[size - 1] = '\n';
>> +                       break;
>> +               }
>> +       }
>> +       raw_spin_unlock(&drvdata->spinlock);
>> +       pm_runtime_put_sync(dev->parent);
>> +       return size;
>> +}
>> +
>>   /* Write registers with power check only (no enable check). */
>>   static __maybe_unused ssize_t coresight_cti_reg_store(struct device *dev,
>>                                                        struct device_attribute *attr,
>> @@ -197,19 +243,45 @@ static __maybe_unused ssize_t coresight_cti_reg_store(struct device *dev,
>>          struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
>>          struct cs_off_attribute *cti_attr = container_of(attr, struct cs_off_attribute, attr);
>>          unsigned long val = 0;
>> +       int num, i;
>>
>>          if (kstrtoul(buf, 0, &val))
>>                  return -EINVAL;
>>
>>          pm_runtime_get_sync(dev->parent);
>>          raw_spin_lock(&drvdata->spinlock);
>> -       if (drvdata->config.hw_powered)
>> -               cti_write_single_reg(drvdata, cti_attr->off, val);
>> +       if (drvdata->config.hw_powered) {
>> +               switch (cti_attr->off) {
>> +               case ITCHINACK:
>> +               case ITCHOUT:
>> +                       cti_write_single_reg(drvdata, cti_offset(drvdata, cti_attr->off, 0), val);
>> +                       break;
>> +
>> +               case ITTRIGINACK:
>> +               case ITTRIGOUT:
>> +               case ITTRIGOUTACK:
>> +                       num = val / 32;
> 
> Why?
> 
>> +                       i = val % 32;
> 
> Why? - "val" is the 32 bit value you want ot put into a 32 bit register.

Here I want use "value" as the trigger number and write to the
Trigger regsiters. Here should be:
cti_write_single_reg(drvdata,cti_offset(drvdata, cti_attr->off, num), 
BIT(i))

I will double check and retest it.

> 
>> +                       for (i = 0; i <= num; i++)
>> +                               cti_write_single_reg(drvdata,
>> +                                                    cti_offset(drvdata, cti_attr->off, i), BIT(i));
> 
> I cannot understand what this code is trying to do. Why is this
> attempting to write to multiple registers with some BIT(i) value
> rather than the input "val"
> e.g. The complete 32biut value "val" should be written to ITTRIGOUT -
> which is what the original code did. This breaks the original
> functionality
> 
> Has this code been tested?
> 
>> +                       break;
>> +               }
>> +       }
>> +
>>          raw_spin_unlock(&drvdata->spinlock);
>>          pm_runtime_put_sync(dev->parent);
>>          return size;
>>   }
>>
>> +#define coresight_cti_mgmt_reg(name, offset)                                   \
>> +       (&((struct cs_off_attribute[]) {                                \
>> +          {                                                            \
>> +               __ATTR(name, 0444, coresight_cti_mgmt_reg_show, NULL),  \
>> +               offset                                                  \
>> +          }                                                            \
>> +       })[0].attr.attr)
>> +
>>   #define coresight_cti_reg(name, offset)                                        \
>>          (&((struct cs_off_attribute[]) {                                \
>>             {                                                            \
>> @@ -237,17 +309,17 @@ static __maybe_unused ssize_t coresight_cti_reg_store(struct device *dev,
>>
>>   /* coresight management registers */
>>   static struct attribute *coresight_cti_mgmt_attrs[] = {
>> -       coresight_cti_reg(devaff0, CTIDEVAFF0),
>> -       coresight_cti_reg(devaff1, CTIDEVAFF1),
>> -       coresight_cti_reg(authstatus, CORESIGHT_AUTHSTATUS),
>> -       coresight_cti_reg(devarch, CORESIGHT_DEVARCH),
>> -       coresight_cti_reg(devid, CORESIGHT_DEVID),
>> -       coresight_cti_reg(devtype, CORESIGHT_DEVTYPE),
>> -       coresight_cti_reg(pidr0, CORESIGHT_PERIPHIDR0),
>> -       coresight_cti_reg(pidr1, CORESIGHT_PERIPHIDR1),
>> -       coresight_cti_reg(pidr2, CORESIGHT_PERIPHIDR2),
>> -       coresight_cti_reg(pidr3, CORESIGHT_PERIPHIDR3),
>> -       coresight_cti_reg(pidr4, CORESIGHT_PERIPHIDR4),
>> +       coresight_cti_mgmt_reg(devaff0, CTIDEVAFF0),
>> +       coresight_cti_mgmt_reg(devaff1, CTIDEVAFF1),
>> +       coresight_cti_mgmt_reg(authstatus, CORESIGHT_AUTHSTATUS),
>> +       coresight_cti_mgmt_reg(devarch, CORESIGHT_DEVARCH),
>> +       coresight_cti_mgmt_reg(devid, CORESIGHT_DEVID),
>> +       coresight_cti_mgmt_reg(devtype, CORESIGHT_DEVTYPE),
>> +       coresight_cti_mgmt_reg(pidr0, CORESIGHT_PERIPHIDR0),
>> +       coresight_cti_mgmt_reg(pidr1, CORESIGHT_PERIPHIDR1),
>> +       coresight_cti_mgmt_reg(pidr2, CORESIGHT_PERIPHIDR2),
>> +       coresight_cti_mgmt_reg(pidr3, CORESIGHT_PERIPHIDR3),
>> +       coresight_cti_mgmt_reg(pidr4, CORESIGHT_PERIPHIDR4),
>>          NULL,
>>   };
>>
>> @@ -284,11 +356,12 @@ static ssize_t cti_reg32_show(struct device *dev, char *buf,
>>    * if reg_offset >= 0 then write through if enabled.
>>    */
>>   static ssize_t cti_reg32_store(struct device *dev, const char *buf,
>> -                              size_t size, u32 *pcached_val, int reg_offset)
>> +                              size_t size, u32 *pcached_val, int index)
>>   {
>>          unsigned long val;
>>          struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
>>          struct cti_config *config = &drvdata->config;
>> +       int reg_offset;
>>
>>          if (kstrtoul(buf, 0, &val))
>>                  return -EINVAL;
>> @@ -298,6 +371,7 @@ static ssize_t cti_reg32_store(struct device *dev, const char *buf,
>>          if (pcached_val)
>>                  *pcached_val = (u32)val;
>>
>> +       reg_offset = cti_offset(drvdata, index, 0);
>>          /* write through if offset and enabled */
>>          if ((reg_offset >= 0) && cti_active(config))
>>                  cti_write_single_reg(drvdata, reg_offset, val);
>> @@ -306,14 +380,14 @@ static ssize_t cti_reg32_store(struct device *dev, const char *buf,
>>   }
>>
>>   /* Standard macro for simple rw cti config registers */
>> -#define cti_config_reg32_rw(name, cfgname, offset)                     \
>> +#define cti_config_reg32_rw(name, cfgname, index)                      \
> 
> Why the pointless change of a parameter name in a macro?

The third parm is index in the offset array instead of offset
for extended change.

> 
>>   static ssize_t name##_show(struct device *dev,                         \
>>                             struct device_attribute *attr,               \
>>                             char *buf)                                   \
>>   {                                                                      \
>>          struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);     \
>>          return cti_reg32_show(dev, buf,                                 \
>> -                             &drvdata->config.cfgname, offset);        \
>> +                             &drvdata->config.cfgname, index);         \
>>   }                                                                      \
>>                                                                          \
>>   static ssize_t name##_store(struct device *dev,                                \
>> @@ -322,7 +396,7 @@ static ssize_t name##_store(struct device *dev,                             \
>>   {                                                                      \
>>          struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);     \
>>          return cti_reg32_store(dev, buf, size,                          \
>> -                              &drvdata->config.cfgname, offset);       \
>> +                              &drvdata->config.cfgname, index);        \
>>   }                                                                      \
>>   static DEVICE_ATTR_RW(name)
>>
>> @@ -389,7 +463,7 @@ static ssize_t inen_store(struct device *dev,
>>
>>          /* write through if enabled */
>>          if (cti_active(config))
>> -               cti_write_single_reg(drvdata, CTIINEN(index), val);
>> +               cti_write_single_reg(drvdata, cti_offset(drvdata, CTIINEN, index), val);
>>          raw_spin_unlock(&drvdata->spinlock);
>>          return size;
>>   }
>> @@ -428,7 +502,7 @@ static ssize_t outen_store(struct device *dev,
>>
>>          /* write through if enabled */
>>          if (cti_active(config))
>> -               cti_write_single_reg(drvdata, CTIOUTEN(index), val);
>> +               cti_write_single_reg(drvdata, cti_offset(drvdata, CTIOUTEN, index), val);
>>          raw_spin_unlock(&drvdata->spinlock);
>>          return size;
>>   }
>> @@ -711,10 +785,8 @@ static ssize_t trigout_filtered_show(struct device *dev,
>>          struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
>>          struct cti_config *cfg = &drvdata->config;
>>          int size = 0, nr_trig_max = cfg->nr_trig_max;
>> -       unsigned long mask = cfg->trig_out_filter;
>>
>> -       if (mask)
>> -               size = bitmap_print_to_pagebuf(true, buf, &mask, nr_trig_max);
>> +       size = bitmap_print_to_pagebuf(true, buf, cfg->trig_out_filter, nr_trig_max);
>>          return size;
>>   }
>>   static DEVICE_ATTR_RO(trigout_filtered);
>> @@ -926,9 +998,8 @@ static ssize_t trigin_sig_show(struct device *dev,
>>          struct cti_trig_con *con = (struct cti_trig_con *)ext_attr->var;
>>          struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
>>          struct cti_config *cfg = &drvdata->config;
>> -       unsigned long mask = con->con_in->used_mask;
>>
>> -       return bitmap_print_to_pagebuf(true, buf, &mask, cfg->nr_trig_max);
>> +       return bitmap_print_to_pagebuf(true, buf, con->con_in->used_mask, cfg->nr_trig_max);
>>   }
>>
>>   static ssize_t trigout_sig_show(struct device *dev,
>> @@ -940,9 +1011,8 @@ static ssize_t trigout_sig_show(struct device *dev,
>>          struct cti_trig_con *con = (struct cti_trig_con *)ext_attr->var;
>>          struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
>>          struct cti_config *cfg = &drvdata->config;
>> -       unsigned long mask = con->con_out->used_mask;
>>
>> -       return bitmap_print_to_pagebuf(true, buf, &mask, cfg->nr_trig_max);
>> +       return bitmap_print_to_pagebuf(true, buf, con->con_out->used_mask, cfg->nr_trig_max);
>>   }
>>
>>   /* convert a sig type id to a name */
>> diff --git a/drivers/hwtracing/coresight/coresight-cti.h b/drivers/hwtracing/coresight/coresight-cti.h
>> index 8362a47c939c..7d052e76d116 100644
>> --- a/drivers/hwtracing/coresight/coresight-cti.h
>> +++ b/drivers/hwtracing/coresight/coresight-cti.h
>> @@ -18,46 +18,42 @@
>>
>>   struct fwnode_handle;
>>
>> -/*
>> - * Device registers
>> - * 0x000 - 0x144: CTI programming and status
>> - * 0xEDC - 0xEF8: CTI integration test.
>> - * 0xF00 - 0xFFC: Coresight management registers.
>> - */
>> -/* CTI programming registers */
>> -#define CTICONTROL             0x000
>> -#define CTIINTACK              0x010
>> -#define CTIAPPSET              0x014
>> -#define CTIAPPCLEAR            0x018
>> -#define CTIAPPPULSE            0x01C
>> -#define CTIINEN(n)             (0x020 + (4 * n))
>> -#define CTIOUTEN(n)            (0x0A0 + (4 * n))
>> -#define CTITRIGINSTATUS                0x130
>> -#define CTITRIGOUTSTATUS       0x134
>> -#define CTICHINSTATUS          0x138
>> -#define CTICHOUTSTATUS         0x13C
>> -#define CTIGATE                        0x140
>> -#define ASICCTL                        0x144
>> -/* Integration test registers */
>> -#define ITCHINACK              0xEDC /* WO CTI CSSoc 400 only*/
>> -#define ITTRIGINACK            0xEE0 /* WO CTI CSSoc 400 only*/
>> -#define ITCHOUT                        0xEE4 /* WO RW-600 */
>> -#define ITTRIGOUT              0xEE8 /* WO RW-600 */
>> -#define ITCHOUTACK             0xEEC /* RO CTI CSSoc 400 only*/
>> -#define ITTRIGOUTACK           0xEF0 /* RO CTI CSSoc 400 only*/
>> -#define ITCHIN                 0xEF4 /* RO */
>> -#define ITTRIGIN               0xEF8 /* RO */
>> -/* management registers */
>> -#define CTIDEVAFF0             0xFA8
>> -#define CTIDEVAFF1             0xFAC
>> -
> 
> Do not remove these from this file. Use them in the .c file to
> populate the offset array. See above comments

I will check and update.

> 
> 
>>   /*
>>    * CTI CSSoc 600 has a max of 32 trigger signals per direction.
>>    * CTI CSSoc 400 has 8 IO triggers - other CTIs can be impl def.
>>    * Max of in and out defined in the DEVID register.
>>    * - pick up actual number used from .dts parameters if present.
>>    */
>> -#define CTIINOUTEN_MAX         32
>> +#define CTIINOUTEN_MAX         128
>> +
>> +#define CTICONTROL             0x000
>> +
>> +/* management registers */
>> +#define CTIDEVAFF0             0xFA8
>> +#define CTIDEVAFF1             0xFAC
>> +
>> +enum cti_offset_index {
>> +       CTIINTACK,
>> +       CTIAPPSET,
>> +       CTIAPPCLEAR,
>> +       CTIAPPPULSE,
>> +       CTIINEN,
>> +       CTIOUTEN,
>> +       CTITRIGINSTATUS,
>> +       CTITRIGOUTSTATUS,
>> +       CTICHINSTATUS,
>> +       CTICHOUTSTATUS,
>> +       CTIGATE,
>> +       ASICCTL,
>> +       ITCHINACK,
>> +       ITTRIGINACK,
>> +       ITCHOUT,
>> +       ITTRIGOUT,
>> +       ITCHOUTACK,
>> +       ITTRIGOUTACK,
>> +       ITCHIN,
>> +       ITTRIGIN,
>> +};
>>
>>   /**
>>    * Group of related trigger signals
>> @@ -68,7 +64,7 @@ struct fwnode_handle;
>>    */
>>   struct cti_trig_grp {
>>          int nr_sigs;
>> -       u32 used_mask;
>> +       DECLARE_BITMAP(used_mask, CTIINOUTEN_MAX);
>>          int sig_types[];
>>   };
>>
>> @@ -147,9 +143,10 @@ struct cti_config {
>>          bool hw_powered;
>>
>>          /* registered triggers and filtering */
>> -       u32 trig_in_use;
>> -       u32 trig_out_use;
>> -       u32 trig_out_filter;
>> +       DECLARE_BITMAP(trig_in_use, CTIINOUTEN_MAX);
>> +       DECLARE_BITMAP(trig_out_use, CTIINOUTEN_MAX);
>> +       DECLARE_BITMAP(trig_out_filter, CTIINOUTEN_MAX);
>> +
>>          bool trig_filter_enable;
>>          u8 xtrig_rchan_sel;
>>
>> @@ -180,6 +177,7 @@ struct cti_drvdata {
>>          struct cti_config config;
>>          struct list_head node;
>>          void (*csdev_release)(struct device *dev);
>> +       bool is_extended_cti;
> 
> use an enum type here - e.g. enum cti_subtype {  ARM_STD_CTI, QCOM_CTI };

I will update it.

> 
> 
>>   };
>>
>>   /*
>> @@ -232,6 +230,7 @@ int cti_create_cons_sysfs(struct device *dev, struct cti_drvdata *drvdata);
>>   struct coresight_platform_data *
>>   coresight_cti_get_platform_data(struct device *dev);
>>   const char *cti_plat_get_node_name(struct fwnode_handle *fwnode);
>> +u32 cti_offset(struct cti_drvdata *drvdata, int index, int num);
>>
>>   /* cti powered and enabled */
>>   static inline bool cti_active(struct cti_config *cfg)
>> --
>> 2.25.1
>>
> 
> Regards
> 
> Mike


