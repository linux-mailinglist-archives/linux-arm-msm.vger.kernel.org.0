Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF26D1559EB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2020 15:46:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727005AbgBGOpt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Feb 2020 09:45:49 -0500
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198]:2101 "EHLO
        alexa-out-blr-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726867AbgBGOps (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Feb 2020 09:45:48 -0500
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr-02.qualcomm.com with ESMTP/TLS/AES256-SHA; 07 Feb 2020 20:15:45 +0530
Received: from c-ppvk-linux.qualcomm.com ([10.206.24.34])
  by ironmsg01-blr.qualcomm.com with ESMTP; 07 Feb 2020 20:15:18 +0530
Received: by c-ppvk-linux.qualcomm.com (Postfix, from userid 2304101)
        id 587ED47EB; Fri,  7 Feb 2020 20:15:17 +0530 (IST)
From:   Pradeep P V K <ppvk@codeaurora.org>
To:     adrian.hunter@intel.com, robh+dt@kernel.org,
        ulf.hansson@linaro.org, asutoshd@codeaurora.org,
        stummala@codeaurora.org, sayalil@codeaurora.org,
        rampraka@codeaurora.org, vbadigan@codeaurora.org, sboyd@kernel.org,
        georgi.djakov@linaro.org
Cc:     linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        agross@kernel.org, linux-mmc-owner@vger.kernel.org,
        mka@chromium.org, Pradeep P V K <ppvk@codeaurora.org>
Subject: [RFC v3 2/2] dt-bindings: mmc: sdhci-msm: Add interconnect BW scaling strings
Date:   Fri,  7 Feb 2020 20:14:55 +0530
Message-Id: <1581086695-16645-3-git-send-email-ppvk@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1581086695-16645-1-git-send-email-ppvk@codeaurora.org>
References: <1581086695-16645-1-git-send-email-ppvk@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add interconnect bandwidth scaling supported strings for qcom-sdhci
controller.

changes from RFC v2 -> v3:
- Addressed review comments on v2.
- Modified interconnect bandwidth support using OPP framework.

Signed-off-by: Pradeep P V K <ppvk@codeaurora.org>
---
 Documentation/devicetree/bindings/mmc/sdhci-msm.txt | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.txt b/Documentation/devicetree/bindings/mmc/sdhci-msm.txt
index 7ee639b..cbe97b8 100644
--- a/Documentation/devicetree/bindings/mmc/sdhci-msm.txt
+++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.txt
@@ -40,6 +40,21 @@ Required properties:
 	"cal"	- reference clock for RCLK delay calibration (optional)
 	"sleep"	- sleep clock for RCLK delay calibration (optional)
 
+Optional Properties:
+* Following bus parameters are required for interconnect bandwidth scaling:
+- interconnects: Pairs of phandles and interconnect provider specifier
+		 to denote the edge source and destination ports of
+		 the interconnect path.
+
+- interconnect-names: For sdhc, we have two main paths.
+		1. Data path : sdhc to ddr
+		2. Config path : cpu to sdhc
+		For Data interconnect path the name supposed to be
+		is "sdhc-ddr" and for config interconnect path it is
+		"cpu-sdhc".
+		Please refer to Documentation/devicetree/bindings/
+		interconnect/ for more details.
+
 Example:
 
 	sdhc_1: sdhci@f9824900 {
@@ -57,6 +72,9 @@ Example:
 
 		clocks = <&gcc GCC_SDCC1_APPS_CLK>, <&gcc GCC_SDCC1_AHB_CLK>;
 		clock-names = "core", "iface";
+		interconnects = <&qnoc MASTER_SDCC_ID &qnoc SLAVE_DDR_ID>,
+				<&qnoc MASTER_CPU_ID &qnoc SLAVE_SDCC_ID>;
+		interconnect-names = "sdhc-ddr","cpu-sdhc";
 	};
 
 	sdhc_2: sdhci@f98a4900 {
-- 
1.9.1

