Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E73F23A95E6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jun 2021 11:18:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231335AbhFPJUr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Jun 2021 05:20:47 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:17117 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231524AbhFPJUq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Jun 2021 05:20:46 -0400
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 16 Jun 2021 02:18:41 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 16 Jun 2021 02:18:38 -0700
X-QCInternal: smtphost
Received: from c-sbhanu-linux.qualcomm.com ([10.242.50.201])
  by ironmsg01-blr.qualcomm.com with ESMTP; 16 Jun 2021 14:47:42 +0530
Received: by c-sbhanu-linux.qualcomm.com (Postfix, from userid 2344807)
        id 0DB0A4CFC; Wed, 16 Jun 2021 14:47:41 +0530 (IST)
From:   Shaik Sajida Bhanu <sbhanu@codeaurora.org>
To:     adrian.hunter@intel.com, ulf.hansson@linaro.org, robh+dt@kernel.org
Cc:     asutoshd@codeaurora.org, stummala@codeaurora.org,
        vbadigan@codeaurora.org, rampraka@codeaurora.org,
        sayalil@codeaurora.org, sartgarg@codeaurora.org,
        rnayak@codeaurora.org, saiprakash.ranjan@codeaurora.org,
        sibis@codeaurora.org, okukatla@codeaurora.org, djakov@kernel.org,
        cang@codeaurora.org, pragalla@codeaurora.org,
        nitirawa@codeaurora.org, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org,
        Shaik Sajida Bhanu <sbhanu@codeaurora.org>
Subject: [PATCH V2] arm64: dts: qcom: sc7180: Add xo clock for eMMC and Sd card
Date:   Wed, 16 Jun 2021 14:47:39 +0530
Message-Id: <1623835059-29302-1-git-send-email-sbhanu@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add XO clock for eMMC and SDCard as it would help in calculating dll
register values.

Signed-off-by: Shaik Sajida Bhanu <sbhanu@codeaurora.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---

Changes since V1:
	- Updated commit message as suggested by Bjorn Andersson.
	- Added space after before xo clock name as suggested by
	  Konrad Dybcio.
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 52115e0..fb1d9ad 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -701,8 +701,9 @@
 			interrupt-names = "hc_irq", "pwr_irq";
 
 			clocks = <&gcc GCC_SDCC1_APPS_CLK>,
-					<&gcc GCC_SDCC1_AHB_CLK>;
-			clock-names = "core", "iface";
+				 <&gcc GCC_SDCC1_AHB_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "core", "iface", "xo";
 			interconnects = <&aggre1_noc MASTER_EMMC 0 &mc_virt SLAVE_EBI1 0>,
 					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_EMMC_CFG 0>;
 			interconnect-names = "sdhc-ddr","cpu-sdhc";
@@ -2564,8 +2565,9 @@
 			interrupt-names = "hc_irq", "pwr_irq";
 
 			clocks = <&gcc GCC_SDCC2_APPS_CLK>,
-					<&gcc GCC_SDCC2_AHB_CLK>;
-			clock-names = "core", "iface";
+				 <&gcc GCC_SDCC2_AHB_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "core", "iface", "xo";
 
 			interconnects = <&aggre1_noc MASTER_SDCC_2 0 &mc_virt SLAVE_EBI1 0>,
 					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_SDCC_2 0>;
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

