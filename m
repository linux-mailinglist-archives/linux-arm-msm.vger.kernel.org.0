Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0E2F27B05B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Sep 2020 16:55:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726504AbgI1OzF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Sep 2020 10:55:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:55462 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726500AbgI1OzE (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Sep 2020 10:55:04 -0400
Received: from oasis.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F03392083B;
        Mon, 28 Sep 2020 14:55:02 +0000 (UTC)
Date:   Mon, 28 Sep 2020 10:55:01 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Prasad Sodagudi <psodagud@codeaurora.org>
Cc:     mingo@redhat.com, keescook@chromium.org,
        saiprakash.ranjan@codeaurora.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, gregkh@linuxfoundation.org,
        anton@enomsg.org, arnd@arndb.de, catalin.marinas@arm.com,
        ccross@android.com, jbaron@akamai.com, jim.cromie@gmail.com,
        joe@perches.com, joel@joelfernandes.org
Subject: Re: [PATCH] tracing: Add register read and write tracing support
Message-ID: <20200928105501.7e29df65@oasis.local.home>
In-Reply-To: <1601253290-400618-2-git-send-email-psodagud@codeaurora.org>
References: <1601253290-400618-1-git-send-email-psodagud@codeaurora.org>
        <1601253290-400618-2-git-send-email-psodagud@codeaurora.org>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 27 Sep 2020 17:34:50 -0700
Prasad Sodagudi <psodagud@codeaurora.org> wrote:

> Add register read/write operations tracing support.
> ftrace events helps trace register read and write
> location details of memory mapped IO registers. Also
> add _no_log variants the writel_relaxed/readl_relaed
> APIs to avoid excessive logging for certain register
> operations.

As mentioned elsewhere, I don't see a reason for "nolog" variants if it
is just to avoid logging too much. You can easily filter on the
recording side.


> --- /dev/null
> +++ b/include/linux/iorw.h
> @@ -0,0 +1,20 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + *
> + */
> +#ifndef __LOG_IORW_H__
> +#define __LOG_IORW_H__
> +
> +#include <linux/types.h>
> +
> +#if IS_ENABLED(CONFIG_TRACE_RW)
> +void log_write_io(volatile void __iomem *addr);
> +void log_read_io(const volatile void __iomem *addr);

So basically, this is always doing a function call, even when tracing
is not enabled. You may want to turn this into a macro, and use the new
interface I'm about to push:

 See https://lore.kernel.org/r/20200925211206.423598568@goodmis.org

Although I'm about to push a v3 (found a config that breaks msr.h)

#if IS_ENABLED(CONFIG_TRACE_RW)
#include <linux/atomic.h>
#include <linux/tracepoint-defs.h>

DECLARE_TRACEPOINT(rwio_write);
DECLARE_TRACEPOINT(rwio_read);

void __log_write_io(volatile void __iomem *addr);
void __log_read_io(const volatile void __iomem *addr);

#define log_write_io(addr) \
	if (tracepoint_enabled(rwio_write)
		__log_write_io(addr)

#define log_read_io(addr) \
	if (tracepoint_enabled(rwio_read)
		__log_read_io(addr)


> +#else
> +static inline void log_write_io(volatile void __iomem *addr)
> +{ }
> +static inline void log_read_io(const volatile void __iomem *addr)
> +{ }
> +#endif /* CONFIG_TRACE_RW */
> +
> +#endif /* __LOG_IORW_H__  */
> diff --git a/include/trace/events/rwio.h b/include/trace/events/rwio.h
> new file mode 100644
> index 0000000..b829629
> --- /dev/null
> +++ b/include/trace/events/rwio.h
> @@ -0,0 +1,51 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#undef TRACE_SYSTEM
> +#define TRACE_SYSTEM rwio
> +
> +#if !defined(_TRACE_RWIO_H) || defined(TRACE_HEADER_MULTI_READ)
> +#define _TRACE_RWIO_H
> +
> +#include <linux/tracepoint.h>
> +
> +TRACE_EVENT(raw_write,

"raw" is too generic. Call this rwio_write.

> +
> +	TP_PROTO(unsigned long fn, volatile void __iomem *addr),
> +
> +	TP_ARGS(fn, addr),
> +
> +	TP_STRUCT__entry(
> +		__field(u64, fn)
> +		__field(u64, addr)
> +	),
> +
> +	TP_fast_assign(
> +		__entry->fn = fn;
> +		__entry->addr = (u64)addr;
> +	),
> +
> +	TP_printk("%pS write addr=%p\n", __entry->fn, __entry->addr)
> +);
> +
> +TRACE_EVENT(raw_read,

And this "rwio_read"

-- Steve

> +
> +	TP_PROTO(unsigned long fn, const volatile void __iomem *addr),
> +
> +	TP_ARGS(fn, addr),
> +
> +	TP_STRUCT__entry(
> +		__field(u64, fn)
> +		__field(u64, addr)
> +	),
> +
> +	TP_fast_assign(
> +		__entry->fn = fn;
> +		__entry->addr = (u64)addr;
> +	),
> +
> +	TP_printk("%pS read addr=%p\n", __entry->fn, __entry->addr)
> +);
> +
> +#endif /* _TRACE_PREEMPTIRQ_H */
> +
