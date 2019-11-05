Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF93AEF2AD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2019 02:29:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730001AbfKEB2I (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Nov 2019 20:28:08 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:38054 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730448AbfKEB2H (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Nov 2019 20:28:07 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id A38C960EE1; Tue,  5 Nov 2019 01:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572917286;
        bh=vgqsF62QE8ERp90NGRpMZjdPhZbHqnlPxrUypzs5nvA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=AjToBxKe0d84J4N0SnAgzuhEyi5ZiKNIv5bPHVnsWOBAkUbEuxowVHHdhirdcfAz1
         XtKeHOYD60BxDIjnaAoKUz/kGw3eX7a5w1OefHFNDHs0jmDodObyenN/oMFZR4uce6
         c1BA3ib+xWyFz2ppPBF5YTU0Z0nizT/crrwyp3sM=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4D06A60F81;
        Tue,  5 Nov 2019 01:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572917277;
        bh=vgqsF62QE8ERp90NGRpMZjdPhZbHqnlPxrUypzs5nvA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=J7KKdYlqUs5YBuEX/8u+FgTtvg0h2Bt59z254aKsM8ZBnps2luKfvtYkMtS/6AyFF
         z4uDe6TWf8R3tNMbg/xJSGgGtCg2x3TlkLtmy5JIssA4UbAQcQ2JR9n9ZPS6+Ojy99
         LcigP7dUD26tpDROh3Az2swNpErYnMpKeoVNYZfw=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4D06A60F81
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=eberman@codeaurora.org
From:   Elliot Berman <eberman@codeaurora.org>
To:     bjorn.andersson@linaro.org, saiprakash.ranjan@codeaurora.org,
        agross@kernel.org
Cc:     tsoni@codeaurora.org, sidgup@codeaurora.org,
        psodagud@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Elliot Berman <eberman@codeaurora.org>
Subject: [PATCH 10/17] firmware: qcom_scm-32: Use SMC arch wrappers
Date:   Mon,  4 Nov 2019 17:27:29 -0800
Message-Id: <1572917256-24205-11-git-send-email-eberman@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1572917256-24205-1-git-send-email-eberman@codeaurora.org>
References: <1572917256-24205-1-git-send-email-eberman@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use SMC arch wrappers instead of inline assembly.

Signed-off-by: Elliot Berman <eberman@codeaurora.org>
---
 drivers/firmware/qcom_scm-32.c | 71 ++++++++++--------------------------------
 1 file changed, 17 insertions(+), 54 deletions(-)

diff --git a/drivers/firmware/qcom_scm-32.c b/drivers/firmware/qcom_scm-32.c
index b7f9f28..e3dc9a7 100644
--- a/drivers/firmware/qcom_scm-32.c
+++ b/drivers/firmware/qcom_scm-32.c
@@ -10,6 +10,7 @@
 #include <linux/errno.h>
 #include <linux/err.h>
 #include <linux/qcom_scm.h>
+#include <linux/arm-smccc.h>
 #include <linux/dma-mapping.h>
 
 #include "qcom_scm.h"
@@ -121,25 +122,13 @@ static inline void *legacy_get_response_buffer(const struct legacy_response *rsp
 static u32 __qcom_scm_call_do(u32 cmd_addr)
 {
 	int context_id;
-	register u32 r0 asm("r0") = 1;
-	register u32 r1 asm("r1") = (u32)&context_id;
-	register u32 r2 asm("r2") = cmd_addr;
+	struct arm_smccc_res res;
 	do {
-		asm volatile(
-			__asmeq("%0", "r0")
-			__asmeq("%1", "r0")
-			__asmeq("%2", "r1")
-			__asmeq("%3", "r2")
-#ifdef REQUIRES_SEC
-			".arch_extension sec\n"
-#endif
-			"smc	#0	@ switch to secure world\n"
-			: "=r" (r0)
-			: "r" (r0), "r" (r1), "r" (r2)
-			: "r3", "r12");
-	} while (r0 == QCOM_SCM_INTERRUPTED);
-
-	return r0;
+		arm_smccc_smc(1, (unsigned long)&context_id, cmd_addr,
+			      0, 0, 0, 0, 0, &res);
+	} while (res.a0 == QCOM_SCM_INTERRUPTED);
+
+	return res.a0;
 }
 
 /**
@@ -236,24 +225,12 @@ static int qcom_scm_call(struct device *dev, u32 svc_id, u32 cmd_id,
 static s32 qcom_scm_call_atomic1(u32 svc, u32 cmd, u32 arg1)
 {
 	int context_id;
+	struct arm_smccc_res res;
+
+	arm_smccc_smc(LEGACY_ATOMIC(svc, cmd, 1), (unsigned long)&context_id,
+		      arg1, 0, 0, 0, 0, 0, &res);
 
-	register u32 r0 asm("r0") = LEGACY_ATOMIC(svc, cmd, 1);
-	register u32 r1 asm("r1") = (u32)&context_id;
-	register u32 r2 asm("r2") = arg1;
-
-	asm volatile(
-			__asmeq("%0", "r0")
-			__asmeq("%1", "r0")
-			__asmeq("%2", "r1")
-			__asmeq("%3", "r2")
-#ifdef REQUIRES_SEC
-			".arch_extension sec\n"
-#endif
-			"smc    #0      @ switch to secure world\n"
-			: "=r" (r0)
-			: "r" (r0), "r" (r1), "r" (r2)
-			: "r3", "r12");
-	return r0;
+	return res.a0;
 }
 
 /**
@@ -269,26 +246,12 @@ static s32 qcom_scm_call_atomic1(u32 svc, u32 cmd, u32 arg1)
 static s32 qcom_scm_call_atomic2(u32 svc, u32 cmd, u32 arg1, u32 arg2)
 {
 	int context_id;
+	struct arm_smccc_res res;
+
+	arm_smccc_smc(LEGACY_ATOMIC(svc, cmd, 2), (unsigned long)&context_id,
+		      arg1, arg2, 0, 0, 0, 0, &res);
 
-	register u32 r0 asm("r0") = LEGACY_ATOMIC(svc, cmd, 2);
-	register u32 r1 asm("r1") = (u32)&context_id;
-	register u32 r2 asm("r2") = arg1;
-	register u32 r3 asm("r3") = arg2;
-
-	asm volatile(
-			__asmeq("%0", "r0")
-			__asmeq("%1", "r0")
-			__asmeq("%2", "r1")
-			__asmeq("%3", "r2")
-			__asmeq("%4", "r3")
-#ifdef REQUIRES_SEC
-			".arch_extension sec\n"
-#endif
-			"smc    #0      @ switch to secure world\n"
-			: "=r" (r0)
-			: "r" (r0), "r" (r1), "r" (r2), "r" (r3)
-			: "r12");
-	return r0;
+	return res.a0;
 }
 
 /**
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

