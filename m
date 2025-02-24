Return-Path: <linux-arm-msm+bounces-49152-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA4EA41AE3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 11:27:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED4231892284
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 10:27:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D1F224BC0D;
	Mon, 24 Feb 2025 10:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="aIzETiqv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27658241669;
	Mon, 24 Feb 2025 10:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740392834; cv=none; b=SAzyrCjYVcyYQNYiDQSzqgsuvzIig1blUDmYuA5x/8q7tdikfMFOSzx+tdBs5IBAJeQVmUMtxZrIBMXvGKv3y/zB8RjWQxdTyfYwyDuCo/W6P5Ql7JJ67fcPKny6skiYNXhF4W1F7w/21c6abFKSBFkiTZrj9SZalDJqNRlUp/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740392834; c=relaxed/simple;
	bh=glD08YGIfzNVTikFxTMG2myORyCKDGmjPI2OYnD2McM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ds/o8RRln6Tva9VV3V8IRx+2dEgBYTDTquTn/JaedTszbF2YnsRJmf35X/HacPZTNxthjpFWeEw+X0AwwGAGYNlD6cR98zBhqv/yLUCerJp9JaAohskMd1Ano4nr84bO+nCevpVxKKh30e73Z33ilQ4zI0/iIGYquP8tj0SlqJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=aIzETiqv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51O76h1M024439;
	Mon, 24 Feb 2025 10:26:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T/nXp9TCiT3dsQI9a5TjGzmHwmEXUSf/75kIMW7Csbg=; b=aIzETiqvPBSSYuRy
	zzmV/4k4GuPpu/K8AiV4htA+3d58UXQBA3U89HztAmR4RAsNSoCvYTodoCt2hVSq
	riSG8ocgj1t2tFeL3IXsorx8ljZmSLKva0PlJKJPxyiFqkfdIrZ9591AGa3B2AF5
	EOo7oY5BEDepruyMhphkrzNCz5jLM5dmCGUmvEWg1NNORFBMObNtfj89lSBaI+72
	2ZZRSmnwlQ1pUg16laoBj+YopsfEPx6P/pA5bNxlP6xXCPjSgLEuHxBuYI0fQRAI
	oq7GjYdnk/UAaMhuK2ESgaSnWL2J1+a+0sxqae8/oNR+WXhpp3m4HnS5PytzWnGb
	lgQ3Dg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 450m3d8stc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Feb 2025 10:26:55 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51OAQtw9029670
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Feb 2025 10:26:55 GMT
Received: from [10.133.33.32] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 24 Feb
 2025 02:26:49 -0800
Message-ID: <debf4d65-0e47-4f13-ac7d-ee43ded55286@quicinc.com>
Date: Mon, 24 Feb 2025 18:26:46 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 6/7] Coresight: Add Coresight TMC Control Unit driver
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Jinlong Mao
	<quic_jinlmao@quicinc.com>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
References: <20250217093024.1133096-1-quic_jiegan@quicinc.com>
 <20250217093024.1133096-7-quic_jiegan@quicinc.com>
 <35d1a923-4e8e-4fe2-bf4a-0b78b1d511e3@arm.com>
 <a594bdee-7d9e-4d79-a5ee-a34dafa2869f@quicinc.com>
 <c274175a-ed6d-4ce9-be86-d48f56cafe9d@arm.com>
Content-Language: en-US
From: Jie Gan <quic_jiegan@quicinc.com>
In-Reply-To: <c274175a-ed6d-4ce9-be86-d48f56cafe9d@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: zv_QRQBYUctsoyQeL-rYTV-Bka0uiWwz
X-Proofpoint-ORIG-GUID: zv_QRQBYUctsoyQeL-rYTV-Bka0uiWwz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-24_04,2025-02-24_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 phishscore=0 mlxscore=0 mlxlogscore=999
 clxscore=1015 malwarescore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502240076



On 2/24/2025 6:22 PM, Suzuki K Poulose wrote:
> On 24/02/2025 03:32, Jie Gan wrote:
>>
>>
>> On 2/21/2025 7:39 PM, Suzuki K Poulose wrote:
>>> On 17/02/2025 09:30, Jie Gan wrote:
>>>> The Coresight TMC Control Unit hosts miscellaneous configuration 
>>>> registers
>>>> which control various features related to TMC ETR sink.
>>>>
>>>> Based on the trace ID, which is programmed in the related CTCU ATID
>>>> register of a specific ETR, trace data with that trace ID gets into
>>>> the ETR buffer, while other trace data gets dropped.
>>>>
>>>> Enabling source device sets one bit of the ATID register based on
>>>> source device's trace ID.
>>>> Disabling source device resets the bit according to the source
>>>> device's trace ID.
>>>>
>>>> Reviewed-by: James Clark <james.clark@linaro.org>
>>>> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
>>>> ---
>>>>   drivers/hwtracing/coresight/Kconfig          |  12 +
>>>>   drivers/hwtracing/coresight/Makefile         |   1 +
>>>>   drivers/hwtracing/coresight/coresight-ctcu.c | 268 +++++++++++++++ 
>>>> ++++
>>>>   drivers/hwtracing/coresight/coresight-ctcu.h |  24 ++
>>>>   include/linux/coresight.h                    |   3 +-
>>>>   5 files changed, 307 insertions(+), 1 deletion(-)
>>>>   create mode 100644 drivers/hwtracing/coresight/coresight-ctcu.c
>>>>   create mode 100644 drivers/hwtracing/coresight/coresight-ctcu.h
>>>>
>>>> diff --git a/drivers/hwtracing/coresight/Kconfig b/drivers/ 
>>>> hwtracing/ coresight/Kconfig
>>>> index 06f0a7594169..ecd7086a5b83 100644
>>>> --- a/drivers/hwtracing/coresight/Kconfig
>>>> +++ b/drivers/hwtracing/coresight/Kconfig
>>>> @@ -133,6 +133,18 @@ config CORESIGHT_STM
>>>>         To compile this driver as a module, choose M here: the
>>>>         module will be called coresight-stm.
>>>> +config CORESIGHT_CTCU
>>>> +    tristate "CoreSight TMC Control Unit driver"
>>>> +    depends on CORESIGHT_LINK_AND_SINK_TMC
>>>> +    help
>>>> +      This driver provides support for CoreSight TMC Control Unit
>>>> +      that hosts miscellaneous configuration registers. This is
>>>> +      primarily used for controlling the behaviors of the TMC
>>>> +      ETR device.
>>>> +
>>>> +      To compile this driver as a module, choose M here: the
>>>> +      module will be called coresight-ctcu.
>>>> +
>>>>   config CORESIGHT_CPU_DEBUG
>>>>       tristate "CoreSight CPU Debug driver"
>>>>       depends on ARM || ARM64
>>>> diff --git a/drivers/hwtracing/coresight/Makefile b/drivers/ 
>>>> hwtracing/ coresight/Makefile
>>>> index 4ba478211b31..1b7869910a12 100644
>>>> --- a/drivers/hwtracing/coresight/Makefile
>>>> +++ b/drivers/hwtracing/coresight/Makefile
>>>> @@ -51,3 +51,4 @@ coresight-cti-y := coresight-cti-core.o coresight- 
>>>> cti-platform.o \
>>>>              coresight-cti-sysfs.o
>>>>   obj-$(CONFIG_ULTRASOC_SMB) += ultrasoc-smb.o
>>>>   obj-$(CONFIG_CORESIGHT_DUMMY) += coresight-dummy.o
>>>> +obj-$(CONFIG_CORESIGHT_CTCU) += coresight-ctcu.o
>>>> diff --git a/drivers/hwtracing/coresight/coresight-ctcu.c b/drivers/ 
>>>> hwtracing/coresight/coresight-ctcu.c
>>>> new file mode 100644
>>>> index 000000000000..e1460a627c4d
>>>> --- /dev/null
>>>> +++ b/drivers/hwtracing/coresight/coresight-ctcu.c
>>>> @@ -0,0 +1,268 @@
>>>> +// SPDX-License-Identifier: GPL-2.0-only
>>>> +/*
>>>> + * Copyright (c) 2024-2025 Qualcomm Innovation Center, Inc. All 
>>>> rights reserved.
>>>> + */
>>>> +
>>>> +#include <linux/clk.h>
>>>> +#include <linux/coresight.h>
>>>> +#include <linux/device.h>
>>>> +#include <linux/err.h>
>>>> +#include <linux/kernel.h>
>>>> +#include <linux/init.h>
>>>> +#include <linux/io.h>
>>>> +#include <linux/module.h>
>>>> +#include <linux/mutex.h>
>>>> +#include <linux/of.h>
>>>> +#include <linux/platform_device.h>
>>>> +#include <linux/slab.h>
>>>> +
>>>> +#include "coresight-ctcu.h"
>>>> +#include "coresight-priv.h"
>>>> +
>>>> +DEFINE_CORESIGHT_DEVLIST(ctcu_devs, "ctcu");
>>>> +
>>>> +#define ctcu_writel(drvdata, val, offset)    __raw_writel((val), 
>>>> drvdata->base + offset)
>>>> +#define ctcu_readl(drvdata, offset)        __raw_readl(drvdata- 
>>>> >base + offset)
>>>> +
>>>> +/*
>>>> + * The TMC Coresight Control Unit uses four ATID registers to 
>>>> control the data
>>>> + * filter function based on the trace ID for each TMC ETR sink. The 
>>>> length of
>>>> + * each ATID register is 32 bits. Therefore, the ETR has a related 
>>>> field in
>>>> + * CTCU that is 128 bits long. Each trace ID is represented by one 
>>>> bit in that
>>>> + * filed.
>>>> + * e.g. ETR0ATID0 layout, set bit 5 for traceid 5
>>>> + *                                           bit5
>>>> + * ------------------------------------------------------
>>>> + * |   |28|   |24|   |20|   |16|   |12|   |8|  1|4|   |0|
>>>> + * ------------------------------------------------------
>>>> + *
>>>> + * e.g. ETR0:
>>>> + * 127                     0 from ATID_offset for ETR0ATID0
>>>> + * -------------------------
>>>> + * |ATID3|ATID2|ATID1|ATID0|
>>>> + */
>>>> +#define CTCU_ATID_REG_OFFSET(traceid, atid_offset) \
>>>> +        ((traceid / 32) * 4 + atid_offset)
>>>> +
>>>> +#define CTCU_ATID_REG_BIT(traceid)    (traceid % 32)
>>>> +#define CTCU_ATID_REG_SIZE        0x10
>>>> +
>>>> +struct ctcu_atid_config {
>>>> +    const u32 atid_offset;
>>>> +    const u32 port_num;
>>>> +};
>>>> +
>>>> +struct ctcu_config {
>>>> +    const struct ctcu_atid_config *atid_config;
>>>> +    int num_atid_config;
>>>> +};
>>>> +
>>>> +static const struct ctcu_atid_config sa8775p_atid_cfgs[] = {
>>>> +    {0xf8,  0},
>>>> +    {0x108, 1},
>>>> +};
>>>> +
>>>> +static const struct ctcu_config sa8775p_cfgs = {
>>>> +    .atid_config        = sa8775p_atid_cfgs,
>>>> +    .num_atid_config    = ARRAY_SIZE(sa8775p_atid_cfgs),
>>>> +};
>>>> +
>>>> +static void ctcu_program_atid_register(struct ctcu_drvdata 
>>>> *drvdata, u32 reg_offset,
>>>> +                       u8 bit, bool enable)
>>>> +{
>>>> +    u32 val;
>>>> +
>>>> +    CS_UNLOCK(drvdata->base);
>>>> +    val = ctcu_readl(drvdata, reg_offset);
>>>> +    val = enable? (val | BIT(bit)) : (val & ~BIT(bit));
>>>
>>> minor nit: If possible do not use the ternary operator like this. It 
>>> is much better readable as:
>>>
>>>      if (enable)
>>>          val |= BIT(bit);
>>>      else
>>>          val &= ~BIT(bit);
>>>
>>
>> Will do this way.
>>
>>>> +    ctcu_writel(drvdata, val, reg_offset);
>>>> +    CS_LOCK(drvdata->base);
>>>> +}
>>>> +
>>>> +/*
>>>> + * __ctcu_set_etr_traceid: Set bit in the ATID register based on 
>>>> trace ID when enable is true.
>>>> + * Reset the bit of the ATID register based on trace ID when enable 
>>>> is false.
>>>> + *
>>>> + * @csdev:    coresight_device struct related to the device
>>>> + * @traceid:    trace ID of the source tracer.
>>>> + * @port_num:    port number from TMC ETR sink.
>>>> + * @enable:    True for set bit and false for reset bit.
>>>> + *
>>>> + * Returns 0 indicates success. Non-zero result means failure.
>>>> + */
>>>> +static int __ctcu_set_etr_traceid(struct coresight_device *csdev, 
>>>> u8 traceid, int port_num,
>>>> +                  bool enable)
>>>> +{
>>>> +    struct ctcu_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
>>>> +    u32 atid_offset, reg_offset;
>>>> +    u8 refcnt, bit;
>>>> +
>>>> +    atid_offset = drvdata->atid_offset[port_num];
>>>> +    if (atid_offset == 0)
>>>> +        return -EINVAL;
>>>> +
>>>> +    bit = CTCU_ATID_REG_BIT(traceid);
>>>> +    reg_offset = CTCU_ATID_REG_OFFSET(traceid, atid_offset);
>>>> +    if (reg_offset - atid_offset > CTCU_ATID_REG_SIZE)
>>>> +        return -EINVAL;
>>>> +
>>>> +    guard(raw_spinlock_irqsave)(&drvdata->spin_lock);
>>>> +    refcnt = drvdata->traceid_refcnt[port_num][traceid];
>>>> +    /* Only program the atid register when the refcnt value is 0 or 
>>>> 1 */
>>>
>>> A normal trace source won't be enabled more than once (e.g., ETM). 
>>> The only odd one out is the STM, which may be driven by multiple agents.
>>> So this refcounting looks necessary.
>>>
>>
>> Besides, for the TPDMs which shared the trace_id of the TPDA also need 
>> the refcnt. Consider we have TPDM1 and TPDM2 connected to the same 
>> TPDA device. Once we disable one of the TPDM without checking the 
>> refcnt, the filter function will be disabled for another TPDM.
>>
>>>> +    if (enable && (++refcnt == 1))
>>>> +        ctcu_program_atid_register(drvdata, reg_offset, bit, enable);
>>>> +    else if (!enable && (--refcnt == 0))
>>>> +        ctcu_program_atid_register(drvdata, reg_offset, bit, enable);
>>>
>>> minor nit:
>>>
>>>      if ((enable && !refcount++) ||
>>>          (!enable && --refcount))
>>>          ctcu_program_atid_register(drvdata, reg_offset, bit, enable);
>>>
>>>
>>
>> I did (enable && (++refcnt == 1)) just because I think we only need 
>> program the register when refcnt is equal to 1. We dont need reprogram 
>> the register with same value when refcnt greater than 1. So I think 
>> it's better for the performance?
> 
> The code above is similar to yours. It would "set" only for the first
> time, when
> 
> enable == 0, refcount == 0 now, but will be incremented to 1.
> 

Hi Suzuki,

Thanks for expalaination, got your point, just missed !refcnt++, plus 1 
after !refcnt.

Jie





