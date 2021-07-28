Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A154F3D9864
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jul 2021 00:25:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232244AbhG1WZ7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Jul 2021 18:25:59 -0400
Received: from relay01.th.seeweb.it ([5.144.164.162]:40463 "EHLO
        relay01.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232169AbhG1WZ6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Jul 2021 18:25:58 -0400
Received: from localhost.localdomain (83.6.168.174.neoplus.adsl.tpnet.pl [83.6.168.174])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id BB35F1FAEC;
        Thu, 29 Jul 2021 00:25:53 +0200 (CEST)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     ~postmarketos/upstreaming@lists.sr.ht
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 04/39] arm64: dts: qcom: sdm630: Add interconnect provider nodes
Date:   Thu, 29 Jul 2021 00:25:07 +0200
Message-Id: <20210728222542.54269-5-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210728222542.54269-1-konrad.dybcio@somainline.org>
References: <20210728222542.54269-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add interconnect provider nodes to allow for NoC bus scaling.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 59 ++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index e2cbe210048e..c46b7327afbe 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/clock/qcom,gcc-sdm660.h>
+#include <dt-bindings/clock/qcom,mmcc-sdm660.h>
 #include <dt-bindings/clock/qcom,rpmcc.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/gpio/gpio.h>
@@ -516,11 +517,38 @@ rng: rng@793000 {
 			clock-names = "core";
 		};
 
+		bimc: interconnect@1008000 {
+			compatible = "qcom,sdm660-bimc";
+			reg = <0x01008000 0x78000>;
+			#interconnect-cells = <1>;
+			clock-names = "bus", "bus_a";
+			clocks = <&rpmcc RPM_SMD_BIMC_CLK>,
+				 <&rpmcc RPM_SMD_BIMC_A_CLK>;
+		};
+
 		restart@10ac000 {
 			compatible = "qcom,pshold";
 			reg = <0x010ac000 0x4>;
 		};
 
+		cnoc: interconnect@1500000 {
+			compatible = "qcom,sdm660-cnoc";
+			reg = <0x01500000 0x10000>;
+			#interconnect-cells = <1>;
+			clock-names = "bus", "bus_a";
+			clocks = <&rpmcc RPM_SMD_CNOC_CLK>,
+				 <&rpmcc RPM_SMD_CNOC_A_CLK>;
+		};
+
+		snoc: interconnect@1626000 {
+			compatible = "qcom,sdm660-snoc";
+			reg = <0x01626000 0x7090>;
+			#interconnect-cells = <1>;
+			clock-names = "bus", "bus_a";
+			clocks = <&rpmcc RPM_SMD_SNOC_CLK>,
+				 <&rpmcc RPM_SMD_SNOC_A_CLK>;
+		};
+
 		anoc2_smmu: iommu@16c0000 {
 			compatible = "qcom,sdm630-smmu-v2", "qcom,smmu-v2";
 			reg = <0x016c0000 0x40000>;
@@ -564,6 +592,25 @@ anoc2_smmu: iommu@16c0000 {
 			status = "disabled";
 		};
 
+		a2noc: interconnect@1704000 {
+			compatible = "qcom,sdm660-a2noc";
+			reg = <0x01704000 0xc100>;
+			#interconnect-cells = <1>;
+			clock-names = "bus", "bus_a";
+			clocks = <&rpmcc RPM_SMD_AGGR2_NOC_CLK>,
+				 <&rpmcc RPM_SMD_AGGR2_NOC_A_CLK>;
+		};
+
+		mnoc: interconnect@1745000 {
+			compatible = "qcom,sdm660-mnoc";
+			reg = <0x01745000 0xA010>;
+			#interconnect-cells = <1>;
+			clock-names = "bus", "bus_a", "iface";
+			clocks = <&rpmcc RPM_SMD_MMSSNOC_AXI_CLK>,
+				 <&rpmcc RPM_SMD_MMSSNOC_AXI_CLK_A>,
+				 <&mmcc AHB_CLK_SRC>;
+		};
+
 		tcsr_mutex_regs: syscon@1f40000 {
 			compatible = "syscon";
 			reg = <0x01f40000 0x20000>;
@@ -1156,6 +1203,18 @@ mmss_smmu: iommu@cd00000 {
 			status = "disabled";
 		};
 
+		gnoc: interconnect@17900000 {
+			compatible = "qcom,sdm660-gnoc";
+			reg = <0x17900000 0xe000>;
+			#interconnect-cells = <1>;
+			/*
+			 * This one apparently features no clocks,
+			 * so let's not mess with the driver needlessly
+			 */
+			clock-names = "bus", "bus_a";
+			clocks = <&xo_board>, <&xo_board>;
+		};
+
 		apcs_glb: mailbox@17911000 {
 			compatible = "qcom,sdm660-apcs-hmss-global";
 			reg = <0x17911000 0x1000>;
-- 
2.32.0

