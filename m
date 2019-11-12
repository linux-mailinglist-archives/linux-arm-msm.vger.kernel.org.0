Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C52CF9C1C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2019 22:23:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727529AbfKLVXt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Nov 2019 16:23:49 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:39724 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727558AbfKLVXl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Nov 2019 16:23:41 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 68F5360E41; Tue, 12 Nov 2019 21:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573593820;
        bh=3ShVWlPxHy6AL9JZ69PAjwpmkYBqKlOzEw16PWYc5DE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=QYaAFodGMISQJj21yscIt4Ue65RwZfPIh936ZDI50o0tJG6x3071GWOO7J82dsjtM
         PoV0XmCY7T6a8yfxyFxMtgtxH9yDmbseOt7goGsYlWdNuuD/CMGDwgFUxI1Xt54vCK
         t9jjrRYEd/x3qT7DjJ9Lq4XplWfgTXN01Ntog0zw=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C18E460E3C;
        Tue, 12 Nov 2019 21:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573593801;
        bh=3ShVWlPxHy6AL9JZ69PAjwpmkYBqKlOzEw16PWYc5DE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mcAwudpxp91VL+AdljWcxg1OrRqbVTwbzCWYJpNVMll0IABcq7K7xylN9KKwuPnqo
         MD67Smt+20l5tvL63C/28sBYL1+P0MHTHB/DaTjlg9KPNxu9mNSVupLyxUERmzHwjP
         nTbGXSXc/zGCKRErKXxzsnlZd4s4I8tY2HUUHP8k=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C18E460E3C
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=eberman@codeaurora.org
From:   Elliot Berman <eberman@codeaurora.org>
To:     bjorn.andersson@linaro.org, saiprakash.ranjan@codeaurora.org,
        agross@kernel.org, swboyd@chromium.org
Cc:     Elliot Berman <eberman@codeaurora.org>, tsoni@codeaurora.org,
        sidgup@codeaurora.org, psodagud@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 17/18] firmware: qcom_scm: Dynamically support SMCCC and legacy conventions
Date:   Tue, 12 Nov 2019 13:22:53 -0800
Message-Id: <1573593774-12539-18-git-send-email-eberman@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573593774-12539-1-git-send-email-eberman@codeaurora.org>
References: <1573593774-12539-1-git-send-email-eberman@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Dynamically support SMCCCC and legacy conventions by detecting which
convention to use at runtime. qcom_scm_call_atomic and qcom_scm_call can
then be moved in qcom_scm.c and use underlying convention backend as
appropriate. Thus, rename qcom_scm-64,-32 to reflect that they are
backends for -smccc and -legacy, respectively.

Signed-off-by: Elliot Berman <eberman@codeaurora.org>
---
 drivers/firmware/Kconfig                           |   8 --
 drivers/firmware/Makefile                          |   4 +-
 .../firmware/{qcom_scm-32.c => qcom_scm-legacy.c}  |  24 +----
 .../firmware/{qcom_scm-64.c => qcom_scm-smccc.c}   |  77 +-------------
 drivers/firmware/qcom_scm.c                        | 113 ++++++++++++++++++++-
 drivers/firmware/qcom_scm.h                        |  23 +++--
 6 files changed, 137 insertions(+), 112 deletions(-)
 rename drivers/firmware/{qcom_scm-32.c => qcom_scm-legacy.c} (92%)
 rename drivers/firmware/{qcom_scm-64.c => qcom_scm-smccc.c} (60%)

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
index 747fb73..4ae2f55 100644
--- a/drivers/firmware/Makefile
+++ b/drivers/firmware/Makefile
@@ -17,9 +17,7 @@ obj-$(CONFIG_ISCSI_IBFT)	+= iscsi_ibft.o
 obj-$(CONFIG_FIRMWARE_MEMMAP)	+= memmap.o
 obj-$(CONFIG_RASPBERRYPI_FIRMWARE) += raspberrypi.o
 obj-$(CONFIG_FW_CFG_SYSFS)	+= qemu_fw_cfg.o
-obj-$(CONFIG_QCOM_SCM)		+= qcom_scm.o
-obj-$(CONFIG_QCOM_SCM_64)	+= qcom_scm-64.o
-obj-$(CONFIG_QCOM_SCM_32)	+= qcom_scm-32.o
+obj-$(CONFIG_QCOM_SCM)		+= qcom_scm.o qcom_scm-smccc.o qcom_scm-legacy.o
 obj-$(CONFIG_TI_SCI_PROTOCOL)	+= ti_sci.o
 obj-$(CONFIG_TRUSTED_FOUNDATIONS) += trusted_foundations.o
 obj-$(CONFIG_TURRIS_MOX_RWTM)	+= turris-mox-rwtm.o
diff --git a/drivers/firmware/qcom_scm-32.c b/drivers/firmware/qcom_scm-legacy.c
similarity index 92%
rename from drivers/firmware/qcom_scm-32.c
rename to drivers/firmware/qcom_scm-legacy.c
index 9e3789d..8d7ce69 100644
--- a/drivers/firmware/qcom_scm-32.c
+++ b/drivers/firmware/qcom_scm-legacy.c
@@ -21,7 +21,6 @@ struct arm_smccc_args {
 	unsigned long a[8];
 };
 
-#define LEGACY_FUNCNUM(s, c)	(((s) << 10) | ((c) & 0x3ff))
 
 /**
  * struct qcom_scm_legacy_command - one SCM command buffer
@@ -124,7 +123,7 @@ static void __qcom_scm_call_do(const struct arm_smccc_args *smc,
  * and response buffers is taken care of by qcom_scm_call; however, callers are
  * responsible for any other cached buffers passed over to the secure world.
  */
-int qcom_scm_call(struct device *dev, struct qcom_scm_desc *desc)
+int qcom_scm_call_legacy(struct device *dev, struct qcom_scm_desc *desc)
 {
 	int arglen = desc->arginfo & 0xf;
 	int ret = 0, context_id;
@@ -208,7 +207,7 @@ int qcom_scm_call(struct device *dev, struct qcom_scm_desc *desc)
  * This shall only be used with commands that are guaranteed to be
  * uninterruptable, atomic and SMP safe.
  */
-int qcom_scm_call_atomic(struct device *dev, struct qcom_scm_desc *desc)
+int qcom_scm_call_legacy_atomic(struct device *dev, struct qcom_scm_desc *desc)
 {
 	int context_id;
 	struct arm_smccc_args smc = {0};
@@ -232,22 +231,3 @@ int qcom_scm_call_atomic(struct device *dev, struct qcom_scm_desc *desc)
 
 	return res.a0;
 }
-
-int __qcom_scm_is_call_available(struct device *dev, u32 svc_id, u32 cmd_id)
-{
-	int ret;
-	struct qcom_scm_desc desc = {
-		.svc = QCOM_SCM_SVC_INFO,
-		.cmd = QCOM_SCM_INFO_IS_CALL_AVAIL,
-		.args[0] = LEGACY_FUNCNUM(svc_id, cmd_id),
-		.arginfo = QCOM_SCM_ARGS(1),
-	};
-
-	ret = qcom_scm_call(dev, &desc);
-
-	return ret ? : desc.result[0];
-}
-
-void __qcom_scm_init(void)
-{
-}
diff --git a/drivers/firmware/qcom_scm-64.c b/drivers/firmware/qcom_scm-smccc.c
similarity index 60%
rename from drivers/firmware/qcom_scm-64.c
rename to drivers/firmware/qcom_scm-smccc.c
index 1e81b89..f398f09 100644
--- a/drivers/firmware/qcom_scm-64.c
+++ b/drivers/firmware/qcom_scm-smccc.c
@@ -18,13 +18,11 @@ struct arm_smccc_args {
 	unsigned long a[8];
 };
 
-static u64 qcom_smccc_convention = -1;
 static DEFINE_MUTEX(qcom_scm_lock);
 
 #define QCOM_SCM_EBUSY_WAIT_MS 30
 #define QCOM_SCM_EBUSY_MAX_RETRY 20
 
-#define SMCCC_FUNCNUM(s, c)	((((s) & 0xFF) << 8) | ((c) & 0xFF))
 #define SMCCC_N_REG_ARGS	4
 #define SMCCC_FIRST_EXT_IDX	(SMCCC_N_REG_ARGS - 1)
 #define SMCCC_N_EXT_ARGS	(MAX_QCOM_SCM_ARGS - SMCCC_N_REG_ARGS + 1)
@@ -50,8 +48,8 @@ static void __qcom_scm_call_do_quirk(const struct arm_smccc_args *smc,
 	} while (res->a0 == QCOM_SCM_INTERRUPTED);
 }
 
-static int ___qcom_scm_call_smccc(struct device *dev,
-				  struct qcom_scm_desc *desc, bool atomic)
+int qcom_scm_call_smccc(struct device *dev, struct qcom_scm_desc *desc,
+			bool atomic)
 {
 	int arglen = desc->arginfo & 0xf;
 	int i;
@@ -60,6 +58,9 @@ static int ___qcom_scm_call_smccc(struct device *dev,
 	size_t alloc_len;
 	gfp_t flag = atomic ? GFP_ATOMIC : GFP_KERNEL;
 	u32 smccc_call_type = atomic ? ARM_SMCCC_FAST_CALL : ARM_SMCCC_STD_CALL;
+	u32 qcom_smccc_convention =
+			(qcom_scm_convention == SMC_CONVENTION_ARM_32) ?
+			ARM_SMCCC_SMC_32 : ARM_SMCCC_SMC_64;
 	struct arm_smccc_res res;
 	struct arm_smccc_args smc = {0};
 
@@ -138,71 +139,3 @@ static int ___qcom_scm_call_smccc(struct device *dev,
 
 	return 0;
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
-int qcom_scm_call(struct device *dev, struct qcom_scm_desc *desc)
-{
-	might_sleep();
-	return ___qcom_scm_call_smccc(dev, desc, false);
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
-int qcom_scm_call_atomic(struct device *dev, struct qcom_scm_desc *desc)
-{
-	return ___qcom_scm_call_smccc(dev, desc, true);
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
-
-	desc.arginfo = QCOM_SCM_ARGS(1);
-	desc.args[0] = SMCCC_FUNCNUM(svc_id, cmd_id) |
-			(ARM_SMCCC_OWNER_SIP << ARM_SMCCC_OWNER_SHIFT);
-
-	ret = qcom_scm_call(dev, &desc);
-
-	return ret ? : desc.result[0];
-}
-
-void __qcom_scm_init(void)
-{
-	qcom_smccc_convention = ARM_SMCCC_SMC_64;
-	if (__qcom_scm_is_call_available(NULL, QCOM_SCM_SVC_INFO,
-			QCOM_SCM_INFO_IS_CALL_AVAIL) == 1)
-		goto out;
-
-	qcom_smccc_convention = ARM_SMCCC_SMC_32;
-	if (__qcom_scm_is_call_available(NULL, QCOM_SCM_SVC_INFO,
-			QCOM_SCM_INFO_IS_CALL_AVAIL) == 1)
-		goto out;
-
-	qcom_smccc_convention = -1;
-	BUG();
-out:
-	pr_debug("QCOM SCM SMC Convention: %llu\n", qcom_smccc_convention);
-}
diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
index 2dc9ca6..b122fa7 100644
--- a/drivers/firmware/qcom_scm.c
+++ b/drivers/firmware/qcom_scm.c
@@ -85,6 +85,117 @@ static void qcom_scm_clk_disable(void)
 	clk_disable_unprepare(__scm->bus_clk);
 }
 
+static int __qcom_scm_is_call_available(struct device *dev, u32 svc_id,
+					u32 cmd_id);
+
+enum qcom_scm_convention qcom_scm_convention;
+static enum qcom_scm_convention __get_convention(void)
+{
+	if (likely(qcom_scm_convention != SMC_CONVENTION_UNKNOWN))
+		return qcom_scm_convention;
+
+	qcom_scm_convention = SMC_CONVENTION_LEGACY;
+	if (__qcom_scm_is_call_available(NULL, QCOM_SCM_SVC_INFO,
+			QCOM_SCM_INFO_IS_CALL_AVAIL) == 1)
+		goto out;
+
+	qcom_scm_convention = SMC_CONVENTION_ARM_64;
+	if (__qcom_scm_is_call_available(NULL, QCOM_SCM_SVC_INFO,
+			QCOM_SCM_INFO_IS_CALL_AVAIL) == 1)
+		goto out;
+
+	qcom_scm_convention = SMC_CONVENTION_ARM_32;
+	if (__qcom_scm_is_call_available(NULL, QCOM_SCM_SVC_INFO,
+			QCOM_SCM_INFO_IS_CALL_AVAIL) == 1)
+		goto out;
+
+	qcom_scm_convention = SMC_CONVENTION_UNKNOWN;
+	BUG();
+out:
+	pr_debug("QCOM SCM SMC Convention: %d\n", qcom_scm_convention);
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
+static int qcom_scm_call(struct device *dev, struct qcom_scm_desc *desc)
+{
+	might_sleep();
+	switch (__get_convention()) {
+	case SMC_CONVENTION_ARM_32:
+	case SMC_CONVENTION_ARM_64:
+		return qcom_scm_call_smccc(dev, desc, false);
+	case SMC_CONVENTION_LEGACY:
+		return qcom_scm_call_legacy(dev, desc);
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
+static int qcom_scm_call_atomic(struct device *dev, struct qcom_scm_desc *desc)
+{
+	switch (__get_convention()) {
+	case SMC_CONVENTION_ARM_32:
+	case SMC_CONVENTION_ARM_64:
+		return qcom_scm_call_smccc(dev, desc, true);
+	case SMC_CONVENTION_LEGACY:
+		return qcom_scm_call_legacy_atomic(dev, desc);
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
+
+	desc.arginfo = QCOM_SCM_ARGS(1);
+	switch (__get_convention()) {
+	case SMC_CONVENTION_ARM_32:
+	case SMC_CONVENTION_ARM_64:
+		desc.args[0] = SMCCC_FUNCNUM(svc_id, cmd_id) |
+				(ARM_SMCCC_OWNER_SIP << ARM_SMCCC_OWNER_SHIFT);
+		break;
+	case SMC_CONVENTION_LEGACY:
+		desc.args[0] = LEGACY_FUNCNUM(svc_id, cmd_id);
+		break;
+	default:
+		pr_err("Unknown SMC convention being used\n");
+		return -EINVAL;
+	}
+
+	ret = qcom_scm_call(dev, &desc);
+
+	return ret ? : desc.result[0];
+}
+
 #define QCOM_SCM_FLAG_COLDBOOT_CPU0	0x00
 #define QCOM_SCM_FLAG_COLDBOOT_CPU1	0x01
 #define QCOM_SCM_FLAG_COLDBOOT_CPU2	0x08
@@ -887,7 +998,7 @@ static int qcom_scm_probe(struct platform_device *pdev)
 	__scm = scm;
 	__scm->dev = &pdev->dev;
 
-	__qcom_scm_init();
+	__get_convention();
 
 	/*
 	 * If requested enable "download mode", from this point on warmboot
diff --git a/drivers/firmware/qcom_scm.h b/drivers/firmware/qcom_scm.h
index efbd31b..9252498 100644
--- a/drivers/firmware/qcom_scm.h
+++ b/drivers/firmware/qcom_scm.h
@@ -4,6 +4,15 @@
 #ifndef __QCOM_SCM_INT_H
 #define __QCOM_SCM_INT_H
 
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
 
@@ -44,8 +53,14 @@ struct qcom_scm_desc {
 	u32 owner;
 };
 
-extern int qcom_scm_call(struct device *dev, struct qcom_scm_desc *desc);
-extern int qcom_scm_call_atomic(struct device *dev, struct qcom_scm_desc *desc);
+#define SMCCC_FUNCNUM(s, c)	((((s) & 0xFF) << 8) | ((c) & 0xFF))
+extern int qcom_scm_call_smccc(struct device *dev, struct qcom_scm_desc *desc,
+			       bool atomic);
+
+#define LEGACY_FUNCNUM(s, c)	(((s) << 10) | ((c) & 0x3ff))
+extern int qcom_scm_call_legacy_atomic(struct device *dev,
+				       struct qcom_scm_desc *desc);
+extern int qcom_scm_call_legacy(struct device *dev, struct qcom_scm_desc *desc);
 
 #define QCOM_SCM_SVC_BOOT		0x1
 #define QCOM_SCM_BOOT_SET_ADDR		0x1
@@ -61,14 +76,10 @@ extern int qcom_scm_call_atomic(struct device *dev, struct qcom_scm_desc *desc);
 
 #define QCOM_SCM_SVC_INFO		0x6
 #define QCOM_SCM_INFO_IS_CALL_AVAIL	0x1
-extern int __qcom_scm_is_call_available(struct device *dev, u32 svc_id,
-		u32 cmd_id);
 
 #define QCOM_SCM_SVC_HDCP		0x11
 #define QCOM_SCM_HDCP_INVOKE		0x01
 
-extern void __qcom_scm_init(void);
-
 #define QCOM_SCM_SVC_PIL		0x2
 #define QCOM_SCM_PIL_PAS_INIT_IMAGE	0x1
 #define QCOM_SCM_PIL_PAS_MEM_SETUP	0x2
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

