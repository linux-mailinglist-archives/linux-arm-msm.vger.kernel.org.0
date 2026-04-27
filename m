Return-Path: <linux-arm-msm+bounces-104599-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QGnnD+XZ7mkNygAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104599-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 05:37:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B859F46C64F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 05:37:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3793E30068E1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 03:37:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 731B635CB6F;
	Mon, 27 Apr 2026 03:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="iMP6Be/+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9289E35FF58;
	Mon, 27 Apr 2026 03:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777261025; cv=none; b=XfeCWu1eCbdJU+O2kjzvZdp38M3ssJt+fuXcHChF4k7dXMRpiZ9MZX1tgiHSzvf4EZ9WZGoTTs94rdc4yCUBi+tgpysXpRo+Mi3YMtyuYntbv185GviEimFhauKpki8v3zlvFPdM6XG/kJOofW0iwVFtWhyd3HhLBqNHq3EhhbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777261025; c=relaxed/simple;
	bh=ZUizcNn6YWXKhL4+3WetnpAkhRicKsh35HmfJOmq7m8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=PDsFJEIrLjFUL6xOdonADi+D8u+nFb/Ki76lppFqrk18XJ4pLcW9G90d6Y/qudoEsMSqRrqqm1hT6xZ5oATaPNTPmKjCkG3Mjn3WAOznQCv965Csn43Ym9vuMLbEQn+KDgkzyeaVkvRaF/+pSaZTSMOt6k1eHa7BxX4hh+rzONo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=iMP6Be/+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R2jU8f2884198;
	Mon, 27 Apr 2026 03:36:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yY8YvWI2HmyyWPEE65aEh7he5GvSnkG8URbkSSv3y8Q=; b=iMP6Be/+sHmEvjJD
	CTjvj1hBoXEZJn6QefReaiD5PxxoKDJ3mh/XJR8G+I7CC4ZFYtlWjAscIgHHMM24
	HencxrD/dSb4NnchL9lvXz9TH6Zk3GkT2x+qR65E3pXvLRaqRpgbb4VcvjYXPJTe
	eydvoI2gduKvmf8GOwcr4ciu0tsjawM4FK0yeNLitfsvvbX8YpfgRGwGP2l8OmO9
	LA8jmBzWkOMpvf6tkcF42wI7hPLo2esMQ5+OOXBfQj7CC9+l2R37oLkmDy8F4sHn
	rrK0yn932+Fi9GB8/iXRJJ12T72tJKQLgpvBYx+7wh66xgYdUuENYzKKIfP0A2VK
	HWthXg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dsya004a4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Apr 2026 03:36:53 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTPS id 63R3aqwg019242
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Apr 2026 03:36:52 GMT
Received: from [10.233.71.148] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Sun, 26 Apr
 2026 20:36:49 -0700
Message-ID: <34dce0de-334a-4b02-8a18-fb712d0ad4c3@quicinc.com>
Date: Mon, 27 Apr 2026 11:36:47 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/4] coresight: cti: encode trigger register index in
 register offsets
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
	<tingwei.zhang@oss.qualcomm.com>
References: <20260426-extended-cti-v8-0-23b900a4902f@oss.qualcomm.com>
 <20260426-extended-cti-v8-2-23b900a4902f@oss.qualcomm.com>
 <11376a1b-923d-4bee-bdc6-fecea43a256d@oss.qualcomm.com>
Content-Language: en-US
From: "Yingchao Deng (Consultant)" <quic_yingdeng@quicinc.com>
In-Reply-To: <11376a1b-923d-4bee-bdc6-fecea43a256d@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-GUID: yxnRMOiEGlRCyvtopx0NQLpHb3Yo2qzx
X-Proofpoint-ORIG-GUID: yxnRMOiEGlRCyvtopx0NQLpHb3Yo2qzx
X-Authority-Analysis: v=2.4 cv=DZEnbPtW c=1 sm=1 tr=0 ts=69eed9d5 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=HjV8xp-4hyBqE0_XzRwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDAzNCBTYWx0ZWRfX/Axaqd8183hA
 RP/ZAVwywhKaRJgluyK/cm4XJCCv2CZis4mlP+iJMkPa58wHrJczDdS7XYaKItzn9w07yB2HnR+
 G2WUKl/m1wh0QYtUKybgCzfnpGCkO7LaTQlsdwU4j9lnisn4NHv9TRoUvgszEA4uKFUFdlOdROK
 8seJGXxgT+H+N0gT9eRZdxIQZJN9udtn84m1Ph/zsjwr6GLiPDyi7Yx9OOBUiF5Ia7+kX7nbxAI
 EkOABYkm0qDLVWRWhg2VYmLifLuaQxg2Y8dOkn9V/Ryy7+JQOrkPg62qylclJ3QzmJJio01Zmao
 ITqfdn/zzc/tqXTr1rYQh1TwsEdaf1FHD/CLvXH3CZL770S9kRVl3OB1dR4wxzqc09f6sWcTIWp
 3Hy5z8ia22Yd55s11wgHxYEUzwz0nLItFPByioGYyB5STwYqjf4yyHCgmymyp1XFbOCK5s0SzD/
 fgWsbE5TJwOXWJ+Rq1g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 spamscore=0 adultscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270034
X-Rspamd-Queue-Id: B859F46C64F
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
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-104599-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[quicinc.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[quic_yingdeng@quicinc.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]


On 4/27/2026 10:22 AM, Jie Gan wrote:
>
>
> On 4/26/2026 5:44 PM, Yingchao Deng wrote:
>> Introduce a small encoding to carry the register index together with the
>> base offset in a single u32, and use a common helper to compute the 
>> final
>> MMIO address. This refactors register access to be based on the encoded
>> (reg, nr) pair, reducing duplicated arithmetic and making it easier to
>> support variants that bank or relocate trigger-indexed registers.
>>
>> Signed-off-by: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
>> ---
>>   drivers/hwtracing/coresight/coresight-cti-core.c  | 31 
>> +++++++++++++++--------
>>   drivers/hwtracing/coresight/coresight-cti-sysfs.c |  4 +--
>>   drivers/hwtracing/coresight/coresight-cti.h       | 16 ++++++++++--
>>   3 files changed, 36 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-cti-core.c 
>> b/drivers/hwtracing/coresight/coresight-cti-core.c
>> index 4e7d12bd2d3e..c4cbeb64365b 100644
>> --- a/drivers/hwtracing/coresight/coresight-cti-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-cti-core.c
>> @@ -42,6 +42,14 @@ static DEFINE_MUTEX(ect_mutex);
>>   #define csdev_to_cti_drvdata(csdev)    \
>>       dev_get_drvdata(csdev->dev.parent)
>>   +static void __iomem *cti_reg_addr(struct cti_drvdata *drvdata, int 
>> reg)
>
> u32 reg would be better.
>
>> +{
>> +    u32 offset = CTI_REG_CLR_NR(reg);
>
> No functional error but a little bit tricky here.
>
> CTI_REG_CLR_NR(reg) will produce a offset for the bits[0:23], but in 
> the comment, you mentioned the base register offset ranges from [0:11].
>
> With my understanding, all CTI register offsets fall within the range 
> b 0 to 0XFAC, that's why we have bits[0:11]?
>
> Thanks,
> Jie
   Thanks for the review.
  While current CoreSight components fit within a single 4KB
   block, IHI0029 states that a component can occupy up to 64MB (16,384
   x 4KB blocks), requiring up to 26 bits for the offset. I will change
   CTI_REG_NR_MASK to GENMASK(31, 28) to avoid any potential conflict
   with bits[24:25].


Thanks,
Yingchao
>> +    u32 nr = CTI_REG_GET_NR(reg);
>> +
>> +    return drvdata->base + offset + sizeof(u32) * nr;
>> +}
>> +
>>   /* write set of regs to hardware - call with spinlock claimed */
>>   void cti_write_all_hw_regs(struct cti_drvdata *drvdata)
>>   {
>> @@ -55,16 +63,17 @@ void cti_write_all_hw_regs(struct cti_drvdata 
>> *drvdata)
>>         /* write the CTI trigger registers */
>>       for (i = 0; i < config->nr_trig_max; i++) {
>> -        writel_relaxed(config->ctiinen[i], drvdata->base + CTIINEN(i));
>> +        writel_relaxed(config->ctiinen[i],
>> +                   cti_reg_addr(drvdata, CTI_REG_SET_NR(CTIINEN, i)));
>>           writel_relaxed(config->ctiouten[i],
>> -                   drvdata->base + CTIOUTEN(i));
>> +                   cti_reg_addr(drvdata, CTI_REG_SET_NR(CTIOUTEN, i)));
>>       }
>>         /* other regs */
>> -    writel_relaxed(config->ctigate, drvdata->base + CTIGATE);
>> +    writel_relaxed(config->ctigate, cti_reg_addr(drvdata, CTIGATE));
>>       if (config->asicctl_impl)
>> -        writel_relaxed(config->asicctl, drvdata->base + ASICCTL);
>> -    writel_relaxed(config->ctiappset, drvdata->base + CTIAPPSET);
>> +        writel_relaxed(config->asicctl, cti_reg_addr(drvdata, 
>> ASICCTL));
>> +    writel_relaxed(config->ctiappset, cti_reg_addr(drvdata, 
>> CTIAPPSET));
>>         /* re-enable CTI */
>>       writel_relaxed(1, drvdata->base + CTICONTROL);
>> @@ -127,7 +136,7 @@ u32 cti_read_single_reg(struct cti_drvdata 
>> *drvdata, int offset)
>>       int val;
>>         CS_UNLOCK(drvdata->base);
>> -    val = readl_relaxed(drvdata->base + offset);
>> +    val = readl_relaxed(cti_reg_addr(drvdata, offset));
>>       CS_LOCK(drvdata->base);
>>         return val;
>> @@ -136,7 +145,7 @@ u32 cti_read_single_reg(struct cti_drvdata 
>> *drvdata, int offset)
>>   void cti_write_single_reg(struct cti_drvdata *drvdata, int offset, 
>> u32 value)
>>   {
>>       CS_UNLOCK(drvdata->base);
>> -    writel_relaxed(value, drvdata->base + offset);
>> +    writel_relaxed(value, cti_reg_addr(drvdata, offset));
>>       CS_LOCK(drvdata->base);
>>   }
>>   @@ -344,8 +353,7 @@ int cti_channel_trig_op(struct device *dev, 
>> enum cti_chan_op op,
>>         /* update the local register values */
>>       chan_bitmask = BIT(channel_idx);
>> -    reg_offset = (direction == CTI_TRIG_IN ? CTIINEN(trigger_idx) :
>> -              CTIOUTEN(trigger_idx));
>> +    reg_offset = (direction == CTI_TRIG_IN ? CTIINEN : CTIOUTEN);
>>         guard(raw_spinlock_irqsave)(&drvdata->spinlock);
>>   @@ -365,8 +373,9 @@ int cti_channel_trig_op(struct device *dev, 
>> enum cti_chan_op op,
>>         /* write through if enabled */
>>       if (cti_is_active(config))
>> -        cti_write_single_reg(drvdata, reg_offset, reg_value);
>> -
>> +        cti_write_single_reg(drvdata,
>> +                     CTI_REG_SET_NR(reg_offset, trigger_idx),
>> +                     reg_value);
>>       return 0;
>>   }
>>   diff --git a/drivers/hwtracing/coresight/coresight-cti-sysfs.c 
>> b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
>> index 2bbfa405cb6b..8b70e7e38ea3 100644
>> --- a/drivers/hwtracing/coresight/coresight-cti-sysfs.c
>> +++ b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
>> @@ -386,7 +386,7 @@ static ssize_t inen_store(struct device *dev,
>>         /* write through if enabled */
>>       if (cti_is_active(config))
>> -        cti_write_single_reg(drvdata, CTIINEN(index), val);
>> +        cti_write_single_reg(drvdata, CTI_REG_SET_NR(CTIINEN, 
>> index), val);
>>         return size;
>>   }
>> @@ -427,7 +427,7 @@ static ssize_t outen_store(struct device *dev,
>>         /* write through if enabled */
>>       if (cti_is_active(config))
>> -        cti_write_single_reg(drvdata, CTIOUTEN(index), val);
>> +        cti_write_single_reg(drvdata, CTI_REG_SET_NR(CTIOUTEN, 
>> index), val);
>>         return size;
>>   }
>> diff --git a/drivers/hwtracing/coresight/coresight-cti.h 
>> b/drivers/hwtracing/coresight/coresight-cti.h
>> index ef079fc18b72..dd1ba44518c4 100644
>> --- a/drivers/hwtracing/coresight/coresight-cti.h
>> +++ b/drivers/hwtracing/coresight/coresight-cti.h
>> @@ -7,6 +7,7 @@
>>   #ifndef _CORESIGHT_CORESIGHT_CTI_H
>>   #define _CORESIGHT_CORESIGHT_CTI_H
>>   +#include <linux/bitfield.h>
>>   #include <linux/coresight.h>
>>   #include <linux/device.h>
>>   #include <linux/list.h>
>> @@ -30,8 +31,8 @@ struct fwnode_handle;
>>   #define CTIAPPSET        0x014
>>   #define CTIAPPCLEAR        0x018
>>   #define CTIAPPPULSE        0x01C
>> -#define CTIINEN(n)        (0x020 + (4 * n))
>> -#define CTIOUTEN(n)        (0x0A0 + (4 * n))
>> +#define CTIINEN            0x020
>> +#define CTIOUTEN        0x0A0
>>   #define CTITRIGINSTATUS        0x130
>>   #define CTITRIGOUTSTATUS    0x134
>>   #define CTICHINSTATUS        0x138
>> @@ -59,6 +60,17 @@ struct fwnode_handle;
>>    */
>>   #define CTIINOUTEN_MAX        32
>>   +/*
>> + * Encode CTI register offset and register index in one u32:
>> + *   - bits[0:11]  : base register offset (0x000 to 0xFFF)
>> + *   - bits[24:31] : register index (nr)
>> + */
>> +#define CTI_REG_NR_MASK            GENMASK(31, 24)
>> +#define CTI_REG_GET_NR(reg)        FIELD_GET(CTI_REG_NR_MASK, (reg))
>> +#define CTI_REG_SET_NR_CONST(reg, nr)    ((reg) | 
>> FIELD_PREP_CONST(CTI_REG_NR_MASK, (nr)))
>> +#define CTI_REG_SET_NR(reg, nr)        ((reg) | 
>> FIELD_PREP(CTI_REG_NR_MASK, (nr)))
>> +#define CTI_REG_CLR_NR(reg)        ((reg) & (~CTI_REG_NR_MASK))
>> +
>>   /**
>>    * Group of related trigger signals
>>    *
>>
>

