Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D092DB4B30
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2019 11:46:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728290AbfIQJp0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Sep 2019 05:45:26 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:60444 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726213AbfIQJp0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Sep 2019 05:45:26 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id F2CBC6155E; Tue, 17 Sep 2019 09:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1568713525;
        bh=vNp/7R3PFZVXHQC0CgbfJRGx7wbmIBhHQwnPqFdcMpE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=FsFDGddTIPAVULf594CrBCoRHU7ba6D+Iye9/KJwScKEpKQQl6s/AEWYhGZRGGLs/
         V5snk/rRb1E+5faNjAD8xyCNge2WLZSzefjbO6EZcrftGN/6ztJzeUa+MhBzRwfBfE
         On2/xqeOXzuCs5mMChYzmmnNQT5Gyo9n5gN4tubo=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from blr-ubuntu-311.qualcomm.com (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan@codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C3438606E1;
        Tue, 17 Sep 2019 09:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1568713521;
        bh=vNp/7R3PFZVXHQC0CgbfJRGx7wbmIBhHQwnPqFdcMpE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=UhP0hoam8hESTHybCoDg2TsRf4+OxSq4reYQhuDedCaxdyh7BkpdZkoex1jTQa6BV
         Z7y8/yWHwzWgvx0VaCfk9jMJfsObv/sV+g9CvSRvzkntcc1tv57gtlW2ZWxN8sZATP
         jGINRdvfnPN8fv0MZwCEDbQjofY0QGaRsE9BZJC8=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C3438606E1
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>,
        Joerg Roedel <joro@8bytes.org>,
        iommu@lists.linux-foundation.org,
        Stephen Boyd <swboyd@chromium.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        bjorn.andersson@linaro.org, Andy Gross <agross@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: [PATCHv6 1/3] firmware: qcom_scm-64: Add atomic version of qcom_scm_call
Date:   Tue, 17 Sep 2019 15:15:02 +0530
Message-Id: <f30070e7acdd463dec0e1305b47cdd8f1cc7c11c.1568712606.git.saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <cover.1568712606.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1568712606.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Vivek Gautam <vivek.gautam@codeaurora.org>

There are scnenarios where drivers are required to make a
scm call in atomic context, such as in one of the qcom's
arm-smmu-500 errata [1].

[1] ("https://source.codeaurora.org/quic/la/kernel/msm-4.9/
      tree/drivers/iommu/arm-smmu.c?h=msm-4.9#n4842")

Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
---
 drivers/firmware/qcom_scm-64.c | 139 ++++++++++++++++++++++-----------
 1 file changed, 95 insertions(+), 44 deletions(-)

diff --git a/drivers/firmware/qcom_scm-64.c b/drivers/firmware/qcom_scm-64.c
index 91d5ad7cf58b..6697bb741b83 100644
--- a/drivers/firmware/qcom_scm-64.c
+++ b/drivers/firmware/qcom_scm-64.c
@@ -62,32 +62,72 @@ static DEFINE_MUTEX(qcom_scm_lock);
 #define FIRST_EXT_ARG_IDX 3
 #define N_REGISTER_ARGS (MAX_QCOM_SCM_ARGS - N_EXT_QCOM_SCM_ARGS + 1)
 
-/**
- * qcom_scm_call() - Invoke a syscall in the secure world
- * @dev:	device
- * @svc_id:	service identifier
- * @cmd_id:	command identifier
- * @desc:	Descriptor structure containing arguments and return values
- *
- * Sends a command to the SCM and waits for the command to finish processing.
- * This should *only* be called in pre-emptible context.
-*/
-static int qcom_scm_call(struct device *dev, u32 svc_id, u32 cmd_id,
-			 const struct qcom_scm_desc *desc,
-			 struct arm_smccc_res *res)
+static void __qcom_scm_call_do(const struct qcom_scm_desc *desc,
+			       struct arm_smccc_res *res, u32 fn_id,
+			       u64 x5, u32 type)
+{
+	u64 cmd;
+	struct arm_smccc_quirk quirk = { .id = ARM_SMCCC_QUIRK_QCOM_A6 };
+
+	cmd = ARM_SMCCC_CALL_VAL(type, qcom_smccc_convention,
+				 ARM_SMCCC_OWNER_SIP, fn_id);
+
+	quirk.state.a6 = 0;
+
+	do {
+		arm_smccc_smc_quirk(cmd, desc->arginfo, desc->args[0],
+				    desc->args[1], desc->args[2], x5,
+				    quirk.state.a6, 0, res, &quirk);
+
+		if (res->a0 == QCOM_SCM_INTERRUPTED)
+			cmd = res->a0;
+
+	} while (res->a0 == QCOM_SCM_INTERRUPTED);
+}
+
+static void qcom_scm_call_do(const struct qcom_scm_desc *desc,
+			     struct arm_smccc_res *res, u32 fn_id,
+			     u64 x5, bool atomic)
+{
+	int retry_count = 0;
+
+	if (atomic) {
+		__qcom_scm_call_do(desc, res, fn_id, x5, ARM_SMCCC_FAST_CALL);
+		return;
+	}
+
+	do {
+		mutex_lock(&qcom_scm_lock);
+
+		__qcom_scm_call_do(desc, res, fn_id, x5,
+				   ARM_SMCCC_STD_CALL);
+
+		mutex_unlock(&qcom_scm_lock);
+
+		if (res->a0 == QCOM_SCM_V2_EBUSY) {
+			if (retry_count++ > QCOM_SCM_EBUSY_MAX_RETRY)
+				break;
+			msleep(QCOM_SCM_EBUSY_WAIT_MS);
+		}
+	}  while (res->a0 == QCOM_SCM_V2_EBUSY);
+}
+
+static int ___qcom_scm_call(struct device *dev, u32 svc_id, u32 cmd_id,
+			    const struct qcom_scm_desc *desc,
+			    struct arm_smccc_res *res, bool atomic)
 {
 	int arglen = desc->arginfo & 0xf;
-	int retry_count = 0, i;
+	int i;
 	u32 fn_id = QCOM_SCM_FNID(svc_id, cmd_id);
-	u64 cmd, x5 = desc->args[FIRST_EXT_ARG_IDX];
+	u64 x5 = desc->args[FIRST_EXT_ARG_IDX];
 	dma_addr_t args_phys = 0;
 	void *args_virt = NULL;
 	size_t alloc_len;
-	struct arm_smccc_quirk quirk = {.id = ARM_SMCCC_QUIRK_QCOM_A6};
+	gfp_t flag = atomic ? GFP_ATOMIC : GFP_KERNEL;
 
 	if (unlikely(arglen > N_REGISTER_ARGS)) {
 		alloc_len = N_EXT_QCOM_SCM_ARGS * sizeof(u64);
-		args_virt = kzalloc(PAGE_ALIGN(alloc_len), GFP_KERNEL);
+		args_virt = kzalloc(PAGE_ALIGN(alloc_len), flag);
 
 		if (!args_virt)
 			return -ENOMEM;
@@ -117,33 +157,7 @@ static int qcom_scm_call(struct device *dev, u32 svc_id, u32 cmd_id,
 		x5 = args_phys;
 	}
 
-	do {
-		mutex_lock(&qcom_scm_lock);
-
-		cmd = ARM_SMCCC_CALL_VAL(ARM_SMCCC_STD_CALL,
-					 qcom_smccc_convention,
-					 ARM_SMCCC_OWNER_SIP, fn_id);
-
-		quirk.state.a6 = 0;
-
-		do {
-			arm_smccc_smc_quirk(cmd, desc->arginfo, desc->args[0],
-				      desc->args[1], desc->args[2], x5,
-				      quirk.state.a6, 0, res, &quirk);
-
-			if (res->a0 == QCOM_SCM_INTERRUPTED)
-				cmd = res->a0;
-
-		} while (res->a0 == QCOM_SCM_INTERRUPTED);
-
-		mutex_unlock(&qcom_scm_lock);
-
-		if (res->a0 == QCOM_SCM_V2_EBUSY) {
-			if (retry_count++ > QCOM_SCM_EBUSY_MAX_RETRY)
-				break;
-			msleep(QCOM_SCM_EBUSY_WAIT_MS);
-		}
-	}  while (res->a0 == QCOM_SCM_V2_EBUSY);
+	qcom_scm_call_do(desc, res, fn_id, x5, atomic);
 
 	if (args_virt) {
 		dma_unmap_single(dev, args_phys, alloc_len, DMA_TO_DEVICE);
@@ -156,6 +170,43 @@ static int qcom_scm_call(struct device *dev, u32 svc_id, u32 cmd_id,
 	return 0;
 }
 
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
+static int qcom_scm_call(struct device *dev, u32 svc_id, u32 cmd_id,
+			 const struct qcom_scm_desc *desc,
+			 struct arm_smccc_res *res)
+{
+	might_sleep();
+	return ___qcom_scm_call(dev, svc_id, cmd_id, desc, res, false);
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
+ * This should be called in atomic context only.
+ */
+static int qcom_scm_call_atomic(struct device *dev, u32 svc_id, u32 cmd_id,
+				const struct qcom_scm_desc *desc,
+				struct arm_smccc_res *res)
+{
+	cant_sleep();
+	return ___qcom_scm_call(dev, svc_id, cmd_id, desc, res, true);
+}
+
 /**
  * qcom_scm_set_cold_boot_addr() - Set the cold boot address for cpus
  * @entry: Entry point function for the cpus
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

