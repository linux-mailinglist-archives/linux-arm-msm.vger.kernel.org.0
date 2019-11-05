Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 29E0CEF2A9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2019 02:29:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730451AbfKEB2D (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Nov 2019 20:28:03 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:37888 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730418AbfKEB2C (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Nov 2019 20:28:02 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 6158460FA8; Tue,  5 Nov 2019 01:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572917281;
        bh=SLB3fsmnvVWOkJapCduG4dyqTrHMt32u3Ur5EzZVvBI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NQPvjHI0AyDanZWxPlKmzpA3ydku+dvNEYoXyC5X/v44gyI8IZSo8YGfH4jJ8cUrC
         +2IYQLdIpOVJa+OcMKXGHxetmI+bhTH+OJlPESOc093g8ZtWYFm+kgDI1vPkdEKuEw
         twfONEGGi+N5ejrc+Qi6bH3qZ4HJ4nujUnahsZf0=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0843860EE1;
        Tue,  5 Nov 2019 01:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572917274;
        bh=SLB3fsmnvVWOkJapCduG4dyqTrHMt32u3Ur5EzZVvBI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=BS/WNcSgH3gCh0h/10S+vry2nOVxRFUVjqy0w+c8TmCtMIlchrTlIkV3UyF/8FF/Z
         9OA40Cv9yz/6qV9hzZ10ty2/n7b5nkbl2PUWiXKKM/6Em0aZwJO6WVnd85uyOY8RTM
         p4N7Z7bgN1nEB2uWLiPn94RcLnwxhMSvybs8+g9I=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0843860EE1
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=eberman@codeaurora.org
From:   Elliot Berman <eberman@codeaurora.org>
To:     bjorn.andersson@linaro.org, saiprakash.ranjan@codeaurora.org,
        agross@kernel.org
Cc:     tsoni@codeaurora.org, sidgup@codeaurora.org,
        psodagud@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Elliot Berman <eberman@codeaurora.org>
Subject: [PATCH 08/17] firmware: qcom_scm-64: Move SMC register filling to qcom_scm_call_smccc
Date:   Mon,  4 Nov 2019 17:27:27 -0800
Message-Id: <1572917256-24205-9-git-send-email-eberman@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1572917256-24205-1-git-send-email-eberman@codeaurora.org>
References: <1572917256-24205-1-git-send-email-eberman@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

qcom_scm_call_smccc should be responsible for converting qcom_scm_desc
into arguments for smc call. Consolidate the dispersed logic to convert
qcom_scm_desc into smc arguments inside qcom_scm_call_smccc.

Signed-off-by: Elliot Berman <eberman@codeaurora.org>
---
 drivers/firmware/qcom_scm-64.c | 43 ++++++++++++++++++++++++------------------
 1 file changed, 25 insertions(+), 18 deletions(-)

diff --git a/drivers/firmware/qcom_scm-64.c b/drivers/firmware/qcom_scm-64.c
index c013c24..f79b0dc 100644
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
 
@@ -64,28 +68,23 @@ static DEFINE_MUTEX(qcom_scm_lock);
 #define SMCCC_N_REG_ARGS	4
 #define SMCCC_FIRST_REG_IDX	2
 #define SMCCC_N_EXT_ARGS	(MAX_QCOM_SCM_ARGS - SMCCC_N_REG_ARGS + 1)
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
@@ -95,12 +94,21 @@ static int ___qcom_scm_call_smccc(struct device *dev,
 {
 	int arglen = desc->arginfo & 0xf;
 	int i;
-	u64 x5 = desc->args[SMCCC_N_REG_ARGS - 1];
 	dma_addr_t args_phys = 0;
 	void *args_virt = NULL;
 	size_t alloc_len;
 	gfp_t flag = atomic ? GFP_ATOMIC : GFP_KERNEL;
 	struct arm_smccc_res res;
+	struct arm_smccc_args smc = {0};
+
+	smc.a[0] = ARM_SMCCC_CALL_VAL(
+		atomic ? ARM_SMCCC_FAST_CALL : ARM_SMCCC_STD_CALL,
+		qcom_smccc_convention,
+		desc->owner,
+		SMCCC_FUNCNUM(desc->svc, desc->cmd));
+	smc.a[1] = desc->arginfo;
+	for (i = 0; i < SMCCC_N_REG_ARGS; i++)
+		smc.a[i + SMCCC_FIRST_REG_IDX] = desc->args[i];
 
 	if (unlikely(arglen > SMCCC_N_REG_ARGS)) {
 		alloc_len = SMCCC_N_EXT_ARGS * sizeof(u64);
@@ -131,19 +139,18 @@ static int ___qcom_scm_call_smccc(struct device *dev,
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

