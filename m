Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E54DC3A5CB2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jun 2021 08:00:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231949AbhFNGCW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Jun 2021 02:02:22 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:6371 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229696AbhFNGCV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Jun 2021 02:02:21 -0400
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 13 Jun 2021 23:00:19 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 13 Jun 2021 23:00:17 -0700
X-QCInternal: smtphost
Received: from dikshita-linux.qualcomm.com ([10.204.65.237])
  by ironmsg01-blr.qualcomm.com with ESMTP; 14 Jun 2021 11:29:55 +0530
Received: by dikshita-linux.qualcomm.com (Postfix, from userid 347544)
        id 9CC5B21AFC; Mon, 14 Jun 2021 11:29:54 +0530 (IST)
From:   Dikshita Agarwal <dikshita@codeaurora.org>
To:     david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, Dikshita Agarwal <dikshita@codeaurora.org>
Subject: [PATCH v4] arm64: dts: qcom: sc7280: Add venus DT node
Date:   Mon, 14 Jun 2021 11:29:51 +0530
Message-Id: <1623650391-28144-1-git-send-email-dikshita@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add DT entries for the sc7280 venus encoder/decoder.

Co-developed-by: Mansur Alisha Shaik <mansur@codeaurora.org>
Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>

change since v3:
 - added firmware node back.
change since v2:
 - removed firmware node.
change since v1:
 - added rpmh power domain and opp table.

this patch depends on [1],[2] & [3].

[1] https://patchwork.kernel.org/project/linux-clk/list/?series=449621
[2] https://lkml.org/lkml/2021/4/9/812
[3] https://lore.kernel.org/patchwork/project/lkml/list/?series=488429#
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 75 ++++++++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 4c44a52..4982f96 100644
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
@@ -850,6 +855,76 @@
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
+				opp-460000000 {
+					opp-hz = /bits/ 64 <460000000>;
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

