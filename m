Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 334EFF9C26
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2019 22:24:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727514AbfKLVXz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Nov 2019 16:23:55 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:39456 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727537AbfKLVXa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Nov 2019 16:23:30 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 4A8AE60E74; Tue, 12 Nov 2019 21:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573593809;
        bh=wYDOZB/YAonq1CatbFTG+Ux5sV3vBmtfWfxuRkP1OYc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=cEPffaISI1brHz+vp/a5R7SuxlHC1o+FFJZD2CyG+L9ow2mT3GZu0/QoCz9sTx8kb
         6hvfpVvfVMtxdF2BnpuB1/kuJ8FTPp1fHYtVS3LSxvpn7tKqa3puouGbRrkgq1/Lsc
         bQpQxVRSL5j1vtrtYAhqmww7///o9YXvaphFkk8E=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 328EA60DEA;
        Tue, 12 Nov 2019 21:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573593799;
        bh=wYDOZB/YAonq1CatbFTG+Ux5sV3vBmtfWfxuRkP1OYc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SOMAv161py6eYFrXt2MxTysDoh+uWErBJIQOPUH5aRmQl6OJmlZnY5eOcP0cK1oio
         UeG6mAHOd0IIaTEKarBz43KD1B5+c/vcV2ULVuP1VcJYxFNHEk5x8na0znqlcIqrBB
         SsK8O9EhzBmeqVEgst75bTEUH2aAoQYQgcvSNMzA=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 328EA60DEA
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=eberman@codeaurora.org
From:   Elliot Berman <eberman@codeaurora.org>
To:     bjorn.andersson@linaro.org, saiprakash.ranjan@codeaurora.org,
        agross@kernel.org, swboyd@chromium.org
Cc:     Elliot Berman <eberman@codeaurora.org>, tsoni@codeaurora.org,
        sidgup@codeaurora.org, psodagud@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 15/18] firmware: qcom_scm-32: Add device argument to atomic calls
Date:   Tue, 12 Nov 2019 13:22:51 -0800
Message-Id: <1573593774-12539-16-git-send-email-eberman@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573593774-12539-1-git-send-email-eberman@codeaurora.org>
References: <1573593774-12539-1-git-send-email-eberman@codeaurora.org>
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
index eca18e1..c1c0831 100644
--- a/drivers/firmware/qcom_scm-32.c
+++ b/drivers/firmware/qcom_scm-32.c
@@ -269,7 +269,7 @@ static int qcom_scm_call(struct device *dev, struct qcom_scm_desc *desc)
  * This shall only be used with commands that are guaranteed to be
  * uninterruptable, atomic and SMP safe.
  */
-static int qcom_scm_call_atomic(struct qcom_scm_desc *desc)
+static int qcom_scm_call_atomic(struct device *dev, struct qcom_scm_desc *desc)
 {
 	int context_id;
 	struct arm_smccc_args smc = {0};
@@ -302,7 +302,8 @@ static int qcom_scm_call_atomic(struct qcom_scm_desc *desc)
  * Set the cold boot address of the cpus. Any cpu outside the supported
  * range would be removed from the cpu present mask.
  */
-int __qcom_scm_set_cold_boot_addr(void *entry, const cpumask_t *cpus)
+int __qcom_scm_set_cold_boot_addr(struct device *dev, void *entry,
+				  const cpumask_t *cpus)
 {
 	int flags = 0;
 	int cpu;
@@ -332,7 +333,7 @@ int __qcom_scm_set_cold_boot_addr(void *entry, const cpumask_t *cpus)
 	desc.args[1] = virt_to_phys(entry);
 	desc.arginfo = QCOM_SCM_ARGS(2);
 
-	return qcom_scm_call_atomic(&desc);
+	return qcom_scm_call_atomic(dev, &desc);
 }
 
 /**
@@ -389,7 +390,7 @@ int __qcom_scm_set_warm_boot_addr(struct device *dev, void *entry,
  * the control would return from this function, otherwise, the cpu jumps to the
  * warm boot entry point set for this cpu upon reset.
  */
-void __qcom_scm_cpu_power_down(u32 flags)
+void __qcom_scm_cpu_power_down(struct device *dev, u32 flags)
 {
 	struct qcom_scm_desc desc = {
 		.svc = QCOM_SCM_SVC_BOOT,
@@ -399,7 +400,7 @@ void __qcom_scm_cpu_power_down(u32 flags)
 		.owner = ARM_SMCCC_OWNER_SIP,
 	};
 
-	qcom_scm_call_atomic(&desc);
+	qcom_scm_call_atomic(dev, &desc);
 }
 
 int __qcom_scm_is_call_available(struct device *dev, u32 svc_id, u32 cmd_id)
@@ -569,7 +570,7 @@ int __qcom_scm_set_dload_mode(struct device *dev, bool enable)
 	desc.args[1] = enable ? QCOM_SCM_BOOT_SET_DLOAD_MODE : 0;
 	desc.arginfo = QCOM_SCM_ARGS(2);
 
-	return qcom_scm_call_atomic(&desc);
+	return qcom_scm_call_atomic(dev, &desc);
 }
 
 int __qcom_scm_set_remote_state(struct device *dev, u32 state, u32 id)
@@ -627,7 +628,7 @@ int __qcom_scm_io_readl(struct device *dev, phys_addr_t addr,
 	desc.args[0] = addr;
 	desc.arginfo = QCOM_SCM_ARGS(1);
 
-	ret = qcom_scm_call_atomic(&desc);
+	ret = qcom_scm_call_atomic(dev, &desc);
 	if (ret >= 0)
 		*val = desc.result[0];
 
@@ -646,7 +647,7 @@ int __qcom_scm_io_writel(struct device *dev, phys_addr_t addr, unsigned int val)
 	desc.args[1] = val;
 	desc.arginfo = QCOM_SCM_ARGS(2);
 
-	return qcom_scm_call_atomic(&desc);
+	return qcom_scm_call_atomic(dev, &desc);
 }
 
 int __qcom_scm_qsmmu500_wait_safe_toggle(struct device *dev, bool enable)
diff --git a/drivers/firmware/qcom_scm-64.c b/drivers/firmware/qcom_scm-64.c
index b82b450..5088c0c 100644
--- a/drivers/firmware/qcom_scm-64.c
+++ b/drivers/firmware/qcom_scm-64.c
@@ -219,7 +219,8 @@ static int qcom_scm_call_atomic(struct device *dev, struct qcom_scm_desc *desc)
  * Set the cold boot address of the cpus. Any cpu outside the supported
  * range would be removed from the cpu present mask.
  */
-int __qcom_scm_set_cold_boot_addr(void *entry, const cpumask_t *cpus)
+int __qcom_scm_set_cold_boot_addr(struct device *dev, void *entry,
+				  const cpumask_t *cpus)
 {
 	return -ENOTSUPP;
 }
@@ -247,7 +248,7 @@ int __qcom_scm_set_warm_boot_addr(struct device *dev, void *entry,
  * the control would return from this function, otherwise, the cpu jumps to the
  * warm boot entry point set for this cpu upon reset.
  */
-void __qcom_scm_cpu_power_down(u32 flags)
+void __qcom_scm_cpu_power_down(struct device *dev, u32 flags)
 {
 }
 
diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
index 72757c5..1875e48 100644
--- a/drivers/firmware/qcom_scm.c
+++ b/drivers/firmware/qcom_scm.c
@@ -94,7 +94,8 @@ static void qcom_scm_clk_disable(void)
  */
 int qcom_scm_set_cold_boot_addr(void *entry, const cpumask_t *cpus)
 {
-	return __qcom_scm_set_cold_boot_addr(entry, cpus);
+	return __qcom_scm_set_cold_boot_addr(__scm ? __scm->dev : NULL, entry,
+					     cpus);
 }
 EXPORT_SYMBOL(qcom_scm_set_cold_boot_addr);
 
@@ -122,7 +123,7 @@ EXPORT_SYMBOL(qcom_scm_set_warm_boot_addr);
  */
 void qcom_scm_cpu_power_down(u32 flags)
 {
-	__qcom_scm_cpu_power_down(flags);
+	__qcom_scm_cpu_power_down(__scm ? __scm->dev : NULL, flags);
 }
 EXPORT_SYMBOL(qcom_scm_cpu_power_down);
 
diff --git a/drivers/firmware/qcom_scm.h b/drivers/firmware/qcom_scm.h
index dfb5db2..35cdacf 100644
--- a/drivers/firmware/qcom_scm.h
+++ b/drivers/firmware/qcom_scm.h
@@ -13,11 +13,12 @@ extern int __qcom_scm_set_dload_mode(struct device *dev, bool enable);
 
 extern int __qcom_scm_set_warm_boot_addr(struct device *dev, void *entry,
 		const cpumask_t *cpus);
-extern int __qcom_scm_set_cold_boot_addr(void *entry, const cpumask_t *cpus);
+extern int __qcom_scm_set_cold_boot_addr(struct device *dev, void *entry,
+		const cpumask_t *cpus);
 
 #define QCOM_SCM_BOOT_TERMINATE_PC	0x2
 #define QCOM_SCM_FLUSH_FLAG_MASK	0x3
-extern void __qcom_scm_cpu_power_down(u32 flags);
+extern void __qcom_scm_cpu_power_down(struct device *dev, u32 flags);
 
 #define QCOM_SCM_SVC_IO			0x5
 #define QCOM_SCM_IO_READ		0x1
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

