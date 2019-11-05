Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A7C5EF2AB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2019 02:29:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730418AbfKEB2F (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Nov 2019 20:28:05 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:37932 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730448AbfKEB2D (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Nov 2019 20:28:03 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 595CF60FB3; Tue,  5 Nov 2019 01:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572917282;
        bh=Vdjtoena5EG9+m6Ae4DZLq5hG+gzcWTGvDKMFBB0IwM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=UAV+AfW/1FgowUpN0uL/x5qXVTUs5ll1epjz/VfA4RbVqHpvODgyRJ2x4PT51i77Q
         7xDlR/10zcnYqHBaOEQQ/u0bIagyx0y292pvymo8599OXSaZQi9azILc+1DkXVIyX3
         9NTyHvRb8nygqXsSWkj4lMCxx2GDPD3W9RIF1iU8=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 329ED60F35;
        Tue,  5 Nov 2019 01:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572917276;
        bh=Vdjtoena5EG9+m6Ae4DZLq5hG+gzcWTGvDKMFBB0IwM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=b37vy5ErU1XKmYvjGRV3QgmBgvsNAGc/kqSVRcWRjdM7SR2TR8IkqGgF3HHAVwh4H
         9q0hDhCZJCAYSkrrOpk6AcRRcF2AtY2F9pcbLRsoa+YqDxGPK5ES3twvuVEojqTtSO
         k0PKKBC4jLFO1SM/uoPGhKbUAUnJJRz11gVl/gC0=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 329ED60F35
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=eberman@codeaurora.org
From:   Elliot Berman <eberman@codeaurora.org>
To:     bjorn.andersson@linaro.org, saiprakash.ranjan@codeaurora.org,
        agross@kernel.org
Cc:     tsoni@codeaurora.org, sidgup@codeaurora.org,
        psodagud@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Elliot Berman <eberman@codeaurora.org>
Subject: [PATCH 09/17] firmware: qcom_scm-64: Improve SMC convention detection
Date:   Mon,  4 Nov 2019 17:27:28 -0800
Message-Id: <1572917256-24205-10-git-send-email-eberman@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1572917256-24205-1-git-send-email-eberman@codeaurora.org>
References: <1572917256-24205-1-git-send-email-eberman@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

- Use enum to describe SMC convention.
- Improve SMC convention detection to use __qcom_scm_is_call_available
  instead of circumventing qcom_scm_call_smccc.
- Improve SMC convention detection to check that SMCCC-32 works, instead
  of just assuming it does of SMCCC-64 does not.

Signed-off-by: Elliot Berman <eberman@codeaurora.org>
---
 drivers/firmware/qcom_scm-64.c | 42 ++++++++++++++++++++++++------------------
 1 file changed, 24 insertions(+), 18 deletions(-)

diff --git a/drivers/firmware/qcom_scm-64.c b/drivers/firmware/qcom_scm-64.c
index f79b0dc..2579246 100644
--- a/drivers/firmware/qcom_scm-64.c
+++ b/drivers/firmware/qcom_scm-64.c
@@ -58,7 +58,13 @@ struct arm_smccc_args {
 	unsigned long a[8];
 };
 
-static u64 qcom_smccc_convention = -1;
+enum qcom_smc_convention {
+	SMC_CONVENTION_UNKNOWN,
+	SMC_CONVENTION_ARM_32,
+	SMC_CONVENTION_ARM_64,
+};
+
+static enum qcom_smc_convention qcom_smc_convention = SMC_CONVENTION_UNKNOWN;
 static DEFINE_MUTEX(qcom_scm_lock);
 
 #define QCOM_SCM_EBUSY_WAIT_MS 30
@@ -103,7 +109,9 @@ static int ___qcom_scm_call_smccc(struct device *dev,
 
 	smc.a[0] = ARM_SMCCC_CALL_VAL(
 		atomic ? ARM_SMCCC_FAST_CALL : ARM_SMCCC_STD_CALL,
-		qcom_smccc_convention,
+		(qcom_smc_convention == SMC_CONVENTION_ARM_64) ?
+			ARM_SMCCC_SMC_64 :
+			ARM_SMCCC_SMC_32,
 		desc->owner,
 		SMCCC_FUNCNUM(desc->svc, desc->cmd));
 	smc.a[1] = desc->arginfo;
@@ -117,7 +125,7 @@ static int ___qcom_scm_call_smccc(struct device *dev,
 		if (!args_virt)
 			return -ENOMEM;
 
-		if (qcom_smccc_convention == ARM_SMCCC_SMC_32) {
+		if (qcom_smc_convention == SMC_CONVENTION_ARM_32) {
 			__le32 *args = args_virt;
 
 			for (i = 0; i < SMCCC_N_EXT_ARGS; i++)
@@ -583,19 +591,17 @@ int __qcom_scm_qsmmu500_wait_safe_toggle(struct device *dev, bool en)
 
 void __qcom_scm_init(void)
 {
-	u64 cmd;
-	struct arm_smccc_res res;
-	u32 function = SMCCC_FUNCNUM(QCOM_SCM_SVC_INFO, QCOM_SCM_INFO_IS_CALL_AVAIL);
-
-	/* First try a SMC64 call */
-	cmd = ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL, ARM_SMCCC_SMC_64,
-				 ARM_SMCCC_OWNER_SIP, function);
-
-	arm_smccc_smc(cmd, QCOM_SCM_ARGS(1), cmd & (~BIT(ARM_SMCCC_TYPE_SHIFT)),
-		      0, 0, 0, 0, 0, &res);
-
-	if (!res.a0 && res.a1)
-		qcom_smccc_convention = ARM_SMCCC_SMC_64;
-	else
-		qcom_smccc_convention = ARM_SMCCC_SMC_32;
+	qcom_smc_convention = SMC_CONVENTION_ARM_64;
+	if (__qcom_scm_is_call_available(NULL, QCOM_SCM_SVC_INFO,
+			QCOM_SCM_INFO_IS_CALL_AVAIL) == 1)
+		goto out;
+
+	qcom_smc_convention = SMC_CONVENTION_ARM_32;
+	if (__qcom_scm_is_call_available(NULL, QCOM_SCM_SVC_INFO,
+			QCOM_SCM_INFO_IS_CALL_AVAIL) == 1)
+		goto out;
+
+	qcom_smc_convention = SMC_CONVENTION_UNKNOWN;
+out:
+	pr_debug("QCOM SCM SMC Convention: %d\n", qcom_smc_convention);
 }
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

