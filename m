Return-Path: <linux-arm-msm+bounces-508-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF217E8C57
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Nov 2023 20:37:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EC06A1C203AA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Nov 2023 19:37:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31D241CF9A;
	Sat, 11 Nov 2023 19:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9D01CA8D;
	Sat, 11 Nov 2023 19:37:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F77EC433C8;
	Sat, 11 Nov 2023 19:37:13 +0000 (UTC)
Date: Sat, 11 Nov 2023 14:37:10 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Krishna chaitanya chundru <quic_krichai@quicinc.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, <linux-kernel@vger.kernel.org>,
 <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
 <linux-trace-kernel@vger.kernel.org>, <quic_vbadigan@quicinc.com>,
 <quic_ramkri@quicinc.com>, <quic_nitegupt@quicinc.com>,
 <quic_skananth@quicinc.com>, <quic_parass@quicinc.com>
Subject: Re: [PATCH v4] bus: mhi: host: Add tracing support
Message-ID: <20231111143710.3474e05a@rorschach.local.home>
In-Reply-To: <20231111-ftrace_support-v4-1-c83602399461@quicinc.com>
References: <20231111-ftrace_support-v4-1-c83602399461@quicinc.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 11 Nov 2023 11:25:22 +0530
Krishna chaitanya chundru <quic_krichai@quicinc.com> wrote:
> diff --git a/drivers/bus/mhi/host/trace.h b/drivers/bus/mhi/host/trace.h
> new file mode 100644
> index 000000000000..0e99318f5d08
> --- /dev/null
> +++ b/drivers/bus/mhi/host/trace.h
> +
> +TRACE_EVENT(mhi_update_channel_state_start,
> +
> +	TP_PROTO(const char *name, int ch_num, int state),
> +
> +	TP_ARGS(name, ch_num, state),
> +
> +	TP_STRUCT__entry(
> +		__string(name, name)
> +		__field(int, ch_num)
> +		__field(int, state)
> +	),
> +
> +	TP_fast_assign(
> +		__assign_str(name, name);
> +		__entry->ch_num = ch_num;
> +		__entry->state = state;
> +	),
> +
> +	TP_printk("%s: ch%d: Updating state to: %s\n",
> +		  __get_str(name), __entry->ch_num,
> +		  TO_CH_STATE_TYPE_STR(__entry->state))
> +);
> +
> +TRACE_EVENT(mhi_update_channel_state_end,
> +
> +	TP_PROTO(const char *name, int ch_num, int state),
> +
> +	TP_ARGS(name, ch_num, state),
> +
> +	TP_STRUCT__entry(
> +		__string(name, name)
> +		__field(int, ch_num)
> +		__field(int, state)
> +	),
> +
> +	TP_fast_assign(
> +		__assign_str(name, name);
> +		__entry->ch_num = ch_num;
> +		__entry->state = state;
> +	),
> +
> +	TP_printk("%s: ch%d: Updated state to: %s\n",
> +		  __get_str(name), __entry->ch_num,
> +		  TO_CH_STATE_TYPE_STR(__entry->state))
> +);
> +

The above three events have the same format. You can save kilobytes of
memory by converting them into a DECLARE_EVENT_CLASS() and use
DEFINE_EVENT() for each event.

A TRACE_EVENT() macro is really just a wrapper around
DECLARE_EVENT_CLASS() and DEFINE_EVENT(). The DECLARE_EVENT_CLASS()
does the bulk of the work and adds the most memory footprint. By
breaking it apart for several events, it does save memory.

Whenever you can use a single DECLARE_EVENT_CLASS() for multiple
events, I strongly suggest doing so.

Thanks,

-- Steve


> +#endif
> +#undef TRACE_INCLUDE_PATH
> +#define TRACE_INCLUDE_PATH .
> +#undef TRACE_INCLUDE_FILE
> +#define TRACE_INCLUDE_FILE trace
> +
> +#include <trace/define_trace.h>
> 
> ---
> base-commit: 3006adf3be79cde4d14b1800b963b82b6e5572e0
> change-id: 20231005-ftrace_support-6869d4156139
> 
> Best regards,


