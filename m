Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F47F1EE332
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2020 13:17:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726848AbgFDLRF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Jun 2020 07:17:05 -0400
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198]:62205 "EHLO
        alexa-out-blr-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726444AbgFDLRF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Jun 2020 07:17:05 -0400
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by alexa-out-blr-02.qualcomm.com with ESMTP/TLS/AES256-SHA; 04 Jun 2020 16:45:16 +0530
Received: from c-ppvk-linux.qualcomm.com ([10.206.24.34])
  by ironmsg02-blr.qualcomm.com with ESMTP; 04 Jun 2020 16:44:47 +0530
Received: by c-ppvk-linux.qualcomm.com (Postfix, from userid 2304101)
        id 9EFCE47A9; Thu,  4 Jun 2020 16:44:46 +0530 (IST)
From:   Pradeep P V K <ppvk@codeaurora.org>
To:     bjorn.andersson@linaro.org, adrian.hunter@intel.com,
        robh+dt@kernel.org, ulf.hansson@linaro.org,
        vbadigan@codeaurora.org, sboyd@kernel.org,
        georgi.djakov@linaro.org, mka@chromium.org
Cc:     linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mmc-owner@vger.kernel.org, rnayak@codeaurora.org,
        sibis@codeaurora.org, matthias@chromium.org,
        Pradeep P V K <ppvk@codeaurora.org>
Subject: [PATCH V2 1/2] mmc: sdhci-msm: Add interconnect bandwidth scaling support
Date:   Thu,  4 Jun 2020 16:44:42 +0530
Message-Id: <1591269283-24084-2-git-send-email-ppvk@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1591269283-24084-1-git-send-email-ppvk@codeaurora.org>
References: <1591269283-24084-1-git-send-email-ppvk@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Interconnect bandwidth scaling support is now added as a
part of OPP [1]. So, make sure interconnect driver is ready
before handling interconnect scaling.

This change is based on
[1] [Patch v8] Introduce OPP bandwidth bindings
(https://lkml.org/lkml/2020/5/12/493)

[2] [Patch v3] mmc: sdhci-msm: Fix error handling
for dev_pm_opp_of_add_table()
(https://lkml.org/lkml/2020/5/5/491)

Signed-off-by: Pradeep P V K <ppvk@codeaurora.org>
---
 drivers/mmc/host/sdhci-msm.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index b277dd7..a13ff1b 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -14,6 +14,7 @@
 #include <linux/slab.h>
 #include <linux/iopoll.h>
 #include <linux/regulator/consumer.h>
+#include <linux/interconnect.h>
 
 #include "sdhci-pltfm.h"
 #include "cqhci.h"
@@ -2070,6 +2071,18 @@ static int sdhci_msm_probe(struct platform_device *pdev)
 	}
 	msm_host->bulk_clks[0].clk = clk;
 
+	/* Make sure that ICC driver is ready for interconnect bandwdith
+	 * scaling before registering the device for OPP.
+	 */
+	ret = dev_pm_opp_of_find_icc_paths(&pdev->dev, NULL);
+	if (ret) {
+		if (ret == -EPROBE_DEFER)
+			dev_info(&pdev->dev, "defer icc path: %d\n", ret);
+		else
+			dev_err(&pdev->dev, "failed to get icc path:%d\n", ret);
+		goto bus_clk_disable;
+	}
+
 	msm_host->opp_table = dev_pm_opp_set_clkname(&pdev->dev, "core");
 	if (IS_ERR(msm_host->opp_table)) {
 		ret = PTR_ERR(msm_host->opp_table);
-- 
1.9.1

