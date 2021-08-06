Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 905F83E239B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Aug 2021 08:55:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243480AbhHFGzp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Aug 2021 02:55:45 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:48600 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243467AbhHFGzo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Aug 2021 02:55:44 -0400
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 05 Aug 2021 23:55:29 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 05 Aug 2021 23:55:28 -0700
X-QCInternal: smtphost
Received: from sartgarg-linux.qualcomm.com ([10.206.24.245])
  by ironmsg02-blr.qualcomm.com with ESMTP; 06 Aug 2021 12:25:20 +0530
Received: by sartgarg-linux.qualcomm.com (Postfix, from userid 2339771)
        id 335F83635; Fri,  6 Aug 2021 12:25:19 +0530 (IST)
From:   Sarthak Garg <sartgarg@codeaurora.org>
To:     adrian.hunter@intel.com, ulf.hansson@linaro.org
Cc:     vbadigan@codeaurora.org, stummala@codeaurora.org,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Sarthak Garg <sartgarg@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH V3 2/2] mmc: sdhci-msm: Use maximum possible data timeout value
Date:   Fri,  6 Aug 2021 12:25:00 +0530
Message-Id: <1628232901-30897-3-git-send-email-sartgarg@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1628232901-30897-1-git-send-email-sartgarg@codeaurora.org>
References: <1627534001-17256-2-git-send-email-sartgarg@codeaurora.org>
 <1628232901-30897-1-git-send-email-sartgarg@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Sahitya Tummala <stummala@codeaurora.org>

The Qcom SD controller defines the usage of 0xF in data
timeout counter register (0x2E) which is actually a reserved
bit as per specification. This would result in maximum of 21.26 secs
timeout value.

Some SDcard taking more time than 2.67secs (timeout value corresponding
to 0xE) and with that observed data timeout errors.
So increasing the timeout value to max possible timeout.

Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>
Signed-off-by: Sarthak Garg <sartgarg@codeaurora.org>
---
 drivers/mmc/host/sdhci-msm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index e44b7a6..19e4673 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -2696,6 +2696,9 @@ static int sdhci_msm_probe(struct platform_device *pdev)
 
 	msm_host->mmc->caps |= MMC_CAP_WAIT_WHILE_BUSY | MMC_CAP_NEED_RSP_BUSY;
 
+	/* Set the timeout value to max possible */
+	host->max_timeout_count = 0xF;
+
 	pm_runtime_get_noresume(&pdev->dev);
 	pm_runtime_set_active(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);
-- 
2.7.4

