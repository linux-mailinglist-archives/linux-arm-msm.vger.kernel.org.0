Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF5856366F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2019 15:08:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726892AbfGINId (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Jul 2019 09:08:33 -0400
Received: from foss.arm.com ([217.140.110.172]:43790 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726046AbfGINIc (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Jul 2019 09:08:32 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5DBD02B;
        Tue,  9 Jul 2019 06:08:31 -0700 (PDT)
Received: from [10.1.197.61] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 14C7F3F738;
        Tue,  9 Jul 2019 06:08:29 -0700 (PDT)
Subject: Re: [PATCH] arm64: Explicitly set pstate.ssbs for el0 on kernel entry
To:     Neeraj Upadhyay <neeraju@codeaurora.org>, will@kernel.org,
        mark.rutland@arm.com, julien.thierry@arm.com, tglx@linutronix.de
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, gkohli@codeaurora.org,
        parthd@codeaurora.org
References: <1562671333-3563-1-git-send-email-neeraju@codeaurora.org>
From:   Marc Zyngier <marc.zyngier@arm.com>
Openpgp: preference=signencrypt
Autocrypt: addr=marc.zyngier@arm.com; prefer-encrypt=mutual; keydata=
 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
 Z46HaNmN2hZS/oJ69c1DI5Rcww==
Organization: ARM Ltd
Message-ID: <62c4fed5-39ac-adc9-3bc5-56eb5234a9d1@arm.com>
Date:   Tue, 9 Jul 2019 14:08:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <1562671333-3563-1-git-send-email-neeraju@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Neeraj,

On 09/07/2019 12:22, Neeraj Upadhyay wrote:
> For cpus which do not support pstate.ssbs feature, el0
> might not retain spsr.ssbs. This is problematic, if this
> task migrates to a cpu supporting this feature, thus
> relying on its state to be correct. On kernel entry,
> explicitly set spsr.ssbs, so that speculation is enabled
> for el0, when this task migrates to a cpu supporting
> ssbs feature. Restoring state at kernel entry ensures
> that el0 ssbs state is always consistent while we are
> in el1.
> 
> As alternatives are applied by boot cpu, at the end of smp
> init, presence/absence of ssbs feature on boot cpu, is used
> for deciding, whether the capability is uniformly provided.

I've seen the same issue, but went for a slightly different
approach, see below.

> 
> Signed-off-by: Neeraj Upadhyay <neeraju@codeaurora.org>
> ---
>  arch/arm64/kernel/cpu_errata.c | 16 ++++++++++++++++
>  arch/arm64/kernel/entry.S      | 26 +++++++++++++++++++++++++-
>  2 files changed, 41 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kernel/cpu_errata.c b/arch/arm64/kernel/cpu_errata.c
> index ca11ff7..c84a56d 100644
> --- a/arch/arm64/kernel/cpu_errata.c
> +++ b/arch/arm64/kernel/cpu_errata.c
> @@ -336,6 +336,22 @@ void __init arm64_enable_wa2_handling(struct alt_instr *alt,
>  		*updptr = cpu_to_le32(aarch64_insn_gen_nop());
>  }
>  
> +void __init arm64_restore_ssbs_state(struct alt_instr *alt,
> +				     __le32 *origptr, __le32 *updptr,
> +				     int nr_inst)
> +{
> +	BUG_ON(nr_inst != 1);
> +	/*
> +	 * Only restore EL0 SSBS state on EL1 entry if cpu does not
> +	 * support the capability and capability is present for at
> +	 * least one cpu and if the SSBD state allows it to
> +	 * be changed.
> +	 */
> +	if (!this_cpu_has_cap(ARM64_SSBS) && cpus_have_cap(ARM64_SSBS) &&
> +	    arm64_get_ssbd_state() != ARM64_SSBD_FORCE_ENABLE)
> +		*updptr = cpu_to_le32(aarch64_insn_gen_nop());
> +}
> +
>  void arm64_set_ssbd_mitigation(bool state)
>  {
>  	if (!IS_ENABLED(CONFIG_ARM64_SSBD)) {
> diff --git a/arch/arm64/kernel/entry.S b/arch/arm64/kernel/entry.S
> index 9cdc459..7e79305 100644
> --- a/arch/arm64/kernel/entry.S
> +++ b/arch/arm64/kernel/entry.S
> @@ -143,6 +143,25 @@ alternative_cb_end
>  #endif
>  	.endm
>  
> +	// This macro updates spsr. It also corrupts the condition
> +	// codes state.
> +	.macro	restore_ssbs_state, saved_spsr, tmp
> +#ifdef CONFIG_ARM64_SSBD
> +alternative_cb	arm64_restore_ssbs_state
> +	b	.L__asm_ssbs_skip\@
> +alternative_cb_end
> +	ldr	\tmp, [tsk, #TSK_TI_FLAGS]
> +	tbnz	\tmp, #TIF_SSBD, .L__asm_ssbs_skip\@
> +	tst	\saved_spsr, #PSR_MODE32_BIT	// native task?
> +	b.ne	.L__asm_ssbs_compat\@
> +	orr	\saved_spsr, \saved_spsr, #PSR_SSBS_BIT
> +	b	.L__asm_ssbs_skip\@
> +.L__asm_ssbs_compat\@:
> +	orr	\saved_spsr, \saved_spsr, #PSR_AA32_SSBS_BIT
> +.L__asm_ssbs_skip\@:
> +#endif
> +	.endm

Although this is in keeping with the rest of entry.S (perfectly
unreadable ;-), I think we can do something a bit simpler, that
doesn't rely on patching. Also, this doesn't seem to take the
SSBD options such as ARM64_SSBD_FORCE_ENABLE into account.

> +
>  	.macro	kernel_entry, el, regsize = 64
>  	.if	\regsize == 32
>  	mov	w0, w0				// zero upper 32 bits of x0
> @@ -182,8 +201,13 @@ alternative_cb_end
>  	str	x20, [tsk, #TSK_TI_ADDR_LIMIT]
>  	/* No need to reset PSTATE.UAO, hardware's already set it to 0 for us */
>  	.endif /* \el == 0 */
> -	mrs	x22, elr_el1
>  	mrs	x23, spsr_el1
> +
> +	.if	\el == 0
> +	restore_ssbs_state x23, x22
> +	.endif
> +
> +	mrs	x22, elr_el1
>  	stp	lr, x21, [sp, #S_LR]
>  
>  	/*
> 

How about the patch below?

Thanks,

	M.

From 7d4314d1ef3122d8bf56a7ef239c8c68e0c81277 Mon Sep 17 00:00:00 2001
From: Marc Zyngier <marc.zyngier@arm.com>
Date: Tue, 4 Jun 2019 17:35:18 +0100
Subject: [PATCH] arm64: Force SSBS on context switch

On a CPU that doesn't support SSBS, PSTATE[12] is RES0.  In a system
where only some of the CPUs implement SSBS, we end-up losing track of
the SSBS bit across task migration.

To address this issue, let's force the SSBS bit on context switch.

Signed-off-by: Marc Zyngier <marc.zyngier@arm.com>
---
 arch/arm64/include/asm/processor.h | 14 ++++++++++++--
 arch/arm64/kernel/process.c        | 14 ++++++++++++++
 2 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/processor.h b/arch/arm64/include/asm/processor.h
index fd5b1a4efc70..844e2964b0f5 100644
--- a/arch/arm64/include/asm/processor.h
+++ b/arch/arm64/include/asm/processor.h
@@ -193,6 +193,16 @@ static inline void start_thread_common(struct pt_regs *regs, unsigned long pc)
 		regs->pmr_save = GIC_PRIO_IRQON;
 }
 
+static inline void set_ssbs_bit(struct pt_regs *regs)
+{
+	regs->pstate |= PSR_SSBS_BIT;
+}
+
+static inline void set_compat_ssbs_bit(struct pt_regs *regs)
+{
+	regs->pstate |= PSR_AA32_SSBS_BIT;
+}
+
 static inline void start_thread(struct pt_regs *regs, unsigned long pc,
 				unsigned long sp)
 {
@@ -200,7 +210,7 @@ static inline void start_thread(struct pt_regs *regs, unsigned long pc,
 	regs->pstate = PSR_MODE_EL0t;
 
 	if (arm64_get_ssbd_state() != ARM64_SSBD_FORCE_ENABLE)
-		regs->pstate |= PSR_SSBS_BIT;
+		set_ssbs_bit(regs);
 
 	regs->sp = sp;
 }
@@ -219,7 +229,7 @@ static inline void compat_start_thread(struct pt_regs *regs, unsigned long pc,
 #endif
 
 	if (arm64_get_ssbd_state() != ARM64_SSBD_FORCE_ENABLE)
-		regs->pstate |= PSR_AA32_SSBS_BIT;
+		set_compat_ssbs_bit(regs);
 
 	regs->compat_sp = sp;
 }
diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
index 9856395ccdb7..d451b3b248cf 100644
--- a/arch/arm64/kernel/process.c
+++ b/arch/arm64/kernel/process.c
@@ -442,6 +442,19 @@ void uao_thread_switch(struct task_struct *next)
 	}
 }
 
+static void ssbs_thread_switch(struct task_struct *next)
+{
+	if (arm64_get_ssbd_state() != ARM64_SSBD_FORCE_ENABLE &&
+	    !test_tsk_thread_flag(next, TIF_SSBD)) {
+		struct pt_regs *regs = task_pt_regs(next);
+
+		if (compat_user_mode(regs))
+			set_compat_ssbs_bit(regs);
+		else if (user_mode(regs))
+			set_ssbs_bit(regs);
+	}
+}
+
 /*
  * We store our current task in sp_el0, which is clobbered by userspace. Keep a
  * shadow copy so that we can restore this upon entry from userspace.
@@ -471,6 +484,7 @@ __notrace_funcgraph struct task_struct *__switch_to(struct task_struct *prev,
 	entry_task_switch(next);
 	uao_thread_switch(next);
 	ptrauth_thread_switch(next);
+	ssbs_thread_switch(next);
 
 	/*
 	 * Complete any pending TLB or cache maintenance on this CPU in case
-- 
2.20.1


-- 
Jazz is not dead. It just smells funny...
