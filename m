Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9529B11D652
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2019 19:52:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730511AbfLLSvq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Dec 2019 13:51:46 -0500
Received: from a27-56.smtp-out.us-west-2.amazonses.com ([54.240.27.56]:37124
        "EHLO a27-56.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730658AbfLLSvV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Dec 2019 13:51:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1576176680;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        bh=eCUEn4LD5D9VtBk5pZPvwROSrzfMyygmFCm7AbOdGgE=;
        b=cO6UgdAP5v/mGGsABBBrJyqRL8pwMFkhmZfhYRCLdMlCDTZixjWYPzXjyz5BcFHJ
        rH/DVvjQrFK8wr1faLVoxN/FANpwNomO1/SRxZaJ+TMwP7fdi+G4znZah+Iw6VUWpQR
        9Iv8x8fMqcFFulVjg2Wjl/WMALDLy6qiZVS4Qhpg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1576176680;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:Feedback-ID;
        bh=eCUEn4LD5D9VtBk5pZPvwROSrzfMyygmFCm7AbOdGgE=;
        b=WMIY9bKXWvPF2Jo2/8Tt4zBBGvN42xMtvMUVIpWw/XlE+pm8F7zEhz75VEBRLJTC
        f0OcEGq6Ar0ncTzsRe7NOMCkBd6Wp969wGqslebm8bgAokyIG+XrJL5Yfwg4Sz3QC29
        wcChHSvYzu+ervyo4Ggnt32yiyzYwYfPLmPfqpqI=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2E43FC447A6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=eberman@codeaurora.org
From:   Elliot Berman <eberman@codeaurora.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org, swboyd@chromium.org
Cc:     Elliot Berman <eberman@codeaurora.org>,
        saiprakash.ranjan@codeaurora.org, tsoni@codeaurora.org,
        sidgup@codeaurora.org, psodagud@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 14/17] firmware: qcom_scm-32: Add device argument to atomic calls
Date:   Thu, 12 Dec 2019 18:51:20 +0000
Message-ID: <0101016efb737d36-0c04e30d-e728-48ac-a731-9e48130356ec-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1576176651-17089-1-git-send-email-eberman@codeaurora.org>
References: <1576176651-17089-1-git-send-email-eberman@codeaurora.org>
X-SES-Outgoing: 2019.12.12-54.240.27.56
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add unused "device" parameter to reduce merge friction between SMCCC and
legacy based conventions in an upcoming patch.

Signed-off-by: Elliot Berman <eberman@codeaurora.org>
---
 drivers/firmware/qcom_scm-32.c | 18 ++++++++++--------
 drivers/firmware/qcom_scm-64.c |  5 +++--
 drivers/firmware/qcom_scm.c    |  5 +++--
 drivers/firmware/qcom_scm.h    |  5 +++--
 4 files changed, 19 insertions(+), 14 deletions(-)

diff --git a/drivers/firmware/qcom_scm-32.c b/drivers/firmware/qcom_scm-32.c
index 9729a8a..e9b396c 100644
--- a/drivers/firmware/qcom_scm-32.c
+++ b/drivers/firmware/qcom_scm-32.c
@@ -285,7 +285,8 @@ static int qcom_scm_call(struct device *dev, const struct qcom_scm_desc *desc,
  * This shall only be used with commands that are guaranteed to be
  * uninterruptable, atomic and SMP safe.
  */
-static int qcom_scm_call_atomic(const struct qcom_scm_desc *desc,
+static int qcom_scm_call_atomic(struct device *unused,
+				const struct qcom_scm_desc *desc,
 				struct qcom_scm_res *res)
 {
 	int context_id;
@@ -316,7 +317,8 @@ static int qcom_scm_call_atomic(const struct qcom_scm_desc *desc,
  * Set the cold boot address of the cpus. Any cpu outside the supported
  * range would be removed from the cpu present mask.
  */
-int __qcom_scm_set_cold_boot_addr(void *entry, const cpumask_t *cpus)
+int __qcom_scm_set_cold_boot_addr(struct device *dev, void *entry,
+				  const cpumask_t *cpus)
 {
 	int flags = 0;
 	int cpu;
@@ -345,7 +347,7 @@ int __qcom_scm_set_cold_boot_addr(void *entry, const cpumask_t *cpus)
 	desc.args[1] = virt_to_phys(entry);
 	desc.arginfo = QCOM_SCM_ARGS(2);
 
-	return qcom_scm_call_atomic(&desc, NULL);
+	return qcom_scm_call_atomic(dev, &desc, NULL);
 }
 
 /**
@@ -402,7 +404,7 @@ int __qcom_scm_set_warm_boot_addr(struct device *dev, void *entry,
  * the control would return from this function, otherwise, the cpu jumps to the
  * warm boot entry point set for this cpu upon reset.
  */
-void __qcom_scm_cpu_power_down(u32 flags)
+void __qcom_scm_cpu_power_down(struct device *dev, u32 flags)
 {
 	struct qcom_scm_desc desc = {
 		.svc = QCOM_SCM_SVC_BOOT,
@@ -411,7 +413,7 @@ void __qcom_scm_cpu_power_down(u32 flags)
 		.arginfo = QCOM_SCM_ARGS(1),
 	};
 
-	qcom_scm_call_atomic(&desc, NULL);
+	qcom_scm_call_atomic(dev, &desc, NULL);
 }
 
 int __qcom_scm_is_call_available(struct device *dev, u32 svc_id, u32 cmd_id)
@@ -616,7 +618,7 @@ int __qcom_scm_set_dload_mode(struct device *dev, bool enable)
 	desc.args[1] = enable ? QCOM_SCM_BOOT_SET_DLOAD_MODE : 0;
 	desc.arginfo = QCOM_SCM_ARGS(2);
 
-	return qcom_scm_call_atomic(&desc, NULL);
+	return qcom_scm_call_atomic(dev, &desc, NULL);
 }
 
 int __qcom_scm_set_remote_state(struct device *dev, u32 state, u32 id)
@@ -687,7 +689,7 @@ int __qcom_scm_io_readl(struct device *dev, phys_addr_t addr,
 	desc.args[0] = addr;
 	desc.arginfo = QCOM_SCM_ARGS(1);
 
-	ret = qcom_scm_call_atomic(&desc, &res);
+	ret = qcom_scm_call_atomic(dev, &desc, &res);
 	if (ret >= 0)
 		*val = res.result[0];
 
@@ -705,7 +707,7 @@ int __qcom_scm_io_writel(struct device *dev, phys_addr_t addr, unsigned int val)
 	desc.args[1] = val;
 	desc.arginfo = QCOM_SCM_ARGS(2);
 
-	return qcom_scm_call_atomic(&desc, NULL);
+	return qcom_scm_call_atomic(dev, &desc, NULL);
 }
 
 int __qcom_scm_qsmmu500_wait_safe_toggle(struct device *dev, bool enable)
diff --git a/drivers/firmware/qcom_scm-64.c b/drivers/firmware/qcom_scm-64.c
index 6bc7f69..9507047 100644
--- a/drivers/firmware/qcom_scm-64.c
+++ b/drivers/firmware/qcom_scm-64.c
@@ -239,7 +239,8 @@ static int qcom_scm_call_atomic(struct device *dev,
  * Set the cold boot address of the cpus. Any cpu outside the supported
  * range would be removed from the cpu present mask.
  */
-int __qcom_scm_set_cold_boot_addr(void *entry, const cpumask_t *cpus)
+int __qcom_scm_set_cold_boot_addr(struct device *dev, void *entry,
+				  const cpumask_t *cpus)
 {
 	return -ENOTSUPP;
 }
@@ -267,7 +268,7 @@ int __qcom_scm_set_warm_boot_addr(struct device *dev, void *entry,
  * the control would return from this function, otherwise, the cpu jumps to the
  * warm boot entry point set for this cpu upon reset.
  */
-void __qcom_scm_cpu_power_down(u32 flags)
+void __qcom_scm_cpu_power_down(struct device *dev, u32 flags)
 {
 }
 
diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
index 097f8b3..5efe729 100644
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
index afcca16..a022556 100644
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

