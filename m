Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A36E4143F8E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jan 2020 15:31:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729080AbgAUObc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Jan 2020 09:31:32 -0500
Received: from alexa-out-blr-01.qualcomm.com ([103.229.18.197]:65493 "EHLO
        alexa-out-blr-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728779AbgAUObc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Jan 2020 09:31:32 -0500
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by alexa-out-blr-01.qualcomm.com with ESMTP/TLS/AES256-SHA; 21 Jan 2020 20:01:28 +0530
Received: from c-sbhanu-linux.qualcomm.com ([10.242.50.201])
  by ironmsg02-blr.qualcomm.com with ESMTP; 21 Jan 2020 20:01:04 +0530
Received: by c-sbhanu-linux.qualcomm.com (Postfix, from userid 2344807)
        id 1964435B7; Tue, 21 Jan 2020 20:01:03 +0530 (IST)
From:   Shaik Sajida Bhanu <sbhanu@codeaurora.org>
To:     ulf.hansson@linaro.org, adrian.hunter@intel.com
Cc:     asutoshd@codeaurora.org, stummala@codeaurora.org,
        vbadigan@codeaurora.org, sayalil@codeaurora.org,
        cang@codeaurora.org, rampraka@codeaurora.org,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org,
        Shaik Sajida Bhanu <sbhanu@codeaurora.org>
Subject: [PATCH V1] mmc: sdhci-msm: Add system suspend/resume callbacks
Date:   Tue, 21 Jan 2020 20:00:22 +0530
Message-Id: <1579617022-13031-1-git-send-email-sbhanu@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add system suspend/resume callbacks to sdhci-msm platform driver.

Signed-off-by: Shaik Sajida Bhanu <sbhanu@codeaurora.org>
---
 drivers/mmc/host/sdhci-msm.c | 47 ++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 45 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index 71f29ba..4984857 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -2028,9 +2028,52 @@ static __maybe_unused int sdhci_msm_runtime_resume(struct device *dev)
 	return 0;
 }
 
+static int sdhci_msm_suspend(struct device *dev)
+{
+	struct sdhci_host *host = dev_get_drvdata(dev);
+	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
+	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
+	int ret = 0;
+
+	if (host->mmc->caps2 & MMC_CAP2_CQE) {
+		ret = cqhci_suspend(host->mmc);
+		if (ret)
+			return ret;
+	}
+
+	disable_irq(msm_host->pwr_irq);
+	ret = sdhci_suspend_host(host);
+	if (ret)
+		return ret;
+
+	return sdhci_msm_runtime_suspend(dev);
+}
+
+static int sdhci_msm_resume(struct device *dev)
+{
+	struct sdhci_host *host = dev_get_drvdata(dev);
+	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
+	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
+	int ret = 0;
+
+	ret = sdhci_msm_runtime_resume(dev);
+	if (ret)
+		return ret;
+
+	ret = sdhci_resume_host(host);
+	if (ret < 0)
+		return ret;
+	enable_irq(msm_host->pwr_irq);
+
+	if (host->mmc->caps2 & MMC_CAP2_CQE)
+		ret = cqhci_resume(host->mmc);
+
+	return ret;
+}
+
 static const struct dev_pm_ops sdhci_msm_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
-				pm_runtime_force_resume)
+	SET_SYSTEM_SLEEP_PM_OPS(sdhci_msm_suspend,
+				sdhci_msm_resume)
 	SET_RUNTIME_PM_OPS(sdhci_msm_runtime_suspend,
 			   sdhci_msm_runtime_resume,
 			   NULL)
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

