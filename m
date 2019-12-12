Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B452F11D5C8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2019 19:37:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730537AbfLLShP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Dec 2019 13:37:15 -0500
Received: from a27-11.smtp-out.us-west-2.amazonses.com ([54.240.27.11]:43896
        "EHLO a27-11.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730527AbfLLShP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Dec 2019 13:37:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1576175834;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        bh=MirJA0v7lGICf52JDfcFqU6v/FyaNOnqWSn0MPZGtMw=;
        b=Gu3PSwupaLaoo3LV1qlxTsUjAzNmUFkQTSG6RGtfBHOQB9rbGn+U6Y7N1RR1iU7H
        6YGbR0egqPFzxFvlXXvVhaaLzhwmkRlCAFhyagd81L9Y+ozxM4vycXN7qQWDUyyZERQ
        gjS6uty24ifnSwAbLgg9BnewQQkePN4yUm2HBH8c=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1576175834;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:Feedback-ID;
        bh=MirJA0v7lGICf52JDfcFqU6v/FyaNOnqWSn0MPZGtMw=;
        b=AIWnW6eaBh9q0nCUuG2sV4k2DZBP+UdXZSqoCRk7nIUN/NyHe9Lwj+Jgfr1w3ln9
        iiArJrFer8hAyk0vFReokaHGl5U9hoAXPK9tGtvPXsnYrQEkmyU8213HG5CTewyvGKQ
        cjvNQLgRRqLLKBB11i5Jc1O9OG13R9HnCIaL+HTE=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 04AB2C447A0
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=eberman@codeaurora.org
From:   Elliot Berman <eberman@codeaurora.org>
To:     bjorn.anderssen@linaro.org, saiprakash.ranjan@codeaurora.org,
        agross@kernel.org, swboyd@chromium.org
Cc:     Elliot Berman <eberman@codeaurora.org>, tsoni@codeaurora.org,
        sidgup@codeaurora.org, psodagud@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 17/17] firmware: qcom_scm: Dynamically support SMCCC and legacy conventions
Date:   Thu, 12 Dec 2019 18:37:13 +0000
Message-ID: <0101016efb6692ea-c876e531-003b-4062-a5fa-0fbe8b69339f-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1576175807-11775-1-git-send-email-eberman@codeaurora.org>
References: <1576175807-11775-1-git-send-email-eberman@codeaurora.org>
X-SES-Outgoing: 2019.12.12-54.240.27.11
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Dynamically support SMCCCC and legacy conventions by detecting which
convention to use at runtime. qcom_scm_call_atomic and qcom_scm_call can
then be moved in qcom_scm.c and use underlying convention backend as
appropriate. Thus, rename qcom_scm-64,-32 to reflect that they are
backends for -smc and -legacy, respectively.

Also add support for making SCM calls earlier than when SCM driver
probes to support use cases such as qcom_scm_set_cold_boot_addr. Support
is added by lazily initializing the convention and guarding the query
with a spin lock.  The limitation of these early SCM calls is that they
cannot use DMA, as in the case of >4 arguments for SMC convention and
any non-atomic call for legacy convention.

Signed-off-by: Elliot Berman <eberman@codeaurora.org>
---
 drivers/firmware/Kconfig                           |   8 --
 drivers/firmware/Makefile                          |   4 +-
 .../firmware/{qcom_scm-32.c => qcom_scm-legacy.c}  |  31 +----
 drivers/firmware/{qcom_scm-64.c => qcom_scm-smc.c} |  95 +-------------
 drivers/firmware/qcom_scm.c                        | 146 ++++++++++++++++++++-
 drivers/firmware/qcom_scm.h                        |  27 +++-
 6 files changed, 176 insertions(+), 135 deletions(-)
 rename drivers/firmware/{qcom_scm-32.c => qcom_scm-legacy.c} (90%)
 rename drivers/firmware/{qcom_scm-64.c => qcom_scm-smc.c} (57%)

diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
index e40a77b..ea869ad 100644
--- a/drivers/firmware/Kconfig
+++ b/drivers/firmware/Kconfig
@@ -239,14 +239,6 @@ config QCOM_SCM
 	depends on ARM || ARM64
 	select RESET_CONTROLLER
 
-config QCOM_SCM_32
-	def_bool y
-	depends on QCOM_SCM && ARM
-
-config QCOM_SCM_64
-	def_bool y
-	depends on QCOM_SCM && ARM64
-
 config QCOM_SCM_DOWNLOAD_MODE_DEFAULT
 	bool "Qualcomm download mode enabled by default"
 	depends on QCOM_SCM
diff --git a/drivers/firmware/Makefile b/drivers/firmware/Makefile
index 747fb73..e9fb838 100644
--- a/drivers/firmware/Makefile
+++ b/drivers/firmware/Makefile
@@ -17,9 +17,7 @@ obj-$(CONFIG_ISCSI_IBFT)	+= iscsi_ibft.o
 obj-$(CONFIG_FIRMWARE_MEMMAP)	+= memmap.o
 obj-$(CONFIG_RASPBERRYPI_FIRMWARE) += raspberrypi.o
 obj-$(CONFIG_FW_CFG_SYSFS)	+= qemu_fw_cfg.o
-obj-$(CONFIG_QCOM_SCM)		+= qcom_scm.o
-obj-$(CONFIG_QCOM_SCM_64)	+= qcom_scm-64.o
-obj-$(CONFIG_QCOM_SCM_32)	+= qcom_scm-32.o
+obj-$(CONFIG_QCOM_SCM)		+= qcom_scm.o qcom_scm-smc.o qcom_scm-legacy.o
 obj-$(CONFIG_TI_SCI_PROTOCOL)	+= ti_sci.o
 obj-$(CONFIG_TRUSTED_FOUNDATIONS) += trusted_foundations.o
 obj-$(CONFIG_TURRIS_MOX_RWTM)	+= turris-mox-rwtm.o
diff --git a/drivers/firmware/qcom_scm-32.c b/drivers/firmware/qcom_scm-legacy.c
similarity index 90%
rename from drivers/firmware/qcom_scm-32.c
rename to drivers/firmware/qcom_scm-legacy.c
index 08220e7..8532e7c 100644
--- a/drivers/firmware/qcom_scm-32.c
+++ b/drivers/firmware/qcom_scm-legacy.c
@@ -26,7 +26,6 @@ struct arm_smccc_args {
 	unsigned long args[8];
 };
 
-#define SCM_LEGACY_FNID(s, c)	(((s) << 10) | ((c) & 0x3ff))
 
 /**
  * struct scm_legacy_command - one SCM command buffer
@@ -129,8 +128,8 @@ static void __scm_legacy_do(const struct arm_smccc_args *smc,
  * and response buffers is taken care of by qcom_scm_call; however, callers are
  * responsible for any other cached buffers passed over to the secure world.
  */
-int qcom_scm_call(struct device *dev, const struct qcom_scm_desc *desc,
-			 struct qcom_scm_res *res)
+int scm_legacy_call(struct device *dev, const struct qcom_scm_desc *desc,
+		    struct qcom_scm_res *res)
 {
 	u8 arglen = desc->arginfo & 0xf;
 	int ret = 0, context_id;
@@ -218,9 +217,9 @@ int qcom_scm_call(struct device *dev, const struct qcom_scm_desc *desc,
  * This shall only be used with commands that are guaranteed to be
  * uninterruptable, atomic and SMP safe.
  */
-int qcom_scm_call_atomic(struct device *unused,
-			 const struct qcom_scm_desc *desc,
-			 struct qcom_scm_res *res)
+int scm_legacy_call_atomic(struct device *unused,
+			   const struct qcom_scm_desc *desc,
+			   struct qcom_scm_res *res)
 {
 	int context_id;
 	struct arm_smccc_res smc_res;
@@ -241,23 +240,3 @@ int qcom_scm_call_atomic(struct device *unused,
 
 	return smc_res.a0;
 }
-
-int __qcom_scm_is_call_available(struct device *dev, u32 svc_id, u32 cmd_id)
-{
-	int ret;
-	struct qcom_scm_desc desc = {
-		.svc = QCOM_SCM_SVC_INFO,
-		.cmd = QCOM_SCM_INFO_IS_CALL_AVAIL,
-		.args[0] = SCM_LEGACY_FNID(svc_id, cmd_id),
-		.arginfo = QCOM_SCM_ARGS(1),
-	};
-	struct qcom_scm_res res;
-
-	ret = qcom_scm_call(dev, &desc, &res);
-
-	return ret ? : res.result[0];
-}
-
-void __qcom_scm_init(void)
-{
-}
diff --git a/drivers/firmware/qcom_scm-64.c b/drivers/firmware/qcom_scm-smc.c
similarity index 57%
rename from drivers/firmware/qcom_scm-64.c
rename to drivers/firmware/qcom_scm-smc.c
index 4defc7c..497c13b 100644
--- a/drivers/firmware/qcom_scm-64.c
+++ b/drivers/firmware/qcom_scm-smc.c
@@ -14,8 +14,6 @@
 
 #include "qcom_scm.h"
 
-#define SCM_SMC_FNID(s, c) ((((s) & 0xFF) << 8) | ((c) & 0xFF))
-
 /**
  * struct arm_smccc_args
  * @args:	The array of values used in registers in smc instruction
@@ -24,7 +22,6 @@ struct arm_smccc_args {
 	unsigned long args[8];
 };
 
-static u64 qcom_smccc_convention = -1;
 static DEFINE_MUTEX(qcom_scm_lock);
 
 #define QCOM_SCM_EBUSY_WAIT_MS 30
@@ -80,8 +77,8 @@ static void __scm_smc_do(const struct arm_smccc_args *smc,
 	}  while (res->a0 == QCOM_SCM_V2_EBUSY);
 }
 
-static int __scm_smc_call(struct device *dev, const struct qcom_scm_desc *desc,
-			  struct qcom_scm_res *res, bool atomic)
+int scm_smc_call(struct device *dev, const struct qcom_scm_desc *desc,
+		 struct qcom_scm_res *res, bool atomic)
 {
 	int arglen = desc->arginfo & 0xf;
 	int i;
@@ -90,6 +87,9 @@ static int __scm_smc_call(struct device *dev, const struct qcom_scm_desc *desc,
 	size_t alloc_len;
 	gfp_t flag = atomic ? GFP_ATOMIC : GFP_KERNEL;
 	u32 smccc_call_type = atomic ? ARM_SMCCC_FAST_CALL : ARM_SMCCC_STD_CALL;
+	u32 qcom_smccc_convention =
+			(qcom_scm_convention == SMC_CONVENTION_ARM_32) ?
+			ARM_SMCCC_SMC_32 : ARM_SMCCC_SMC_64;
 	struct arm_smccc_res smc_res;
 	struct arm_smccc_args smc = {0};
 
@@ -149,88 +149,3 @@ static int __scm_smc_call(struct device *dev, const struct qcom_scm_desc *desc,
 
 	return (long)smc_res.a0 ? qcom_scm_remap_error(smc_res.a0) : 0;
 }
-
-/**
- * qcom_scm_call() - Invoke a syscall in the secure world
- * @dev:	device
- * @svc_id:	service identifier
- * @cmd_id:	command identifier
- * @desc:	Descriptor structure containing arguments and return values
- *
- * Sends a command to the SCM and waits for the command to finish processing.
- * This should *only* be called in pre-emptible context.
- */
-int qcom_scm_call(struct device *dev, const struct qcom_scm_desc *desc,
-		  struct qcom_scm_res *res)
-{
-	might_sleep();
-	return __scm_smc_call(dev, desc, res, false);
-}
-
-/**
- * qcom_scm_call_atomic() - atomic variation of qcom_scm_call()
- * @dev:	device
- * @svc_id:	service identifier
- * @cmd_id:	command identifier
- * @desc:	Descriptor structure containing arguments and return values
- * @res:	Structure containing results from SMC/HVC call
- *
- * Sends a command to the SCM and waits for the command to finish processing.
- * This can be called in atomic context.
- */
-int qcom_scm_call_atomic(struct device *dev, const struct qcom_scm_desc *desc,
-			 struct qcom_scm_res *res)
-{
-	return __scm_smc_call(dev, desc, res, true);
-}
-
-int __qcom_scm_is_call_available(struct device *dev, u32 svc_id, u32 cmd_id)
-{
-	int ret;
-	struct qcom_scm_desc desc = {
-		.svc = QCOM_SCM_SVC_INFO,
-		.cmd = QCOM_SCM_INFO_IS_CALL_AVAIL,
-		.owner = ARM_SMCCC_OWNER_SIP,
-	};
-	struct qcom_scm_res res;
-
-	desc.arginfo = QCOM_SCM_ARGS(1);
-	desc.args[0] = SCM_SMC_FNID(svc_id, cmd_id) |
-			(ARM_SMCCC_OWNER_SIP << ARM_SMCCC_OWNER_SHIFT);
-
-	ret = qcom_scm_call(dev, &desc, &res);
-
-	return ret ? : res.result[0];
-}
-
-void __qcom_scm_init(void)
-{
-	struct qcom_scm_desc desc = {
-		.svc = QCOM_SCM_SVC_INFO,
-		.cmd = QCOM_SCM_INFO_IS_CALL_AVAIL,
-		.args[0] = SCM_SMC_FNID(QCOM_SCM_SVC_INFO,
-					QCOM_SCM_INFO_IS_CALL_AVAIL) |
-			   (ARM_SMCCC_OWNER_SIP << ARM_SMCCC_OWNER_SHIFT),
-		.arginfo = QCOM_SCM_ARGS(1),
-		.owner = ARM_SMCCC_OWNER_SIP,
-	};
-	struct qcom_scm_res res;
-	int ret;
-
-	qcom_smccc_convention = ARM_SMCCC_SMC_64;
-	// Device isn't required as there is only one argument - no device
-	// needed to dma_map_single to secure world
-	ret = qcom_scm_call_atomic(NULL, &desc, &res);
-	if (!ret && res.result[0] == 1)
-		goto out;
-
-	qcom_smccc_convention = ARM_SMCCC_SMC_32;
-	ret = qcom_scm_call_atomic(NULL, &desc, &res);
-	if (!ret && res.result[0] == 1)
-		goto out;
-
-	qcom_smccc_convention = -1;
-	BUG();
-out:
-	pr_info("QCOM SCM SMC Convention: %lld\n", qcom_smccc_convention);
-}
diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
index b29e6c1..77da9e6 100644
--- a/drivers/firmware/qcom_scm.c
+++ b/drivers/firmware/qcom_scm.c
@@ -72,6 +72,13 @@ static struct qcom_scm_wb_entry qcom_scm_wb[] = {
 	{ .flag = QCOM_SCM_FLAG_WARMBOOT_CPU3 },
 };
 
+static const char *qcom_scm_convention_names[] = {
+	[SMC_CONVENTION_UNKNOWN] = "unknown",
+	[SMC_CONVENTION_ARM_32] = "smc arm 32",
+	[SMC_CONVENTION_ARM_64] = "smc arm 64",
+	[SMC_CONVENTION_LEGACY] = "smc legacy",
+};
+
 static struct qcom_scm *__scm;
 
 static int qcom_scm_clk_enable(void)
@@ -107,6 +114,143 @@ static void qcom_scm_clk_disable(void)
 	clk_disable_unprepare(__scm->bus_clk);
 }
 
+static int __qcom_scm_is_call_available(struct device *dev, u32 svc_id,
+					u32 cmd_id);
+
+enum qcom_scm_convention qcom_scm_convention;
+static bool has_queried __read_mostly;
+static DEFINE_SPINLOCK(query_lock);
+
+static void __query_convention(void)
+{
+	unsigned long flags;
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_INFO,
+		.cmd = QCOM_SCM_INFO_IS_CALL_AVAIL,
+		.args[0] = SCM_SMC_FNID(QCOM_SCM_SVC_INFO,
+					   QCOM_SCM_INFO_IS_CALL_AVAIL) |
+			   (ARM_SMCCC_OWNER_SIP << ARM_SMCCC_OWNER_SHIFT),
+		.arginfo = QCOM_SCM_ARGS(1),
+		.owner = ARM_SMCCC_OWNER_SIP,
+	};
+	struct qcom_scm_res res;
+	int ret;
+
+	spin_lock_irqsave(&query_lock, flags);
+	if (has_queried)
+		goto out;
+
+	qcom_scm_convention = SMC_CONVENTION_ARM_64;
+	// Device isn't required as there is only one argument - no device
+	// needed to dma_map_single to secure world
+	ret = scm_smc_call(NULL, &desc, &res, true);
+	if (!ret && res.result[0] == 1)
+		goto out;
+
+	qcom_scm_convention = SMC_CONVENTION_ARM_32;
+	ret = scm_smc_call(NULL, &desc, &res, true);
+	if (!ret && res.result[0] == 1)
+		goto out;
+
+	qcom_scm_convention = SMC_CONVENTION_LEGACY;
+out:
+	has_queried = true;
+	spin_unlock_irqrestore(&query_lock, flags);
+	pr_info("qcom_scm: convention: %s\n",
+		qcom_scm_convention_names[qcom_scm_convention]);
+}
+
+static inline enum qcom_scm_convention __get_convention(void)
+{
+	if (unlikely(!has_queried))
+		__query_convention();
+	return qcom_scm_convention;
+}
+
+/**
+ * qcom_scm_call() - Invoke a syscall in the secure world
+ * @dev:	device
+ * @svc_id:	service identifier
+ * @cmd_id:	command identifier
+ * @desc:	Descriptor structure containing arguments and return values
+ *
+ * Sends a command to the SCM and waits for the command to finish processing.
+ * This should *only* be called in pre-emptible context.
+ */
+static int qcom_scm_call(struct device *dev, const struct qcom_scm_desc *desc,
+			 struct qcom_scm_res *res)
+{
+	might_sleep();
+	switch (__get_convention()) {
+	case SMC_CONVENTION_ARM_32:
+	case SMC_CONVENTION_ARM_64:
+		return scm_smc_call(dev, desc, res, false);
+	case SMC_CONVENTION_LEGACY:
+		return scm_legacy_call(dev, desc, res);
+	default:
+		pr_err("Unknown current SCM calling convention.\n");
+		return -EINVAL;
+	}
+}
+
+/**
+ * qcom_scm_call_atomic() - atomic variation of qcom_scm_call()
+ * @dev:	device
+ * @svc_id:	service identifier
+ * @cmd_id:	command identifier
+ * @desc:	Descriptor structure containing arguments and return values
+ * @res:	Structure containing results from SMC/HVC call
+ *
+ * Sends a command to the SCM and waits for the command to finish processing.
+ * This can be called in atomic context.
+ */
+static int qcom_scm_call_atomic(struct device *dev,
+				const struct qcom_scm_desc *desc,
+				struct qcom_scm_res *res)
+{
+	switch (__get_convention()) {
+	case SMC_CONVENTION_ARM_32:
+	case SMC_CONVENTION_ARM_64:
+		return scm_smc_call(dev, desc, res, true);
+	case SMC_CONVENTION_LEGACY:
+		return scm_legacy_call_atomic(dev, desc, res);
+	default:
+		pr_err("Unknown current SCM calling convention.\n");
+		return -EINVAL;
+	}
+}
+
+static int __qcom_scm_is_call_available(struct device *dev, u32 svc_id,
+					u32 cmd_id)
+{
+	int ret;
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_INFO,
+		.cmd = QCOM_SCM_INFO_IS_CALL_AVAIL,
+		.owner = ARM_SMCCC_OWNER_SIP,
+	};
+	struct qcom_scm_res res;
+
+	desc.arginfo = QCOM_SCM_ARGS(1);
+	switch (__get_convention()) {
+	case SMC_CONVENTION_ARM_32:
+	case SMC_CONVENTION_ARM_64:
+		desc.args[0] = SCM_SMC_FNID(svc_id, cmd_id) |
+				(ARM_SMCCC_OWNER_SIP << ARM_SMCCC_OWNER_SHIFT);
+		break;
+	case SMC_CONVENTION_LEGACY:
+		desc.args[0] = SCM_LEGACY_FNID(svc_id, cmd_id);
+		break;
+	default:
+		pr_err("Unknown SMC convention being used\n");
+		return -EINVAL;
+	}
+
+	ret = qcom_scm_call(dev, &desc, &res);
+
+	return ret ? : res.result[0];
+}
+
 /**
  * qcom_scm_set_warm_boot_addr() - Set the warm boot address for cpus
  * @entry: Entry point function for the cpus
@@ -969,7 +1113,7 @@ static int qcom_scm_probe(struct platform_device *pdev)
 	__scm = scm;
 	__scm->dev = &pdev->dev;
 
-	__qcom_scm_init();
+	__query_convention();
 
 	/*
 	 * If requested enable "download mode", from this point on warmboot
diff --git a/drivers/firmware/qcom_scm.h b/drivers/firmware/qcom_scm.h
index 9b7b357..d9ed670 100644
--- a/drivers/firmware/qcom_scm.h
+++ b/drivers/firmware/qcom_scm.h
@@ -3,6 +3,16 @@
  */
 #ifndef __QCOM_SCM_INT_H
 #define __QCOM_SCM_INT_H
+
+enum qcom_scm_convention {
+	SMC_CONVENTION_UNKNOWN,
+	SMC_CONVENTION_LEGACY,
+	SMC_CONVENTION_ARM_32,
+	SMC_CONVENTION_ARM_64,
+};
+
+extern enum qcom_scm_convention qcom_scm_convention;
+
 #define MAX_QCOM_SCM_ARGS 10
 #define MAX_QCOM_SCM_RETS 3
 
@@ -50,11 +60,16 @@ struct qcom_scm_res {
 	u64 result[MAX_QCOM_SCM_RETS];
 };
 
-extern int qcom_scm_call(struct device *dev, const struct qcom_scm_desc *desc,
-			 struct qcom_scm_res *res);
-extern int qcom_scm_call_atomic(struct device *dev,
-				const struct qcom_scm_desc *desc,
-				struct qcom_scm_res *res);
+#define SCM_SMC_FNID(s, c)	((((s) & 0xFF) << 8) | ((c) & 0xFF))
+extern int scm_smc_call(struct device *dev, const struct qcom_scm_desc *desc,
+			struct qcom_scm_res *res, bool atomic);
+
+#define SCM_LEGACY_FNID(s, c)	(((s) << 10) | ((c) & 0x3ff))
+extern int scm_legacy_call_atomic(struct device *dev,
+				  const struct qcom_scm_desc *desc,
+				  struct qcom_scm_res *res);
+extern int scm_legacy_call(struct device *dev, const struct qcom_scm_desc *desc,
+			   struct qcom_scm_res *res);
 
 #define QCOM_SCM_SVC_BOOT		0x01
 #define QCOM_SCM_BOOT_SET_ADDR		0x01
@@ -77,8 +92,6 @@ extern int qcom_scm_call_atomic(struct device *dev,
 
 #define QCOM_SCM_SVC_INFO		0x06
 #define QCOM_SCM_INFO_IS_CALL_AVAIL	0x01
-extern int __qcom_scm_is_call_available(struct device *dev, u32 svc_id,
-		u32 cmd_id);
 
 #define QCOM_SCM_SVC_MP				0x0c
 #define QCOM_SCM_MP_RESTORE_SEC_CFG		0x02
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

