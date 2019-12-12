Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 07B1911D5DF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2019 19:38:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730632AbfLLSh5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Dec 2019 13:37:57 -0500
Received: from a27-55.smtp-out.us-west-2.amazonses.com ([54.240.27.55]:36660
        "EHLO a27-55.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730426AbfLLShB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Dec 2019 13:37:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1576175820;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        bh=AXrIkffOoSweX+hzBomhDUPMjvV7peO7xejAL21ZX+I=;
        b=nTrYvuAwbqQr6KXr9ua/VPFRbX0RpZJb4Z5EAbnR1IDzy5M2WM9/aJ9tpqBmyKdE
        7E7rzkSeqpE99nvQqlUYavrjlDo8P7WuDqGs7qmIzYAgfz1oy+HZAcIcNdJ+wRmkpU4
        VFJZGOZy4Z5EzvYw17I/yG9MYmajWUc00AEQDai8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1576175820;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:Feedback-ID;
        bh=AXrIkffOoSweX+hzBomhDUPMjvV7peO7xejAL21ZX+I=;
        b=a1E/imInnBzCq/fmD+VRqV21Vs8zXrcoD+WbGtVpzlqbvAL41WqRmCutZju2v7tv
        Tl7/ZSfsLrm1bN9CYLYYsyojY4ub1NsB43sRhaQr8+H3MU47vPJEWiC0iqGthBpx0vM
        zltv5VPIqOfct+QtEZxKc9OFScM0KKvWhI14ap4w=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 58D4AC433A2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=eberman@codeaurora.org
From:   Elliot Berman <eberman@codeaurora.org>
To:     bjorn.anderssen@linaro.org, saiprakash.ranjan@codeaurora.org,
        agross@kernel.org, swboyd@chromium.org
Cc:     Elliot Berman <eberman@codeaurora.org>, tsoni@codeaurora.org,
        sidgup@codeaurora.org, psodagud@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 03/17] firmware: qcom_scm: Remove unused qcom_scm_get_version
Date:   Thu, 12 Dec 2019 18:37:00 +0000
Message-ID: <0101016efb665de7-79b48553-deb3-466c-8a77-19304e1e101b-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1576175807-11775-1-git-send-email-eberman@codeaurora.org>
References: <1576175807-11775-1-git-send-email-eberman@codeaurora.org>
X-SES-Outgoing: 2019.12.12-54.240.27.55
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Remove unused qcom_scm_get_version.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Reviewed-by: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Elliot Berman <eberman@codeaurora.org>
---
 drivers/firmware/qcom_scm-32.c | 36 ------------------------------------
 include/linux/qcom_scm.h       |  2 --
 2 files changed, 38 deletions(-)

diff --git a/drivers/firmware/qcom_scm-32.c b/drivers/firmware/qcom_scm-32.c
index 6e62f73..8b57240 100644
--- a/drivers/firmware/qcom_scm-32.c
+++ b/drivers/firmware/qcom_scm-32.c
@@ -292,42 +292,6 @@ static s32 qcom_scm_call_atomic2(u32 svc, u32 cmd, u32 arg1, u32 arg2)
 	return r0;
 }
 
-u32 qcom_scm_get_version(void)
-{
-	int context_id;
-	static u32 version = -1;
-	register u32 r0 asm("r0");
-	register u32 r1 asm("r1");
-
-	if (version != -1)
-		return version;
-
-	mutex_lock(&qcom_scm_lock);
-
-	r0 = 0x1 << 8;
-	r1 = (u32)&context_id;
-	do {
-		asm volatile(
-			__asmeq("%0", "r0")
-			__asmeq("%1", "r1")
-			__asmeq("%2", "r0")
-			__asmeq("%3", "r1")
-#ifdef REQUIRES_SEC
-			".arch_extension sec\n"
-#endif
-			"smc	#0	@ switch to secure world\n"
-			: "=r" (r0), "=r" (r1)
-			: "r" (r0), "r" (r1)
-			: "r2", "r3", "r12");
-	} while (r0 == QCOM_SCM_INTERRUPTED);
-
-	version = r1;
-	mutex_unlock(&qcom_scm_lock);
-
-	return version;
-}
-EXPORT_SYMBOL(qcom_scm_get_version);
-
 /**
  * qcom_scm_set_cold_boot_addr() - Set the cold boot address for cpus
  * @entry: Entry point function for the cpus
diff --git a/include/linux/qcom_scm.h b/include/linux/qcom_scm.h
index d05ddac..6fb23c5 100644
--- a/include/linux/qcom_scm.h
+++ b/include/linux/qcom_scm.h
@@ -78,7 +78,6 @@ extern int qcom_scm_assign_mem(phys_addr_t mem_addr, size_t mem_sz,
 			       const struct qcom_scm_vmperm *newvm,
 			       unsigned int dest_cnt);
 extern void qcom_scm_cpu_power_down(u32 flags);
-extern u32 qcom_scm_get_version(void);
 extern int qcom_scm_set_remote_state(u32 state, u32 id);
 extern bool qcom_scm_restore_sec_cfg_available(void);
 extern int qcom_scm_restore_sec_cfg(u32 device_id, u32 spare);
@@ -118,7 +117,6 @@ static inline int qcom_scm_assign_mem(phys_addr_t mem_addr, size_t mem_sz,
 				      const struct qcom_scm_vmperm *newvm,
 				      unsigned int dest_cnt) { return -ENODEV; }
 static inline void qcom_scm_cpu_power_down(u32 flags) {}
-static inline u32 qcom_scm_get_version(void) { return 0; }
 static inline u32
 qcom_scm_set_remote_state(u32 state,u32 id) { return -ENODEV; }
 static inline int qcom_scm_restore_sec_cfg(u32 device_id, u32 spare) { return -ENODEV; }
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

