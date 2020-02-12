Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C43A915A20E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2020 08:32:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728295AbgBLHcL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Feb 2020 02:32:11 -0500
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198]:55792 "EHLO
        alexa-out-blr-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728192AbgBLHcL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Feb 2020 02:32:11 -0500
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr-02.qualcomm.com with ESMTP/TLS/AES256-SHA; 12 Feb 2020 13:02:07 +0530
Received: from c-sbhanu-linux.qualcomm.com ([10.242.50.201])
  by ironmsg01-blr.qualcomm.com with ESMTP; 12 Feb 2020 13:01:34 +0530
Received: by c-sbhanu-linux.qualcomm.com (Postfix, from userid 2344807)
        id 077043609; Wed, 12 Feb 2020 13:01:32 +0530 (IST)
From:   Shaik Sajida Bhanu <sbhanu@codeaurora.org>
To:     adrian.hunter@intel.com, ulf.hansson@linaro.org,
        robh+dt@kernel.org, mka@chromium.org
Cc:     asutoshd@codeaurora.org, swboyd@google.com,
        stummala@codeaurora.org, sayalil@codeaurora.org,
        cang@codeaurora.org, vbadigan@codeaurora.org,
        rampraka@codeaurora.org, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org,
        Shaik Sajida Bhanu <sbhanu@codeaurora.org>
Subject: [PATCH V3] mmc: sdhci-msm: Update system suspend/resume callbacks of sdhci-msm platform driver
Date:   Wed, 12 Feb 2020 13:01:13 +0530
Message-Id: <1581492673-27295-1-git-send-email-sbhanu@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The existing suspend/resume callbacks of sdhci-msm driver are just
gating/un-gating the clocks. During suspend cycle more can be done
like disabling controller, disabling card detection, enabling wake-up events.

So updating the system pm callbacks for performing these extra
actions besides controlling the clocks.

Signed-off-by: Shaik Sajida Bhanu <sbhanu@codeaurora.org>

Changes since V2:
    Removed disabling/enabling pwr-irq from system pm ops.

Changes since V1:
    Invoking pm_runtime_force_suspend/resume instead of
    sdhci_msm_runtime_suepend/resume.
---
 drivers/mmc/host/sdhci-msm.c | 41 +++++++++++++++++++++++++++++++++++++++--
 1 file changed, 39 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index c3a160c..fcff3e8 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -2159,9 +2159,46 @@ static __maybe_unused int sdhci_msm_runtime_resume(struct device *dev)
 	return 0;
 }
 
+static int sdhci_msm_suspend(struct device *dev)
+{
+	struct sdhci_host *host = dev_get_drvdata(dev);
+	int ret;
+
+	if (host->mmc->caps2 & MMC_CAP2_CQE) {
+		ret = cqhci_suspend(host->mmc);
+		if (ret)
+			return ret;
+	}
+
+	ret = sdhci_suspend_host(host);
+	if (ret)
+		return ret;
+
+	return pm_runtime_force_suspend(dev);
+}
+
+static int sdhci_msm_resume(struct device *dev)
+{
+	struct sdhci_host *host = dev_get_drvdata(dev);
+	int ret;
+
+	ret = pm_runtime_force_resume(dev);
+	if (ret)
+		return ret;
+
+	ret = sdhci_resume_host(host);
+	if (ret < 0)
+		return ret;
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

