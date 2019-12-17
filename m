Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 05B361225F4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2019 08:55:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725975AbfLQHzU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Dec 2019 02:55:20 -0500
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198]:12670 "EHLO
        alexa-out-blr-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725794AbfLQHzT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Dec 2019 02:55:19 -0500
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr-02.qualcomm.com with ESMTP/TLS/AES256-SHA; 17 Dec 2019 13:25:17 +0530
Received: from dikshita-linux.qualcomm.com ([10.204.65.237])
  by ironmsg01-blr.qualcomm.com with ESMTP; 17 Dec 2019 13:25:00 +0530
Received: by dikshita-linux.qualcomm.com (Postfix, from userid 347544)
        id 767E2342E; Tue, 17 Dec 2019 13:24:59 +0530 (IST)
From:   Dikshita Agarwal <dikshita@codeaurora.org>
To:     andy.gross@linaro.org, david.brown@linaro.org, robh+dt@kernel.org,
        mark.rutland@arm.com, devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, Dikshita Agarwal <dikshita@codeaurora.org>
Subject: [PATCH] arm64: dts: sc7180: Enable video node
Date:   Tue, 17 Dec 2019 13:23:38 +0530
Message-Id: <1576569218-24817-1-git-send-email-dikshita@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This is a preparation gerrit to enable video node for sc7180.
This change depends on patch series Venus new features.

Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 52a5861..ccf9ef5 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -1297,6 +1297,34 @@
 
 			#freq-domain-cells = <1>;
 		};
+
+		venus: video-codec@aa00000 {
+			compatible = "qcom,sc7180-venus";
+			reg = <0 0x0aa00000 0 0xff000>;
+			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+			power-domains = <&videocc VENUS_GDSC>,
+					<&videocc VCODEC0_GDSC>;
+
+			power-domain-names = "venus", "vcodec0";
+			clocks = <&videocc VIDEO_CC_VENUS_CTL_CORE_CLK>,
+				<&videocc VIDEO_CC_VENUS_AHB_CLK>,
+				<&videocc VIDEO_CC_VENUS_CTL_AXI_CLK>,
+				<&videocc VIDEO_CC_VCODEC0_CORE_CLK>,
+				<&videocc VIDEO_CC_VCODEC0_AXI_CLK>;
+			clock-names = "core", "iface", "bus",
+					"vcodec0_core", "vcodec0_bus";
+			iommus = <&apps_smmu 0x0C00 0x60>;
+			memory-region = <&venus_mem>;
+			video-core0 {
+					compatible = "venus-decoder";
+			};
+			video-core1 {
+					compatible = "venus-encoder";
+			};
+			video-firmware {
+					iommus = <&apps_smmu 0x0C42 0x0>;
+			};
+		};
 	};
 
 	thermal-zones {
-- 
1.9.1

