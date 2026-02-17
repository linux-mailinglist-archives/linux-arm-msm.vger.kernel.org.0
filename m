Return-Path: <linux-arm-msm+bounces-93206-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KDq1ONadlGmrFwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93206-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 17:56:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 513C414E70C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 17:56:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3C4903029E44
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 16:55:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EA8936D51B;
	Tue, 17 Feb 2026 16:55:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28E1136EA82;
	Tue, 17 Feb 2026 16:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771347353; cv=none; b=PiR+aRVfi7xSGavYFXwaOh1k/tv8Hz290SWFuEiNzBW9wuuE4gjoNeL0iJCBqifJoRORlDkdBK8jZ5WnuyraamRdy59pz5DIhnQPkHXBu63RrcacTgIb0i5KZbqbMaiVOMsI+0TAWW+UsRUD9pEbrZdNxR+06Os68qijHEDJnec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771347353; c=relaxed/simple;
	bh=DPVZmJT3WeWeynh1vvMXWFKktmC9XdxJDr8W+oqPIm8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tw0i58j2LHyRSHXCbbrM/jizG4xlZLY4HvJXCe4FSf5BjTKOGl+QqXP1wilcKYh8llWLxgKGcCdosPSXPLEVHfdcR1N3Jt9b00PicRZBhL9jqQE1EC2YrHvN3tG2fNtrtoQbLESGjwg9/HABR5klt9lR1/kf89CtxmetuDYfi74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D95051477;
	Tue, 17 Feb 2026 08:55:44 -0800 (PST)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 945B73F62B;
	Tue, 17 Feb 2026 08:55:49 -0800 (PST)
Date: Tue, 17 Feb 2026 16:55:44 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Khaja Hussain Shaik Khaji <khaja.khaji@oss.qualcomm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	catalin.marinas@arm.com, will@kernel.org, mhiramat@kernel.org,
	yang@os.amperecomputing.com, dev.jain@arm.com,
	ada.coupriediaz@arm.com, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 1/2] arm64: kprobes: disable preemption across XOL
 single-step
Message-ID: <aZSdkGjy2BXUL0bT@J2N7QTR9R3.cambridge.arm.com>
References: <20251106104955.2089268-1-khaja.khaji@oss.qualcomm.com>
 <20260217133855.3142192-1-khaja.khaji@oss.qualcomm.com>
 <20260217133855.3142192-2-khaja.khaji@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260217133855.3142192-2-khaja.khaji@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TAGGED_FROM(0.00)[bounces-93206-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mark.rutland@arm.com,linux-arm-msm@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_DKIM_NA(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 513C414E70C
X-Rspamd-Action: no action

On Tue, Feb 17, 2026 at 07:08:54PM +0530, Khaja Hussain Shaik Khaji wrote:
> On arm64, non-emulatable kprobes instructions execute out-of-line (XOL)
> after returning from the initial debug exception. The XOL instruction
> runs in normal kernel context, while kprobe state is maintained per-CPU.

The XOL instruction runs in a context with all DAIF bits set (see
kprobes_save_local_irqflag() and kprobes_restore_local_irqflag()), so
not quite a regular kernel context.

> If the task is preempted or migrates during the XOL window, the subsequent
> SS-BRK exception may be handled on a different CPU, corrupting per-CPU
> kprobe state and preventing correct recovery.

I think we need a better explanation of this.

Since DAIF is masked, we won't take an IRQ to preempt during the actual
XOL execution.

AFAICT we *could* explicitly preempt/schedule in C code around the XOL
execution. However, AFAICT that'd equally apply to other architectures,
and on x86 they *removed* the preempt count manipulation in commit:

  2bbda764d720aaca ("kprobes/x86: Do not disable preempt on int3 path")

... so it looks like there's a wider potential problem here.

Can you please share an example failure that you have seen? .. and how
you triggered it (e.g. is this a plain kprobe, something with bpf, etc).

I reckon you could hack a warning something into schedule() (or
cond_resched(), etc) that detects when there's an active XOL slot, so
that we can get the full backtrace.

> Disable preemption across the XOL instruction and re-enable it in the
> SS-BRK handler to prevent migration until control returns to the kprobe
> handler.

This might work, but without some more detail I'm not certain this is
sufficient, and I believe other architectures are likely affected by the
same problem.

Thanks,
Mark.

> 
> Signed-off-by: Khaja Hussain Shaik Khaji <khaja.khaji@oss.qualcomm.com>
> ---
>  arch/arm64/kernel/probes/kprobes.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/arch/arm64/kernel/probes/kprobes.c b/arch/arm64/kernel/probes/kprobes.c
> index 43a0361a8bf0..d8a70c456543 100644
> --- a/arch/arm64/kernel/probes/kprobes.c
> +++ b/arch/arm64/kernel/probes/kprobes.c
> @@ -227,6 +227,14 @@ static void __kprobes setup_singlestep(struct kprobe *p,
>  
>  		kprobes_save_local_irqflag(kcb, regs);
>  		instruction_pointer_set(regs, slot);
> +
> +		/*
> +		 * Disable preemption across the out-of-line (XOL) instruction.
> +		 * The XOL instruction executes in normal kernel context and
> +		 * kprobe state is per-CPU.
> +		 */
> +		preempt_disable();
> +
>  	} else {
>  		/* insn simulation */
>  		arch_simulate_insn(p, regs);
> @@ -363,6 +371,11 @@ kprobe_ss_brk_handler(struct pt_regs *regs, unsigned long esr)
>  		kprobes_restore_local_irqflag(kcb, regs);
>  		post_kprobe_handler(cur, kcb, regs);
>  
> +		/*
> +		 * Re-enable preemption after completing the XOL instruction.
> +		 */
> +		preempt_enable_no_resched();
> +
>  		return DBG_HOOK_HANDLED;
>  	}
>  
> -- 
> 2.34.1
> 

