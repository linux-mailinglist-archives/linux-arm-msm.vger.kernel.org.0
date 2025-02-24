Return-Path: <linux-arm-msm+bounces-49139-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11CDFA41998
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 10:53:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BC3BC7A53C3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 09:52:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0DEB245034;
	Mon, 24 Feb 2025 09:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ErdhuaEI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76C9243947
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Feb 2025 09:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740390803; cv=none; b=CxEjC+8OO5ypWrAo8cGPkpPVT36OglS2r1WNIHCgMKcWF37I//WEg4YiKlq9wWLW3nfbYV5IIpGx4JAKHUWHBv456K+2SOpT4lJ+Gnl2EKak9JTuN6VnlgDecRob0YMmkKEn1rLzKzBBNlTnXD2LqVKhymtQaaSymb4e2fU0D5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740390803; c=relaxed/simple;
	bh=xlIOfmVsx5O4auuKSRWnf7dtxQr88x14F45VvU4uJo8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rdBi4bAygIJrVtXN5j5I+fkiGVCcuFkhfJ7/WC+HcLa3nFRIjKRA5wrjLhLP8ja0Sr/HzrM+S/lQPLtbGXuBIA8BRkilNl/5XnkpxTlsxb1np3KpDTxMDgb0haGCTCBnDAb80VBRvM+spW50gwxoJE1VMz50vpBDWeQzSt4FO20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ErdhuaEI; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-439a2780b44so25103665e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Feb 2025 01:53:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740390799; x=1740995599; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PoBELKKE+yECTK++b72BWsWgFI0aCLVRf2TRxH/cixI=;
        b=ErdhuaEIzLTIbGYk8nYs6rVnYYM1c/6wMVan6dozDOrM4TGlKkKLQIuVpdzUwuw6HK
         INtT1HO+TqOCBjmU5D1QZmXP3BI+GzwZD1U0U6fy+K/hS1Tsqm7BpSyLf9eRVAzy8sBv
         QjjqzkLj4QsBY6xDyCbUGXS3Hg1ZsALeRidvZrDj9yCF+mNJsUfPljqV/g49bAA6lG9m
         kGjUXkh44J31s1RTozvq1kUOVo2Xu0imTfyHnc6lSuFlAgiluguscdIo0vqS2LC/k4pc
         vGwILQWPanfFcfeQjSqfOivv+MpaF5E1E9wgJrC9tr3OrTSJAc5cEdQr4EeGU9TjXCYD
         eQfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740390799; x=1740995599;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PoBELKKE+yECTK++b72BWsWgFI0aCLVRf2TRxH/cixI=;
        b=qyK86dacRzzrHUpqIfHZd6oyhciEHH3VPadRWDEls9/9UOPmA0T3/Hu0xaibCNKtP1
         fTI+zcMpaSqgHFk/3OVQpJzU+6fOOMUa/48XAppOD/HDtjveqsXpyQf7N5iFFDAX6X/2
         0GC0RhecDmefgWrBVUvbK9O3XA/j2aC1uu2qkjHlc5f8H/B84ME5RnZUVq7uzcixfdQT
         +CZ/aN4XCqPbS2Xpaf2/M6hpcJ4IVAs/ITZQcq21jLHJdz4FdkUO2j8IXdUE3p+Y9dOA
         B+LcmZ+T2JwiXe1Wr0anwX2NFI+GbLd5xgoLqhQ3XKM2POD8xHPbS93D9YiBrnD/SvKb
         lNMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXopm/EJBywVYIo1O6zkzEJ25KTV03OIr6HZ9+TnGHPsL3+CpywA2TidmAsQl1bhGe9nbaJ7y+szuF008mM@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6vKjn/YNcd2xCe0nWl0F2JuArSEIfr3rn0xnTMSNLYgJBWeUR
	0pQN57hHC2PefNB8r1IhufbH1B9e/ime3T9msDTjrVmTJx4Bmecuhh4WxpJ44UU=
X-Gm-Gg: ASbGncsFU58mWvSUIr4xWeb3UuNuWwxI366jYUGfZIXyLnp5OuSr99TYnNoONzkg8Qh
	lc1wrSyfgwNkDUPEa21cxpSCnjjFj0EBEYlrvTzB+Ws/BEnyJEHzcUzqW0yA6UmQf9rFTKjetaQ
	RnS/GUtAe+1XdEEx3JTARPW/2C5gcuDZu6TBCyB7taO4udVTYZ5xNmTY+xGOmdYmNvuRh3rxayf
	fm7BcpVxHZBJ/EufU3OLXa2lUw7nfjNndGytW7tTBpojy0+pI9WPi6VQ8ZmB306PnpH+dNM86zT
	aDpkuoJQ4iijlr8AlR/ElGHgKF/mdYVPk3sG
X-Google-Smtp-Source: AGHT+IH69+CyKK8E2xVQeIZRb1cBUYBGNIMPFy29sJHEqbtta0YCE3tbtJ7P1KVtoT+LfEsIBnerVg==
X-Received: by 2002:adf:f74b:0:b0:38f:3791:c1d3 with SMTP id ffacd0b85a97d-38f6f0db7dbmr8697362f8f.54.1740390799001;
        Mon, 24 Feb 2025 01:53:19 -0800 (PST)
Received: from [192.168.68.163] ([145.224.66.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439b0371cfcsm99715125e9.36.2025.02.24.01.53.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Feb 2025 01:53:18 -0800 (PST)
Message-ID: <37cb0da5-fcca-41e0-95d8-280fd95541c9@linaro.org>
Date: Mon, 24 Feb 2025 09:53:16 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 6/7] Coresight: Add Coresight TMC Control Unit driver
To: Jie Gan <quic_jiegan@quicinc.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Tingwei Zhang <quic_tingweiz@quicinc.com>,
 Jinlong Mao <quic_jinlmao@quicinc.com>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Mike Leach
 <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
References: <20250217093024.1133096-1-quic_jiegan@quicinc.com>
 <20250217093024.1133096-7-quic_jiegan@quicinc.com>
 <35d1a923-4e8e-4fe2-bf4a-0b78b1d511e3@arm.com>
 <a594bdee-7d9e-4d79-a5ee-a34dafa2869f@quicinc.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <a594bdee-7d9e-4d79-a5ee-a34dafa2869f@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 24/02/2025 3:32 am, Jie Gan wrote:
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
> 
>> Also, see my comment the bottom for "refcount" being u8 .
> 
> Sure, will check.
> 
>>
>>
>>> +
>>> +    drvdata->traceid_refcnt[port_num][traceid] = refcnt;
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static int ctcu_get_active_port(struct coresight_device *sink, 
>>> struct coresight_device *helper)
>>> +{
>>> +    int i;
>>> +
>>> +    for (i = 0; i < sink->pdata->nr_outconns; ++i) {
>>> +        if (sink->pdata->out_conns[i]->dest_dev)
>>> +            return sink->pdata->out_conns[i]->dest_port;
>>
>> Don't we need to make sure it matches the helper ? What if there are 
>> multiple helpers ? e.g, a CATU connected to the ETR and CTCU ?
>> Or even try the opposite ? i.e. search the helper and find the port
>> matching the sink ?

Good catch, looks like this should be done the opposite way around.

>>
>>      struct coresight_platform_data *pdata = helper->pdata;
>>
>>      for (i = 0; i < pdata->nr_inconns; ++i)
>>          if (pdata->in_conns[i]->dest_dev == sink)
>>              return pdata->in_conns[i]->src_port;
>>
>> Not sure if that works with the helper device connection, James ?

Yeah connections are always made in both directions.

> Can we check the subtype of the helper device? We should only have one 
> CTCU helper device for each ETR.
> 
> enum coresight_dev_subtype_helper subtype;
> 
> for (i = 0; i < sink->pdata->nr_outconns; ++i) {
>      subtype = sink->pdata->out_conns[i]->dest_dev->subtype.helper_subtype;
>      if (subtype == CORESIGHT_DEV_SUBTYPE_HELPER_CTCU)
>         return sink->pdata->out_conns[i]->dest_port;
> 

I don't think we need to check the type, just search all the CTCU's 
in_conns until you find the sink.

As Suzuki says, by looking at the out_conns of the sink you might find a 
different helper device. Checking that it really is connected to the 
sink is probably more robust that relying on the type anyway.



