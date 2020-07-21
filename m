Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9461D227D7E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jul 2020 12:46:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728037AbgGUKqf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Jul 2020 06:46:35 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:40782 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726089AbgGUKqf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Jul 2020 06:46:35 -0400
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 21 Jul 2020 03:46:35 -0700
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 21 Jul 2020 03:46:33 -0700
Received: from c-sbhanu-linux.qualcomm.com ([10.242.50.201])
  by ironmsg01-blr.qualcomm.com with ESMTP; 21 Jul 2020 16:16:28 +0530
Received: by c-sbhanu-linux.qualcomm.com (Postfix, from userid 2344807)
        id 33D9F3FFA; Tue, 21 Jul 2020 16:16:27 +0530 (IST)
From:   Shaik Sajida Bhanu <sbhanu@codeaurora.org>
To:     adrian.hunter@intel.com, ulf.hansson@linaro.org,
        robh+dt@kernel.org, mka@chromium.org
Cc:     linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        agross@kernel.org, bjorn.andersson@linaro.org,
        rnayak@codeaurora.org, Pradeep P V K <ppvk@codeaurora.org>,
        Shaik Sajida Bhanu <sbhanu@codeaurora.org>
Subject: [PATCH V2] arm64: dts: qcom: sc7180: Add bandwidth votes for eMMC and SDcard
Date:   Tue, 21 Jul 2020 16:16:21 +0530
Message-Id: <1595328381-29552-1-git-send-email-sbhanu@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Pradeep P V K <ppvk@codeaurora.org>

Add the bandwidth domain supporting performance state and
the corresponding OPP tables for the sdhc device on sc7180.

Signed-off-by: Pradeep P V K <ppvk@codeaurora.org>
Signed-off-by: Shaik Sajida Bhanu <sbhanu@codeaurora.org>
---

Changes since V1:
	- Incorporated review comments by Bjorn Andersson.
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 68f9894..d78a066 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -684,6 +684,9 @@
 			clocks = <&gcc GCC_SDCC1_APPS_CLK>,
 					<&gcc GCC_SDCC1_AHB_CLK>;
 			clock-names = "core", "iface";
+			interconnects = <&aggre1_noc MASTER_EMMC &mc_virt SLAVE_EBI1>,
+				<&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_EMMC_CFG>;
+			interconnect-names = "sdhc-ddr","cpu-sdhc";
 			power-domains = <&rpmhpd SC7180_CX>;
 			operating-points-v2 = <&sdhc1_opp_table>;
 
@@ -704,11 +707,15 @@
 				opp-100000000 {
 					opp-hz = /bits/ 64 <100000000>;
 					required-opps = <&rpmhpd_opp_low_svs>;
+					opp-peak-kBps = <100000 100000>;
+					opp-avg-kBps = <100000 50000>;
 				};
 
 				opp-384000000 {
 					opp-hz = /bits/ 64 <384000000>;
 					required-opps = <&rpmhpd_opp_svs_l1>;
+					opp-peak-kBps = <600000 900000>;
+					opp-avg-kBps = <261438 300000>;
 				};
 			};
 		};
@@ -2476,6 +2483,10 @@
 			clocks = <&gcc GCC_SDCC2_APPS_CLK>,
 					<&gcc GCC_SDCC2_AHB_CLK>;
 			clock-names = "core", "iface";
+
+			interconnects = <&aggre1_noc MASTER_SDCC_2 &mc_virt SLAVE_EBI1>,
+				<&gem_noc MASTER_APPSS_PROC &config_noc	SLAVE_SDCC_2>;
+			interconnect-names = "sdhc-ddr","cpu-sdhc";
 			power-domains = <&rpmhpd SC7180_CX>;
 			operating-points-v2 = <&sdhc2_opp_table>;
 
@@ -2489,11 +2500,15 @@
 				opp-100000000 {
 					opp-hz = /bits/ 64 <100000000>;
 					required-opps = <&rpmhpd_opp_low_svs>;
+					opp-peak-kBps = <160000 100000>;
+					opp-avg-kBps = <80000 50000>;
 				};
 
 				opp-202000000 {
 					opp-hz = /bits/ 64 <202000000>;
 					required-opps = <&rpmhpd_opp_svs_l1>;
+					opp-peak-kBps = <200000	120000>;
+					opp-avg-kBps = <100000 60000>;
 				};
 			};
 		};
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

