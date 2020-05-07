Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BE891C8441
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2020 10:04:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725849AbgEGIEN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 May 2020 04:04:13 -0400
Received: from alexa-out-blr-01.qualcomm.com ([103.229.18.197]:9320 "EHLO
        alexa-out-blr-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726750AbgEGIEN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 May 2020 04:04:13 -0400
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by alexa-out-blr-01.qualcomm.com with ESMTP/TLS/AES256-SHA; 07 May 2020 13:32:57 +0530
Received: from minint-dvc2thc.qualcomm.com (HELO sartgarg-linux.qualcomm.com) ([10.206.24.245])
  by ironmsg02-blr.qualcomm.com with ESMTP; 07 May 2020 13:32:53 +0530
Received: by sartgarg-linux.qualcomm.com (Postfix, from userid 2339771)
        id 1AC47261C; Thu,  7 May 2020 13:32:53 +0530 (IST)
From:   Sarthak Garg <sartgarg@codeaurora.org>
To:     adrian.hunter@intel.com, ulf.hansson@linaro.org
Cc:     vbadigan@codeaurora.org, stummala@codeaurora.org,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Sarthak Garg <sartgarg@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS)
Subject: [PATCH V1 1/7] dt-bindings: mmc: Add information for DLL register properties
Date:   Thu,  7 May 2020 13:32:08 +0530
Message-Id: <1588838535-6050-2-git-send-email-sartgarg@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1588838535-6050-1-git-send-email-sartgarg@codeaurora.org>
References: <1588838535-6050-1-git-send-email-sartgarg@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add information regarding DLL register properties for getting target
specific configurations. These DLL register settings may vary from
target to target.

Also new compatible string value for sm8250 target.

Signed-off-by: Sarthak Garg <sartgarg@codeaurora.org>
---
 Documentation/devicetree/bindings/mmc/sdhci-msm.txt | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.txt b/Documentation/devicetree/bindings/mmc/sdhci-msm.txt
index 5445931..b8e1d2b 100644
--- a/Documentation/devicetree/bindings/mmc/sdhci-msm.txt
+++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.txt
@@ -17,6 +17,7 @@ Required properties:
 		"qcom,msm8916-sdhci", "qcom,sdhci-msm-v4"
 		"qcom,msm8992-sdhci", "qcom,sdhci-msm-v4"
 		"qcom,msm8996-sdhci", "qcom,sdhci-msm-v4"
+		"qcom,sm8250-sdhci", "qcom,sdhci-msm-v5"
 		"qcom,sdm845-sdhci", "qcom,sdhci-msm-v5"
 		"qcom,qcs404-sdhci", "qcom,sdhci-msm-v5"
 		"qcom,sc7180-sdhci", "qcom,sdhci-msm-v5";
@@ -46,6 +47,13 @@ Required properties:
 	"cal"	- reference clock for RCLK delay calibration (optional)
 	"sleep"	- sleep clock for RCLK delay calibration (optional)
 
+- qcom,ddr-config: Certain chipsets and platforms require particular settings
+	for the DDR_CONFIG register. Use this field to specify the register
+	value as per the Hardware Programming Guide.
+
+- qcom,dll-config: Chipset and Platform specific value. Use this field to
+	specify the DLL_CONFIG register value as per Hardware Programming Guide.
+
 Example:
 
 	sdhc_1: sdhci@f9824900 {
@@ -63,6 +71,9 @@ Example:
 
 		clocks = <&gcc GCC_SDCC1_APPS_CLK>, <&gcc GCC_SDCC1_AHB_CLK>;
 		clock-names = "core", "iface";
+
+		qcom,dll-config = <0x000f642c>;
+		qcom,ddr-config = <0x80040868>;
 	};
 
 	sdhc_2: sdhci@f98a4900 {
@@ -80,4 +91,7 @@ Example:
 
 		clocks = <&gcc GCC_SDCC2_APPS_CLK>, <&gcc GCC_SDCC2_AHB_CLK>;
 		clock-names = "core", "iface";
+
+		qcom,dll-config = <0x0007642c>;
+		qcom,ddr-config = <0x80040868>;
 	};
-- 
2.7.4

