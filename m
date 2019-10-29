Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 549D8E9033
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2019 20:42:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732952AbfJ2Tli (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Oct 2019 15:41:38 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:59332 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732787AbfJ2TlW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Oct 2019 15:41:22 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id E1ABE6119B; Tue, 29 Oct 2019 19:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572378080;
        bh=sHg38L+FKPh+SKEIc+nBDiMf56kEXlg1XkzK9aIWflM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=e6HrFTSymF9uaDNrVQB8XKXgmyzcvgP5PtbvLbtOGsuhSlvpBIGPMSs41WSijDZ01
         qtKkg0SD1RbNHD4FOSKcH4B58iyJFG0Bv3uglOMKIFhBMtapyYdP51f5243K/luUpY
         eXPDz4UpTmqhnn/UswATckE7yT3NW3qNu2U13JmA=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6B84361150;
        Tue, 29 Oct 2019 19:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572378079;
        bh=sHg38L+FKPh+SKEIc+nBDiMf56kEXlg1XkzK9aIWflM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ooc/JVz71ixTnkXFne1pYe/cp8hgYYrdwSucMUMA6HMvN48h3RpBGn+OwhTtuGcwb
         j0uFabyzZF+ML+Cr2d98WNW9vSzFX2sDK0mMU1wbHnwmGhOqDJrgAmZH6HYWVUjd1x
         SzSr0evkojHSo7Kd7M8mvZ5QHRXyN4SWW9ToNbVI=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6B84361150
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=eberman@codeaurora.org
From:   Elliot Berman <eberman@codeaurora.org>
To:     bjorn.andersson@linaro.org, saipraka@codeaurora.org,
        agross@kernel.org
Cc:     tsoni@codeaurora.org, sidgup@codeaurora.org,
        psodagud@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Elliot Berman <eberman@codeaurora.org>
Subject: [RFC 15/17] firmware: qcom_scm: Merge legacy and SMCCC conventions
Date:   Tue, 29 Oct 2019 12:41:03 -0700
Message-Id: <1572378065-4490-16-git-send-email-eberman@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1572378065-4490-1-git-send-email-eberman@codeaurora.org>
References: <1572378065-4490-1-git-send-email-eberman@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Copy/paste legacy SCM driver into qcom_scm-64 with the following notes:
- Renamed qcom_scm_call in qcom_scm-32 to qcom_scm_call_legacy in the
  copy.
- Renamed qcom_scm_call_atomic in qcom_scm 32 to
  qcom_scm_call_atomic_legacy in the copy.
- Rename __qcom_scm_call_smccc to qcom_scm_call_smccc.
- Filled in implementations set_cold_boot_addr, set_warm_boot_addr, and
  cpu_power_down from qcom_scm-32.c.
- set_dload_mode, io_writel, io_readl now use atomic variants as in
  qcom_scm-32.

Signed-off-by: Elliot Berman <eberman@codeaurora.org>
---
 drivers/firmware/qcom_scm-64.c | 322 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 314 insertions(+), 8 deletions(-)

diff --git a/drivers/firmware/qcom_scm-64.c b/drivers/firmware/qcom_scm-64.c
index 9f39483..71b07b8 100644
--- a/drivers/firmware/qcom_scm-64.c
+++ b/drivers/firmware/qcom_scm-64.c
@@ -95,7 +95,7 @@ static void __qcom_scm_call_do_quirk(const struct arm_smccc_args *smc,
 	} while (res->a0 == QCOM_SCM_INTERRUPTED);
 }
 
-static int ___qcom_scm_call_smccc(struct device *dev,
+static int qcom_scm_call_smccc(struct device *dev,
 				  struct qcom_scm_desc *desc, bool atomic)
 {
 	int arglen = desc->arginfo & 0xf;
@@ -181,6 +181,223 @@ static int ___qcom_scm_call_smccc(struct device *dev,
 	return 0;
 }
 
+#define LEGACY_FUNCNUM(s, c)  (((s) << 10) | ((c) & 0x3ff))
+
+/**
+ * struct legacy_command - one SCM command buffer
+ * @len: total available memory for command and response
+ * @buf_offset: start of command buffer
+ * @resp_hdr_offset: start of response buffer
+ * @id: command to be executed
+ * @buf: buffer returned from legacy_get_command_buffer()
+ *
+ * An SCM command is laid out in memory as follows:
+ *
+ *	------------------- <--- struct legacy_command
+ *	| command header  |
+ *	------------------- <--- legacy_get_command_buffer()
+ *	| command buffer  |
+ *	------------------- <--- struct legacy_response and
+ *	| response header |      legacy_command_to_response()
+ *	------------------- <--- legacy_get_response_buffer()
+ *	| response buffer |
+ *	-------------------
+ *
+ * There can be arbitrary padding between the headers and buffers so
+ * you should always use the appropriate qcom_scm_get_*_buffer() routines
+ * to access the buffers in a safe manner.
+ */
+struct legacy_command {
+	__le32 len;
+	__le32 buf_offset;
+	__le32 resp_hdr_offset;
+	__le32 id;
+	__le32 buf[0];
+};
+
+/**
+ * struct legacy_response - one SCM response buffer
+ * @len: total available memory for response
+ * @buf_offset: start of response data relative to start of legacy_response
+ * @is_complete: indicates if the command has finished processing
+ */
+struct legacy_response {
+	__le32 len;
+	__le32 buf_offset;
+	__le32 is_complete;
+};
+
+/**
+ * legacy_command_to_response() - Get a pointer to a legacy_response
+ * @cmd: command
+ *
+ * Returns a pointer to a response for a command.
+ */
+static inline struct legacy_response *legacy_command_to_response(
+		const struct legacy_command *cmd)
+{
+	return (void *)cmd + le32_to_cpu(cmd->resp_hdr_offset);
+}
+
+/**
+ * legacy_get_command_buffer() - Get a pointer to a command buffer
+ * @cmd: command
+ *
+ * Returns a pointer to the command buffer of a command.
+ */
+static inline void *legacy_get_command_buffer(const struct legacy_command *cmd)
+{
+	return (void *)cmd->buf;
+}
+
+/**
+ * legacy_get_response_buffer() - Get a pointer to a response buffer
+ * @rsp: response
+ *
+ * Returns a pointer to a response buffer of a response.
+ */
+static inline void *legacy_get_response_buffer(const struct legacy_response *rsp)
+{
+	return (void *)rsp + le32_to_cpu(rsp->buf_offset);
+}
+
+static void __qcom_scm_call_do(const struct arm_smccc_args *smc,
+			      struct arm_smccc_res *res)
+{
+	do {
+		arm_smccc_smc(smc->a[0], smc->a[1], smc->a[2], smc->a[3],
+			      smc->a[4], smc->a[5], smc->a[6], smc->a[7], res);
+	} while (res->a0 == QCOM_SCM_INTERRUPTED);
+}
+
+/**
+ * qcom_scm_call_legacy() - Send an SCM command
+ * @dev: struct device
+ * @svc_id: service identifier
+ * @cmd_id: command identifier
+ * @cmd_buf: command buffer
+ * @cmd_len: length of the command buffer
+ * @resp_buf: response buffer
+ * @resp_len: length of the response buffer
+ *
+ * Sends a command to the SCM and waits for the command to finish processing.
+ *
+ * A note on cache maintenance:
+ * Note that any buffers that are expected to be accessed by the secure world
+ * must be flushed before invoking qcom_scm_call and invalidated in the cache
+ * immediately after qcom_scm_call returns. Cache maintenance on the command
+ * and response buffers is taken care of by qcom_scm_call; however, callers are
+ * responsible for any other cached buffers passed over to the secure world.
+ */
+static int qcom_scm_call_legacy(struct device *dev, struct qcom_scm_desc *desc)
+{
+	int arglen = desc->arginfo & 0xf;
+	int ret = 0, context_id;
+	size_t i;
+	struct legacy_command *cmd;
+	struct legacy_response *rsp;
+	struct arm_smccc_args smc = {0};
+	struct arm_smccc_res res;
+	const size_t cmd_len = arglen * sizeof(__le32);
+	const size_t resp_len = MAX_QCOM_SCM_RETS * sizeof(__le32);
+	size_t alloc_len = sizeof(*cmd) + cmd_len + sizeof(*rsp) + resp_len;
+	dma_addr_t cmd_phys;
+	__le32 *arg_buf;
+	__le32 *res_buf;
+
+	cmd = kzalloc(PAGE_ALIGN(alloc_len), GFP_KERNEL);
+	if (!cmd)
+		return -ENOMEM;
+
+	cmd->len = cpu_to_le32(alloc_len);
+	cmd->buf_offset = cpu_to_le32(sizeof(*cmd));
+	cmd->resp_hdr_offset = cpu_to_le32(sizeof(*cmd) + cmd_len);
+	cmd->id = cpu_to_le32(LEGACY_FUNCNUM(desc->svc, desc->cmd));
+
+	arg_buf = legacy_get_command_buffer(cmd);
+	for (i = 0; i < arglen; i++)
+		arg_buf[i] = cpu_to_le32(desc->args[i]);
+
+	rsp = legacy_command_to_response(cmd);
+
+	cmd_phys = dma_map_single(dev, cmd, alloc_len, DMA_TO_DEVICE);
+	if (dma_mapping_error(dev, cmd_phys)) {
+		kfree(cmd);
+		return -ENOMEM;
+	}
+
+	smc.a[0] = 1;
+	smc.a[1] = (unsigned long)&context_id;
+	smc.a[2] = cmd_phys;
+
+	mutex_lock(&qcom_scm_lock);
+	__qcom_scm_call_do(&smc, &res);
+	if (res.a0 < 0)
+		ret = qcom_scm_remap_error(res.a0);
+	mutex_unlock(&qcom_scm_lock);
+	if (ret)
+		goto out;
+
+	do {
+		dma_sync_single_for_cpu(dev, cmd_phys + sizeof(*cmd) + cmd_len,
+					sizeof(*rsp), DMA_FROM_DEVICE);
+	} while (!rsp->is_complete);
+
+	dma_sync_single_for_cpu(dev, cmd_phys + sizeof(*cmd) + cmd_len +
+				le32_to_cpu(rsp->buf_offset),
+				resp_len, DMA_FROM_DEVICE);
+
+	res_buf = legacy_get_response_buffer(rsp);
+	for (i = 0; i < MAX_QCOM_SCM_RETS; i++)
+		desc->res[i] = le32_to_cpu(res_buf[i]);
+out:
+	dma_unmap_single(dev, cmd_phys, alloc_len, DMA_TO_DEVICE);
+	kfree(cmd);
+	return ret;
+}
+
+#define LEGACY_ATOMIC_N_REG_ARGS	5
+#define LEGACY_ATOMIC_FIRST_REG_IDX	2
+#define LEGACY_CLASS_REGISTER	(0x2 << 8)
+#define LEGACY_MASK_IRQS		BIT(5)
+#define LEGACY_ATOMIC(svc, cmd, n) ((LEGACY_FUNCNUM(svc, cmd) << 12) | \
+				    LEGACY_CLASS_REGISTER | \
+				    LEGACY_MASK_IRQS | \
+				    (n & 0xf))
+
+/**
+ * qcom_scm_call_atomic_legacy() - Send an atomic SCM command with up to
+ * 5 arguments and 3 return values
+ *
+ * This shall only be used with commands that are guaranteed to be
+ * uninterruptable, atomic and SMP safe.
+ */
+static int qcom_scm_call_atomic_legacy(struct device *dev,
+				       struct qcom_scm_desc *desc)
+{
+	int context_id;
+	struct arm_smccc_args smc = {0};
+	struct arm_smccc_res res;
+	size_t i, arglen = desc->arginfo & 0xf;
+
+	BUG_ON(arglen > LEGACY_ATOMIC_N_REG_ARGS);
+
+	smc.a[0] = LEGACY_ATOMIC(desc->svc, desc->cmd, arglen);
+	smc.a[1] = (unsigned long)&context_id;
+
+	for(i = 0; i < arglen; i++)
+		smc.a[i + LEGACY_ATOMIC_FIRST_REG_IDX] = desc->args[i];
+
+	arm_smccc_smc(smc.a[0], smc.a[1], smc.a[2], smc.a[3],
+		      smc.a[4], smc.a[5], smc.a[6], smc.a[7], &res);
+
+	desc->res[0] = res.a1;
+	desc->res[1] = res.a2;
+	desc->res[2] = res.a3;
+
+	return res.a0;
+}
+
 /**
  * qcom_scm_call() - Invoke a syscall in the secure world
  * @dev:	device
@@ -194,7 +411,7 @@ static int ___qcom_scm_call_smccc(struct device *dev,
 static int qcom_scm_call(struct device *dev, struct qcom_scm_desc *desc)
 {
 	might_sleep();
-	return ___qcom_scm_call_smccc(dev, desc, false);
+	return qcom_scm_call_smccc(dev, desc, false);
 }
 
 /**
@@ -210,9 +427,14 @@ static int qcom_scm_call(struct device *dev, struct qcom_scm_desc *desc)
  */
 static int qcom_scm_call_atomic(struct device *dev, struct qcom_scm_desc *desc)
 {
-	return ___qcom_scm_call_smccc(dev, desc, true);
+	return qcom_scm_call_smccc(dev, desc, true);
 }
 
+#define QCOM_SCM_FLAG_COLDBOOT_CPU0	0x00
+#define QCOM_SCM_FLAG_COLDBOOT_CPU1	0x01
+#define QCOM_SCM_FLAG_COLDBOOT_CPU2	0x08
+#define QCOM_SCM_FLAG_COLDBOOT_CPU3	0x20
+
 /**
  * qcom_scm_set_cold_boot_addr() - Set the cold boot address for cpus
  * @entry: Entry point function for the cpus
@@ -224,9 +446,54 @@ static int qcom_scm_call_atomic(struct device *dev, struct qcom_scm_desc *desc)
 int __qcom_scm_set_cold_boot_addr(struct device *dev, void *entry,
 				  const cpumask_t *cpus)
 {
-	return -ENOTSUPP;
+	int flags = 0;
+	int cpu;
+	int scm_cb_flags[] = {
+		QCOM_SCM_FLAG_COLDBOOT_CPU0,
+		QCOM_SCM_FLAG_COLDBOOT_CPU1,
+		QCOM_SCM_FLAG_COLDBOOT_CPU2,
+		QCOM_SCM_FLAG_COLDBOOT_CPU3,
+	};
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_BOOT,
+		.cmd = QCOM_SCM_BOOT_SET_ADDR,
+		.owner = ARM_SMCCC_OWNER_SIP,
+	};
+
+	if (!cpus || (cpus && cpumask_empty(cpus)))
+		return -EINVAL;
+
+	for_each_cpu(cpu, cpus) {
+		if (cpu < ARRAY_SIZE(scm_cb_flags))
+			flags |= scm_cb_flags[cpu];
+		else
+			set_cpu_present(cpu, false);
+	}
+
+	desc.args[0] = flags;
+	desc.args[1] = virt_to_phys(entry);
+	desc.arginfo = QCOM_SCM_ARGS(2);
+
+	return qcom_scm_call_atomic(dev, &desc);
 }
 
+#define QCOM_SCM_FLAG_WARMBOOT_CPU0	0x04
+#define QCOM_SCM_FLAG_WARMBOOT_CPU1	0x02
+#define QCOM_SCM_FLAG_WARMBOOT_CPU2	0x10
+#define QCOM_SCM_FLAG_WARMBOOT_CPU3	0x40
+
+struct qcom_scm_entry {
+	int flag;
+	void *entry;
+};
+
+static struct qcom_scm_entry qcom_scm_wb[] = {
+	{ .flag = QCOM_SCM_FLAG_WARMBOOT_CPU0 },
+	{ .flag = QCOM_SCM_FLAG_WARMBOOT_CPU1 },
+	{ .flag = QCOM_SCM_FLAG_WARMBOOT_CPU2 },
+	{ .flag = QCOM_SCM_FLAG_WARMBOOT_CPU3 },
+};
+
 /**
  * qcom_scm_set_warm_boot_addr() - Set the warm boot address for cpus
  * @dev: Device pointer
@@ -239,7 +506,37 @@ int __qcom_scm_set_cold_boot_addr(struct device *dev, void *entry,
 int __qcom_scm_set_warm_boot_addr(struct device *dev, void *entry,
 				  const cpumask_t *cpus)
 {
-	return -ENOTSUPP;
+	int ret;
+	int flags = 0;
+	int cpu;
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_BOOT,
+		.cmd = QCOM_SCM_BOOT_SET_ADDR,
+	};
+
+	/*
+	 * Reassign only if we are switching from hotplug entry point
+	 * to cpuidle entry point or vice versa.
+	 */
+	for_each_cpu(cpu, cpus) {
+		if (entry == qcom_scm_wb[cpu].entry)
+			continue;
+		flags |= qcom_scm_wb[cpu].flag;
+	}
+
+	/* No change in entry function */
+	if (!flags)
+		return 0;
+
+	desc.args[0] = virt_to_phys(entry);
+	desc.args[1] = flags;
+	ret = qcom_scm_call(dev, &desc);
+	if (!ret) {
+		for_each_cpu(cpu, cpus)
+			qcom_scm_wb[cpu].entry = entry;
+	}
+
+	return ret;
 }
 
 /**
@@ -252,6 +549,15 @@ int __qcom_scm_set_warm_boot_addr(struct device *dev, void *entry,
  */
 void __qcom_scm_cpu_power_down(struct device *dev, u32 flags)
 {
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_BOOT,
+		.cmd = QCOM_SCM_BOOT_TERMINATE_PC,
+		.args[0] = flags & QCOM_SCM_FLUSH_FLAG_MASK,
+		.arginfo = QCOM_SCM_ARGS(1),
+		.owner = ARM_SMCCC_OWNER_SIP,
+	};
+
+	qcom_scm_call_atomic(dev, &desc);
 }
 
 int __qcom_scm_set_remote_state(struct device *dev, u32 state, u32 id)
@@ -284,7 +590,7 @@ int __qcom_scm_set_dload_mode(struct device *dev, bool enable)
 	desc.args[1] = enable ? QCOM_SCM_BOOT_SET_DLOAD_MODE : 0;
 	desc.arginfo = QCOM_SCM_ARGS(2);
 
-	return qcom_scm_call(dev, &desc);
+	return qcom_scm_call_atomic(dev, &desc);
 }
 
 bool __qcom_scm_pas_supported(struct device *dev, u32 peripheral)
@@ -408,7 +714,7 @@ int __qcom_scm_io_readl(struct device *dev, phys_addr_t addr,
 	desc.args[0] = addr;
 	desc.arginfo = QCOM_SCM_ARGS(1);
 
-	ret = qcom_scm_call(dev, &desc);
+	ret = qcom_scm_call_atomic(dev, &desc);
 	if (ret >= 0)
 		*val = desc.res[0];
 
@@ -427,7 +733,7 @@ int __qcom_scm_io_writel(struct device *dev, phys_addr_t addr, unsigned int val)
 	desc.args[1] = val;
 	desc.arginfo = QCOM_SCM_ARGS(2);
 
-	return qcom_scm_call(dev, &desc);
+	return qcom_scm_call_atomic(dev, &desc);
 }
 
 int __qcom_scm_is_call_available(struct device *dev, u32 svc_id, u32 cmd_id)
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

