Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4781B351EB0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Apr 2021 20:55:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236648AbhDASpd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Apr 2021 14:45:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:32790 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238357AbhDASh7 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Apr 2021 14:37:59 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id DF4D3610D0;
        Thu,  1 Apr 2021 11:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617276781;
        bh=hfjvB9ERt7bvtAIEkjFz4Hvuc2oFEMjwZBh8Tsw4mdI=;
        h=From:To:Cc:Subject:Date:From;
        b=YOBsd9WVnLhP8AWR4lzPTOPl5RcODxd2bxg/z8jI0NG5w+uhlfyhIqCrCqOZfuh4t
         zRfRcCTUpp7ZD0VoUdODDpX0avFN0ZpCP73Fxcr1F49rIp/WqAkONKDIniby1yFcu9
         V3rKBjxRvVLK/hUk0b4Hv3UKSIhCNxSz3ZkdzFIVeuZL4iKjlPoadB9lhegO68Lkud
         rNEFJvuuhT2LcMNh3VTN8xEwIDICZk00cm9LSYb8ZU0hK5ZVi2G8p+bKpZynFdL0Ve
         HfaxgSYas6h0lt/vn1AhhiDRt4frwjd02hjWEtqZ9ynXjy3A+7ZcNykrgJdYAM6dTb
         D5cG0nRRuX+VQ==
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: sm8350: Add interconnects
Date:   Thu,  1 Apr 2021 17:02:52 +0530
Message-Id: <20210401113252.3078466-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add interconnect nodes and add them for modem and cdsp nodes

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 79 ++++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index a0d459069211..72cd3e7574a0 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/interconnect/qcom,sm8350.h>
 #include <dt-bindings/clock/qcom,gcc-sm8350.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
@@ -557,6 +558,62 @@ apps_smmu: iommu@15000000 {
 					<GIC_SPI 707 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		config_noc: interconnect@1500000 {
+			compatible = "qcom,sm8350-config-noc";
+			reg = <0 0x01500000 0 0xa580>;
+			#interconnect-cells = <1>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
+		mc_virt: interconnect@1580000 {
+			compatible = "qcom,sm8350-mc-virt";
+			reg = <0 0x01580000 0 0x1000>;
+			#interconnect-cells = <1>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
+		system_noc: interconnect@1680000 {
+			compatible = "qcom,sm8350-system-noc";
+			reg = <0 0x01680000 0 0x1c200>;
+			#interconnect-cells = <1>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
+		aggre1_noc: interconnect@16e0000 {
+			compatible = "qcom,sm8350-aggre1-noc";
+			reg = <0 0x016e0000 0 0x1f180>;
+			#interconnect-cells = <1>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
+		aggre2_noc: interconnect@1700000 {
+			compatible = "qcom,sm8350-aggre2-noc";
+			reg = <0 0x01700000 0 0x33000>;
+			#interconnect-cells = <1>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
+		mmss_noc: interconnect@1740000 {
+			compatible = "qcom,sm8350-mmss-noc";
+			reg = <0 0x01740000 0 0x1f080>;
+			#interconnect-cells = <1>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
+		lpass_ag_noc: interconnect@3c40000 {
+			compatible = "qcom,sm8350-lpass-ag-noc";
+			reg = <0 0x03c40000 0 0xf080>;
+			#interconnect-cells = <1>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
+		compute_noc: interconnect@a0c0000{
+			compatible = "qcom,sm8350-compute-noc";
+			reg = <0 0x0a0c0000 0 0xa180>;
+			#interconnect-cells = <1>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
 		tcsr_mutex: hwlock@1f40000 {
 			compatible = "qcom,tcsr-mutex";
 			reg = <0x0 0x01f40000 0x0 0x40000>;
@@ -584,6 +641,8 @@ mpss: remoteproc@4080000 {
 					<&rpmhpd SM8350_MSS>;
 			power-domain-names = "load_state", "cx", "mss";
 
+			interconnects = <&mc_virt 0 &mc_virt 1>;
+
 			memory-region = <&pil_modem_mem>;
 
 			qcom,smem-states = <&smp2p_modem_out 0>;
@@ -787,6 +846,10 @@ rpmhpd_opp_turbo_l1: opp10 {
 					};
 				};
 			};
+
+			apps_bcm_voter: bcm_voter {
+				compatible = "qcom,bcm-voter";
+			};
 		};
 
 		ufs_mem_hc: ufshc@1d84000 {
@@ -925,6 +988,8 @@ cdsp: remoteproc@98900000 {
 					<&rpmhpd SM8350_MXC>;
 			power-domain-names = "load_state", "cx", "mxc";
 
+			interconnects = <&compute_noc 1 &mc_virt 1>;
+
 			memory-region = <&pil_cdsp_mem>;
 
 			qcom,smem-states = <&smp2p_cdsp_out 0>;
@@ -1036,6 +1101,20 @@ usb_2_ssphy: phy@88ebe00 {
 			};
 		};
 
+		dc_noc: interconnect@90e0000 {
+			compatible = "qcom,sm8350-dc-noc";
+			reg = <0 0x090c0000 0 0x4200>;
+			#interconnect-cells = <1>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
+		gem_noc: interconnect@9100000 {
+			compatible = "qcom,sm8350-gem-noc";
+			reg = <0 0x09100000 0 0xb4000>;
+			#interconnect-cells = <1>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
 		usb_1: usb@a6f8800 {
 			compatible = "qcom,sm8350-dwc3", "qcom,dwc3";
 			reg = <0 0x0a6f8800 0 0x400>;
-- 
2.26.3

