Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8880644AF3D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Nov 2021 15:12:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236854AbhKIOP2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Nov 2021 09:15:28 -0500
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:18027 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231169AbhKIOPZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Nov 2021 09:15:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1636467159; x=1668003159;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=JkI/y9JuBpAiKQPsRnt22jDEDVpaoyvjrRNwSo020qs=;
  b=OEgQrXTxONemovrP+LeuXt+YafcD1ZbPdJKMjDqXgut653JosQLNt+tE
   rSOX2ZKfOj6wZI/S0gARa2ieu8ub0Bb2xt6vL/k+A3hzT3J9VYcHK8Et6
   QYjE6X5CB2CubUN9w0vQPAxMf0aSYv5ki/A7TTTeyMfMDMHg2s0USa6zl
   Y=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 09 Nov 2021 06:12:39 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2021 06:12:38 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Tue, 9 Nov 2021 06:12:38 -0800
Received: from [10.50.19.148] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7; Tue, 9 Nov 2021
 06:12:32 -0800
Message-ID: <90505edb-3569-aa6b-68e6-1de9972cce47@quicinc.com>
Date:   Tue, 9 Nov 2021 19:42:27 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [PATCHv3 1/3] tracing: Add register read/write tracing support
Content-Language: en-US
To:     Steven Rostedt <rostedt@goodmis.org>
CC:     Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        <quic_psodagud@quicinc.com>, Marc Zyngier <maz@kernel.org>,
        <gregkh@linuxfoundation.org>, <arnd@arndb.de>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <mingo@redhat.com>, <jbaron@akamai.com>, <jim.cromie@gmail.com>,
        Prasad Sodagudi <psodagud@codeaurora.org>
References: <cover.1636452784.git.quic_saipraka@quicinc.com>
 <d127fdaf198f5766ffe021430cf848e64b4fdf84.1636452784.git.quic_saipraka@quicinc.com>
 <20211109085410.349edffa@gandalf.local.home>
From:   Sai Prakash Ranjan <quic_saipraka@quicinc.com>
In-Reply-To: <20211109085410.349edffa@gandalf.local.home>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Steve,

On 11/9/2021 7:24 PM, Steven Rostedt wrote:
> On Tue, 9 Nov 2021 17:38:19 +0530
> Sai Prakash Ranjan <quic_saipraka@quicinc.com> wrote:
>
>> From: Prasad Sodagudi <psodagud@codeaurora.org>
>>
>> Generic MMIO read/write i.e., __raw_{read,write}{b,l,w,q} accessors
>> are typically used to read/write from/to memory mapped registers
>> and can cause hangs or some undefined behaviour in following few
>> cases,
>>
>> * If the access to the register space is unclocked, for example: if
>>    there is an access to multimedia(MM) block registers without MM
>>    clocks.
>>
>> * If the register space is protected and not set to be accessible from
>>    non-secure world, for example: only EL3 (EL: Exception level) access
>>    is allowed and any EL2/EL1 access is forbidden.
>>
>> * If xPU(memory/register protection units) is controlling access to
>>    certain memory/register space for specific clients.
>>
>> and more...
>>
>> Such cases usually results in instant reboot/SErrors/NOC or interconnect
>> hangs and tracing these register accesses can be very helpful to debug
>> such issues during initial development stages and also in later stages.
>>
>> So use ftrace trace events to log such MMIO register accesses which
>> provides rich feature set such as early enablement of trace events,
>> filtering capability, dumping ftrace logs on console and many more.
>>
>> Sample output:
>>
>> rwmmio_read: gic_peek_irq+0xd0/0xd8 readl addr=0xffff800010040104
>> rwmmio_write: gic_poke_irq+0xe4/0xf0 writel addr=0xffff800010040184 val=0x40
>> rwmmio_read: gic_do_wait_for_rwp+0x54/0x90 readl addr=0xffff800010040000
>> rwmmio_write: gic_set_affinity+0x1bc/0x1e8 writeq addr=0xffff800010046130 val=0x500
>>
>> Signed-off-by: Prasad Sodagudi <psodagud@codeaurora.org>
>> [saiprakash: Rewrote commit msg and trace event field edits]
>> Signed-off-by: Sai Prakash Ranjan <quic_saipraka@quicinc.com>
>> ---
>>   include/trace/events/rwmmio.h  | 61 ++++++++++++++++++++++++++++++++++
>>   kernel/trace/Kconfig           |  7 ++++
>>   kernel/trace/Makefile          |  1 +
>>   kernel/trace/trace_readwrite.c | 28 ++++++++++++++++
>>   4 files changed, 97 insertions(+)
>>   create mode 100644 include/trace/events/rwmmio.h
>>   create mode 100644 kernel/trace/trace_readwrite.c
>>
>> diff --git a/include/trace/events/rwmmio.h b/include/trace/events/rwmmio.h
>> new file mode 100644
>> index 000000000000..cb5261a559f8
>> --- /dev/null
>> +++ b/include/trace/events/rwmmio.h
>> @@ -0,0 +1,61 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (c) 2021 Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +#undef TRACE_SYSTEM
>> +#define TRACE_SYSTEM rwmmio
>> +
>> +#if !defined(_TRACE_MMIO_H) || defined(TRACE_HEADER_MULTI_READ)
>> +#define _TRACE_MMIO_H
>> +
>> +#include <linux/tracepoint.h>
>> +
>> +TRACE_EVENT(rwmmio_write,
>> +
>> +	TP_PROTO(unsigned long fn, const char *width, u64 val, volatile void __iomem *addr),
>> +
>> +	TP_ARGS(fn, width, val, addr),
>> +
>> +	TP_STRUCT__entry(
>> +		__field(u64, fn)
>> +		__string(width, width)
>> +		__field(u64, val)
>> +		__field(u64, addr)
> For better space usage, move the __string to the end. Each of the u64
> fields will take up 8 bytes, and the __string only takes up 4 (it's a 2
> byte offset and 2 byte length, where the actual string lies at the end of
> the event). Many archs will leave a 4 byte "hole" between the __string()
> field and the u64 val field. If __string is at the end, it will go nicely
> with the actual string that will be appended behind it.

Thanks for the informative suggestion, will make the change for the next 
version.


>> +	),
>> +
>> +	TP_fast_assign(
>> +		__entry->fn = fn;
>> +		__assign_str(width, width);
>> +		__entry->val = val;
>> +		__entry->addr = (u64)addr;
>> +	),
>> +
>> +	TP_printk("%pS %s addr=%#llx val=%#llx",
>> +		(void *)__entry->fn, __get_str(width), __entry->addr, __entry->val)
>> +);
>> +
>> +TRACE_EVENT(rwmmio_read,
>> +
>> +	TP_PROTO(unsigned long fn, const char *width, const volatile void __iomem *addr),
>> +
>> +	TP_ARGS(fn, width, addr),
>> +
>> +	TP_STRUCT__entry(
>> +		__field(u64, fn)
>> +		__string(width, width)
>> +		__field(u64, addr)
> Same here.

Sure, will make the change.


>> +	),
>> +
>> +	TP_fast_assign(
>> +		__entry->fn = fn;
>> +		__assign_str(width, width);
>> +		__entry->addr = (u64)addr;
>> +	),
>> +
>> +	TP_printk("%pS %s addr=%#llx",
>> +		 (void *)__entry->fn, __get_str(width), __entry->addr)
>> +);
>> +
> -- Steve

Thanks,

Sai

