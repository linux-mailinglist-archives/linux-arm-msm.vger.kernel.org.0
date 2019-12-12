Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D119811D662
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2019 19:52:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730629AbfLLSwN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Dec 2019 13:52:13 -0500
Received: from a27-185.smtp-out.us-west-2.amazonses.com ([54.240.27.185]:42822
        "EHLO a27-185.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730541AbfLLSvN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Dec 2019 13:51:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1576176672;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        bh=D3EWoUInC6Ldbtvyvb++Uc5zZ2L6faGZ0pvn0ELdH6M=;
        b=P8BvRnZecrEejcznC8wjsiOdqdmwHDF41wrYCJGop18nhqJDxuLqhpVnEEyPhxjP
        J4BazAOHIk9hSbYF23mBQLNQ1mlEkH4Adh0XBTVSKL5mug2EcSh+vdKBeVghkwNDDK0
        vT5vBiUdNcMVZy2+AbzYiu6lXQPrEX9FvSi8EH9g=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1576176672;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:Feedback-ID;
        bh=D3EWoUInC6Ldbtvyvb++Uc5zZ2L6faGZ0pvn0ELdH6M=;
        b=EP6RA1tlJm3sm/Mkaa6E2MREvKRn/BwiqbMfxS4vH815z5cDIUeIuBviW8ANaweU
        nyFJxl7ysfNFB8Nzn7ZTpGL7x0CAsxWCsXihTX/3jlbpdgeNSxBOSE7v+nUtQpQ0bDt
        MdMOLVWlwReOZW6m0O+eEriCI2bJ1RCGdoN1YsAk=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0669FC447A5
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=eberman@codeaurora.org
From:   Elliot Berman <eberman@codeaurora.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org, swboyd@chromium.org
Cc:     Elliot Berman <eberman@codeaurora.org>,
        saiprakash.ranjan@codeaurora.org, tsoni@codeaurora.org,
        sidgup@codeaurora.org, psodagud@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 05/17] firmware: qcom_scm-64: Move svc/cmd/owner into qcom_scm_desc
Date:   Thu, 12 Dec 2019 18:51:11 +0000
Message-ID: <0101016efb735ca9-2c5838f8-4796-4916-957d-e492bda3441f-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1576176651-17089-1-git-send-email-eberman@codeaurora.org>
References: <1576176651-17089-1-git-send-email-eberman@codeaurora.org>
X-SES-Outgoing: 2019.12.12-54.240.27.185
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Service, command, and owner IDs are all part of qcom_scm_desc struct and
have no special reason to be a function argument (or hard-coded in the
case of owner [1]). Moving them to be part of qcom_scm_desc struct improves
readability.

[1]: Example of SCM function using owner vale other than hard-coded SIP value:
https://source.codeaurora.org/quic/la/kernel/msm-4.9/tree/drivers/soc/qcom/smcinvoke.c?h=kernel.lnx.4.9.r28-rel#n35

Signed-off-by: Elliot Berman <eberman@codeaurora.org>
---
 drivers/firmware/qcom_scm-64.c | 195 +++++++++++++++++++++++++----------------
 1 file changed, 121 insertions(+), 74 deletions(-)

diff --git a/drivers/firmware/qcom_scm-64.c b/drivers/firmware/qcom_scm-64.c
index 3101f36..7b7aa88 100644
--- a/drivers/firmware/qcom_scm-64.c
+++ b/drivers/firmware/qcom_scm-64.c
@@ -48,8 +48,11 @@ enum qcom_scm_arg_types {
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
@@ -63,14 +66,16 @@ static DEFINE_MUTEX(qcom_scm_lock);
 #define SCM_SMC_N_EXT_ARGS	(MAX_QCOM_SCM_ARGS - SCM_SMC_N_REG_ARGS + 1)
 
 static void __scm_smc_do_quirk(const struct qcom_scm_desc *desc,
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
+		SCM_SMC_FNID(desc->svc, desc->cmd));
 
 	quirk.state.a6 = 0;
 
@@ -86,22 +91,19 @@ static void __scm_smc_do_quirk(const struct qcom_scm_desc *desc,
 }
 
 static void __scm_smc_do(const struct qcom_scm_desc *desc,
-			     struct arm_smccc_res *res, u32 fn_id,
-			     u64 x5, bool atomic)
+			 struct arm_smccc_res *res, u64 x5, bool atomic)
 {
 	int retry_count = 0;
 
 	if (atomic) {
-		__scm_smc_do_quirk(desc, res, fn_id, x5,
-					 ARM_SMCCC_FAST_CALL);
+		__scm_smc_do_quirk(desc, res, x5, ARM_SMCCC_FAST_CALL);
 		return;
 	}
 
 	do {
 		mutex_lock(&qcom_scm_lock);
 
-		__scm_smc_do_quirk(desc, res, fn_id, x5,
-					 ARM_SMCCC_STD_CALL);
+		__scm_smc_do_quirk(desc, res, x5, ARM_SMCCC_STD_CALL);
 
 		mutex_unlock(&qcom_scm_lock);
 
@@ -113,13 +115,11 @@ static void __scm_smc_do(const struct qcom_scm_desc *desc,
 	}  while (res->a0 == QCOM_SCM_V2_EBUSY);
 }
 
-static int __scm_smc_call(struct device *dev, u32 svc_id, u32 cmd_id,
-				  const struct qcom_scm_desc *desc,
-				  struct arm_smccc_res *res, bool atomic)
+static int __scm_smc_call(struct device *dev, const struct qcom_scm_desc *desc,
+			  struct arm_smccc_res *res, bool atomic)
 {
 	int arglen = desc->arginfo & 0xf;
 	int i;
-	u32 fn_id = SCM_SMC_FNID(svc_id, cmd_id);
 	u64 x5 = desc->args[SCM_SMC_FIRST_EXT_IDX];
 	dma_addr_t args_phys = 0;
 	void *args_virt = NULL;
@@ -158,7 +158,7 @@ static int __scm_smc_call(struct device *dev, u32 svc_id, u32 cmd_id,
 		x5 = args_phys;
 	}
 
-	__scm_smc_do(desc, res, fn_id, x5, atomic);
+	__scm_smc_do(desc, res, x5, atomic);
 
 	if (args_virt) {
 		dma_unmap_single(dev, args_phys, alloc_len, DMA_TO_DEVICE);
@@ -181,12 +181,11 @@ static int __scm_smc_call(struct device *dev, u32 svc_id, u32 cmd_id,
  * Sends a command to the SCM and waits for the command to finish processing.
  * This should *only* be called in pre-emptible context.
  */
-static int qcom_scm_call(struct device *dev, u32 svc_id, u32 cmd_id,
-			 const struct qcom_scm_desc *desc,
+static int qcom_scm_call(struct device *dev, const struct qcom_scm_desc *desc,
 			 struct arm_smccc_res *res)
 {
 	might_sleep();
-	return __scm_smc_call(dev, svc_id, cmd_id, desc, res, false);
+	return __scm_smc_call(dev, desc, res, false);
 }
 
 /**
@@ -200,11 +199,11 @@ static int qcom_scm_call(struct device *dev, u32 svc_id, u32 cmd_id,
  * Sends a command to the SCM and waits for the command to finish processing.
  * This can be called in atomic context.
  */
-static int qcom_scm_call_atomic(struct device *dev, u32 svc_id, u32 cmd_id,
+static int qcom_scm_call_atomic(struct device *dev,
 				const struct qcom_scm_desc *desc,
 				struct arm_smccc_res *res)
 {
-	return __scm_smc_call(dev, svc_id, cmd_id, desc, res, true);
+	return __scm_smc_call(dev, desc, res, true);
 }
 
 /**
@@ -250,15 +249,18 @@ void __qcom_scm_cpu_power_down(u32 flags)
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
 	desc.args[0] = SCM_SMC_FNID(svc_id, cmd_id) |
 			(ARM_SMCCC_OWNER_SIP << ARM_SMCCC_OWNER_SHIFT);
 
-	ret = qcom_scm_call(dev, QCOM_SCM_SVC_INFO, QCOM_SCM_INFO_IS_CALL_AVAIL,
-			    &desc, &res);
+	ret = qcom_scm_call(dev, &desc, &res);
 
 	return ret ? : res.a1;
 }
@@ -267,7 +269,11 @@ int __qcom_scm_hdcp_req(struct device *dev, struct qcom_scm_hdcp_req *req,
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
@@ -285,8 +291,7 @@ int __qcom_scm_hdcp_req(struct device *dev, struct qcom_scm_hdcp_req *req,
 	desc.args[9] = req[4].val;
 	desc.arginfo = QCOM_SCM_ARGS(10);
 
-	ret = qcom_scm_call(dev, QCOM_SCM_SVC_HDCP, QCOM_SCM_HDCP_INVOKE, &desc,
-			    &res);
+	ret = qcom_scm_call(dev, &desc, &res);
 	*resp = res.a1;
 
 	return ret;
@@ -326,15 +331,17 @@ void __qcom_scm_init(void)
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
@@ -343,15 +350,18 @@ int __qcom_scm_pas_init_image(struct device *dev, u32 peripheral,
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
@@ -360,7 +370,11 @@ int __qcom_scm_pas_mem_setup(struct device *dev, u32 peripheral,
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
@@ -368,8 +382,7 @@ int __qcom_scm_pas_mem_setup(struct device *dev, u32 peripheral,
 	desc.args[2] = size;
 	desc.arginfo = QCOM_SCM_ARGS(3);
 
-	ret = qcom_scm_call(dev, QCOM_SCM_SVC_PIL, QCOM_SCM_PIL_PAS_MEM_SETUP,
-				&desc, &res);
+	ret = qcom_scm_call(dev, &desc, &res);
 
 	return ret ? : res.a1;
 }
@@ -377,15 +390,17 @@ int __qcom_scm_pas_mem_setup(struct device *dev, u32 peripheral,
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
@@ -393,21 +408,28 @@ int __qcom_scm_pas_auth_and_reset(struct device *dev, u32 peripheral)
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
 
@@ -415,15 +437,18 @@ int __qcom_scm_pas_mss_reset(struct device *dev, bool reset)
 	desc.args[1] = 0;
 	desc.arginfo = QCOM_SCM_ARGS(2);
 
-	ret = qcom_scm_call(dev, QCOM_SCM_SVC_PIL, QCOM_SCM_PIL_PAS_MSS_RESET, &desc,
-			    &res);
+	ret = qcom_scm_call(dev, &desc, &res);
 
 	return ret ? : res.a1;
 }
 
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
 
@@ -431,8 +456,7 @@ int __qcom_scm_set_remote_state(struct device *dev, u32 state, u32 id)
 	desc.args[1] = id;
 	desc.arginfo = QCOM_SCM_ARGS(2);
 
-	ret = qcom_scm_call(dev, QCOM_SCM_SVC_BOOT, QCOM_SCM_BOOT_SET_REMOTE_STATE,
-			    &desc, &res);
+	ret = qcom_scm_call(dev, &desc, &res);
 
 	return ret ? : res.a1;
 }
@@ -442,7 +466,11 @@ int __qcom_scm_assign_mem(struct device *dev, phys_addr_t mem_region,
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
@@ -457,16 +485,18 @@ int __qcom_scm_assign_mem(struct device *dev, phys_addr_t mem_region,
 				     QCOM_SCM_RO, QCOM_SCM_VAL, QCOM_SCM_RO,
 				     QCOM_SCM_VAL, QCOM_SCM_VAL);
 
-	ret = qcom_scm_call(dev, QCOM_SCM_SVC_MP,
-			    QCOM_SCM_MP_ASSIGN,
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
 
@@ -474,8 +504,7 @@ int __qcom_scm_restore_sec_cfg(struct device *dev, u32 device_id, u32 spare)
 	desc.args[1] = spare;
 	desc.arginfo = QCOM_SCM_ARGS(2);
 
-	ret = qcom_scm_call(dev, QCOM_SCM_SVC_MP, QCOM_SCM_MP_RESTORE_SEC_CFG,
-			    &desc, &res);
+	ret = qcom_scm_call(dev, &desc, &res);
 
 	return ret ? : res.a1;
 }
@@ -483,15 +512,18 @@ int __qcom_scm_restore_sec_cfg(struct device *dev, u32 device_id, u32 spare)
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
@@ -502,7 +534,11 @@ int __qcom_scm_iommu_secure_ptbl_size(struct device *dev, u32 spare,
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
 
@@ -512,8 +548,7 @@ int __qcom_scm_iommu_secure_ptbl_init(struct device *dev, u64 addr, u32 size,
 	desc.arginfo = QCOM_SCM_ARGS(3, QCOM_SCM_RW, QCOM_SCM_VAL,
 				     QCOM_SCM_VAL);
 
-	ret = qcom_scm_call(dev, QCOM_SCM_SVC_MP,
-			    QCOM_SCM_MP_IOMMU_SECURE_PTBL_INIT, &desc, &res);
+	ret = qcom_scm_call(dev, &desc, &res);
 
 	/* the pg table has been initialized already, ignore the error */
 	if (ret == -EPERM)
@@ -524,29 +559,35 @@ int __qcom_scm_iommu_secure_ptbl_init(struct device *dev, u64 addr, u32 size,
 
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
 
@@ -555,26 +596,32 @@ int __qcom_scm_io_readl(struct device *dev, phys_addr_t addr,
 
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
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

