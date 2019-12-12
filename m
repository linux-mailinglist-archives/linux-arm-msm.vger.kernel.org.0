Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7901811D656
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2019 19:52:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730546AbfLLSvz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Dec 2019 13:51:55 -0500
Received: from a27-185.smtp-out.us-west-2.amazonses.com ([54.240.27.185]:42822
        "EHLO a27-185.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730641AbfLLSvS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Dec 2019 13:51:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1576176677;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        bh=q3YgpMIFWM1yKjUq3MGxnQcA1EmaiJlWf1YaV+tco5Y=;
        b=o/8urKJ7d90+rWrxYlL8QaOV6lXtfnhruXo4p7ruqlXZh8x4elgj+6czEaF6Grhj
        b3J/iH7Wb06IvkiSyNXhNrTRwB14rzC2kWylkQXbqIwXdX/JX/lCWaN2ffPbi+eqxjL
        g1tf+aBiRlMTQIgcUURipxRH5emx8Ro/iStICkgU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1576176677;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:Feedback-ID;
        bh=q3YgpMIFWM1yKjUq3MGxnQcA1EmaiJlWf1YaV+tco5Y=;
        b=PAa+DV74lq4/OmJBP18CC9DKpHq8+qzX45MTuu8jPZoCq+9DVoWXgFI4Axwly8YO
        3F4iB2w5BXHqPErCe+xi4+2k1PWwJnAg4drj9cizn22a3vUos9ju6/pDDu3X67cfZB2
        vvOTFqD4kVQAGXUBb4lW9BzY4shscuX03LDFYBdk=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7E462C4479C
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=eberman@codeaurora.org
From:   Elliot Berman <eberman@codeaurora.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org, swboyd@chromium.org
Cc:     Elliot Berman <eberman@codeaurora.org>,
        saiprakash.ranjan@codeaurora.org, tsoni@codeaurora.org,
        sidgup@codeaurora.org, psodagud@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 13/17] firmware: qcom_scm-32: Create common legacy atomic call
Date:   Thu, 12 Dec 2019 18:51:17 +0000
Message-ID: <0101016efb7371ab-53502247-3832-4caf-a960-317cf35ad109-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1576176651-17089-1-git-send-email-eberman@codeaurora.org>
References: <1576176651-17089-1-git-send-email-eberman@codeaurora.org>
X-SES-Outgoing: 2019.12.12-54.240.27.185
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Per [1], legacy calling convention supports up to 5 arguments and 3
return values. Create one function to support this combination, and
remove the original "atomic1" and "atomic2" variants for 1 and 2
arguments. This more closely aligns scm_legacy implementation with
scm_smc implementation.

[1]: https://source.codeaurora.org/quic/la/kernel/msm-4.9/tree/drivers/soc/qcom/scm.c?h=kernel.lnx.4.9.r28-rel#n1024

Signed-off-by: Elliot Berman <eberman@codeaurora.org>
---
 drivers/firmware/qcom_scm-32.c | 106 ++++++++++++++++++++++++++---------------
 1 file changed, 68 insertions(+), 38 deletions(-)

diff --git a/drivers/firmware/qcom_scm-32.c b/drivers/firmware/qcom_scm-32.c
index acd956f..9729a8a 100644
--- a/drivers/firmware/qcom_scm-32.c
+++ b/drivers/firmware/qcom_scm-32.c
@@ -266,6 +266,8 @@ static int qcom_scm_call(struct device *dev, const struct qcom_scm_desc *desc,
 	return ret;
 }
 
+#define SCM_LEGACY_ATOMIC_N_REG_ARGS	5
+#define SCM_LEGACY_ATOMIC_FIRST_REG_IDX	2
 #define SCM_LEGACY_CLASS_REGISTER		(0x2 << 8)
 #define SCM_LEGACY_MASK_IRQS		BIT(5)
 #define SCM_LEGACY_ATOMIC_ID(svc, cmd, n) \
@@ -275,44 +277,35 @@ static int qcom_scm_call(struct device *dev, const struct qcom_scm_desc *desc,
 				(n & 0xf))
 
 /**
- * qcom_scm_call_atomic1() - Send an atomic SCM command with one argument
- * @svc_id: service identifier
- * @cmd_id: command identifier
- * @arg1: first argument
+ * qcom_scm_call_atomic() - Send an atomic SCM command with up to 5 arguments
+ * and 3 return values
+ * @desc: SCM call descriptor containing arguments
+ * @res:  SCM call return values
  *
  * This shall only be used with commands that are guaranteed to be
  * uninterruptable, atomic and SMP safe.
  */
-static s32 qcom_scm_call_atomic1(u32 svc, u32 cmd, u32 arg1)
+static int qcom_scm_call_atomic(const struct qcom_scm_desc *desc,
+				struct qcom_scm_res *res)
 {
 	int context_id;
-	struct arm_smccc_res res;
+	struct arm_smccc_res smc_res;
+	size_t arglen = desc->arginfo & 0xf;
 
-	arm_smccc_smc(SCM_LEGACY_ATOMIC_ID(svc, cmd, 1),
-		      (unsigned long)&context_id, arg1, 0, 0, 0, 0, 0, &res);
+	BUG_ON(arglen > SCM_LEGACY_ATOMIC_N_REG_ARGS);
 
-	return res.a0;
-}
+	arm_smccc_smc(SCM_LEGACY_ATOMIC_ID(desc->svc, desc->cmd, arglen),
+		      (unsigned long)&context_id,
+		      desc->args[0], desc->args[1], desc->args[2],
+		      desc->args[3], desc->args[4], 0, &smc_res);
 
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
-	struct arm_smccc_res res;
-
-	arm_smccc_smc(SCM_LEGACY_ATOMIC_ID(svc, cmd, 2),
-		      (unsigned long)&context_id, arg1, 0, 0, 0, 0, 0, &res);
+	if (res) {
+		res->result[0] = smc_res.a1;
+		res->result[1] = smc_res.a2;
+		res->result[2] = smc_res.a3;
+	}
 
-	return res.a0;
+	return smc_res.a0;
 }
 
 /**
@@ -333,6 +326,10 @@ int __qcom_scm_set_cold_boot_addr(void *entry, const cpumask_t *cpus)
 		QCOM_SCM_FLAG_COLDBOOT_CPU2,
 		QCOM_SCM_FLAG_COLDBOOT_CPU3,
 	};
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_BOOT,
+		.cmd = QCOM_SCM_BOOT_SET_ADDR,
+	};
 
 	if (!cpus || (cpus && cpumask_empty(cpus)))
 		return -EINVAL;
@@ -344,8 +341,11 @@ int __qcom_scm_set_cold_boot_addr(void *entry, const cpumask_t *cpus)
 			set_cpu_present(cpu, false);
 	}
 
-	return qcom_scm_call_atomic2(QCOM_SCM_SVC_BOOT, QCOM_SCM_BOOT_SET_ADDR,
-				    flags, virt_to_phys(entry));
+	desc.args[0] = flags;
+	desc.args[1] = virt_to_phys(entry);
+	desc.arginfo = QCOM_SCM_ARGS(2);
+
+	return qcom_scm_call_atomic(&desc, NULL);
 }
 
 /**
@@ -404,8 +404,14 @@ int __qcom_scm_set_warm_boot_addr(struct device *dev, void *entry,
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
+	};
+
+	qcom_scm_call_atomic(&desc, NULL);
 }
 
 int __qcom_scm_is_call_available(struct device *dev, u32 svc_id, u32 cmd_id)
@@ -601,8 +607,16 @@ int __qcom_scm_pas_mss_reset(struct device *dev, bool reset)
 
 int __qcom_scm_set_dload_mode(struct device *dev, bool enable)
 {
-	return qcom_scm_call_atomic2(QCOM_SCM_SVC_BOOT, QCOM_SCM_BOOT_SET_DLOAD_MODE,
-				     enable ? QCOM_SCM_BOOT_SET_DLOAD_MODE : 0, 0);
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_BOOT,
+		.cmd = QCOM_SCM_BOOT_SET_DLOAD_MODE,
+	};
+
+	desc.args[0] = QCOM_SCM_BOOT_SET_DLOAD_MODE;
+	desc.args[1] = enable ? QCOM_SCM_BOOT_SET_DLOAD_MODE : 0;
+	desc.arginfo = QCOM_SCM_ARGS(2);
+
+	return qcom_scm_call_atomic(&desc, NULL);
 }
 
 int __qcom_scm_set_remote_state(struct device *dev, u32 state, u32 id)
@@ -664,18 +678,34 @@ int __qcom_scm_io_readl(struct device *dev, phys_addr_t addr,
 			unsigned int *val)
 {
 	int ret;
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_IO,
+		.cmd = QCOM_SCM_IO_READ,
+	};
+	struct qcom_scm_res res;
+
+	desc.args[0] = addr;
+	desc.arginfo = QCOM_SCM_ARGS(1);
 
-	ret = qcom_scm_call_atomic1(QCOM_SCM_SVC_IO, QCOM_SCM_IO_READ, addr);
+	ret = qcom_scm_call_atomic(&desc, &res);
 	if (ret >= 0)
-		*val = ret;
+		*val = res.result[0];
 
 	return ret < 0 ? ret : 0;
 }
 
 int __qcom_scm_io_writel(struct device *dev, phys_addr_t addr, unsigned int val)
 {
-	return qcom_scm_call_atomic2(QCOM_SCM_SVC_IO, QCOM_SCM_IO_WRITE,
-				     addr, val);
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_IO,
+		.cmd = QCOM_SCM_IO_WRITE,
+	};
+
+	desc.args[0] = addr;
+	desc.args[1] = val;
+	desc.arginfo = QCOM_SCM_ARGS(2);
+
+	return qcom_scm_call_atomic(&desc, NULL);
 }
 
 int __qcom_scm_qsmmu500_wait_safe_toggle(struct device *dev, bool enable)
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

