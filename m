Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D2BB9E903D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2019 20:42:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732659AbfJ2TlR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Oct 2019 15:41:17 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:58774 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732585AbfJ2TlR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Oct 2019 15:41:17 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 4F6C860FFC; Tue, 29 Oct 2019 19:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572378075;
        bh=zWihqYztVsqgFVR7ZPnz4KrGiPGHYbaWgOmI99WzC7g=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=nnqQAgiXD9GAXLTF/4XKaLC/oGXI4mpT27Z+y8baJvYFd/Uppf2mgmOAevjmzZ1CQ
         JQ2dttuGt+NHhpgzveF61BgvTPIgkNMiSj/bHjU1I17Q9fAMODAMffZqEzEjGsc5vn
         Am3KaO0NEx0ZNAQn/RdDzNDxqyIH+cjXLPA6EB2M=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A2FD860F8D;
        Tue, 29 Oct 2019 19:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572378074;
        bh=zWihqYztVsqgFVR7ZPnz4KrGiPGHYbaWgOmI99WzC7g=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=nuLGT1TWMPcivfVvv1qOe66NtvlyCyNWRybIzdFWq9iamFz3y+Fhz8sdilg2yi2qc
         fVqw2O2+aaiojb6ita/4f54UDigBxuK9uQ2N+Sy70DR8WUtrEOOIt98Q2g2c8M0eJq
         UeS234YT1DL1Q9ji+4T/vnbI+tduetBePRxsG4gQ=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A2FD860F8D
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=eberman@codeaurora.org
From:   Elliot Berman <eberman@codeaurora.org>
To:     bjorn.andersson@linaro.org, saipraka@codeaurora.org,
        agross@kernel.org
Cc:     tsoni@codeaurora.org, sidgup@codeaurora.org,
        psodagud@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Elliot Berman <eberman@codeaurora.org>
Subject: [RFC 05/17] firmware: qcom_scm-64: Move svc/cmd/owner into qcom_scm_desc
Date:   Tue, 29 Oct 2019 12:40:53 -0700
Message-Id: <1572378065-4490-6-git-send-email-eberman@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1572378065-4490-1-git-send-email-eberman@codeaurora.org>
References: <1572378065-4490-1-git-send-email-eberman@codeaurora.org>
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
 drivers/firmware/qcom_scm-64.c | 191 ++++++++++++++++++++++++++---------------
 1 file changed, 120 insertions(+), 71 deletions(-)

diff --git a/drivers/firmware/qcom_scm-64.c b/drivers/firmware/qcom_scm-64.c
index ee0c950..2fcbfac 100644
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
 
@@ -112,7 +114,7 @@ static void qcom_scm_call_do_smccc(const struct qcom_scm_desc *desc,
 	}  while (res->a0 == QCOM_SCM_V2_EBUSY);
 }
 
-static int ___qcom_scm_call_smccc(struct device *dev, u32 svc_id, u32 cmd_id,
+static int ___qcom_scm_call_smccc(struct device *dev,
 				  const struct qcom_scm_desc *desc,
 				  struct arm_smccc_res *res, bool atomic)
 {
@@ -157,7 +159,7 @@ static int ___qcom_scm_call_smccc(struct device *dev, u32 svc_id, u32 cmd_id,
 		x5 = args_phys;
 	}
 
-	qcom_scm_call_do_smccc(desc, res, fn_id, x5, atomic);
+	qcom_scm_call_do_smccc(desc, res, x5, atomic);
 
 	if (args_virt) {
 		dma_unmap_single(dev, args_phys, alloc_len, DMA_TO_DEVICE);
@@ -180,12 +182,11 @@ static int ___qcom_scm_call_smccc(struct device *dev, u32 svc_id, u32 cmd_id,
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
@@ -199,11 +200,11 @@ static int qcom_scm_call(struct device *dev, u32 svc_id, u32 cmd_id,
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
@@ -248,7 +249,11 @@ void __qcom_scm_cpu_power_down(u32 flags)
 
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
 
@@ -256,37 +261,41 @@ int __qcom_scm_set_remote_state(struct device *dev, u32 state, u32 id)
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
@@ -295,15 +304,18 @@ int __qcom_scm_pas_init_image(struct device *dev, u32 peripheral,
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
@@ -312,7 +324,11 @@ int __qcom_scm_pas_mem_setup(struct device *dev, u32 peripheral,
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
@@ -320,8 +336,7 @@ int __qcom_scm_pas_mem_setup(struct device *dev, u32 peripheral,
 	desc.args[2] = size;
 	desc.arginfo = QCOM_SCM_ARGS(3);
 
-	ret = qcom_scm_call(dev, QCOM_SCM_SVC_PIL, QCOM_SCM_PIL_PAS_MEM_SETUP,
-				&desc, &res);
+	ret = qcom_scm_call(dev, &desc, &res);
 
 	return ret ? : res.a1;
 }
@@ -329,15 +344,17 @@ int __qcom_scm_pas_mem_setup(struct device *dev, u32 peripheral,
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
@@ -345,21 +362,28 @@ int __qcom_scm_pas_auth_and_reset(struct device *dev, u32 peripheral)
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
 
@@ -367,8 +391,7 @@ int __qcom_scm_pas_mss_reset(struct device *dev, bool reset)
 	desc.args[1] = 0;
 	desc.arginfo = QCOM_SCM_ARGS(2);
 
-	ret = qcom_scm_call(dev, QCOM_SCM_SVC_PIL, QCOM_SCM_PIL_PAS_MSS_RESET, &desc,
-			    &res);
+	ret = qcom_scm_call(dev, &desc, &res);
 
 	return ret ? : res.a1;
 }
@@ -376,15 +399,18 @@ int __qcom_scm_pas_mss_reset(struct device *dev, bool reset)
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
 
@@ -393,36 +419,46 @@ int __qcom_scm_io_readl(struct device *dev, phys_addr_t addr,
 
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
+		.cmd = QCOM_INFO_IS_CALL_AVAIL,
+		.owner = ARM_SMCCC_OWNER_SIP,
+	};
 	struct arm_smccc_res res;
 
 	desc.arginfo = QCOM_SCM_ARGS(1);
 	desc.args[0] = SMCCC_FUNCNUM(svc_id, cmd_id) |
 			(ARM_SMCCC_OWNER_SIP << ARM_SMCCC_OWNER_SHIFT);
 
-	ret = qcom_scm_call(dev, QCOM_SCM_SVC_INFO, QCOM_INFO_IS_CALL_AVAIL,
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
 
@@ -430,8 +466,7 @@ int __qcom_scm_restore_sec_cfg(struct device *dev, u32 device_id, u32 spare)
 	desc.args[1] = spare;
 	desc.arginfo = QCOM_SCM_ARGS(2);
 
-	ret = qcom_scm_call(dev, QCOM_SCM_SVC_MP, QCOM_SCM_MP_RESTORE_SEC_CFG,
-			    &desc, &res);
+	ret = qcom_scm_call(dev, &desc, &res);
 
 	return ret ? : res.a1;
 }
@@ -439,15 +474,18 @@ int __qcom_scm_restore_sec_cfg(struct device *dev, u32 device_id, u32 spare)
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
@@ -458,7 +496,11 @@ int __qcom_scm_iommu_secure_ptbl_size(struct device *dev, u32 spare,
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
 
@@ -468,8 +510,7 @@ int __qcom_scm_iommu_secure_ptbl_init(struct device *dev, u64 addr, u32 size,
 	desc.arginfo = QCOM_SCM_ARGS(3, QCOM_SCM_RW, QCOM_SCM_VAL,
 				     QCOM_SCM_VAL);
 
-	ret = qcom_scm_call(dev, QCOM_SCM_SVC_MP,
-			    QCOM_SCM_MP_IOMMU_SECURE_PTBL_INIT, &desc, &res);
+	ret = qcom_scm_call(dev, &desc, &res);
 
 	/* the pg table has been initialized already, ignore the error */
 	if (ret == -EPERM)
@@ -483,7 +524,11 @@ int __qcom_scm_assign_mem(struct device *dev, phys_addr_t mem_region,
 			  phys_addr_t dest, size_t dest_sz)
 {
 	int ret;
-	struct qcom_scm_desc desc = {0};
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_MP,
+		.cmd = QCOM_MP_ASSIGN,
+		.owner = ARM_SMCCC_OWNER_SIP,
+	};
 	struct arm_smccc_res res;
 
 	desc.args[0] = mem_region;
@@ -498,9 +543,7 @@ int __qcom_scm_assign_mem(struct device *dev, phys_addr_t mem_region,
 				     QCOM_SCM_RO, QCOM_SCM_VAL, QCOM_SCM_RO,
 				     QCOM_SCM_VAL, QCOM_SCM_VAL);
 
-	ret = qcom_scm_call(dev, QCOM_SCM_SVC_MP,
-			    QCOM_MP_ASSIGN,
-			    &desc, &res);
+	ret = qcom_scm_call(dev, &desc, &res);
 
 	return ret ? : res.a1;
 }
@@ -509,7 +552,11 @@ int __qcom_scm_hdcp_req(struct device *dev, struct qcom_scm_hdcp_req *req,
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
@@ -527,8 +574,7 @@ int __qcom_scm_hdcp_req(struct device *dev, struct qcom_scm_hdcp_req *req,
 	desc.args[9] = req[4].val;
 	desc.arginfo = QCOM_SCM_ARGS(10);
 
-	ret = qcom_scm_call(dev, QCOM_SCM_SVC_HDCP, QCOM_SCM_HDCP_INVOKE, &desc,
-			    &res);
+	ret = qcom_scm_call(dev, &desc, &res);
 	*resp = res.a1;
 
 	return ret;
@@ -536,15 +582,18 @@ int __qcom_scm_hdcp_req(struct device *dev, struct qcom_scm_hdcp_req *req,
 
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

