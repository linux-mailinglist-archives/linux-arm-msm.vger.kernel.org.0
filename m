Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABA3A3A504E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Jun 2021 21:24:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230136AbhFLT0L (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 12 Jun 2021 15:26:11 -0400
Received: from m-r1.th.seeweb.it ([5.144.164.170]:33459 "EHLO
        m-r1.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229874AbhFLT0J (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 12 Jun 2021 15:26:09 -0400
Received: from localhost.localdomain (83.6.168.161.neoplus.adsl.tpnet.pl [83.6.168.161])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id 9284F1F530;
        Sat, 12 Jun 2021 21:24:07 +0200 (CEST)
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
Subject: [PATCH v2 2/3] arm64: dts: qcom: sm8250: Add SDHCI2 pinctrl
Date:   Sat, 12 Jun 2021 21:23:57 +0200
Message-Id: <20210612192358.62602-2-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210612192358.62602-1-konrad.dybcio@somainline.org>
References: <20210612192358.62602-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add required pins for SDHCI2, so that the interface can work reliably.
The configuration comes from a MTP board, which conveniently means it's
going to be correct for the vast majority of phones (and other devices).

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
Changes since v1:
- Separate this into its own patch

 arch/arm64/boot/dts/qcom/sm8250.dtsi | 32 ++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index fc1049c2bb11..fe858abbff5d 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -8,6 +8,7 @@
 #include <dt-bindings/clock/qcom,gcc-sm8250.h>
 #include <dt-bindings/clock/qcom,gpucc-sm8250.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
+#include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interconnect/qcom,osm-l3.h>
 #include <dt-bindings/interconnect/qcom,sm8250.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
@@ -2157,6 +2158,10 @@ sdhc_2: sdhci@8804000 {
 			power-domains = <&rpmhpd SM8250_CX>;
 			operating-points-v2 = <&sdhc2_opp_table>;
 
+			cd-gpios = <&tlmm 77 GPIO_ACTIVE_HIGH>;
+			pinctrl-0 = <&sdc2_default_state &sdc2_card_det_n>;
+			pinctrl-names = "default";
+
 			status = "disabled";
 
 			sdhc2_opp_table: sdhc2-opp-table {
@@ -3401,6 +3406,33 @@ ws {
 					output-high;
 				};
 			};
+
+			sdc2_default_state: sdc2-default {
+				clk {
+					pins = "sdc2_clk";
+					drive-strength = <16>;
+					bias-disable;
+				};
+
+				cmd {
+					pins = "sdc2_cmd";
+					drive-strength = <16>;
+					bias-pull-up;
+				};
+
+				data {
+					pins = "sdc2_data";
+					drive-strength = <16>;
+					bias-pull-up;
+				};
+			};
+
+			sdc2_card_det_n: sd-card-det-n {
+				pins = "gpio77";
+				function = "gpio";
+				bias-pull-up;
+				drive-strength = <2>;
+			};
 		};
 
 		apps_smmu: iommu@15000000 {
-- 
2.32.0

