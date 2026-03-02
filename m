Return-Path: <linux-arm-msm+bounces-94944-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id RqW2L4iUpWmPEQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94944-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 14:45:44 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 429971DA085
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 14:45:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2517C305C3F2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 13:38:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E9B03FB059;
	Mon,  2 Mar 2026 13:38:43 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CA143FB045;
	Mon,  2 Mar 2026 13:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772458723; cv=none; b=B9q25jnjb5Sr9OEEHIwwrFs6DST/hZZ+uUEfF92ZH2klsoiMZXiW7WFEf197p872+iETbTiDcjnvF5kJUZL8zCIaUmSkG4PiMci+LzA7Qor7Owi9uNgf5RZgZYmR/qW0NYUVvSH0RBnWfCej6S9dI5mknq2L4ON0o7Y7l6I8j/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772458723; c=relaxed/simple;
	bh=or6VXUNP7rIrQP4pal+adnsjF3Rc5PHbYMxEM7+ZUFA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QqzCToCvEQbRwlvKzSg80pzzSPQC0NAt9l67zaa1HK6/bvxrXgy1G9Zz8oUIV2Dwh0T46Q4IE0s4lWcwmKj5ehV6mdaXJOBa/zvd4l5YMgG+V1zdeEBqVnSu8Db3RlSKVojcj7HrrCzwdnZZ4tByL97cqo07uQAMJo2GEJYzeOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1833214BF;
	Mon,  2 Mar 2026 05:38:34 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9E88A3F73B;
	Mon,  2 Mar 2026 05:38:38 -0800 (PST)
Date: Mon, 2 Mar 2026 13:38:35 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Khaja Hussain Shaik Khaji <khaja.khaji@oss.qualcomm.com>
Cc: ada.coupriediaz@arm.com, catalin.marinas@arm.com, dev.jain@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, mhiramat@kernel.org, will@kernel.org,
	yang@os.amperecomputing.com
Subject: Re: [PATCH v3 1/1] kernel: kprobes: fix cur_kprobe corruption during
 re-entrant kprobe_busy_begin() calls
Message-ID: <aaWS20g-jGu8mCKH@J2N7QTR9R3>
References: <aZSdkGjy2BXUL0bT@J2N7QTR9R3.cambridge.arm.com>
 <20260302105347.3602192-1-khaja.khaji@oss.qualcomm.com>
 <20260302105347.3602192-2-khaja.khaji@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260302105347.3602192-2-khaja.khaji@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.86 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94944-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mark.rutland@arm.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.758];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 429971DA085
X-Rspamd-Action: no action

On Mon, Mar 02, 2026 at 04:23:47PM +0530, Khaja Hussain Shaik Khaji wrote:
> Fix cur_kprobe corruption that occurs when kprobe_busy_begin() is called
> re-entrantly during an active kprobe handler.
> 
> Previously, kprobe_busy_begin() unconditionally overwrites current_kprobe
> with &kprobe_busy, and kprobe_busy_end() writes NULL. This approach works
> correctly when no kprobe is active but fails during re-entrant calls.

The structure of kprobe_busy_begin() and kprobe_busy_end() implies that
re-entrancy is unexpected, and something that should be avoided somehow.

Is that the case, or are kprobe_busy_begin() and kprobe_busy_end()
generally buggy?

> On arm64, arm64_enter_el1_dbg() re-enables IRQs before invoking kprobe
> handlers. 

No, arm64_enter_el1_dbg() does not re-enable IRQs. It only manages state
tracking.

I don't know if you meant to say a different function here, but this
statement is clearly wrong.

> This allows an IRQ during kretprobe
> entry_handler to trigger kprobe_flush_task() via softirq, which calls
> kprobe_busy_begin/end and corrupts cur_kprobe.

This would be easier to follow if the backtrace were included in the
commit message, rather than in the cover letter, such that it could be
referred to easily.

> Problem flow: kretprobe entry_handler -> IRQ -> softirq ->
> kprobe_flush_task -> kprobe_busy_begin/end -> cur_kprobe corruption.

We shouldn't take the IRQ in the first place here. AFAICT, nothing
unmasks IRQs prior to the entry handler.

That suggests that something is going wrong *within* your entry handler
that causes IRQs to be unmasked unexpectedly.

Please can we find out *exactly* where IRQs get unmasked for the first
time?

Mark.

> 
> This corruption causes two issues:
> 1. NULL cur_kprobe in setup_singlestep leading to panic in single-step
> handler
> 2. kprobe_status overwritten with HIT_ACTIVE during execute-out-of-line
> window
> 
> Implement a per-CPU re-entrancy tracking mechanism with:
> - A depth counter to track nested calls
> - Saved state for current_kprobe and kprobe_status
> - Save state on first entry, restore on final exit
> - Increment depth counter for nested calls only
> 
> This approach maintains compatibility with existing callers as
> save/restore of NULL is a no-op.
> 
> Signed-off-by: Khaja Hussain Shaik Khaji <khaja.khaji@oss.qualcomm.com>
> ---
>  kernel/kprobes.c | 34 ++++++++++++++++++++++++++++++----
>  1 file changed, 30 insertions(+), 4 deletions(-)
> 
> diff --git a/kernel/kprobes.c b/kernel/kprobes.c
> index e2cd01cf5968..47a4ae50ee6c 100644
> --- a/kernel/kprobes.c
> +++ b/kernel/kprobes.c
> @@ -70,6 +70,15 @@ static bool kprobes_all_disarmed;
>  static DEFINE_MUTEX(kprobe_mutex);
>  static DEFINE_PER_CPU(struct kprobe *, kprobe_instance);
>  
> +/* Per-CPU re-entrancy state for kprobe_busy_begin/end.
> + * kprobe_busy_begin() may be called while a kprobe handler
> + * is active - e.g. kprobe_flush_task() via softirq during
> + * kretprobe entry_handler on arm64 where IRQs are re-enabled.
> + */
> +static DEFINE_PER_CPU(int, kprobe_busy_depth);
> +static DEFINE_PER_CPU(struct kprobe *, kprobe_busy_saved_current);
> +static DEFINE_PER_CPU(unsigned long, kprobe_busy_saved_status);
> +
>  kprobe_opcode_t * __weak kprobe_lookup_name(const char *name,
>  					unsigned int __unused)
>  {
> @@ -1307,14 +1316,31 @@ void kprobe_busy_begin(void)
>  	struct kprobe_ctlblk *kcb;
>  
>  	preempt_disable();
> -	__this_cpu_write(current_kprobe, &kprobe_busy);
> -	kcb = get_kprobe_ctlblk();
> -	kcb->kprobe_status = KPROBE_HIT_ACTIVE;
> +	if (__this_cpu_read(kprobe_busy_depth) == 0) {
> +		kcb = get_kprobe_ctlblk();
> +		__this_cpu_write(kprobe_busy_saved_current,
> +				 __this_cpu_read(current_kprobe));
> +		__this_cpu_write(kprobe_busy_saved_status,
> +				 kcb->kprobe_status);
> +		__this_cpu_write(current_kprobe, &kprobe_busy);
> +		kcb->kprobe_status = KPROBE_HIT_ACTIVE;
> +	}
> +	__this_cpu_inc(kprobe_busy_depth);
>  }
>  
>  void kprobe_busy_end(void)
>  {
> -	__this_cpu_write(current_kprobe, NULL);
> +	struct kprobe_ctlblk *kcb;
> +
> +	__this_cpu_dec(kprobe_busy_depth);
> +
> +	if (__this_cpu_read(kprobe_busy_depth) == 0) {
> +		kcb = get_kprobe_ctlblk();
> +		__this_cpu_write(current_kprobe,
> +				 __this_cpu_read(kprobe_busy_saved_current));
> +		kcb->kprobe_status =
> +				__this_cpu_read(kprobe_busy_saved_status);
> +	}
>  	preempt_enable();
>  }
>  
> -- 
> 2.34.1
> 

