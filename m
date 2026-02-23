Return-Path: <linux-arm-msm+bounces-93734-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UI6gDTB8nGm6IQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93734-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 17:11:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 902BC179703
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 17:11:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B2DC73067752
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 16:07:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE7662EC09B;
	Mon, 23 Feb 2026 16:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hL029yla"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE8D262808;
	Mon, 23 Feb 2026 16:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771862842; cv=none; b=bw/YLnjNrNPDBvIffSMEMC7sODfkWe5pUCZW0I4qLRz06Jo/IuJfaHQRH1dczR2Klt0+F3yjdHxC6sYNqXn8/IkpOZE+JP8NWNF7tPjn9YF4pJDEFDcnty1kMZDpWejymjkB/rZirrZlGrnLD7F7XRzk9Ymm0X3DVNew/NSsCVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771862842; c=relaxed/simple;
	bh=GhLl9ZdRY3Y1jLozygGmR/YnOTlmDerWjkfwo8L9yVU=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=ZjBxCzF2rjgnb0qWUc+e+soo6wg4JN18YnaTQCQNXzDHpsQXK5hQHC2ITRG8rRXJvELwbRnhDch5wy64Az9uqIML2pbYT2Yip+hEW2smAfI8yn5OgUZhgqwqj2NYPK4Kqbr8x0U179e67koj6tl8yFuaPvrNxKiwILuyQAck2Pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hL029yla; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A2B8C116C6;
	Mon, 23 Feb 2026 16:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771862842;
	bh=GhLl9ZdRY3Y1jLozygGmR/YnOTlmDerWjkfwo8L9yVU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=hL029ylaeQv8chZx1V/BoKCDPp1HXx7Xxaj6d561OVl3S+DlFYtq0/s7xJQdbNRU1
	 7I7d8lAUvVoQYBA1drMukTn5efiEF6LwPqKiFxIXQxJbDOBjFGvM5bGUjTCIoJni3B
	 DgV6+8Tvv1z1ESDgKHQJKZhKEfJBpSzYsf7srHUI/IrmexUu8QdnDmjwTB1HQhl2Vp
	 M8Ovk2xSmnhPaAOAOpdmxg/zJCIa1hJ1WV5hXV7WS6aB1CwPzTFV5/vKoOG6dunZzs
	 fLDrZ+55CDZSb7vTmfL3/kP0RxBKx1cMB25zzrgoNmpH1AvFR+E74rbtIVRda4eMHG
	 XPXLFwujTibTA==
Date: Tue, 24 Feb 2026 01:07:16 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Khaja Hussain Shaik Khaji <khaja.khaji@oss.qualcomm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 catalin.marinas@arm.com, will@kernel.org, mhiramat@kernel.org,
 yang@os.amperecomputing.com, dev.jain@arm.com, ada.coupriediaz@arm.com,
 linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 1/2] arm64: kprobes: disable preemption across XOL
 single-step
Message-Id: <20260224010716.91b1f54b446acab84bc6031c@kernel.org>
In-Reply-To: <aZSdkGjy2BXUL0bT@J2N7QTR9R3.cambridge.arm.com>
References: <20251106104955.2089268-1-khaja.khaji@oss.qualcomm.com>
	<20260217133855.3142192-1-khaja.khaji@oss.qualcomm.com>
	<20260217133855.3142192-2-khaja.khaji@oss.qualcomm.com>
	<aZSdkGjy2BXUL0bT@J2N7QTR9R3.cambridge.arm.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-93734-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mhiramat@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 902BC179703
X-Rspamd-Action: no action

On Tue, 17 Feb 2026 16:55:44 +0000
Mark Rutland <mark.rutland@arm.com> wrote:

> On Tue, Feb 17, 2026 at 07:08:54PM +0530, Khaja Hussain Shaik Khaji wrote:
> > On arm64, non-emulatable kprobes instructions execute out-of-line (XOL)
> > after returning from the initial debug exception. The XOL instruction
> > runs in normal kernel context, while kprobe state is maintained per-CPU.
> 
> The XOL instruction runs in a context with all DAIF bits set (see
> kprobes_save_local_irqflag() and kprobes_restore_local_irqflag()), so
> not quite a regular kernel context.
> 
> > If the task is preempted or migrates during the XOL window, the subsequent
> > SS-BRK exception may be handled on a different CPU, corrupting per-CPU
> > kprobe state and preventing correct recovery.
> 
> I think we need a better explanation of this.
> 
> Since DAIF is masked, we won't take an IRQ to preempt during the actual
> XOL execution.
> 
> AFAICT we *could* explicitly preempt/schedule in C code around the XOL
> execution. However, AFAICT that'd equally apply to other architectures,
> and on x86 they *removed* the preempt count manipulation in commit:
> 
>   2bbda764d720aaca ("kprobes/x86: Do not disable preempt on int3 path")
> 
> ... so it looks like there's a wider potential problem here.
> 
> Can you please share an example failure that you have seen? .. and how
> you triggered it (e.g. is this a plain kprobe, something with bpf, etc).

Yeah, this is important to know. Did it really happen on the single
stepping? or in user's handler function?

> 
> I reckon you could hack a warning something into schedule() (or
> cond_resched(), etc) that detects when there's an active XOL slot, so
> that we can get the full backtrace.

Sounds good way to show it.

Thank you,

> 
> > Disable preemption across the XOL instruction and re-enable it in the
> > SS-BRK handler to prevent migration until control returns to the kprobe
> > handler.
> 
> This might work, but without some more detail I'm not certain this is
> sufficient, and I believe other architectures are likely affected by the
> same problem.
> 
> Thanks,
> Mark.
> 
> > 
> > Signed-off-by: Khaja Hussain Shaik Khaji <khaja.khaji@oss.qualcomm.com>
> > ---
> >  arch/arm64/kernel/probes/kprobes.c | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> > 
> > diff --git a/arch/arm64/kernel/probes/kprobes.c b/arch/arm64/kernel/probes/kprobes.c
> > index 43a0361a8bf0..d8a70c456543 100644
> > --- a/arch/arm64/kernel/probes/kprobes.c
> > +++ b/arch/arm64/kernel/probes/kprobes.c
> > @@ -227,6 +227,14 @@ static void __kprobes setup_singlestep(struct kprobe *p,
> >  
> >  		kprobes_save_local_irqflag(kcb, regs);
> >  		instruction_pointer_set(regs, slot);
> > +
> > +		/*
> > +		 * Disable preemption across the out-of-line (XOL) instruction.
> > +		 * The XOL instruction executes in normal kernel context and
> > +		 * kprobe state is per-CPU.
> > +		 */
> > +		preempt_disable();
> > +
> >  	} else {
> >  		/* insn simulation */
> >  		arch_simulate_insn(p, regs);
> > @@ -363,6 +371,11 @@ kprobe_ss_brk_handler(struct pt_regs *regs, unsigned long esr)
> >  		kprobes_restore_local_irqflag(kcb, regs);
> >  		post_kprobe_handler(cur, kcb, regs);
> >  
> > +		/*
> > +		 * Re-enable preemption after completing the XOL instruction.
> > +		 */
> > +		preempt_enable_no_resched();
> > +
> >  		return DBG_HOOK_HANDLED;
> >  	}
> >  
> > -- 
> > 2.34.1
> > 
> 


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

