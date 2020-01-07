Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 90F67133380
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2020 22:19:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728761AbgAGVEt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jan 2020 16:04:49 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:13912 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729095AbgAGVEt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jan 2020 16:04:49 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1578431089; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=Q9pYTYXJ+ynpWFGfhxCQvH03pftFnUg3jaHziOPFltM=; b=dg6C6CVeFa0e5OgypGPmIG2PLXnjPdQlos5RNXtc8AuFciEo2m+dnjcZSXS8HhvqLYQwZ5eX
 9wdGy46H9TsMQyqDVfgKAb+KcHUYU0X+VuUBZdG1UUjevqSCQuI3mUQklVPaPO7bpmcI3fUa
 YqJvJgH9PweqLE3IvSBb9sotops=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e14f26e.7f5e9864bc70-smtp-out-n01;
 Tue, 07 Jan 2020 21:04:46 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 15D30C447AE; Tue,  7 Jan 2020 21:04:45 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from eberman-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: eberman)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7A1E1C447AA;
        Tue,  7 Jan 2020 21:04:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7A1E1C447AA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=eberman@codeaurora.org
From:   Elliot Berman <eberman@codeaurora.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>, agross@kernel.org,
        swboyd@chromium.org, Stephan Gerhold <stephan@gerhold.net>
Cc:     Elliot Berman <eberman@codeaurora.org>,
        saiprakash.ranjan@codeaurora.org, tsoni@codeaurora.org,
        sidgup@codeaurora.org, psodagud@codeaurora.org,
        Brian Masney <masneyb@onstation.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 07/17] firmware: qcom_scm-64: Move SMC register filling to qcom_scm_call_smccc
Date:   Tue,  7 Jan 2020 13:04:16 -0800
Message-Id: <1578431066-19600-8-git-send-email-eberman@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1578431066-19600-1-git-send-email-eberman@codeaurora.org>
References: <1578431066-19600-1-git-send-email-eberman@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

qcom_scm_call_smccc should be responsible for converting qcom_scm_desc
into arguments for smc call. Consolidate the dispersed logic to convert
qcom_scm_desc into smc arguments inside qcom_scm_call_smccc.

Change-Id: Ieae23c5fc6c77dbd76ef28dc4040b0f64de872c0
Tested-by: Brian Masney <masneyb@onstation.org> # arm32
Tested-by: Stephan Gerhold <stephan@gerhold.net>
Signed-off-by: Elliot Berman <eberman@codeaurora.org>
---
 drivers/firmware/qcom_scm-64.c | 54 ++++++++++++++++++++++++++----------------
 1 file changed, 34 insertions(+), 20 deletions(-)

diff --git a/drivers/firmware/qcom_scm-64.c b/drivers/firmware/qcom_scm-64.c
index e0e6530..3ae171a 100644
--- a/drivers/firmware/qcom_scm-64.c
+++ b/drivers/firmware/qcom_scm-64.c
@@ -62,6 +62,14 @@ struct qcom_scm_res {
 	u64 result[MAX_QCOM_SCM_RETS];
 };
 
+/**
+ * struct arm_smccc_args
+ * @args:	The array of values used in registers in smc instruction
+ */
+struct arm_smccc_args {
+	unsigned long args[8];
+};
+
 static u64 qcom_smccc_convention = -1;
 static DEFINE_MUTEX(qcom_scm_lock);
 
@@ -71,46 +79,42 @@ static DEFINE_MUTEX(qcom_scm_lock);
 #define SCM_SMC_N_REG_ARGS	4
 #define SCM_SMC_FIRST_EXT_IDX	(SCM_SMC_N_REG_ARGS - 1)
 #define SCM_SMC_N_EXT_ARGS	(MAX_QCOM_SCM_ARGS - SCM_SMC_N_REG_ARGS + 1)
+#define SCM_SMC_FIRST_REG_IDX	2
+#define SCM_SMC_LAST_REG_IDX	(SCM_SMC_FIRST_REG_IDX + SCM_SMC_N_REG_ARGS - 1)
 
-static void __scm_smc_do_quirk(const struct qcom_scm_desc *desc,
-			       struct arm_smccc_res *res, u64 x5, u32 type)
+static void __scm_smc_do_quirk(const struct arm_smccc_args *smc,
+			       struct arm_smccc_res *res)
 {
-	u64 cmd;
+	unsigned long a0 = smc->args[0];
 	struct arm_smccc_quirk quirk = { .id = ARM_SMCCC_QUIRK_QCOM_A6 };
 
-	cmd = ARM_SMCCC_CALL_VAL(
-		type,
-		qcom_smccc_convention,
-		desc->owner,
-		SCM_SMC_FNID(desc->svc, desc->cmd));
-
 	quirk.state.a6 = 0;
 
 	do {
-		arm_smccc_smc_quirk(cmd, desc->arginfo, desc->args[0],
-				    desc->args[1], desc->args[2], x5,
-				    quirk.state.a6, 0, res, &quirk);
+		arm_smccc_smc_quirk(a0, smc->args[1], smc->args[2],
+				    smc->args[3], smc->args[4], smc->args[5],
+				    quirk.state.a6, smc->args[7], res, &quirk);
 
 		if (res->a0 == QCOM_SCM_INTERRUPTED)
-			cmd = res->a0;
+			a0 = res->a0;
 
 	} while (res->a0 == QCOM_SCM_INTERRUPTED);
 }
 
-static void __scm_smc_do(const struct qcom_scm_desc *desc,
-			 struct arm_smccc_res *res, u64 x5, bool atomic)
+static void __scm_smc_do(const struct arm_smccc_args *smc,
+			 struct arm_smccc_res *res, bool atomic)
 {
 	int retry_count = 0;
 
 	if (atomic) {
-		__scm_smc_do_quirk(desc, res, x5, ARM_SMCCC_FAST_CALL);
+		__scm_smc_do_quirk(smc, res);
 		return;
 	}
 
 	do {
 		mutex_lock(&qcom_scm_lock);
 
-		__scm_smc_do_quirk(desc, res, x5, ARM_SMCCC_STD_CALL);
+		__scm_smc_do_quirk(smc, res);
 
 		mutex_unlock(&qcom_scm_lock);
 
@@ -127,12 +131,22 @@ static int __scm_smc_call(struct device *dev, const struct qcom_scm_desc *desc,
 {
 	int arglen = desc->arginfo & 0xf;
 	int i;
-	u64 x5 = desc->args[SCM_SMC_FIRST_EXT_IDX];
 	dma_addr_t args_phys = 0;
 	void *args_virt = NULL;
 	size_t alloc_len;
 	gfp_t flag = atomic ? GFP_ATOMIC : GFP_KERNEL;
+	u32 smccc_call_type = atomic ? ARM_SMCCC_FAST_CALL : ARM_SMCCC_STD_CALL;
 	struct arm_smccc_res smc_res;
+	struct arm_smccc_args smc = {0};
+
+	smc.args[0] = ARM_SMCCC_CALL_VAL(
+		smccc_call_type,
+		qcom_smccc_convention,
+		desc->owner,
+		SCM_SMC_FNID(desc->svc, desc->cmd));
+	smc.args[1] = desc->arginfo;
+	for (i = 0; i < SCM_SMC_N_REG_ARGS; i++)
+		smc.args[i + SCM_SMC_FIRST_REG_IDX] = desc->args[i];
 
 	if (unlikely(arglen > SCM_SMC_N_REG_ARGS)) {
 		alloc_len = SCM_SMC_N_EXT_ARGS * sizeof(u64);
@@ -163,10 +177,10 @@ static int __scm_smc_call(struct device *dev, const struct qcom_scm_desc *desc,
 			return -ENOMEM;
 		}
 
-		x5 = args_phys;
+		smc.args[SCM_SMC_LAST_REG_IDX] = args_phys;
 	}
 
-	__scm_smc_do(desc, &smc_res, x5, atomic);
+	__scm_smc_do(&smc, &smc_res, atomic);
 
 	if (args_virt) {
 		dma_unmap_single(dev, args_phys, alloc_len, DMA_TO_DEVICE);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
