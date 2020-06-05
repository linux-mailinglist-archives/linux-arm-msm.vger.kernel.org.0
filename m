Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9D1F1EF438
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2020 11:32:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726533AbgFEJb3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Jun 2020 05:31:29 -0400
Received: from alexa-out-blr-01.qualcomm.com ([103.229.18.197]:26201 "EHLO
        alexa-out-blr-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726217AbgFEJbL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Jun 2020 05:31:11 -0400
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr-01.qualcomm.com with ESMTP/TLS/AES256-SHA; 05 Jun 2020 15:01:01 +0530
Received: from c-ppvk-linux.qualcomm.com ([10.206.24.34])
  by ironmsg01-blr.qualcomm.com with ESMTP; 05 Jun 2020 15:00:33 +0530
Received: by c-ppvk-linux.qualcomm.com (Postfix, from userid 2304101)
        id 51F1F48DD; Fri,  5 Jun 2020 15:00:32 +0530 (IST)
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
Subject: =?y?q?=5BPATCH=C2=A0V3=201/2=5D=20mmc=3A=20sdhci-msm=3A=20Add=20interconnect=20bandwidth=20scaling=20support?=
Date:   Fri,  5 Jun 2020 15:00:26 +0530
Message-Id: <1591349427-27004-2-git-send-email-ppvk@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1591349427-27004-1-git-send-email-ppvk@codeaurora.org>
References: <1591269283-24084-1-git-send-email-ppvk@codeaurora.org>
 <1591349427-27004-1-git-send-email-ppvk@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
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
 drivers/mmc/host/sdhci-msm.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index b277dd7..a945e84 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -14,6 +14,7 @@
 #include <linux/slab.h>
 #include <linux/iopoll.h>
 #include <linux/regulator/consumer.h>
+#include <linux/interconnect.h>
 
 #include "sdhci-pltfm.h"
 #include "cqhci.h"
@@ -2070,6 +2071,13 @@ static int sdhci_msm_probe(struct platform_device *pdev)
 	}
 	msm_host->bulk_clks[0].clk = clk;
 
+	/* Make sure that ICC driver is ready for interconnect bandwdith
+	 * scaling before registering the device for OPP.
+	 */
+	ret = dev_pm_opp_of_find_icc_paths(&pdev->dev, NULL);
+	if (ret)
+		goto bus_clk_disable;
+
 	msm_host->opp_table = dev_pm_opp_set_clkname(&pdev->dev, "core");
 	if (IS_ERR(msm_host->opp_table)) {
 		ret = PTR_ERR(msm_host->opp_table);
-- 
1.9.1

