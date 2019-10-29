Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6179CE902C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2019 20:42:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732612AbfJ2TlX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Oct 2019 15:41:23 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:59250 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732749AbfJ2TlV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Oct 2019 15:41:21 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id ED10761178; Tue, 29 Oct 2019 19:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572378079;
        bh=uK6ASzZpPsIeZzDNRRMhT8EKcsUfWE3Mf4A1ExJ+xZ8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=BDZJSyXGiYOpewo4vEKD8uxKLA0VXaotuaAdNLiIcO1FPcqefpScSAkpxn63fEMnk
         uIA/SqMxpcuusgrym5eXHm7y9mG5YdcsgZwvF9KxzToJaqdn98GfOgtrR3/Fb6xfVd
         yaGoXy0KCqyk+FHSafcFSjjLeLPwHjF5xM/6Liaw=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D96806115E;
        Tue, 29 Oct 2019 19:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572378079;
        bh=uK6ASzZpPsIeZzDNRRMhT8EKcsUfWE3Mf4A1ExJ+xZ8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=BDZJSyXGiYOpewo4vEKD8uxKLA0VXaotuaAdNLiIcO1FPcqefpScSAkpxn63fEMnk
         uIA/SqMxpcuusgrym5eXHm7y9mG5YdcsgZwvF9KxzToJaqdn98GfOgtrR3/Fb6xfVd
         yaGoXy0KCqyk+FHSafcFSjjLeLPwHjF5xM/6Liaw=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D96806115E
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=eberman@codeaurora.org
From:   Elliot Berman <eberman@codeaurora.org>
To:     bjorn.andersson@linaro.org, saipraka@codeaurora.org,
        agross@kernel.org
Cc:     tsoni@codeaurora.org, sidgup@codeaurora.org,
        psodagud@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Elliot Berman <eberman@codeaurora.org>
Subject: [RFC 14/17] firmware: qcom_scm-32: Add device argument to atomic calls
Date:   Tue, 29 Oct 2019 12:41:02 -0700
Message-Id: <1572378065-4490-15-git-send-email-eberman@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1572378065-4490-1-git-send-email-eberman@codeaurora.org>
References: <1572378065-4490-1-git-send-email-eberman@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add this unused parameter to reduce merge friction between SMCCC and
legacy based conventions.

Signed-off-by: Elliot Berman <eberman@codeaurora.org>
---
 drivers/firmware/qcom_scm-32.c | 18 ++++++++++--------
 drivers/firmware/qcom_scm-64.c |  5 +++--
 drivers/firmware/qcom_scm.c    |  4 ++--
 drivers/firmware/qcom_scm.h    |  5 +++--
 4 files changed, 18 insertions(+), 14 deletions(-)

diff --git a/drivers/firmware/qcom_scm-32.c b/drivers/firmware/qcom_scm-32.c
index f9eb490..a33fdf1 100644
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
@@ -391,7 +392,7 @@ int __qcom_scm_set_warm_boot_addr(struct device *dev, void *entry,
  * the control would return from this function, otherwise, the cpu jumps to the
  * warm boot entry point set for this cpu upon reset.
  */
-void __qcom_scm_cpu_power_down(u32 flags)
+void __qcom_scm_cpu_power_down(struct device *dev, u32 flags)
 {
 	struct qcom_scm_desc desc = {
 		.svc = QCOM_SCM_SVC_BOOT,
@@ -401,7 +402,7 @@ void __qcom_scm_cpu_power_down(u32 flags)
 		.owner = ARM_SMCCC_OWNER_SIP,
 	};
 
-	qcom_scm_call_atomic(&desc);
+	qcom_scm_call_atomic(dev, &desc);
 }
 
 int __qcom_scm_set_remote_state(struct device *dev, u32 state, u32 id)
@@ -434,7 +435,7 @@ int __qcom_scm_set_dload_mode(struct device *dev, bool enable)
 	desc.args[1] = enable ? QCOM_SCM_BOOT_SET_DLOAD_MODE : 0;
 	desc.arginfo = QCOM_SCM_ARGS(2);
 
-	return qcom_scm_call_atomic(&desc);
+	return qcom_scm_call_atomic(dev, &desc);
 }
 
 bool __qcom_scm_pas_supported(struct device *dev, u32 peripheral)
@@ -555,11 +556,12 @@ int __qcom_scm_io_readl(struct device *dev, phys_addr_t addr,
 	desc.args[0] = addr;
 	desc.arginfo = QCOM_SCM_ARGS(1);
 
-	ret = qcom_scm_call_atomic(&desc);
+	ret = qcom_scm_call_atomic(dev, &desc);
 	if (ret >= 0)
 		*val = desc.res[0];
 
 	return ret < 0 ? ret : 0;
+	
 }
 
 int __qcom_scm_io_writel(struct device *dev, phys_addr_t addr, unsigned int val)
@@ -574,7 +576,7 @@ int __qcom_scm_io_writel(struct device *dev, phys_addr_t addr, unsigned int val)
 	desc.args[1] = val;
 	desc.arginfo = QCOM_SCM_ARGS(2);
 
-	return qcom_scm_call_atomic(&desc);
+	return qcom_scm_call_atomic(dev, &desc);
 }
 
 int __qcom_scm_is_call_available(struct device *dev, u32 svc_id, u32 cmd_id)
diff --git a/drivers/firmware/qcom_scm-64.c b/drivers/firmware/qcom_scm-64.c
index 4d7fd3e..9f39483 100644
--- a/drivers/firmware/qcom_scm-64.c
+++ b/drivers/firmware/qcom_scm-64.c
@@ -221,7 +221,8 @@ static int qcom_scm_call_atomic(struct device *dev, struct qcom_scm_desc *desc)
  * Set the cold boot address of the cpus. Any cpu outside the supported
  * range would be removed from the cpu present mask.
  */
-int __qcom_scm_set_cold_boot_addr(void *entry, const cpumask_t *cpus)
+int __qcom_scm_set_cold_boot_addr(struct device *dev, void *entry,
+				  const cpumask_t *cpus)
 {
 	return -ENOTSUPP;
 }
@@ -249,7 +250,7 @@ int __qcom_scm_set_warm_boot_addr(struct device *dev, void *entry,
  * the control would return from this function, otherwise, the cpu jumps to the
  * warm boot entry point set for this cpu upon reset.
  */
-void __qcom_scm_cpu_power_down(u32 flags)
+void __qcom_scm_cpu_power_down(struct device *dev, u32 flags)
 {
 }
 
diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
index 7244236..bb57fad 100644
--- a/drivers/firmware/qcom_scm.c
+++ b/drivers/firmware/qcom_scm.c
@@ -97,7 +97,7 @@ static void qcom_scm_clk_disable(void)
  */
 int qcom_scm_set_cold_boot_addr(void *entry, const cpumask_t *cpus)
 {
-	return __qcom_scm_set_cold_boot_addr(entry, cpus);
+	return __qcom_scm_set_cold_boot_addr(__scm->dev, entry, cpus);
 }
 EXPORT_SYMBOL(qcom_scm_set_cold_boot_addr);
 
@@ -125,7 +125,7 @@ EXPORT_SYMBOL(qcom_scm_set_warm_boot_addr);
  */
 void qcom_scm_cpu_power_down(u32 flags)
 {
-	__qcom_scm_cpu_power_down(flags);
+	__qcom_scm_cpu_power_down(__scm->dev, flags);
 }
 EXPORT_SYMBOL(qcom_scm_cpu_power_down);
 
diff --git a/drivers/firmware/qcom_scm.h b/drivers/firmware/qcom_scm.h
index 6f63ca6..ce2c396 100644
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

