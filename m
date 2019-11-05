Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 513DDEF2B9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2019 02:29:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387504AbfKEB21 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Nov 2019 20:28:27 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:38346 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387452AbfKEB2U (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Nov 2019 20:28:20 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id F3BAB60FEC; Tue,  5 Nov 2019 01:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572917299;
        bh=nAewNjTRKzob1dg3c3v8ExIbGCO5+gQzAkrRlYWQXBk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=c1j/TOIs8ANqLL9UCiQZh14lf1o6b+Zx6FPawx30NPtSKCiM77wSkRBKl9LUcahd1
         qIzGlJigPzouRkmIoq3KlmRqH/+gOVVBa0Zv5VyA0NSTHLWev/AT85/f1c6FuXFul0
         XKwabNDCtXgatBd9WaJZKBOJmzg3I3h5Qqp2Aeu8=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from eberman-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: eberman@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C50DB60EE2;
        Tue,  5 Nov 2019 01:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572917280;
        bh=nAewNjTRKzob1dg3c3v8ExIbGCO5+gQzAkrRlYWQXBk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gyQgS+Lg9ie7xqePobR9PQeUEPHnTu00LLTHpncD0Jx5PUq9iapmmgtcIILyMt01i
         KLfUQ40F0lUIml+igjczJ9tDaJf9d6mRoByRWnmQTOl22coDIfc8I7MYAmYoyEg9mj
         CIoMgqZ0pAKx2ISn/XghM3V4fLkBHqrRBI+pjPfc=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C50DB60EE2
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=eberman@codeaurora.org
From:   Elliot Berman <eberman@codeaurora.org>
To:     bjorn.andersson@linaro.org, saiprakash.ranjan@codeaurora.org,
        agross@kernel.org
Cc:     tsoni@codeaurora.org, sidgup@codeaurora.org,
        psodagud@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Elliot Berman <eberman@codeaurora.org>
Subject: [PATCH 13/17] firmware: qcom_scm-32: Create common legacy atomic call
Date:   Mon,  4 Nov 2019 17:27:32 -0800
Message-Id: <1572917256-24205-14-git-send-email-eberman@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1572917256-24205-1-git-send-email-eberman@codeaurora.org>
References: <1572917256-24205-1-git-send-email-eberman@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Per [1], legacy calling convention supports up to 5 arguments and
3 return values. Create one function to support this combination.

[1]: https://source.codeaurora.org/quic/la/kernel/msm-4.9/tree/drivers/soc/qcom/scm.c?h=kernel.lnx.4.9.r28-rel#n1024

Signed-off-by: Elliot Berman <eberman@codeaurora.org>
---
 drivers/firmware/qcom_scm-32.c | 109 +++++++++++++++++++++++++----------------
 1 file changed, 67 insertions(+), 42 deletions(-)

diff --git a/drivers/firmware/qcom_scm-32.c b/drivers/firmware/qcom_scm-32.c
index 9811560..533c68a 100644
--- a/drivers/firmware/qcom_scm-32.c
+++ b/drivers/firmware/qcom_scm-32.c
@@ -257,6 +257,8 @@ static int qcom_scm_call(struct device *dev, struct qcom_scm_desc *desc)
 	return ret;
 }
 
+#define LEGACY_ATOMIC_N_REG_ARGS	5
+#define LEGACY_ATOMIC_FIRST_REG_IDX	2
 #define LEGACY_CLASS_REGISTER	(0x2 << 8)
 #define LEGACY_MASK_IRQS		BIT(5)
 #define LEGACY_ATOMIC(svc, cmd, n) ((LEGACY_FUNCNUM(svc, cmd) << 12) | \
@@ -265,52 +267,34 @@ static int qcom_scm_call(struct device *dev, struct qcom_scm_desc *desc)
 				    (n & 0xf))
 
 /**
- * qcom_scm_call_atomic1() - Send an atomic SCM command with one argument
- * @svc_id: service identifier
- * @cmd_id: command identifier
- * @arg1: first argument
+ * qcom_scm_call_atomic() - Send an atomic SCM command with up to 5 arguments
+ * and 3 return values
  *
  * This shall only be used with commands that are guaranteed to be
  * uninterruptable, atomic and SMP safe.
  */
-static s32 qcom_scm_call_atomic1(u32 svc, u32 cmd, u32 arg1)
+static int qcom_scm_call_atomic(struct qcom_scm_desc *desc)
 {
 	int context_id;
 	struct arm_smccc_args smc = {0};
 	struct arm_smccc_res res;
+	size_t i, arglen = desc->arginfo & 0xf;
 
-	smc.a[0] = LEGACY_ATOMIC(svc, cmd, 1);
-	smc.a[1] = (unsigned long)&context_id;
-	smc.a[2] = arg1;
-	arm_smccc_smc(smc.a[0], smc.a[1], smc.a[2], smc.a[3],
-		      smc.a[4], smc.a[5], smc.a[6], smc.a[7], &res);
+	BUG_ON(arglen > LEGACY_ATOMIC_N_REG_ARGS);
 
-	return res.a0;
-}
+	smc.a[0] = LEGACY_ATOMIC(desc->svc, desc->cmd, arglen);
+	smc.a[1] = (unsigned long)&context_id;
 
-/**
- * qcom_scm_call_atomic2() - Send an atomic SCM command with two arguments
- * @svc_id:	service identifier
- * @cmd_id:	command identifier
- * @arg1:	first argument
- * @arg2:	second argument
- *
- * This shall only be used with commands that are guaranteed to be
- * uninterruptable, atomic and SMP safe.
- */
-static s32 qcom_scm_call_atomic2(u32 svc, u32 cmd, u32 arg1, u32 arg2)
-{
-	int context_id;
-	struct arm_smccc_args smc = {0};
-	struct arm_smccc_res res;
+	for (i = 0; i < arglen; i++)
+		smc.a[i + LEGACY_ATOMIC_FIRST_REG_IDX] = desc->args[i];
 
-	smc.a[0] = LEGACY_ATOMIC(svc, cmd, 2);
-	smc.a[1] = (unsigned long)&context_id;
-	smc.a[2] = arg1;
-	smc.a[3] = arg2;
 	arm_smccc_smc(smc.a[0], smc.a[1], smc.a[2], smc.a[3],
 		      smc.a[4], smc.a[5], smc.a[6], smc.a[7], &res);
 
+	desc->res[0] = res.a1;
+	desc->res[1] = res.a2;
+	desc->res[2] = res.a3;
+
 	return res.a0;
 }
 
@@ -332,6 +316,11 @@ int __qcom_scm_set_cold_boot_addr(void *entry, const cpumask_t *cpus)
 		QCOM_SCM_FLAG_COLDBOOT_CPU2,
 		QCOM_SCM_FLAG_COLDBOOT_CPU3,
 	};
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_BOOT,
+		.cmd = QCOM_SCM_BOOT_SET_ADDR,
+		.owner = ARM_SMCCC_OWNER_SIP,
+	};
 
 	if (!cpus || (cpus && cpumask_empty(cpus)))
 		return -EINVAL;
@@ -343,8 +332,11 @@ int __qcom_scm_set_cold_boot_addr(void *entry, const cpumask_t *cpus)
 			set_cpu_present(cpu, false);
 	}
 
-	return qcom_scm_call_atomic2(QCOM_SCM_SVC_BOOT, QCOM_SCM_BOOT_SET_ADDR,
-				    flags, virt_to_phys(entry));
+	desc.args[0] = flags;
+	desc.args[1] = virt_to_phys(entry);
+	desc.arginfo = QCOM_SCM_ARGS(2);
+
+	return qcom_scm_call_atomic(&desc);
 }
 
 /**
@@ -402,8 +394,15 @@ int __qcom_scm_set_warm_boot_addr(struct device *dev, void *entry,
  */
 void __qcom_scm_cpu_power_down(u32 flags)
 {
-	qcom_scm_call_atomic1(QCOM_SCM_SVC_BOOT, QCOM_SCM_BOOT_TERMINATE_PC,
-			flags & QCOM_SCM_FLUSH_FLAG_MASK);
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_BOOT,
+		.cmd = QCOM_SCM_BOOT_TERMINATE_PC,
+		.args[0] = flags & QCOM_SCM_FLUSH_FLAG_MASK,
+		.arginfo = QCOM_SCM_ARGS(1),
+		.owner = ARM_SMCCC_OWNER_SIP,
+	};
+
+	qcom_scm_call_atomic(&desc);
 }
 
 int __qcom_scm_set_remote_state(struct device *dev, u32 state, u32 id)
@@ -426,8 +425,17 @@ int __qcom_scm_set_remote_state(struct device *dev, u32 state, u32 id)
 
 int __qcom_scm_set_dload_mode(struct device *dev, bool enable)
 {
-	return qcom_scm_call_atomic2(QCOM_SCM_SVC_BOOT, QCOM_SCM_BOOT_SET_DLOAD_MODE,
-				     enable ? QCOM_SCM_BOOT_SET_DLOAD_MODE : 0, 0);
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_BOOT,
+		.cmd = QCOM_SCM_BOOT_SET_DLOAD_MODE,
+		.owner = ARM_SMCCC_OWNER_SIP,
+	};
+
+	desc.args[0] = QCOM_SCM_BOOT_SET_DLOAD_MODE;
+	desc.args[1] = enable ? QCOM_SCM_BOOT_SET_DLOAD_MODE : 0;
+	desc.arginfo = QCOM_SCM_ARGS(2);
+
+	return qcom_scm_call_atomic(&desc);
 }
 
 bool __qcom_scm_pas_supported(struct device *dev, u32 peripheral)
@@ -539,18 +547,35 @@ int __qcom_scm_io_readl(struct device *dev, phys_addr_t addr,
 			unsigned int *val)
 {
 	int ret;
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_IO,
+		.cmd = QCOM_SCM_IO_READ,
+		.owner = ARM_SMCCC_OWNER_SIP,
+	};
 
-	ret = qcom_scm_call_atomic1(QCOM_SCM_SVC_IO, QCOM_SCM_IO_READ, addr);
+	desc.args[0] = addr;
+	desc.arginfo = QCOM_SCM_ARGS(1);
+
+	ret = qcom_scm_call_atomic(&desc);
 	if (ret >= 0)
-		*val = ret;
+		*val = desc.res[0];
 
 	return ret < 0 ? ret : 0;
 }
 
 int __qcom_scm_io_writel(struct device *dev, phys_addr_t addr, unsigned int val)
 {
-	return qcom_scm_call_atomic2(QCOM_SCM_SVC_IO, QCOM_SCM_IO_WRITE,
-				     addr, val);
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_IO,
+		.cmd = QCOM_SCM_IO_WRITE,
+		.owner = ARM_SMCCC_OWNER_SIP,
+	};
+
+	desc.args[0] = addr;
+	desc.args[1] = val;
+	desc.arginfo = QCOM_SCM_ARGS(2);
+
+	return qcom_scm_call_atomic(&desc);
 }
 
 int __qcom_scm_is_call_available(struct device *dev, u32 svc_id, u32 cmd_id)
@@ -631,4 +656,4 @@ int __qcom_scm_qsmmu500_wait_safe_toggle(struct device *dev, bool enable)
 
 void __qcom_scm_init(void)
 {
-}
\ No newline at end of file
+}
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

