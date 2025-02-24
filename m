Return-Path: <linux-arm-msm+bounces-49151-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7357A41AC7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 11:22:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0CF287A22A7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 10:21:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5F432441A3;
	Mon, 24 Feb 2025 10:22:36 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F4AB24BBF8;
	Mon, 24 Feb 2025 10:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740392556; cv=none; b=VxDmUPXgO4iHjfmwQNuJmVpdPxtLuHiXv+WF7ljXUQzorXGOoqSaUqOlcz2VbSgMfg+8TIwYpH4NBDJjBm2IUSwau5WlUuvIrBQncRsJwtfnY2jPWClN6Ac37BFsxXlPApdWtBIe9mN6k3FdLQnB0BvmMp2/dLPhLIYj6b5XOwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740392556; c=relaxed/simple;
	bh=b1nkShEdJHWgRZo3HKZY/hm1IBId73Fq9MJCqFbRPJk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rgL/D+72MyM64KKPuyT63R33g/Xou12MQ6XNxS2mSDvo44Zh2Tlcuzo6morgqlaZ7TQuvYtw+1EP8gCHhYURqVXRWUxyOfSGNLVO2VWcRqyTDJZ3AGjLZwAOs59e7v73JojzOWqex2n6PMhEfk/rljFTQXQXFPPPoDWnAWSCkPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8D82A1E7D;
	Mon, 24 Feb 2025 02:22:50 -0800 (PST)
Received: from [10.57.36.38] (unknown [10.57.36.38])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 111C63F673;
	Mon, 24 Feb 2025 02:22:30 -0800 (PST)
Message-ID: <c274175a-ed6d-4ce9-be86-d48f56cafe9d@arm.com>
Date: Mon, 24 Feb 2025 10:22:30 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 6/7] Coresight: Add Coresight TMC Control Unit driver
Content-Language: en-GB
To: Jie Gan <quic_jiegan@quicinc.com>, Mike Leach <mike.leach@linaro.org>,
 James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Tingwei Zhang <quic_tingweiz@quicinc.com>,
 Jinlong Mao <quic_jinlmao@quicinc.com>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20250217093024.1133096-1-quic_jiegan@quicinc.com>
 <20250217093024.1133096-7-quic_jiegan@quicinc.com>
 <35d1a923-4e8e-4fe2-bf4a-0b78b1d511e3@arm.com>
 <a594bdee-7d9e-4d79-a5ee-a34dafa2869f@quicinc.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <a594bdee-7d9e-4d79-a5ee-a34dafa2869f@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 24/02/2025 03:32, Jie Gan wrote:
> 
> 
> On 2/21/2025 7:39 PM, Suzuki K Poulose wrote:
>> On 17/02/2025 09:30, Jie Gan wrote:
>>> The Coresight TMC Control Unit hosts miscellaneous configuration 
>>> registers
>>> which control various features related to TMC ETR sink.
>>>
>>> Based on the trace ID, which is programmed in the related CTCU ATID
>>> register of a specific ETR, trace data with that trace ID gets into
>>> the ETR buffer, while other trace data gets dropped.
>>>
>>> Enabling source device sets one bit of the ATID register based on
>>> source device's trace ID.
>>> Disabling source device resets the bit according to the source
>>> device's trace ID.
>>>
>>> Reviewed-by: James Clark <james.clark@linaro.org>
>>> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
>>> ---
>>>   drivers/hwtracing/coresight/Kconfig          |  12 +
>>>   drivers/hwtracing/coresight/Makefile         |   1 +
>>>   drivers/hwtracing/coresight/coresight-ctcu.c | 268 +++++++++++++++++++
>>>   drivers/hwtracing/coresight/coresight-ctcu.h |  24 ++
>>>   include/linux/coresight.h                    |   3 +-
>>>   5 files changed, 307 insertions(+), 1 deletion(-)
>>>   create mode 100644 drivers/hwtracing/coresight/coresight-ctcu.c
>>>   create mode 100644 drivers/hwtracing/coresight/coresight-ctcu.h
>>>
>>> diff --git a/drivers/hwtracing/coresight/Kconfig b/drivers/hwtracing/ 
>>> coresight/Kconfig
>>> index 06f0a7594169..ecd7086a5b83 100644
>>> --- a/drivers/hwtracing/coresight/Kconfig
>>> +++ b/drivers/hwtracing/coresight/Kconfig
>>> @@ -133,6 +133,18 @@ config CORESIGHT_STM
>>>         To compile this driver as a module, choose M here: the
>>>         module will be called coresight-stm.
>>> +config CORESIGHT_CTCU
>>> +    tristate "CoreSight TMC Control Unit driver"
>>> +    depends on CORESIGHT_LINK_AND_SINK_TMC
>>> +    help
>>> +      This driver provides support for CoreSight TMC Control Unit
>>> +      that hosts miscellaneous configuration registers. This is
>>> +      primarily used for controlling the behaviors of the TMC
>>> +      ETR device.
>>> +
>>> +      To compile this driver as a module, choose M here: the
>>> +      module will be called coresight-ctcu.
>>> +
>>>   config CORESIGHT_CPU_DEBUG
>>>       tristate "CoreSight CPU Debug driver"
>>>       depends on ARM || ARM64
>>> diff --git a/drivers/hwtracing/coresight/Makefile b/drivers/ 
>>> hwtracing/ coresight/Makefile
>>> index 4ba478211b31..1b7869910a12 100644
>>> --- a/drivers/hwtracing/coresight/Makefile
>>> +++ b/drivers/hwtracing/coresight/Makefile
>>> @@ -51,3 +51,4 @@ coresight-cti-y := coresight-cti-core.o coresight- 
>>> cti-platform.o \
>>>              coresight-cti-sysfs.o
>>>   obj-$(CONFIG_ULTRASOC_SMB) += ultrasoc-smb.o
>>>   obj-$(CONFIG_CORESIGHT_DUMMY) += coresight-dummy.o
>>> +obj-$(CONFIG_CORESIGHT_CTCU) += coresight-ctcu.o
>>> diff --git a/drivers/hwtracing/coresight/coresight-ctcu.c b/drivers/ 
>>> hwtracing/coresight/coresight-ctcu.c
>>> new file mode 100644
>>> index 000000000000..e1460a627c4d
>>> --- /dev/null
>>> +++ b/drivers/hwtracing/coresight/coresight-ctcu.c
>>> @@ -0,0 +1,268 @@
>>> +// SPDX-License-Identifier: GPL-2.0-only
>>> +/*
>>> + * Copyright (c) 2024-2025 Qualcomm Innovation Center, Inc. All 
>>> rights reserved.
>>> + */
>>> +
>>> +#include <linux/clk.h>
>>> +#include <linux/coresight.h>
>>> +#include <linux/device.h>
>>> +#include <linux/err.h>
>>> +#include <linux/kernel.h>
>>> +#include <linux/init.h>
>>> +#include <linux/io.h>
>>> +#include <linux/module.h>
>>> +#include <linux/mutex.h>
>>> +#include <linux/of.h>
>>> +#include <linux/platform_device.h>
>>> +#include <linux/slab.h>
>>> +
>>> +#include "coresight-ctcu.h"
>>> +#include "coresight-priv.h"
>>> +
>>> +DEFINE_CORESIGHT_DEVLIST(ctcu_devs, "ctcu");
>>> +
>>> +#define ctcu_writel(drvdata, val, offset)    __raw_writel((val), 
>>> drvdata->base + offset)
>>> +#define ctcu_readl(drvdata, offset)        __raw_readl(drvdata->base 
>>> + offset)
>>> +
>>> +/*
>>> + * The TMC Coresight Control Unit uses four ATID registers to 
>>> control the data
>>> + * filter function based on the trace ID for each TMC ETR sink. The 
>>> length of
>>> + * each ATID register is 32 bits. Therefore, the ETR has a related 
>>> field in
>>> + * CTCU that is 128 bits long. Each trace ID is represented by one 
>>> bit in that
>>> + * filed.
>>> + * e.g. ETR0ATID0 layout, set bit 5 for traceid 5
>>> + *                                           bit5
>>> + * ------------------------------------------------------
>>> + * |   |28|   |24|   |20|   |16|   |12|   |8|  1|4|   |0|
>>> + * ------------------------------------------------------
>>> + *
>>> + * e.g. ETR0:
>>> + * 127                     0 from ATID_offset for ETR0ATID0
>>> + * -------------------------
>>> + * |ATID3|ATID2|ATID1|ATID0|
>>> + */
>>> +#define CTCU_ATID_REG_OFFSET(traceid, atid_offset) \
>>> +        ((traceid / 32) * 4 + atid_offset)
>>> +
>>> +#define CTCU_ATID_REG_BIT(traceid)    (traceid % 32)
>>> +#define CTCU_ATID_REG_SIZE        0x10
>>> +
>>> +struct ctcu_atid_config {
>>> +    const u32 atid_offset;
>>> +    const u32 port_num;
>>> +};
>>> +
>>> +struct ctcu_config {
>>> +    const struct ctcu_atid_config *atid_config;
>>> +    int num_atid_config;
>>> +};
>>> +
>>> +static const struct ctcu_atid_config sa8775p_atid_cfgs[] = {
>>> +    {0xf8,  0},
>>> +    {0x108, 1},
>>> +};
>>> +
>>> +static const struct ctcu_config sa8775p_cfgs = {
>>> +    .atid_config        = sa8775p_atid_cfgs,
>>> +    .num_atid_config    = ARRAY_SIZE(sa8775p_atid_cfgs),
>>> +};
>>> +
>>> +static void ctcu_program_atid_register(struct ctcu_drvdata *drvdata, 
>>> u32 reg_offset,
>>> +                       u8 bit, bool enable)
>>> +{
>>> +    u32 val;
>>> +
>>> +    CS_UNLOCK(drvdata->base);
>>> +    val = ctcu_readl(drvdata, reg_offset);
>>> +    val = enable? (val | BIT(bit)) : (val & ~BIT(bit));
>>
>> minor nit: If possible do not use the ternary operator like this. It 
>> is much better readable as:
>>
>>      if (enable)
>>          val |= BIT(bit);
>>      else
>>          val &= ~BIT(bit);
>>
> 
> Will do this way.
> 
>>> +    ctcu_writel(drvdata, val, reg_offset);
>>> +    CS_LOCK(drvdata->base);
>>> +}
>>> +
>>> +/*
>>> + * __ctcu_set_etr_traceid: Set bit in the ATID register based on 
>>> trace ID when enable is true.
>>> + * Reset the bit of the ATID register based on trace ID when enable 
>>> is false.
>>> + *
>>> + * @csdev:    coresight_device struct related to the device
>>> + * @traceid:    trace ID of the source tracer.
>>> + * @port_num:    port number from TMC ETR sink.
>>> + * @enable:    True for set bit and false for reset bit.
>>> + *
>>> + * Returns 0 indicates success. Non-zero result means failure.
>>> + */
>>> +static int __ctcu_set_etr_traceid(struct coresight_device *csdev, u8 
>>> traceid, int port_num,
>>> +                  bool enable)
>>> +{
>>> +    struct ctcu_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
>>> +    u32 atid_offset, reg_offset;
>>> +    u8 refcnt, bit;
>>> +
>>> +    atid_offset = drvdata->atid_offset[port_num];
>>> +    if (atid_offset == 0)
>>> +        return -EINVAL;
>>> +
>>> +    bit = CTCU_ATID_REG_BIT(traceid);
>>> +    reg_offset = CTCU_ATID_REG_OFFSET(traceid, atid_offset);
>>> +    if (reg_offset - atid_offset > CTCU_ATID_REG_SIZE)
>>> +        return -EINVAL;
>>> +
>>> +    guard(raw_spinlock_irqsave)(&drvdata->spin_lock);
>>> +    refcnt = drvdata->traceid_refcnt[port_num][traceid];
>>> +    /* Only program the atid register when the refcnt value is 0 or 
>>> 1 */
>>
>> A normal trace source won't be enabled more than once (e.g., ETM). The 
>> only odd one out is the STM, which may be driven by multiple agents.
>> So this refcounting looks necessary.
>>
> 
> Besides, for the TPDMs which shared the trace_id of the TPDA also need 
> the refcnt. Consider we have TPDM1 and TPDM2 connected to the same TPDA 
> device. Once we disable one of the TPDM without checking the refcnt, the 
> filter function will be disabled for another TPDM.
> 
>>> +    if (enable && (++refcnt == 1))
>>> +        ctcu_program_atid_register(drvdata, reg_offset, bit, enable);
>>> +    else if (!enable && (--refcnt == 0))
>>> +        ctcu_program_atid_register(drvdata, reg_offset, bit, enable);
>>
>> minor nit:
>>
>>      if ((enable && !refcount++) ||
>>          (!enable && --refcount))
>>          ctcu_program_atid_register(drvdata, reg_offset, bit, enable);
>>
>>
> 
> I did (enable && (++refcnt == 1)) just because I think we only need 
> program the register when refcnt is equal to 1. We dont need reprogram 
> the register with same value when refcnt greater than 1. So I think it's 
> better for the performance?

The code above is similar to yours. It would "set" only for the first
time, when

enable == 0, refcount == 0 now, but will be incremented to 1.

Suzuki

