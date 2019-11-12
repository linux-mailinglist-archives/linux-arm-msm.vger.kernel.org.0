Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 406ADF9C20
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2019 22:24:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727349AbfKLVXJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Nov 2019 16:23:09 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:38614 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726936AbfKLVXI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Nov 2019 16:23:08 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 2D65E60A1D; Tue, 12 Nov 2019 21:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573593786;
        bh=L2q2tmLEBoegKjRUZwnmR0udPzMRG0BJ8jdF13VfroI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=FUejoVzJCEU2ryL0KqPeX6SBiMSDT8GOwT+O2dmQKJMHoBUDn0xcapyBd0jNjv8Lf
         AS1qVdBAPb6vZc+dv3hVCYpde92G/Bxg0/EodNMze1AY/oV7bdzEqsjIq6ylcEvy9G
         xOcBlvaMkRQgIdKDMRTq+lo5mbE7DS16sAVQ4H18=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id F25BC60595;
        Tue, 12 Nov 2019 21:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573593783;
        bh=L2q2tmLEBoegKjRUZwnmR0udPzMRG0BJ8jdF13VfroI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=BDe91L9nPwIktTmn/0glOVAkBkfKo5JFEfcTcbUYd13orv9I05Dsh85WLpP5o4u+5
         gPaaqcrPzMKyhpmSeJjcA1Zz0Pc8+7hvZRDD/okZBshsgOR+UC6WYawNe90loIFj6M
         1WqSDJqiIEjqktrWmOEqFdoIZDjzV2zxyspnw++o=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org F25BC60595
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=eberman@codeaurora.org
From:   Elliot Berman <eberman@codeaurora.org>
To:     bjorn.andersson@linaro.org, saiprakash.ranjan@codeaurora.org,
        agross@kernel.org, swboyd@chromium.org
Cc:     Elliot Berman <eberman@codeaurora.org>, tsoni@codeaurora.org,
        sidgup@codeaurora.org, psodagud@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 01/18] firmware: qcom_scm: Rename macros and structures
Date:   Tue, 12 Nov 2019 13:22:37 -0800
Message-Id: <1573593774-12539-2-git-send-email-eberman@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573593774-12539-1-git-send-email-eberman@codeaurora.org>
References: <1573593774-12539-1-git-send-email-eberman@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Rename legacy-specific structures and macros with legacy prefix; rename
smccc-specific structures and macros with smccc prefix.

Signed-off-by: Elliot Berman <eberman@codeaurora.org>
---
 drivers/firmware/qcom_scm-32.c | 70 ++++++++++++++++++++++--------------------
 drivers/firmware/qcom_scm-64.c | 53 ++++++++++++++++----------------
 2 files changed, 64 insertions(+), 59 deletions(-)

diff --git a/drivers/firmware/qcom_scm-32.c b/drivers/firmware/qcom_scm-32.c
index bee8729..5d52641 100644
--- a/drivers/firmware/qcom_scm-32.c
+++ b/drivers/firmware/qcom_scm-32.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-only
-/* Copyright (c) 2010,2015, The Linux Foundation. All rights reserved.
+/* Copyright (c) 2010,2015,2019 The Linux Foundation. All rights reserved.
  * Copyright (C) 2015 Linaro Ltd.
  */
 
@@ -39,22 +39,22 @@ static struct qcom_scm_entry qcom_scm_wb[] = {
 static DEFINE_MUTEX(qcom_scm_lock);
 
 /**
- * struct qcom_scm_command - one SCM command buffer
+ * struct qcom_scm_legacy_command - one SCM command buffer
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
+ *	------------------- <--- struct qcom_scm_legacy_command
  *	| command header  |
- *	------------------- <--- qcom_scm_get_command_buffer()
+ *	------------------- <--- legacy_get_command_buffer()
  *	| command buffer  |
- *	------------------- <--- struct qcom_scm_response and
- *	| response header |      qcom_scm_command_to_response()
- *	------------------- <--- qcom_scm_get_response_buffer()
+ *	------------------- <--- struct qcom_scm_legacy_response and
+ *	| response header |      legacy_command_to_response()
+ *	------------------- <--- legacy_get_response_buffer()
  *	| response buffer |
  *	-------------------
  *
@@ -62,7 +62,7 @@ static DEFINE_MUTEX(qcom_scm_lock);
  * you should always use the appropriate qcom_scm_get_*_buffer() routines
  * to access the buffers in a safe manner.
  */
-struct qcom_scm_command {
+struct qcom_scm_legacy_command {
 	__le32 len;
 	__le32 buf_offset;
 	__le32 resp_hdr_offset;
@@ -71,52 +71,55 @@ struct qcom_scm_command {
 };
 
 /**
- * struct qcom_scm_response - one SCM response buffer
+ * struct qcom_scm_legacy_response - one SCM response buffer
  * @len: total available memory for response
- * @buf_offset: start of response data relative to start of qcom_scm_response
+ * @buf_offset: start of response data relative to start of
+ *              qcom_scm_legacy_response
  * @is_complete: indicates if the command has finished processing
  */
-struct qcom_scm_response {
+struct qcom_scm_legacy_response {
 	__le32 len;
 	__le32 buf_offset;
 	__le32 is_complete;
 };
 
 /**
- * qcom_scm_command_to_response() - Get a pointer to a qcom_scm_response
+ * legacy_command_to_response() - Get a pointer to a qcom_scm_legacy_response
  * @cmd: command
  *
  * Returns a pointer to a response for a command.
  */
-static inline struct qcom_scm_response *qcom_scm_command_to_response(
-		const struct qcom_scm_command *cmd)
+static inline struct qcom_scm_legacy_response *legacy_command_to_response(
+		const struct qcom_scm_legacy_command *cmd)
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
+static inline void *legacy_get_command_buffer(
+		const struct qcom_scm_legacy_command *cmd)
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
+static inline void *legacy_get_response_buffer(
+		const struct qcom_scm_legacy_response *rsp)
 {
 	return (void *)rsp + le32_to_cpu(rsp->buf_offset);
 }
 
-static u32 smc(u32 cmd_addr)
+static u32 __qcom_scm_call_do(u32 cmd_addr)
 {
 	int context_id;
 	register u32 r0 asm("r0") = 1;
@@ -164,8 +167,8 @@ static int qcom_scm_call(struct device *dev, u32 svc_id, u32 cmd_id,
 			 size_t resp_len)
 {
 	int ret;
-	struct qcom_scm_command *cmd;
-	struct qcom_scm_response *rsp;
+	struct qcom_scm_legacy_command *cmd;
+	struct qcom_scm_legacy_response *rsp;
 	size_t alloc_len = sizeof(*cmd) + cmd_len + sizeof(*rsp) + resp_len;
 	dma_addr_t cmd_phys;
 
@@ -179,9 +182,9 @@ static int qcom_scm_call(struct device *dev, u32 svc_id, u32 cmd_id,
 
 	cmd->id = cpu_to_le32((svc_id << 10) | cmd_id);
 	if (cmd_buf)
-		memcpy(qcom_scm_get_command_buffer(cmd), cmd_buf, cmd_len);
+		memcpy(legacy_get_command_buffer(cmd), cmd_buf, cmd_len);
 
-	rsp = qcom_scm_command_to_response(cmd);
+	rsp = legacy_command_to_response(cmd);
 
 	cmd_phys = dma_map_single(dev, cmd, alloc_len, DMA_TO_DEVICE);
 	if (dma_mapping_error(dev, cmd_phys)) {
@@ -190,7 +193,7 @@ static int qcom_scm_call(struct device *dev, u32 svc_id, u32 cmd_id,
 	}
 
 	mutex_lock(&qcom_scm_lock);
-	ret = smc(cmd_phys);
+	ret = __qcom_scm_call_do(cmd_phys);
 	if (ret < 0)
 		ret = qcom_scm_remap_error(ret);
 	mutex_unlock(&qcom_scm_lock);
@@ -206,7 +209,7 @@ static int qcom_scm_call(struct device *dev, u32 svc_id, u32 cmd_id,
 		dma_sync_single_for_cpu(dev, cmd_phys + sizeof(*cmd) + cmd_len +
 					le32_to_cpu(rsp->buf_offset),
 					resp_len, DMA_FROM_DEVICE);
-		memcpy(resp_buf, qcom_scm_get_response_buffer(rsp),
+		memcpy(resp_buf, legacy_get_response_buffer(rsp),
 		       resp_len);
 	}
 out:
@@ -215,11 +218,12 @@ static int qcom_scm_call(struct device *dev, u32 svc_id, u32 cmd_id,
 	return ret;
 }
 
-#define SCM_CLASS_REGISTER	(0x2 << 8)
-#define SCM_MASK_IRQS		BIT(5)
-#define SCM_ATOMIC(svc, cmd, n) (((((svc) << 10)|((cmd) & 0x3ff)) << 12) | \
-				SCM_CLASS_REGISTER | \
-				SCM_MASK_IRQS | \
+#define LEGACY_CLASS_REGISTER		(0x2 << 8)
+#define LEGACY_MASK_IRQS		BIT(5)
+#define LEGACY_ATOMIC_ID(svc, cmd, n) \
+				(((((svc) << 10)|((cmd) & 0x3ff)) << 12) | \
+				LEGACY_CLASS_REGISTER | \
+				LEGACY_MASK_IRQS | \
 				(n & 0xf))
 
 /**
@@ -235,7 +239,7 @@ static s32 qcom_scm_call_atomic1(u32 svc, u32 cmd, u32 arg1)
 {
 	int context_id;
 
-	register u32 r0 asm("r0") = SCM_ATOMIC(svc, cmd, 1);
+	register u32 r0 asm("r0") = LEGACY_ATOMIC_ID(svc, cmd, 1);
 	register u32 r1 asm("r1") = (u32)&context_id;
 	register u32 r2 asm("r2") = arg1;
 
@@ -268,7 +272,7 @@ static s32 qcom_scm_call_atomic2(u32 svc, u32 cmd, u32 arg1, u32 arg2)
 {
 	int context_id;
 
-	register u32 r0 asm("r0") = SCM_ATOMIC(svc, cmd, 2);
+	register u32 r0 asm("r0") = LEGACY_ATOMIC_ID(svc, cmd, 2);
 	register u32 r1 asm("r1") = (u32)&context_id;
 	register u32 r2 asm("r2") = arg1;
 	register u32 r3 asm("r3") = arg2;
diff --git a/drivers/firmware/qcom_scm-64.c b/drivers/firmware/qcom_scm-64.c
index 7686786..8226b94 100644
--- a/drivers/firmware/qcom_scm-64.c
+++ b/drivers/firmware/qcom_scm-64.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-only
-/* Copyright (c) 2015, The Linux Foundation. All rights reserved.
+/* Copyright (c) 2015,2019 The Linux Foundation. All rights reserved.
  */
 
 #include <linux/io.h>
@@ -14,7 +14,7 @@
 
 #include "qcom_scm.h"
 
-#define QCOM_SCM_FNID(s, c) ((((s) & 0xFF) << 8) | ((c) & 0xFF))
+#define SMCCC_FUNCNUM(s, c) ((((s) & 0xFF) << 8) | ((c) & 0xFF))
 
 #define MAX_QCOM_SCM_ARGS 10
 #define MAX_QCOM_SCM_RETS 3
@@ -58,11 +58,11 @@ static DEFINE_MUTEX(qcom_scm_lock);
 #define QCOM_SCM_EBUSY_WAIT_MS 30
 #define QCOM_SCM_EBUSY_MAX_RETRY 20
 
-#define N_EXT_QCOM_SCM_ARGS 7
-#define FIRST_EXT_ARG_IDX 3
-#define N_REGISTER_ARGS (MAX_QCOM_SCM_ARGS - N_EXT_QCOM_SCM_ARGS + 1)
+#define SMCCC_N_EXT_ARGS 7
+#define SMCCC_FIRST_EXT_IDX 3
+#define SMCCC_N_REG_ARGS (MAX_QCOM_SCM_ARGS - SMCCC_N_EXT_ARGS + 1)
 
-static void __qcom_scm_call_do(const struct qcom_scm_desc *desc,
+static void __qcom_scm_call_do_quirk(const struct qcom_scm_desc *desc,
 			       struct arm_smccc_res *res, u32 fn_id,
 			       u64 x5, u32 type)
 {
@@ -85,22 +85,23 @@ static void __qcom_scm_call_do(const struct qcom_scm_desc *desc,
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
 
@@ -112,21 +113,21 @@ static void qcom_scm_call_do(const struct qcom_scm_desc *desc,
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
+	u64 x5 = desc->args[SMCCC_FIRST_EXT_IDX];
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
@@ -135,15 +136,15 @@ static int ___qcom_scm_call(struct device *dev, u32 svc_id, u32 cmd_id,
 		if (qcom_smccc_convention == ARM_SMCCC_SMC_32) {
 			__le32 *args = args_virt;
 
-			for (i = 0; i < N_EXT_QCOM_SCM_ARGS; i++)
+			for (i = 0; i < SMCCC_N_EXT_ARGS; i++)
 				args[i] = cpu_to_le32(desc->args[i +
-						      FIRST_EXT_ARG_IDX]);
+						      SMCCC_FIRST_EXT_IDX]);
 		} else {
 			__le64 *args = args_virt;
 
-			for (i = 0; i < N_EXT_QCOM_SCM_ARGS; i++)
+			for (i = 0; i < SMCCC_N_EXT_ARGS; i++)
 				args[i] = cpu_to_le64(desc->args[i +
-						      FIRST_EXT_ARG_IDX]);
+						      SMCCC_FIRST_EXT_IDX]);
 		}
 
 		args_phys = dma_map_single(dev, args_virt, alloc_len,
@@ -157,7 +158,7 @@ static int ___qcom_scm_call(struct device *dev, u32 svc_id, u32 cmd_id,
 		x5 = args_phys;
 	}
 
-	qcom_scm_call_do(desc, res, fn_id, x5, atomic);
+	qcom_scm_call_do_smccc(desc, res, fn_id, x5, atomic);
 
 	if (args_virt) {
 		dma_unmap_single(dev, args_phys, alloc_len, DMA_TO_DEVICE);
@@ -185,7 +186,7 @@ static int qcom_scm_call(struct device *dev, u32 svc_id, u32 cmd_id,
 			 struct arm_smccc_res *res)
 {
 	might_sleep();
-	return ___qcom_scm_call(dev, svc_id, cmd_id, desc, res, false);
+	return ___qcom_scm_call_smccc(dev, svc_id, cmd_id, desc, res, false);
 }
 
 /**
@@ -203,7 +204,7 @@ static int qcom_scm_call_atomic(struct device *dev, u32 svc_id, u32 cmd_id,
 				const struct qcom_scm_desc *desc,
 				struct arm_smccc_res *res)
 {
-	return ___qcom_scm_call(dev, svc_id, cmd_id, desc, res, true);
+	return ___qcom_scm_call_smccc(dev, svc_id, cmd_id, desc, res, true);
 }
 
 /**
@@ -253,7 +254,7 @@ int __qcom_scm_is_call_available(struct device *dev, u32 svc_id, u32 cmd_id)
 	struct arm_smccc_res res;
 
 	desc.arginfo = QCOM_SCM_ARGS(1);
-	desc.args[0] = QCOM_SCM_FNID(svc_id, cmd_id) |
+	desc.args[0] = SMCCC_FUNCNUM(svc_id, cmd_id) |
 			(ARM_SMCCC_OWNER_SIP << ARM_SMCCC_OWNER_SHIFT);
 
 	ret = qcom_scm_call(dev, QCOM_SCM_SVC_INFO, QCOM_IS_CALL_AVAIL_CMD,
@@ -295,7 +296,7 @@ void __qcom_scm_init(void)
 {
 	u64 cmd;
 	struct arm_smccc_res res;
-	u32 function = QCOM_SCM_FNID(QCOM_SCM_SVC_INFO, QCOM_IS_CALL_AVAIL_CMD);
+	u32 function = SMCCC_FUNCNUM(QCOM_SCM_SVC_INFO, QCOM_IS_CALL_AVAIL_CMD);
 
 	/* First try a SMC64 call */
 	cmd = ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL, ARM_SMCCC_SMC_64,
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

