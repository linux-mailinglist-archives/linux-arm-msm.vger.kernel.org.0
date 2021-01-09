Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4161B2EFC30
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Jan 2021 01:32:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726195AbhAIAao (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Jan 2021 19:30:44 -0500
Received: from m43-15.mailgun.net ([69.72.43.15]:18105 "EHLO
        m43-15.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726426AbhAIAao (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Jan 2021 19:30:44 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1610152220; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=xy5glqBJuubC1mKDX0iVSGthVCjNQpvfd4mP/Wv3hJ4=; b=MkBD/5Fdwc8MFO+2gd8ufk980UJPWY8S3+Dqe6vdZyACVcWfx0ILjHW5FIgqqzI8M48y0RYj
 IINfoqIETlowzJ9RX9ol9RO8+zR+NwTW4XK+ghZ8SjNo8mCOMAlT9m0Z/SwBfqeSZlCpQySy
 7Xf21OOUbhw0UcfVbJERyc/D+3o=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 5ff8f8f6c88af06107c030e7 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 09 Jan 2021 00:29:42
 GMT
Sender: sramana=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 6733BC43461; Sat,  9 Jan 2021 00:29:41 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from sramana-linux1.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sramana)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 8C2E8C433CA;
        Sat,  9 Jan 2021 00:29:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8C2E8C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=sramana@codeaurora.org
From:   Srinivas Ramana <sramana@codeaurora.org>
To:     catalin.marinas@arm.com, will@kernel.org, pajay@qti.qualcomm.com
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Srinivas Ramana <sramana@codeaurora.org>,
        Prasad Sodagudi <psodagud@codeaurora.org>
Subject: [PATCH 1/3] arm64: Defer enabling pointer authentication on boot core
Date:   Fri,  8 Jan 2021 16:29:21 -0800
Message-Id: <1610152163-16554-2-git-send-email-sramana@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1610152163-16554-1-git-send-email-sramana@codeaurora.org>
References: <1610152163-16554-1-git-send-email-sramana@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Defer enabling pointer authentication on boot core until
after its required to be enabled by cpufeature framework.
This will help in controlling the feature dynamically
with a boot parameter.

Signed-off-by: Ajay Patil <pajay@qti.qualcomm.com>
Signed-off-by: Prasad Sodagudi <psodagud@codeaurora.org>
Signed-off-by: Srinivas Ramana <sramana@codeaurora.org>
---
 arch/arm64/include/asm/pointer_auth.h   | 10 ++++++++++
 arch/arm64/include/asm/stackprotector.h |  1 +
 arch/arm64/kernel/head.S                |  4 ----
 3 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/pointer_auth.h b/arch/arm64/include/asm/pointer_auth.h
index c6b4f0603024..b112a11e9302 100644
--- a/arch/arm64/include/asm/pointer_auth.h
+++ b/arch/arm64/include/asm/pointer_auth.h
@@ -76,6 +76,15 @@ static inline unsigned long ptrauth_strip_insn_pac(unsigned long ptr)
 	return ptrauth_clear_pac(ptr);
 }
 
+static __always_inline void ptrauth_enable(void)
+{
+	if (!system_supports_address_auth())
+		return;
+	sysreg_clear_set(sctlr_el1, 0, (SCTLR_ELx_ENIA | SCTLR_ELx_ENIB |
+					SCTLR_ELx_ENDA | SCTLR_ELx_ENDB));
+	isb();
+}
+
 #define ptrauth_thread_init_user(tsk)					\
 	ptrauth_keys_init_user(&(tsk)->thread.keys_user)
 #define ptrauth_thread_init_kernel(tsk)					\
@@ -84,6 +93,7 @@ static inline unsigned long ptrauth_strip_insn_pac(unsigned long ptr)
 	ptrauth_keys_switch_kernel(&(tsk)->thread.keys_kernel)
 
 #else /* CONFIG_ARM64_PTR_AUTH */
+#define ptrauth_enable()
 #define ptrauth_prctl_reset_keys(tsk, arg)	(-EINVAL)
 #define ptrauth_strip_insn_pac(lr)	(lr)
 #define ptrauth_thread_init_user(tsk)
diff --git a/arch/arm64/include/asm/stackprotector.h b/arch/arm64/include/asm/stackprotector.h
index 7263e0bac680..33f1bb453150 100644
--- a/arch/arm64/include/asm/stackprotector.h
+++ b/arch/arm64/include/asm/stackprotector.h
@@ -41,6 +41,7 @@ static __always_inline void boot_init_stack_canary(void)
 #endif
 	ptrauth_thread_init_kernel(current);
 	ptrauth_thread_switch_kernel(current);
+	ptrauth_enable();
 }
 
 #endif	/* _ASM_STACKPROTECTOR_H */
diff --git a/arch/arm64/kernel/head.S b/arch/arm64/kernel/head.S
index a0dc987724ed..83d3929e0e8b 100644
--- a/arch/arm64/kernel/head.S
+++ b/arch/arm64/kernel/head.S
@@ -404,10 +404,6 @@ SYM_FUNC_START_LOCAL(__primary_switched)
 	adr_l	x5, init_task
 	msr	sp_el0, x5			// Save thread_info
 
-#ifdef CONFIG_ARM64_PTR_AUTH
-	__ptrauth_keys_init_cpu	x5, x6, x7, x8
-#endif
-
 	adr_l	x8, vectors			// load VBAR_EL1 with virtual
 	msr	vbar_el1, x8			// vector table address
 	isb
-- 
2.7.4

