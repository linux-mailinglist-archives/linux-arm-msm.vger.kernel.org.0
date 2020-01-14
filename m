Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0DB3413A9D1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2020 13:55:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728801AbgANMyo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Jan 2020 07:54:44 -0500
Received: from alexa-out-blr-01.qualcomm.com ([103.229.18.197]:56403 "EHLO
        alexa-out-blr-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728795AbgANMyo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Jan 2020 07:54:44 -0500
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by alexa-out-blr-01.qualcomm.com with ESMTP/TLS/AES256-SHA; 14 Jan 2020 18:24:00 +0530
Received: from dikshita-linux.qualcomm.com ([10.204.65.237])
  by ironmsg02-blr.qualcomm.com with ESMTP; 14 Jan 2020 18:23:48 +0530
Received: by dikshita-linux.qualcomm.com (Postfix, from userid 347544)
        id 046B33588; Tue, 14 Jan 2020 18:23:46 +0530 (IST)
From:   Dikshita Agarwal <dikshita@codeaurora.org>
To:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, vgarodia@codeaurora.org,
        Dikshita Agarwal <dikshita@codeaurora.org>
Subject: [PATCH V4 1/4] arm64: dts: sc7180: Add Venus video codec DT node
Date:   Tue, 14 Jan 2020 18:23:33 +0530
Message-Id: <1579006416-11599-2-git-send-email-dikshita@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1579006416-11599-1-git-send-email-dikshita@codeaurora.org>
References: <1579006416-11599-1-git-send-email-dikshita@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This adds Venus video codec DT node for sc7180.

Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 3676bfd..6ecacca 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -10,6 +10,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/phy/phy-qcom-qusb2.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
+#include <dt-bindings/clock/qcom,videocc-sc7180.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -66,6 +67,11 @@
 			compatible = "qcom,cmd-db";
 			no-map;
 		};
+
+		venus_mem: memory@8f600000 {
+			reg = <0 0x8f600000 0 0x500000>;
+			no-map;
+		};
 	};
 
 	cpus {
@@ -1043,6 +1049,36 @@
 			};
 		};
 
+		venus: video-codec@aa00000 {
+			compatible = "qcom,sc7180-venus";
+			reg = <0 0x0aa00000 0 0xff000>;
+			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+			power-domains = <&videocc VENUS_GDSC>,
+					<&videocc VCODEC0_GDSC>;
+			power-domain-names = "venus", "vcodec0";
+			clocks = <&videocc VIDEO_CC_VENUS_CTL_CORE_CLK>,
+				 <&videocc VIDEO_CC_VENUS_AHB_CLK>,
+				 <&videocc VIDEO_CC_VENUS_CTL_AXI_CLK>,
+				 <&videocc VIDEO_CC_VCODEC0_CORE_CLK>,
+				 <&videocc VIDEO_CC_VCODEC0_AXI_CLK>;
+			clock-names = "core", "iface", "bus",
+				      "vcodec0_core", "vcodec0_bus";
+			iommus = <&apps_smmu 0x0c00 0x60>;
+			memory-region = <&venus_mem>;
+
+			interconnects = <&mmss_noc MASTER_VIDEO_P0 &mc_virt SLAVE_EBI1>,
+					<&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_VENUS_CFG>;
+			interconnect-names = "video-mem", "cpu-cfg";
+
+			video-decoder {
+				compatible = "venus-decoder";
+			};
+
+			video-encoder {
+				compatible = "venus-encoder";
+			};
+		};
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sc7180-pdc", "qcom,pdc";
 			reg = <0 0x0b220000 0 0x30000>;
-- 
1.9.1

