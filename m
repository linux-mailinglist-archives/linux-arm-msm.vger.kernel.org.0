Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51C01F9C18
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2019 22:23:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727603AbfKLVXl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Nov 2019 16:23:41 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:39702 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727614AbfKLVXl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Nov 2019 16:23:41 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 7065D60591; Tue, 12 Nov 2019 21:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573593818;
        bh=UNt2o5b21usfutEFdS4JXMNpEaVTvTzueKnWUHOi/rk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gwR1k3UJe3ASnUxrK0K98KEIfRs/qf8Hfb3mPNhgF+PvBs1f0flbni9UtSravfcMj
         x5zgZFKhXWVUYGAFIlkr7WonXmHsv2I4zzYZQfRGy+1i6vTUox0vHfDeGZOq1BTdfZ
         vYtlEiguIvjrf/KzIrqD9hFRV7g/vonCnC9MFDvE=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E66A860E75;
        Tue, 12 Nov 2019 21:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573593802;
        bh=UNt2o5b21usfutEFdS4JXMNpEaVTvTzueKnWUHOi/rk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=T8mOurHCGQpGUWmHNfytBHJzfpCLReSS9G1Jk7iqALeebfR9ETMRyb77RB0OnKudw
         0rikoJ5yJ+z46SN0ltAAbutSWQYIaikAji1y+eHY8BIT+wHvHlhT1P9BsvQzm6bpL2
         qZP5tGlM5Qk/ng09R7Cd2uiJ9DHmG90lYdnJSu2Y=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E66A860E75
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=eberman@codeaurora.org
From:   Elliot Berman <eberman@codeaurora.org>
To:     bjorn.andersson@linaro.org, saiprakash.ranjan@codeaurora.org,
        agross@kernel.org, swboyd@chromium.org
Cc:     Elliot Berman <eberman@codeaurora.org>, tsoni@codeaurora.org,
        sidgup@codeaurora.org, psodagud@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 18/18] firmware: qcom_scm: Order functions, definitions by service/command
Date:   Tue, 12 Nov 2019 13:22:54 -0800
Message-Id: <1573593774-12539-19-git-send-email-eberman@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573593774-12539-1-git-send-email-eberman@codeaurora.org>
References: <1573593774-12539-1-git-send-email-eberman@codeaurora.org>
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
 drivers/firmware/qcom_scm.c | 524 ++++++++++++++++++++++----------------------
 drivers/firmware/qcom_scm.h |  54 +++--
 include/linux/qcom_scm.h    |  97 ++++----
 3 files changed, 344 insertions(+), 331 deletions(-)

diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
index b122fa7..f953f3c 100644
--- a/drivers/firmware/qcom_scm.c
+++ b/drivers/firmware/qcom_scm.c
@@ -37,19 +37,6 @@ struct qcom_scm {
 	u64 dload_mode_addr;
 };
 
-struct qcom_scm_current_perm_info {
-	__le32 vmid;
-	__le32 perm;
-	__le64 ctx;
-	__le32 ctx_size;
-	__le32 unused;
-};
-
-struct qcom_scm_mem_map_info {
-	__le64 mem_addr;
-	__le64 mem_size;
-};
-
 static struct qcom_scm *__scm;
 
 static int qcom_scm_clk_enable(void)
@@ -166,36 +153,6 @@ static int qcom_scm_call_atomic(struct device *dev, struct qcom_scm_desc *desc)
 	}
 }
 
-static int __qcom_scm_is_call_available(struct device *dev, u32 svc_id,
-					u32 cmd_id)
-{
-	int ret;
-	struct qcom_scm_desc desc = {
-		.svc = QCOM_SCM_SVC_INFO,
-		.cmd = QCOM_SCM_INFO_IS_CALL_AVAIL,
-		.owner = ARM_SMCCC_OWNER_SIP,
-	};
-
-	desc.arginfo = QCOM_SCM_ARGS(1);
-	switch (__get_convention()) {
-	case SMC_CONVENTION_ARM_32:
-	case SMC_CONVENTION_ARM_64:
-		desc.args[0] = SMCCC_FUNCNUM(svc_id, cmd_id) |
-				(ARM_SMCCC_OWNER_SIP << ARM_SMCCC_OWNER_SHIFT);
-		break;
-	case SMC_CONVENTION_LEGACY:
-		desc.args[0] = LEGACY_FUNCNUM(svc_id, cmd_id);
-		break;
-	default:
-		pr_err("Unknown SMC convention being used\n");
-		return -EINVAL;
-	}
-
-	ret = qcom_scm_call(dev, &desc);
-
-	return ret ? : desc.result[0];
-}
-
 #define QCOM_SCM_FLAG_COLDBOOT_CPU0	0x00
 #define QCOM_SCM_FLAG_COLDBOOT_CPU1	0x01
 #define QCOM_SCM_FLAG_COLDBOOT_CPU2	0x08
@@ -306,6 +263,8 @@ int qcom_scm_set_warm_boot_addr(void *entry, const cpumask_t *cpus)
 }
 EXPORT_SYMBOL(qcom_scm_set_warm_boot_addr);
 
+#define QCOM_SCM_FLUSH_FLAG_MASK		0x03
+
 /**
  * qcom_scm_cpu_power_down() - Power down the cpu
  * @flags - Flags to flush cache
@@ -328,101 +287,61 @@ void qcom_scm_cpu_power_down(u32 flags)
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
+int qcom_scm_set_remote_state(u32 state, u32 id)
 {
-	int ret;
 	struct qcom_scm_desc desc = {
-		.svc = QCOM_SCM_SVC_HDCP,
-		.cmd = QCOM_SCM_HDCP_INVOKE,
+		.svc = QCOM_SCM_SVC_BOOT,
+		.cmd = QCOM_SCM_BOOT_SET_REMOTE_STATE,
 		.owner = ARM_SMCCC_OWNER_SIP,
 	};
+	int ret;
 
-	if (req_cnt > QCOM_SCM_HDCP_MAX_REQ_CNT)
-		return -ERANGE;
-
-	ret = qcom_scm_clk_enable();
-	if (ret)
-		return ret;
-
-	desc.args[0] = req[0].addr;
-	desc.args[1] = req[0].val;
-	desc.args[2] = req[1].addr;
-	desc.args[3] = req[1].val;
-	desc.args[4] = req[2].addr;
-	desc.args[5] = req[2].val;
-	desc.args[6] = req[3].addr;
-	desc.args[7] = req[3].val;
-	desc.args[8] = req[4].addr;
-	desc.args[9] = req[4].val;
-	desc.arginfo = QCOM_SCM_ARGS(10);
+	desc.args[0] = state;
+	desc.args[1] = id;
+	desc.arginfo = QCOM_SCM_ARGS(2);
 
 	ret = qcom_scm_call(__scm->dev, &desc);
-	*resp = desc.result[0];
-
-	qcom_scm_clk_disable();
 
-	return ret;
+	return ret ? : desc.result[0];
 }
-EXPORT_SYMBOL(qcom_scm_hdcp_req);
+EXPORT_SYMBOL(qcom_scm_set_remote_state);
 
-/**
- * qcom_scm_pas_supported() - Check if the peripheral authentication service is
- *			      available for the given peripherial
- * @peripheral:	peripheral id
- *
- * Returns true if PAS is supported for this peripheral, otherwise false.
- */
-bool qcom_scm_pas_supported(u32 peripheral)
+static int __qcom_scm_set_dload_mode(struct device *dev, bool enable)
 {
-	int ret;
 	struct qcom_scm_desc desc = {
-		.svc = QCOM_SCM_SVC_PIL,
-		.cmd = QCOM_SCM_PIL_PAS_IS_SUPPORTED,
+		.svc = QCOM_SCM_SVC_BOOT,
+		.cmd = QCOM_SCM_BOOT_SET_DLOAD_MODE,
 		.owner = ARM_SMCCC_OWNER_SIP,
 	};
 
-	ret = __qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_PIL,
-					   QCOM_SCM_PIL_PAS_IS_SUPPORTED);
-	if (ret <= 0)
-		return false;
+	desc.args[0] = QCOM_SCM_BOOT_SET_DLOAD_MODE;
+	desc.args[1] = enable ? QCOM_SCM_BOOT_SET_DLOAD_MODE : 0;
+	desc.arginfo = QCOM_SCM_ARGS(2);
 
-	desc.args[0] = peripheral;
-	desc.arginfo = QCOM_SCM_ARGS(1);
+	return qcom_scm_call(__scm->dev, &desc);
+}
 
-	ret = qcom_scm_call(__scm->dev, &desc);
+static void qcom_scm_set_download_mode(bool enable)
+{
+	bool avail;
+	int ret = 0;
 
-	return ret ? false : !!desc.result[0];
+	avail = __qcom_scm_is_call_available(__scm->dev,
+					     QCOM_SCM_SVC_BOOT,
+					     QCOM_SCM_BOOT_SET_DLOAD_MODE);
+	if (avail) {
+		ret = __qcom_scm_set_dload_mode(__scm->dev, enable);
+	} else if (__scm->dload_mode_addr) {
+		ret = qcom_scm_io_writel(__scm->dload_mode_addr,
+					 enable ? QCOM_SCM_BOOT_SET_DLOAD_MODE : 0);
+	} else {
+		dev_err(__scm->dev,
+			"No available mechanism for setting download mode\n");
+	}
+
+	if (ret)
+		dev_err(__scm->dev, "failed to set download mode: %d\n", ret);
 }
-EXPORT_SYMBOL(qcom_scm_pas_supported);
 
 /**
  * qcom_scm_pas_init_image() - Initialize peripheral authentication service
@@ -569,6 +488,36 @@ int qcom_scm_pas_shutdown(u32 peripheral)
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
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_PIL,
+		.cmd = QCOM_SCM_PIL_PAS_IS_SUPPORTED,
+		.owner = ARM_SMCCC_OWNER_SIP,
+	};
+
+	ret = __qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_PIL,
+					   QCOM_SCM_PIL_PAS_IS_SUPPORTED);
+	if (ret <= 0)
+		return false;
+
+	desc.args[0] = peripheral;
+	desc.arginfo = QCOM_SCM_ARGS(1);
+
+	ret = qcom_scm_call(__scm->dev, &desc);
+
+	return ret ? false : !!desc.result[0];
+}
+EXPORT_SYMBOL(qcom_scm_pas_supported);
+
 static int __qcom_scm_pas_mss_reset(struct device *dev, bool reset)
 {
 	struct qcom_scm_desc desc = {
@@ -610,6 +559,72 @@ static const struct reset_control_ops qcom_scm_pas_reset_ops = {
 	.deassert = qcom_scm_pas_reset_deassert,
 };
 
+int qcom_scm_io_readl(phys_addr_t addr, unsigned int *val)
+{
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_IO,
+		.cmd = QCOM_SCM_IO_READ,
+		.owner = ARM_SMCCC_OWNER_SIP,
+	};
+	int ret;
+
+	desc.args[0] = addr;
+	desc.arginfo = QCOM_SCM_ARGS(1);
+
+	ret = qcom_scm_call(__scm->dev, &desc);
+	if (ret >= 0)
+		*val = desc.result[0];
+
+	return ret < 0 ? ret : 0;
+}
+EXPORT_SYMBOL(qcom_scm_io_readl);
+
+int qcom_scm_io_writel(phys_addr_t addr, unsigned int val)
+{
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_IO,
+		.cmd = QCOM_SCM_IO_WRITE,
+		.owner = ARM_SMCCC_OWNER_SIP,
+	};
+
+	desc.args[0] = addr;
+	desc.args[1] = val;
+	desc.arginfo = QCOM_SCM_ARGS(2);
+
+	return qcom_scm_call(__scm->dev, &desc);
+}
+EXPORT_SYMBOL(qcom_scm_io_writel);
+
+static int __qcom_scm_is_call_available(struct device *dev, u32 svc_id,
+					u32 cmd_id)
+{
+	int ret;
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_INFO,
+		.cmd = QCOM_SCM_INFO_IS_CALL_AVAIL,
+		.owner = ARM_SMCCC_OWNER_SIP,
+	};
+
+	desc.arginfo = QCOM_SCM_ARGS(1);
+	switch (__get_convention()) {
+	case SMC_CONVENTION_ARM_32:
+	case SMC_CONVENTION_ARM_64:
+		desc.args[0] = SMCCC_FUNCNUM(svc_id, cmd_id) |
+				(ARM_SMCCC_OWNER_SIP << ARM_SMCCC_OWNER_SHIFT);
+		break;
+	case SMC_CONVENTION_LEGACY:
+		desc.args[0] = LEGACY_FUNCNUM(svc_id, cmd_id);
+		break;
+	default:
+		pr_err("Unknown SMC convention being used\n");
+		return -EINVAL;
+	}
+
+	ret = qcom_scm_call(dev, &desc);
+
+	return ret ? : desc.result[0];
+}
+
 int qcom_scm_restore_sec_cfg(u32 device_id, u32 spare)
 {
 	struct qcom_scm_desc desc = {
@@ -675,148 +690,18 @@ int qcom_scm_iommu_secure_ptbl_init(u64 addr, u32 size, u32 spare)
 }
 EXPORT_SYMBOL(qcom_scm_iommu_secure_ptbl_init);
 
-int qcom_scm_qsmmu500_wait_safe_toggle(bool en)
-{
-	struct qcom_scm_desc desc = {
-		.svc = QCOM_SCM_SVC_SMMU_PROGRAM,
-		.cmd = QCOM_SCM_SMMU_CONFIG_ERRATA1,
-		.owner = ARM_SMCCC_OWNER_SIP,
-	};
-
-	desc.args[0] = QCOM_SCM_SMMU_CONFIG_ERRATA1_CLIENT_ALL;
-	desc.args[1] = en;
-	desc.arginfo = QCOM_SCM_ARGS(2);
-
-	return qcom_scm_call_atomic(__scm->dev, &desc);
-}
-EXPORT_SYMBOL(qcom_scm_qsmmu500_wait_safe_toggle);
-
-int qcom_scm_io_readl(phys_addr_t addr, unsigned int *val)
-{
-	struct qcom_scm_desc desc = {
-		.svc = QCOM_SCM_SVC_IO,
-		.cmd = QCOM_SCM_IO_READ,
-		.owner = ARM_SMCCC_OWNER_SIP,
-	};
-	int ret;
-
-	desc.args[0] = addr;
-	desc.arginfo = QCOM_SCM_ARGS(1);
-
-	ret = qcom_scm_call(__scm->dev, &desc);
-	if (ret >= 0)
-		*val = desc.result[0];
-
-	return ret < 0 ? ret : 0;
-}
-EXPORT_SYMBOL(qcom_scm_io_readl);
-
-int qcom_scm_io_writel(phys_addr_t addr, unsigned int val)
-{
-	struct qcom_scm_desc desc = {
-		.svc = QCOM_SCM_SVC_IO,
-		.cmd = QCOM_SCM_IO_WRITE,
-		.owner = ARM_SMCCC_OWNER_SIP,
-	};
-
-	desc.args[0] = addr;
-	desc.args[1] = val;
-	desc.arginfo = QCOM_SCM_ARGS(2);
-
-	return qcom_scm_call(__scm->dev, &desc);
-}
-EXPORT_SYMBOL(qcom_scm_io_writel);
-
-static int __qcom_scm_set_dload_mode(struct device *dev, bool enable)
-{
-	struct qcom_scm_desc desc = {
-		.svc = QCOM_SCM_SVC_BOOT,
-		.cmd = QCOM_SCM_BOOT_SET_DLOAD_MODE,
-		.owner = ARM_SMCCC_OWNER_SIP,
-	};
-
-	desc.args[0] = QCOM_SCM_BOOT_SET_DLOAD_MODE;
-	desc.args[1] = enable ? QCOM_SCM_BOOT_SET_DLOAD_MODE : 0;
-	desc.arginfo = QCOM_SCM_ARGS(2);
-
-	return qcom_scm_call(__scm->dev, &desc);
-}
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
-		ret = qcom_scm_io_writel(__scm->dload_mode_addr,
-				enable ? QCOM_SCM_BOOT_SET_DLOAD_MODE : 0);
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
-	struct qcom_scm_desc desc = {
-		.svc = QCOM_SCM_SVC_BOOT,
-		.cmd = QCOM_SCM_BOOT_SET_REMOTE_STATE,
-		.owner = ARM_SMCCC_OWNER_SIP,
-	};
-	int ret;
-
-	desc.args[0] = state;
-	desc.args[1] = id;
-	desc.arginfo = QCOM_SCM_ARGS(2);
-
-	ret = qcom_scm_call(__scm->dev, &desc);
+struct qcom_scm_current_perm_info {
+	__le32 vmid;
+	__le32 perm;
+	__le64 ctx;
+	__le32 ctx_size;
+	__le32 unused;
+};
 
-	return ret ? : desc.result[0];
-}
-EXPORT_SYMBOL(qcom_scm_set_remote_state);
+struct qcom_scm_mem_map_info {
+	__le64 mem_addr;
+	__le64 mem_size;
+};
 
 static int __qcom_scm_assign_mem(struct device *dev, phys_addr_t mem_region,
 				 size_t mem_sz, phys_addr_t src, size_t src_sz,
@@ -928,6 +813,125 @@ int qcom_scm_assign_mem(phys_addr_t mem_addr, size_t mem_sz,
 }
 EXPORT_SYMBOL(qcom_scm_assign_mem);
 
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
+	int ret;
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_HDCP,
+		.cmd = QCOM_SCM_HDCP_INVOKE,
+		.owner = ARM_SMCCC_OWNER_SIP,
+	};
+
+	if (req_cnt > QCOM_SCM_HDCP_MAX_REQ_CNT)
+		return -ERANGE;
+
+	ret = qcom_scm_clk_enable();
+	if (ret)
+		return ret;
+
+	desc.args[0] = req[0].addr;
+	desc.args[1] = req[0].val;
+	desc.args[2] = req[1].addr;
+	desc.args[3] = req[1].val;
+	desc.args[4] = req[2].addr;
+	desc.args[5] = req[2].val;
+	desc.args[6] = req[3].addr;
+	desc.args[7] = req[3].val;
+	desc.args[8] = req[4].addr;
+	desc.args[9] = req[4].val;
+	desc.arginfo = QCOM_SCM_ARGS(10);
+
+	ret = qcom_scm_call(__scm->dev, &desc);
+	*resp = desc.result[0];
+
+	
+	qcom_scm_clk_disable();
+
+	return ret;
+}
+EXPORT_SYMBOL(qcom_scm_hdcp_req);
+
+#define QCOM_SCM_SMMU_CONFIG_ERRATA1_CLIENT_ALL	0x02
+int qcom_scm_qsmmu500_wait_safe_toggle(bool en)
+{
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_SMMU_PROGRAM,
+		.cmd = QCOM_SCM_SMMU_CONFIG_ERRATA1,
+		.owner = ARM_SMCCC_OWNER_SIP,
+	};
+
+	desc.args[0] = QCOM_SCM_SMMU_CONFIG_ERRATA1_CLIENT_ALL;
+	desc.args[1] = en;
+	desc.arginfo = QCOM_SCM_ARGS(2);
+
+	return qcom_scm_call_atomic(__scm->dev, &desc);
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
index 9252498..dda7354 100644
--- a/drivers/firmware/qcom_scm.h
+++ b/drivers/firmware/qcom_scm.h
@@ -62,31 +62,38 @@ extern int qcom_scm_call_legacy_atomic(struct device *dev,
 				       struct qcom_scm_desc *desc);
 extern int qcom_scm_call_legacy(struct device *dev, struct qcom_scm_desc *desc);
 
-#define QCOM_SCM_SVC_BOOT		0x1
-#define QCOM_SCM_BOOT_SET_ADDR		0x1
+#define QCOM_SCM_SVC_BOOT			0x01
+#define QCOM_SCM_BOOT_SET_ADDR			0x01
+#define QCOM_SCM_BOOT_TERMINATE_PC		0x02
+#define QCOM_SCM_BOOT_SET_REMOTE_STATE		0x0a
 #define QCOM_SCM_BOOT_SET_DLOAD_MODE		0x10
-#define QCOM_SCM_BOOT_SET_REMOTE_STATE	0xa
 
-#define QCOM_SCM_BOOT_TERMINATE_PC	0x2
-#define QCOM_SCM_FLUSH_FLAG_MASK	0x3
+#define QCOM_SCM_SVC_PIL			0x02
+#define QCOM_SCM_PIL_PAS_INIT_IMAGE		0x01
+#define QCOM_SCM_PIL_PAS_MEM_SETUP		0x02
+#define QCOM_SCM_PIL_PAS_AUTH_AND_RESET		0x05
+#define QCOM_SCM_PIL_PAS_SHUTDOWN		0x06
+#define QCOM_SCM_PIL_PAS_IS_SUPPORTED		0x07
+#define QCOM_SCM_PIL_PAS_MSS_RESET		0x0a
 
-#define QCOM_SCM_SVC_IO			0x5
-#define QCOM_SCM_IO_READ		0x1
-#define QCOM_SCM_IO_WRITE		0x2
+#define QCOM_SCM_SVC_IO				0x05
+#define QCOM_SCM_IO_READ			0x01
+#define QCOM_SCM_IO_WRITE			0x02
 
-#define QCOM_SCM_SVC_INFO		0x6
-#define QCOM_SCM_INFO_IS_CALL_AVAIL	0x1
+#define QCOM_SCM_SVC_INFO			0x06
+#define QCOM_SCM_INFO_IS_CALL_AVAIL		0x01
 
-#define QCOM_SCM_SVC_HDCP		0x11
-#define QCOM_SCM_HDCP_INVOKE		0x01
+#define QCOM_SCM_SVC_MP				0x0c
+#define QCOM_SCM_MP_RESTORE_SEC_CFG		0x02
+#define QCOM_SCM_MP_IOMMU_SECURE_PTBL_SIZE	0x03
+#define QCOM_SCM_MP_IOMMU_SECURE_PTBL_INIT	0x04
+#define QCOM_SCM_MP_ASSIGN			0x16
 
-#define QCOM_SCM_SVC_PIL		0x2
-#define QCOM_SCM_PIL_PAS_INIT_IMAGE	0x1
-#define QCOM_SCM_PIL_PAS_MEM_SETUP	0x2
-#define QCOM_SCM_PIL_PAS_AUTH_AND_RESET	0x5
-#define QCOM_SCM_PIL_PAS_SHUTDOWN	0x6
-#define QCOM_SCM_PIL_PAS_IS_SUPPORTED	0x7
-#define QCOM_SCM_PIL_PAS_MSS_RESET		0xa
+#define QCOM_SCM_SVC_HDCP			0x11
+#define QCOM_SCM_HDCP_INVOKE			0x01
+
+#define QCOM_SCM_SVC_SMMU_PROGRAM		0x15
+#define QCOM_SCM_SMMU_CONFIG_ERRATA1		0x03
 
 /* common error codes */
 #define QCOM_SCM_V2_EBUSY	-12
@@ -115,13 +122,4 @@ static inline int qcom_scm_remap_error(int err)
 	return -EINVAL;
 }
 
-#define QCOM_SCM_SVC_MP			0xc
-#define QCOM_SCM_MP_RESTORE_SEC_CFG	2
-#define QCOM_SCM_MP_IOMMU_SECURE_PTBL_SIZE	3
-#define QCOM_SCM_MP_IOMMU_SECURE_PTBL_INIT	4
-#define QCOM_SCM_SVC_SMMU_PROGRAM	0x15
-#define QCOM_SCM_SMMU_CONFIG_ERRATA1		0x3
-#define QCOM_SCM_SMMU_CONFIG_ERRATA1_CLIENT_ALL	0x2
-#define QCOM_SCM_MP_ASSIGN	0x16
-
 #endif
diff --git a/include/linux/qcom_scm.h b/include/linux/qcom_scm.h
index c52c591..a699759 100644
--- a/include/linux/qcom_scm.h
+++ b/include/linux/qcom_scm.h
@@ -1,5 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-/* Copyright (c) 2010-2015, 2018, The Linux Foundation. All rights reserved.
+/* Copyright (c) 2010-2015, 2018-2019 The Linux Foundation. All rights reserved.
  * Copyright (C) 2015 Linaro Ltd.
  */
 #ifndef __QCOM_SCM_H
@@ -35,69 +35,80 @@ struct qcom_scm_vmperm {
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
+extern bool qcom_scm_pas_supported(u32 peripheral);
+
+extern int qcom_scm_io_readl(phys_addr_t addr, unsigned int *val);
+extern int qcom_scm_io_writel(phys_addr_t addr, unsigned int val);
+
+extern int qcom_scm_restore_sec_cfg(u32 device_id, u32 spare);
+extern int qcom_scm_iommu_secure_ptbl_size(u32 spare, size_t *size);
+extern int qcom_scm_iommu_secure_ptbl_init(u64 addr, u32 size, u32 spare);
 extern int qcom_scm_assign_mem(phys_addr_t mem_addr, size_t mem_sz,
 			       unsigned int *src,
 			       const struct qcom_scm_vmperm *newvm,
 			       unsigned int dest_cnt);
-extern void qcom_scm_cpu_power_down(u32 flags);
-extern int qcom_scm_set_remote_state(u32 state, u32 id);
-extern int qcom_scm_restore_sec_cfg(u32 device_id, u32 spare);
-extern int qcom_scm_iommu_secure_ptbl_size(u32 spare, size_t *size);
-extern int qcom_scm_iommu_secure_ptbl_init(u64 addr, u32 size, u32 spare);
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

