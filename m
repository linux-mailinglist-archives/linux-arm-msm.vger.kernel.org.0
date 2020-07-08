Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CA9D218893
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2020 15:12:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729369AbgGHNM3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Jul 2020 09:12:29 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:24034 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729299AbgGHNM1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Jul 2020 09:12:27 -0400
Received: from ironmsg07-lv.qualcomm.com (HELO ironmsg07-lv.qulacomm.com) ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 08 Jul 2020 06:12:27 -0700
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg07-lv.qulacomm.com with ESMTP/TLS/AES256-SHA; 08 Jul 2020 06:12:25 -0700
Received: from vbadigan-linux.qualcomm.com ([10.206.24.109])
  by ironmsg01-blr.qualcomm.com with ESMTP; 08 Jul 2020 18:42:07 +0530
Received: by vbadigan-linux.qualcomm.com (Postfix, from userid 76677)
        id 597A84D31; Wed,  8 Jul 2020 18:42:06 +0530 (IST)
From:   Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
To:     adrian.hunter@intel.com, ulf.hansson@linaro.org,
        bjorn.andersson@linaro.org
Cc:     linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Veerabhadrarao Badiganti <vbadigan@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        "Bao D. Nguyen" <nguyenb@codeaurora.org>,
        Sarthak Garg <sartgarg@codeaurora.org>
Subject: [PATCH V1] mmc: sdhci-msm: Override DLL_CONFIG only if the valid value is supplied
Date:   Wed,  8 Jul 2020 18:41:19 +0530
Message-Id: <1594213888-2780-1-git-send-email-vbadigan@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

During DLL initialization, the DLL_CONFIG register value would be
updated with the value supplied from the device-tree.

Override this register only if a valid value is supplied.

Fixes: 03591160ca19 ("mmc: sdhci-msm: Read and use DLL Config property from device tree file")
Signed-off-by: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
---
 drivers/mmc/host/sdhci-msm.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index efd2bae1430c..93d67a3a899f 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -626,8 +626,9 @@ static int msm_init_cm_dll(struct sdhci_host *host)
 	config &= ~CORE_CLK_PWRSAVE;
 	writel_relaxed(config, host->ioaddr + msm_offset->core_vendor_spec);
 
-	config = msm_host->dll_config;
-	writel_relaxed(config, host->ioaddr + msm_offset->core_dll_config);
+	if (msm_host->dll_config)
+		writel_relaxed(msm_host->dll_config,
+				host->ioaddr + msm_offset->core_dll_config);
 
 	if (msm_host->use_14lpp_dll_reset) {
 		config = readl_relaxed(host->ioaddr +
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc., is a member of Code Aurora Forum, a Linux Foundation Collaborative Project

