Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7645C1626A6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2020 14:01:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726650AbgBRNBV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Feb 2020 08:01:21 -0500
Received: from alexa-out-blr-01.qualcomm.com ([103.229.18.197]:62303 "EHLO
        alexa-out-blr-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726373AbgBRNBU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Feb 2020 08:01:20 -0500
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by alexa-out-blr-01.qualcomm.com with ESMTP/TLS/AES256-SHA; 18 Feb 2020 18:31:16 +0530
Received: from c-ppvk-linux.qualcomm.com ([10.206.24.34])
  by ironmsg02-blr.qualcomm.com with ESMTP; 18 Feb 2020 18:30:44 +0530
Received: by c-ppvk-linux.qualcomm.com (Postfix, from userid 2304101)
        id D3B324C42; Tue, 18 Feb 2020 18:30:43 +0530 (IST)
From:   Pradeep P V K <ppvk@codeaurora.org>
To:     bjorn.andersson@linaro.org, adrian.hunter@intel.com,
        robh+dt@kernel.org, ulf.hansson@linaro.org,
        asutoshd@codeaurora.org, stummala@codeaurora.org,
        sayalil@codeaurora.org, rampraka@codeaurora.org,
        vbadigan@codeaurora.org, sboyd@kernel.org,
        georgi.djakov@linaro.org, mka@chromium.org
Cc:     linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        agross@kernel.org, linux-mmc-owner@vger.kernel.org,
        Pradeep P V K <ppvk@codeaurora.org>
Subject: [RFC v4 2/2] dt-bindings: mmc: sdhci-msm: Add interconnect BW scaling strings
Date:   Tue, 18 Feb 2020 18:30:33 +0530
Message-Id: <1582030833-12964-3-git-send-email-ppvk@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1582030833-12964-1-git-send-email-ppvk@codeaurora.org>
References: <1582030833-12964-1-git-send-email-ppvk@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add interconnect bandwidth scaling supported strings for qcom-sdhci
controller.

Signed-off-by: Pradeep P V K <ppvk@codeaurora.org>
---

changes from RFC v3 -> v4:
- No changes.

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

