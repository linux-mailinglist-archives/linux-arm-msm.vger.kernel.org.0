Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92E0F490BC8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jan 2022 16:52:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240650AbiAQPv2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Jan 2022 10:51:28 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:60212 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237414AbiAQPv2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Jan 2022 10:51:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1642434688; x=1673970688;
  h=message-id:date:mime-version:subject:from:to:cc:
   references:in-reply-to:content-transfer-encoding;
  bh=Xu4Wa5A7HDAUzmX9TePf9+Nz8qiFjPhyBjM1nYof5Lo=;
  b=MVlDkst01fc6irOWdrMB11BxtrMOUn1sFPVeuUt01K4AhqoGXUtbWdk5
   ZPRbJ9LmtFgpSSve/zqtQwsKJLL9Kd4jYy1T8s6Ckyarz22V7k8ANkny9
   oMw3ELIoGB4wvhM4/sHNTn6ggxmYsPdnpbgKHGu4tm2fZibcJZc5Z/gG0
   o=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 17 Jan 2022 07:51:28 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2022 07:51:12 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Mon, 17 Jan 2022 07:51:11 -0800
Received: from [10.50.45.28] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Mon, 17 Jan
 2022 07:51:07 -0800
Message-ID: <9f648096-e694-7d4d-859b-ea173d5fb611@quicinc.com>
Date:   Mon, 17 Jan 2022 21:21:03 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [PATCHv8 4/5] lib: Add register read/write tracing support
Content-Language: en-US
From:   Sai Prakash Ranjan <quic_saipraka@quicinc.com>
To:     Steven Rostedt <rostedt@goodmis.org>
CC:     Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Marc Zyngier <maz@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        gregkh <gregkh@linuxfoundation.org>, <quic_psodagud@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>,
        Prasad Sodagudi <psodagud@codeaurora.org>
References: <cover.1642309054.git.quic_saipraka@quicinc.com>
 <8ad60797d6d8f40c3bdba20b1678fa9014bc1a20.1642309054.git.quic_saipraka@quicinc.com>
 <20220117100314.416a4d68@rorschach.local.home>
 <8bbe3552-cd47-c9d4-a296-ba446b7b2f45@quicinc.com>
In-Reply-To: <8bbe3552-cd47-c9d4-a296-ba446b7b2f45@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 1/17/2022 9:00 PM, Sai Prakash Ranjan wrote:
> Hi Steve,
>
> On 1/17/2022 8:33 PM, Steven Rostedt wrote:
>> On Mon, 17 Jan 2022 09:02:53 +0530
>> Sai Prakash Ranjan <quic_saipraka@quicinc.com> wrote:
>>
>>> diff --git a/include/trace/events/rwmmio.h 
>>> b/include/trace/events/rwmmio.h
>>> new file mode 100644
>>> index 000000000000..798fbe1ac9f9
>>> --- /dev/null
>>> +++ b/include/trace/events/rwmmio.h
>>> @@ -0,0 +1,112 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +/*
>>> + * Copyright (c) 2021-2022 Qualcomm Innovation Center, Inc. All 
>>> rights reserved.
>>> + */
>>> +#undef TRACE_SYSTEM
>>> +#define TRACE_SYSTEM rwmmio
>>> +
>>> +#if !defined(_TRACE_RWMMIO_H) || defined(TRACE_HEADER_MULTI_READ)
>>> +#define _TRACE_RWMMIO_H
>>> +
>>> +#include <linux/tracepoint.h>
>>> +
>>> +TRACE_EVENT(rwmmio_write,
>>> +
>>> +    TP_PROTO(unsigned long caller, u64 val, u8 width, volatile void 
>>> __iomem *addr),
>>> +
>>> +    TP_ARGS(caller, val, width, addr),
>>> +
>>> +    TP_STRUCT__entry(
>>> +        __field(u64, caller)
>>> +        __field(u64, val)
>>> +        __field(u64, addr)
>>> +        __field(u8, width)
>>> +    ),
>>> +
>>> +    TP_fast_assign(
>>> +        __entry->caller = caller;
>>> +        __entry->val = val;
>>> +        __entry->addr = (unsigned long)(void *)addr;
>>> +        __entry->width = width;
>>> +    ),
>>> +
>>> +    TP_printk("%pS width=%d val=%#llx addr=%#llx",
>>> +        (void *)(unsigned long)__entry->caller, __entry->width,
>>> +        __entry->val, __entry->addr)
>>> +);
>>> +
>>> +TRACE_EVENT(rwmmio_post_write,
>>> +
>>> +    TP_PROTO(unsigned long caller, u64 val, u8 width, volatile void 
>>> __iomem *addr),
>>> +
>>> +    TP_ARGS(caller, val, width, addr),
>>> +
>>> +    TP_STRUCT__entry(
>>> +        __field(u64, caller)
>>> +        __field(u64, val)
>>> +        __field(u64, addr)
>>> +        __field(u8, width)
>>> +    ),
>>> +
>>> +    TP_fast_assign(
>>> +        __entry->caller = caller;
>>> +        __entry->val = val;
>>> +        __entry->addr = (unsigned long)(void *)addr;
>>> +        __entry->width = width;
>>> +    ),
>>> +
>>> +    TP_printk("%pS width=%d val=%#llx addr=%#llx",
>>> +        (void *)(unsigned long)__entry->caller, __entry->width,
>>> +        __entry->val, __entry->addr)
>>> +);
>>> +
>>> +TRACE_EVENT(rwmmio_read,
>>> +
>>> +    TP_PROTO(unsigned long caller, u8 width, const volatile void 
>>> __iomem *addr),
>>> +
>>> +    TP_ARGS(caller, width, addr),
>>> +
>>> +    TP_STRUCT__entry(
>>> +        __field(u64, caller)
>>> +        __field(u64, addr)
>>> +        __field(u8, width)
>>> +    ),
>>> +
>>> +    TP_fast_assign(
>>> +        __entry->caller = caller;
>>> +        __entry->addr = (unsigned long)(void *)addr;
>>> +        __entry->width = width;
>>> +    ),
>>> +
>>> +    TP_printk("%pS width=%d addr=%#llx",
>>> +         (void *)(unsigned long)__entry->caller, __entry->width, 
>>> __entry->addr)
>>> +);
>>> +
>>> +TRACE_EVENT(rwmmio_post_read,
>>> +
>>> +    TP_PROTO(unsigned long caller, u64 val, u8 width, const 
>>> volatile void __iomem *addr),
>>> +
>>> +    TP_ARGS(caller, val, width, addr),
>>> +
>>> +    TP_STRUCT__entry(
>>> +        __field(u64, caller)
>>> +        __field(u64, val)
>>> +        __field(u64, addr)
>>> +        __field(u8, width)
>>> +    ),
>>> +
>>> +    TP_fast_assign(
>>> +        __entry->caller = caller;
>>> +        __entry->val = val;
>>> +        __entry->addr = (unsigned long)(void *)addr;
>>> +        __entry->width = width;
>>> +    ),
>>> +
>>> +    TP_printk("%pS width=%d val=%#llx addr=%#llx",
>>> +         (void *)(unsigned long)__entry->caller, __entry->width,
>>> +         __entry->val, __entry->addr)
>>> +);
>> The above should be replaced with:
>>
>> DECLARE_EVENT_CLASS(rwmmio_rw_template,
>>
>>     TP_PROTO(unsigned long caller, u64 val, u8 width, volatile void 
>> __iomem *addr),
>>
>>     TP_ARGS(caller, val, width, addr),
>>
>>     TP_STRUCT__entry(
>>         __field(u64, caller)
>>         __field(u64, val)
>>         __field(u64, addr)
>>         __field(u8, width)
>>     ),
>>
>>     TP_fast_assign(
>>         __entry->caller = caller;
>>         __entry->val = val;
>>         __entry->addr = (unsigned long)(void *)addr;
>>         __entry->width = width;
>>     ),
>>
>>     TP_printk("%pS width=%d val=%#llx addr=%#llx",
>>         (void *)(unsigned long)__entry->caller, __entry->width,
>>         __entry->val, __entry->addr)
>> );
>>
>> DEFINE_EVENT(rwmmio_rw_template, rwmmio_write,
>>     TP_PROTO(unsigned long caller, u64 val, u8 width, volatile void 
>> __iomem *addr),
>>     TP_ARGS(caller, val, width, addr)
>> );
>>
>> DEFINE_EVENT(rwmmio_rw_template, rwmmio_post_write,
>>     TP_PROTO(unsigned long caller, u64 val, u8 width, volatile void 
>> __iomem *addr),
>>     TP_ARGS(caller, val, width, addr)
>> );
>>
>> DEFINE_EVENT(rwmmio_rw_template, rwmmio_post_read,
>>     TP_PROTO(unsigned long caller, u64 val, u8 width, volatile void 
>> __iomem *addr),
>>     TP_ARGS(caller, val, width, addr)
>> );
>>
>> It will save around 15k in memory.
>>
>> And since rwmmio_read doesn't have a val field, it can stay a 
>> TRACE_EVENT.
>>
>> TRACE_EVENT(rwmmio_read,
>>
>>     TP_PROTO(unsigned long caller, u8 width, const volatile void 
>> __iomem *addr),
>>
>>     TP_ARGS(caller, width, addr),
>>
>>     TP_STRUCT__entry(
>>         __field(u64, caller)
>>         __field(u64, addr)
>>         __field(u8, width)
>>     ),
>>
>>     TP_fast_assign(
>>         __entry->caller = caller;
>>         __entry->addr = (unsigned long)(void *)addr;
>>         __entry->width = width;
>>     ),
>>
>>     TP_printk("%pS width=%d addr=%#llx",
>>          (void *)(unsigned long)__entry->caller, __entry->width, 
>> __entry->addr)
>> );
>>
>> -- Steve
>
> Thanks for the review, will add these changes in next version.
>
>

Just one note that I need to keep rwmmio_post_read also as TRACE_EVENT 
because
of const qualifier in post_read resulting in compiler warnings,

lib/trace_readwrite.c:43:50: warning: passing argument 4 of 
‘trace_rwmmio_post_read’ discards ‘const’ qualifier from pointer target 
type [-Wdiscarded-qualifiers]

Thanks,
Sai
>>> +
>>> +#endif /* _TRACE_RWMMIO_H */
>>> +
>>> +#include <trace/define_trace.h>
>>> diff --git a/lib/Kconfig b/lib/Kconfig
>>> index c80fde816a7e..ea520c315c0f 100644
>>> --- a/lib/Kconfig
>>> +++ b/lib/Kconfig
>>> @@ -119,6 +119,13 @@ config INDIRECT_IOMEM_FALLBACK
>>>         mmio accesses when the IO memory address is not a registered
>>>         emulated region.
>>>   +config TRACE_MMIO_ACCESS
>>> +    bool "Register read/write tracing"
>>> +    depends on TRACING && ARCH_HAVE_TRACE_MMIO_ACCESS
>>> +    help
>>> +      Create tracepoints for MMIO read/write operations. These 
>>> trace events
>>> +      can be used for logging all MMIO read/write operations.
>>> +
>>>   source "lib/crypto/Kconfig"
>>>     config CRC_CCITT
>>> diff --git a/lib/Makefile b/lib/Makefile
>>> index 300f569c626b..43813b0061cd 100644
>>> --- a/lib/Makefile
>>> +++ b/lib/Makefile
>>> @@ -152,6 +152,8 @@ lib-y += logic_pio.o
>>>     lib-$(CONFIG_INDIRECT_IOMEM) += logic_iomem.o
>>>   +obj-$(CONFIG_TRACE_MMIO_ACCESS) += trace_readwrite.o
>>> +
>>>   obj-$(CONFIG_GENERIC_HWEIGHT) += hweight.o
>>>     obj-$(CONFIG_BTREE) += btree.o
>>> diff --git a/lib/trace_readwrite.c b/lib/trace_readwrite.c
>>> new file mode 100644
>>> index 000000000000..88637038b30c
>>> --- /dev/null
>>> +++ b/lib/trace_readwrite.c
>>> @@ -0,0 +1,47 @@
>>> +// SPDX-License-Identifier: GPL-2.0-only
>>> +/*
>>> + * Register read and write tracepoints
>>> + *
>>> + * Copyright (c) 2021-2022 Qualcomm Innovation Center, Inc. All 
>>> rights reserved.
>>> + */
>>> +
>>> +#include <linux/ftrace.h>
>>> +#include <linux/module.h>
>>> +#include <asm-generic/io.h>
>>> +
>>> +#define CREATE_TRACE_POINTS
>>> +#include <trace/events/rwmmio.h>
>>> +
>>> +#ifdef CONFIG_TRACE_MMIO_ACCESS
>>> +void log_write_mmio(u64 val, u8 width, volatile void __iomem *addr,
>>> +            unsigned long caller_addr)
>>> +{
>>> +    trace_rwmmio_write(caller_addr, val, width, addr);
>>> +}
>>> +EXPORT_SYMBOL_GPL(log_write_mmio);
>>> +EXPORT_TRACEPOINT_SYMBOL_GPL(rwmmio_write);
>>> +
>>> +void log_post_write_mmio(u64 val, u8 width, volatile void __iomem 
>>> *addr,
>>> +             unsigned long caller_addr)
>>> +{
>>> +    trace_rwmmio_post_write(caller_addr, val, width, addr);
>>> +}
>>> +EXPORT_SYMBOL_GPL(log_post_write_mmio);
>>> +EXPORT_TRACEPOINT_SYMBOL_GPL(rwmmio_post_write);
>>> +
>>> +void log_read_mmio(u8 width, const volatile void __iomem *addr,
>>> +           unsigned long caller_addr)
>>> +{
>>> +    trace_rwmmio_read(caller_addr, width, addr);
>>> +}
>>> +EXPORT_SYMBOL_GPL(log_read_mmio);
>>> +EXPORT_TRACEPOINT_SYMBOL_GPL(rwmmio_read);
>>> +
>>> +void log_post_read_mmio(u64 val, u8 width, const volatile void 
>>> __iomem *addr,
>>> +            unsigned long caller_addr)
>>> +{
>>> +    trace_rwmmio_post_read(caller_addr, val, width, addr);
>>> +}
>>> +EXPORT_SYMBOL_GPL(log_post_read_mmio);
>>> +EXPORT_TRACEPOINT_SYMBOL_GPL(rwmmio_post_read);
>>> +#endif /* CONFIG_TRACE_MMIO_ACCESS */


