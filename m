Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B0038125C34
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2019 08:45:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726618AbfLSHpl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Dec 2019 02:45:41 -0500
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198]:24452 "EHLO
        alexa-out-blr-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726303AbfLSHpk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Dec 2019 02:45:40 -0500
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr-02.qualcomm.com with ESMTP/TLS/AES256-SHA; 19 Dec 2019 13:15:38 +0530
Received: from pillair-linux.qualcomm.com ([10.204.116.193])
  by ironmsg01-blr.qualcomm.com with ESMTP; 19 Dec 2019 13:15:28 +0530
Received: by pillair-linux.qualcomm.com (Postfix, from userid 452944)
        id 3A1DF366F; Thu, 19 Dec 2019 13:15:27 +0530 (IST)
From:   Rakesh Pillai <pillair@codeaurora.org>
To:     devicetree@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Rakesh Pillai <pillair@codeaurora.org>
Subject: [PATCH v2] arm64: dts: qcom: sc7180: Add WCN3990 WLAN module device node
Date:   Thu, 19 Dec 2019 13:15:21 +0530
Message-Id: <1576741521-30102-1-git-send-email-pillair@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add device node for the ath10k SNOC platform driver probe
and add resources required for WCN3990 on sc7180 soc.

Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sc7180-idp.dts |  5 +++++
 arch/arm64/boot/dts/qcom/sc7180.dtsi    | 28 ++++++++++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
index 189254f..b2ca143f 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
@@ -248,6 +248,11 @@
 	status = "okay";
 };
 
+&wifi {
+	status = "okay";
+	qcom,msa_fixed_perm;
+};
+
 /* PINCTRL - additions to nodes defined in sc7180.dtsi */
 
 &qup_i2c2_default {
diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 666e9b9..ce2d2a5 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -42,6 +42,12 @@
 			compatible = "qcom,cmd-db";
 			no-map;
 		};
+
+		wlan_fw_mem: memory@93900000 {
+			compatible = "removed-dma-pool";
+			no-map;
+			reg = <0 0x93900000 0 0x200000>;
+		};
 	};
 
 	cpus {
@@ -1119,6 +1125,28 @@
 				#clock-cells = <1>;
 			};
 		};
+
+		wifi: wifi@18800000 {
+			status = "disabled";
+			compatible = "qcom,wcn3990-wifi";
+			reg = <0 0x18800000 0 0x800000>;
+			reg-names = "membase";
+			iommus = <&apps_smmu 0xC0 0x1>;
+			interrupts =
+				<GIC_SPI 414 IRQ_TYPE_LEVEL_HIGH /* CE0 */ >,
+				<GIC_SPI 415 IRQ_TYPE_LEVEL_HIGH /* CE1 */ >,
+				<GIC_SPI 416 IRQ_TYPE_LEVEL_HIGH /* CE2 */ >,
+				<GIC_SPI 417 IRQ_TYPE_LEVEL_HIGH /* CE3 */ >,
+				<GIC_SPI 418 IRQ_TYPE_LEVEL_HIGH /* CE4 */ >,
+				<GIC_SPI 419 IRQ_TYPE_LEVEL_HIGH /* CE5 */ >,
+				<GIC_SPI 420 IRQ_TYPE_LEVEL_HIGH /* CE6 */ >,
+				<GIC_SPI 421 IRQ_TYPE_LEVEL_HIGH /* CE7 */ >,
+				<GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH /* CE8 */ >,
+				<GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH /* CE9 */ >,
+				<GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH /* CE10 */>,
+				<GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH /* CE11 */>;
+			memory-region = <&wlan_fw_mem>;
+		};
 	};
 
 	timer {
-- 
2.7.4

