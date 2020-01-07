Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 483B9133376
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2020 22:19:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728530AbgAGVTE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jan 2020 16:19:04 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:55010 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728986AbgAGVEz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jan 2020 16:04:55 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1578431095; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=CRzf2OJHph3mX/NFa/qBi7u98FOdv2NaS1Fr0v0Cz/Q=; b=VelNw705GbzHpidkfr3T+E9YOf0w2+uKyT6dK5OvwU+x9CQTZvE8vjIsQAYiMkcBOfvIzc4U
 bbp224qsBp6QP3Re0++waOOKjsV03OCj/N90DaV1+8K14we+c/m+AGluNvBhxcVZcb/fUDpA
 1Cz3c7wSzc5W2+QQr2osuBW9luk=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e14f275.7f951be95c00-smtp-out-n03;
 Tue, 07 Jan 2020 21:04:53 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C4BB7C447A9; Tue,  7 Jan 2020 21:04:49 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from eberman-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: eberman)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0159DC447A4;
        Tue,  7 Jan 2020 21:04:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0159DC447A4
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=eberman@codeaurora.org
From:   Elliot Berman <eberman@codeaurora.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>, agross@kernel.org,
        swboyd@chromium.org, Stephan Gerhold <stephan@gerhold.net>
Cc:     Elliot Berman <eberman@codeaurora.org>,
        saiprakash.ranjan@codeaurora.org, tsoni@codeaurora.org,
        sidgup@codeaurora.org, psodagud@codeaurora.org,
        Brian Masney <masneyb@onstation.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 14/17] firmware: qcom_scm-32: Add device argument to atomic calls
Date:   Tue,  7 Jan 2020 13:04:23 -0800
Message-Id: <1578431066-19600-15-git-send-email-eberman@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1578431066-19600-1-git-send-email-eberman@codeaurora.org>
References: <1578431066-19600-1-git-send-email-eberman@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add unused "device" parameter to reduce merge friction between SMCCC and
legacy based conventions in an upcoming patch.

Change-Id: Ie31b220d751ae08430b3e89d41de0217e5213435
Tested-by: Brian Masney <masneyb@onstation.org> # arm32
Tested-by: Stephan Gerhold <stephan@gerhold.net>
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
