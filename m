Return-Path: <linux-arm-msm+bounces-117548-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 809uF4cDTmqhBgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117548-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 10:00:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A513722E22
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 10:00:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=cogbiAXK;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117548-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117548-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 75C9C3001A7C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 08:00:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC67C3FA5E8;
	Wed,  8 Jul 2026 08:00:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1853ADBA3;
	Wed,  8 Jul 2026 07:59:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783497598; cv=none; b=k21I97TieLrPORUK+B+YpG7s+xeJEI1vVo0eSF8frfqboD1RfFTd4nikGIeg1TpB9h0fz9dVxnoXPIh9Y70JOI7yTOZA4fuWp+U6pAcKPJpX93NhzOZ5v1AuzmhgYXeCl3V/VCf+E0iE6M1Mj6yjeZqBZgmG1Nx/Mz76SNgwEvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783497598; c=relaxed/simple;
	bh=VDsM4b/bVlZZcXhMITQ/pfQFYc8FtssAtd+E5BYl3ns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MMjjBr5nVcFb4+bOTzs2wXfy9gjxBbZd9oZVroDI+xwSkaVxJzYxG7PD3Ivnab7c97LcMpGBIdMj95yatAgzsk9BAxo1OCRZp8r31gYQWZ8E/lxex75LJLORpFsb6TUzooYXI0EKnG9PUHGI55W9TKaZwgWLRONAwvcM67Vosm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cogbiAXK; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F22611F000E9;
	Wed,  8 Jul 2026 07:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783497586;
	bh=8g8Ttn0kjFhoN2K8SOSf7rP1PCWBsxtWcEWwceV1Cm8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cogbiAXKmyAMp8pfFGMw1+XH+2/KFQZ2sirJm0MkZ25BfGjdi7K7UkK2mGaisfiBm
	 KuN5ega3YTdU78XA4W+ovM0uk40KtUwj1IQJmdwuQOvmh0MLUniAH2UDpAzGHUZg0P
	 u1fYmNoGSHOAUHdmYneYRgfT/AZFQBTayBEa9v7QKC/NjNK+mp6bmS9UuUV3dYDcI3
	 TkVvcloCp1L2SU5GfdNRvlOhdCjDCV2Q9JdhGctPFX1cA+y3HBjoNVMbHew/PGh6oC
	 sTKjkZqL/4xzF5SYpZ1Wl95LijL6ZH0gEp7MczaplLaen9JfL6pHR73TxoEo+KBbpn
	 Dl5SwOUOzgI6g==
Date: Wed, 8 Jul 2026 08:59:26 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Eugen Hristev <ehristev@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, 
	Christoph Lameter <cl@gentwo.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Thomas Gleixner <tglx@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>, 
	John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, Kees Cook <kees@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	David Hildenbrand <david@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Brendan Jackman <jackmanb@google.com>, Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, 
	Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, 
	Barry Song <baohua@kernel.org>, Youngjun Park <youngjun.park@lge.com>, 
	Petr Mladek <pmladek@suse.com>, John Ogness <john.ogness@linutronix.de>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-mm@kvack.org, linux-arm-msm@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 21/26] printk: Register information into meminspect
Message-ID: <ak4Cr5GEMdo8xWqu@lucifer>
References: <20260708-meminspect-v3-v3-0-7aa5a0a74d5c@oss.qualcomm.com>
 <20260708-meminspect-v3-v3-21-7aa5a0a74d5c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708-meminspect-v3-v3-21-7aa5a0a74d5c@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117548-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mukesh.ojha@oss.qualcomm.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:ehristev@kernel.org,m:arnd@arndb.de,m:dennis@kernel.org,m:tj@kernel.org,m:cl@gentwo.org,m:akpm@linux-foundation.org,m:tglx@kernel.org,m:peterz@infradead.org,m:anna-maria@linutronix.de,m:frederic@kernel.org,m:jstultz@google.com,m:sboyd@kernel.org,m:kees@kernel.org,m:mingo@redhat.com,m:juri.lelli@redhat.com,m:vincent.guittot@linaro.org,m:dietmar.eggemann@arm.com,m:rostedt@goodmis.org,m:bsegall@google.com,m:mgorman@suse.de,m:vschneid@redhat.com,m:kprateek.nayak@amd.com,m:david@kernel.org,m:liam@infradead.org,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:jackmanb@google.com,m:hannes@cmpxchg.org,m:ziy@nvidia.com,m:chrisl@kernel.org,m:kasong@tencent.com,m:shikemeng@huaweicloud.com,m:nphamcs@gmail.com,m:baoquan.he@linux.dev,m:baohua@kernel.org,m:youngjun.park@lge.com,m:pmladek@suse.com,m:john.ogness@linutronix.de,m:senozhatsky@chromium.org,m:andersson@kernel
 .org,m:mathieu.poirier@linaro.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:saravanak@kernel.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arch@vger.kernel.org,m:linux-mm@kvack.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ljs@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lwn.net,linuxfoundation.org,kernel.org,arndb.de,gentwo.org,linux-foundation.org,infradead.org,linutronix.de,google.com,redhat.com,linaro.org,arm.com,goodmis.org,suse.de,amd.com,suse.com,cmpxchg.org,nvidia.com,tencent.com,huaweicloud.com,gmail.com,linux.dev,lge.com,chromium.org,vger.kernel.org,kvack.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_GT_50(0.00)[59];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ljs@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,linutronix.de:email,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,lucifer:mid,suse.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5A513722E22

On Wed, Jul 08, 2026 at 11:02:00AM +0530, Mukesh Ojha wrote:
> Annotate vital static, dynamic information into meminspect for debugging
>
> Static:
>  - prb_descs
>  - prb_infos
>  - prb
>  - prb_data
>  - clear_seq
>  - printk_rb_static
>  - printk_rb_dynamic
>
> Dynamic:
>  - new_descs
>  - new_infos
>  - new_log_buf
>
> meminspect uses a different API to annotate variables for inspection,
> and information about these variables is stored in the inspection table.

This commit message is a mess again. You're writing what the code does, not why,
you mention separate API but not which or why.

It's useless basically, and it's weird to list arbitrary fields like this.

Always think 'what would be useful to reviewers and people coming back to this
patch in debug/development'.

If it just says what the code says it's useless. Put what's NOT there.

>
> Reviewed-by: Petr Mladek <pmladek@suse.com>
> Co-developed-by: Eugen Hristev <eugen.hristev@linaro.org>
> Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
> Reviewed-by: John Ogness <john.ogness@linutronix.de>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  kernel/printk/printk.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
> index 2fe9a963c823..f7f32c09b9b8 100644
> --- a/kernel/printk/printk.c
> +++ b/kernel/printk/printk.c
> @@ -49,6 +49,7 @@
>  #include <linux/sched/debug.h>
>  #include <linux/sched/task_stack.h>
>  #include <linux/panic.h>
> +#include <linux/meminspect.h>
>
>  #include <linux/uaccess.h>
>  #include <asm/sections.h>
> @@ -518,10 +519,17 @@ static u32 log_buf_len = __LOG_BUF_LEN;
>  #endif
>  _DEFINE_PRINTKRB(printk_rb_static, CONFIG_LOG_BUF_SHIFT - PRB_AVGBITS,
>  		 PRB_AVGBITS, &__log_buf[0]);
> +MEMINSPECT_NAMED_ENTRY(prb_descs, _printk_rb_static_descs);
> +MEMINSPECT_NAMED_ENTRY(prb_infos, _printk_rb_static_infos);
> +MEMINSPECT_NAMED_ENTRY(prb_data, __log_buf);
> +MEMINSPECT_SIMPLE_ENTRY(printk_rb_static);
>
>  static struct printk_ringbuffer printk_rb_dynamic;
> +MEMINSPECT_SIMPLE_ENTRY(printk_rb_dynamic);
>
>  struct printk_ringbuffer *prb = &printk_rb_static;
> +MEMINSPECT_SIMPLE_ENTRY(prb);
> +MEMINSPECT_SIMPLE_ENTRY(clear_seq);
>
>  /*
>   * We cannot access per-CPU data (e.g. per-CPU flush irq_work) before
> @@ -1238,6 +1246,10 @@ void __init setup_log_buf(int early)
>
>  	local_irq_restore(flags);
>
> +	meminspect_lock_register_va(new_log_buf, new_log_buf_len);
> +	meminspect_lock_register_va(new_descs, new_descs_size);
> +	meminspect_lock_register_va(new_infos, new_infos_size);
> +
>  	/*
>  	 * Copy any remaining messages that might have appeared from
>  	 * NMI context after copying but before switching to the
>
> --
> 2.53.0
>

Overall exposing live dynamic printk information to drivers seems unwise, but
not quite as insane as some of the other stuff thus exposed...

Thanks, Lorenzo

