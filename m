Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 50FC1EF29F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2019 02:29:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730306AbfKEB1y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Nov 2019 20:27:54 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:37508 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730241AbfKEB1w (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Nov 2019 20:27:52 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 032C360DF8; Tue,  5 Nov 2019 01:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572917271;
        bh=+IcqQwmpF3Oe8rTDpbcr6c8aMG1L6niWEaJoOJhIxjw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=TmllSDeYNZbG1tDvfLSpz64lQA92LeuTblPhK9RTiXi7AcD0j36dIBwY7xSi/Drfm
         pSxnCtW/SCte2m9GXocrVIfN4VnVYup0LnOIHEUFcUMqPgiPh4zOtoFzcpvM0e3ktu
         ajAVnKY4WAkOdeKKVOWHnOAAZT1YnAF8/u+6ceBk=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7845A60D86;
        Tue,  5 Nov 2019 01:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572917268;
        bh=+IcqQwmpF3Oe8rTDpbcr6c8aMG1L6niWEaJoOJhIxjw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=FoMYS1f2aOZs7VNretb5ZiBa+15Y9ic+XSCsmexddTfpni6fA8fdy9HosrZ7p6V2P
         Odo5MJ2i9JypctnTTecHmvJffP1+nOefrwpbBC3CwgJF7ST3te3YKVVpWwSzL/JA85
         y/2P/8IDdBX+HP1eZfGEq/Y+kDrfL/6Yg1/lUM9E=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7845A60D86
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=eberman@codeaurora.org
From:   Elliot Berman <eberman@codeaurora.org>
To:     bjorn.andersson@linaro.org, saiprakash.ranjan@codeaurora.org,
        agross@kernel.org
Cc:     tsoni@codeaurora.org, sidgup@codeaurora.org,
        psodagud@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Elliot Berman <eberman@codeaurora.org>
Subject: [PATCH 02/17] firmware: qcom_scm: Apply consistent naming scheme to command IDs
Date:   Mon,  4 Nov 2019 17:27:21 -0800
Message-Id: <1572917256-24205-3-git-send-email-eberman@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1572917256-24205-1-git-send-email-eberman@codeaurora.org>
References: <1572917256-24205-1-git-send-email-eberman@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Create a consistent naming scheme for command IDs. The scheme is
QCOM_SCM_##svc_##cmd. Remove unused macros QCOM_SCM_FLAG_HLOS,
QCOM_SCM_FLAG_COLDBOOT_MC, QCOM_SCM_FLAG_WARMBOOT_MC,
QCOM_SCM_CMD_CORE_HOTPLUGGED, and QCOM_SCM_BOOT_ADDR_MC.

Signed-off-by: Elliot Berman <eberman@codeaurora.org>
---
 drivers/firmware/qcom_scm-32.c | 28 ++++++++++++++--------------
 drivers/firmware/qcom_scm-64.c | 38 +++++++++++++++++++-------------------
 drivers/firmware/qcom_scm.c    |  8 ++++----
 drivers/firmware/qcom_scm.h    | 41 ++++++++++++++++++-----------------------
 4 files changed, 55 insertions(+), 60 deletions(-)

diff --git a/drivers/firmware/qcom_scm-32.c b/drivers/firmware/qcom_scm-32.c
index d416efc..87b520f 100644
--- a/drivers/firmware/qcom_scm-32.c
+++ b/drivers/firmware/qcom_scm-32.c
@@ -356,7 +356,7 @@ int __qcom_scm_set_cold_boot_addr(void *entry, const cpumask_t *cpus)
 			set_cpu_present(cpu, false);
 	}
 
-	return qcom_scm_call_atomic2(QCOM_SCM_SVC_BOOT, QCOM_SCM_BOOT_ADDR,
+	return qcom_scm_call_atomic2(QCOM_SCM_SVC_BOOT, QCOM_SCM_BOOT_SET_ADDR,
 				    flags, virt_to_phys(entry));
 }
 
@@ -395,7 +395,7 @@ int __qcom_scm_set_warm_boot_addr(struct device *dev, void *entry,
 
 	cmd.addr = cpu_to_le32(virt_to_phys(entry));
 	cmd.flags = cpu_to_le32(flags);
-	ret = qcom_scm_call(dev, QCOM_SCM_SVC_BOOT, QCOM_SCM_BOOT_ADDR,
+	ret = qcom_scm_call(dev, QCOM_SCM_SVC_BOOT, QCOM_SCM_BOOT_SET_ADDR,
 			    &cmd, sizeof(cmd), NULL, 0);
 	if (!ret) {
 		for_each_cpu(cpu, cpus)
@@ -415,7 +415,7 @@ int __qcom_scm_set_warm_boot_addr(struct device *dev, void *entry,
  */
 void __qcom_scm_cpu_power_down(u32 flags)
 {
-	qcom_scm_call_atomic1(QCOM_SCM_SVC_BOOT, QCOM_SCM_CMD_TERMINATE_PC,
+	qcom_scm_call_atomic1(QCOM_SCM_SVC_BOOT, QCOM_SCM_BOOT_TERMINATE_PC,
 			flags & QCOM_SCM_FLUSH_FLAG_MASK);
 }
 
@@ -425,7 +425,7 @@ int __qcom_scm_is_call_available(struct device *dev, u32 svc_id, u32 cmd_id)
 	__le32 svc_cmd = cpu_to_le32((svc_id << 10) | cmd_id);
 	__le32 ret_val = 0;
 
-	ret = qcom_scm_call(dev, QCOM_SCM_SVC_INFO, QCOM_IS_CALL_AVAIL_CMD,
+	ret = qcom_scm_call(dev, QCOM_SCM_SVC_INFO, QCOM_SCM_INFO_IS_CALL_AVAIL,
 			    &svc_cmd, sizeof(svc_cmd), &ret_val,
 			    sizeof(ret_val));
 	if (ret)
@@ -440,7 +440,7 @@ int __qcom_scm_hdcp_req(struct device *dev, struct qcom_scm_hdcp_req *req,
 	if (req_cnt > QCOM_SCM_HDCP_MAX_REQ_CNT)
 		return -ERANGE;
 
-	return qcom_scm_call(dev, QCOM_SCM_SVC_HDCP, QCOM_SCM_CMD_HDCP,
+	return qcom_scm_call(dev, QCOM_SCM_SVC_HDCP, QCOM_SCM_HDCP_INVOKE,
 		req, req_cnt * sizeof(*req), resp, sizeof(*resp));
 }
 
@@ -456,7 +456,7 @@ bool __qcom_scm_pas_supported(struct device *dev, u32 peripheral)
 
 	in = cpu_to_le32(peripheral);
 	ret = qcom_scm_call(dev, QCOM_SCM_SVC_PIL,
-			    QCOM_SCM_PAS_IS_SUPPORTED_CMD,
+			    QCOM_SCM_PIL_PAS_IS_SUPPORTED,
 			    &in, sizeof(in),
 			    &out, sizeof(out));
 
@@ -477,7 +477,7 @@ int __qcom_scm_pas_init_image(struct device *dev, u32 peripheral,
 	request.image_addr = cpu_to_le32(metadata_phys);
 
 	ret = qcom_scm_call(dev, QCOM_SCM_SVC_PIL,
-			    QCOM_SCM_PAS_INIT_IMAGE_CMD,
+			    QCOM_SCM_PIL_PAS_INIT_IMAGE,
 			    &request, sizeof(request),
 			    &scm_ret, sizeof(scm_ret));
 
@@ -500,7 +500,7 @@ int __qcom_scm_pas_mem_setup(struct device *dev, u32 peripheral,
 	request.len = cpu_to_le32(size);
 
 	ret = qcom_scm_call(dev, QCOM_SCM_SVC_PIL,
-			    QCOM_SCM_PAS_MEM_SETUP_CMD,
+			    QCOM_SCM_PIL_PAS_MEM_SETUP,
 			    &request, sizeof(request),
 			    &scm_ret, sizeof(scm_ret));
 
@@ -515,7 +515,7 @@ int __qcom_scm_pas_auth_and_reset(struct device *dev, u32 peripheral)
 
 	in = cpu_to_le32(peripheral);
 	ret = qcom_scm_call(dev, QCOM_SCM_SVC_PIL,
-			    QCOM_SCM_PAS_AUTH_AND_RESET_CMD,
+			    QCOM_SCM_PIL_PAS_AUTH_AND_RESET,
 			    &in, sizeof(in),
 			    &out, sizeof(out));
 
@@ -530,7 +530,7 @@ int __qcom_scm_pas_shutdown(struct device *dev, u32 peripheral)
 
 	in = cpu_to_le32(peripheral);
 	ret = qcom_scm_call(dev, QCOM_SCM_SVC_PIL,
-			    QCOM_SCM_PAS_SHUTDOWN_CMD,
+			    QCOM_SCM_PIL_PAS_SHUTDOWN,
 			    &in, sizeof(in),
 			    &out, sizeof(out));
 
@@ -543,7 +543,7 @@ int __qcom_scm_pas_mss_reset(struct device *dev, bool reset)
 	__le32 in = cpu_to_le32(reset);
 	int ret;
 
-	ret = qcom_scm_call(dev, QCOM_SCM_SVC_PIL, QCOM_SCM_PAS_MSS_RESET,
+	ret = qcom_scm_call(dev, QCOM_SCM_SVC_PIL, QCOM_SCM_PIL_PAS_MSS_RESET,
 			&in, sizeof(in),
 			&out, sizeof(out));
 
@@ -552,8 +552,8 @@ int __qcom_scm_pas_mss_reset(struct device *dev, bool reset)
 
 int __qcom_scm_set_dload_mode(struct device *dev, bool enable)
 {
-	return qcom_scm_call_atomic2(QCOM_SCM_SVC_BOOT, QCOM_SCM_SET_DLOAD_MODE,
-				     enable ? QCOM_SCM_SET_DLOAD_MODE : 0, 0);
+	return qcom_scm_call_atomic2(QCOM_SCM_SVC_BOOT, QCOM_SCM_BOOT_SET_DLOAD_MODE,
+				     enable ? QCOM_SCM_BOOT_SET_DLOAD_MODE : 0, 0);
 }
 
 int __qcom_scm_set_remote_state(struct device *dev, u32 state, u32 id)
@@ -568,7 +568,7 @@ int __qcom_scm_set_remote_state(struct device *dev, u32 state, u32 id)
 	req.state = cpu_to_le32(state);
 	req.id = cpu_to_le32(id);
 
-	ret = qcom_scm_call(dev, QCOM_SCM_SVC_BOOT, QCOM_SCM_SET_REMOTE_STATE,
+	ret = qcom_scm_call(dev, QCOM_SCM_SVC_BOOT, QCOM_SCM_BOOT_SET_REMOTE_STATE,
 			    &req, sizeof(req), &scm_ret, sizeof(scm_ret));
 
 	return ret ? : le32_to_cpu(scm_ret);
diff --git a/drivers/firmware/qcom_scm-64.c b/drivers/firmware/qcom_scm-64.c
index e6721b5..f0b4853 100644
--- a/drivers/firmware/qcom_scm-64.c
+++ b/drivers/firmware/qcom_scm-64.c
@@ -256,7 +256,7 @@ int __qcom_scm_is_call_available(struct device *dev, u32 svc_id, u32 cmd_id)
 	desc.args[0] = SMCCC_FUNCNUM(svc_id, cmd_id) |
 			(ARM_SMCCC_OWNER_SIP << ARM_SMCCC_OWNER_SHIFT);
 
-	ret = qcom_scm_call(dev, QCOM_SCM_SVC_INFO, QCOM_IS_CALL_AVAIL_CMD,
+	ret = qcom_scm_call(dev, QCOM_SCM_SVC_INFO, QCOM_SCM_INFO_IS_CALL_AVAIL,
 			    &desc, &res);
 
 	return ret ? : res.a1;
@@ -284,7 +284,7 @@ int __qcom_scm_hdcp_req(struct device *dev, struct qcom_scm_hdcp_req *req,
 	desc.args[9] = req[4].val;
 	desc.arginfo = QCOM_SCM_ARGS(10);
 
-	ret = qcom_scm_call(dev, QCOM_SCM_SVC_HDCP, QCOM_SCM_CMD_HDCP, &desc,
+	ret = qcom_scm_call(dev, QCOM_SCM_SVC_HDCP, QCOM_SCM_HDCP_INVOKE, &desc,
 			    &res);
 	*resp = res.a1;
 
@@ -295,7 +295,7 @@ void __qcom_scm_init(void)
 {
 	u64 cmd;
 	struct arm_smccc_res res;
-	u32 function = SMCCC_FUNCNUM(QCOM_SCM_SVC_INFO, QCOM_IS_CALL_AVAIL_CMD);
+	u32 function = SMCCC_FUNCNUM(QCOM_SCM_SVC_INFO, QCOM_SCM_INFO_IS_CALL_AVAIL);
 
 	/* First try a SMC64 call */
 	cmd = ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL, ARM_SMCCC_SMC_64,
@@ -320,7 +320,7 @@ bool __qcom_scm_pas_supported(struct device *dev, u32 peripheral)
 	desc.arginfo = QCOM_SCM_ARGS(1);
 
 	ret = qcom_scm_call(dev, QCOM_SCM_SVC_PIL,
-				QCOM_SCM_PAS_IS_SUPPORTED_CMD,
+				QCOM_SCM_PIL_PAS_IS_SUPPORTED,
 				&desc, &res);
 
 	return ret ? false : !!res.a1;
@@ -337,7 +337,7 @@ int __qcom_scm_pas_init_image(struct device *dev, u32 peripheral,
 	desc.args[1] = metadata_phys;
 	desc.arginfo = QCOM_SCM_ARGS(2, QCOM_SCM_VAL, QCOM_SCM_RW);
 
-	ret = qcom_scm_call(dev, QCOM_SCM_SVC_PIL, QCOM_SCM_PAS_INIT_IMAGE_CMD,
+	ret = qcom_scm_call(dev, QCOM_SCM_SVC_PIL, QCOM_SCM_PIL_PAS_INIT_IMAGE,
 				&desc, &res);
 
 	return ret ? : res.a1;
@@ -355,7 +355,7 @@ int __qcom_scm_pas_mem_setup(struct device *dev, u32 peripheral,
 	desc.args[2] = size;
 	desc.arginfo = QCOM_SCM_ARGS(3);
 
-	ret = qcom_scm_call(dev, QCOM_SCM_SVC_PIL, QCOM_SCM_PAS_MEM_SETUP_CMD,
+	ret = qcom_scm_call(dev, QCOM_SCM_SVC_PIL, QCOM_SCM_PIL_PAS_MEM_SETUP,
 				&desc, &res);
 
 	return ret ? : res.a1;
@@ -371,7 +371,7 @@ int __qcom_scm_pas_auth_and_reset(struct device *dev, u32 peripheral)
 	desc.arginfo = QCOM_SCM_ARGS(1);
 
 	ret = qcom_scm_call(dev, QCOM_SCM_SVC_PIL,
-				QCOM_SCM_PAS_AUTH_AND_RESET_CMD,
+				QCOM_SCM_PIL_PAS_AUTH_AND_RESET,
 				&desc, &res);
 
 	return ret ? : res.a1;
@@ -386,7 +386,7 @@ int __qcom_scm_pas_shutdown(struct device *dev, u32 peripheral)
 	desc.args[0] = peripheral;
 	desc.arginfo = QCOM_SCM_ARGS(1);
 
-	ret = qcom_scm_call(dev, QCOM_SCM_SVC_PIL, QCOM_SCM_PAS_SHUTDOWN_CMD,
+	ret = qcom_scm_call(dev, QCOM_SCM_SVC_PIL, QCOM_SCM_PIL_PAS_SHUTDOWN,
 			&desc, &res);
 
 	return ret ? : res.a1;
@@ -402,7 +402,7 @@ int __qcom_scm_pas_mss_reset(struct device *dev, bool reset)
 	desc.args[1] = 0;
 	desc.arginfo = QCOM_SCM_ARGS(2);
 
-	ret = qcom_scm_call(dev, QCOM_SCM_SVC_PIL, QCOM_SCM_PAS_MSS_RESET, &desc,
+	ret = qcom_scm_call(dev, QCOM_SCM_SVC_PIL, QCOM_SCM_PIL_PAS_MSS_RESET, &desc,
 			    &res);
 
 	return ret ? : res.a1;
@@ -418,7 +418,7 @@ int __qcom_scm_set_remote_state(struct device *dev, u32 state, u32 id)
 	desc.args[1] = id;
 	desc.arginfo = QCOM_SCM_ARGS(2);
 
-	ret = qcom_scm_call(dev, QCOM_SCM_SVC_BOOT, QCOM_SCM_SET_REMOTE_STATE,
+	ret = qcom_scm_call(dev, QCOM_SCM_SVC_BOOT, QCOM_SCM_BOOT_SET_REMOTE_STATE,
 			    &desc, &res);
 
 	return ret ? : res.a1;
@@ -445,7 +445,7 @@ int __qcom_scm_assign_mem(struct device *dev, phys_addr_t mem_region,
 				     QCOM_SCM_VAL, QCOM_SCM_VAL);
 
 	ret = qcom_scm_call(dev, QCOM_SCM_SVC_MP,
-			    QCOM_MEM_PROT_ASSIGN_ID,
+			    QCOM_SCM_MP_ASSIGN,
 			    &desc, &res);
 
 	return ret ? : res.a1;
@@ -461,7 +461,7 @@ int __qcom_scm_restore_sec_cfg(struct device *dev, u32 device_id, u32 spare)
 	desc.args[1] = spare;
 	desc.arginfo = QCOM_SCM_ARGS(2);
 
-	ret = qcom_scm_call(dev, QCOM_SCM_SVC_MP, QCOM_SCM_RESTORE_SEC_CFG,
+	ret = qcom_scm_call(dev, QCOM_SCM_SVC_MP, QCOM_SCM_MP_RESTORE_SEC_CFG,
 			    &desc, &res);
 
 	return ret ? : res.a1;
@@ -478,7 +478,7 @@ int __qcom_scm_iommu_secure_ptbl_size(struct device *dev, u32 spare,
 	desc.arginfo = QCOM_SCM_ARGS(1);
 
 	ret = qcom_scm_call(dev, QCOM_SCM_SVC_MP,
-			    QCOM_SCM_IOMMU_SECURE_PTBL_SIZE, &desc, &res);
+			    QCOM_SCM_MP_IOMMU_SECURE_PTBL_SIZE, &desc, &res);
 
 	if (size)
 		*size = res.a1;
@@ -500,7 +500,7 @@ int __qcom_scm_iommu_secure_ptbl_init(struct device *dev, u64 addr, u32 size,
 				     QCOM_SCM_VAL);
 
 	ret = qcom_scm_call(dev, QCOM_SCM_SVC_MP,
-			    QCOM_SCM_IOMMU_SECURE_PTBL_INIT, &desc, &res);
+			    QCOM_SCM_MP_IOMMU_SECURE_PTBL_INIT, &desc, &res);
 
 	/* the pg table has been initialized already, ignore the error */
 	if (ret == -EPERM)
@@ -514,11 +514,11 @@ int __qcom_scm_set_dload_mode(struct device *dev, bool enable)
 	struct qcom_scm_desc desc = {0};
 	struct arm_smccc_res res;
 
-	desc.args[0] = QCOM_SCM_SET_DLOAD_MODE;
-	desc.args[1] = enable ? QCOM_SCM_SET_DLOAD_MODE : 0;
+	desc.args[0] = QCOM_SCM_BOOT_SET_DLOAD_MODE;
+	desc.args[1] = enable ? QCOM_SCM_BOOT_SET_DLOAD_MODE : 0;
 	desc.arginfo = QCOM_SCM_ARGS(2);
 
-	return qcom_scm_call(dev, QCOM_SCM_SVC_BOOT, QCOM_SCM_SET_DLOAD_MODE,
+	return qcom_scm_call(dev, QCOM_SCM_SVC_BOOT, QCOM_SCM_BOOT_SET_DLOAD_MODE,
 			     &desc, &res);
 }
 
@@ -558,10 +558,10 @@ int __qcom_scm_qsmmu500_wait_safe_toggle(struct device *dev, bool en)
 	struct qcom_scm_desc desc = {0};
 	struct arm_smccc_res res;
 
-	desc.args[0] = QCOM_SCM_CONFIG_ERRATA1_CLIENT_ALL;
+	desc.args[0] = QCOM_SCM_SMMU_CONFIG_ERRATA1_CLIENT_ALL;
 	desc.args[1] = en;
 	desc.arginfo = QCOM_SCM_ARGS(2);
 
 	return qcom_scm_call_atomic(dev, QCOM_SCM_SVC_SMMU_PROGRAM,
-				    QCOM_SCM_CONFIG_ERRATA1, &desc, &res);
+				    QCOM_SCM_SMMU_CONFIG_ERRATA1, &desc, &res);
 }
diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
index 40222b1..450d6d6 100644
--- a/drivers/firmware/qcom_scm.c
+++ b/drivers/firmware/qcom_scm.c
@@ -140,7 +140,7 @@ bool qcom_scm_hdcp_available(void)
 		return ret;
 
 	ret = __qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_HDCP,
-						QCOM_SCM_CMD_HDCP);
+						QCOM_SCM_HDCP_INVOKE);
 
 	qcom_scm_clk_disable();
 
@@ -181,7 +181,7 @@ bool qcom_scm_pas_supported(u32 peripheral)
 	int ret;
 
 	ret = __qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_PIL,
-					   QCOM_SCM_PAS_IS_SUPPORTED_CMD);
+					   QCOM_SCM_PIL_PAS_IS_SUPPORTED);
 	if (ret <= 0)
 		return false;
 
@@ -368,12 +368,12 @@ static void qcom_scm_set_download_mode(bool enable)
 
 	avail = __qcom_scm_is_call_available(__scm->dev,
 					     QCOM_SCM_SVC_BOOT,
-					     QCOM_SCM_SET_DLOAD_MODE);
+					     QCOM_SCM_BOOT_SET_DLOAD_MODE);
 	if (avail) {
 		ret = __qcom_scm_set_dload_mode(__scm->dev, enable);
 	} else if (__scm->dload_mode_addr) {
 		ret = __qcom_scm_io_writel(__scm->dev, __scm->dload_mode_addr,
-					   enable ? QCOM_SCM_SET_DLOAD_MODE : 0);
+					   enable ? QCOM_SCM_BOOT_SET_DLOAD_MODE : 0);
 	} else {
 		dev_err(__scm->dev,
 			"No available mechanism for setting download mode\n");
diff --git a/drivers/firmware/qcom_scm.h b/drivers/firmware/qcom_scm.h
index baee744..99e91ba 100644
--- a/drivers/firmware/qcom_scm.h
+++ b/drivers/firmware/qcom_scm.h
@@ -5,23 +5,18 @@
 #define __QCOM_SCM_INT_H
 
 #define QCOM_SCM_SVC_BOOT		0x1
-#define QCOM_SCM_BOOT_ADDR		0x1
-#define QCOM_SCM_SET_DLOAD_MODE		0x10
-#define QCOM_SCM_BOOT_ADDR_MC		0x11
-#define QCOM_SCM_SET_REMOTE_STATE	0xa
+#define QCOM_SCM_BOOT_SET_ADDR		0x1
+#define QCOM_SCM_BOOT_SET_DLOAD_MODE		0x10
+#define QCOM_SCM_BOOT_SET_REMOTE_STATE	0xa
 extern int __qcom_scm_set_remote_state(struct device *dev, u32 state, u32 id);
 extern int __qcom_scm_set_dload_mode(struct device *dev, bool enable);
 
-#define QCOM_SCM_FLAG_HLOS		0x01
-#define QCOM_SCM_FLAG_COLDBOOT_MC	0x02
-#define QCOM_SCM_FLAG_WARMBOOT_MC	0x04
 extern int __qcom_scm_set_warm_boot_addr(struct device *dev, void *entry,
 		const cpumask_t *cpus);
 extern int __qcom_scm_set_cold_boot_addr(void *entry, const cpumask_t *cpus);
 
-#define QCOM_SCM_CMD_TERMINATE_PC	0x2
+#define QCOM_SCM_BOOT_TERMINATE_PC	0x2
 #define QCOM_SCM_FLUSH_FLAG_MASK	0x3
-#define QCOM_SCM_CMD_CORE_HOTPLUGGED	0x10
 extern void __qcom_scm_cpu_power_down(u32 flags);
 
 #define QCOM_SCM_SVC_IO			0x5
@@ -31,24 +26,24 @@ extern int __qcom_scm_io_readl(struct device *dev, phys_addr_t addr, unsigned in
 extern int __qcom_scm_io_writel(struct device *dev, phys_addr_t addr, unsigned int val);
 
 #define QCOM_SCM_SVC_INFO		0x6
-#define QCOM_IS_CALL_AVAIL_CMD		0x1
+#define QCOM_SCM_INFO_IS_CALL_AVAIL	0x1
 extern int __qcom_scm_is_call_available(struct device *dev, u32 svc_id,
 		u32 cmd_id);
 
 #define QCOM_SCM_SVC_HDCP		0x11
-#define QCOM_SCM_CMD_HDCP		0x01
+#define QCOM_SCM_HDCP_INVOKE		0x01
 extern int __qcom_scm_hdcp_req(struct device *dev,
 		struct qcom_scm_hdcp_req *req, u32 req_cnt, u32 *resp);
 
 extern void __qcom_scm_init(void);
 
 #define QCOM_SCM_SVC_PIL		0x2
-#define QCOM_SCM_PAS_INIT_IMAGE_CMD	0x1
-#define QCOM_SCM_PAS_MEM_SETUP_CMD	0x2
-#define QCOM_SCM_PAS_AUTH_AND_RESET_CMD	0x5
-#define QCOM_SCM_PAS_SHUTDOWN_CMD	0x6
-#define QCOM_SCM_PAS_IS_SUPPORTED_CMD	0x7
-#define QCOM_SCM_PAS_MSS_RESET		0xa
+#define QCOM_SCM_PIL_PAS_INIT_IMAGE	0x1
+#define QCOM_SCM_PIL_PAS_MEM_SETUP	0x2
+#define QCOM_SCM_PIL_PAS_AUTH_AND_RESET	0x5
+#define QCOM_SCM_PIL_PAS_SHUTDOWN	0x6
+#define QCOM_SCM_PIL_PAS_IS_SUPPORTED	0x7
+#define QCOM_SCM_PIL_PAS_MSS_RESET		0xa
 extern bool __qcom_scm_pas_supported(struct device *dev, u32 peripheral);
 extern int  __qcom_scm_pas_init_image(struct device *dev, u32 peripheral,
 		dma_addr_t metadata_phys);
@@ -86,21 +81,21 @@ static inline int qcom_scm_remap_error(int err)
 }
 
 #define QCOM_SCM_SVC_MP			0xc
-#define QCOM_SCM_RESTORE_SEC_CFG	2
+#define QCOM_SCM_MP_RESTORE_SEC_CFG	2
 extern int __qcom_scm_restore_sec_cfg(struct device *dev, u32 device_id,
 				      u32 spare);
-#define QCOM_SCM_IOMMU_SECURE_PTBL_SIZE	3
-#define QCOM_SCM_IOMMU_SECURE_PTBL_INIT	4
+#define QCOM_SCM_MP_IOMMU_SECURE_PTBL_SIZE	3
+#define QCOM_SCM_MP_IOMMU_SECURE_PTBL_INIT	4
 #define QCOM_SCM_SVC_SMMU_PROGRAM	0x15
-#define QCOM_SCM_CONFIG_ERRATA1		0x3
-#define QCOM_SCM_CONFIG_ERRATA1_CLIENT_ALL	0x2
+#define QCOM_SCM_SMMU_CONFIG_ERRATA1		0x3
+#define QCOM_SCM_SMMU_CONFIG_ERRATA1_CLIENT_ALL	0x2
 extern int __qcom_scm_iommu_secure_ptbl_size(struct device *dev, u32 spare,
 					     size_t *size);
 extern int __qcom_scm_iommu_secure_ptbl_init(struct device *dev, u64 addr,
 					     u32 size, u32 spare);
 extern int __qcom_scm_qsmmu500_wait_safe_toggle(struct device *dev,
 						bool enable);
-#define QCOM_MEM_PROT_ASSIGN_ID	0x16
+#define QCOM_SCM_MP_ASSIGN	0x16
 extern int  __qcom_scm_assign_mem(struct device *dev,
 				  phys_addr_t mem_region, size_t mem_sz,
 				  phys_addr_t src, size_t src_sz,
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

