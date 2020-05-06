Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2E041C7230
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2020 15:53:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728878AbgEFNxv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 May 2020 09:53:51 -0400
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198]:53999 "EHLO
        alexa-out-blr-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728662AbgEFNxv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 May 2020 09:53:51 -0400
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr-02.qualcomm.com with ESMTP/TLS/AES256-SHA; 06 May 2020 19:23:49 +0530
Received: from minint-dvc2thc.qualcomm.com (HELO sartgarg-linux.qualcomm.com) ([10.206.24.245])
  by ironmsg01-blr.qualcomm.com with ESMTP; 06 May 2020 19:23:49 +0530
Received: by sartgarg-linux.qualcomm.com (Postfix, from userid 2339771)
        id 6AF972654; Wed,  6 May 2020 19:23:48 +0530 (IST)
From:   Sarthak Garg <sartgarg@codeaurora.org>
To:     adrian.hunter@intel.com, ulf.hansson@linaro.org
Cc:     vbadigan@codeaurora.org, stummala@codeaurora.org,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Sarthak Garg <sartgarg@codeaurora.org>
Subject: [PATCH V1 1/2] mmc: sdhci: Introduce new quirk to use reserved timeout
Date:   Wed,  6 May 2020 19:14:30 +0530
Message-Id: <1588772671-19675-2-git-send-email-sartgarg@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1588772671-19675-1-git-send-email-sartgarg@codeaurora.org>
References: <1588772671-19675-1-git-send-email-sartgarg@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Introduce a new quirk for letting vendor drivers to use reserved
timeout value (0xF) in timeout control register.

Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>
Signed-off-by: Sarthak Garg <sartgarg@codeaurora.org>
---
 drivers/mmc/host/sdhci.c | 3 ++-
 drivers/mmc/host/sdhci.h | 5 +++++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/sdhci.c b/drivers/mmc/host/sdhci.c
index 1bb6b67..07528a9 100644
--- a/drivers/mmc/host/sdhci.c
+++ b/drivers/mmc/host/sdhci.c
@@ -967,7 +967,8 @@ static u8 sdhci_calc_timeout(struct sdhci_host *host, struct mmc_command *cmd,
 	}
 
 	if (count >= 0xF) {
-		if (!(host->quirks2 & SDHCI_QUIRK2_DISABLE_HW_TIMEOUT))
+		if (!(host->quirks2 & SDHCI_QUIRK2_DISABLE_HW_TIMEOUT) ||
+		!(host->quirks2 & SDHCI_QUIRK2_USE_RESERVED_MAX_TIMEOUT))
 			DBG("Too large timeout 0x%x requested for CMD%d!\n",
 			    count, cmd->opcode);
 		count = 0xE;
diff --git a/drivers/mmc/host/sdhci.h b/drivers/mmc/host/sdhci.h
index 8d2a096..02f8779 100644
--- a/drivers/mmc/host/sdhci.h
+++ b/drivers/mmc/host/sdhci.h
@@ -476,6 +476,11 @@ struct sdhci_host {
  * block count.
  */
 #define SDHCI_QUIRK2_USE_32BIT_BLK_CNT			(1<<18)
+/*
+ * Some controllers define the usage of 0xF in data timeout counter
+ * register (0x2E) which is actually a reserved bit as per specification.
+ */
+#define SDHCI_QUIRK2_USE_RESERVED_MAX_TIMEOUT		(1<<19)
 
 	int irq;		/* Device IRQ */
 	void __iomem *ioaddr;	/* Mapped address */
-- 
2.7.4

