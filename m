Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CFB0711D5D9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2019 19:38:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730458AbfLLShF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Dec 2019 13:37:05 -0500
Received: from a27-56.smtp-out.us-west-2.amazonses.com ([54.240.27.56]:58006
        "EHLO a27-56.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730211AbfLLShE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Dec 2019 13:37:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1576175823;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        bh=RsBjYxf6e/v2D1W9VWnbIzneWQAHd8KCVqyRvE/8IT8=;
        b=iu9HOwAZU8JmxCqgpdh3Wca5yeFIOUXHlTPr5Tc04t5Ecbt1QYG5b8qh+k3KYqr0
        0IHL7ANwi2rjCn1DeB/gykNJYiZPzXdsi7uawEuw3HS7ZkbLJ/lWpdBIuSfiERfPWo8
        DB/EwEk/dQ9KWA+gLGT4KwRP5oEAFA1PognHrtyw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1576175823;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:Feedback-ID;
        bh=RsBjYxf6e/v2D1W9VWnbIzneWQAHd8KCVqyRvE/8IT8=;
        b=WO+xJd+rGSCVLIh3aSWE/erGBmnoFfYPxI1h8NiJ3UB67Lsr/Qnt+cAmGoMmOYEK
        PuImOKSzijeGluKSHG3D2/zXijnjjStmzKevEhBioiWag1iTVKOgv0w9YJJMF8qwDvX
        2LrzNl/RCPGDIFZ/Q+1+8H6kSaL7P8lPmbPrhJ3Q=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 45190C4479C
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=eberman@codeaurora.org
From:   Elliot Berman <eberman@codeaurora.org>
To:     bjorn.anderssen@linaro.org, saiprakash.ranjan@codeaurora.org,
        agross@kernel.org, swboyd@chromium.org
Cc:     Elliot Berman <eberman@codeaurora.org>, tsoni@codeaurora.org,
        sidgup@codeaurora.org, psodagud@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 07/17] firmware: qcom_scm-64: Move SMC register filling to qcom_scm_call_smccc
Date:   Thu, 12 Dec 2019 18:37:03 +0000
Message-ID: <0101016efb666846-1e2bda33-a500-42dd-bbed-086672cbcda5-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1576175807-11775-1-git-send-email-eberman@codeaurora.org>
References: <1576175807-11775-1-git-send-email-eberman@codeaurora.org>
X-SES-Outgoing: 2019.12.12-54.240.27.56
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

qcom_scm_call_smccc should be responsible for converting qcom_scm_desc
into arguments for smc call. Consolidate the dispersed logic to convert
qcom_scm_desc into smc arguments inside qcom_scm_call_smccc.

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

