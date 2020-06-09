Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C806E1F3633
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2020 10:38:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728187AbgFIIiG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Jun 2020 04:38:06 -0400
Received: from alexa-out-blr-01.qualcomm.com ([103.229.18.197]:5312 "EHLO
        alexa-out-blr-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728170AbgFIIiG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Jun 2020 04:38:06 -0400
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr-01.qualcomm.com with ESMTP/TLS/AES256-SHA; 09 Jun 2020 14:07:58 +0530
Received: from c-ppvk-linux.qualcomm.com ([10.206.24.34])
  by ironmsg01-blr.qualcomm.com with ESMTP; 09 Jun 2020 14:07:30 +0530
Received: by c-ppvk-linux.qualcomm.com (Postfix, from userid 2304101)
        id 3D8414FB9; Tue,  9 Jun 2020 14:07:29 +0530 (IST)
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
Subject: [PATCH V4 1/2] mmc: sdhci-msm: Add interconnect bandwidth scaling support
Date:   Tue,  9 Jun 2020 14:07:25 +0530
Message-Id: <1591691846-7578-2-git-send-email-ppvk@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1591691846-7578-1-git-send-email-ppvk@codeaurora.org>
References: <1591691846-7578-1-git-send-email-ppvk@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Interconnect bandwidth scaling support is now added as a
part of OPP. So, make sure interconnect driver is ready
before handling interconnect scaling.

Signed-off-by: Pradeep P V K <ppvk@codeaurora.org>
Reviewed-by: Sibi Sankar <sibis@codeaurora.org>
---

This change is based on
[1] [Patch v8] Introduce OPP bandwidth bindings
(https://lkml.org/lkml/2020/5/12/493)

[2] [Patch v3] mmc: sdhci-msm: Fix error handling
for dev_pm_opp_of_add_table()
(https://lkml.org/lkml/2020/5/5/491)

 drivers/mmc/host/sdhci-msm.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index b277dd7..15c42b0 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -14,6 +14,7 @@
 #include <linux/slab.h>
 #include <linux/iopoll.h>
 #include <linux/regulator/consumer.h>
+#include <linux/interconnect.h>
 
 #include "sdhci-pltfm.h"
 #include "cqhci.h"
@@ -2070,6 +2071,11 @@ static int sdhci_msm_probe(struct platform_device *pdev)
 	}
 	msm_host->bulk_clks[0].clk = clk;
 
+	 /* Check for optional interconnect paths */
+	ret = dev_pm_opp_of_find_icc_paths(&pdev->dev, NULL);
+	if (ret)
+		goto bus_clk_disable;
+
 	msm_host->opp_table = dev_pm_opp_set_clkname(&pdev->dev, "core");
 	if (IS_ERR(msm_host->opp_table)) {
 		ret = PTR_ERR(msm_host->opp_table);
-- 
1.9.1

