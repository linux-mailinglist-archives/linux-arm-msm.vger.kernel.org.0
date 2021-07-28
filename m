Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 391593D988F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jul 2021 00:26:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233023AbhG1W03 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Jul 2021 18:26:29 -0400
Received: from relay02.th.seeweb.it ([5.144.164.163]:44003 "EHLO
        relay02.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232650AbhG1W0P (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Jul 2021 18:26:15 -0400
Received: from localhost.localdomain (83.6.168.174.neoplus.adsl.tpnet.pl [83.6.168.174])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id D267E20055;
        Thu, 29 Jul 2021 00:26:08 +0200 (CEST)
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
Subject: [PATCH 17/39] arm64: dts: qcom: sdm630: Add ADSP remoteproc configuration
Date:   Thu, 29 Jul 2021 00:25:20 +0200
Message-Id: <20210728222542.54269-18-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210728222542.54269-1-konrad.dybcio@somainline.org>
References: <20210728222542.54269-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Configure the ADSP remote processor and add a simple sound{}
node to make way for future development.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 83 ++++++++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index 936929e69be1..50dea8afd2a1 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -10,6 +10,7 @@
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/soc/qcom,apr.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -521,6 +522,9 @@ modem_smp2p_in: slave-kernel {
 		};
 	};
 
+	sound: sound {
+	};
+
 	thermal-zones {
 		aoss-thermal {
 			polling-delay-passive = <250>;
@@ -1882,6 +1886,85 @@ mmss_smmu: iommu@cd00000 {
 			status = "disabled";
 		};
 
+		adsp_pil: remoteproc@15700000 {
+			compatible = "qcom,sdm660-adsp-pil";
+			reg = <0x15700000 0x4040>;
+
+			interrupts-extended =
+				<&intc GIC_SPI 162 IRQ_TYPE_EDGE_RISING>,
+				<&adsp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+				<&adsp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+				<&adsp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+				<&adsp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog", "fatal", "ready",
+					  "handover", "stop-ack";
+
+			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>;
+			clock-names = "xo";
+
+			memory-region = <&adsp_region>;
+			power-domains = <&rpmpd SDM660_VDDCX>;
+			power-domain-names = "cx";
+
+			qcom,smem-states = <&adsp_smp2p_out 0>;
+			qcom,smem-state-names = "stop";
+
+			glink-edge {
+				interrupts = <GIC_SPI 157 IRQ_TYPE_EDGE_RISING>;
+
+				label = "lpass";
+				mboxes = <&apcs_glb 9>;
+				qcom,remote-pid = <2>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				apr {
+					compatible = "qcom,apr-v2";
+					qcom,glink-channels = "apr_audio_svc";
+					qcom,apr-domain = <APR_DOMAIN_ADSP>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					q6core {
+						reg = <APR_SVC_ADSP_CORE>;
+						compatible = "qcom,q6core";
+					};
+
+					q6afe: apr-service@4 {
+						compatible = "qcom,q6afe";
+						reg = <APR_SVC_AFE>;
+						q6afedai: dais {
+							compatible = "qcom,q6afe-dais";
+							#address-cells = <1>;
+							#size-cells = <0>;
+							#sound-dai-cells = <1>;
+						};
+					};
+
+					q6asm: apr-service@7 {
+						compatible = "qcom,q6asm";
+						reg = <APR_SVC_ASM>;
+						q6asmdai: dais {
+							compatible = "qcom,q6asm-dais";
+							#address-cells = <1>;
+							#size-cells = <0>;
+							#sound-dai-cells = <1>;
+							iommus = <&lpass_smmu 1>;
+						};
+					};
+
+					q6adm: apr-service@8 {
+						compatible = "qcom,q6adm";
+						reg = <APR_SVC_ADM>;
+						q6routing: routing {
+							compatible = "qcom,q6adm-routing";
+							#sound-dai-cells = <0>;
+						};
+					};
+				};
+			};
+		};
+
 		gnoc: interconnect@17900000 {
 			compatible = "qcom,sdm660-gnoc";
 			reg = <0x17900000 0xe000>;
-- 
2.32.0

