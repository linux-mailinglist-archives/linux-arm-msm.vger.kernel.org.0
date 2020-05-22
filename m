Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3B5D1DE353
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2020 11:38:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729992AbgEVJiL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 May 2020 05:38:11 -0400
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198]:8679 "EHLO
        alexa-out-blr-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729580AbgEVJiK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 May 2020 05:38:10 -0400
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr-02.qualcomm.com with ESMTP/TLS/AES256-SHA; 22 May 2020 15:08:08 +0530
Received: from minint-dvc2thc.qualcomm.com (HELO sartgarg-linux.qualcomm.com) ([10.206.24.245])
  by ironmsg01-blr.qualcomm.com with ESMTP; 22 May 2020 15:08:08 +0530
Received: by sartgarg-linux.qualcomm.com (Postfix, from userid 2339771)
        id 35FD9179E; Fri, 22 May 2020 15:08:07 +0530 (IST)
From:   Sarthak Garg <sartgarg@codeaurora.org>
To:     adrian.hunter@intel.com, ulf.hansson@linaro.org
Cc:     vbadigan@codeaurora.org, stummala@codeaurora.org,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Sarthak Garg <sartgarg@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH V2 8/8] mmc: sdhci-msm: dump vendor specific registers during error
Date:   Fri, 22 May 2020 15:02:30 +0530
Message-Id: <1590139950-7288-9-git-send-email-sartgarg@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1590139950-7288-1-git-send-email-sartgarg@codeaurora.org>
References: <1588838535-6050-1-git-send-email-sartgarg@codeaurora.org>
 <1590139950-7288-1-git-send-email-sartgarg@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Implement dump_vendor_registers host operation to print the
vendor specific registers in addition to standard SDHC
register during error conditions.

Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>
Signed-off-by: Sarthak Garg <sartgarg@codeaurora.org>
Acked-by: Adrian Hunter <adrian.hunter@intel.com>
---
 drivers/mmc/host/sdhci-msm.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index 61cf0f1..95cd973 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -1874,6 +1874,36 @@ static void sdhci_msm_reset(struct sdhci_host *host, u8 mask)
 	sdhci_reset(host, mask);
 }
 
+#define DRIVER_NAME "sdhci_msm"
+#define SDHCI_MSM_DUMP(f, x...) \
+	pr_err("%s: " DRIVER_NAME ": " f, mmc_hostname(host->mmc), ## x)
+
+void sdhci_msm_dump_vendor_regs(struct sdhci_host *host)
+{
+	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
+	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
+	const struct sdhci_msm_offset *msm_offset = msm_host->offset;
+
+	SDHCI_MSM_DUMP("----------- VENDOR REGISTER DUMP -----------\n");
+
+	SDHCI_MSM_DUMP(
+			"DLL sts: 0x%08x | DLL cfg:  0x%08x | DLL cfg2: 0x%08x\n",
+		readl_relaxed(host->ioaddr + msm_offset->core_dll_status),
+		readl_relaxed(host->ioaddr + msm_offset->core_dll_config),
+		readl_relaxed(host->ioaddr + msm_offset->core_dll_config_2));
+	SDHCI_MSM_DUMP(
+			"DLL cfg3: 0x%08x | DLL usr ctl:  0x%08x | DDR cfg: 0x%08x\n",
+		readl_relaxed(host->ioaddr + msm_offset->core_dll_config_3),
+		readl_relaxed(host->ioaddr + msm_offset->core_dll_usr_ctl),
+		readl_relaxed(host->ioaddr + msm_offset->core_ddr_config));
+	SDHCI_MSM_DUMP(
+			"Vndr func: 0x%08x | Vndr func2 : 0x%08x Vndr func3: 0x%08x\n",
+		readl_relaxed(host->ioaddr + msm_offset->core_vendor_spec),
+		readl_relaxed(host->ioaddr +
+			msm_offset->core_vendor_spec_func2),
+		readl_relaxed(host->ioaddr + msm_offset->core_vendor_spec3));
+}
+
 static const struct sdhci_msm_variant_ops mci_var_ops = {
 	.msm_readl_relaxed = sdhci_msm_mci_variant_readl_relaxed,
 	.msm_writel_relaxed = sdhci_msm_mci_variant_writel_relaxed,
@@ -1929,6 +1959,7 @@ static const struct sdhci_ops sdhci_msm_ops = {
 	.write_w = sdhci_msm_writew,
 	.write_b = sdhci_msm_writeb,
 	.irq	= sdhci_msm_cqe_irq,
+	.dump_vendor_regs = sdhci_msm_dump_vendor_regs,
 };
 
 static const struct sdhci_pltfm_data sdhci_msm_pdata = {
-- 
2.7.4

