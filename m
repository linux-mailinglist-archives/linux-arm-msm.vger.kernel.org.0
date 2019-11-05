Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 66DBAEF29D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2019 02:29:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730236AbfKEB1w (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Nov 2019 20:27:52 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:37454 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729526AbfKEB1v (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Nov 2019 20:27:51 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id D9BAB60DE9; Tue,  5 Nov 2019 01:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572917270;
        bh=L/DC6fZFf0RBxRiNPVITCY3QxB+8M8vwsaEXQD14Sxw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=iUIQ8zuildBTiYLxFl5axQvo1ZiHkScMgjMPr2g2DfnN5BHlL8+O6+j/yEv8oveQm
         JPyu1+tds30sYAjn/yAhFrzszxF4VgCu2UUTnN6S4cDIkVGmHt/MNZ2eSEN/kLwEbO
         aHSfebhATGyKL2yWQKP/Cu+GY0PQJ/IqtqCvm33g=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D4F1360D74;
        Tue,  5 Nov 2019 01:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572917267;
        bh=L/DC6fZFf0RBxRiNPVITCY3QxB+8M8vwsaEXQD14Sxw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fTssOWYx93CiSr6GhPrh+LdXtgeIGxx5uiBbKFZ930ys8fv02eRnaAror0w19uH6J
         YNzi7VHh63Vj+vx4rX1BgGcxI/lyMcjsdXKG/+nCst23BR645gWBTDmJGYy0G+KziH
         B+aarZixAvC1DnhpAaoWNqAnerD5Czg/I4t26528=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D4F1360D74
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=eberman@codeaurora.org
From:   Elliot Berman <eberman@codeaurora.org>
To:     bjorn.andersson@linaro.org, saiprakash.ranjan@codeaurora.org,
        agross@kernel.org
Cc:     tsoni@codeaurora.org, sidgup@codeaurora.org,
        psodagud@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Elliot Berman <eberman@codeaurora.org>
Subject: [PATCH 01/17] firmware: qcom_scm: Rename macros and structures
Date:   Mon,  4 Nov 2019 17:27:20 -0800
Message-Id: <1572917256-24205-2-git-send-email-eberman@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1572917256-24205-1-git-send-email-eberman@codeaurora.org>
References: <1572917256-24205-1-git-send-email-eberman@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

- Rename legacy-specific structures and macros with "legacy_" prefix.
- Rename smccc-specific structures and macros with "smccc_" prefix.
- Flip calculation of SMCCC_N_EXT_ARGS to be a function of N_REG_ARGS
  (not the other way around). N_REG_ARGS is fixed based off the SMC
  instruction and shouldn't be computed from the SCM abstraction.
- Move SMCCC_FUNCNUM closer to other smccc-specific macros.
- Add LEGACY_FUNCNUM macro to qcom_scm-32.c

Signed-off-by: Elliot Berman <eberman@codeaurora.org>
---
 drivers/firmware/qcom_scm-32.c | 72 ++++++++++++++++++++++--------------------
 drivers/firmware/qcom_scm-64.c | 54 +++++++++++++++----------------
 drivers/firmware/qcom_scm.c    |  4 +--
 3 files changed, 65 insertions(+), 65 deletions(-)

diff --git a/drivers/firmware/qcom_scm-32.c b/drivers/firmware/qcom_scm-32.c
index bee8729..d416efc 100644
--- a/drivers/firmware/qcom_scm-32.c
+++ b/drivers/firmware/qcom_scm-32.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-only
-/* Copyright (c) 2010,2015, The Linux Foundation. All rights reserved.
+/* Copyright (c) 2010,2015,2019 The Linux Foundation. All rights reserved.
  * Copyright (C) 2015 Linaro Ltd.
  */
 
@@ -38,23 +38,25 @@ static struct qcom_scm_entry qcom_scm_wb[] = {
 
 static DEFINE_MUTEX(qcom_scm_lock);
 
+#define LEGACY_FUNCNUM(s, c)  (((s) << 10) | ((c) & 0x3ff))
+
 /**
- * struct qcom_scm_command - one SCM command buffer
+ * struct legacy_command - one SCM command buffer
  * @len: total available memory for command and response
  * @buf_offset: start of command buffer
  * @resp_hdr_offset: start of response buffer
  * @id: command to be executed
- * @buf: buffer returned from qcom_scm_get_command_buffer()
+ * @buf: buffer returned from legacy_get_command_buffer()
  *
  * An SCM command is laid out in memory as follows:
  *
- *	------------------- <--- struct qcom_scm_command
+ *	------------------- <--- struct legacy_command
  *	| command header  |
- *	------------------- <--- qcom_scm_get_command_buffer()
+ *	------------------- <--- legacy_get_command_buffer()
  *	| command buffer  |
- *	------------------- <--- struct qcom_scm_response and
- *	| response header |      qcom_scm_command_to_response()
- *	------------------- <--- qcom_scm_get_response_buffer()
+ *	------------------- <--- struct legacy_response and
+ *	| response header |      legacy_command_to_response()
+ *	------------------- <--- legacy_get_response_buffer()
  *	| response buffer |
  *	-------------------
  *
@@ -62,7 +64,7 @@ static DEFINE_MUTEX(qcom_scm_lock);
  * you should always use the appropriate qcom_scm_get_*_buffer() routines
  * to access the buffers in a safe manner.
  */
-struct qcom_scm_command {
+struct legacy_command {
 	__le32 len;
 	__le32 buf_offset;
 	__le32 resp_hdr_offset;
@@ -71,52 +73,52 @@ struct qcom_scm_command {
 };
 
 /**
- * struct qcom_scm_response - one SCM response buffer
+ * struct legacy_response - one SCM response buffer
  * @len: total available memory for response
- * @buf_offset: start of response data relative to start of qcom_scm_response
+ * @buf_offset: start of response data relative to start of legacy_response
  * @is_complete: indicates if the command has finished processing
  */
-struct qcom_scm_response {
+struct legacy_response {
 	__le32 len;
 	__le32 buf_offset;
 	__le32 is_complete;
 };
 
 /**
- * qcom_scm_command_to_response() - Get a pointer to a qcom_scm_response
+ * legacy_command_to_response() - Get a pointer to a legacy_response
  * @cmd: command
  *
  * Returns a pointer to a response for a command.
  */
-static inline struct qcom_scm_response *qcom_scm_command_to_response(
-		const struct qcom_scm_command *cmd)
+static inline struct legacy_response *legacy_command_to_response(
+		const struct legacy_command *cmd)
 {
 	return (void *)cmd + le32_to_cpu(cmd->resp_hdr_offset);
 }
 
 /**
- * qcom_scm_get_command_buffer() - Get a pointer to a command buffer
+ * legacy_get_command_buffer() - Get a pointer to a command buffer
  * @cmd: command
  *
  * Returns a pointer to the command buffer of a command.
  */
-static inline void *qcom_scm_get_command_buffer(const struct qcom_scm_command *cmd)
+static inline void *legacy_get_command_buffer(const struct legacy_command *cmd)
 {
 	return (void *)cmd->buf;
 }
 
 /**
- * qcom_scm_get_response_buffer() - Get a pointer to a response buffer
+ * legacy_get_response_buffer() - Get a pointer to a response buffer
  * @rsp: response
  *
  * Returns a pointer to a response buffer of a response.
  */
-static inline void *qcom_scm_get_response_buffer(const struct qcom_scm_response *rsp)
+static inline void *legacy_get_response_buffer(const struct legacy_response *rsp)
 {
 	return (void *)rsp + le32_to_cpu(rsp->buf_offset);
 }
 
-static u32 smc(u32 cmd_addr)
+static u32 __qcom_scm_call_do(u32 cmd_addr)
 {
 	int context_id;
 	register u32 r0 asm("r0") = 1;
@@ -164,8 +166,8 @@ static int qcom_scm_call(struct device *dev, u32 svc_id, u32 cmd_id,
 			 size_t resp_len)
 {
 	int ret;
-	struct qcom_scm_command *cmd;
-	struct qcom_scm_response *rsp;
+	struct legacy_command *cmd;
+	struct legacy_response *rsp;
 	size_t alloc_len = sizeof(*cmd) + cmd_len + sizeof(*rsp) + resp_len;
 	dma_addr_t cmd_phys;
 
@@ -177,11 +179,11 @@ static int qcom_scm_call(struct device *dev, u32 svc_id, u32 cmd_id,
 	cmd->buf_offset = cpu_to_le32(sizeof(*cmd));
 	cmd->resp_hdr_offset = cpu_to_le32(sizeof(*cmd) + cmd_len);
 
-	cmd->id = cpu_to_le32((svc_id << 10) | cmd_id);
+	cmd->id = cpu_to_le32(LEGACY_FUNCNUM(svc_id, cmd_id));
 	if (cmd_buf)
-		memcpy(qcom_scm_get_command_buffer(cmd), cmd_buf, cmd_len);
+		memcpy(legacy_get_command_buffer(cmd), cmd_buf, cmd_len);
 
-	rsp = qcom_scm_command_to_response(cmd);
+	rsp = legacy_command_to_response(cmd);
 
 	cmd_phys = dma_map_single(dev, cmd, alloc_len, DMA_TO_DEVICE);
 	if (dma_mapping_error(dev, cmd_phys)) {
@@ -190,7 +192,7 @@ static int qcom_scm_call(struct device *dev, u32 svc_id, u32 cmd_id,
 	}
 
 	mutex_lock(&qcom_scm_lock);
-	ret = smc(cmd_phys);
+	ret = __qcom_scm_call_do(cmd_phys);
 	if (ret < 0)
 		ret = qcom_scm_remap_error(ret);
 	mutex_unlock(&qcom_scm_lock);
@@ -206,7 +208,7 @@ static int qcom_scm_call(struct device *dev, u32 svc_id, u32 cmd_id,
 		dma_sync_single_for_cpu(dev, cmd_phys + sizeof(*cmd) + cmd_len +
 					le32_to_cpu(rsp->buf_offset),
 					resp_len, DMA_FROM_DEVICE);
-		memcpy(resp_buf, qcom_scm_get_response_buffer(rsp),
+		memcpy(resp_buf, legacy_get_response_buffer(rsp),
 		       resp_len);
 	}
 out:
@@ -215,12 +217,12 @@ static int qcom_scm_call(struct device *dev, u32 svc_id, u32 cmd_id,
 	return ret;
 }
 
-#define SCM_CLASS_REGISTER	(0x2 << 8)
-#define SCM_MASK_IRQS		BIT(5)
-#define SCM_ATOMIC(svc, cmd, n) (((((svc) << 10)|((cmd) & 0x3ff)) << 12) | \
-				SCM_CLASS_REGISTER | \
-				SCM_MASK_IRQS | \
-				(n & 0xf))
+#define LEGACY_CLASS_REGISTER	(0x2 << 8)
+#define LEGACY_MASK_IRQS		BIT(5)
+#define LEGACY_ATOMIC(svc, cmd, n) ((LEGACY_FUNCNUM(svc, cmd) << 12) | \
+				    LEGACY_CLASS_REGISTER | \
+				    LEGACY_MASK_IRQS | \
+				    (n & 0xf))
 
 /**
  * qcom_scm_call_atomic1() - Send an atomic SCM command with one argument
@@ -235,7 +237,7 @@ static s32 qcom_scm_call_atomic1(u32 svc, u32 cmd, u32 arg1)
 {
 	int context_id;
 
-	register u32 r0 asm("r0") = SCM_ATOMIC(svc, cmd, 1);
+	register u32 r0 asm("r0") = LEGACY_ATOMIC(svc, cmd, 1);
 	register u32 r1 asm("r1") = (u32)&context_id;
 	register u32 r2 asm("r2") = arg1;
 
@@ -268,7 +270,7 @@ static s32 qcom_scm_call_atomic2(u32 svc, u32 cmd, u32 arg1, u32 arg2)
 {
 	int context_id;
 
-	register u32 r0 asm("r0") = SCM_ATOMIC(svc, cmd, 2);
+	register u32 r0 asm("r0") = LEGACY_ATOMIC(svc, cmd, 2);
 	register u32 r1 asm("r1") = (u32)&context_id;
 	register u32 r2 asm("r2") = arg1;
 	register u32 r3 asm("r3") = arg2;
diff --git a/drivers/firmware/qcom_scm-64.c b/drivers/firmware/qcom_scm-64.c
index 7686786..e6721b5 100644
--- a/drivers/firmware/qcom_scm-64.c
+++ b/drivers/firmware/qcom_scm-64.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-only
-/* Copyright (c) 2015, The Linux Foundation. All rights reserved.
+/* Copyright (c) 2015,2019 The Linux Foundation. All rights reserved.
  */
 
 #include <linux/io.h>
@@ -14,8 +14,6 @@
 
 #include "qcom_scm.h"
 
-#define QCOM_SCM_FNID(s, c) ((((s) & 0xFF) << 8) | ((c) & 0xFF))
-
 #define MAX_QCOM_SCM_ARGS 10
 #define MAX_QCOM_SCM_RETS 3
 
@@ -58,11 +56,12 @@ static DEFINE_MUTEX(qcom_scm_lock);
 #define QCOM_SCM_EBUSY_WAIT_MS 30
 #define QCOM_SCM_EBUSY_MAX_RETRY 20
 
-#define N_EXT_QCOM_SCM_ARGS 7
-#define FIRST_EXT_ARG_IDX 3
-#define N_REGISTER_ARGS (MAX_QCOM_SCM_ARGS - N_EXT_QCOM_SCM_ARGS + 1)
+#define SMCCC_FUNCNUM(s, c) ((((s) & 0xFF) << 8) | ((c) & 0xFF))
+#define SMCCC_N_REG_ARGS	4
+#define SMCCC_FIRST_REG_IDX	2
+#define SMCCC_N_EXT_ARGS	(MAX_QCOM_SCM_ARGS - SMCCC_N_REG_ARGS + 1)
 
-static void __qcom_scm_call_do(const struct qcom_scm_desc *desc,
+static void __qcom_scm_call_do_quirk(const struct qcom_scm_desc *desc,
 			       struct arm_smccc_res *res, u32 fn_id,
 			       u64 x5, u32 type)
 {
@@ -85,22 +84,23 @@ static void __qcom_scm_call_do(const struct qcom_scm_desc *desc,
 	} while (res->a0 == QCOM_SCM_INTERRUPTED);
 }
 
-static void qcom_scm_call_do(const struct qcom_scm_desc *desc,
+static void qcom_scm_call_do_smccc(const struct qcom_scm_desc *desc,
 			     struct arm_smccc_res *res, u32 fn_id,
 			     u64 x5, bool atomic)
 {
 	int retry_count = 0;
 
 	if (atomic) {
-		__qcom_scm_call_do(desc, res, fn_id, x5, ARM_SMCCC_FAST_CALL);
+		__qcom_scm_call_do_quirk(desc, res, fn_id, x5,
+					 ARM_SMCCC_FAST_CALL);
 		return;
 	}
 
 	do {
 		mutex_lock(&qcom_scm_lock);
 
-		__qcom_scm_call_do(desc, res, fn_id, x5,
-				   ARM_SMCCC_STD_CALL);
+		__qcom_scm_call_do_quirk(desc, res, fn_id, x5,
+					 ARM_SMCCC_STD_CALL);
 
 		mutex_unlock(&qcom_scm_lock);
 
@@ -112,21 +112,21 @@ static void qcom_scm_call_do(const struct qcom_scm_desc *desc,
 	}  while (res->a0 == QCOM_SCM_V2_EBUSY);
 }
 
-static int ___qcom_scm_call(struct device *dev, u32 svc_id, u32 cmd_id,
-			    const struct qcom_scm_desc *desc,
-			    struct arm_smccc_res *res, bool atomic)
+static int ___qcom_scm_call_smccc(struct device *dev, u32 svc_id, u32 cmd_id,
+				  const struct qcom_scm_desc *desc,
+				  struct arm_smccc_res *res, bool atomic)
 {
 	int arglen = desc->arginfo & 0xf;
 	int i;
-	u32 fn_id = QCOM_SCM_FNID(svc_id, cmd_id);
-	u64 x5 = desc->args[FIRST_EXT_ARG_IDX];
+	u32 fn_id = SMCCC_FUNCNUM(svc_id, cmd_id);
+	u64 x5 = desc->args[SMCCC_N_REG_ARGS - 1];
 	dma_addr_t args_phys = 0;
 	void *args_virt = NULL;
 	size_t alloc_len;
 	gfp_t flag = atomic ? GFP_ATOMIC : GFP_KERNEL;
 
-	if (unlikely(arglen > N_REGISTER_ARGS)) {
-		alloc_len = N_EXT_QCOM_SCM_ARGS * sizeof(u64);
+	if (unlikely(arglen > SMCCC_N_REG_ARGS)) {
+		alloc_len = SMCCC_N_EXT_ARGS * sizeof(u64);
 		args_virt = kzalloc(PAGE_ALIGN(alloc_len), flag);
 
 		if (!args_virt)
@@ -135,15 +135,15 @@ static int ___qcom_scm_call(struct device *dev, u32 svc_id, u32 cmd_id,
 		if (qcom_smccc_convention == ARM_SMCCC_SMC_32) {
 			__le32 *args = args_virt;
 
-			for (i = 0; i < N_EXT_QCOM_SCM_ARGS; i++)
+			for (i = 0; i < SMCCC_N_EXT_ARGS; i++)
 				args[i] = cpu_to_le32(desc->args[i +
-						      FIRST_EXT_ARG_IDX]);
+						      SMCCC_N_REG_ARGS - 1]);
 		} else {
 			__le64 *args = args_virt;
 
-			for (i = 0; i < N_EXT_QCOM_SCM_ARGS; i++)
+			for (i = 0; i < SMCCC_N_EXT_ARGS; i++)
 				args[i] = cpu_to_le64(desc->args[i +
-						      FIRST_EXT_ARG_IDX]);
+						      SMCCC_N_REG_ARGS - 1]);
 		}
 
 		args_phys = dma_map_single(dev, args_virt, alloc_len,
@@ -157,7 +157,7 @@ static int ___qcom_scm_call(struct device *dev, u32 svc_id, u32 cmd_id,
 		x5 = args_phys;
 	}
 
-	qcom_scm_call_do(desc, res, fn_id, x5, atomic);
+	qcom_scm_call_do_smccc(desc, res, fn_id, x5, atomic);
 
 	if (args_virt) {
 		dma_unmap_single(dev, args_phys, alloc_len, DMA_TO_DEVICE);
@@ -185,7 +185,7 @@ static int qcom_scm_call(struct device *dev, u32 svc_id, u32 cmd_id,
 			 struct arm_smccc_res *res)
 {
 	might_sleep();
-	return ___qcom_scm_call(dev, svc_id, cmd_id, desc, res, false);
+	return ___qcom_scm_call_smccc(dev, svc_id, cmd_id, desc, res, false);
 }
 
 /**
@@ -203,7 +203,7 @@ static int qcom_scm_call_atomic(struct device *dev, u32 svc_id, u32 cmd_id,
 				const struct qcom_scm_desc *desc,
 				struct arm_smccc_res *res)
 {
-	return ___qcom_scm_call(dev, svc_id, cmd_id, desc, res, true);
+	return ___qcom_scm_call_smccc(dev, svc_id, cmd_id, desc, res, true);
 }
 
 /**
@@ -253,7 +253,7 @@ int __qcom_scm_is_call_available(struct device *dev, u32 svc_id, u32 cmd_id)
 	struct arm_smccc_res res;
 
 	desc.arginfo = QCOM_SCM_ARGS(1);
-	desc.args[0] = QCOM_SCM_FNID(svc_id, cmd_id) |
+	desc.args[0] = SMCCC_FUNCNUM(svc_id, cmd_id) |
 			(ARM_SMCCC_OWNER_SIP << ARM_SMCCC_OWNER_SHIFT);
 
 	ret = qcom_scm_call(dev, QCOM_SCM_SVC_INFO, QCOM_IS_CALL_AVAIL_CMD,
@@ -295,7 +295,7 @@ void __qcom_scm_init(void)
 {
 	u64 cmd;
 	struct arm_smccc_res res;
-	u32 function = QCOM_SCM_FNID(QCOM_SCM_SVC_INFO, QCOM_IS_CALL_AVAIL_CMD);
+	u32 function = SMCCC_FUNCNUM(QCOM_SCM_SVC_INFO, QCOM_IS_CALL_AVAIL_CMD);
 
 	/* First try a SMC64 call */
 	cmd = ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL, ARM_SMCCC_SMC_64,
diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
index a729e05..40222b1 100644
--- a/drivers/firmware/qcom_scm.c
+++ b/drivers/firmware/qcom_scm.c
@@ -1,8 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Qualcomm SCM driver
- *
- * Copyright (c) 2010,2015, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2010,2015,2019 The Linux Foundation. All rights reserved.
  * Copyright (C) 2015 Linaro Ltd.
  */
 #include <linux/platform_device.h>
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

