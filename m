Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 76BFDF9C1A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2019 22:23:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727620AbfKLVXp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Nov 2019 16:23:45 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:39738 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727631AbfKLVXo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Nov 2019 16:23:44 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id CE5F46055C; Tue, 12 Nov 2019 21:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573593821;
        bh=Wv+nhrxa3ebd0WbZ6Pk3Dsk+zKXagMdXxAXFvISgL2g=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Q4cUK9xwiUyRdnG4wwK+AzHJqd9237a+KDfT7DlZ4rik+LNLpCRBk1GT0aKpobR19
         ss2lYm25LZcqxRfYgYvchsrT9u9VCBPxDtpuDEAGYmHMGPq9jSGGr/YqZJ+7D4ekGf
         VC0p1vyp2Zibd30Fi1kNomMSaZwZc3u3MRSb6vHU=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 74F9360E0D;
        Tue, 12 Nov 2019 21:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573593800;
        bh=Wv+nhrxa3ebd0WbZ6Pk3Dsk+zKXagMdXxAXFvISgL2g=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fO2dU4pwuNj/UW165Q3cy5Yo5CBYJ4fNcrvhdy72TjOa505vgEAo+MKEK7ob71kLF
         4ly3TnBKr4Jv+2xnygW0NcCtpyyCDmgIEt8eZmTWiS2TCGu145Jem6UuqKb8L0gdcM
         VbYeAmgQ3HnhGzcSRF9AGqd6Z2XhiBFTUgc+PBto=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 74F9360E0D
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=eberman@codeaurora.org
From:   Elliot Berman <eberman@codeaurora.org>
To:     bjorn.andersson@linaro.org, saiprakash.ranjan@codeaurora.org,
        agross@kernel.org, swboyd@chromium.org
Cc:     Elliot Berman <eberman@codeaurora.org>, tsoni@codeaurora.org,
        sidgup@codeaurora.org, psodagud@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 16/18] firmware: qcom_scm: Remove thin wrappers
Date:   Tue, 12 Nov 2019 13:22:52 -0800
Message-Id: <1573593774-12539-17-git-send-email-eberman@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573593774-12539-1-git-send-email-eberman@codeaurora.org>
References: <1573593774-12539-1-git-send-email-eberman@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

qcom_scm-32 and qcom_scm-64 implementations are nearly identical, so
make qcom_scm_call and qcom_scm_call_atomic unique to each. There are
the following catches:
- __qcom_scm_is_call_available is still in each -32,-64 implementation
  as the argument is unique to each convention
- For some functions, only one implementation was provided in -32 or
  -64. The actual implementation was moved into qcom_scm.c
- io_writel and io_readl in -64 were not atomic and -32 they were.
  Atomic is the better option, so use it.

Signed-off-by: Elliot Berman <eberman@codeaurora.org>
---
 drivers/firmware/qcom_scm-32.c | 407 +----------------------------------------
 drivers/firmware/qcom_scm-64.c | 399 +---------------------------------------
 drivers/firmware/qcom_scm.c    | 359 +++++++++++++++++++++++++++++++++---
 drivers/firmware/qcom_scm.h    |  75 ++++----
 4 files changed, 382 insertions(+), 858 deletions(-)

diff --git a/drivers/firmware/qcom_scm-32.c b/drivers/firmware/qcom_scm-32.c
index c1c0831..9e3789d 100644
--- a/drivers/firmware/qcom_scm-32.c
+++ b/drivers/firmware/qcom_scm-32.c
@@ -15,69 +15,8 @@
 
 #include "qcom_scm.h"
 
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
 static DEFINE_MUTEX(qcom_scm_lock);
 
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
-	u64 result[MAX_QCOM_SCM_RETS];
-	u32 owner;
-};
 struct arm_smccc_args {
 	unsigned long a[8];
 };
@@ -185,7 +124,7 @@ static void __qcom_scm_call_do(const struct arm_smccc_args *smc,
  * and response buffers is taken care of by qcom_scm_call; however, callers are
  * responsible for any other cached buffers passed over to the secure world.
  */
-static int qcom_scm_call(struct device *dev, struct qcom_scm_desc *desc)
+int qcom_scm_call(struct device *dev, struct qcom_scm_desc *desc)
 {
 	int arglen = desc->arginfo & 0xf;
 	int ret = 0, context_id;
@@ -269,7 +208,7 @@ static int qcom_scm_call(struct device *dev, struct qcom_scm_desc *desc)
  * This shall only be used with commands that are guaranteed to be
  * uninterruptable, atomic and SMP safe.
  */
-static int qcom_scm_call_atomic(struct device *dev, struct qcom_scm_desc *desc)
+int qcom_scm_call_atomic(struct device *dev, struct qcom_scm_desc *desc)
 {
 	int context_id;
 	struct arm_smccc_args smc = {0};
@@ -294,115 +233,6 @@ static int qcom_scm_call_atomic(struct device *dev, struct qcom_scm_desc *desc)
 	return res.a0;
 }
 
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
-	desc.arginfo = QCOM_SCM_ARGS(2);
-
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
 int __qcom_scm_is_call_available(struct device *dev, u32 svc_id, u32 cmd_id)
 {
 	int ret;
@@ -418,239 +248,6 @@ int __qcom_scm_is_call_available(struct device *dev, u32 svc_id, u32 cmd_id)
 	return ret ? : desc.result[0];
 }
 
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
-	*resp = desc.result[0];
-
-	return ret;
-}
-
 void __qcom_scm_init(void)
 {
 }
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
-	return ret ? false : !!desc.result[0];
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
-	return ret ? : desc.result[0];
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
-	return ret ? : desc.result[0];
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
-	return ret ? : desc.result[0];
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
-	return ret ? : desc.result[0];
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
-	return ret ? : desc.result[0];
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
-
-	ret = qcom_scm_call(dev, &desc);
-
-	return ret ? : desc.result[0];
-}
-
-int __qcom_scm_assign_mem(struct device *dev, phys_addr_t mem_region,
-			  size_t mem_sz, phys_addr_t src, size_t src_sz,
-			  phys_addr_t dest, size_t dest_sz)
-{
-	return -ENODEV;
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
-		*val = desc.result[0];
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
-int __qcom_scm_qsmmu500_wait_safe_toggle(struct device *dev, bool enable)
-{
-	return -ENODEV;
-}
diff --git a/drivers/firmware/qcom_scm-64.c b/drivers/firmware/qcom_scm-64.c
index 5088c0c..1e81b89 100644
--- a/drivers/firmware/qcom_scm-64.c
+++ b/drivers/firmware/qcom_scm-64.c
@@ -14,46 +14,6 @@
 
 #include "qcom_scm.h"
 
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
-	u64 result[MAX_QCOM_SCM_RETS];
-	u32 owner;
-};
-
 struct arm_smccc_args {
 	unsigned long a[8];
 };
@@ -189,7 +149,7 @@ static int ___qcom_scm_call_smccc(struct device *dev,
  * Sends a command to the SCM and waits for the command to finish processing.
  * This should *only* be called in pre-emptible context.
  */
-static int qcom_scm_call(struct device *dev, struct qcom_scm_desc *desc)
+int qcom_scm_call(struct device *dev, struct qcom_scm_desc *desc)
 {
 	might_sleep();
 	return ___qcom_scm_call_smccc(dev, desc, false);
@@ -206,52 +166,11 @@ static int qcom_scm_call(struct device *dev, struct qcom_scm_desc *desc)
  * Sends a command to the SCM and waits for the command to finish processing.
  * This can be called in atomic context.
  */
-static int qcom_scm_call_atomic(struct device *dev, struct qcom_scm_desc *desc)
+int qcom_scm_call_atomic(struct device *dev, struct qcom_scm_desc *desc)
 {
 	return ___qcom_scm_call_smccc(dev, desc, true);
 }
 
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
-	return -ENOTSUPP;
-}
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
-	return -ENOTSUPP;
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
-}
-
 int __qcom_scm_is_call_available(struct device *dev, u32 svc_id, u32 cmd_id)
 {
 	int ret;
@@ -270,37 +189,6 @@ int __qcom_scm_is_call_available(struct device *dev, u32 svc_id, u32 cmd_id)
 	return ret ? : desc.result[0];
 }
 
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
-	*resp = desc.result[0];
-
-	return ret;
-}
-
 void __qcom_scm_init(void)
 {
 	qcom_smccc_convention = ARM_SMCCC_SMC_64;
@@ -318,286 +206,3 @@ void __qcom_scm_init(void)
 out:
 	pr_debug("QCOM SCM SMC Convention: %llu\n", qcom_smccc_convention);
 }
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
-	return ret ? false : !!desc.result[0];
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
-	return ret ? : desc.result[0];
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
-	return ret ? : desc.result[0];
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
-	return ret ? : desc.result[0];
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
-	return ret ? : desc.result[0];
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
-	return ret ? : desc.result[0];
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
-	return ret ? : desc.result[0];
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
-	return ret ? : desc.result[0];
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
-	return ret ? : desc.result[0];
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
-		*size = desc.result[0];
-
-	return ret ? : desc.result[1];
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
-	return qcom_scm_call(dev, &desc);
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
-	ret = qcom_scm_call(dev, &desc);
-	if (ret >= 0)
-		*val = desc.result[0];
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
-	return qcom_scm_call(dev, &desc);
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
diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
index 1875e48..2dc9ca6 100644
--- a/drivers/firmware/qcom_scm.c
+++ b/drivers/firmware/qcom_scm.c
@@ -16,6 +16,7 @@
 #include <linux/of_platform.h>
 #include <linux/clk.h>
 #include <linux/reset-controller.h>
+#include <linux/arm-smccc.h>
 
 #include "qcom_scm.h"
 
@@ -84,6 +85,11 @@ static void qcom_scm_clk_disable(void)
 	clk_disable_unprepare(__scm->bus_clk);
 }
 
+#define QCOM_SCM_FLAG_COLDBOOT_CPU0	0x00
+#define QCOM_SCM_FLAG_COLDBOOT_CPU1	0x01
+#define QCOM_SCM_FLAG_COLDBOOT_CPU2	0x08
+#define QCOM_SCM_FLAG_COLDBOOT_CPU3	0x20
+
 /**
  * qcom_scm_set_cold_boot_addr() - Set the cold boot address for cpus
  * @entry: Entry point function for the cpus
@@ -94,11 +100,55 @@ static void qcom_scm_clk_disable(void)
  */
 int qcom_scm_set_cold_boot_addr(void *entry, const cpumask_t *cpus)
 {
-	return __qcom_scm_set_cold_boot_addr(__scm ? __scm->dev : NULL, entry,
-					     cpus);
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
+	return qcom_scm_call_atomic(__scm ? __scm->dev : NULL, &desc);
 }
 EXPORT_SYMBOL(qcom_scm_set_cold_boot_addr);
 
+#define QCOM_SCM_FLAG_WARMBOOT_CPU0	0x04
+#define QCOM_SCM_FLAG_WARMBOOT_CPU1	0x02
+#define QCOM_SCM_FLAG_WARMBOOT_CPU2	0x10
+#define QCOM_SCM_FLAG_WARMBOOT_CPU3	0x40
+
+struct qcom_scm_wb_entry {
+	int flag;
+	void *entry;
+};
+
+static struct qcom_scm_wb_entry qcom_scm_wb[] = {
+	{ .flag = QCOM_SCM_FLAG_WARMBOOT_CPU0 },
+	{ .flag = QCOM_SCM_FLAG_WARMBOOT_CPU1 },
+	{ .flag = QCOM_SCM_FLAG_WARMBOOT_CPU2 },
+	{ .flag = QCOM_SCM_FLAG_WARMBOOT_CPU3 },
+};
+
 /**
  * qcom_scm_set_warm_boot_addr() - Set the warm boot address for cpus
  * @entry: Entry point function for the cpus
@@ -109,7 +159,39 @@ EXPORT_SYMBOL(qcom_scm_set_cold_boot_addr);
  */
 int qcom_scm_set_warm_boot_addr(void *entry, const cpumask_t *cpus)
 {
-	return __qcom_scm_set_warm_boot_addr(__scm->dev, entry, cpus);
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
+	desc.arginfo = QCOM_SCM_ARGS(2);
+
+	ret = qcom_scm_call(__scm->dev, &desc);
+	if (!ret) {
+		for_each_cpu(cpu, cpus)
+			qcom_scm_wb[cpu].entry = entry;
+	}
+
+	return ret;
 }
 EXPORT_SYMBOL(qcom_scm_set_warm_boot_addr);
 
@@ -123,7 +205,15 @@ EXPORT_SYMBOL(qcom_scm_set_warm_boot_addr);
  */
 void qcom_scm_cpu_power_down(u32 flags)
 {
-	__qcom_scm_cpu_power_down(__scm ? __scm->dev : NULL, flags);
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_BOOT,
+		.cmd = QCOM_SCM_BOOT_TERMINATE_PC,
+		.args[0] = flags & QCOM_SCM_FLUSH_FLAG_MASK,
+		.arginfo = QCOM_SCM_ARGS(1),
+		.owner = ARM_SMCCC_OWNER_SIP,
+	};
+
+	qcom_scm_call_atomic(__scm ? __scm->dev : NULL, &desc);
 }
 EXPORT_SYMBOL(qcom_scm_cpu_power_down);
 
@@ -158,13 +248,37 @@ EXPORT_SYMBOL(qcom_scm_hdcp_available);
  */
 int qcom_scm_hdcp_req(struct qcom_scm_hdcp_req *req, u32 req_cnt, u32 *resp)
 {
-	int ret = qcom_scm_clk_enable();
+	int ret;
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_HDCP,
+		.cmd = QCOM_SCM_HDCP_INVOKE,
+		.owner = ARM_SMCCC_OWNER_SIP,
+	};
+
+	if (req_cnt > QCOM_SCM_HDCP_MAX_REQ_CNT)
+		return -ERANGE;
 
+	ret = qcom_scm_clk_enable();
 	if (ret)
 		return ret;
 
-	ret = __qcom_scm_hdcp_req(__scm->dev, req, req_cnt, resp);
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
+	ret = qcom_scm_call(__scm->dev, &desc);
+	*resp = desc.result[0];
+
 	qcom_scm_clk_disable();
+
 	return ret;
 }
 EXPORT_SYMBOL(qcom_scm_hdcp_req);
@@ -179,13 +293,23 @@ EXPORT_SYMBOL(qcom_scm_hdcp_req);
 bool qcom_scm_pas_supported(u32 peripheral)
 {
 	int ret;
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_PIL,
+		.cmd = QCOM_SCM_PIL_PAS_IS_SUPPORTED,
+		.owner = ARM_SMCCC_OWNER_SIP,
+	};
 
 	ret = __qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_PIL,
 					   QCOM_SCM_PIL_PAS_IS_SUPPORTED);
 	if (ret <= 0)
 		return false;
 
-	return __qcom_scm_pas_supported(__scm->dev, peripheral);
+	desc.args[0] = peripheral;
+	desc.arginfo = QCOM_SCM_ARGS(1);
+
+	ret = qcom_scm_call(__scm->dev, &desc);
+
+	return ret ? false : !!desc.result[0];
 }
 EXPORT_SYMBOL(qcom_scm_pas_supported);
 
@@ -206,6 +330,11 @@ int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size)
 	dma_addr_t mdata_phys;
 	void *mdata_buf;
 	int ret;
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_PIL,
+		.cmd = QCOM_SCM_PIL_PAS_INIT_IMAGE,
+		.owner = ARM_SMCCC_OWNER_SIP,
+	};
 
 	/*
 	 * During the scm call memory protection will be enabled for the meta
@@ -224,14 +353,18 @@ int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size)
 	if (ret)
 		goto free_metadata;
 
-	ret = __qcom_scm_pas_init_image(__scm->dev, peripheral, mdata_phys);
+	desc.args[0] = peripheral;
+	desc.args[1] = mdata_phys;
+	desc.arginfo = QCOM_SCM_ARGS(2, QCOM_SCM_VAL, QCOM_SCM_RW);
+
+	ret = qcom_scm_call(__scm->dev, &desc);
 
 	qcom_scm_clk_disable();
 
 free_metadata:
 	dma_free_coherent(__scm->dev, size, mdata_buf, mdata_phys);
 
-	return ret;
+	return ret ? : desc.result[0];
 }
 EXPORT_SYMBOL(qcom_scm_pas_init_image);
 
@@ -247,15 +380,25 @@ EXPORT_SYMBOL(qcom_scm_pas_init_image);
 int qcom_scm_pas_mem_setup(u32 peripheral, phys_addr_t addr, phys_addr_t size)
 {
 	int ret;
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_PIL,
+		.cmd = QCOM_SCM_PIL_PAS_MEM_SETUP,
+		.owner = ARM_SMCCC_OWNER_SIP,
+	};
 
 	ret = qcom_scm_clk_enable();
 	if (ret)
 		return ret;
 
-	ret = __qcom_scm_pas_mem_setup(__scm->dev, peripheral, addr, size);
+	desc.args[0] = peripheral;
+	desc.args[1] = addr;
+	desc.args[2] = size;
+	desc.arginfo = QCOM_SCM_ARGS(3);
+
+	ret = qcom_scm_call(__scm->dev, &desc);
 	qcom_scm_clk_disable();
 
-	return ret;
+	return ret ? : desc.result[0];
 }
 EXPORT_SYMBOL(qcom_scm_pas_mem_setup);
 
@@ -269,15 +412,20 @@ EXPORT_SYMBOL(qcom_scm_pas_mem_setup);
 int qcom_scm_pas_auth_and_reset(u32 peripheral)
 {
 	int ret;
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_PIL,
+		.cmd = QCOM_SCM_PIL_PAS_AUTH_AND_RESET,
+		.owner = ARM_SMCCC_OWNER_SIP,
+	};
 
 	ret = qcom_scm_clk_enable();
 	if (ret)
 		return ret;
 
-	ret = __qcom_scm_pas_auth_and_reset(__scm->dev, peripheral);
+	ret = qcom_scm_call(__scm->dev, &desc);
 	qcom_scm_clk_disable();
 
-	return ret;
+	return ret ? : desc.result[0];
 }
 EXPORT_SYMBOL(qcom_scm_pas_auth_and_reset);
 
@@ -290,18 +438,44 @@ EXPORT_SYMBOL(qcom_scm_pas_auth_and_reset);
 int qcom_scm_pas_shutdown(u32 peripheral)
 {
 	int ret;
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_PIL,
+		.cmd = QCOM_SCM_PIL_PAS_SHUTDOWN,
+		.owner = ARM_SMCCC_OWNER_SIP,
+	};
 
 	ret = qcom_scm_clk_enable();
 	if (ret)
 		return ret;
 
-	ret = __qcom_scm_pas_shutdown(__scm->dev, peripheral);
+	desc.args[0] = peripheral;
+	desc.arginfo = QCOM_SCM_ARGS(1);
+	ret = qcom_scm_call(__scm->dev, &desc);
+
 	qcom_scm_clk_disable();
 
-	return ret;
+	return ret ? : desc.result[0];
 }
 EXPORT_SYMBOL(qcom_scm_pas_shutdown);
 
+static int __qcom_scm_pas_mss_reset(struct device *dev, bool reset)
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
+	ret = qcom_scm_call(__scm->dev, &desc);
+
+	return ret ? : desc.result[0];
+}
+
 static int qcom_scm_pas_reset_assert(struct reset_controller_dev *rcdev,
 				     unsigned long idx)
 {
@@ -327,40 +501,136 @@ static const struct reset_control_ops qcom_scm_pas_reset_ops = {
 
 int qcom_scm_restore_sec_cfg(u32 device_id, u32 spare)
 {
-	return __qcom_scm_restore_sec_cfg(__scm->dev, device_id, spare);
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
+	ret = qcom_scm_call(__scm->dev, &desc);
+
+	return ret ? : desc.result[0];
 }
 EXPORT_SYMBOL(qcom_scm_restore_sec_cfg);
 
 int qcom_scm_iommu_secure_ptbl_size(u32 spare, size_t *size)
 {
-	return __qcom_scm_iommu_secure_ptbl_size(__scm->dev, spare, size);
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
+	ret = qcom_scm_call(__scm->dev, &desc);
+
+	if (size)
+		*size = desc.result[0];
+
+	return ret ? : desc.result[1];
 }
 EXPORT_SYMBOL(qcom_scm_iommu_secure_ptbl_size);
 
 int qcom_scm_iommu_secure_ptbl_init(u64 addr, u32 size, u32 spare)
 {
-	return __qcom_scm_iommu_secure_ptbl_init(__scm->dev, addr, size, spare);
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
+	ret = qcom_scm_call(__scm->dev, &desc);
+
+	/* the pg table has been initialized already, ignore the error */
+	if (ret == -EPERM)
+		ret = 0;
+
+	return ret;
 }
 EXPORT_SYMBOL(qcom_scm_iommu_secure_ptbl_init);
 
 int qcom_scm_qsmmu500_wait_safe_toggle(bool en)
 {
-	return __qcom_scm_qsmmu500_wait_safe_toggle(__scm->dev, en);
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
+	return qcom_scm_call_atomic(__scm->dev, &desc);
 }
 EXPORT_SYMBOL(qcom_scm_qsmmu500_wait_safe_toggle);
 
 int qcom_scm_io_readl(phys_addr_t addr, unsigned int *val)
 {
-	return __qcom_scm_io_readl(__scm->dev, addr, val);
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
+	ret = qcom_scm_call(__scm->dev, &desc);
+	if (ret >= 0)
+		*val = desc.result[0];
+
+	return ret < 0 ? ret : 0;
 }
 EXPORT_SYMBOL(qcom_scm_io_readl);
 
 int qcom_scm_io_writel(phys_addr_t addr, unsigned int val)
 {
-	return __qcom_scm_io_writel(__scm->dev, addr, val);
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
+	return qcom_scm_call(__scm->dev, &desc);
 }
 EXPORT_SYMBOL(qcom_scm_io_writel);
 
+static int __qcom_scm_set_dload_mode(struct device *dev, bool enable)
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
+	return qcom_scm_call(__scm->dev, &desc);
+}
+
 static void qcom_scm_set_download_mode(bool enable)
 {
 	bool avail;
@@ -372,8 +642,8 @@ static void qcom_scm_set_download_mode(bool enable)
 	if (avail) {
 		ret = __qcom_scm_set_dload_mode(__scm->dev, enable);
 	} else if (__scm->dload_mode_addr) {
-		ret = __qcom_scm_io_writel(__scm->dev, __scm->dload_mode_addr,
-					   enable ? QCOM_SCM_BOOT_SET_DLOAD_MODE : 0);
+		ret = qcom_scm_io_writel(__scm->dload_mode_addr,
+				enable ? QCOM_SCM_BOOT_SET_DLOAD_MODE : 0);
 	} else {
 		dev_err(__scm->dev,
 			"No available mechanism for setting download mode\n");
@@ -420,10 +690,51 @@ EXPORT_SYMBOL(qcom_scm_is_available);
 
 int qcom_scm_set_remote_state(u32 state, u32 id)
 {
-	return __qcom_scm_set_remote_state(__scm->dev, state, id);
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
+	ret = qcom_scm_call(__scm->dev, &desc);
+
+	return ret ? : desc.result[0];
 }
 EXPORT_SYMBOL(qcom_scm_set_remote_state);
 
+static int __qcom_scm_assign_mem(struct device *dev, phys_addr_t mem_region,
+				 size_t mem_sz, phys_addr_t src, size_t src_sz,
+				 phys_addr_t dest, size_t dest_sz)
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
+	return ret ? : desc.result[0];
+}
+
 /**
  * qcom_scm_assign_mem() - Make a secure call to reassign memory ownership
  * @mem_addr: mem region whose ownership need to be reassigned
diff --git a/drivers/firmware/qcom_scm.h b/drivers/firmware/qcom_scm.h
index 35cdacf..efbd31b 100644
--- a/drivers/firmware/qcom_scm.h
+++ b/drivers/firmware/qcom_scm.h
@@ -4,27 +4,60 @@
 #ifndef __QCOM_SCM_INT_H
 #define __QCOM_SCM_INT_H
 
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
+	u64 result[MAX_QCOM_SCM_RETS];
+	u32 owner;
+};
+
+extern int qcom_scm_call(struct device *dev, struct qcom_scm_desc *desc);
+extern int qcom_scm_call_atomic(struct device *dev, struct qcom_scm_desc *desc);
+
 #define QCOM_SCM_SVC_BOOT		0x1
 #define QCOM_SCM_BOOT_SET_ADDR		0x1
 #define QCOM_SCM_BOOT_SET_DLOAD_MODE		0x10
 #define QCOM_SCM_BOOT_SET_REMOTE_STATE	0xa
-extern int __qcom_scm_set_remote_state(struct device *dev, u32 state, u32 id);
-extern int __qcom_scm_set_dload_mode(struct device *dev, bool enable);
-
-extern int __qcom_scm_set_warm_boot_addr(struct device *dev, void *entry,
-		const cpumask_t *cpus);
-extern int __qcom_scm_set_cold_boot_addr(struct device *dev, void *entry,
-		const cpumask_t *cpus);
 
 #define QCOM_SCM_BOOT_TERMINATE_PC	0x2
 #define QCOM_SCM_FLUSH_FLAG_MASK	0x3
-extern void __qcom_scm_cpu_power_down(struct device *dev, u32 flags);
 
 #define QCOM_SCM_SVC_IO			0x5
 #define QCOM_SCM_IO_READ		0x1
 #define QCOM_SCM_IO_WRITE		0x2
-extern int __qcom_scm_io_readl(struct device *dev, phys_addr_t addr, unsigned int *val);
-extern int __qcom_scm_io_writel(struct device *dev, phys_addr_t addr, unsigned int val);
 
 #define QCOM_SCM_SVC_INFO		0x6
 #define QCOM_SCM_INFO_IS_CALL_AVAIL	0x1
@@ -33,8 +66,6 @@ extern int __qcom_scm_is_call_available(struct device *dev, u32 svc_id,
 
 #define QCOM_SCM_SVC_HDCP		0x11
 #define QCOM_SCM_HDCP_INVOKE		0x01
-extern int __qcom_scm_hdcp_req(struct device *dev,
-		struct qcom_scm_hdcp_req *req, u32 req_cnt, u32 *resp);
 
 extern void __qcom_scm_init(void);
 
@@ -45,14 +76,6 @@ extern void __qcom_scm_init(void);
 #define QCOM_SCM_PIL_PAS_SHUTDOWN	0x6
 #define QCOM_SCM_PIL_PAS_IS_SUPPORTED	0x7
 #define QCOM_SCM_PIL_PAS_MSS_RESET		0xa
-extern bool __qcom_scm_pas_supported(struct device *dev, u32 peripheral);
-extern int  __qcom_scm_pas_init_image(struct device *dev, u32 peripheral,
-		dma_addr_t metadata_phys);
-extern int  __qcom_scm_pas_mem_setup(struct device *dev, u32 peripheral,
-		phys_addr_t addr, phys_addr_t size);
-extern int  __qcom_scm_pas_auth_and_reset(struct device *dev, u32 peripheral);
-extern int  __qcom_scm_pas_shutdown(struct device *dev, u32 peripheral);
-extern int  __qcom_scm_pas_mss_reset(struct device *dev, bool reset);
 
 /* common error codes */
 #define QCOM_SCM_V2_EBUSY	-12
@@ -83,23 +106,11 @@ static inline int qcom_scm_remap_error(int err)
 
 #define QCOM_SCM_SVC_MP			0xc
 #define QCOM_SCM_MP_RESTORE_SEC_CFG	2
-extern int __qcom_scm_restore_sec_cfg(struct device *dev, u32 device_id,
-				      u32 spare);
 #define QCOM_SCM_MP_IOMMU_SECURE_PTBL_SIZE	3
 #define QCOM_SCM_MP_IOMMU_SECURE_PTBL_INIT	4
 #define QCOM_SCM_SVC_SMMU_PROGRAM	0x15
 #define QCOM_SCM_SMMU_CONFIG_ERRATA1		0x3
 #define QCOM_SCM_SMMU_CONFIG_ERRATA1_CLIENT_ALL	0x2
-extern int __qcom_scm_iommu_secure_ptbl_size(struct device *dev, u32 spare,
-					     size_t *size);
-extern int __qcom_scm_iommu_secure_ptbl_init(struct device *dev, u64 addr,
-					     u32 size, u32 spare);
-extern int __qcom_scm_qsmmu500_wait_safe_toggle(struct device *dev,
-						bool enable);
 #define QCOM_SCM_MP_ASSIGN	0x16
-extern int  __qcom_scm_assign_mem(struct device *dev,
-				  phys_addr_t mem_region, size_t mem_sz,
-				  phys_addr_t src, size_t src_sz,
-				  phys_addr_t dest, size_t dest_sz);
 
 #endif
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

