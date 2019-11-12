Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6EA3F9C23
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2019 22:24:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727394AbfKLVXX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Nov 2019 16:23:23 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:39202 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727058AbfKLVXX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Nov 2019 16:23:23 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 3DD8D60D5C; Tue, 12 Nov 2019 21:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573593801;
        bh=RoWdtUksac51yEtoGwSsCUL+8+6tY/608wIbfaGEwNw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=euY9uqr52kIkx4V6WNawum3gRVQY2Ob0F30Oa6ri0qQPVqIlcc82gmipkjBvY/qy3
         Y9G7y74mFvMR4sD0x+cFCBpjALsK9NZhoO3peyqgoIGLNcNJPx9qjK3lUJaq7JtU6k
         NmDNY23ifd5k3O+KY9/n/9ryirbYPN06lnZffM3U=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A832A60BE6;
        Tue, 12 Nov 2019 21:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573593792;
        bh=RoWdtUksac51yEtoGwSsCUL+8+6tY/608wIbfaGEwNw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=CNtXo/lCZkD+x/FEKPvJF7lKaSFAEW/yedbwzsbbPOIw5d3JfwITUQnHxakx6hspU
         UmZTdm18i4+ju0hogIREu7RBHhOniDAPoLNakBI4FgYb7bNG3aOiP6NLcV2wAmllmk
         D6yBhhCljdT6vQcfMTxwaMap0gWlvytYRmMCQ9UM=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A832A60BE6
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=eberman@codeaurora.org
From:   Elliot Berman <eberman@codeaurora.org>
To:     bjorn.andersson@linaro.org, saiprakash.ranjan@codeaurora.org,
        agross@kernel.org, swboyd@chromium.org
Cc:     Elliot Berman <eberman@codeaurora.org>, tsoni@codeaurora.org,
        sidgup@codeaurora.org, psodagud@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 09/18] firmware: qcom_scm-64: Move SMC register filling to qcom_scm_call_smccc
Date:   Tue, 12 Nov 2019 13:22:45 -0800
Message-Id: <1573593774-12539-10-git-send-email-eberman@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573593774-12539-1-git-send-email-eberman@codeaurora.org>
References: <1573593774-12539-1-git-send-email-eberman@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

qcom_scm_call_smccc should be responsible for converting qcom_scm_desc
into arguments for smc call. Consolidate the dispersed logic to convert
qcom_scm_desc into smc arguments inside qcom_scm_call_smccc.

Signed-off-by: Elliot Berman <eberman@codeaurora.org>
---
 drivers/firmware/qcom_scm-64.c | 45 +++++++++++++++++++++++++-----------------
 1 file changed, 27 insertions(+), 18 deletions(-)

diff --git a/drivers/firmware/qcom_scm-64.c b/drivers/firmware/qcom_scm-64.c
index 4131093..977654bb 100644
--- a/drivers/firmware/qcom_scm-64.c
+++ b/drivers/firmware/qcom_scm-64.c
@@ -54,6 +54,10 @@ struct qcom_scm_desc {
 	u32 owner;
 };
 
+struct arm_smccc_args {
+	unsigned long a[8];
+};
+
 static u64 qcom_smccc_convention = -1;
 static DEFINE_MUTEX(qcom_scm_lock);
 
@@ -64,28 +68,24 @@ static DEFINE_MUTEX(qcom_scm_lock);
 #define SMCCC_N_REG_ARGS	4
 #define SMCCC_FIRST_EXT_IDX	(SMCCC_N_REG_ARGS - 1)
 #define SMCCC_N_EXT_ARGS	(MAX_QCOM_SCM_ARGS - SMCCC_N_REG_ARGS + 1)
+#define SMCCC_FIRST_REG_IDX	2
+#define SMCCC_LAST_REG_IDX	(SMCCC_FIRST_REG_IDX + SMCCC_N_REG_ARGS - 1)
 
-static void __qcom_scm_call_do_quirk(const struct qcom_scm_desc *desc,
-			       struct arm_smccc_res *res, u64 x5, u32 type)
+static void __qcom_scm_call_do_quirk(const struct arm_smccc_args *smc,
+				     struct arm_smccc_res *res)
 {
-	u64 cmd;
+	unsigned long a0 = smc->a[0];
 	struct arm_smccc_quirk quirk = { .id = ARM_SMCCC_QUIRK_QCOM_A6 };
 
-	cmd = ARM_SMCCC_CALL_VAL(
-		type,
-		qcom_smccc_convention,
-		desc->owner,
-		SMCCC_FUNCNUM(desc->svc, desc->cmd));
-
 	quirk.state.a6 = 0;
 
 	do {
-		arm_smccc_smc_quirk(cmd, desc->arginfo, desc->args[0],
-				    desc->args[1], desc->args[2], x5,
-				    quirk.state.a6, 0, res, &quirk);
+		arm_smccc_smc_quirk(a0, smc->a[1], smc->a[2], smc->a[3],
+				    smc->a[4], smc->a[5], quirk.state.a6,
+				    smc->a[7], res, &quirk);
 
 		if (res->a0 == QCOM_SCM_INTERRUPTED)
-			cmd = res->a0;
+			a0 = res->a0;
 
 	} while (res->a0 == QCOM_SCM_INTERRUPTED);
 }
@@ -95,12 +95,22 @@ static int ___qcom_scm_call_smccc(struct device *dev,
 {
 	int arglen = desc->arginfo & 0xf;
 	int i;
-	u64 x5 = desc->args[SMCCC_FIRST_EXT_IDX];
 	dma_addr_t args_phys = 0;
 	void *args_virt = NULL;
 	size_t alloc_len;
 	gfp_t flag = atomic ? GFP_ATOMIC : GFP_KERNEL;
+	u32 smccc_call_type = atomic ? ARM_SMCCC_FAST_CALL : ARM_SMCCC_STD_CALL;
 	struct arm_smccc_res res;
+	struct arm_smccc_args smc = {0};
+
+	smc.a[0] = ARM_SMCCC_CALL_VAL(
+		smccc_call_type,
+		qcom_smccc_convention,
+		desc->owner,
+		SMCCC_FUNCNUM(desc->svc, desc->cmd));
+	smc.a[1] = desc->arginfo;
+	for (i = 0; i < SMCCC_N_REG_ARGS; i++)
+		smc.a[i + SMCCC_FIRST_REG_IDX] = desc->args[i];
 
 	if (unlikely(arglen > SMCCC_N_REG_ARGS)) {
 		alloc_len = SMCCC_N_EXT_ARGS * sizeof(u64);
@@ -131,19 +141,18 @@ static int ___qcom_scm_call_smccc(struct device *dev,
 			return -ENOMEM;
 		}
 
-		x5 = args_phys;
+		smc.a[SMCCC_LAST_REG_IDX] = args_phys;
 	}
 
 	if (atomic) {
-		__qcom_scm_call_do_quirk(desc, &res, x5, ARM_SMCCC_FAST_CALL);
+		__qcom_scm_call_do_quirk(&smc, &res);
 	} else {
 		int retry_count = 0;
 
 		do {
 			mutex_lock(&qcom_scm_lock);
 
-			__qcom_scm_call_do_quirk(desc, &res, x5,
-						 ARM_SMCCC_STD_CALL);
+			__qcom_scm_call_do_quirk(&smc, &res);
 
 			mutex_unlock(&qcom_scm_lock);
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

