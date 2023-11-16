Return-Path: <linux-arm-msm+bounces-822-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F167EE5E0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Nov 2023 18:24:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C6D4E1F241F1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Nov 2023 17:24:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28818364BC;
	Thu, 16 Nov 2023 17:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HSrRtPnD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D4DD30666
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Nov 2023 17:24:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAD37C433CA;
	Thu, 16 Nov 2023 17:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700155460;
	bh=/B6JGyRiiov2KpkuJVzSZzJhSDEp4Byf+qHwBNlACac=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HSrRtPnDzSFpOZws4iU58xlCoKdKfHVEATrGDQoZ7zBqsZL7Es+u3steobl56VqfZ
	 8ELEuvzzClmT+SoR4pdB19wuF4Nn2HSOtq4C0uPT+Tx4AXcu5zzpPc8grHLpndzIZp
	 djb0lFqTpdT6cn2K195abD6J9Al5uHiWDHoBTMpBbrqAw3+bZCuyfG3OAwBokreVk8
	 9hR7CYqoYNKQyGRsK1ecx40zKzTz0iIvKAFLYTfDSA5aXl0NcQ3YgSkFfyHh/xoB2f
	 dx91geI8UZP+gi53v6IzL/AgKyeT/MwKp7SU9YnBswZfbgmqJ+1ZrHFeLkADPHNb2k
	 GE/sk4hP9xHsg==
Date: Thu, 16 Nov 2023 10:24:18 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Maria Yu <quic_aiquny@quicinc.com>
Cc: linux@armlinux.org.uk, ardb@kernel.org, mhiramat@kernel.org,
	kernel@quicinc.com, linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	quic_lijuang@quicinc.com, stable@vger.kernel.org
Subject: Re: [PATCH v2 1/1] ARM: kprobes: Explicitly reserve r7 for local
 variables
Message-ID: <20231116172418.GA174808@dev-arch.thelio-3990X>
References: <20231115095830.20607-1-quic_aiquny@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231115095830.20607-1-quic_aiquny@quicinc.com>

On Wed, Nov 15, 2023 at 05:58:30PM +0800, Maria Yu wrote:
> Registers r7 is removed in clobber list, so compiler may choose r7 for
> local variables usage, while r7 will be actually updated by the inline asm
> code. This caused the runtime behavior wrong.
> While those kind of reserved registers cannot be set to clobber list
> because of error like "inline asm clobber list contains reserved
> registers".
> Explicitly reserve r7 by adding attribute no-omit-frame-pointer for needed
> function, then in T32 asm code r7 is used as a frame pointer and is not
> available for use as a general-purpose register.
> Note that "no-omit-frame-pointer" will make the code size a little bigger
> to store the stack frame pointer. So limited to needed functions can have
> the less impact than the full source file.
> 
> Fixes: dd12e97f3c72 ("ARM: kprobes: treat R7 as the frame pointer register in Thumb2 builds")
> Signed-off-by: Maria Yu <quic_aiquny@quicinc.com>
> Cc: stable@vger.kernel.org

This causes warnings with clang:

  arch/arm/probes/kprobes/actions-thumb.c:441:47: warning: unknown attribute 'optimize' ignored [-Wunknown-attributes]
    441 | static unsigned long __kprobes __attribute__((optimize("no-omit-frame-pointer")))
        |                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  arch/arm/probes/kprobes/actions-thumb.c:524:38: warning: unknown attribute 'optimize' ignored [-Wunknown-attributes]
    524 | static void __kprobes __attribute__((optimize("no-omit-frame-pointer")))
        |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  arch/arm/probes/kprobes/actions-thumb.c:560:38: warning: unknown attribute 'optimize' ignored [-Wunknown-attributes]
    560 | static void __kprobes __attribute__((optimize("no-omit-frame-pointer")))
        |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  arch/arm/probes/kprobes/actions-thumb.c:579:38: warning: unknown attribute 'optimize' ignored [-Wunknown-attributes]
    579 | static void __kprobes __attribute__((optimize("no-omit-frame-pointer")))
        |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  4 warnings generated.

Furthermore, as far as I am aware, the optimize attribute has other issues so
its use is discouraged, see commits 080b6f407635 ("bpf: Don't rely on GCC
__attribute__((optimize)) to disable GCSE") and a7223f5bfcae ("powerpc: Avoid
broken GCC __attribute__((optimize))").

Cheers,
Nathan

> ---
>  arch/arm/probes/kprobes/actions-thumb.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm/probes/kprobes/actions-thumb.c b/arch/arm/probes/kprobes/actions-thumb.c
> index 51624fc263fc..c2fdaf9f6dba 100644
> --- a/arch/arm/probes/kprobes/actions-thumb.c
> +++ b/arch/arm/probes/kprobes/actions-thumb.c
> @@ -438,7 +438,7 @@ t16_simulate_branch(probes_opcode_t insn,
>  	regs->ARM_pc = pc + (offset * 2);
>  }
>  
> -static unsigned long __kprobes
> +static unsigned long __kprobes __attribute__((optimize("no-omit-frame-pointer")))
>  t16_emulate_loregs(probes_opcode_t insn,
>  		   struct arch_probes_insn *asi, struct pt_regs *regs)
>  {
> @@ -521,7 +521,7 @@ t16_decode_hiregs(probes_opcode_t insn, struct arch_probes_insn *asi,
>  	return INSN_GOOD;
>  }
>  
> -static void __kprobes
> +static void __kprobes __attribute__((optimize("no-omit-frame-pointer")))
>  t16_emulate_push(probes_opcode_t insn,
>  		struct arch_probes_insn *asi, struct pt_regs *regs)
>  {
> @@ -557,7 +557,7 @@ t16_decode_push(probes_opcode_t insn, struct arch_probes_insn *asi,
>  	return INSN_GOOD;
>  }
>  
> -static void __kprobes
> +static void __kprobes __attribute__((optimize("no-omit-frame-pointer")))
>  t16_emulate_pop_nopc(probes_opcode_t insn,
>  		struct arch_probes_insn *asi, struct pt_regs *regs)
>  {
> @@ -576,7 +576,7 @@ t16_emulate_pop_nopc(probes_opcode_t insn,
>  		);
>  }
>  
> -static void __kprobes
> +static void __kprobes __attribute__((optimize("no-omit-frame-pointer")))
>  t16_emulate_pop_pc(probes_opcode_t insn,
>  		struct arch_probes_insn *asi, struct pt_regs *regs)
>  {
> 
> base-commit: 9bacdd8996c77c42ca004440be610692275ff9d0
> -- 
> 2.17.1
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

