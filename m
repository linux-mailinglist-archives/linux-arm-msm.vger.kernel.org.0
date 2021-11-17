Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8DEF4540CF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Nov 2021 07:20:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231643AbhKQGXm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Nov 2021 01:23:42 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:42418 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230013AbhKQGXl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Nov 2021 01:23:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1637130044; x=1668666044;
  h=from:to:cc:subject:date:message-id;
  bh=cQC2gqTOt0M1biGbtCU4VCCPiigZPnUqscVbZwXu1Ds=;
  b=lH7TIFS0k5RdhW09jBPAwCd5ECV3gmWT47TxJOQXPORnLop7ls9pIMtr
   SsSBr5mCmZEvxbeoofxlLzlcQ0c2yB4GeR7kgcuSrqznh6owtTL6O2PAv
   fxdwtT5oh3uG0p7q+3ECxplmFNACsaW9ha4e1+GbR0eQKokwTM6g08sqH
   M=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 16 Nov 2021 22:20:44 -0800
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 16 Nov 2021 22:20:41 -0800
X-QCInternal: smtphost
Received: from c-sbhanu-linux.qualcomm.com ([10.242.50.201])
  by ironmsg01-blr.qualcomm.com with ESMTP; 17 Nov 2021 11:50:22 +0530
Received: by c-sbhanu-linux.qualcomm.com (Postfix, from userid 2344807)
        id 5B04E4C5C; Wed, 17 Nov 2021 11:50:20 +0530 (IST)
From:   Shaik Sajida Bhanu <quic_c_sbhanu@quicinc.com>
To:     adrian.hunter@intel.com, riteshh@codeaurora.org,
        asutoshd@quicinc.com, ulf.hansson@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, linux-mmc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     stummala@codeaurora.org, vbadigan@codeaurora.org,
        quic_rampraka@quicinc.com, quic_pragalla@quicinc.com,
        sartgarg@codeaurora.org, nitirawa@codeaurora.org,
        sayalil@codeaurora.org,
        Shaik Sajida Bhanu <quic_c_sbhanu@quicinc.com>
Subject: [PATCH V1] mmc: sdhci-msm: Add eMMC and SD card err_stat sysfs entry
Date:   Wed, 17 Nov 2021 11:50:12 +0530
Message-Id: <1637130012-21846-1-git-send-email-quic_c_sbhanu@quicinc.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add sysfs entry to query eMMC and SD card errors statistics.
This feature is useful for debug and testing.

Signed-off-by: Shaik Sajida Bhanu <quic_c_sbhanu@quicinc.com>
---
 drivers/mmc/host/cqhci.h     |   1 +
 drivers/mmc/host/sdhci-msm.c | 192 +++++++++++++++++++++++++++++++++++++++++++
 drivers/mmc/host/sdhci.c     |  17 ++++
 drivers/mmc/host/sdhci.h     |   1 +
 include/linux/mmc/host.h     |   1 +
 5 files changed, 212 insertions(+)

diff --git a/drivers/mmc/host/cqhci.h b/drivers/mmc/host/cqhci.h
index ba9387e..f72a1d6 100644
--- a/drivers/mmc/host/cqhci.h
+++ b/drivers/mmc/host/cqhci.h
@@ -286,6 +286,7 @@ struct cqhci_host_ops {
 				 u64 *data);
 	void (*pre_enable)(struct mmc_host *mmc);
 	void (*post_disable)(struct mmc_host *mmc);
+	void (*err_stats)(struct mmc_host *mmc, unsigned long flags);
 #ifdef CONFIG_MMC_CRYPTO
 	int (*program_key)(struct cqhci_host *cq_host,
 			   const union cqhci_crypto_cfg_entry *cfg, int slot);
diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index 50c71e0..e1dcd2d 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -242,6 +242,23 @@ struct sdhci_msm_variant_ops {
 			u32 offset);
 };
 
+enum {
+	MMC_ERR_CMD_TIMEOUT,
+	MMC_ERR_CMD_CRC,
+	MMC_ERR_DAT_TIMEOUT,
+	MMC_ERR_DAT_CRC,
+	MMC_ERR_AUTO_CMD,
+	MMC_ERR_ADMA,
+	MMC_ERR_TUNING,
+	MMC_ERR_CMDQ_RED,
+	MMC_ERR_CMDQ_GCE,
+	MMC_ERR_CMDQ_ICCE,
+	MMC_ERR_REQ_TIMEOUT,
+	MMC_ERR_CMDQ_REQ_TIMEOUT,
+	MMC_ERR_ICE_CFG,
+	MMC_ERR_MAX,
+};
+
 /*
  * From V5, register spaces have changed. Wrap this info in a structure
  * and choose the data_structure based on version info mentioned in DT.
@@ -285,6 +302,8 @@ struct sdhci_msm_host {
 	u32 dll_config;
 	u32 ddr_config;
 	bool vqmmc_enabled;
+	bool err_occurred;
+	u32  err_stats[MMC_ERR_MAX];
 };
 
 static const struct sdhci_msm_offset *sdhci_priv_msm_offset(struct sdhci_host *host)
@@ -2106,9 +2125,20 @@ static void sdhci_msm_set_timeout(struct sdhci_host *host, struct mmc_command *c
 		host->data_timeout = 22LL * NSEC_PER_SEC;
 }
 
+void sdhci_msm_cqe_err_stats(struct mmc_host *mmc, unsigned long flags)
+{
+	struct sdhci_host *host = mmc_priv(mmc);
+	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
+	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
+
+	if (flags & BIT(0))
+		msm_host->err_stats[MMC_ERR_CMDQ_REQ_TIMEOUT]++;
+}
+
 static const struct cqhci_host_ops sdhci_msm_cqhci_ops = {
 	.enable		= sdhci_msm_cqe_enable,
 	.disable	= sdhci_msm_cqe_disable,
+	.err_stats	= sdhci_msm_cqe_err_stats,
 #ifdef CONFIG_MMC_CRYPTO
 	.program_key	= sdhci_msm_program_key,
 #endif
@@ -2403,6 +2433,46 @@ static void sdhci_msm_dump_vendor_regs(struct sdhci_host *host)
 		readl_relaxed(host->ioaddr +
 			msm_offset->core_vendor_spec_func2),
 		readl_relaxed(host->ioaddr + msm_offset->core_vendor_spec3));
+	msm_host->err_occurred = true;
+}
+
+void sdhci_msm_err_stats(struct sdhci_host *host, u32 intmask)
+{
+	int command;
+	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
+	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
+
+	if (!msm_host->err_occurred)
+		msm_host->err_stats[MMC_ERR_CMD_TIMEOUT] = 0;
+
+	if (host && host->mmc && host->mmc->timer) {
+		msm_host->err_stats[MMC_ERR_REQ_TIMEOUT]++;
+		host->mmc->timer = false;
+	}
+
+	if (intmask & SDHCI_INT_CRC) {
+		command = SDHCI_GET_CMD(sdhci_readw(host, SDHCI_COMMAND));
+		if (command != MMC_SEND_TUNING_BLOCK ||
+		    command != MMC_SEND_TUNING_BLOCK_HS200)
+			msm_host->err_stats[MMC_ERR_CMD_CRC]++;
+	} else if ((intmask & SDHCI_INT_TIMEOUT) ||
+		(intmask & SDHCI_INT_DATA_TIMEOUT))
+		msm_host->err_stats[MMC_ERR_CMD_TIMEOUT]++;
+	else if (intmask & SDHCI_INT_DATA_CRC) {
+		command = SDHCI_GET_CMD(sdhci_readw(host, SDHCI_COMMAND));
+		if (command != MMC_SEND_TUNING_BLOCK ||
+		    command != MMC_SEND_TUNING_BLOCK_HS200)
+			msm_host->err_stats[MMC_ERR_DAT_CRC]++;
+	} else if (intmask & SDHCI_INT_DATA_TIMEOUT)
+		msm_host->err_stats[MMC_ERR_DAT_TIMEOUT]++;
+	else if (intmask & CQHCI_IS_RED)
+		msm_host->err_stats[MMC_ERR_CMDQ_RED]++;
+	else if (intmask & CQHCI_IS_GCE)
+		msm_host->err_stats[MMC_ERR_CMDQ_GCE]++;
+	else if (intmask & CQHCI_IS_ICCE)
+		msm_host->err_stats[MMC_ERR_CMDQ_ICCE]++;
+	else if (intmask & SDHCI_INT_ADMA_ERROR)
+		msm_host->err_stats[MMC_ERR_ADMA]++;
 }
 
 static const struct sdhci_msm_variant_ops mci_var_ops = {
@@ -2456,6 +2526,7 @@ static const struct sdhci_ops sdhci_msm_ops = {
 	.dump_vendor_regs = sdhci_msm_dump_vendor_regs,
 	.set_power = sdhci_set_power_noreg,
 	.set_timeout = sdhci_msm_set_timeout,
+	.err_stats = sdhci_msm_err_stats,
 };
 
 static const struct sdhci_pltfm_data sdhci_msm_pdata = {
@@ -2482,6 +2553,125 @@ static inline void sdhci_msm_get_of_property(struct platform_device *pdev,
 	of_property_read_u32(node, "qcom,dll-config", &msm_host->dll_config);
 }
 
+static ssize_t err_state_show(struct device *dev,
+			struct device_attribute *attr, char *buf)
+{
+	struct sdhci_host *host = dev_get_drvdata(dev);
+	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
+	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
+
+	if (!host || !host->mmc)
+		return -EINVAL;
+
+	return scnprintf(buf, PAGE_SIZE, "%d\n", !!msm_host->err_occurred);
+}
+
+static ssize_t err_state_store(struct device *dev,
+				struct device_attribute *attr,
+				const char *buf, size_t count)
+{
+	struct sdhci_host *host = dev_get_drvdata(dev);
+	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
+	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
+	unsigned int val;
+
+	if (kstrtouint(buf, 0, &val))
+		return -EINVAL;
+	if (!host || !host->mmc)
+		return -EINVAL;
+
+	msm_host->err_occurred = !!val;
+	if (!val)
+		memset(msm_host->err_stats, 0, sizeof(msm_host->err_stats));
+
+	return count;
+}
+static DEVICE_ATTR_RW(err_state);
+
+static ssize_t err_stats_show(struct device *dev,
+				struct device_attribute *attr, char *buf)
+{
+	struct sdhci_host *host = dev_get_drvdata(dev);
+	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
+	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
+	char tmp[100];
+
+	if (!host || !host->mmc)
+		return -EINVAL;
+
+	scnprintf(tmp, sizeof(tmp), "# Command Timeout Error: %d\n",
+		msm_host->err_stats[MMC_ERR_CMD_TIMEOUT]);
+	strlcpy(buf, tmp, PAGE_SIZE);
+
+	scnprintf(tmp, sizeof(tmp), "# Command CRC Error: %d\n",
+		msm_host->err_stats[MMC_ERR_CMD_CRC]);
+	strlcat(buf, tmp, PAGE_SIZE);
+
+	scnprintf(tmp, sizeof(tmp), "# Data Timeout Error: %d\n",
+		msm_host->err_stats[MMC_ERR_DAT_TIMEOUT]);
+	strlcat(buf, tmp, PAGE_SIZE);
+
+	scnprintf(tmp, sizeof(tmp), "# Data CRC Error: %d\n",
+		msm_host->err_stats[MMC_ERR_DAT_CRC]);
+	strlcat(buf, tmp, PAGE_SIZE);
+
+	scnprintf(tmp, sizeof(tmp), "# Auto-Cmd Error: %d\n",
+		msm_host->err_stats[MMC_ERR_ADMA]);
+	strlcat(buf, tmp, PAGE_SIZE);
+
+	scnprintf(tmp, sizeof(tmp), "# ADMA Error: %d\n",
+		msm_host->err_stats[MMC_ERR_ADMA]);
+	strlcat(buf, tmp, PAGE_SIZE);
+
+	scnprintf(tmp, sizeof(tmp), "# Tuning Error: %d\n",
+		msm_host->err_stats[MMC_ERR_TUNING]);
+	strlcat(buf, tmp, PAGE_SIZE);
+
+	scnprintf(tmp, sizeof(tmp), "# CMDQ RED Errors: %d\n",
+		msm_host->err_stats[MMC_ERR_CMDQ_RED]);
+	strlcat(buf, tmp, PAGE_SIZE);
+
+	scnprintf(tmp, sizeof(tmp), "# CMDQ GCE Errors: %d\n",
+		msm_host->err_stats[MMC_ERR_CMDQ_GCE]);
+	strlcat(buf, tmp, PAGE_SIZE);
+
+	scnprintf(tmp, sizeof(tmp), "# CMDQ ICCE Errors: %d\n",
+		msm_host->err_stats[MMC_ERR_CMDQ_ICCE]);
+	strlcat(buf, tmp, PAGE_SIZE);
+
+	scnprintf(tmp, sizeof(tmp), "# CMDQ Request Timedout: %d\n",
+		msm_host->err_stats[MMC_ERR_CMDQ_REQ_TIMEOUT]);
+	strlcat(buf, tmp, PAGE_SIZE);
+
+	scnprintf(tmp, sizeof(tmp), "# Request Timedout Error: %d\n",
+		msm_host->err_stats[MMC_ERR_REQ_TIMEOUT]);
+	strlcat(buf, tmp, PAGE_SIZE);
+
+	return strlen(buf);
+}
+static DEVICE_ATTR_RO(err_stats);
+
+static struct attribute *sdhci_msm_sysfs_attrs[] = {
+	&dev_attr_err_state.attr,
+	&dev_attr_err_stats.attr,
+	NULL
+};
+
+static const struct attribute_group sdhci_msm_sysfs_group = {
+	.name = "qcom",
+	.attrs = sdhci_msm_sysfs_attrs,
+};
+
+static int sdhci_msm_init_sysfs(struct platform_device *pdev)
+{
+	int ret;
+
+	ret = sysfs_create_group(&pdev->dev.kobj, &sdhci_msm_sysfs_group);
+	if (ret)
+		dev_err(&pdev->dev, "%s: Failed sdhci_msm sysfs group err=%d\n",
+			__func__, ret);
+	return ret;
+}
 
 static int sdhci_msm_probe(struct platform_device *pdev)
 {
@@ -2734,6 +2924,8 @@ static int sdhci_msm_probe(struct platform_device *pdev)
 	if (ret)
 		goto pm_runtime_disable;
 
+	sdhci_msm_init_sysfs(pdev);
+
 	pm_runtime_mark_last_busy(&pdev->dev);
 	pm_runtime_put_autosuspend(&pdev->dev);
 
diff --git a/drivers/mmc/host/sdhci.c b/drivers/mmc/host/sdhci.c
index 07c6da1..f82a3eff 100644
--- a/drivers/mmc/host/sdhci.c
+++ b/drivers/mmc/host/sdhci.c
@@ -3159,6 +3159,13 @@ static void sdhci_timeout_timer(struct timer_list *t)
 	spin_lock_irqsave(&host->lock, flags);
 
 	if (host->cmd && !sdhci_data_line_cmd(host->cmd)) {
+		if (host->ops->err_stats) {
+			u32 intmask;
+
+			host->mmc->timer = true;
+			intmask = sdhci_readl(host, SDHCI_INT_STATUS);
+			host->ops->err_stats(host, intmask);
+		}
 		pr_err("%s: Timeout waiting for hardware cmd interrupt.\n",
 		       mmc_hostname(host->mmc));
 		sdhci_dumpregs(host);
@@ -3181,6 +3188,13 @@ static void sdhci_timeout_data_timer(struct timer_list *t)
 
 	if (host->data || host->data_cmd ||
 	    (host->cmd && sdhci_data_line_cmd(host->cmd))) {
+		if (host->ops->err_stats) {
+			u32 intmask;
+
+			host->mmc->timer = true;
+			intmask = sdhci_readl(host, SDHCI_INT_STATUS);
+			host->ops->err_stats(host, intmask);
+		}
 		pr_err("%s: Timeout waiting for hardware interrupt.\n",
 		       mmc_hostname(host->mmc));
 		sdhci_dumpregs(host);
@@ -3466,6 +3480,9 @@ static irqreturn_t sdhci_irq(int irq, void *dev_id)
 	}
 
 	intmask = sdhci_readl(host, SDHCI_INT_STATUS);
+	if (host->ops->err_stats)
+		host->ops->err_stats(host, intmask);
+
 	if (!intmask || intmask == 0xffffffff) {
 		result = IRQ_NONE;
 		goto out;
diff --git a/drivers/mmc/host/sdhci.h b/drivers/mmc/host/sdhci.h
index d7929d7..a1546b3 100644
--- a/drivers/mmc/host/sdhci.h
+++ b/drivers/mmc/host/sdhci.h
@@ -658,6 +658,7 @@ struct sdhci_ops {
 	void	(*request_done)(struct sdhci_host *host,
 				struct mmc_request *mrq);
 	void    (*dump_vendor_regs)(struct sdhci_host *host);
+	void	(*err_stats)(struct sdhci_host *host, u32 intmask);
 };
 
 #ifdef CONFIG_MMC_SDHCI_IO_ACCESSORS
diff --git a/include/linux/mmc/host.h b/include/linux/mmc/host.h
index 7afb57c..33186ff 100644
--- a/include/linux/mmc/host.h
+++ b/include/linux/mmc/host.h
@@ -492,6 +492,7 @@ struct mmc_host {
 	int			cqe_qdepth;
 	bool			cqe_enabled;
 	bool			cqe_on;
+	bool                    timer;
 
 	/* Inline encryption support */
 #ifdef CONFIG_MMC_CRYPTO
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

