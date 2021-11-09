Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFF5C44AF12
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Nov 2021 14:54:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235997AbhKIN5A (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Nov 2021 08:57:00 -0500
Received: from mail.kernel.org ([198.145.29.99]:47456 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235963AbhKIN47 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Nov 2021 08:56:59 -0500
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6F175610A2;
        Tue,  9 Nov 2021 13:54:12 +0000 (UTC)
Date:   Tue, 9 Nov 2021 08:54:10 -0500
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Sai Prakash Ranjan <quic_saipraka@quicinc.com>
Cc:     Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        <quic_psodagud@quicinc.com>, Marc Zyngier <maz@kernel.org>,
        <gregkh@linuxfoundation.org>, <arnd@arndb.de>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <mingo@redhat.com>, <jbaron@akamai.com>, <jim.cromie@gmail.com>,
        "Prasad Sodagudi" <psodagud@codeaurora.org>
Subject: Re: [PATCHv3 1/3] tracing: Add register read/write tracing support
Message-ID: <20211109085410.349edffa@gandalf.local.home>
In-Reply-To: <d127fdaf198f5766ffe021430cf848e64b4fdf84.1636452784.git.quic_saipraka@quicinc.com>
References: <cover.1636452784.git.quic_saipraka@quicinc.com>
        <d127fdaf198f5766ffe021430cf848e64b4fdf84.1636452784.git.quic_saipraka@quicinc.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 9 Nov 2021 17:38:19 +0530
Sai Prakash Ranjan <quic_saipraka@quicinc.com> wrote:

> From: Prasad Sodagudi <psodagud@codeaurora.org>
> 
> Generic MMIO read/write i.e., __raw_{read,write}{b,l,w,q} accessors
> are typically used to read/write from/to memory mapped registers
> and can cause hangs or some undefined behaviour in following few
> cases,
> 
> * If the access to the register space is unclocked, for example: if
>   there is an access to multimedia(MM) block registers without MM
>   clocks.
> 
> * If the register space is protected and not set to be accessible from
>   non-secure world, for example: only EL3 (EL: Exception level) access
>   is allowed and any EL2/EL1 access is forbidden.
> 
> * If xPU(memory/register protection units) is controlling access to
>   certain memory/register space for specific clients.
> 
> and more...
> 
> Such cases usually results in instant reboot/SErrors/NOC or interconnect
> hangs and tracing these register accesses can be very helpful to debug
> such issues during initial development stages and also in later stages.
> 
> So use ftrace trace events to log such MMIO register accesses which
> provides rich feature set such as early enablement of trace events,
> filtering capability, dumping ftrace logs on console and many more.
> 
> Sample output:
> 
> rwmmio_read: gic_peek_irq+0xd0/0xd8 readl addr=0xffff800010040104
> rwmmio_write: gic_poke_irq+0xe4/0xf0 writel addr=0xffff800010040184 val=0x40
> rwmmio_read: gic_do_wait_for_rwp+0x54/0x90 readl addr=0xffff800010040000
> rwmmio_write: gic_set_affinity+0x1bc/0x1e8 writeq addr=0xffff800010046130 val=0x500
> 
> Signed-off-by: Prasad Sodagudi <psodagud@codeaurora.org>
> [saiprakash: Rewrote commit msg and trace event field edits]
> Signed-off-by: Sai Prakash Ranjan <quic_saipraka@quicinc.com>
> ---
>  include/trace/events/rwmmio.h  | 61 ++++++++++++++++++++++++++++++++++
>  kernel/trace/Kconfig           |  7 ++++
>  kernel/trace/Makefile          |  1 +
>  kernel/trace/trace_readwrite.c | 28 ++++++++++++++++
>  4 files changed, 97 insertions(+)
>  create mode 100644 include/trace/events/rwmmio.h
>  create mode 100644 kernel/trace/trace_readwrite.c
> 
> diff --git a/include/trace/events/rwmmio.h b/include/trace/events/rwmmio.h
> new file mode 100644
> index 000000000000..cb5261a559f8
> --- /dev/null
> +++ b/include/trace/events/rwmmio.h
> @@ -0,0 +1,61 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2021 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +#undef TRACE_SYSTEM
> +#define TRACE_SYSTEM rwmmio
> +
> +#if !defined(_TRACE_MMIO_H) || defined(TRACE_HEADER_MULTI_READ)
> +#define _TRACE_MMIO_H
> +
> +#include <linux/tracepoint.h>
> +
> +TRACE_EVENT(rwmmio_write,
> +
> +	TP_PROTO(unsigned long fn, const char *width, u64 val, volatile void __iomem *addr),
> +
> +	TP_ARGS(fn, width, val, addr),
> +
> +	TP_STRUCT__entry(
> +		__field(u64, fn)
> +		__string(width, width)
> +		__field(u64, val)
> +		__field(u64, addr)

For better space usage, move the __string to the end. Each of the u64
fields will take up 8 bytes, and the __string only takes up 4 (it's a 2
byte offset and 2 byte length, where the actual string lies at the end of
the event). Many archs will leave a 4 byte "hole" between the __string()
field and the u64 val field. If __string is at the end, it will go nicely
with the actual string that will be appended behind it.

> +	),
> +
> +	TP_fast_assign(
> +		__entry->fn = fn;
> +		__assign_str(width, width);
> +		__entry->val = val;
> +		__entry->addr = (u64)addr;
> +	),
> +
> +	TP_printk("%pS %s addr=%#llx val=%#llx",
> +		(void *)__entry->fn, __get_str(width), __entry->addr, __entry->val)
> +);
> +
> +TRACE_EVENT(rwmmio_read,
> +
> +	TP_PROTO(unsigned long fn, const char *width, const volatile void __iomem *addr),
> +
> +	TP_ARGS(fn, width, addr),
> +
> +	TP_STRUCT__entry(
> +		__field(u64, fn)
> +		__string(width, width)
> +		__field(u64, addr)

Same here.

> +	),
> +
> +	TP_fast_assign(
> +		__entry->fn = fn;
> +		__assign_str(width, width);
> +		__entry->addr = (u64)addr;
> +	),
> +
> +	TP_printk("%pS %s addr=%#llx",
> +		 (void *)__entry->fn, __get_str(width), __entry->addr)
> +);
> +

-- Steve
