Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB5FA3886FA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 May 2021 07:50:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241572AbhESFvh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 May 2021 01:51:37 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:14618 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344680AbhESFvS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 May 2021 01:51:18 -0400
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 18 May 2021 22:47:09 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 18 May 2021 22:47:08 -0700
X-QCInternal: smtphost
Received: from dikshita-linux.qualcomm.com ([10.204.65.237])
  by ironmsg01-blr.qualcomm.com with ESMTP; 19 May 2021 11:16:47 +0530
Received: by dikshita-linux.qualcomm.com (Postfix, from userid 347544)
        id 7EFD8219B3; Wed, 19 May 2021 11:16:46 +0530 (IST)
From:   Dikshita Agarwal <dikshita@codeaurora.org>
To:     david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, Dikshita Agarwal <dikshita@codeaurora.org>
Subject: [PATCH] arm64: dts: qcom: sc7280: Add venus DT node
Date:   Wed, 19 May 2021 11:16:44 +0530
Message-Id: <1621403204-21398-1-git-send-email-dikshita@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add DT entries for the sc7280 venus encoder/decoder.

Co-developed-by: Mansur Alisha Shaik <mansur@codeaurora.org>
Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 43 ++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 4c44a52..9b4cc9a 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -60,6 +60,11 @@
 			no-map;
 			reg = <0x0 0x80b00000 0x0 0x100000>;
 		};
+
+		video_mem: memory@8b200000 {
+			reg = <0x0 0x8b200000 0x0 0x500000>;
+			no-map;
+		};
 	};
 
 	cpus {
@@ -850,6 +855,44 @@
 			interrupts = <GIC_SPI 582 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		venus: video-codec@0aa00000 {
+			compatible = "qcom,sc7280-venus";
+			reg = <0 0x0aa00000 0 0xd0600>;
+			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+
+			clocks = <&videocc VIDEO_CC_MVSC_CORE_CLK>,
+				 <&videocc VIDEO_CC_MVSC_CTL_AXI_CLK>,
+				 <&videocc VIDEO_CC_VENUS_AHB_CLK>,
+				 <&videocc VIDEO_CC_MVS0_CORE_CLK>,
+				 <&videocc VIDEO_CC_MVS0_AXI_CLK>;
+			clock-names = "core", "bus", "iface",
+				      "vcodec_core", "vcodec_bus";
+
+			power-domains = <&videocc MVSC_GDSC>,
+					<&videocc MVS0_GDSC>;
+			power-domain-names = "venus", "vcodec0";
+
+			interconnects = <&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_VENUS_CFG 0>,
+					<&mmss_noc MASTER_VIDEO_P0 0 &mc_virt SLAVE_EBI1 0>;
+			interconnect-names = "cpu-cfg", "video-mem";
+
+			iommus = <&apps_smmu 0x2180 0x20>,
+				 <&apps_smmu 0x2184 0x20>;
+			memory-region = <&video_mem>;
+
+			video-decoder {
+				compatible = "venus-decoder";
+			};
+
+			video-encoder {
+				compatible = "venus-encoder";
+			};
+
+			video-firmware {
+				iommus = <&apps_smmu 0x21a2 0x0>;
+			};
+		};
+
 		videocc: clock-controller@aaf0000 {
 			compatible = "qcom,sc7280-videocc";
 			reg = <0 0xaaf0000 0 0x10000>;
-- 
2.7.4

