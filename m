Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1054C22493A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Jul 2020 08:34:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726940AbgGRGeO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 18 Jul 2020 02:34:14 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:43444 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726226AbgGRGeN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 18 Jul 2020 02:34:13 -0400
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 17 Jul 2020 23:34:13 -0700
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 17 Jul 2020 23:34:11 -0700
Received: from c-sbhanu-linux.qualcomm.com ([10.242.50.201])
  by ironmsg02-blr.qualcomm.com with ESMTP; 18 Jul 2020 12:04:08 +0530
Received: by c-sbhanu-linux.qualcomm.com (Postfix, from userid 2344807)
        id A6F1B3FD5; Sat, 18 Jul 2020 12:04:06 +0530 (IST)
From:   Shaik Sajida Bhanu <sbhanu@codeaurora.org>
To:     adrian.hunter@intel.com, ulf.hansson@linaro.org,
        robh+dt@kernel.org, mka@chromium.org
Cc:     linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        agross@kernel.org, bjorn.andersson@linaro.org,
        Veerabhadrarao Badiganti <vbadigan@codeaurora.org>,
        Shaik Sajida Bhanu <sbhanu@codeaurora.org>
Subject: [PATCH V1] arm64: dts: qcom: SD-card GPIO pin set bias-pull up
Date:   Sat, 18 Jul 2020 12:04:01 +0530
Message-Id: <1595054041-6872-1-git-send-email-sbhanu@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>

On some sc7180 based platforms where external pull is not present on cd-gpio,
this gpio state is getting read as HIGH when sleep config is applied on it.
This is resulting in SDcard rescan after suspend-resume even though SDcard
is not present.

Update cd-gpio sleep config with bais-pull to fix this issue.

Also include xo clock to sdhc clocks list which will be used
in calculating MCLK_FREQ field of DLL_CONFIG2 register.

Signed-off-by: Shaik Sajida Bhanu <sbhanu@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index d78a066..8034fcc 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -682,8 +682,9 @@
 			interrupt-names = "hc_irq", "pwr_irq";
 
 			clocks = <&gcc GCC_SDCC1_APPS_CLK>,
-					<&gcc GCC_SDCC1_AHB_CLK>;
-			clock-names = "core", "iface";
+					<&gcc GCC_SDCC1_AHB_CLK>,
+					<&xo_board>;
+			clock-names = "core", "iface", "xo";
 			interconnects = <&aggre1_noc MASTER_EMMC &mc_virt SLAVE_EBI1>,
 				<&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_EMMC_CFG>;
 			interconnect-names = "sdhc-ddr","cpu-sdhc";
@@ -1819,7 +1820,7 @@
 
 				pinconf-sd-cd {
 					pins = "gpio69";
-					bias-disable;
+					bias-pull-up;
 					drive-strength = <2>;
 				};
 			};
@@ -2481,8 +2482,9 @@
 			interrupt-names = "hc_irq", "pwr_irq";
 
 			clocks = <&gcc GCC_SDCC2_APPS_CLK>,
-					<&gcc GCC_SDCC2_AHB_CLK>;
-			clock-names = "core", "iface";
+					<&gcc GCC_SDCC2_AHB_CLK>,
+					<&xo_board>;
+			clock-names = "core", "iface", "xo";
 
 			interconnects = <&aggre1_noc MASTER_SDCC_2 &mc_virt SLAVE_EBI1>,
 				<&gem_noc MASTER_APPSS_PROC &config_noc	SLAVE_SDCC_2>;
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

