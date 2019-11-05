Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12D67EF2BD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2019 02:29:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387648AbfKEB2j (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Nov 2019 20:28:39 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:38582 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387639AbfKEB2i (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Nov 2019 20:28:38 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 3724460E07; Tue,  5 Nov 2019 01:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572917313;
        bh=+A1O22QOZQgUt0MR7pgjwXAtHNMVTtTLk2MBW0lZJAg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=VmYYmbgzuO2r5x9kWudn7DPX2mcS1hona5wr80eUX4+L83UlaEBMJkqTRPfJi10SA
         Ai3/0x/93YtB2/vWquPQbHshoAr0SRxjbo8o1kmeuAsLkHFedGmy/z38UyE5ErZ7qU
         JF3tnFOawQl9sXeS2FPbXdnoDBzkUORoMXEJv6Pw=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id F26AE60FF8;
        Tue,  5 Nov 2019 01:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572917285;
        bh=+A1O22QOZQgUt0MR7pgjwXAtHNMVTtTLk2MBW0lZJAg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=i7TBPYasyij2ti6ILtIIcCbAs7cQ+RACV5x0ol9KVeumh9jplvAz4LY4uOpMLfqb0
         15YBzCmgc1wKXeuKvTDzUE2fFi6pVkqVArVFiuirk6AoeYD2QQ8BrkUXljFyc/+ftf
         wvXN4ZR7FlX8kmncuFoOLlOq31afsv8B6JF7C3Hg=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org F26AE60FF8
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=eberman@codeaurora.org
From:   Elliot Berman <eberman@codeaurora.org>
To:     bjorn.andersson@linaro.org, saiprakash.ranjan@codeaurora.org,
        agross@kernel.org
Cc:     tsoni@codeaurora.org, sidgup@codeaurora.org,
        psodagud@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Elliot Berman <eberman@codeaurora.org>
Subject: [PATCH 17/17] firmware: qcom_scm: Rename -64 -> -smc, remove -32
Date:   Mon,  4 Nov 2019 17:27:36 -0800
Message-Id: <1572917256-24205-18-git-send-email-eberman@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1572917256-24205-1-git-send-email-eberman@codeaurora.org>
References: <1572917256-24205-1-git-send-email-eberman@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

- Rename qcom_scm-64.c to qcom_scm-smc as it supports SMC-based calling conventions
  for 32 and 64-bit targets
- Remove qcom_scm-32.c as it has been superceded by qcom_scm-smc.c
- Update Kconfig to select QCOM_SCM_TRANSPORT_SMC on ARM and ARM64
  targets

Signed-off-by: Elliot Berman <eberman@codeaurora.org>
---
 drivers/firmware/Kconfig        |  18 +-
 drivers/firmware/Makefile       |   4 +-
 drivers/firmware/qcom_scm-32.c  | 660 ----------------------------
 drivers/firmware/qcom_scm-64.c  | 949 ----------------------------------------
 drivers/firmware/qcom_scm-smc.c | 949 ++++++++++++++++++++++++++++++++++++++++
 5 files changed, 961 insertions(+), 1619 deletions(-)
 delete mode 100644 drivers/firmware/qcom_scm-32.c
 delete mode 100644 drivers/firmware/qcom_scm-64.c
 create mode 100644 drivers/firmware/qcom_scm-smc.c

diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
index e40a77b..ad477ca 100644
--- a/drivers/firmware/Kconfig
+++ b/drivers/firmware/Kconfig
@@ -236,16 +236,20 @@ config INTEL_STRATIX10_RSU
 
 config QCOM_SCM
 	bool
-	depends on ARM || ARM64
+	depends on QCOM_SCM_TRANSPORT_SMC
 	select RESET_CONTROLLER
+	help
+	  This option enables support for communicating with
+	  Qualcomm secure worlds.
 
-config QCOM_SCM_32
-	def_bool y
-	depends on QCOM_SCM && ARM
-
-config QCOM_SCM_64
+config QCOM_SCM_TRANSPORT_SMC
 	def_bool y
-	depends on QCOM_SCM && ARM64
+	depends on ARM || ARM64
+	help
+	  This option enables support for communicating with
+	  Qualcomm secure worlds via the SMC instruction, using
+	  either ARM SMCCC or legacy calling convention by querying
+	  the Qualcomm secure world.
 
 config QCOM_SCM_DOWNLOAD_MODE_DEFAULT
 	bool "Qualcomm download mode enabled by default"
diff --git a/drivers/firmware/Makefile b/drivers/firmware/Makefile
index 3fcb919..fc250f0 100644
--- a/drivers/firmware/Makefile
+++ b/drivers/firmware/Makefile
@@ -18,9 +18,7 @@ obj-$(CONFIG_FIRMWARE_MEMMAP)	+= memmap.o
 obj-$(CONFIG_RASPBERRYPI_FIRMWARE) += raspberrypi.o
 obj-$(CONFIG_FW_CFG_SYSFS)	+= qemu_fw_cfg.o
 obj-$(CONFIG_QCOM_SCM)		+= qcom_scm.o
-obj-$(CONFIG_QCOM_SCM_64)	+= qcom_scm-64.o
-obj-$(CONFIG_QCOM_SCM_32)	+= qcom_scm-32.o
-CFLAGS_qcom_scm-32.o :=$(call as-instr,.arch armv7-a\n.arch_extension sec,-DREQUIRES_SEC=1) -march=armv7-a
+obj-$(CONFIG_QCOM_SCM_TRANSPORT_SMC)	+= qcom_scm-smc.o
 obj-$(CONFIG_TI_SCI_PROTOCOL)	+= ti_sci.o
 obj-$(CONFIG_TRUSTED_FOUNDATIONS) += trusted_foundations.o
 obj-$(CONFIG_TURRIS_MOX_RWTM)	+= turris-mox-rwtm.o
diff --git a/drivers/firmware/qcom_scm-32.c b/drivers/firmware/qcom_scm-32.c
deleted file mode 100644
index 3325c21..0000000
--- a/drivers/firmware/qcom_scm-32.c
+++ /dev/null
@@ -1,660 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/* Copyright (c) 2010,2015,2019 The Linux Foundation. All rights reserved.
- * Copyright (C) 2015 Linaro Ltd.
- */
-
-#include <linux/slab.h>
-#include <linux/io.h>
-#include <linux/module.h>
-#include <linux/mutex.h>
-#include <linux/errno.h>
-#include <linux/err.h>
-#include <linux/qcom_scm.h>
-#include <linux/arm-smccc.h>
-#include <linux/dma-mapping.h>
-
-#include "qcom_scm.h"
-
-#define QCOM_SCM_FLAG_COLDBOOT_CPU0	0x00
-#define QCOM_SCM_FLAG_COLDBOOT_CPU1	0x01
-#define QCOM_SCM_FLAG_COLDBOOT_CPU2	0x08
-#define QCOM_SCM_FLAG_COLDBOOT_CPU3	0x20
-
-#define QCOM_SCM_FLAG_WARMBOOT_CPU0	0x04
-#define QCOM_SCM_FLAG_WARMBOOT_CPU1	0x02
-#define QCOM_SCM_FLAG_WARMBOOT_CPU2	0x10
-#define QCOM_SCM_FLAG_WARMBOOT_CPU3	0x40
-
-struct qcom_scm_entry {
-	int flag;
-	void *entry;
-};
-
-static struct qcom_scm_entry qcom_scm_wb[] = {
-	{ .flag = QCOM_SCM_FLAG_WARMBOOT_CPU0 },
-	{ .flag = QCOM_SCM_FLAG_WARMBOOT_CPU1 },
-	{ .flag = QCOM_SCM_FLAG_WARMBOOT_CPU2 },
-	{ .flag = QCOM_SCM_FLAG_WARMBOOT_CPU3 },
-};
-
-static DEFINE_MUTEX(qcom_scm_lock);
-
-#define MAX_QCOM_SCM_ARGS 10
-#define MAX_QCOM_SCM_RETS 3
-
-enum qcom_scm_arg_types {
-	QCOM_SCM_VAL,
-	QCOM_SCM_RO,
-	QCOM_SCM_RW,
-	QCOM_SCM_BUFVAL,
-};
-
-#define QCOM_SCM_ARGS_IMPL(num, a, b, c, d, e, f, g, h, i, j, ...) (\
-			   (((a) & 0x3) << 4) | \
-			   (((b) & 0x3) << 6) | \
-			   (((c) & 0x3) << 8) | \
-			   (((d) & 0x3) << 10) | \
-			   (((e) & 0x3) << 12) | \
-			   (((f) & 0x3) << 14) | \
-			   (((g) & 0x3) << 16) | \
-			   (((h) & 0x3) << 18) | \
-			   (((i) & 0x3) << 20) | \
-			   (((j) & 0x3) << 22) | \
-			   ((num) & 0xf))
-
-#define QCOM_SCM_ARGS(...) QCOM_SCM_ARGS_IMPL(__VA_ARGS__, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
-
-/**
- * struct qcom_scm_desc
- * @arginfo:	Metadata describing the arguments in args[]
- * @args:	The array of arguments for the secure syscall
- * @res:	The values returned by the secure syscall
- */
-struct qcom_scm_desc {
-	u32 svc;
-	u32 cmd;
-	u32 arginfo;
-	u64 args[MAX_QCOM_SCM_ARGS];
-	u64 res[MAX_QCOM_SCM_RETS];
-	u32 owner;
-};
-struct arm_smccc_args {
-	unsigned long a[8];
-};
-
-#define LEGACY_FUNCNUM(s, c)  (((s) << 10) | ((c) & 0x3ff))
-
-/**
- * struct legacy_command - one SCM command buffer
- * @len: total available memory for command and response
- * @buf_offset: start of command buffer
- * @resp_hdr_offset: start of response buffer
- * @id: command to be executed
- * @buf: buffer returned from legacy_get_command_buffer()
- *
- * An SCM command is laid out in memory as follows:
- *
- *	------------------- <--- struct legacy_command
- *	| command header  |
- *	------------------- <--- legacy_get_command_buffer()
- *	| command buffer  |
- *	------------------- <--- struct legacy_response and
- *	| response header |      legacy_command_to_response()
- *	------------------- <--- legacy_get_response_buffer()
- *	| response buffer |
- *	-------------------
- *
- * There can be arbitrary padding between the headers and buffers so
- * you should always use the appropriate qcom_scm_get_*_buffer() routines
- * to access the buffers in a safe manner.
- */
-struct legacy_command {
-	__le32 len;
-	__le32 buf_offset;
-	__le32 resp_hdr_offset;
-	__le32 id;
-	__le32 buf[0];
-};
-
-/**
- * struct legacy_response - one SCM response buffer
- * @len: total available memory for response
- * @buf_offset: start of response data relative to start of legacy_response
- * @is_complete: indicates if the command has finished processing
- */
-struct legacy_response {
-	__le32 len;
-	__le32 buf_offset;
-	__le32 is_complete;
-};
-
-/**
- * legacy_command_to_response() - Get a pointer to a legacy_response
- * @cmd: command
- *
- * Returns a pointer to a response for a command.
- */
-static inline struct legacy_response *legacy_command_to_response(
-		const struct legacy_command *cmd)
-{
-	return (void *)cmd + le32_to_cpu(cmd->resp_hdr_offset);
-}
-
-/**
- * legacy_get_command_buffer() - Get a pointer to a command buffer
- * @cmd: command
- *
- * Returns a pointer to the command buffer of a command.
- */
-static inline void *legacy_get_command_buffer(const struct legacy_command *cmd)
-{
-	return (void *)cmd->buf;
-}
-
-/**
- * legacy_get_response_buffer() - Get a pointer to a response buffer
- * @rsp: response
- *
- * Returns a pointer to a response buffer of a response.
- */
-static inline void *legacy_get_response_buffer(const struct legacy_response *rsp)
-{
-	return (void *)rsp + le32_to_cpu(rsp->buf_offset);
-}
-
-static void __qcom_scm_call_do(const struct arm_smccc_args *smc,
-			      struct arm_smccc_res *res)
-{
-	do {
-		arm_smccc_smc(smc->a[0], smc->a[1], smc->a[2], smc->a[3],
-			      smc->a[4], smc->a[5], smc->a[6], smc->a[7], res);
-	} while (res->a0 == QCOM_SCM_INTERRUPTED);
-}
-
-/**
- * qcom_scm_call() - Send an SCM command
- * @dev: struct device
- * @svc_id: service identifier
- * @cmd_id: command identifier
- * @cmd_buf: command buffer
- * @cmd_len: length of the command buffer
- * @resp_buf: response buffer
- * @resp_len: length of the response buffer
- *
- * Sends a command to the SCM and waits for the command to finish processing.
- *
- * A note on cache maintenance:
- * Note that any buffers that are expected to be accessed by the secure world
- * must be flushed before invoking qcom_scm_call and invalidated in the cache
- * immediately after qcom_scm_call returns. Cache maintenance on the command
- * and response buffers is taken care of by qcom_scm_call; however, callers are
- * responsible for any other cached buffers passed over to the secure world.
- */
-static int qcom_scm_call(struct device *dev, struct qcom_scm_desc *desc)
-{
-	int arglen = desc->arginfo & 0xf;
-	int ret = 0, context_id;
-	size_t i;
-	struct legacy_command *cmd;
-	struct legacy_response *rsp;
-	struct arm_smccc_args smc = {0};
-	struct arm_smccc_res res;
-	const size_t cmd_len = arglen * sizeof(__le32);
-	const size_t resp_len = MAX_QCOM_SCM_RETS * sizeof(__le32);
-	size_t alloc_len = sizeof(*cmd) + cmd_len + sizeof(*rsp) + resp_len;
-	dma_addr_t cmd_phys;
-	__le32 *arg_buf;
-	__le32 *res_buf;
-
-	cmd = kzalloc(PAGE_ALIGN(alloc_len), GFP_KERNEL);
-	if (!cmd)
-		return -ENOMEM;
-
-	cmd->len = cpu_to_le32(alloc_len);
-	cmd->buf_offset = cpu_to_le32(sizeof(*cmd));
-	cmd->resp_hdr_offset = cpu_to_le32(sizeof(*cmd) + cmd_len);
-	cmd->id = cpu_to_le32(LEGACY_FUNCNUM(desc->svc, desc->cmd));
-
-	arg_buf = legacy_get_command_buffer(cmd);
-	for (i = 0; i < arglen; i++)
-		arg_buf[i] = cpu_to_le32(desc->args[i]);
-
-	rsp = legacy_command_to_response(cmd);
-
-	cmd_phys = dma_map_single(dev, cmd, alloc_len, DMA_TO_DEVICE);
-	if (dma_mapping_error(dev, cmd_phys)) {
-		kfree(cmd);
-		return -ENOMEM;
-	}
-
-	smc.a[0] = 1;
-	smc.a[1] = (unsigned long)&context_id;
-	smc.a[2] = cmd_phys;
-
-	mutex_lock(&qcom_scm_lock);
-	__qcom_scm_call_do(&smc, &res);
-	if (res.a0 < 0)
-		ret = qcom_scm_remap_error(res.a0);
-	mutex_unlock(&qcom_scm_lock);
-	if (ret)
-		goto out;
-
-	do {
-		dma_sync_single_for_cpu(dev, cmd_phys + sizeof(*cmd) + cmd_len,
-					sizeof(*rsp), DMA_FROM_DEVICE);
-	} while (!rsp->is_complete);
-
-	dma_sync_single_for_cpu(dev, cmd_phys + sizeof(*cmd) + cmd_len +
-				le32_to_cpu(rsp->buf_offset),
-				resp_len, DMA_FROM_DEVICE);
-
-	res_buf = legacy_get_response_buffer(rsp);
-	for (i = 0; i < MAX_QCOM_SCM_RETS; i++)
-		desc->res[i] = le32_to_cpu(res_buf[i]);
-out:
-	dma_unmap_single(dev, cmd_phys, alloc_len, DMA_TO_DEVICE);
-	kfree(cmd);
-	return ret;
-}
-
-#define LEGACY_ATOMIC_N_REG_ARGS	5
-#define LEGACY_ATOMIC_FIRST_REG_IDX	2
-#define LEGACY_CLASS_REGISTER	(0x2 << 8)
-#define LEGACY_MASK_IRQS		BIT(5)
-#define LEGACY_ATOMIC(svc, cmd, n) ((LEGACY_FUNCNUM(svc, cmd) << 12) | \
-				    LEGACY_CLASS_REGISTER | \
-				    LEGACY_MASK_IRQS | \
-				    (n & 0xf))
-
-/**
- * qcom_scm_call_atomic() - Send an atomic SCM command with up to 5 arguments
- * and 3 return values
- *
- * This shall only be used with commands that are guaranteed to be
- * uninterruptable, atomic and SMP safe.
- */
-static int qcom_scm_call_atomic(struct device *dev, struct qcom_scm_desc *desc)
-{
-	int context_id;
-	struct arm_smccc_args smc = {0};
-	struct arm_smccc_res res;
-	size_t i, arglen = desc->arginfo & 0xf;
-
-	BUG_ON(arglen > LEGACY_ATOMIC_N_REG_ARGS);
-
-	smc.a[0] = LEGACY_ATOMIC(desc->svc, desc->cmd, arglen);
-	smc.a[1] = (unsigned long)&context_id;
-
-	for (i = 0; i < arglen; i++)
-		smc.a[i + LEGACY_ATOMIC_FIRST_REG_IDX] = desc->args[i];
-
-	arm_smccc_smc(smc.a[0], smc.a[1], smc.a[2], smc.a[3],
-		      smc.a[4], smc.a[5], smc.a[6], smc.a[7], &res);
-
-	desc->res[0] = res.a1;
-	desc->res[1] = res.a2;
-	desc->res[2] = res.a3;
-
-	return res.a0;
-}
-
-/**
- * qcom_scm_set_cold_boot_addr() - Set the cold boot address for cpus
- * @entry: Entry point function for the cpus
- * @cpus: The cpumask of cpus that will use the entry point
- *
- * Set the cold boot address of the cpus. Any cpu outside the supported
- * range would be removed from the cpu present mask.
- */
-int __qcom_scm_set_cold_boot_addr(struct device *dev, void *entry,
-				  const cpumask_t *cpus)
-{
-	int flags = 0;
-	int cpu;
-	int scm_cb_flags[] = {
-		QCOM_SCM_FLAG_COLDBOOT_CPU0,
-		QCOM_SCM_FLAG_COLDBOOT_CPU1,
-		QCOM_SCM_FLAG_COLDBOOT_CPU2,
-		QCOM_SCM_FLAG_COLDBOOT_CPU3,
-	};
-	struct qcom_scm_desc desc = {
-		.svc = QCOM_SCM_SVC_BOOT,
-		.cmd = QCOM_SCM_BOOT_SET_ADDR,
-		.owner = ARM_SMCCC_OWNER_SIP,
-	};
-
-	if (!cpus || (cpus && cpumask_empty(cpus)))
-		return -EINVAL;
-
-	for_each_cpu(cpu, cpus) {
-		if (cpu < ARRAY_SIZE(scm_cb_flags))
-			flags |= scm_cb_flags[cpu];
-		else
-			set_cpu_present(cpu, false);
-	}
-
-	desc.args[0] = flags;
-	desc.args[1] = virt_to_phys(entry);
-	desc.arginfo = QCOM_SCM_ARGS(2);
-
-	return qcom_scm_call_atomic(dev, &desc);
-}
-
-/**
- * qcom_scm_set_warm_boot_addr() - Set the warm boot address for cpus
- * @entry: Entry point function for the cpus
- * @cpus: The cpumask of cpus that will use the entry point
- *
- * Set the Linux entry point for the SCM to transfer control to when coming
- * out of a power down. CPU power down may be executed on cpuidle or hotplug.
- */
-int __qcom_scm_set_warm_boot_addr(struct device *dev, void *entry,
-				  const cpumask_t *cpus)
-{
-	int ret;
-	int flags = 0;
-	int cpu;
-	struct qcom_scm_desc desc = {
-		.svc = QCOM_SCM_SVC_BOOT,
-		.cmd = QCOM_SCM_BOOT_SET_ADDR,
-		.arginfo = QCOM_SCM_ARGS(2),
-	};
-
-	/*
-	 * Reassign only if we are switching from hotplug entry point
-	 * to cpuidle entry point or vice versa.
-	 */
-	for_each_cpu(cpu, cpus) {
-		if (entry == qcom_scm_wb[cpu].entry)
-			continue;
-		flags |= qcom_scm_wb[cpu].flag;
-	}
-
-	/* No change in entry function */
-	if (!flags)
-		return 0;
-
-	desc.args[0] = flags;
-	desc.args[1] = virt_to_phys(entry);
-	ret = qcom_scm_call(dev, &desc);
-	if (!ret) {
-		for_each_cpu(cpu, cpus)
-			qcom_scm_wb[cpu].entry = entry;
-	}
-
-	return ret;
-}
-
-/**
- * qcom_scm_cpu_power_down() - Power down the cpu
- * @flags - Flags to flush cache
- *
- * This is an end point to power down cpu. If there was a pending interrupt,
- * the control would return from this function, otherwise, the cpu jumps to the
- * warm boot entry point set for this cpu upon reset.
- */
-void __qcom_scm_cpu_power_down(struct device *dev, u32 flags)
-{
-	struct qcom_scm_desc desc = {
-		.svc = QCOM_SCM_SVC_BOOT,
-		.cmd = QCOM_SCM_BOOT_TERMINATE_PC,
-		.args[0] = flags & QCOM_SCM_FLUSH_FLAG_MASK,
-		.arginfo = QCOM_SCM_ARGS(1),
-		.owner = ARM_SMCCC_OWNER_SIP,
-	};
-
-	qcom_scm_call_atomic(dev, &desc);
-}
-
-int __qcom_scm_set_remote_state(struct device *dev, u32 state, u32 id)
-{
-	struct qcom_scm_desc desc = {
-		.svc = QCOM_SCM_SVC_BOOT,
-		.cmd = QCOM_SCM_BOOT_SET_REMOTE_STATE,
-		.owner = ARM_SMCCC_OWNER_SIP,
-	};
-	int ret;
-
-	desc.args[0] = state;
-	desc.args[1] = id;
-	desc.arginfo = QCOM_SCM_ARGS(2);
-
-	ret = qcom_scm_call(dev, &desc);
-
-	return ret ? : desc.res[0];
-}
-
-int __qcom_scm_set_dload_mode(struct device *dev, bool enable)
-{
-	struct qcom_scm_desc desc = {
-		.svc = QCOM_SCM_SVC_BOOT,
-		.cmd = QCOM_SCM_BOOT_SET_DLOAD_MODE,
-		.owner = ARM_SMCCC_OWNER_SIP,
-	};
-
-	desc.args[0] = QCOM_SCM_BOOT_SET_DLOAD_MODE;
-	desc.args[1] = enable ? QCOM_SCM_BOOT_SET_DLOAD_MODE : 0;
-	desc.arginfo = QCOM_SCM_ARGS(2);
-
-	return qcom_scm_call_atomic(dev, &desc);
-}
-
-bool __qcom_scm_pas_supported(struct device *dev, u32 peripheral)
-{
-	int ret;
-	struct qcom_scm_desc desc = {
-		.svc = QCOM_SCM_SVC_PIL,
-		.cmd = QCOM_SCM_PIL_PAS_IS_SUPPORTED,
-		.owner = ARM_SMCCC_OWNER_SIP,
-	};
-
-	desc.args[0] = peripheral;
-	desc.arginfo = QCOM_SCM_ARGS(1);
-
-	ret = qcom_scm_call(dev, &desc);
-
-	return ret ? false : !!desc.res[0];
-}
-
-int __qcom_scm_pas_init_image(struct device *dev, u32 peripheral,
-			      dma_addr_t metadata_phys)
-{
-	int ret;
-	struct qcom_scm_desc desc = {
-		.svc = QCOM_SCM_SVC_PIL,
-		.cmd = QCOM_SCM_PIL_PAS_INIT_IMAGE,
-		.owner = ARM_SMCCC_OWNER_SIP,
-	};
-
-	desc.args[0] = peripheral;
-	desc.args[1] = metadata_phys;
-	desc.arginfo = QCOM_SCM_ARGS(2, QCOM_SCM_VAL, QCOM_SCM_RW);
-
-	ret = qcom_scm_call(dev, &desc);
-
-	return ret ? : desc.res[0];
-}
-
-int __qcom_scm_pas_mem_setup(struct device *dev, u32 peripheral,
-			      phys_addr_t addr, phys_addr_t size)
-{
-	int ret;
-	struct qcom_scm_desc desc = {
-		.svc = QCOM_SCM_SVC_PIL,
-		.cmd = QCOM_SCM_PIL_PAS_MEM_SETUP,
-		.owner = ARM_SMCCC_OWNER_SIP,
-	};
-
-	desc.args[0] = peripheral;
-	desc.args[1] = addr;
-	desc.args[2] = size;
-	desc.arginfo = QCOM_SCM_ARGS(3);
-
-	ret = qcom_scm_call(dev, &desc);
-
-	return ret ? : desc.res[0];
-}
-
-int __qcom_scm_pas_auth_and_reset(struct device *dev, u32 peripheral)
-{
-	int ret;
-	struct qcom_scm_desc desc = {
-		.svc = QCOM_SCM_SVC_PIL,
-		.cmd = QCOM_SCM_PIL_PAS_AUTH_AND_RESET,
-		.owner = ARM_SMCCC_OWNER_SIP,
-	};
-
-	ret = qcom_scm_call(dev, &desc);
-
-	return ret ? : desc.res[0];
-}
-
-int __qcom_scm_pas_shutdown(struct device *dev, u32 peripheral)
-{
-	struct qcom_scm_desc desc = {
-		.svc = QCOM_SCM_SVC_PIL,
-		.cmd = QCOM_SCM_PIL_PAS_SHUTDOWN,
-		.owner = ARM_SMCCC_OWNER_SIP,
-	};
-	int ret;
-
-	desc.args[0] = peripheral;
-	desc.arginfo = QCOM_SCM_ARGS(1);
-
-	ret = qcom_scm_call(dev, &desc);
-
-	return ret ? : desc.res[0];
-}
-
-int __qcom_scm_pas_mss_reset(struct device *dev, bool reset)
-{
-	struct qcom_scm_desc desc = {
-		.svc = QCOM_SCM_SVC_PIL,
-		.cmd = QCOM_SCM_PIL_PAS_MSS_RESET,
-		.owner = ARM_SMCCC_OWNER_SIP,
-	};
-	int ret;
-
-	desc.args[0] = reset;
-	desc.args[1] = 0;
-	desc.arginfo = QCOM_SCM_ARGS(2);
-
-	ret = qcom_scm_call(dev, &desc);
-
-	return ret ? : desc.res[0];
-}
-
-int __qcom_scm_io_readl(struct device *dev, phys_addr_t addr,
-			unsigned int *val)
-{
-	int ret;
-	struct qcom_scm_desc desc = {
-		.svc = QCOM_SCM_SVC_IO,
-		.cmd = QCOM_SCM_IO_READ,
-		.owner = ARM_SMCCC_OWNER_SIP,
-	};
-
-	desc.args[0] = addr;
-	desc.arginfo = QCOM_SCM_ARGS(1);
-
-	ret = qcom_scm_call_atomic(dev, &desc);
-	if (ret >= 0)
-		*val = desc.res[0];
-
-	return ret < 0 ? ret : 0;
-}
-
-int __qcom_scm_io_writel(struct device *dev, phys_addr_t addr, unsigned int val)
-{
-	struct qcom_scm_desc desc = {
-		.svc = QCOM_SCM_SVC_IO,
-		.cmd = QCOM_SCM_IO_WRITE,
-		.owner = ARM_SMCCC_OWNER_SIP,
-	};
-
-	desc.args[0] = addr;
-	desc.args[1] = val;
-	desc.arginfo = QCOM_SCM_ARGS(2);
-
-	return qcom_scm_call_atomic(dev, &desc);
-}
-
-int __qcom_scm_is_call_available(struct device *dev, u32 svc_id, u32 cmd_id)
-{
-	int ret;
-	struct qcom_scm_desc desc = {
-		.svc = QCOM_SCM_SVC_INFO,
-		.cmd = QCOM_SCM_INFO_IS_CALL_AVAIL,
-		.args[0] = (svc_id << 10) | cmd_id,
-		.arginfo = QCOM_SCM_ARGS(1),
-	};
-
-	ret = qcom_scm_call(dev, &desc);
-
-	return ret ? : desc.res[0];
-}
-
-int __qcom_scm_restore_sec_cfg(struct device *dev, u32 device_id,
-			       u32 spare)
-{
-	return -ENODEV;
-}
-
-int __qcom_scm_iommu_secure_ptbl_size(struct device *dev, u32 spare,
-				      size_t *size)
-{
-	return -ENODEV;
-}
-
-int __qcom_scm_iommu_secure_ptbl_init(struct device *dev, u64 addr, u32 size,
-				      u32 spare)
-{
-	return -ENODEV;
-}
-
-int __qcom_scm_assign_mem(struct device *dev, phys_addr_t mem_region,
-			  size_t mem_sz, phys_addr_t src, size_t src_sz,
-			  phys_addr_t dest, size_t dest_sz)
-{
-	return -ENODEV;
-}
-
-int __qcom_scm_hdcp_req(struct device *dev, struct qcom_scm_hdcp_req *req,
-			u32 req_cnt, u32 *resp)
-{
-	int ret;
-	struct qcom_scm_desc desc = {
-		.svc = QCOM_SCM_SVC_HDCP,
-		.cmd = QCOM_SCM_HDCP_INVOKE,
-		.owner = ARM_SMCCC_OWNER_SIP,
-	};
-
-	if (req_cnt > QCOM_SCM_HDCP_MAX_REQ_CNT)
-		return -ERANGE;
-
-	desc.args[0] = req[0].addr;
-	desc.args[1] = req[0].val;
-	desc.args[2] = req[1].addr;
-	desc.args[3] = req[1].val;
-	desc.args[4] = req[2].addr;
-	desc.args[5] = req[2].val;
-	desc.args[6] = req[3].addr;
-	desc.args[7] = req[3].val;
-	desc.args[8] = req[4].addr;
-	desc.args[9] = req[4].val;
-	desc.arginfo = QCOM_SCM_ARGS(req_cnt * 2);
-
-	ret = qcom_scm_call(dev, &desc);
-	*resp = desc.res[0];
-
-	return ret;
-}
-
-int __qcom_scm_qsmmu500_wait_safe_toggle(struct device *dev, bool enable)
-{
-	return -ENODEV;
-}
-
-void __qcom_scm_init(void)
-{
-}
diff --git a/drivers/firmware/qcom_scm-64.c b/drivers/firmware/qcom_scm-64.c
deleted file mode 100644
index 355d9d7..0000000
--- a/drivers/firmware/qcom_scm-64.c
+++ /dev/null
@@ -1,949 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/* Copyright (c) 2015,2019 The Linux Foundation. All rights reserved.
- */
-
-#include <linux/io.h>
-#include <linux/errno.h>
-#include <linux/delay.h>
-#include <linux/mutex.h>
-#include <linux/slab.h>
-#include <linux/types.h>
-#include <linux/qcom_scm.h>
-#include <linux/arm-smccc.h>
-#include <linux/dma-mapping.h>
-
-#include "qcom_scm.h"
-
-#define MAX_QCOM_SCM_ARGS 10
-#define MAX_QCOM_SCM_RETS 3
-
-enum qcom_scm_arg_types {
-	QCOM_SCM_VAL,
-	QCOM_SCM_RO,
-	QCOM_SCM_RW,
-	QCOM_SCM_BUFVAL,
-};
-
-#define QCOM_SCM_ARGS_IMPL(num, a, b, c, d, e, f, g, h, i, j, ...) (\
-			   (((a) & 0x3) << 4) | \
-			   (((b) & 0x3) << 6) | \
-			   (((c) & 0x3) << 8) | \
-			   (((d) & 0x3) << 10) | \
-			   (((e) & 0x3) << 12) | \
-			   (((f) & 0x3) << 14) | \
-			   (((g) & 0x3) << 16) | \
-			   (((h) & 0x3) << 18) | \
-			   (((i) & 0x3) << 20) | \
-			   (((j) & 0x3) << 22) | \
-			   ((num) & 0xf))
-
-#define QCOM_SCM_ARGS(...) QCOM_SCM_ARGS_IMPL(__VA_ARGS__, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
-
-/**
- * struct qcom_scm_desc
- * @arginfo:	Metadata describing the arguments in args[]
- * @args:	The array of arguments for the secure syscall
- * @res:	The values returned by the secure syscall
- */
-struct qcom_scm_desc {
-	u32 svc;
-	u32 cmd;
-	u32 arginfo;
-	u64 args[MAX_QCOM_SCM_ARGS];
-	u64 res[MAX_QCOM_SCM_RETS];
-	u32 owner;
-};
-
-struct arm_smccc_args {
-	unsigned long a[8];
-};
-
-enum qcom_smc_convention {
-	SMC_CONVENTION_UNKNOWN,
-	SMC_CONVENTION_LEGACY,
-	SMC_CONVENTION_ARM_32,
-	SMC_CONVENTION_ARM_64,
-};
-
-static enum qcom_smc_convention qcom_smc_convention = SMC_CONVENTION_UNKNOWN;
-static DEFINE_MUTEX(qcom_scm_lock);
-
-#define QCOM_SCM_EBUSY_WAIT_MS 30
-#define QCOM_SCM_EBUSY_MAX_RETRY 20
-
-#define SMCCC_FUNCNUM(s, c) ((((s) & 0xFF) << 8) | ((c) & 0xFF))
-#define SMCCC_N_REG_ARGS	4
-#define SMCCC_FIRST_REG_IDX	2
-#define SMCCC_N_EXT_ARGS	(MAX_QCOM_SCM_ARGS - SMCCC_N_REG_ARGS + 1)
-#define SMCCC_LAST_REG_IDX	(SMCCC_FIRST_REG_IDX + SMCCC_N_REG_ARGS - 1)
-
-static void __qcom_scm_call_do_quirk(const struct arm_smccc_args *smc,
-				     struct arm_smccc_res *res)
-{
-	unsigned long a0 = smc->a[0];
-	struct arm_smccc_quirk quirk = { .id = ARM_SMCCC_QUIRK_QCOM_A6 };
-
-	quirk.state.a6 = 0;
-
-	do {
-		arm_smccc_smc_quirk(a0, smc->a[1], smc->a[2], smc->a[3],
-				    smc->a[4], smc->a[5], quirk.state.a6,
-				    smc->a[7], res, &quirk);
-
-		if (res->a0 == QCOM_SCM_INTERRUPTED)
-			a0 = res->a0;
-
-	} while (res->a0 == QCOM_SCM_INTERRUPTED);
-}
-
-static int qcom_scm_call_smccc(struct device *dev,
-				  struct qcom_scm_desc *desc, bool atomic)
-{
-	int arglen = desc->arginfo & 0xf;
-	int i;
-	dma_addr_t args_phys = 0;
-	void *args_virt = NULL;
-	size_t alloc_len;
-	gfp_t flag = atomic ? GFP_ATOMIC : GFP_KERNEL;
-	struct arm_smccc_res res;
-	struct arm_smccc_args smc = {0};
-
-	smc.a[0] = ARM_SMCCC_CALL_VAL(
-		atomic ? ARM_SMCCC_FAST_CALL : ARM_SMCCC_STD_CALL,
-		(qcom_smc_convention == SMC_CONVENTION_ARM_64) ?
-			ARM_SMCCC_SMC_64 :
-			ARM_SMCCC_SMC_32,
-		desc->owner,
-		SMCCC_FUNCNUM(desc->svc, desc->cmd));
-	smc.a[1] = desc->arginfo;
-	for (i = 0; i < SMCCC_N_REG_ARGS; i++)
-		smc.a[i + SMCCC_FIRST_REG_IDX] = desc->args[i];
-
-	if (unlikely(arglen > SMCCC_N_REG_ARGS)) {
-		alloc_len = SMCCC_N_EXT_ARGS * sizeof(u64);
-		args_virt = kzalloc(PAGE_ALIGN(alloc_len), flag);
-
-		if (!args_virt)
-			return -ENOMEM;
-
-		if (qcom_smc_convention == SMC_CONVENTION_ARM_32) {
-			__le32 *args = args_virt;
-
-			for (i = 0; i < SMCCC_N_EXT_ARGS; i++)
-				args[i] = cpu_to_le32(desc->args[i +
-						      SMCCC_N_REG_ARGS - 1]);
-		} else {
-			__le64 *args = args_virt;
-
-			for (i = 0; i < SMCCC_N_EXT_ARGS; i++)
-				args[i] = cpu_to_le64(desc->args[i +
-						      SMCCC_N_REG_ARGS - 1]);
-		}
-
-		args_phys = dma_map_single(dev, args_virt, alloc_len,
-					   DMA_TO_DEVICE);
-
-		if (dma_mapping_error(dev, args_phys)) {
-			kfree(args_virt);
-			return -ENOMEM;
-		}
-
-		smc.a[SMCCC_LAST_REG_IDX] = args_phys;
-	}
-
-	if (atomic) {
-		__qcom_scm_call_do_quirk(&smc, &res);
-	} else {
-		int retry_count = 0;
-
-		do {
-			mutex_lock(&qcom_scm_lock);
-
-			__qcom_scm_call_do_quirk(&smc, &res);
-
-			mutex_unlock(&qcom_scm_lock);
-
-			if (res.a0 == QCOM_SCM_V2_EBUSY) {
-				if (retry_count++ > QCOM_SCM_EBUSY_MAX_RETRY)
-					break;
-				msleep(QCOM_SCM_EBUSY_WAIT_MS);
-			}
-		} while (res.a0 == QCOM_SCM_V2_EBUSY);
-	}
-
-	if (args_virt) {
-		dma_unmap_single(dev, args_phys, alloc_len, DMA_TO_DEVICE);
-		kfree(args_virt);
-	}
-
-	desc->res[0] = res.a1;
-	desc->res[1] = res.a2;
-	desc->res[2] = res.a3;
-
-	if (res.a0 < 0)
-		return qcom_scm_remap_error(res.a0);
-
-	return 0;
-}
-
-#define LEGACY_FUNCNUM(s, c)  (((s) << 10) | ((c) & 0x3ff))
-
-/**
- * struct legacy_command - one SCM command buffer
- * @len: total available memory for command and response
- * @buf_offset: start of command buffer
- * @resp_hdr_offset: start of response buffer
- * @id: command to be executed
- * @buf: buffer returned from legacy_get_command_buffer()
- *
- * An SCM command is laid out in memory as follows:
- *
- *	------------------- <--- struct legacy_command
- *	| command header  |
- *	------------------- <--- legacy_get_command_buffer()
- *	| command buffer  |
- *	------------------- <--- struct legacy_response and
- *	| response header |      legacy_command_to_response()
- *	------------------- <--- legacy_get_response_buffer()
- *	| response buffer |
- *	-------------------
- *
- * There can be arbitrary padding between the headers and buffers so
- * you should always use the appropriate qcom_scm_get_*_buffer() routines
- * to access the buffers in a safe manner.
- */
-struct legacy_command {
-	__le32 len;
-	__le32 buf_offset;
-	__le32 resp_hdr_offset;
-	__le32 id;
-	__le32 buf[0];
-};
-
-/**
- * struct legacy_response - one SCM response buffer
- * @len: total available memory for response
- * @buf_offset: start of response data relative to start of legacy_response
- * @is_complete: indicates if the command has finished processing
- */
-struct legacy_response {
-	__le32 len;
-	__le32 buf_offset;
-	__le32 is_complete;
-};
-
-/**
- * legacy_command_to_response() - Get a pointer to a legacy_response
- * @cmd: command
- *
- * Returns a pointer to a response for a command.
- */
-static inline struct legacy_response *legacy_command_to_response(
-		const struct legacy_command *cmd)
-{
-	return (void *)cmd + le32_to_cpu(cmd->resp_hdr_offset);
-}
-
-/**
- * legacy_get_command_buffer() - Get a pointer to a command buffer
- * @cmd: command
- *
- * Returns a pointer to the command buffer of a command.
- */
-static inline void *legacy_get_command_buffer(const struct legacy_command *cmd)
-{
-	return (void *)cmd->buf;
-}
-
-/**
- * legacy_get_response_buffer() - Get a pointer to a response buffer
- * @rsp: response
- *
- * Returns a pointer to a response buffer of a response.
- */
-static inline void *legacy_get_response_buffer(const struct legacy_response *rsp)
-{
-	return (void *)rsp + le32_to_cpu(rsp->buf_offset);
-}
-
-static void __qcom_scm_call_do(const struct arm_smccc_args *smc,
-			      struct arm_smccc_res *res)
-{
-	do {
-		arm_smccc_smc(smc->a[0], smc->a[1], smc->a[2], smc->a[3],
-			      smc->a[4], smc->a[5], smc->a[6], smc->a[7], res);
-	} while (res->a0 == QCOM_SCM_INTERRUPTED);
-}
-
-/**
- * qcom_scm_call_legacy() - Send an SCM command
- * @dev: struct device
- * @svc_id: service identifier
- * @cmd_id: command identifier
- * @cmd_buf: command buffer
- * @cmd_len: length of the command buffer
- * @resp_buf: response buffer
- * @resp_len: length of the response buffer
- *
- * Sends a command to the SCM and waits for the command to finish processing.
- *
- * A note on cache maintenance:
- * Note that any buffers that are expected to be accessed by the secure world
- * must be flushed before invoking qcom_scm_call and invalidated in the cache
- * immediately after qcom_scm_call returns. Cache maintenance on the command
- * and response buffers is taken care of by qcom_scm_call; however, callers are
- * responsible for any other cached buffers passed over to the secure world.
- */
-static int qcom_scm_call_legacy(struct device *dev, struct qcom_scm_desc *desc)
-{
-	int arglen = desc->arginfo & 0xf;
-	int ret = 0, context_id;
-	size_t i;
-	struct legacy_command *cmd;
-	struct legacy_response *rsp;
-	struct arm_smccc_args smc = {0};
-	struct arm_smccc_res res;
-	const size_t cmd_len = arglen * sizeof(__le32);
-	const size_t resp_len = MAX_QCOM_SCM_RETS * sizeof(__le32);
-	size_t alloc_len = sizeof(*cmd) + cmd_len + sizeof(*rsp) + resp_len;
-	dma_addr_t cmd_phys;
-	__le32 *arg_buf;
-	__le32 *res_buf;
-
-	cmd = kzalloc(PAGE_ALIGN(alloc_len), GFP_KERNEL);
-	if (!cmd)
-		return -ENOMEM;
-
-	cmd->len = cpu_to_le32(alloc_len);
-	cmd->buf_offset = cpu_to_le32(sizeof(*cmd));
-	cmd->resp_hdr_offset = cpu_to_le32(sizeof(*cmd) + cmd_len);
-	cmd->id = cpu_to_le32(LEGACY_FUNCNUM(desc->svc, desc->cmd));
-
-	arg_buf = legacy_get_command_buffer(cmd);
-	for (i = 0; i < arglen; i++)
-		arg_buf[i] = cpu_to_le32(desc->args[i]);
-
-	rsp = legacy_command_to_response(cmd);
-
-	cmd_phys = dma_map_single(dev, cmd, alloc_len, DMA_TO_DEVICE);
-	if (dma_mapping_error(dev, cmd_phys)) {
-		kfree(cmd);
-		return -ENOMEM;
-	}
-
-	smc.a[0] = 1;
-	smc.a[1] = (unsigned long)&context_id;
-	smc.a[2] = cmd_phys;
-
-	mutex_lock(&qcom_scm_lock);
-	__qcom_scm_call_do(&smc, &res);
-	if (res.a0 < 0)
-		ret = qcom_scm_remap_error(res.a0);
-	mutex_unlock(&qcom_scm_lock);
-	if (ret)
-		goto out;
-
-	do {
-		dma_sync_single_for_cpu(dev, cmd_phys + sizeof(*cmd) + cmd_len,
-					sizeof(*rsp), DMA_FROM_DEVICE);
-	} while (!rsp->is_complete);
-
-	dma_sync_single_for_cpu(dev, cmd_phys + sizeof(*cmd) + cmd_len +
-				le32_to_cpu(rsp->buf_offset),
-				resp_len, DMA_FROM_DEVICE);
-
-	res_buf = legacy_get_response_buffer(rsp);
-	for (i = 0; i < MAX_QCOM_SCM_RETS; i++)
-		desc->res[i] = le32_to_cpu(res_buf[i]);
-out:
-	dma_unmap_single(dev, cmd_phys, alloc_len, DMA_TO_DEVICE);
-	kfree(cmd);
-	return ret;
-}
-
-#define LEGACY_ATOMIC_N_REG_ARGS	5
-#define LEGACY_ATOMIC_FIRST_REG_IDX	2
-#define LEGACY_CLASS_REGISTER	(0x2 << 8)
-#define LEGACY_MASK_IRQS		BIT(5)
-#define LEGACY_ATOMIC(svc, cmd, n) ((LEGACY_FUNCNUM(svc, cmd) << 12) | \
-				    LEGACY_CLASS_REGISTER | \
-				    LEGACY_MASK_IRQS | \
-				    (n & 0xf))
-
-/**
- * qcom_scm_call_atomic_legacy() - Send an atomic SCM command with up to
- * 5 arguments and 3 return values
- *
- * This shall only be used with commands that are guaranteed to be
- * uninterruptable, atomic and SMP safe.
- */
-static int qcom_scm_call_atomic_legacy(struct device *dev,
-				       struct qcom_scm_desc *desc)
-{
-	int context_id;
-	struct arm_smccc_args smc = {0};
-	struct arm_smccc_res res;
-	size_t i, arglen = desc->arginfo & 0xf;
-
-	BUG_ON(arglen > LEGACY_ATOMIC_N_REG_ARGS);
-
-	smc.a[0] = LEGACY_ATOMIC(desc->svc, desc->cmd, arglen);
-	smc.a[1] = (unsigned long)&context_id;
-
-	for (i = 0; i < arglen; i++)
-		smc.a[i + LEGACY_ATOMIC_FIRST_REG_IDX] = desc->args[i];
-
-	arm_smccc_smc(smc.a[0], smc.a[1], smc.a[2], smc.a[3],
-		      smc.a[4], smc.a[5], smc.a[6], smc.a[7], &res);
-
-	desc->res[0] = res.a1;
-	desc->res[1] = res.a2;
-	desc->res[2] = res.a3;
-
-	return res.a0;
-}
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
-static int qcom_scm_call(struct device *dev, struct qcom_scm_desc *desc)
-{
-	might_sleep();
-	switch (qcom_smc_convention) {
-	case SMC_CONVENTION_ARM_32:
-	case SMC_CONVENTION_ARM_64:
-		return qcom_scm_call_smccc(dev, desc, false);
-	case SMC_CONVENTION_LEGACY:
-		return qcom_scm_call_legacy(dev, desc);
-	default:
-		pr_err("Unknown current SCM calling convention.\n");
-		return -EINVAL;
-	}
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
-static int qcom_scm_call_atomic(struct device *dev, struct qcom_scm_desc *desc)
-{
-	switch (qcom_smc_convention) {
-	case SMC_CONVENTION_ARM_32:
-	case SMC_CONVENTION_ARM_64:
-		return qcom_scm_call_smccc(dev, desc, true);
-	case SMC_CONVENTION_LEGACY:
-		return qcom_scm_call_atomic_legacy(dev, desc);
-	default:
-		pr_err("Unknown current SCM calling convention.\n");
-		return -EINVAL;
-	}
-}
-
-#define QCOM_SCM_FLAG_COLDBOOT_CPU0	0x00
-#define QCOM_SCM_FLAG_COLDBOOT_CPU1	0x01
-#define QCOM_SCM_FLAG_COLDBOOT_CPU2	0x08
-#define QCOM_SCM_FLAG_COLDBOOT_CPU3	0x20
-
-/**
- * qcom_scm_set_cold_boot_addr() - Set the cold boot address for cpus
- * @entry: Entry point function for the cpus
- * @cpus: The cpumask of cpus that will use the entry point
- *
- * Set the cold boot address of the cpus. Any cpu outside the supported
- * range would be removed from the cpu present mask.
- */
-int __qcom_scm_set_cold_boot_addr(struct device *dev, void *entry,
-				  const cpumask_t *cpus)
-{
-	int flags = 0;
-	int cpu;
-	int scm_cb_flags[] = {
-		QCOM_SCM_FLAG_COLDBOOT_CPU0,
-		QCOM_SCM_FLAG_COLDBOOT_CPU1,
-		QCOM_SCM_FLAG_COLDBOOT_CPU2,
-		QCOM_SCM_FLAG_COLDBOOT_CPU3,
-	};
-	struct qcom_scm_desc desc = {
-		.svc = QCOM_SCM_SVC_BOOT,
-		.cmd = QCOM_SCM_BOOT_SET_ADDR,
-		.owner = ARM_SMCCC_OWNER_SIP,
-	};
-
-	if (!cpus || (cpus && cpumask_empty(cpus)))
-		return -EINVAL;
-
-	for_each_cpu(cpu, cpus) {
-		if (cpu < ARRAY_SIZE(scm_cb_flags))
-			flags |= scm_cb_flags[cpu];
-		else
-			set_cpu_present(cpu, false);
-	}
-
-	desc.args[0] = flags;
-	desc.args[1] = virt_to_phys(entry);
-	desc.arginfo = QCOM_SCM_ARGS(2);
-
-	return qcom_scm_call_atomic(dev, &desc);
-}
-
-#define QCOM_SCM_FLAG_WARMBOOT_CPU0	0x04
-#define QCOM_SCM_FLAG_WARMBOOT_CPU1	0x02
-#define QCOM_SCM_FLAG_WARMBOOT_CPU2	0x10
-#define QCOM_SCM_FLAG_WARMBOOT_CPU3	0x40
-
-struct qcom_scm_entry {
-	int flag;
-	void *entry;
-};
-
-static struct qcom_scm_entry qcom_scm_wb[] = {
-	{ .flag = QCOM_SCM_FLAG_WARMBOOT_CPU0 },
-	{ .flag = QCOM_SCM_FLAG_WARMBOOT_CPU1 },
-	{ .flag = QCOM_SCM_FLAG_WARMBOOT_CPU2 },
-	{ .flag = QCOM_SCM_FLAG_WARMBOOT_CPU3 },
-};
-
-/**
- * qcom_scm_set_warm_boot_addr() - Set the warm boot address for cpus
- * @dev: Device pointer
- * @entry: Entry point function for the cpus
- * @cpus: The cpumask of cpus that will use the entry point
- *
- * Set the Linux entry point for the SCM to transfer control to when coming
- * out of a power down. CPU power down may be executed on cpuidle or hotplug.
- */
-int __qcom_scm_set_warm_boot_addr(struct device *dev, void *entry,
-				  const cpumask_t *cpus)
-{
-	int ret;
-	int flags = 0;
-	int cpu;
-	struct qcom_scm_desc desc = {
-		.svc = QCOM_SCM_SVC_BOOT,
-		.cmd = QCOM_SCM_BOOT_SET_ADDR,
-	};
-
-	/*
-	 * Reassign only if we are switching from hotplug entry point
-	 * to cpuidle entry point or vice versa.
-	 */
-	for_each_cpu(cpu, cpus) {
-		if (entry == qcom_scm_wb[cpu].entry)
-			continue;
-		flags |= qcom_scm_wb[cpu].flag;
-	}
-
-	/* No change in entry function */
-	if (!flags)
-		return 0;
-
-	desc.args[0] = flags;
-	desc.args[1] = virt_to_phys(entry);
-	ret = qcom_scm_call(dev, &desc);
-	if (!ret) {
-		for_each_cpu(cpu, cpus)
-			qcom_scm_wb[cpu].entry = entry;
-	}
-
-	return ret;
-}
-
-/**
- * qcom_scm_cpu_power_down() - Power down the cpu
- * @flags - Flags to flush cache
- *
- * This is an end point to power down cpu. If there was a pending interrupt,
- * the control would return from this function, otherwise, the cpu jumps to the
- * warm boot entry point set for this cpu upon reset.
- */
-void __qcom_scm_cpu_power_down(struct device *dev, u32 flags)
-{
-	struct qcom_scm_desc desc = {
-		.svc = QCOM_SCM_SVC_BOOT,
-		.cmd = QCOM_SCM_BOOT_TERMINATE_PC,
-		.args[0] = flags & QCOM_SCM_FLUSH_FLAG_MASK,
-		.arginfo = QCOM_SCM_ARGS(1),
-		.owner = ARM_SMCCC_OWNER_SIP,
-	};
-
-	qcom_scm_call_atomic(dev, &desc);
-}
-
-int __qcom_scm_set_remote_state(struct device *dev, u32 state, u32 id)
-{
-	struct qcom_scm_desc desc = {
-		.svc = QCOM_SCM_SVC_BOOT,
-		.cmd = QCOM_SCM_BOOT_SET_REMOTE_STATE,
-		.owner = ARM_SMCCC_OWNER_SIP,
-	};
-	int ret;
-
-	desc.args[0] = state;
-	desc.args[1] = id;
-	desc.arginfo = QCOM_SCM_ARGS(2);
-
-	ret = qcom_scm_call(dev, &desc);
-
-	return ret ? : desc.res[0];
-}
-
-int __qcom_scm_set_dload_mode(struct device *dev, bool enable)
-{
-	struct qcom_scm_desc desc = {
-		.svc = QCOM_SCM_SVC_BOOT,
-		.cmd = QCOM_SCM_BOOT_SET_DLOAD_MODE,
-		.owner = ARM_SMCCC_OWNER_SIP,
-	};
-
-	desc.args[0] = QCOM_SCM_BOOT_SET_DLOAD_MODE;
-	desc.args[1] = enable ? QCOM_SCM_BOOT_SET_DLOAD_MODE : 0;
-	desc.arginfo = QCOM_SCM_ARGS(2);
-
-	return qcom_scm_call_atomic(dev, &desc);
-}
-
-bool __qcom_scm_pas_supported(struct device *dev, u32 peripheral)
-{
-	int ret;
-	struct qcom_scm_desc desc = {
-		.svc = QCOM_SCM_SVC_PIL,
-		.cmd = QCOM_SCM_PIL_PAS_IS_SUPPORTED,
-		.owner = ARM_SMCCC_OWNER_SIP,
-	};
-
-	desc.args[0] = peripheral;
-	desc.arginfo = QCOM_SCM_ARGS(1);
-
-	ret = qcom_scm_call(dev, &desc);
-
-	return ret ? false : !!desc.res[0];
-}
-
-int __qcom_scm_pas_init_image(struct device *dev, u32 peripheral,
-			      dma_addr_t metadata_phys)
-{
-	int ret;
-	struct qcom_scm_desc desc = {
-		.svc = QCOM_SCM_SVC_PIL,
-		.cmd = QCOM_SCM_PIL_PAS_INIT_IMAGE,
-		.owner = ARM_SMCCC_OWNER_SIP,
-	};
-
-	desc.args[0] = peripheral;
-	desc.args[1] = metadata_phys;
-	desc.arginfo = QCOM_SCM_ARGS(2, QCOM_SCM_VAL, QCOM_SCM_RW);
-
-	ret = qcom_scm_call(dev, &desc);
-
-	return ret ? : desc.res[0];
-}
-
-int __qcom_scm_pas_mem_setup(struct device *dev, u32 peripheral,
-			      phys_addr_t addr, phys_addr_t size)
-{
-	int ret;
-	struct qcom_scm_desc desc = {
-		.svc = QCOM_SCM_SVC_PIL,
-		.cmd = QCOM_SCM_PIL_PAS_MEM_SETUP,
-		.owner = ARM_SMCCC_OWNER_SIP,
-	};
-
-	desc.args[0] = peripheral;
-	desc.args[1] = addr;
-	desc.args[2] = size;
-	desc.arginfo = QCOM_SCM_ARGS(3);
-
-	ret = qcom_scm_call(dev, &desc);
-
-	return ret ? : desc.res[0];
-}
-
-int __qcom_scm_pas_auth_and_reset(struct device *dev, u32 peripheral)
-{
-	int ret;
-	struct qcom_scm_desc desc = {
-		.svc = QCOM_SCM_SVC_PIL,
-		.cmd = QCOM_SCM_PIL_PAS_AUTH_AND_RESET,
-		.owner = ARM_SMCCC_OWNER_SIP,
-	};
-
-	desc.args[0] = peripheral;
-	desc.arginfo = QCOM_SCM_ARGS(1);
-
-	ret = qcom_scm_call(dev, &desc);
-
-	return ret ? : desc.res[0];
-}
-
-int __qcom_scm_pas_shutdown(struct device *dev, u32 peripheral)
-{
-	int ret;
-	struct qcom_scm_desc desc = {
-		.svc = QCOM_SCM_SVC_PIL,
-		.cmd = QCOM_SCM_PIL_PAS_SHUTDOWN,
-		.owner = ARM_SMCCC_OWNER_SIP,
-	};
-
-	desc.args[0] = peripheral;
-	desc.arginfo = QCOM_SCM_ARGS(1);
-
-	ret = qcom_scm_call(dev, &desc);
-
-	return ret ? : desc.res[0];
-}
-
-int __qcom_scm_pas_mss_reset(struct device *dev, bool reset)
-{
-	struct qcom_scm_desc desc = {
-		.svc = QCOM_SCM_SVC_PIL,
-		.cmd = QCOM_SCM_PIL_PAS_MSS_RESET,
-		.owner = ARM_SMCCC_OWNER_SIP,
-	};
-	int ret;
-
-	desc.args[0] = reset;
-	desc.args[1] = 0;
-	desc.arginfo = QCOM_SCM_ARGS(2);
-
-	ret = qcom_scm_call(dev, &desc);
-
-	return ret ? : desc.res[0];
-}
-
-int __qcom_scm_io_readl(struct device *dev, phys_addr_t addr,
-			unsigned int *val)
-{
-	struct qcom_scm_desc desc = {
-		.svc = QCOM_SCM_SVC_IO,
-		.cmd = QCOM_SCM_IO_READ,
-		.owner = ARM_SMCCC_OWNER_SIP,
-	};
-	int ret;
-
-	desc.args[0] = addr;
-	desc.arginfo = QCOM_SCM_ARGS(1);
-
-	ret = qcom_scm_call_atomic(dev, &desc);
-	if (ret >= 0)
-		*val = desc.res[0];
-
-	return ret < 0 ? ret : 0;
-}
-
-int __qcom_scm_io_writel(struct device *dev, phys_addr_t addr, unsigned int val)
-{
-	struct qcom_scm_desc desc = {
-		.svc = QCOM_SCM_SVC_IO,
-		.cmd = QCOM_SCM_IO_WRITE,
-		.owner = ARM_SMCCC_OWNER_SIP,
-	};
-
-	desc.args[0] = addr;
-	desc.args[1] = val;
-	desc.arginfo = QCOM_SCM_ARGS(2);
-
-	return qcom_scm_call_atomic(dev, &desc);
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
-	switch (qcom_smc_convention) {
-	case SMC_CONVENTION_ARM_32:
-	case SMC_CONVENTION_ARM_64:
-		desc.args[0] = SMCCC_FUNCNUM(svc_id, cmd_id) |
-				(ARM_SMCCC_OWNER_SIP << ARM_SMCCC_OWNER_SHIFT);
-		break;
-	case SMC_CONVENTION_LEGACY:
-		desc.args[0] = LEGACY_FUNCNUM(svc_id, cmd_id);
-		break;
-	default:
-		pr_err("Unknown SMC convention being used\n");
-		return -EINVAL;
-	}
-
-	ret = qcom_scm_call(dev, &desc);
-
-	return ret ? : desc.res[0];
-}
-
-int __qcom_scm_restore_sec_cfg(struct device *dev, u32 device_id, u32 spare)
-{
-	struct qcom_scm_desc desc = {
-		.svc = QCOM_SCM_SVC_MP,
-		.cmd = QCOM_SCM_MP_RESTORE_SEC_CFG,
-		.owner = ARM_SMCCC_OWNER_SIP,
-	};
-	int ret;
-
-	desc.args[0] = device_id;
-	desc.args[1] = spare;
-	desc.arginfo = QCOM_SCM_ARGS(2);
-
-	ret = qcom_scm_call(dev, &desc);
-
-	return ret ? : desc.res[0];
-}
-
-int __qcom_scm_iommu_secure_ptbl_size(struct device *dev, u32 spare,
-				      size_t *size)
-{
-	struct qcom_scm_desc desc = {
-		.svc = QCOM_SCM_SVC_MP,
-		.cmd = QCOM_SCM_MP_IOMMU_SECURE_PTBL_SIZE,
-		.owner = ARM_SMCCC_OWNER_SIP,
-	};
-	int ret;
-
-	desc.args[0] = spare;
-	desc.arginfo = QCOM_SCM_ARGS(1);
-
-	ret = qcom_scm_call(dev, &desc);
-
-	if (size)
-		*size = desc.res[0];
-
-	return ret ? : desc.res[1];
-}
-
-int __qcom_scm_iommu_secure_ptbl_init(struct device *dev, u64 addr, u32 size,
-				      u32 spare)
-{
-	struct qcom_scm_desc desc = {
-		.svc = QCOM_SCM_SVC_MP,
-		.cmd = QCOM_SCM_MP_IOMMU_SECURE_PTBL_INIT,
-		.owner = ARM_SMCCC_OWNER_SIP,
-	};
-	int ret;
-
-	desc.args[0] = addr;
-	desc.args[1] = size;
-	desc.args[2] = spare;
-	desc.arginfo = QCOM_SCM_ARGS(3, QCOM_SCM_RW, QCOM_SCM_VAL,
-				     QCOM_SCM_VAL);
-
-	ret = qcom_scm_call(dev, &desc);
-
-	/* the pg table has been initialized already, ignore the error */
-	if (ret == -EPERM)
-		ret = 0;
-
-	return ret;
-}
-
-int __qcom_scm_assign_mem(struct device *dev, phys_addr_t mem_region,
-			  size_t mem_sz, phys_addr_t src, size_t src_sz,
-			  phys_addr_t dest, size_t dest_sz)
-{
-	int ret;
-	struct qcom_scm_desc desc = {
-		.svc = QCOM_SCM_SVC_MP,
-		.cmd = QCOM_SCM_MP_ASSIGN,
-		.owner = ARM_SMCCC_OWNER_SIP,
-	};
-
-	desc.args[0] = mem_region;
-	desc.args[1] = mem_sz;
-	desc.args[2] = src;
-	desc.args[3] = src_sz;
-	desc.args[4] = dest;
-	desc.args[5] = dest_sz;
-	desc.args[6] = 0;
-
-	desc.arginfo = QCOM_SCM_ARGS(7, QCOM_SCM_RO, QCOM_SCM_VAL,
-				     QCOM_SCM_RO, QCOM_SCM_VAL, QCOM_SCM_RO,
-				     QCOM_SCM_VAL, QCOM_SCM_VAL);
-
-	ret = qcom_scm_call(dev, &desc);
-
-	return ret ? : desc.res[0];
-}
-
-int __qcom_scm_hdcp_req(struct device *dev, struct qcom_scm_hdcp_req *req,
-			u32 req_cnt, u32 *resp)
-{
-	int ret;
-	struct qcom_scm_desc desc = {
-		.svc = QCOM_SCM_SVC_HDCP,
-		.cmd = QCOM_SCM_HDCP_INVOKE,
-		.owner = ARM_SMCCC_OWNER_SIP,
-	};
-
-	if (req_cnt > QCOM_SCM_HDCP_MAX_REQ_CNT)
-		return -ERANGE;
-
-	desc.args[0] = req[0].addr;
-	desc.args[1] = req[0].val;
-	desc.args[2] = req[1].addr;
-	desc.args[3] = req[1].val;
-	desc.args[4] = req[2].addr;
-	desc.args[5] = req[2].val;
-	desc.args[6] = req[3].addr;
-	desc.args[7] = req[3].val;
-	desc.args[8] = req[4].addr;
-	desc.args[9] = req[4].val;
-	desc.arginfo = QCOM_SCM_ARGS(10);
-
-	ret = qcom_scm_call(dev, &desc);
-	*resp = desc.res[0];
-
-	return ret;
-}
-
-int __qcom_scm_qsmmu500_wait_safe_toggle(struct device *dev, bool en)
-{
-	struct qcom_scm_desc desc = {
-		.svc = QCOM_SCM_SVC_SMMU_PROGRAM,
-		.cmd = QCOM_SCM_SMMU_CONFIG_ERRATA1,
-		.owner = ARM_SMCCC_OWNER_SIP,
-	};
-
-	desc.args[0] = QCOM_SCM_SMMU_CONFIG_ERRATA1_CLIENT_ALL;
-	desc.args[1] = en;
-	desc.arginfo = QCOM_SCM_ARGS(2);
-
-	return qcom_scm_call_atomic(dev, &desc);
-}
-
-void __qcom_scm_init(void)
-{
-	qcom_smc_convention = SMC_CONVENTION_LEGACY;
-	if (__qcom_scm_is_call_available(NULL, QCOM_SCM_SVC_INFO,
-			QCOM_SCM_INFO_IS_CALL_AVAIL) == 1)
-		goto out;
-
-	qcom_smc_convention = SMC_CONVENTION_ARM_64;
-	if (__qcom_scm_is_call_available(NULL, QCOM_SCM_SVC_INFO,
-			QCOM_SCM_INFO_IS_CALL_AVAIL) == 1)
-		goto out;
-
-	qcom_smc_convention = SMC_CONVENTION_ARM_32;
-	if (__qcom_scm_is_call_available(NULL, QCOM_SCM_SVC_INFO,
-			QCOM_SCM_INFO_IS_CALL_AVAIL) == 1)
-		goto out;
-
-	qcom_smc_convention = SMC_CONVENTION_UNKNOWN;
-out:
-	pr_debug("QCOM SCM SMC Convention: %d\n", qcom_smc_convention);
-}
diff --git a/drivers/firmware/qcom_scm-smc.c b/drivers/firmware/qcom_scm-smc.c
new file mode 100644
index 0000000..355d9d7
--- /dev/null
+++ b/drivers/firmware/qcom_scm-smc.c
@@ -0,0 +1,949 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Copyright (c) 2015,2019 The Linux Foundation. All rights reserved.
+ */
+
+#include <linux/io.h>
+#include <linux/errno.h>
+#include <linux/delay.h>
+#include <linux/mutex.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+#include <linux/qcom_scm.h>
+#include <linux/arm-smccc.h>
+#include <linux/dma-mapping.h>
+
+#include "qcom_scm.h"
+
+#define MAX_QCOM_SCM_ARGS 10
+#define MAX_QCOM_SCM_RETS 3
+
+enum qcom_scm_arg_types {
+	QCOM_SCM_VAL,
+	QCOM_SCM_RO,
+	QCOM_SCM_RW,
+	QCOM_SCM_BUFVAL,
+};
+
+#define QCOM_SCM_ARGS_IMPL(num, a, b, c, d, e, f, g, h, i, j, ...) (\
+			   (((a) & 0x3) << 4) | \
+			   (((b) & 0x3) << 6) | \
+			   (((c) & 0x3) << 8) | \
+			   (((d) & 0x3) << 10) | \
+			   (((e) & 0x3) << 12) | \
+			   (((f) & 0x3) << 14) | \
+			   (((g) & 0x3) << 16) | \
+			   (((h) & 0x3) << 18) | \
+			   (((i) & 0x3) << 20) | \
+			   (((j) & 0x3) << 22) | \
+			   ((num) & 0xf))
+
+#define QCOM_SCM_ARGS(...) QCOM_SCM_ARGS_IMPL(__VA_ARGS__, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
+
+/**
+ * struct qcom_scm_desc
+ * @arginfo:	Metadata describing the arguments in args[]
+ * @args:	The array of arguments for the secure syscall
+ * @res:	The values returned by the secure syscall
+ */
+struct qcom_scm_desc {
+	u32 svc;
+	u32 cmd;
+	u32 arginfo;
+	u64 args[MAX_QCOM_SCM_ARGS];
+	u64 res[MAX_QCOM_SCM_RETS];
+	u32 owner;
+};
+
+struct arm_smccc_args {
+	unsigned long a[8];
+};
+
+enum qcom_smc_convention {
+	SMC_CONVENTION_UNKNOWN,
+	SMC_CONVENTION_LEGACY,
+	SMC_CONVENTION_ARM_32,
+	SMC_CONVENTION_ARM_64,
+};
+
+static enum qcom_smc_convention qcom_smc_convention = SMC_CONVENTION_UNKNOWN;
+static DEFINE_MUTEX(qcom_scm_lock);
+
+#define QCOM_SCM_EBUSY_WAIT_MS 30
+#define QCOM_SCM_EBUSY_MAX_RETRY 20
+
+#define SMCCC_FUNCNUM(s, c) ((((s) & 0xFF) << 8) | ((c) & 0xFF))
+#define SMCCC_N_REG_ARGS	4
+#define SMCCC_FIRST_REG_IDX	2
+#define SMCCC_N_EXT_ARGS	(MAX_QCOM_SCM_ARGS - SMCCC_N_REG_ARGS + 1)
+#define SMCCC_LAST_REG_IDX	(SMCCC_FIRST_REG_IDX + SMCCC_N_REG_ARGS - 1)
+
+static void __qcom_scm_call_do_quirk(const struct arm_smccc_args *smc,
+				     struct arm_smccc_res *res)
+{
+	unsigned long a0 = smc->a[0];
+	struct arm_smccc_quirk quirk = { .id = ARM_SMCCC_QUIRK_QCOM_A6 };
+
+	quirk.state.a6 = 0;
+
+	do {
+		arm_smccc_smc_quirk(a0, smc->a[1], smc->a[2], smc->a[3],
+				    smc->a[4], smc->a[5], quirk.state.a6,
+				    smc->a[7], res, &quirk);
+
+		if (res->a0 == QCOM_SCM_INTERRUPTED)
+			a0 = res->a0;
+
+	} while (res->a0 == QCOM_SCM_INTERRUPTED);
+}
+
+static int qcom_scm_call_smccc(struct device *dev,
+				  struct qcom_scm_desc *desc, bool atomic)
+{
+	int arglen = desc->arginfo & 0xf;
+	int i;
+	dma_addr_t args_phys = 0;
+	void *args_virt = NULL;
+	size_t alloc_len;
+	gfp_t flag = atomic ? GFP_ATOMIC : GFP_KERNEL;
+	struct arm_smccc_res res;
+	struct arm_smccc_args smc = {0};
+
+	smc.a[0] = ARM_SMCCC_CALL_VAL(
+		atomic ? ARM_SMCCC_FAST_CALL : ARM_SMCCC_STD_CALL,
+		(qcom_smc_convention == SMC_CONVENTION_ARM_64) ?
+			ARM_SMCCC_SMC_64 :
+			ARM_SMCCC_SMC_32,
+		desc->owner,
+		SMCCC_FUNCNUM(desc->svc, desc->cmd));
+	smc.a[1] = desc->arginfo;
+	for (i = 0; i < SMCCC_N_REG_ARGS; i++)
+		smc.a[i + SMCCC_FIRST_REG_IDX] = desc->args[i];
+
+	if (unlikely(arglen > SMCCC_N_REG_ARGS)) {
+		alloc_len = SMCCC_N_EXT_ARGS * sizeof(u64);
+		args_virt = kzalloc(PAGE_ALIGN(alloc_len), flag);
+
+		if (!args_virt)
+			return -ENOMEM;
+
+		if (qcom_smc_convention == SMC_CONVENTION_ARM_32) {
+			__le32 *args = args_virt;
+
+			for (i = 0; i < SMCCC_N_EXT_ARGS; i++)
+				args[i] = cpu_to_le32(desc->args[i +
+						      SMCCC_N_REG_ARGS - 1]);
+		} else {
+			__le64 *args = args_virt;
+
+			for (i = 0; i < SMCCC_N_EXT_ARGS; i++)
+				args[i] = cpu_to_le64(desc->args[i +
+						      SMCCC_N_REG_ARGS - 1]);
+		}
+
+		args_phys = dma_map_single(dev, args_virt, alloc_len,
+					   DMA_TO_DEVICE);
+
+		if (dma_mapping_error(dev, args_phys)) {
+			kfree(args_virt);
+			return -ENOMEM;
+		}
+
+		smc.a[SMCCC_LAST_REG_IDX] = args_phys;
+	}
+
+	if (atomic) {
+		__qcom_scm_call_do_quirk(&smc, &res);
+	} else {
+		int retry_count = 0;
+
+		do {
+			mutex_lock(&qcom_scm_lock);
+
+			__qcom_scm_call_do_quirk(&smc, &res);
+
+			mutex_unlock(&qcom_scm_lock);
+
+			if (res.a0 == QCOM_SCM_V2_EBUSY) {
+				if (retry_count++ > QCOM_SCM_EBUSY_MAX_RETRY)
+					break;
+				msleep(QCOM_SCM_EBUSY_WAIT_MS);
+			}
+		} while (res.a0 == QCOM_SCM_V2_EBUSY);
+	}
+
+	if (args_virt) {
+		dma_unmap_single(dev, args_phys, alloc_len, DMA_TO_DEVICE);
+		kfree(args_virt);
+	}
+
+	desc->res[0] = res.a1;
+	desc->res[1] = res.a2;
+	desc->res[2] = res.a3;
+
+	if (res.a0 < 0)
+		return qcom_scm_remap_error(res.a0);
+
+	return 0;
+}
+
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
+	for (i = 0; i < arglen; i++)
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
+	switch (qcom_smc_convention) {
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
+	switch (qcom_smc_convention) {
+	case SMC_CONVENTION_ARM_32:
+	case SMC_CONVENTION_ARM_64:
+		return qcom_scm_call_smccc(dev, desc, true);
+	case SMC_CONVENTION_LEGACY:
+		return qcom_scm_call_atomic_legacy(dev, desc);
+	default:
+		pr_err("Unknown current SCM calling convention.\n");
+		return -EINVAL;
+	}
+}
+
+#define QCOM_SCM_FLAG_COLDBOOT_CPU0	0x00
+#define QCOM_SCM_FLAG_COLDBOOT_CPU1	0x01
+#define QCOM_SCM_FLAG_COLDBOOT_CPU2	0x08
+#define QCOM_SCM_FLAG_COLDBOOT_CPU3	0x20
+
+/**
+ * qcom_scm_set_cold_boot_addr() - Set the cold boot address for cpus
+ * @entry: Entry point function for the cpus
+ * @cpus: The cpumask of cpus that will use the entry point
+ *
+ * Set the cold boot address of the cpus. Any cpu outside the supported
+ * range would be removed from the cpu present mask.
+ */
+int __qcom_scm_set_cold_boot_addr(struct device *dev, void *entry,
+				  const cpumask_t *cpus)
+{
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
+}
+
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
+/**
+ * qcom_scm_set_warm_boot_addr() - Set the warm boot address for cpus
+ * @dev: Device pointer
+ * @entry: Entry point function for the cpus
+ * @cpus: The cpumask of cpus that will use the entry point
+ *
+ * Set the Linux entry point for the SCM to transfer control to when coming
+ * out of a power down. CPU power down may be executed on cpuidle or hotplug.
+ */
+int __qcom_scm_set_warm_boot_addr(struct device *dev, void *entry,
+				  const cpumask_t *cpus)
+{
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
+	desc.args[0] = flags;
+	desc.args[1] = virt_to_phys(entry);
+	ret = qcom_scm_call(dev, &desc);
+	if (!ret) {
+		for_each_cpu(cpu, cpus)
+			qcom_scm_wb[cpu].entry = entry;
+	}
+
+	return ret;
+}
+
+/**
+ * qcom_scm_cpu_power_down() - Power down the cpu
+ * @flags - Flags to flush cache
+ *
+ * This is an end point to power down cpu. If there was a pending interrupt,
+ * the control would return from this function, otherwise, the cpu jumps to the
+ * warm boot entry point set for this cpu upon reset.
+ */
+void __qcom_scm_cpu_power_down(struct device *dev, u32 flags)
+{
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_BOOT,
+		.cmd = QCOM_SCM_BOOT_TERMINATE_PC,
+		.args[0] = flags & QCOM_SCM_FLUSH_FLAG_MASK,
+		.arginfo = QCOM_SCM_ARGS(1),
+		.owner = ARM_SMCCC_OWNER_SIP,
+	};
+
+	qcom_scm_call_atomic(dev, &desc);
+}
+
+int __qcom_scm_set_remote_state(struct device *dev, u32 state, u32 id)
+{
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_BOOT,
+		.cmd = QCOM_SCM_BOOT_SET_REMOTE_STATE,
+		.owner = ARM_SMCCC_OWNER_SIP,
+	};
+	int ret;
+
+	desc.args[0] = state;
+	desc.args[1] = id;
+	desc.arginfo = QCOM_SCM_ARGS(2);
+
+	ret = qcom_scm_call(dev, &desc);
+
+	return ret ? : desc.res[0];
+}
+
+int __qcom_scm_set_dload_mode(struct device *dev, bool enable)
+{
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
+	return qcom_scm_call_atomic(dev, &desc);
+}
+
+bool __qcom_scm_pas_supported(struct device *dev, u32 peripheral)
+{
+	int ret;
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_PIL,
+		.cmd = QCOM_SCM_PIL_PAS_IS_SUPPORTED,
+		.owner = ARM_SMCCC_OWNER_SIP,
+	};
+
+	desc.args[0] = peripheral;
+	desc.arginfo = QCOM_SCM_ARGS(1);
+
+	ret = qcom_scm_call(dev, &desc);
+
+	return ret ? false : !!desc.res[0];
+}
+
+int __qcom_scm_pas_init_image(struct device *dev, u32 peripheral,
+			      dma_addr_t metadata_phys)
+{
+	int ret;
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_PIL,
+		.cmd = QCOM_SCM_PIL_PAS_INIT_IMAGE,
+		.owner = ARM_SMCCC_OWNER_SIP,
+	};
+
+	desc.args[0] = peripheral;
+	desc.args[1] = metadata_phys;
+	desc.arginfo = QCOM_SCM_ARGS(2, QCOM_SCM_VAL, QCOM_SCM_RW);
+
+	ret = qcom_scm_call(dev, &desc);
+
+	return ret ? : desc.res[0];
+}
+
+int __qcom_scm_pas_mem_setup(struct device *dev, u32 peripheral,
+			      phys_addr_t addr, phys_addr_t size)
+{
+	int ret;
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_PIL,
+		.cmd = QCOM_SCM_PIL_PAS_MEM_SETUP,
+		.owner = ARM_SMCCC_OWNER_SIP,
+	};
+
+	desc.args[0] = peripheral;
+	desc.args[1] = addr;
+	desc.args[2] = size;
+	desc.arginfo = QCOM_SCM_ARGS(3);
+
+	ret = qcom_scm_call(dev, &desc);
+
+	return ret ? : desc.res[0];
+}
+
+int __qcom_scm_pas_auth_and_reset(struct device *dev, u32 peripheral)
+{
+	int ret;
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_PIL,
+		.cmd = QCOM_SCM_PIL_PAS_AUTH_AND_RESET,
+		.owner = ARM_SMCCC_OWNER_SIP,
+	};
+
+	desc.args[0] = peripheral;
+	desc.arginfo = QCOM_SCM_ARGS(1);
+
+	ret = qcom_scm_call(dev, &desc);
+
+	return ret ? : desc.res[0];
+}
+
+int __qcom_scm_pas_shutdown(struct device *dev, u32 peripheral)
+{
+	int ret;
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_PIL,
+		.cmd = QCOM_SCM_PIL_PAS_SHUTDOWN,
+		.owner = ARM_SMCCC_OWNER_SIP,
+	};
+
+	desc.args[0] = peripheral;
+	desc.arginfo = QCOM_SCM_ARGS(1);
+
+	ret = qcom_scm_call(dev, &desc);
+
+	return ret ? : desc.res[0];
+}
+
+int __qcom_scm_pas_mss_reset(struct device *dev, bool reset)
+{
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_PIL,
+		.cmd = QCOM_SCM_PIL_PAS_MSS_RESET,
+		.owner = ARM_SMCCC_OWNER_SIP,
+	};
+	int ret;
+
+	desc.args[0] = reset;
+	desc.args[1] = 0;
+	desc.arginfo = QCOM_SCM_ARGS(2);
+
+	ret = qcom_scm_call(dev, &desc);
+
+	return ret ? : desc.res[0];
+}
+
+int __qcom_scm_io_readl(struct device *dev, phys_addr_t addr,
+			unsigned int *val)
+{
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_IO,
+		.cmd = QCOM_SCM_IO_READ,
+		.owner = ARM_SMCCC_OWNER_SIP,
+	};
+	int ret;
+
+	desc.args[0] = addr;
+	desc.arginfo = QCOM_SCM_ARGS(1);
+
+	ret = qcom_scm_call_atomic(dev, &desc);
+	if (ret >= 0)
+		*val = desc.res[0];
+
+	return ret < 0 ? ret : 0;
+}
+
+int __qcom_scm_io_writel(struct device *dev, phys_addr_t addr, unsigned int val)
+{
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
+	return qcom_scm_call_atomic(dev, &desc);
+}
+
+int __qcom_scm_is_call_available(struct device *dev, u32 svc_id, u32 cmd_id)
+{
+	int ret;
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_INFO,
+		.cmd = QCOM_SCM_INFO_IS_CALL_AVAIL,
+		.owner = ARM_SMCCC_OWNER_SIP,
+	};
+
+	desc.arginfo = QCOM_SCM_ARGS(1);
+	switch (qcom_smc_convention) {
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
+	return ret ? : desc.res[0];
+}
+
+int __qcom_scm_restore_sec_cfg(struct device *dev, u32 device_id, u32 spare)
+{
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_MP,
+		.cmd = QCOM_SCM_MP_RESTORE_SEC_CFG,
+		.owner = ARM_SMCCC_OWNER_SIP,
+	};
+	int ret;
+
+	desc.args[0] = device_id;
+	desc.args[1] = spare;
+	desc.arginfo = QCOM_SCM_ARGS(2);
+
+	ret = qcom_scm_call(dev, &desc);
+
+	return ret ? : desc.res[0];
+}
+
+int __qcom_scm_iommu_secure_ptbl_size(struct device *dev, u32 spare,
+				      size_t *size)
+{
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_MP,
+		.cmd = QCOM_SCM_MP_IOMMU_SECURE_PTBL_SIZE,
+		.owner = ARM_SMCCC_OWNER_SIP,
+	};
+	int ret;
+
+	desc.args[0] = spare;
+	desc.arginfo = QCOM_SCM_ARGS(1);
+
+	ret = qcom_scm_call(dev, &desc);
+
+	if (size)
+		*size = desc.res[0];
+
+	return ret ? : desc.res[1];
+}
+
+int __qcom_scm_iommu_secure_ptbl_init(struct device *dev, u64 addr, u32 size,
+				      u32 spare)
+{
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_MP,
+		.cmd = QCOM_SCM_MP_IOMMU_SECURE_PTBL_INIT,
+		.owner = ARM_SMCCC_OWNER_SIP,
+	};
+	int ret;
+
+	desc.args[0] = addr;
+	desc.args[1] = size;
+	desc.args[2] = spare;
+	desc.arginfo = QCOM_SCM_ARGS(3, QCOM_SCM_RW, QCOM_SCM_VAL,
+				     QCOM_SCM_VAL);
+
+	ret = qcom_scm_call(dev, &desc);
+
+	/* the pg table has been initialized already, ignore the error */
+	if (ret == -EPERM)
+		ret = 0;
+
+	return ret;
+}
+
+int __qcom_scm_assign_mem(struct device *dev, phys_addr_t mem_region,
+			  size_t mem_sz, phys_addr_t src, size_t src_sz,
+			  phys_addr_t dest, size_t dest_sz)
+{
+	int ret;
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_MP,
+		.cmd = QCOM_SCM_MP_ASSIGN,
+		.owner = ARM_SMCCC_OWNER_SIP,
+	};
+
+	desc.args[0] = mem_region;
+	desc.args[1] = mem_sz;
+	desc.args[2] = src;
+	desc.args[3] = src_sz;
+	desc.args[4] = dest;
+	desc.args[5] = dest_sz;
+	desc.args[6] = 0;
+
+	desc.arginfo = QCOM_SCM_ARGS(7, QCOM_SCM_RO, QCOM_SCM_VAL,
+				     QCOM_SCM_RO, QCOM_SCM_VAL, QCOM_SCM_RO,
+				     QCOM_SCM_VAL, QCOM_SCM_VAL);
+
+	ret = qcom_scm_call(dev, &desc);
+
+	return ret ? : desc.res[0];
+}
+
+int __qcom_scm_hdcp_req(struct device *dev, struct qcom_scm_hdcp_req *req,
+			u32 req_cnt, u32 *resp)
+{
+	int ret;
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_HDCP,
+		.cmd = QCOM_SCM_HDCP_INVOKE,
+		.owner = ARM_SMCCC_OWNER_SIP,
+	};
+
+	if (req_cnt > QCOM_SCM_HDCP_MAX_REQ_CNT)
+		return -ERANGE;
+
+	desc.args[0] = req[0].addr;
+	desc.args[1] = req[0].val;
+	desc.args[2] = req[1].addr;
+	desc.args[3] = req[1].val;
+	desc.args[4] = req[2].addr;
+	desc.args[5] = req[2].val;
+	desc.args[6] = req[3].addr;
+	desc.args[7] = req[3].val;
+	desc.args[8] = req[4].addr;
+	desc.args[9] = req[4].val;
+	desc.arginfo = QCOM_SCM_ARGS(10);
+
+	ret = qcom_scm_call(dev, &desc);
+	*resp = desc.res[0];
+
+	return ret;
+}
+
+int __qcom_scm_qsmmu500_wait_safe_toggle(struct device *dev, bool en)
+{
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_SMMU_PROGRAM,
+		.cmd = QCOM_SCM_SMMU_CONFIG_ERRATA1,
+		.owner = ARM_SMCCC_OWNER_SIP,
+	};
+
+	desc.args[0] = QCOM_SCM_SMMU_CONFIG_ERRATA1_CLIENT_ALL;
+	desc.args[1] = en;
+	desc.arginfo = QCOM_SCM_ARGS(2);
+
+	return qcom_scm_call_atomic(dev, &desc);
+}
+
+void __qcom_scm_init(void)
+{
+	qcom_smc_convention = SMC_CONVENTION_LEGACY;
+	if (__qcom_scm_is_call_available(NULL, QCOM_SCM_SVC_INFO,
+			QCOM_SCM_INFO_IS_CALL_AVAIL) == 1)
+		goto out;
+
+	qcom_smc_convention = SMC_CONVENTION_ARM_64;
+	if (__qcom_scm_is_call_available(NULL, QCOM_SCM_SVC_INFO,
+			QCOM_SCM_INFO_IS_CALL_AVAIL) == 1)
+		goto out;
+
+	qcom_smc_convention = SMC_CONVENTION_ARM_32;
+	if (__qcom_scm_is_call_available(NULL, QCOM_SCM_SVC_INFO,
+			QCOM_SCM_INFO_IS_CALL_AVAIL) == 1)
+		goto out;
+
+	qcom_smc_convention = SMC_CONVENTION_UNKNOWN;
+out:
+	pr_debug("QCOM SCM SMC Convention: %d\n", qcom_smc_convention);
+}
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

