Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3EBB63751
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2019 15:56:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726251AbfGIN4G (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Jul 2019 09:56:06 -0400
Received: from foss.arm.com ([217.140.110.172]:44664 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726047AbfGIN4F (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Jul 2019 09:56:05 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EBA7328;
        Tue,  9 Jul 2019 06:56:04 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8E5953F738;
        Tue,  9 Jul 2019 06:56:03 -0700 (PDT)
Date:   Tue, 9 Jul 2019 14:55:58 +0100
From:   Mark Rutland <mark.rutland@arm.com>
To:     Marc Zyngier <marc.zyngier@arm.com>
Cc:     Neeraj Upadhyay <neeraju@codeaurora.org>, will@kernel.org,
        julien.thierry@arm.com, tglx@linutronix.de,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, gkohli@codeaurora.org,
        parthd@codeaurora.org
Subject: Re: [PATCH] arm64: Explicitly set pstate.ssbs for el0 on kernel entry
Message-ID: <20190709135557.GA10123@lakrids.cambridge.arm.com>
References: <1562671333-3563-1-git-send-email-neeraju@codeaurora.org>
 <62c4fed5-39ac-adc9-3bc5-56eb5234a9d1@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <62c4fed5-39ac-adc9-3bc5-56eb5234a9d1@arm.com>
User-Agent: Mutt/1.11.1+11 (2f07cb52) (2018-12-01)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Marc,

On Tue, Jul 09, 2019 at 02:08:28PM +0100, Marc Zyngier wrote:
> From 7d4314d1ef3122d8bf56a7ef239c8c68e0c81277 Mon Sep 17 00:00:00 2001
> From: Marc Zyngier <marc.zyngier@arm.com>
> Date: Tue, 4 Jun 2019 17:35:18 +0100
> Subject: [PATCH] arm64: Force SSBS on context switch
> 
> On a CPU that doesn't support SSBS, PSTATE[12] is RES0.  In a system
> where only some of the CPUs implement SSBS, we end-up losing track of
> the SSBS bit across task migration.
> 
> To address this issue, let's force the SSBS bit on context switch.
> 
> Signed-off-by: Marc Zyngier <marc.zyngier@arm.com>
> ---
>  arch/arm64/include/asm/processor.h | 14 ++++++++++++--
>  arch/arm64/kernel/process.c        | 14 ++++++++++++++
>  2 files changed, 26 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/processor.h b/arch/arm64/include/asm/processor.h
> index fd5b1a4efc70..844e2964b0f5 100644
> --- a/arch/arm64/include/asm/processor.h
> +++ b/arch/arm64/include/asm/processor.h
> @@ -193,6 +193,16 @@ static inline void start_thread_common(struct pt_regs *regs, unsigned long pc)
>  		regs->pmr_save = GIC_PRIO_IRQON;
>  }
>  
> +static inline void set_ssbs_bit(struct pt_regs *regs)
> +{
> +	regs->pstate |= PSR_SSBS_BIT;
> +}
> +
> +static inline void set_compat_ssbs_bit(struct pt_regs *regs)
> +{
> +	regs->pstate |= PSR_AA32_SSBS_BIT;
> +}
> +
>  static inline void start_thread(struct pt_regs *regs, unsigned long pc,
>  				unsigned long sp)
>  {
> @@ -200,7 +210,7 @@ static inline void start_thread(struct pt_regs *regs, unsigned long pc,
>  	regs->pstate = PSR_MODE_EL0t;
>  
>  	if (arm64_get_ssbd_state() != ARM64_SSBD_FORCE_ENABLE)
> -		regs->pstate |= PSR_SSBS_BIT;
> +		set_ssbs_bit(regs);
>  
>  	regs->sp = sp;
>  }
> @@ -219,7 +229,7 @@ static inline void compat_start_thread(struct pt_regs *regs, unsigned long pc,
>  #endif
>  
>  	if (arm64_get_ssbd_state() != ARM64_SSBD_FORCE_ENABLE)
> -		regs->pstate |= PSR_AA32_SSBS_BIT;
> +		set_compat_ssbs_bit(regs);
>  
>  	regs->compat_sp = sp;
>  }
> diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
> index 9856395ccdb7..d451b3b248cf 100644
> --- a/arch/arm64/kernel/process.c
> +++ b/arch/arm64/kernel/process.c
> @@ -442,6 +442,19 @@ void uao_thread_switch(struct task_struct *next)
>  	}
>  }
>  
> +static void ssbs_thread_switch(struct task_struct *next)
> +{
> +	if (arm64_get_ssbd_state() != ARM64_SSBD_FORCE_ENABLE &&
> +	    !test_tsk_thread_flag(next, TIF_SSBD)) {
> +		struct pt_regs *regs = task_pt_regs(next);
> +
> +		if (compat_user_mode(regs))
> +			set_compat_ssbs_bit(regs);
> +		else if (user_mode(regs))
> +			set_ssbs_bit(regs);
> +	}
> +}

I think this isn't quite right, and it's not always safe to call
task_pt_regs() on a task.

For user tasks, the kernel stack looks like:

  +---------+ <=== task_stack_page(tsk) + THREAD_SIZE;
  |         |
  | pt_regs |
  |         |
  +---------+ <=== task_pt_regs(tsk)
  |         |
  |         |
  |         |
  |  stack  |
  |         |
  |         |
  |         |
  +---------+ <=== task_stack_page(tsk)

... where:

#define task_pt_regs(p) \
	((struct pt_regs *)(THREAD_SIZE + task_stack_page(p)) - 1)

... and in copy_thread() we initialize a new tsk's SP to start at
task_pt_regs(tsk).

However, in __cpu_up() we start the idle threads stacks without the
pt_regs bias, at task_stack_page(tsk) + THREAD_SIZE. Likewise for the
initial thread in __primary_switched(). So task_pt_regs(idle) will
return an aliasing portion of stack, rather than a pt_regs.

So when switching to those, we'll look at unrelated stack, and corrupt
it.

We could add a pt_regs bias to those to prevent stack corruption, though
assuming stacks are zero-initialized, user_mode(task_pt_regs(tsk))
should always be true, since:

#define PSR_MODE_EL0t      0x00000000

#define user_mode(regs) \
	(((regs)->pstate & PSR_MODE_MASK) == PSR_MODE_EL0t)

We could:

(a) Check for PF_KTRHEAD in ssbs_thread_switch(), and skip when this is set.

(b) Add the pt_regs bias to all stacks, and not care about the pointless
    manipulation of the junk regs.

(c) Make task_pt_regs() return NULL for kthreads, and fix up the fallout. I'm
    very tempted to do this longer term even if we do (a) or (b) for now.

Thanks,
Mark.
