Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D97EF11D644
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2019 19:51:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730693AbfLLSvZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Dec 2019 13:51:25 -0500
Received: from a27-187.smtp-out.us-west-2.amazonses.com ([54.240.27.187]:41150
        "EHLO a27-187.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730684AbfLLSvY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Dec 2019 13:51:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1576176683;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        bh=AuXBw5HRp7PbniKtYIiLPGmK102wGzaSApJ0LqgZBe4=;
        b=oJmcGMLV0WtJYbd0fFDH2dA3ALsJmWpyiJGdY5ePDC8t/i497pgyrgD1OTgn8nLV
        QlxcqM0VEs5C+yPZl99RQI26bR3Qn4ekTelVxzc/WtB0O7K4dKD0Bq3bNhPQtnoHK6F
        xVyH49jsBW3PoEnFJbfNmfco60vULc8ztQWvFLC0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1576176683;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:Feedback-ID;
        bh=AuXBw5HRp7PbniKtYIiLPGmK102wGzaSApJ0LqgZBe4=;
        b=E4bVcbkHIwtts8uAf33xauMATJfl4Fss+MMoZPBB3H1fLnT2UQ9vWsPGz3w1WiCu
        Oh7orvG1HAeyh5VGprGlMgZmLf3qicwuXaKIGCGjZiBCEClfy8S0TV+oeooYdHuKQjI
        CgBq0OS6Q2AvhGplA/qN5ZCweD4Fud7nS9yju2Aw=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 165F2C447B0
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=eberman@codeaurora.org
From:   Elliot Berman <eberman@codeaurora.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org, swboyd@chromium.org
Cc:     Elliot Berman <eberman@codeaurora.org>,
        saiprakash.ranjan@codeaurora.org, tsoni@codeaurora.org,
        sidgup@codeaurora.org, psodagud@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 15/17] firmware: qcom_scm: Order functions, definitions by service/command
Date:   Thu, 12 Dec 2019 18:51:23 +0000
Message-ID: <0101016efb7388fa-29f511eb-16b6-4903-ad46-225aaa9fa56d-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1576176651-17089-1-git-send-email-eberman@codeaurora.org>
References: <1576176651-17089-1-git-send-email-eberman@codeaurora.org>
X-SES-Outgoing: 2019.12.12-54.240.27.187
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Definitions throughout qcom_scm are loosely grouped and loosely ordered.
Sort all the functions/definitions by service ID/command ID to improve
sanity when needing to add new functionality to this driver.

Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Elliot Berman <eberman@codeaurora.org>
---
 drivers/firmware/qcom_scm.c | 376 ++++++++++++++++++++++----------------------
 drivers/firmware/qcom_scm.h | 120 +++++++-------
 include/linux/qcom_scm.h    | 111 +++++++------
 3 files changed, 309 insertions(+), 298 deletions(-)

diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
index 5efe729..5ba4c85 100644
--- a/drivers/firmware/qcom_scm.c
+++ b/drivers/firmware/qcom_scm.c
@@ -85,33 +85,33 @@ static void qcom_scm_clk_disable(void)
 }
 
 /**
- * qcom_scm_set_cold_boot_addr() - Set the cold boot address for cpus
+ * qcom_scm_set_warm_boot_addr() - Set the warm boot address for cpus
  * @entry: Entry point function for the cpus
  * @cpus: The cpumask of cpus that will use the entry point
  *
- * Set the cold boot address of the cpus. Any cpu outside the supported
- * range would be removed from the cpu present mask.
+ * Set the Linux entry point for the SCM to transfer control to when coming
+ * out of a power down. CPU power down may be executed on cpuidle or hotplug.
  */
-int qcom_scm_set_cold_boot_addr(void *entry, const cpumask_t *cpus)
+int qcom_scm_set_warm_boot_addr(void *entry, const cpumask_t *cpus)
 {
-	return __qcom_scm_set_cold_boot_addr(__scm ? __scm->dev : NULL, entry,
-					     cpus);
+	return __qcom_scm_set_warm_boot_addr(__scm->dev, entry, cpus);
 }
-EXPORT_SYMBOL(qcom_scm_set_cold_boot_addr);
+EXPORT_SYMBOL(qcom_scm_set_warm_boot_addr);
 
 /**
- * qcom_scm_set_warm_boot_addr() - Set the warm boot address for cpus
+ * qcom_scm_set_cold_boot_addr() - Set the cold boot address for cpus
  * @entry: Entry point function for the cpus
  * @cpus: The cpumask of cpus that will use the entry point
  *
- * Set the Linux entry point for the SCM to transfer control to when coming
- * out of a power down. CPU power down may be executed on cpuidle or hotplug.
+ * Set the cold boot address of the cpus. Any cpu outside the supported
+ * range would be removed from the cpu present mask.
  */
-int qcom_scm_set_warm_boot_addr(void *entry, const cpumask_t *cpus)
+int qcom_scm_set_cold_boot_addr(void *entry, const cpumask_t *cpus)
 {
-	return __qcom_scm_set_warm_boot_addr(__scm->dev, entry, cpus);
+	return __qcom_scm_set_cold_boot_addr(__scm ? __scm->dev : NULL, entry,
+					     cpus);
 }
-EXPORT_SYMBOL(qcom_scm_set_warm_boot_addr);
+EXPORT_SYMBOL(qcom_scm_set_cold_boot_addr);
 
 /**
  * qcom_scm_cpu_power_down() - Power down the cpu
@@ -127,107 +127,33 @@ void qcom_scm_cpu_power_down(u32 flags)
 }
 EXPORT_SYMBOL(qcom_scm_cpu_power_down);
 
-/**
- * qcom_scm_hdcp_available() - Check if secure environment supports HDCP.
- *
- * Return true if HDCP is supported, false if not.
- */
-bool qcom_scm_hdcp_available(void)
-{
-	int ret = qcom_scm_clk_enable();
-
-	if (ret)
-		return ret;
-
-	ret = __qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_HDCP,
-						QCOM_SCM_HDCP_INVOKE);
-
-	qcom_scm_clk_disable();
-
-	return ret > 0 ? true : false;
-}
-EXPORT_SYMBOL(qcom_scm_hdcp_available);
-
-/**
- * qcom_scm_hdcp_req() - Send HDCP request.
- * @req: HDCP request array
- * @req_cnt: HDCP request array count
- * @resp: response buffer passed to SCM
- *
- * Write HDCP register(s) through SCM.
- */
-int qcom_scm_hdcp_req(struct qcom_scm_hdcp_req *req, u32 req_cnt, u32 *resp)
-{
-	int ret = qcom_scm_clk_enable();
-
-	if (ret)
-		return ret;
-
-	ret = __qcom_scm_hdcp_req(__scm->dev, req, req_cnt, resp);
-	qcom_scm_clk_disable();
-	return ret;
-}
-EXPORT_SYMBOL(qcom_scm_hdcp_req);
-
-/**
- * qcom_scm_pas_supported() - Check if the peripheral authentication service is
- *			      available for the given peripherial
- * @peripheral:	peripheral id
- *
- * Returns true if PAS is supported for this peripheral, otherwise false.
- */
-bool qcom_scm_pas_supported(u32 peripheral)
+int qcom_scm_set_remote_state(u32 state, u32 id)
 {
-	int ret;
-
-	ret = __qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_PIL,
-					   QCOM_SCM_PIL_PAS_IS_SUPPORTED);
-	if (ret <= 0)
-		return false;
-
-	return __qcom_scm_pas_supported(__scm->dev, peripheral);
+	return __qcom_scm_set_remote_state(__scm->dev, state, id);
 }
-EXPORT_SYMBOL(qcom_scm_pas_supported);
+EXPORT_SYMBOL(qcom_scm_set_remote_state);
 
-/**
- * qcom_scm_ocmem_lock_available() - is OCMEM lock/unlock interface available
- */
-bool qcom_scm_ocmem_lock_available(void)
+static void qcom_scm_set_download_mode(bool enable)
 {
-	return __qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_OCMEM,
-					    QCOM_SCM_OCMEM_LOCK_CMD);
-}
-EXPORT_SYMBOL(qcom_scm_ocmem_lock_available);
+	bool avail;
+	int ret = 0;
 
-/**
- * qcom_scm_ocmem_lock() - call OCMEM lock interface to assign an OCMEM
- * region to the specified initiator
- *
- * @id:     tz initiator id
- * @offset: OCMEM offset
- * @size:   OCMEM size
- * @mode:   access mode (WIDE/NARROW)
- */
-int qcom_scm_ocmem_lock(enum qcom_scm_ocmem_client id, u32 offset, u32 size,
-			u32 mode)
-{
-	return __qcom_scm_ocmem_lock(__scm->dev, id, offset, size, mode);
-}
-EXPORT_SYMBOL(qcom_scm_ocmem_lock);
+	avail = __qcom_scm_is_call_available(__scm->dev,
+					     QCOM_SCM_SVC_BOOT,
+					     QCOM_SCM_BOOT_SET_DLOAD_MODE);
+	if (avail) {
+		ret = __qcom_scm_set_dload_mode(__scm->dev, enable);
+	} else if (__scm->dload_mode_addr) {
+		ret = __qcom_scm_io_writel(__scm->dev, __scm->dload_mode_addr,
+					   enable ? QCOM_SCM_BOOT_SET_DLOAD_MODE : 0);
+	} else {
+		dev_err(__scm->dev,
+			"No available mechanism for setting download mode\n");
+	}
 
-/**
- * qcom_scm_ocmem_unlock() - call OCMEM unlock interface to release an OCMEM
- * region from the specified initiator
- *
- * @id:     tz initiator id
- * @offset: OCMEM offset
- * @size:   OCMEM size
- */
-int qcom_scm_ocmem_unlock(enum qcom_scm_ocmem_client id, u32 offset, u32 size)
-{
-	return __qcom_scm_ocmem_unlock(__scm->dev, id, offset, size);
+	if (ret)
+		dev_err(__scm->dev, "failed to set download mode: %d\n", ret);
 }
-EXPORT_SYMBOL(qcom_scm_ocmem_unlock);
 
 /**
  * qcom_scm_pas_init_image() - Initialize peripheral authentication service
@@ -342,6 +268,26 @@ int qcom_scm_pas_shutdown(u32 peripheral)
 }
 EXPORT_SYMBOL(qcom_scm_pas_shutdown);
 
+/**
+ * qcom_scm_pas_supported() - Check if the peripheral authentication service is
+ *			      available for the given peripherial
+ * @peripheral:	peripheral id
+ *
+ * Returns true if PAS is supported for this peripheral, otherwise false.
+ */
+bool qcom_scm_pas_supported(u32 peripheral)
+{
+	int ret;
+
+	ret = __qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_PIL,
+					   QCOM_SCM_PIL_PAS_IS_SUPPORTED);
+	if (ret <= 0)
+		return false;
+
+	return __qcom_scm_pas_supported(__scm->dev, peripheral);
+}
+EXPORT_SYMBOL(qcom_scm_pas_supported);
+
 static int qcom_scm_pas_reset_assert(struct reset_controller_dev *rcdev,
 				     unsigned long idx)
 {
@@ -365,6 +311,18 @@ static const struct reset_control_ops qcom_scm_pas_reset_ops = {
 	.deassert = qcom_scm_pas_reset_deassert,
 };
 
+int qcom_scm_io_readl(phys_addr_t addr, unsigned int *val)
+{
+	return __qcom_scm_io_readl(__scm->dev, addr, val);
+}
+EXPORT_SYMBOL(qcom_scm_io_readl);
+
+int qcom_scm_io_writel(phys_addr_t addr, unsigned int val)
+{
+	return __qcom_scm_io_writel(__scm->dev, addr, val);
+}
+EXPORT_SYMBOL(qcom_scm_io_writel);
+
 /**
  * qcom_scm_restore_sec_cfg_available() - Check if secure environment
  * supports restore security config interface.
@@ -396,87 +354,6 @@ int qcom_scm_iommu_secure_ptbl_init(u64 addr, u32 size, u32 spare)
 }
 EXPORT_SYMBOL(qcom_scm_iommu_secure_ptbl_init);
 
-int qcom_scm_qsmmu500_wait_safe_toggle(bool en)
-{
-	return __qcom_scm_qsmmu500_wait_safe_toggle(__scm->dev, en);
-}
-EXPORT_SYMBOL(qcom_scm_qsmmu500_wait_safe_toggle);
-
-int qcom_scm_io_readl(phys_addr_t addr, unsigned int *val)
-{
-	return __qcom_scm_io_readl(__scm->dev, addr, val);
-}
-EXPORT_SYMBOL(qcom_scm_io_readl);
-
-int qcom_scm_io_writel(phys_addr_t addr, unsigned int val)
-{
-	return __qcom_scm_io_writel(__scm->dev, addr, val);
-}
-EXPORT_SYMBOL(qcom_scm_io_writel);
-
-static void qcom_scm_set_download_mode(bool enable)
-{
-	bool avail;
-	int ret = 0;
-
-	avail = __qcom_scm_is_call_available(__scm->dev,
-					     QCOM_SCM_SVC_BOOT,
-					     QCOM_SCM_BOOT_SET_DLOAD_MODE);
-	if (avail) {
-		ret = __qcom_scm_set_dload_mode(__scm->dev, enable);
-	} else if (__scm->dload_mode_addr) {
-		ret = __qcom_scm_io_writel(__scm->dev, __scm->dload_mode_addr,
-					   enable ? QCOM_SCM_BOOT_SET_DLOAD_MODE : 0);
-	} else {
-		dev_err(__scm->dev,
-			"No available mechanism for setting download mode\n");
-	}
-
-	if (ret)
-		dev_err(__scm->dev, "failed to set download mode: %d\n", ret);
-}
-
-static int qcom_scm_find_dload_address(struct device *dev, u64 *addr)
-{
-	struct device_node *tcsr;
-	struct device_node *np = dev->of_node;
-	struct resource res;
-	u32 offset;
-	int ret;
-
-	tcsr = of_parse_phandle(np, "qcom,dload-mode", 0);
-	if (!tcsr)
-		return 0;
-
-	ret = of_address_to_resource(tcsr, 0, &res);
-	of_node_put(tcsr);
-	if (ret)
-		return ret;
-
-	ret = of_property_read_u32_index(np, "qcom,dload-mode", 1, &offset);
-	if (ret < 0)
-		return ret;
-
-	*addr = res.start + offset;
-
-	return 0;
-}
-
-/**
- * qcom_scm_is_available() - Checks if SCM is available
- */
-bool qcom_scm_is_available(void)
-{
-	return !!__scm;
-}
-EXPORT_SYMBOL(qcom_scm_is_available);
-
-int qcom_scm_set_remote_state(u32 state, u32 id)
-{
-	return __qcom_scm_set_remote_state(__scm->dev, state, id);
-}
-EXPORT_SYMBOL(qcom_scm_set_remote_state);
-
 /**
  * qcom_scm_assign_mem() - Make a secure call to reassign memory ownership
  * @mem_addr: mem region whose ownership need to be reassigned
@@ -559,6 +436,129 @@ int qcom_scm_assign_mem(phys_addr_t mem_addr, size_t mem_sz,
 }
 EXPORT_SYMBOL(qcom_scm_assign_mem);
 
+/**
+ * qcom_scm_ocmem_lock_available() - is OCMEM lock/unlock interface available
+ */
+bool qcom_scm_ocmem_lock_available(void)
+{
+	return __qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_OCMEM,
+					    QCOM_SCM_OCMEM_LOCK_CMD);
+}
+EXPORT_SYMBOL(qcom_scm_ocmem_lock_available);
+
+/**
+ * qcom_scm_ocmem_lock() - call OCMEM lock interface to assign an OCMEM
+ * region to the specified initiator
+ *
+ * @id:     tz initiator id
+ * @offset: OCMEM offset
+ * @size:   OCMEM size
+ * @mode:   access mode (WIDE/NARROW)
+ */
+int qcom_scm_ocmem_lock(enum qcom_scm_ocmem_client id, u32 offset, u32 size,
+			u32 mode)
+{
+	return __qcom_scm_ocmem_lock(__scm->dev, id, offset, size, mode);
+}
+EXPORT_SYMBOL(qcom_scm_ocmem_lock);
+
+/**
+ * qcom_scm_ocmem_unlock() - call OCMEM unlock interface to release an OCMEM
+ * region from the specified initiator
+ *
+ * @id:     tz initiator id
+ * @offset: OCMEM offset
+ * @size:   OCMEM size
+ */
+int qcom_scm_ocmem_unlock(enum qcom_scm_ocmem_client id, u32 offset, u32 size)
+{
+	return __qcom_scm_ocmem_unlock(__scm->dev, id, offset, size);
+}
+EXPORT_SYMBOL(qcom_scm_ocmem_unlock);
+
+/**
+ * qcom_scm_hdcp_available() - Check if secure environment supports HDCP.
+ *
+ * Return true if HDCP is supported, false if not.
+ */
+bool qcom_scm_hdcp_available(void)
+{
+	int ret = qcom_scm_clk_enable();
+
+	if (ret)
+		return ret;
+
+	ret = __qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_HDCP,
+						QCOM_SCM_HDCP_INVOKE);
+
+	qcom_scm_clk_disable();
+
+	return ret > 0 ? true : false;
+}
+EXPORT_SYMBOL(qcom_scm_hdcp_available);
+
+/**
+ * qcom_scm_hdcp_req() - Send HDCP request.
+ * @req: HDCP request array
+ * @req_cnt: HDCP request array count
+ * @resp: response buffer passed to SCM
+ *
+ * Write HDCP register(s) through SCM.
+ */
+int qcom_scm_hdcp_req(struct qcom_scm_hdcp_req *req, u32 req_cnt, u32 *resp)
+{
+	int ret = qcom_scm_clk_enable();
+
+	if (ret)
+		return ret;
+
+	ret = __qcom_scm_hdcp_req(__scm->dev, req, req_cnt, resp);
+	qcom_scm_clk_disable();
+	return ret;
+}
+EXPORT_SYMBOL(qcom_scm_hdcp_req);
+
+int qcom_scm_qsmmu500_wait_safe_toggle(bool en)
+{
+	return __qcom_scm_qsmmu500_wait_safe_toggle(__scm->dev, en);
+}
+EXPORT_SYMBOL(qcom_scm_qsmmu500_wait_safe_toggle);
+
+static int qcom_scm_find_dload_address(struct device *dev, u64 *addr)
+{
+	struct device_node *tcsr;
+	struct device_node *np = dev->of_node;
+	struct resource res;
+	u32 offset;
+	int ret;
+
+	tcsr = of_parse_phandle(np, "qcom,dload-mode", 0);
+	if (!tcsr)
+		return 0;
+
+	ret = of_address_to_resource(tcsr, 0, &res);
+	of_node_put(tcsr);
+	if (ret)
+		return ret;
+
+	ret = of_property_read_u32_index(np, "qcom,dload-mode", 1, &offset);
+	if (ret < 0)
+		return ret;
+
+	*addr = res.start + offset;
+
+	return 0;
+}
+
+/**
+ * qcom_scm_is_available() - Checks if SCM is available
+ */
+bool qcom_scm_is_available(void)
+{
+	return !!__scm;
+}
+EXPORT_SYMBOL(qcom_scm_is_available);
+
 static int qcom_scm_probe(struct platform_device *pdev)
 {
 	struct qcom_scm *scm;
diff --git a/drivers/firmware/qcom_scm.h b/drivers/firmware/qcom_scm.h
index a022556..56ace3b 100644
--- a/drivers/firmware/qcom_scm.h
+++ b/drivers/firmware/qcom_scm.h
@@ -4,64 +4,83 @@
 #ifndef __QCOM_SCM_INT_H
 #define __QCOM_SCM_INT_H
 
-#define QCOM_SCM_SVC_BOOT		0x1
-#define QCOM_SCM_BOOT_SET_ADDR		0x1
-#define QCOM_SCM_BOOT_SET_DLOAD_MODE		0x10
-#define QCOM_SCM_BOOT_SET_REMOTE_STATE	0xa
-extern int __qcom_scm_set_remote_state(struct device *dev, u32 state, u32 id);
-extern int __qcom_scm_set_dload_mode(struct device *dev, bool enable);
-
+#define QCOM_SCM_SVC_BOOT		0x01
+#define QCOM_SCM_BOOT_SET_ADDR		0x01
+#define QCOM_SCM_BOOT_TERMINATE_PC	0x02
+#define QCOM_SCM_BOOT_SET_DLOAD_MODE	0x10
+#define QCOM_SCM_BOOT_SET_REMOTE_STATE	0x0a
 extern int __qcom_scm_set_warm_boot_addr(struct device *dev, void *entry,
 		const cpumask_t *cpus);
 extern int __qcom_scm_set_cold_boot_addr(struct device *dev, void *entry,
 		const cpumask_t *cpus);
-
-#define QCOM_SCM_BOOT_TERMINATE_PC	0x2
-#define QCOM_SCM_FLUSH_FLAG_MASK	0x3
 extern void __qcom_scm_cpu_power_down(struct device *dev, u32 flags);
+extern int __qcom_scm_set_remote_state(struct device *dev, u32 state, u32 id);
+extern int __qcom_scm_set_dload_mode(struct device *dev, bool enable);
+#define QCOM_SCM_FLUSH_FLAG_MASK	0x3
+
+#define QCOM_SCM_SVC_PIL		0x02
+#define QCOM_SCM_PIL_PAS_INIT_IMAGE	0x01
+#define QCOM_SCM_PIL_PAS_MEM_SETUP	0x02
+#define QCOM_SCM_PIL_PAS_AUTH_AND_RESET	0x05
+#define QCOM_SCM_PIL_PAS_SHUTDOWN	0x06
+#define QCOM_SCM_PIL_PAS_IS_SUPPORTED	0x07
+#define QCOM_SCM_PIL_PAS_MSS_RESET	0x0a
+extern bool __qcom_scm_pas_supported(struct device *dev, u32 peripheral);
+extern int  __qcom_scm_pas_init_image(struct device *dev, u32 peripheral,
+		dma_addr_t metadata_phys);
+extern int  __qcom_scm_pas_mem_setup(struct device *dev, u32 peripheral,
+		phys_addr_t addr, phys_addr_t size);
+extern int  __qcom_scm_pas_auth_and_reset(struct device *dev, u32 peripheral);
+extern int  __qcom_scm_pas_shutdown(struct device *dev, u32 peripheral);
+extern int  __qcom_scm_pas_mss_reset(struct device *dev, bool reset);
 
-#define QCOM_SCM_SVC_IO			0x5
-#define QCOM_SCM_IO_READ		0x1
-#define QCOM_SCM_IO_WRITE		0x2
+#define QCOM_SCM_SVC_IO			0x05
+#define QCOM_SCM_IO_READ		0x01
+#define QCOM_SCM_IO_WRITE		0x02
 extern int __qcom_scm_io_readl(struct device *dev, phys_addr_t addr, unsigned int *val);
 extern int __qcom_scm_io_writel(struct device *dev, phys_addr_t addr, unsigned int val);
 
-#define QCOM_SCM_SVC_INFO		0x6
-#define QCOM_SCM_INFO_IS_CALL_AVAIL	0x1
+#define QCOM_SCM_SVC_INFO		0x06
+#define QCOM_SCM_INFO_IS_CALL_AVAIL	0x01
 extern int __qcom_scm_is_call_available(struct device *dev, u32 svc_id,
 		u32 cmd_id);
 
-#define QCOM_SCM_SVC_HDCP		0x11
-#define QCOM_SCM_HDCP_INVOKE		0x01
-extern int __qcom_scm_hdcp_req(struct device *dev,
-		struct qcom_scm_hdcp_req *req, u32 req_cnt, u32 *resp);
-
-extern void __qcom_scm_init(void);
-
-#define QCOM_SCM_SVC_OCMEM			0xf
-#define QCOM_SCM_OCMEM_LOCK_CMD		0x1
-#define QCOM_SCM_OCMEM_UNLOCK_CMD		0x2
+#define QCOM_SCM_SVC_MP				0x0c
+#define QCOM_SCM_MP_RESTORE_SEC_CFG		0x02
+#define QCOM_SCM_MP_IOMMU_SECURE_PTBL_SIZE	0x03
+#define QCOM_SCM_MP_IOMMU_SECURE_PTBL_INIT	0x04
+#define QCOM_SCM_MP_ASSIGN			0x16
+extern int __qcom_scm_restore_sec_cfg(struct device *dev, u32 device_id,
+				      u32 spare);
+extern int __qcom_scm_iommu_secure_ptbl_size(struct device *dev, u32 spare,
+					     size_t *size);
+extern int __qcom_scm_iommu_secure_ptbl_init(struct device *dev, u64 addr,
+					     u32 size, u32 spare);
+extern int  __qcom_scm_assign_mem(struct device *dev,
+				  phys_addr_t mem_region, size_t mem_sz,
+				  phys_addr_t src, size_t src_sz,
+				  phys_addr_t dest, size_t dest_sz);
 
+#define QCOM_SCM_SVC_OCMEM		0x0f
+#define QCOM_SCM_OCMEM_LOCK_CMD		0x01
+#define QCOM_SCM_OCMEM_UNLOCK_CMD	0x02
 extern int __qcom_scm_ocmem_lock(struct device *dev, u32 id, u32 offset,
 				 u32 size, u32 mode);
 extern int __qcom_scm_ocmem_unlock(struct device *dev, u32 id, u32 offset,
 				   u32 size);
 
-#define QCOM_SCM_SVC_PIL		0x2
-#define QCOM_SCM_PIL_PAS_INIT_IMAGE	0x1
-#define QCOM_SCM_PIL_PAS_MEM_SETUP	0x2
-#define QCOM_SCM_PIL_PAS_AUTH_AND_RESET	0x5
-#define QCOM_SCM_PIL_PAS_SHUTDOWN	0x6
-#define QCOM_SCM_PIL_PAS_IS_SUPPORTED	0x7
-#define QCOM_SCM_PIL_PAS_MSS_RESET		0xa
-extern bool __qcom_scm_pas_supported(struct device *dev, u32 peripheral);
-extern int  __qcom_scm_pas_init_image(struct device *dev, u32 peripheral,
-		dma_addr_t metadata_phys);
-extern int  __qcom_scm_pas_mem_setup(struct device *dev, u32 peripheral,
-		phys_addr_t addr, phys_addr_t size);
-extern int  __qcom_scm_pas_auth_and_reset(struct device *dev, u32 peripheral);
-extern int  __qcom_scm_pas_shutdown(struct device *dev, u32 peripheral);
-extern int  __qcom_scm_pas_mss_reset(struct device *dev, bool reset);
+#define QCOM_SCM_SVC_HDCP		0x11
+#define QCOM_SCM_HDCP_INVOKE		0x01
+extern int __qcom_scm_hdcp_req(struct device *dev,
+		struct qcom_scm_hdcp_req *req, u32 req_cnt, u32 *resp);
+
+#define QCOM_SCM_SVC_SMMU_PROGRAM		0x15
+#define QCOM_SCM_SMMU_CONFIG_ERRATA1		0x03
+#define QCOM_SCM_SMMU_CONFIG_ERRATA1_CLIENT_ALL	0x02
+extern int __qcom_scm_qsmmu500_wait_safe_toggle(struct device *dev,
+						bool enable);
+
+extern void __qcom_scm_init(void);
 
 /* common error codes */
 #define QCOM_SCM_V2_EBUSY	-12
@@ -90,25 +109,4 @@ static inline int qcom_scm_remap_error(int err)
 	return -EINVAL;
 }
 
-#define QCOM_SCM_SVC_MP			0xc
-#define QCOM_SCM_MP_RESTORE_SEC_CFG	2
-extern int __qcom_scm_restore_sec_cfg(struct device *dev, u32 device_id,
-				      u32 spare);
-#define QCOM_SCM_MP_IOMMU_SECURE_PTBL_SIZE	3
-#define QCOM_SCM_MP_IOMMU_SECURE_PTBL_INIT	4
-#define QCOM_SCM_SVC_SMMU_PROGRAM	0x15
-#define QCOM_SCM_SMMU_CONFIG_ERRATA1		0x3
-#define QCOM_SCM_SMMU_CONFIG_ERRATA1_CLIENT_ALL	0x2
-extern int __qcom_scm_iommu_secure_ptbl_size(struct device *dev, u32 spare,
-					     size_t *size);
-extern int __qcom_scm_iommu_secure_ptbl_init(struct device *dev, u64 addr,
-					     u32 size, u32 spare);
-extern int __qcom_scm_qsmmu500_wait_safe_toggle(struct device *dev,
-						bool enable);
-#define QCOM_SCM_MP_ASSIGN	0x16
-extern int  __qcom_scm_assign_mem(struct device *dev,
-				  phys_addr_t mem_region, size_t mem_sz,
-				  phys_addr_t src, size_t src_sz,
-				  phys_addr_t dest, size_t dest_sz);
-
 #endif
diff --git a/include/linux/qcom_scm.h b/include/linux/qcom_scm.h
index 6fb23c5..e3e382f 100644
--- a/include/linux/qcom_scm.h
+++ b/include/linux/qcom_scm.h
@@ -1,5 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-/* Copyright (c) 2010-2015, 2018, The Linux Foundation. All rights reserved.
+/* Copyright (c) 2010-2015, 2018-2019 The Linux Foundation. All rights reserved.
  * Copyright (C) 2015 Linaro Ltd.
  */
 #ifndef __QCOM_SCM_H
@@ -55,75 +55,88 @@ enum qcom_scm_sec_dev_id {
 #define QCOM_SCM_PERM_RWX (QCOM_SCM_PERM_RW | QCOM_SCM_PERM_EXEC)
 
 #if IS_ENABLED(CONFIG_QCOM_SCM)
+extern bool qcom_scm_is_available(void);
+
 extern int qcom_scm_set_cold_boot_addr(void *entry, const cpumask_t *cpus);
 extern int qcom_scm_set_warm_boot_addr(void *entry, const cpumask_t *cpus);
-extern bool qcom_scm_is_available(void);
-extern bool qcom_scm_hdcp_available(void);
-extern int qcom_scm_hdcp_req(struct qcom_scm_hdcp_req *req, u32 req_cnt,
-			     u32 *resp);
-extern bool qcom_scm_ocmem_lock_available(void);
-extern int qcom_scm_ocmem_lock(enum qcom_scm_ocmem_client id, u32 offset,
-			       u32 size, u32 mode);
-extern int qcom_scm_ocmem_unlock(enum qcom_scm_ocmem_client id, u32 offset,
-				 u32 size);
-extern bool qcom_scm_pas_supported(u32 peripheral);
+extern void qcom_scm_cpu_power_down(u32 flags);
+extern int qcom_scm_set_remote_state(u32 state, u32 id);
+
 extern int qcom_scm_pas_init_image(u32 peripheral, const void *metadata,
 				   size_t size);
 extern int qcom_scm_pas_mem_setup(u32 peripheral, phys_addr_t addr,
 				  phys_addr_t size);
 extern int qcom_scm_pas_auth_and_reset(u32 peripheral);
 extern int qcom_scm_pas_shutdown(u32 peripheral);
-extern int qcom_scm_assign_mem(phys_addr_t mem_addr, size_t mem_sz,
-			       unsigned int *src,
-			       const struct qcom_scm_vmperm *newvm,
-			       unsigned int dest_cnt);
-extern void qcom_scm_cpu_power_down(u32 flags);
-extern int qcom_scm_set_remote_state(u32 state, u32 id);
+extern bool qcom_scm_pas_supported(u32 peripheral);
+
+extern int qcom_scm_io_readl(phys_addr_t addr, unsigned int *val);
+extern int qcom_scm_io_writel(phys_addr_t addr, unsigned int val);
+
 extern bool qcom_scm_restore_sec_cfg_available(void);
 extern int qcom_scm_restore_sec_cfg(u32 device_id, u32 spare);
 extern int qcom_scm_iommu_secure_ptbl_size(u32 spare, size_t *size);
 extern int qcom_scm_iommu_secure_ptbl_init(u64 addr, u32 size, u32 spare);
+extern int qcom_scm_assign_mem(phys_addr_t mem_addr, size_t mem_sz,
+			       unsigned int *src,
+			       const struct qcom_scm_vmperm *newvm,
+			       unsigned int dest_cnt);
+
+extern bool qcom_scm_ocmem_lock_available(void);
+extern int qcom_scm_ocmem_lock(enum qcom_scm_ocmem_client id, u32 offset,
+			       u32 size, u32 mode);
+extern int qcom_scm_ocmem_unlock(enum qcom_scm_ocmem_client id, u32 offset,
+				 u32 size);
+
+extern bool qcom_scm_hdcp_available(void);
+extern int qcom_scm_hdcp_req(struct qcom_scm_hdcp_req *req, u32 req_cnt,
+			     u32 *resp);
+
 extern int qcom_scm_qsmmu500_wait_safe_toggle(bool en);
-extern int qcom_scm_io_readl(phys_addr_t addr, unsigned int *val);
-extern int qcom_scm_io_writel(phys_addr_t addr, unsigned int val);
 #else
 
 #include <linux/errno.h>
 
-static inline
-int qcom_scm_set_cold_boot_addr(void *entry, const cpumask_t *cpus)
-{
-	return -ENODEV;
-}
-static inline
-int qcom_scm_set_warm_boot_addr(void *entry, const cpumask_t *cpus)
-{
-	return -ENODEV;
-}
 static inline bool qcom_scm_is_available(void) { return false; }
-static inline bool qcom_scm_hdcp_available(void) { return false; }
-static inline int qcom_scm_hdcp_req(struct qcom_scm_hdcp_req *req, u32 req_cnt,
-				    u32 *resp) { return -ENODEV; }
-static inline bool qcom_scm_pas_supported(u32 peripheral) { return false; }
+
+static inline int qcom_scm_set_cold_boot_addr(void *entry,
+		const cpumask_t *cpus) { return -ENODEV; }
+static inline int qcom_scm_set_warm_boot_addr(void *entry,
+		const cpumask_t *cpus) { return -ENODEV; }
+static inline void qcom_scm_cpu_power_down(u32 flags) {}
+static inline u32 qcom_scm_set_remote_state(u32 state,u32 id)
+		{ return -ENODEV; }
+
 static inline int qcom_scm_pas_init_image(u32 peripheral, const void *metadata,
-					  size_t size) { return -ENODEV; }
+		size_t size) { return -ENODEV; }
 static inline int qcom_scm_pas_mem_setup(u32 peripheral, phys_addr_t addr,
-					 phys_addr_t size) { return -ENODEV; }
-static inline int
-qcom_scm_pas_auth_and_reset(u32 peripheral) { return -ENODEV; }
+		phys_addr_t size) { return -ENODEV; }
+static inline int qcom_scm_pas_auth_and_reset(u32 peripheral)
+		{ return -ENODEV; }
 static inline int qcom_scm_pas_shutdown(u32 peripheral) { return -ENODEV; }
+static inline bool qcom_scm_pas_supported(u32 peripheral) { return false; }
+
+static inline int qcom_scm_io_readl(phys_addr_t addr, unsigned int *val)
+		{ return -ENODEV; }
+static inline int qcom_scm_io_writel(phys_addr_t addr, unsigned int val)
+		{ return -ENODEV; }
+
+static inline bool qcom_scm_restore_sec_cfg_available(void) { return false; }
+static inline int qcom_scm_restore_sec_cfg(u32 device_id, u32 spare)
+		{ return -ENODEV; }
+static inline int qcom_scm_iommu_secure_ptbl_size(u32 spare, size_t *size)
+		{ return -ENODEV; }
+static inline int qcom_scm_iommu_secure_ptbl_init(u64 addr, u32 size, u32 spare)
+		{ return -ENODEV; }
 static inline int qcom_scm_assign_mem(phys_addr_t mem_addr, size_t mem_sz,
-				      unsigned int *src,
-				      const struct qcom_scm_vmperm *newvm,
-				      unsigned int dest_cnt) { return -ENODEV; }
-static inline void qcom_scm_cpu_power_down(u32 flags) {}
-static inline u32
-qcom_scm_set_remote_state(u32 state,u32 id) { return -ENODEV; }
-static inline int qcom_scm_restore_sec_cfg(u32 device_id, u32 spare) { return -ENODEV; }
-static inline int qcom_scm_iommu_secure_ptbl_size(u32 spare, size_t *size) { return -ENODEV; }
-static inline int qcom_scm_iommu_secure_ptbl_init(u64 addr, u32 size, u32 spare) { return -ENODEV; }
-static inline int qcom_scm_qsmmu500_wait_safe_toggle(bool en) { return -ENODEV; }
-static inline int qcom_scm_io_readl(phys_addr_t addr, unsigned int *val) { return -ENODEV; }
-static inline int qcom_scm_io_writel(phys_addr_t addr, unsigned int val) { return -ENODEV; }
+		unsigned int *src, const struct qcom_scm_vmperm *newvm,
+		unsigned int dest_cnt) { return -ENODEV; }
+
+static inline bool qcom_scm_hdcp_available(void) { return false; }
+static inline int qcom_scm_hdcp_req(struct qcom_scm_hdcp_req *req, u32 req_cnt,
+		u32 *resp) { return -ENODEV; }
+
+static inline int qcom_scm_qsmmu500_wait_safe_toggle(bool en)
+		{ return -ENODEV; }
 #endif
 #endif
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

