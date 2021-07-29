Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 214413D9CE2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jul 2021 06:47:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233607AbhG2Er3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Jul 2021 00:47:29 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:4049 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233599AbhG2Er2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Jul 2021 00:47:28 -0400
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 28 Jul 2021 21:47:26 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg07-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 28 Jul 2021 21:47:25 -0700
X-QCInternal: smtphost
Received: from minint-dvc2thc.qualcomm.com (HELO sartgarg-linux.qualcomm.com) ([10.206.24.245])
  by ironmsg02-blr.qualcomm.com with ESMTP; 29 Jul 2021 10:17:21 +0530
Received: by sartgarg-linux.qualcomm.com (Postfix, from userid 2339771)
        id 7DEF735F9; Thu, 29 Jul 2021 10:17:19 +0530 (IST)
From:   Sarthak Garg <sartgarg@codeaurora.org>
To:     adrian.hunter@intel.com, ulf.hansson@linaro.org
Cc:     vbadigan@codeaurora.org, stummala@codeaurora.org,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Sarthak Garg <sartgarg@codeaurora.org>
Subject: [PATCH V2 1/2] mmc: sdhci: Introduce max_timeout_count variable in sdhci_host
Date:   Thu, 29 Jul 2021 10:16:40 +0530
Message-Id: <1627534001-17256-2-git-send-email-sartgarg@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1627534001-17256-1-git-send-email-sartgarg@codeaurora.org>
References: <1626444182-2187-3-git-send-email-sartgarg@codeaurora.org>
 <1627534001-17256-1-git-send-email-sartgarg@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Introduce max_timeout_count variable in the sdhci_host structure
and use in timeout calculation. By default its set to 0xE
(max timeout register value as per SDHC spec). But at the same time
vendors drivers can update it if they support different max timeout
register value than 0xE.

Signed-off-by: Sarthak Garg <sartgarg@codeaurora.org>
---
 drivers/mmc/host/sdhci.c | 15 +++++++++------
 drivers/mmc/host/sdhci.h |  1 +
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/mmc/host/sdhci.c b/drivers/mmc/host/sdhci.c
index aba6e10..2debda3 100644
--- a/drivers/mmc/host/sdhci.c
+++ b/drivers/mmc/host/sdhci.c
@@ -939,16 +939,16 @@ static u8 sdhci_calc_timeout(struct sdhci_host *host, struct mmc_command *cmd,
 	 * timeout value.
 	 */
 	if (host->quirks & SDHCI_QUIRK_BROKEN_TIMEOUT_VAL)
-		return 0xE;
+		return host->max_timeout_count;
 
 	/* Unspecified command, asume max */
 	if (cmd == NULL)
-		return 0xE;
+		return host->max_timeout_count;
 
 	data = cmd->data;
 	/* Unspecified timeout, assume max */
 	if (!data && !cmd->busy_timeout)
-		return 0xE;
+		return host->max_timeout_count;
 
 	/* timeout in us */
 	target_timeout = sdhci_target_timeout(host, cmd, data);
@@ -968,15 +968,15 @@ static u8 sdhci_calc_timeout(struct sdhci_host *host, struct mmc_command *cmd,
 	while (current_timeout < target_timeout) {
 		count++;
 		current_timeout <<= 1;
-		if (count >= 0xF)
+		if (count > host->max_timeout_count)
 			break;
 	}
 
-	if (count >= 0xF) {
+	if (count > host->max_timeout_count) {
 		if (!(host->quirks2 & SDHCI_QUIRK2_DISABLE_HW_TIMEOUT))
 			DBG("Too large timeout 0x%x requested for CMD%d!\n",
 			    count, cmd->opcode);
-		count = 0xE;
+		count = host->max_timeout_count;
 	} else {
 		*too_big = false;
 	}
@@ -3940,6 +3940,9 @@ struct sdhci_host *sdhci_alloc_host(struct device *dev,
 	 */
 	host->adma_table_cnt = SDHCI_MAX_SEGS * 2 + 1;
 
+	if (!host->max_timeout_count)
+		host->max_timeout_count = 0xE;
+
 	return host;
 }
 
diff --git a/drivers/mmc/host/sdhci.h b/drivers/mmc/host/sdhci.h
index 074dc18..e8d04e4 100644
--- a/drivers/mmc/host/sdhci.h
+++ b/drivers/mmc/host/sdhci.h
@@ -517,6 +517,7 @@ struct sdhci_host {
 
 	unsigned int max_clk;	/* Max possible freq (MHz) */
 	unsigned int timeout_clk;	/* Timeout freq (KHz) */
+	u8 max_timeout_count;	/* Vendor specific max timeout count */
 	unsigned int clk_mul;	/* Clock Muliplier value */
 
 	unsigned int clock;	/* Current clock (MHz) */
-- 
2.7.4

