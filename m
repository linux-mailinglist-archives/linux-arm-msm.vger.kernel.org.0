Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13EFF634E2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2019 13:26:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726309AbfGIL0E (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Jul 2019 07:26:04 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:55538 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726025AbfGIL0E (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Jul 2019 07:26:04 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id A20F360214; Tue,  9 Jul 2019 11:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1562671562;
        bh=uKSWUAXdnQaxp8dsA2ymp5mDBfLzuxXNVt3rRqgqkp4=;
        h=From:To:Cc:Subject:Date:From;
        b=IkyJcM65zanwIs65zgg0OLmPOtdx8k0Kl1mIgrSkheulGVfq4LenSHX7rcjGHMORM
         AmZHiu2xluCdtweGY5lm8EDVzA71w8BodrgLDLkIrnPjQTwURdH5lel3+qDRdRCPeR
         MXGFKZpVu4n+uD7o4qAVfo8pPQGJttzXzMRKoV8E=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from neeraju-linux.qualcomm.com (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: neeraju@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1EAEB605A5;
        Tue,  9 Jul 2019 11:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1562671561;
        bh=uKSWUAXdnQaxp8dsA2ymp5mDBfLzuxXNVt3rRqgqkp4=;
        h=From:To:Cc:Subject:Date:From;
        b=jmG13T43GS/jFFdWzpUPiTLAFjmuznX7vquZYQSgRyvq5ihId4Omat8c3SPw2CFOY
         LCEP1Fh6r/oHcryqnkxc17mbCVS6DtujcF9WPa5QSm92Xxxzp5Pbs8aq05PF2hszrp
         Ad+CC20LrH3FalYL+kGITs5PFlequiZ/tTaxeowM=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1EAEB605A5
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=neeraju@codeaurora.org
From:   Neeraj Upadhyay <neeraju@codeaurora.org>
To:     will@kernel.org, mark.rutland@arm.com, marc.zyngier@arm.com,
        julien.thierry@arm.com, tglx@linutronix.de
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, gkohli@codeaurora.org,
        parthd@codeaurora.org, Neeraj Upadhyay <neeraju@codeaurora.org>
Subject: [PATCH] arm64: Explicitly set pstate.ssbs for el0 on kernel entry
Date:   Tue,  9 Jul 2019 16:52:13 +0530
Message-Id: <1562671333-3563-1-git-send-email-neeraju@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

For cpus which do not support pstate.ssbs feature, el0
might not retain spsr.ssbs. This is problematic, if this
task migrates to a cpu supporting this feature, thus
relying on its state to be correct. On kernel entry,
explicitly set spsr.ssbs, so that speculation is enabled
for el0, when this task migrates to a cpu supporting
ssbs feature. Restoring state at kernel entry ensures
that el0 ssbs state is always consistent while we are
in el1.

As alternatives are applied by boot cpu, at the end of smp
init, presence/absence of ssbs feature on boot cpu, is used
for deciding, whether the capability is uniformly provided.

Signed-off-by: Neeraj Upadhyay <neeraju@codeaurora.org>
---
 arch/arm64/kernel/cpu_errata.c | 16 ++++++++++++++++
 arch/arm64/kernel/entry.S      | 26 +++++++++++++++++++++++++-
 2 files changed, 41 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/cpu_errata.c b/arch/arm64/kernel/cpu_errata.c
index ca11ff7..c84a56d 100644
--- a/arch/arm64/kernel/cpu_errata.c
+++ b/arch/arm64/kernel/cpu_errata.c
@@ -336,6 +336,22 @@ void __init arm64_enable_wa2_handling(struct alt_instr *alt,
 		*updptr = cpu_to_le32(aarch64_insn_gen_nop());
 }
 
+void __init arm64_restore_ssbs_state(struct alt_instr *alt,
+				     __le32 *origptr, __le32 *updptr,
+				     int nr_inst)
+{
+	BUG_ON(nr_inst != 1);
+	/*
+	 * Only restore EL0 SSBS state on EL1 entry if cpu does not
+	 * support the capability and capability is present for at
+	 * least one cpu and if the SSBD state allows it to
+	 * be changed.
+	 */
+	if (!this_cpu_has_cap(ARM64_SSBS) && cpus_have_cap(ARM64_SSBS) &&
+	    arm64_get_ssbd_state() != ARM64_SSBD_FORCE_ENABLE)
+		*updptr = cpu_to_le32(aarch64_insn_gen_nop());
+}
+
 void arm64_set_ssbd_mitigation(bool state)
 {
 	if (!IS_ENABLED(CONFIG_ARM64_SSBD)) {
diff --git a/arch/arm64/kernel/entry.S b/arch/arm64/kernel/entry.S
index 9cdc459..7e79305 100644
--- a/arch/arm64/kernel/entry.S
+++ b/arch/arm64/kernel/entry.S
@@ -143,6 +143,25 @@ alternative_cb_end
 #endif
 	.endm
 
+	// This macro updates spsr. It also corrupts the condition
+	// codes state.
+	.macro	restore_ssbs_state, saved_spsr, tmp
+#ifdef CONFIG_ARM64_SSBD
+alternative_cb	arm64_restore_ssbs_state
+	b	.L__asm_ssbs_skip\@
+alternative_cb_end
+	ldr	\tmp, [tsk, #TSK_TI_FLAGS]
+	tbnz	\tmp, #TIF_SSBD, .L__asm_ssbs_skip\@
+	tst	\saved_spsr, #PSR_MODE32_BIT	// native task?
+	b.ne	.L__asm_ssbs_compat\@
+	orr	\saved_spsr, \saved_spsr, #PSR_SSBS_BIT
+	b	.L__asm_ssbs_skip\@
+.L__asm_ssbs_compat\@:
+	orr	\saved_spsr, \saved_spsr, #PSR_AA32_SSBS_BIT
+.L__asm_ssbs_skip\@:
+#endif
+	.endm
+
 	.macro	kernel_entry, el, regsize = 64
 	.if	\regsize == 32
 	mov	w0, w0				// zero upper 32 bits of x0
@@ -182,8 +201,13 @@ alternative_cb_end
 	str	x20, [tsk, #TSK_TI_ADDR_LIMIT]
 	/* No need to reset PSTATE.UAO, hardware's already set it to 0 for us */
 	.endif /* \el == 0 */
-	mrs	x22, elr_el1
 	mrs	x23, spsr_el1
+
+	.if	\el == 0
+	restore_ssbs_state x23, x22
+	.endif
+
+	mrs	x22, elr_el1
 	stp	lr, x21, [sp, #S_LR]
 
 	/*
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a
member of the Code Aurora Forum, hosted by The Linux Foundation

