Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CDB89EF2A4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2019 02:29:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730363AbfKEB15 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Nov 2019 20:27:57 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:37696 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730241AbfKEB14 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Nov 2019 20:27:56 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 90A0360F40; Tue,  5 Nov 2019 01:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572917275;
        bh=3J9LwmC8uXH67qvjYg4DyYqhAMT80lEOn+98k9QeNIA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=oWYyl3RhwNjMd/3bbNqCXnHPlKRbJj/6qRIMzU7eC9ylHnQvj6NzeTGLnXm4/K5gk
         J7Q35gXtRqQcWy2SdzUX14OvRMXc2OAWu8otP9U6+eUHBRWWc/2jhylaEdX/lxLsG7
         AKUGDelETcR1N4s+fcNfnPfCH4Rz0yq+lRVEBpp4=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 70D1160E0D;
        Tue,  5 Nov 2019 01:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572917271;
        bh=3J9LwmC8uXH67qvjYg4DyYqhAMT80lEOn+98k9QeNIA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SgJuK+69Y/UjMPRWRtDo7ASYc0YRXN5E0RtKvBd+sGLW57Hc5k4cLcn2GA89Ahn6O
         Elr1C8kSrayvvXWOfkTW4za2AnSzcZoSWEc2eUgjKeLFYYgv6r2lQa2xw5vdsWDWcP
         UxYpnMmetj1v0NXgWgpKNBX65ognBuxfpKI7RIKs=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 70D1160E0D
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=eberman@codeaurora.org
From:   Elliot Berman <eberman@codeaurora.org>
To:     bjorn.andersson@linaro.org, saiprakash.ranjan@codeaurora.org,
        agross@kernel.org
Cc:     tsoni@codeaurora.org, sidgup@codeaurora.org,
        psodagud@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Elliot Berman <eberman@codeaurora.org>
Subject: [PATCH 05/17] firmware: qcom_scm-64: Move svc/cmd/owner into qcom_scm_desc
Date:   Mon,  4 Nov 2019 17:27:24 -0800
Message-Id: <1572917256-24205-6-git-send-email-eberman@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1572917256-24205-1-git-send-email-eberman@codeaurora.org>
References: <1572917256-24205-1-git-send-email-eberman@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Service, command, and owner IDs are all part of qcom_scm_desc struct and
have no special reason to be a function argument (or hard-coded in the
case of owner). Moving them to be part of qcom_scm_desc struct improves
readability.

Signed-off-by: Elliot Berman <eberman@codeaurora.org>
---
 drivers/firmware/qcom_scm-64.c | 192 +++++++++++++++++++++++++----------------
 1 file changed, 120 insertions(+), 72 deletions(-)

diff --git a/drivers/firmware/qcom_scm-64.c b/drivers/firmware/qcom_scm-64.c
index ead0b5f..76412a5 100644
--- a/drivers/firmware/qcom_scm-64.c
+++ b/drivers/firmware/qcom_scm-64.c
@@ -46,8 +46,11 @@ enum qcom_scm_arg_types {
  * @res:	The values returned by the secure syscall
  */
 struct qcom_scm_desc {
+	u32 svc;
+	u32 cmd;
 	u32 arginfo;
 	u64 args[MAX_QCOM_SCM_ARGS];
+	u32 owner;
 };
 
 static u64 qcom_smccc_convention = -1;
@@ -62,14 +65,16 @@ static DEFINE_MUTEX(qcom_scm_lock);
 #define SMCCC_N_EXT_ARGS	(MAX_QCOM_SCM_ARGS - SMCCC_N_REG_ARGS + 1)
 
 static void __qcom_scm_call_do_quirk(const struct qcom_scm_desc *desc,
-			       struct arm_smccc_res *res, u32 fn_id,
-			       u64 x5, u32 type)
+			       struct arm_smccc_res *res, u64 x5, u32 type)
 {
 	u64 cmd;
 	struct arm_smccc_quirk quirk = { .id = ARM_SMCCC_QUIRK_QCOM_A6 };
 
-	cmd = ARM_SMCCC_CALL_VAL(type, qcom_smccc_convention,
-				 ARM_SMCCC_OWNER_SIP, fn_id);
+	cmd = ARM_SMCCC_CALL_VAL(
+		type,
+		qcom_smccc_convention,
+		desc->owner,
+		SMCCC_FUNCNUM(desc->svc, desc->cmd));
 
 	quirk.state.a6 = 0;
 
@@ -85,22 +90,19 @@ static void __qcom_scm_call_do_quirk(const struct qcom_scm_desc *desc,
 }
 
 static void qcom_scm_call_do_smccc(const struct qcom_scm_desc *desc,
-			     struct arm_smccc_res *res, u32 fn_id,
-			     u64 x5, bool atomic)
+			     struct arm_smccc_res *res, u64 x5, bool atomic)
 {
 	int retry_count = 0;
 
 	if (atomic) {
-		__qcom_scm_call_do_quirk(desc, res, fn_id, x5,
-					 ARM_SMCCC_FAST_CALL);
+		__qcom_scm_call_do_quirk(desc, res, x5, ARM_SMCCC_FAST_CALL);
 		return;
 	}
 
 	do {
 		mutex_lock(&qcom_scm_lock);
 
-		__qcom_scm_call_do_quirk(desc, res, fn_id, x5,
-					 ARM_SMCCC_STD_CALL);
+		__qcom_scm_call_do_quirk(desc, res, x5, ARM_SMCCC_STD_CALL);
 
 		mutex_unlock(&qcom_scm_lock);
 
@@ -112,13 +114,12 @@ static void qcom_scm_call_do_smccc(const struct qcom_scm_desc *desc,
 	}  while (res->a0 == QCOM_SCM_V2_EBUSY);
 }
 
-static int ___qcom_scm_call_smccc(struct device *dev, u32 svc_id, u32 cmd_id,
+static int ___qcom_scm_call_smccc(struct device *dev,
 				  const struct qcom_scm_desc *desc,
 				  struct arm_smccc_res *res, bool atomic)
 {
 	int arglen = desc->arginfo & 0xf;
 	int i;
-	u32 fn_id = SMCCC_FUNCNUM(svc_id, cmd_id);
 	u64 x5 = desc->args[SMCCC_N_REG_ARGS - 1];
 	dma_addr_t args_phys = 0;
 	void *args_virt = NULL;
@@ -157,7 +158,7 @@ static int ___qcom_scm_call_smccc(struct device *dev, u32 svc_id, u32 cmd_id,
 		x5 = args_phys;
 	}
 
-	qcom_scm_call_do_smccc(desc, res, fn_id, x5, atomic);
+	qcom_scm_call_do_smccc(desc, res, x5, atomic);
 
 	if (args_virt) {
 		dma_unmap_single(dev, args_phys, alloc_len, DMA_TO_DEVICE);
@@ -180,12 +181,11 @@ static int ___qcom_scm_call_smccc(struct device *dev, u32 svc_id, u32 cmd_id,
  * Sends a command to the SCM and waits for the command to finish processing.
  * This should *only* be called in pre-emptible context.
  */
-static int qcom_scm_call(struct device *dev, u32 svc_id, u32 cmd_id,
-			 const struct qcom_scm_desc *desc,
+static int qcom_scm_call(struct device *dev, const struct qcom_scm_desc *desc,
 			 struct arm_smccc_res *res)
 {
 	might_sleep();
-	return ___qcom_scm_call_smccc(dev, svc_id, cmd_id, desc, res, false);
+	return ___qcom_scm_call_smccc(dev, desc, res, false);
 }
 
 /**
@@ -199,11 +199,11 @@ static int qcom_scm_call(struct device *dev, u32 svc_id, u32 cmd_id,
  * Sends a command to the SCM and waits for the command to finish processing.
  * This can be called in atomic context.
  */
-static int qcom_scm_call_atomic(struct device *dev, u32 svc_id, u32 cmd_id,
+static int qcom_scm_call_atomic(struct device *dev,
 				const struct qcom_scm_desc *desc,
 				struct arm_smccc_res *res)
 {
-	return ___qcom_scm_call_smccc(dev, svc_id, cmd_id, desc, res, true);
+	return ___qcom_scm_call_smccc(dev, desc, res, true);
 }
 
 /**
@@ -248,7 +248,11 @@ void __qcom_scm_cpu_power_down(u32 flags)
 
 int __qcom_scm_set_remote_state(struct device *dev, u32 state, u32 id)
 {
-	struct qcom_scm_desc desc = {0};
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_BOOT,
+		.cmd = QCOM_SCM_BOOT_SET_REMOTE_STATE,
+		.owner = ARM_SMCCC_OWNER_SIP,
+	};
 	struct arm_smccc_res res;
 	int ret;
 
@@ -256,37 +260,41 @@ int __qcom_scm_set_remote_state(struct device *dev, u32 state, u32 id)
 	desc.args[1] = id;
 	desc.arginfo = QCOM_SCM_ARGS(2);
 
-	ret = qcom_scm_call(dev, QCOM_SCM_SVC_BOOT, QCOM_SCM_BOOT_SET_REMOTE_STATE,
-			    &desc, &res);
+	ret = qcom_scm_call(dev, &desc, &res);
 
 	return ret ? : res.a1;
 }
 
 int __qcom_scm_set_dload_mode(struct device *dev, bool enable)
 {
-	struct qcom_scm_desc desc = {0};
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_BOOT,
+		.cmd = QCOM_SCM_BOOT_SET_DLOAD_MODE,
+		.owner = ARM_SMCCC_OWNER_SIP,
+	};
 	struct arm_smccc_res res;
 
 	desc.args[0] = QCOM_SCM_BOOT_SET_DLOAD_MODE;
 	desc.args[1] = enable ? QCOM_SCM_BOOT_SET_DLOAD_MODE : 0;
 	desc.arginfo = QCOM_SCM_ARGS(2);
 
-	return qcom_scm_call(dev, QCOM_SCM_SVC_BOOT, QCOM_SCM_BOOT_SET_DLOAD_MODE,
-			     &desc, &res);
+	return qcom_scm_call(dev, &desc, &res);
 }
 
 bool __qcom_scm_pas_supported(struct device *dev, u32 peripheral)
 {
 	int ret;
-	struct qcom_scm_desc desc = {0};
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_PIL,
+		.cmd = QCOM_SCM_PIL_PAS_IS_SUPPORTED,
+		.owner = ARM_SMCCC_OWNER_SIP,
+	};
 	struct arm_smccc_res res;
 
 	desc.args[0] = peripheral;
 	desc.arginfo = QCOM_SCM_ARGS(1);
 
-	ret = qcom_scm_call(dev, QCOM_SCM_SVC_PIL,
-				QCOM_SCM_PIL_PAS_IS_SUPPORTED,
-				&desc, &res);
+	ret = qcom_scm_call(dev, &desc, &res);
 
 	return ret ? false : !!res.a1;
 }
@@ -295,15 +303,18 @@ int __qcom_scm_pas_init_image(struct device *dev, u32 peripheral,
 			      dma_addr_t metadata_phys)
 {
 	int ret;
-	struct qcom_scm_desc desc = {0};
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_PIL,
+		.cmd = QCOM_SCM_PIL_PAS_INIT_IMAGE,
+		.owner = ARM_SMCCC_OWNER_SIP,
+	};
 	struct arm_smccc_res res;
 
 	desc.args[0] = peripheral;
 	desc.args[1] = metadata_phys;
 	desc.arginfo = QCOM_SCM_ARGS(2, QCOM_SCM_VAL, QCOM_SCM_RW);
 
-	ret = qcom_scm_call(dev, QCOM_SCM_SVC_PIL, QCOM_SCM_PIL_PAS_INIT_IMAGE,
-				&desc, &res);
+	ret = qcom_scm_call(dev, &desc, &res);
 
 	return ret ? : res.a1;
 }
@@ -312,7 +323,11 @@ int __qcom_scm_pas_mem_setup(struct device *dev, u32 peripheral,
 			      phys_addr_t addr, phys_addr_t size)
 {
 	int ret;
-	struct qcom_scm_desc desc = {0};
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_PIL,
+		.cmd = QCOM_SCM_PIL_PAS_MEM_SETUP,
+		.owner = ARM_SMCCC_OWNER_SIP,
+	};
 	struct arm_smccc_res res;
 
 	desc.args[0] = peripheral;
@@ -320,8 +335,7 @@ int __qcom_scm_pas_mem_setup(struct device *dev, u32 peripheral,
 	desc.args[2] = size;
 	desc.arginfo = QCOM_SCM_ARGS(3);
 
-	ret = qcom_scm_call(dev, QCOM_SCM_SVC_PIL, QCOM_SCM_PIL_PAS_MEM_SETUP,
-				&desc, &res);
+	ret = qcom_scm_call(dev, &desc, &res);
 
 	return ret ? : res.a1;
 }
@@ -329,15 +343,17 @@ int __qcom_scm_pas_mem_setup(struct device *dev, u32 peripheral,
 int __qcom_scm_pas_auth_and_reset(struct device *dev, u32 peripheral)
 {
 	int ret;
-	struct qcom_scm_desc desc = {0};
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_PIL,
+		.cmd = QCOM_SCM_PIL_PAS_AUTH_AND_RESET,
+		.owner = ARM_SMCCC_OWNER_SIP,
+	};
 	struct arm_smccc_res res;
 
 	desc.args[0] = peripheral;
 	desc.arginfo = QCOM_SCM_ARGS(1);
 
-	ret = qcom_scm_call(dev, QCOM_SCM_SVC_PIL,
-				QCOM_SCM_PIL_PAS_AUTH_AND_RESET,
-				&desc, &res);
+	ret = qcom_scm_call(dev, &desc, &res);
 
 	return ret ? : res.a1;
 }
@@ -345,21 +361,28 @@ int __qcom_scm_pas_auth_and_reset(struct device *dev, u32 peripheral)
 int __qcom_scm_pas_shutdown(struct device *dev, u32 peripheral)
 {
 	int ret;
-	struct qcom_scm_desc desc = {0};
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_PIL,
+		.cmd = QCOM_SCM_PIL_PAS_SHUTDOWN,
+		.owner = ARM_SMCCC_OWNER_SIP,
+	};
 	struct arm_smccc_res res;
 
 	desc.args[0] = peripheral;
 	desc.arginfo = QCOM_SCM_ARGS(1);
 
-	ret = qcom_scm_call(dev, QCOM_SCM_SVC_PIL, QCOM_SCM_PIL_PAS_SHUTDOWN,
-			&desc, &res);
+	ret = qcom_scm_call(dev, &desc, &res);
 
 	return ret ? : res.a1;
 }
 
 int __qcom_scm_pas_mss_reset(struct device *dev, bool reset)
 {
-	struct qcom_scm_desc desc = {0};
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_PIL,
+		.cmd = QCOM_SCM_PIL_PAS_MSS_RESET,
+		.owner = ARM_SMCCC_OWNER_SIP,
+	};
 	struct arm_smccc_res res;
 	int ret;
 
@@ -367,8 +390,7 @@ int __qcom_scm_pas_mss_reset(struct device *dev, bool reset)
 	desc.args[1] = 0;
 	desc.arginfo = QCOM_SCM_ARGS(2);
 
-	ret = qcom_scm_call(dev, QCOM_SCM_SVC_PIL, QCOM_SCM_PIL_PAS_MSS_RESET, &desc,
-			    &res);
+	ret = qcom_scm_call(dev, &desc, &res);
 
 	return ret ? : res.a1;
 }
@@ -376,15 +398,18 @@ int __qcom_scm_pas_mss_reset(struct device *dev, bool reset)
 int __qcom_scm_io_readl(struct device *dev, phys_addr_t addr,
 			unsigned int *val)
 {
-	struct qcom_scm_desc desc = {0};
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_IO,
+		.cmd = QCOM_SCM_IO_READ,
+		.owner = ARM_SMCCC_OWNER_SIP,
+	};
 	struct arm_smccc_res res;
 	int ret;
 
 	desc.args[0] = addr;
 	desc.arginfo = QCOM_SCM_ARGS(1);
 
-	ret = qcom_scm_call(dev, QCOM_SCM_SVC_IO, QCOM_SCM_IO_READ,
-			    &desc, &res);
+	ret = qcom_scm_call(dev, &desc, &res);
 	if (ret >= 0)
 		*val = res.a1;
 
@@ -393,36 +418,46 @@ int __qcom_scm_io_readl(struct device *dev, phys_addr_t addr,
 
 int __qcom_scm_io_writel(struct device *dev, phys_addr_t addr, unsigned int val)
 {
-	struct qcom_scm_desc desc = {0};
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_IO,
+		.cmd = QCOM_SCM_IO_WRITE,
+		.owner = ARM_SMCCC_OWNER_SIP,
+	};
 	struct arm_smccc_res res;
 
 	desc.args[0] = addr;
 	desc.args[1] = val;
 	desc.arginfo = QCOM_SCM_ARGS(2);
 
-	return qcom_scm_call(dev, QCOM_SCM_SVC_IO, QCOM_SCM_IO_WRITE,
-			     &desc, &res);
+	return qcom_scm_call(dev, &desc, &res);
 }
 
 int __qcom_scm_is_call_available(struct device *dev, u32 svc_id, u32 cmd_id)
 {
 	int ret;
-	struct qcom_scm_desc desc = {0};
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_INFO,
+		.cmd = QCOM_SCM_INFO_IS_CALL_AVAIL,
+		.owner = ARM_SMCCC_OWNER_SIP,
+	};
 	struct arm_smccc_res res;
 
 	desc.arginfo = QCOM_SCM_ARGS(1);
 	desc.args[0] = SMCCC_FUNCNUM(svc_id, cmd_id) |
 			(ARM_SMCCC_OWNER_SIP << ARM_SMCCC_OWNER_SHIFT);
 
-	ret = qcom_scm_call(dev, QCOM_SCM_SVC_INFO, QCOM_SCM_INFO_IS_CALL_AVAIL,
-			    &desc, &res);
+	ret = qcom_scm_call(dev, &desc, &res);
 
 	return ret ? : res.a1;
 }
 
 int __qcom_scm_restore_sec_cfg(struct device *dev, u32 device_id, u32 spare)
 {
-	struct qcom_scm_desc desc = {0};
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_MP,
+		.cmd = QCOM_SCM_MP_RESTORE_SEC_CFG,
+		.owner = ARM_SMCCC_OWNER_SIP,
+	};
 	struct arm_smccc_res res;
 	int ret;
 
@@ -430,8 +465,7 @@ int __qcom_scm_restore_sec_cfg(struct device *dev, u32 device_id, u32 spare)
 	desc.args[1] = spare;
 	desc.arginfo = QCOM_SCM_ARGS(2);
 
-	ret = qcom_scm_call(dev, QCOM_SCM_SVC_MP, QCOM_SCM_MP_RESTORE_SEC_CFG,
-			    &desc, &res);
+	ret = qcom_scm_call(dev, &desc, &res);
 
 	return ret ? : res.a1;
 }
@@ -439,15 +473,18 @@ int __qcom_scm_restore_sec_cfg(struct device *dev, u32 device_id, u32 spare)
 int __qcom_scm_iommu_secure_ptbl_size(struct device *dev, u32 spare,
 				      size_t *size)
 {
-	struct qcom_scm_desc desc = {0};
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_MP,
+		.cmd = QCOM_SCM_MP_IOMMU_SECURE_PTBL_SIZE,
+		.owner = ARM_SMCCC_OWNER_SIP,
+	};
 	struct arm_smccc_res res;
 	int ret;
 
 	desc.args[0] = spare;
 	desc.arginfo = QCOM_SCM_ARGS(1);
 
-	ret = qcom_scm_call(dev, QCOM_SCM_SVC_MP,
-			    QCOM_SCM_MP_IOMMU_SECURE_PTBL_SIZE, &desc, &res);
+	ret = qcom_scm_call(dev, &desc, &res);
 
 	if (size)
 		*size = res.a1;
@@ -458,7 +495,11 @@ int __qcom_scm_iommu_secure_ptbl_size(struct device *dev, u32 spare,
 int __qcom_scm_iommu_secure_ptbl_init(struct device *dev, u64 addr, u32 size,
 				      u32 spare)
 {
-	struct qcom_scm_desc desc = {0};
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_MP,
+		.cmd = QCOM_SCM_MP_IOMMU_SECURE_PTBL_INIT,
+		.owner = ARM_SMCCC_OWNER_SIP,
+	};
 	struct arm_smccc_res res;
 	int ret;
 
@@ -468,8 +509,7 @@ int __qcom_scm_iommu_secure_ptbl_init(struct device *dev, u64 addr, u32 size,
 	desc.arginfo = QCOM_SCM_ARGS(3, QCOM_SCM_RW, QCOM_SCM_VAL,
 				     QCOM_SCM_VAL);
 
-	ret = qcom_scm_call(dev, QCOM_SCM_SVC_MP,
-			    QCOM_SCM_MP_IOMMU_SECURE_PTBL_INIT, &desc, &res);
+	ret = qcom_scm_call(dev, &desc, &res);
 
 	/* the pg table has been initialized already, ignore the error */
 	if (ret == -EPERM)
@@ -483,7 +523,11 @@ int __qcom_scm_assign_mem(struct device *dev, phys_addr_t mem_region,
 			  phys_addr_t dest, size_t dest_sz)
 {
 	int ret;
-	struct qcom_scm_desc desc = {0};
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_MP,
+		.cmd = QCOM_SCM_MP_ASSIGN,
+		.owner = ARM_SMCCC_OWNER_SIP,
+	};
 	struct arm_smccc_res res;
 
 	desc.args[0] = mem_region;
@@ -498,9 +542,7 @@ int __qcom_scm_assign_mem(struct device *dev, phys_addr_t mem_region,
 				     QCOM_SCM_RO, QCOM_SCM_VAL, QCOM_SCM_RO,
 				     QCOM_SCM_VAL, QCOM_SCM_VAL);
 
-	ret = qcom_scm_call(dev, QCOM_SCM_SVC_MP,
-			    QCOM_SCM_MP_ASSIGN,
-			    &desc, &res);
+	ret = qcom_scm_call(dev, &desc, &res);
 
 	return ret ? : res.a1;
 }
@@ -509,7 +551,11 @@ int __qcom_scm_hdcp_req(struct device *dev, struct qcom_scm_hdcp_req *req,
 			u32 req_cnt, u32 *resp)
 {
 	int ret;
-	struct qcom_scm_desc desc = {0};
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_HDCP,
+		.cmd = QCOM_SCM_HDCP_INVOKE,
+		.owner = ARM_SMCCC_OWNER_SIP,
+	};
 	struct arm_smccc_res res;
 
 	if (req_cnt > QCOM_SCM_HDCP_MAX_REQ_CNT)
@@ -527,8 +573,7 @@ int __qcom_scm_hdcp_req(struct device *dev, struct qcom_scm_hdcp_req *req,
 	desc.args[9] = req[4].val;
 	desc.arginfo = QCOM_SCM_ARGS(10);
 
-	ret = qcom_scm_call(dev, QCOM_SCM_SVC_HDCP, QCOM_SCM_HDCP_INVOKE, &desc,
-			    &res);
+	ret = qcom_scm_call(dev, &desc, &res);
 	*resp = res.a1;
 
 	return ret;
@@ -536,15 +581,18 @@ int __qcom_scm_hdcp_req(struct device *dev, struct qcom_scm_hdcp_req *req,
 
 int __qcom_scm_qsmmu500_wait_safe_toggle(struct device *dev, bool en)
 {
-	struct qcom_scm_desc desc = {0};
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_SMMU_PROGRAM,
+		.cmd = QCOM_SCM_SMMU_CONFIG_ERRATA1,
+		.owner = ARM_SMCCC_OWNER_SIP,
+	};
 	struct arm_smccc_res res;
 
 	desc.args[0] = QCOM_SCM_SMMU_CONFIG_ERRATA1_CLIENT_ALL;
 	desc.args[1] = en;
 	desc.arginfo = QCOM_SCM_ARGS(2);
 
-	return qcom_scm_call_atomic(dev, QCOM_SCM_SVC_SMMU_PROGRAM,
-				    QCOM_SCM_SMMU_CONFIG_ERRATA1, &desc, &res);
+	return qcom_scm_call_atomic(dev, &desc, &res);
 }
 
 void __qcom_scm_init(void)
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

