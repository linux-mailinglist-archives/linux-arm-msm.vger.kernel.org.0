Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D535111D65E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2019 19:52:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730610AbfLLSvO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Dec 2019 13:51:14 -0500
Received: from a27-21.smtp-out.us-west-2.amazonses.com ([54.240.27.21]:39998
        "EHLO a27-21.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730601AbfLLSvO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Dec 2019 13:51:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1576176673;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        bh=nS5dpPxwP7JE8bX7G/pF3Js40aKiOtZzLGDlluiHQHc=;
        b=PUXVGmcyYwoKEE0joP8hhmxsSFjfHUx0eYaDmlitfLTu/1VYI++qhsq9M1tvZCVY
        oNuBR7GDZAamtTphtoMeg3JiyP1xU7ky3X/+/ErsWAfjH4e1ZwgWdcQdlZvtnHA7BmS
        +zvHgoTOnXVyuaMQCq3XWeFV/7nFQhpx7l1QHy4c=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1576176673;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:Feedback-ID;
        bh=nS5dpPxwP7JE8bX7G/pF3Js40aKiOtZzLGDlluiHQHc=;
        b=P2TJf/fQKhOvS8t2/shHpntoLTfKDnMpQbN8usGqh6nGxgXBoVKPEgXYu+b92ebS
        gGGjo8vLXELOiAQSgA0ThjZR6Z5xx6D+z67ISmMPIL0BgfIEe3Tzlkuff1eURb0ra2u
        8tIN4CQQWzwz7m4mGwt9SyFSCZhnZSF5fBmFsdww=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D5545C447B1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=eberman@codeaurora.org
From:   Elliot Berman <eberman@codeaurora.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org, swboyd@chromium.org
Cc:     Elliot Berman <eberman@codeaurora.org>,
        saiprakash.ranjan@codeaurora.org, tsoni@codeaurora.org,
        sidgup@codeaurora.org, psodagud@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 09/17] firmware: qcom_scm-32: Use SMC arch wrappers
Date:   Thu, 12 Dec 2019 18:51:13 +0000
Message-ID: <0101016efb736222-1f17d78f-df52-44e0-bb93-caca35d12d7f-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1576176651-17089-1-git-send-email-eberman@codeaurora.org>
References: <1576176651-17089-1-git-send-email-eberman@codeaurora.org>
X-SES-Outgoing: 2019.12.12-54.240.27.21
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use SMC arch wrappers instead of inline assembly.

Signed-off-by: Elliot Berman <eberman@codeaurora.org>
---
 drivers/firmware/Makefile      |  1 -
 drivers/firmware/qcom_scm-32.c | 71 ++++++++++--------------------------------
 2 files changed, 17 insertions(+), 55 deletions(-)

diff --git a/drivers/firmware/Makefile b/drivers/firmware/Makefile
index 3fcb919..747fb73 100644
--- a/drivers/firmware/Makefile
+++ b/drivers/firmware/Makefile
@@ -20,7 +20,6 @@ obj-$(CONFIG_FW_CFG_SYSFS)	+= qemu_fw_cfg.o
 obj-$(CONFIG_QCOM_SCM)		+= qcom_scm.o
 obj-$(CONFIG_QCOM_SCM_64)	+= qcom_scm-64.o
 obj-$(CONFIG_QCOM_SCM_32)	+= qcom_scm-32.o
-CFLAGS_qcom_scm-32.o :=$(call as-instr,.arch armv7-a\n.arch_extension sec,-DREQUIRES_SEC=1) -march=armv7-a
 obj-$(CONFIG_TI_SCI_PROTOCOL)	+= ti_sci.o
 obj-$(CONFIG_TRUSTED_FOUNDATIONS) += trusted_foundations.o
 obj-$(CONFIG_TURRIS_MOX_RWTM)	+= turris-mox-rwtm.o
diff --git a/drivers/firmware/qcom_scm-32.c b/drivers/firmware/qcom_scm-32.c
index 8b57240..362d042 100644
--- a/drivers/firmware/qcom_scm-32.c
+++ b/drivers/firmware/qcom_scm-32.c
@@ -10,6 +10,7 @@
 #include <linux/errno.h>
 #include <linux/err.h>
 #include <linux/qcom_scm.h>
+#include <linux/arm-smccc.h>
 #include <linux/dma-mapping.h>
 
 #include "qcom_scm.h"
@@ -121,25 +122,13 @@ static inline void *scm_legacy_get_response_buffer(
 static u32 __scm_legacy_do(u32 cmd_addr)
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
@@ -237,24 +226,12 @@ static int qcom_scm_call(struct device *dev, u32 svc_id, u32 cmd_id,
 static s32 qcom_scm_call_atomic1(u32 svc, u32 cmd, u32 arg1)
 {
 	int context_id;
+	struct arm_smccc_res res;
+
+	arm_smccc_smc(SCM_LEGACY_ATOMIC_ID(svc, cmd, 1),
+		      (unsigned long)&context_id, arg1, 0, 0, 0, 0, 0, &res);
 
-	register u32 r0 asm("r0") = SCM_LEGACY_ATOMIC_ID(svc, cmd, 1);
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
@@ -270,26 +247,12 @@ static s32 qcom_scm_call_atomic1(u32 svc, u32 cmd, u32 arg1)
 static s32 qcom_scm_call_atomic2(u32 svc, u32 cmd, u32 arg1, u32 arg2)
 {
 	int context_id;
+	struct arm_smccc_res res;
+
+	arm_smccc_smc(SCM_LEGACY_ATOMIC_ID(svc, cmd, 2),
+		      (unsigned long)&context_id, arg1, 0, 0, 0, 0, 0, &res);
 
-	register u32 r0 asm("r0") = SCM_LEGACY_ATOMIC_ID(svc, cmd, 2);
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

