Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A04BB40BEAA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Sep 2021 05:56:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236228AbhIOD54 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Sep 2021 23:57:56 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:31059 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232517AbhIOD5y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Sep 2021 23:57:54 -0400
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 14 Sep 2021 20:56:35 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg07-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 14 Sep 2021 20:56:33 -0700
X-QCInternal: smtphost
Received: from dikshita-linux.qualcomm.com ([10.204.65.237])
  by ironmsg01-blr.qualcomm.com with ESMTP; 15 Sep 2021 09:26:17 +0530
Received: by dikshita-linux.qualcomm.com (Postfix, from userid 347544)
        id C8A8021CE1; Wed, 15 Sep 2021 09:26:16 +0530 (IST)
From:   Dikshita Agarwal <dikshita@codeaurora.org>
To:     andy.gross@linaro.org, david.brown@linaro.org, robh+dt@kernel.org,
        mark.rutland@arm.com, devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, stanimir.varbanov@linaro.org,
        Dikshita Agarwal <dikshita@codeaurora.org>,
        Mansur Alisha Shaik <mansur@codeaurora.org>
Subject: [PATCH v6] arm64: dts: qcom: sc7280: Add venus DT node
Date:   Wed, 15 Sep 2021 09:26:13 +0530
Message-Id: <1631678173-23109-1-git-send-email-dikshita@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add DT entries for the sc7280 venus encoder/decoder.

Co-developed-by: Mansur Alisha Shaik <mansur@codeaurora.org>
Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
Signed-off-by: Mansur Alisha Shaik <mansur@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 75 ++++++++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index a8c274a..f171ababc 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -63,6 +63,11 @@
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
@@ -1063,6 +1068,76 @@
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
+		venus: video-codec@aa00000 {
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
+					<&videocc MVS0_GDSC>,
+					<&rpmhpd SC7280_CX>;
+			power-domain-names = "venus", "vcodec0", "cx";
+			operating-points-v2 = <&venus_opp_table>;
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
+
+			venus_opp_table: venus-opp-table {
+				compatible = "operating-points-v2";
+
+				opp-133330000 {
+					opp-hz = /bits/ 64 <133330000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+				};
+
+				opp-240000000 {
+					opp-hz = /bits/ 64 <240000000>;
+					required-opps = <&rpmhpd_opp_svs>;
+				};
+
+				opp-335000000 {
+					opp-hz = /bits/ 64 <335000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-424000000 {
+					opp-hz = /bits/ 64 <424000000>;
+					required-opps = <&rpmhpd_opp_nom>;
+				};
+
+				opp-460000048 {
+					opp-hz = /bits/ 64 <460000048>;
+					required-opps = <&rpmhpd_opp_turbo>;
+				};
+			};
+
+		};
+
 		videocc: clock-controller@aaf0000 {
 			compatible = "qcom,sc7280-videocc";
 			reg = <0 0xaaf0000 0 0x10000>;
-- 
2.7.4

