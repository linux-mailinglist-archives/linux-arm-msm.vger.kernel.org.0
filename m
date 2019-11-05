Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6629FEF2B7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2019 02:29:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387569AbfKEB2X (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Nov 2019 20:28:23 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:38394 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387504AbfKEB2X (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Nov 2019 20:28:23 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 31DAA60FD2; Tue,  5 Nov 2019 01:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572917301;
        bh=epxNRYOQSvOHQswxcUI9Ti/+W8ScI05VMtoh1LMz3oE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SWWIdYy1shh3YNfqRDXJ/Mv2I6uRlGr1sVgTwY9TaOsIDz2qYXp5XyRblJuLtUNPH
         J/Tqj5n4TZpsit84r8SH5o61shNlyO9RxkiGqlcGnxTsMh8ivkN7O9CH/xgNrLJzhe
         1GiFoADbVMSL8I6M7a8XZfMiX+drxl5mPHIckNZI=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C31E460F94;
        Tue,  5 Nov 2019 01:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572917281;
        bh=epxNRYOQSvOHQswxcUI9Ti/+W8ScI05VMtoh1LMz3oE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ImYpYdSA7hVz/l/f2sFYmXM/04kEuDiGFtn6WssVbIz1DeepiztWbv1VFTaW3VDN5
         zSSo1poQqyUqFSl7Kre1qycFiRZIzra71sWvVrnJDu+KigSHR86tcO1HMU3Vk6S126
         Kb0u3qHh4DGQotHGclPYot2QbBPhrtvcinEYDStY=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C31E460F94
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=eberman@codeaurora.org
From:   Elliot Berman <eberman@codeaurora.org>
To:     bjorn.andersson@linaro.org, saiprakash.ranjan@codeaurora.org,
        agross@kernel.org
Cc:     tsoni@codeaurora.org, sidgup@codeaurora.org,
        psodagud@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Elliot Berman <eberman@codeaurora.org>
Subject: [PATCH 14/17] firmware: qcom_scm-32: Add device argument to atomic calls
Date:   Mon,  4 Nov 2019 17:27:33 -0800
Message-Id: <1572917256-24205-15-git-send-email-eberman@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1572917256-24205-1-git-send-email-eberman@codeaurora.org>
References: <1572917256-24205-1-git-send-email-eberman@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add this unused parameter to reduce merge friction between SMCCC and
legacy based conventions.

Signed-off-by: Elliot Berman <eberman@codeaurora.org>
---
 drivers/firmware/qcom_scm-32.c | 17 +++++++++--------
 drivers/firmware/qcom_scm-64.c |  5 +++--
 drivers/firmware/qcom_scm.c    |  5 +++--
 drivers/firmware/qcom_scm.h    |  5 +++--
 4 files changed, 18 insertions(+), 14 deletions(-)

diff --git a/drivers/firmware/qcom_scm-32.c b/drivers/firmware/qcom_scm-32.c
index 533c68a..3325c21 100644
--- a/drivers/firmware/qcom_scm-32.c
+++ b/drivers/firmware/qcom_scm-32.c
@@ -273,7 +273,7 @@ static int qcom_scm_call(struct device *dev, struct qcom_scm_desc *desc)
  * This shall only be used with commands that are guaranteed to be
  * uninterruptable, atomic and SMP safe.
  */
-static int qcom_scm_call_atomic(struct qcom_scm_desc *desc)
+static int qcom_scm_call_atomic(struct device *dev, struct qcom_scm_desc *desc)
 {
 	int context_id;
 	struct arm_smccc_args smc = {0};
@@ -306,7 +306,8 @@ static int qcom_scm_call_atomic(struct qcom_scm_desc *desc)
  * Set the cold boot address of the cpus. Any cpu outside the supported
  * range would be removed from the cpu present mask.
  */
-int __qcom_scm_set_cold_boot_addr(void *entry, const cpumask_t *cpus)
+int __qcom_scm_set_cold_boot_addr(struct device *dev, void *entry,
+				  const cpumask_t *cpus)
 {
 	int flags = 0;
 	int cpu;
@@ -336,7 +337,7 @@ int __qcom_scm_set_cold_boot_addr(void *entry, const cpumask_t *cpus)
 	desc.args[1] = virt_to_phys(entry);
 	desc.arginfo = QCOM_SCM_ARGS(2);
 
-	return qcom_scm_call_atomic(&desc);
+	return qcom_scm_call_atomic(dev, &desc);
 }
 
 /**
@@ -392,7 +393,7 @@ int __qcom_scm_set_warm_boot_addr(struct device *dev, void *entry,
  * the control would return from this function, otherwise, the cpu jumps to the
  * warm boot entry point set for this cpu upon reset.
  */
-void __qcom_scm_cpu_power_down(u32 flags)
+void __qcom_scm_cpu_power_down(struct device *dev, u32 flags)
 {
 	struct qcom_scm_desc desc = {
 		.svc = QCOM_SCM_SVC_BOOT,
@@ -402,7 +403,7 @@ void __qcom_scm_cpu_power_down(u32 flags)
 		.owner = ARM_SMCCC_OWNER_SIP,
 	};
 
-	qcom_scm_call_atomic(&desc);
+	qcom_scm_call_atomic(dev, &desc);
 }
 
 int __qcom_scm_set_remote_state(struct device *dev, u32 state, u32 id)
@@ -435,7 +436,7 @@ int __qcom_scm_set_dload_mode(struct device *dev, bool enable)
 	desc.args[1] = enable ? QCOM_SCM_BOOT_SET_DLOAD_MODE : 0;
 	desc.arginfo = QCOM_SCM_ARGS(2);
 
-	return qcom_scm_call_atomic(&desc);
+	return qcom_scm_call_atomic(dev, &desc);
 }
 
 bool __qcom_scm_pas_supported(struct device *dev, u32 peripheral)
@@ -556,7 +557,7 @@ int __qcom_scm_io_readl(struct device *dev, phys_addr_t addr,
 	desc.args[0] = addr;
 	desc.arginfo = QCOM_SCM_ARGS(1);
 
-	ret = qcom_scm_call_atomic(&desc);
+	ret = qcom_scm_call_atomic(dev, &desc);
 	if (ret >= 0)
 		*val = desc.res[0];
 
@@ -575,7 +576,7 @@ int __qcom_scm_io_writel(struct device *dev, phys_addr_t addr, unsigned int val)
 	desc.args[1] = val;
 	desc.arginfo = QCOM_SCM_ARGS(2);
 
-	return qcom_scm_call_atomic(&desc);
+	return qcom_scm_call_atomic(dev, &desc);
 }
 
 int __qcom_scm_is_call_available(struct device *dev, u32 svc_id, u32 cmd_id)
diff --git a/drivers/firmware/qcom_scm-64.c b/drivers/firmware/qcom_scm-64.c
index 2579246..d10845a 100644
--- a/drivers/firmware/qcom_scm-64.c
+++ b/drivers/firmware/qcom_scm-64.c
@@ -225,7 +225,8 @@ static int qcom_scm_call_atomic(struct device *dev, struct qcom_scm_desc *desc)
  * Set the cold boot address of the cpus. Any cpu outside the supported
  * range would be removed from the cpu present mask.
  */
-int __qcom_scm_set_cold_boot_addr(void *entry, const cpumask_t *cpus)
+int __qcom_scm_set_cold_boot_addr(struct device *dev, void *entry,
+				  const cpumask_t *cpus)
 {
 	return -ENOTSUPP;
 }
@@ -253,7 +254,7 @@ int __qcom_scm_set_warm_boot_addr(struct device *dev, void *entry,
  * the control would return from this function, otherwise, the cpu jumps to the
  * warm boot entry point set for this cpu upon reset.
  */
-void __qcom_scm_cpu_power_down(u32 flags)
+void __qcom_scm_cpu_power_down(struct device *dev, u32 flags)
 {
 }
 
diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
index 83fc049..ffad61b 100644
--- a/drivers/firmware/qcom_scm.c
+++ b/drivers/firmware/qcom_scm.c
@@ -95,7 +95,8 @@ static void qcom_scm_clk_disable(void)
  */
 int qcom_scm_set_cold_boot_addr(void *entry, const cpumask_t *cpus)
 {
-	return __qcom_scm_set_cold_boot_addr(entry, cpus);
+	return __qcom_scm_set_cold_boot_addr(__scm ? __scm->dev : NULL, entry,
+					     cpus);
 }
 EXPORT_SYMBOL(qcom_scm_set_cold_boot_addr);
 
@@ -123,7 +124,7 @@ EXPORT_SYMBOL(qcom_scm_set_warm_boot_addr);
  */
 void qcom_scm_cpu_power_down(u32 flags)
 {
-	__qcom_scm_cpu_power_down(flags);
+	__qcom_scm_cpu_power_down(__scm ? __scm->dev : NULL, flags);
 }
 EXPORT_SYMBOL(qcom_scm_cpu_power_down);
 
diff --git a/drivers/firmware/qcom_scm.h b/drivers/firmware/qcom_scm.h
index 4be482f..20220db 100644
--- a/drivers/firmware/qcom_scm.h
+++ b/drivers/firmware/qcom_scm.h
@@ -9,10 +9,11 @@
 #define QCOM_SCM_BOOT_TERMINATE_PC		0x02
 #define QCOM_SCM_BOOT_SET_REMOTE_STATE		0x0a
 #define QCOM_SCM_BOOT_SET_DLOAD_MODE		0x10
-extern int __qcom_scm_set_cold_boot_addr(void *entry, const cpumask_t *cpus);
+extern int __qcom_scm_set_cold_boot_addr(struct device *dev, void *entry,
+		const cpumask_t *cpus);
 extern int __qcom_scm_set_warm_boot_addr(struct device *dev, void *entry,
 		const cpumask_t *cpus);
-extern void __qcom_scm_cpu_power_down(u32 flags);
+extern void __qcom_scm_cpu_power_down(struct device *dev, u32 flags);
 extern int __qcom_scm_set_remote_state(struct device *dev, u32 state, u32 id);
 extern int __qcom_scm_set_dload_mode(struct device *dev, bool enable);
 #define QCOM_SCM_FLUSH_FLAG_MASK	0x3
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

