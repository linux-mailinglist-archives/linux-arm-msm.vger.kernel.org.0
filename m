Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE81F110A6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 May 2019 02:24:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726242AbfEBAYN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 May 2019 20:24:13 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:33503 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726173AbfEBAYN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 May 2019 20:24:13 -0400
Received: by mail-pl1-f195.google.com with SMTP id y3so190131plp.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 May 2019 17:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=6i4ui663zNE9ypsd/NfH9KziaP1LvpsqMxJ3qDonqk0=;
        b=fwOGJqvuP4XXkHYn+DW2a/cjGVGojLiN7Va32r24E+I1ZedadTVZSsBKfuhDiJl0/t
         brkfjsC6LlipFjTKODuu3/8spNbHX9aK4N5vlrqyYGK1SdEq1KyvM+auUPVoHz6SJjq7
         vNVIN0v/y7r/hs/Yzq3dr4kEEj/PcrFGUVAQKD4fjEpechjChy+kYOaaWfSE1VkvJCrq
         Z+wPhIs0CJ0VfOJcdF+2kOLqMjmEw3Ts/5Cz5kOgFdw/7gWbC9mhtB6KgWjM0v/fnAeE
         7U/eBecllhwQoEIxDUwS7N2AneQga3sRYgJC8lY3Oevo1arTp9NSc5/e4213t/IUrq2j
         p9uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=6i4ui663zNE9ypsd/NfH9KziaP1LvpsqMxJ3qDonqk0=;
        b=YYZav7twuYZ5ejfYBvSJSuBHyyAP/bvOPYCJc3fKH7Lg0tD2KwbhMFMAZKjAPSQYC7
         hkDDrkuQU2I//qiWcTpERuS4HgqWOq19yVQdoaCOZSy4114m8clWGIYtix9MTZutfrsN
         htzz9Sv4eb+KKKclZoi6Ho4/KfeYGzsE/hgL9DphN2sZSvMNd3k4NILhfeWyobzqlomw
         eiPafQ+yDorPycNOhmIGcjXF7jPy9PaqE84a/6Ig+coqRbhq5aP40MBI3Nf8M0goLDN8
         KRPDZsEXpyRnrz+/hN00qEeikaFRacb6GQU0XH90gupK3N+iLwDLEvvOQq3FlVGM7Bo9
         1BdQ==
X-Gm-Message-State: APjAAAV69E7EzxSfZllSIkfYAkDYOROZLeVvU7+e81j5f80T4tRVSgoD
        di8ZBrKqGvBpXWFt0NoXcH5phR+I1ys=
X-Google-Smtp-Source: APXvYqzsMqzfs1+4opAQp8TarKm2TqdEKJBhLFHzjsPwteg63QCQGp41VfqPQgcAvKLduWkfD/Ia3w==
X-Received: by 2002:a17:902:7e04:: with SMTP id b4mr495937plm.211.1556756651984;
        Wed, 01 May 2019 17:24:11 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id m16sm107740145pfi.29.2019.05.01.17.24.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 01 May 2019 17:24:10 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3] arm64: dts: qcom: qcs404: Add PCIe related nodes
Date:   Wed,  1 May 2019 17:24:08 -0700
Message-Id: <20190502002408.10719-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.18.0
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The QCS404 has a PCIe2 PHY and a Qualcomm PCIe controller, add these to
the platform dtsi and enable them for the EVB with the perst gpio
and analog supplies defined.

Reviewed-by: Niklas Cassel <niklas.cassel@linaro.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

The patch depends on the acceptance of:
https://lore.kernel.org/lkml/20190502002138.10646-1-bjorn.andersson@linaro.org/
https://lore.kernel.org/lkml/20190502001406.10431-2-bjorn.andersson@linaro.org/
https://lore.kernel.org/lkml/20190502001955.10575-3-bjorn.andersson@linaro.org/

Changes since v2:
- None

 arch/arm64/boot/dts/qcom/qcs404-evb.dtsi | 25 +++++++++
 arch/arm64/boot/dts/qcom/qcs404.dtsi     | 67 ++++++++++++++++++++++++
 2 files changed, 92 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
index 2c3127167e3c..988d21ca0df1 100644
--- a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
@@ -68,6 +68,22 @@
 	};
 };
 
+&pcie {
+	status = "ok";
+
+	perst-gpio = <&tlmm 43 GPIO_ACTIVE_LOW>;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&perst_state>;
+};
+
+&pcie_phy {
+	status = "ok";
+
+	vdda-vp-supply = <&vreg_l3_1p05>;
+	vdda-vph-supply = <&vreg_l5_1p8>;
+};
+
 &remoteproc_adsp {
 	status = "ok";
 };
@@ -184,6 +200,15 @@
 };
 
 &tlmm {
+	perst_state: perst {
+		pins = "gpio43";
+		function = "gpio";
+
+		drive-strength = <2>;
+		bias-disable;
+		output-low;
+	};
+
 	sdc1_on: sdc1-on {
 		clk {
 			pins = "sdc1_clk";
diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index ffedf9640af7..f41feab8996c 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -4,6 +4,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/qcom,gcc-qcs404.h>
 #include <dt-bindings/clock/qcom,rpmcc.h>
+#include <dt-bindings/gpio/gpio.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -383,6 +384,7 @@
 			compatible = "qcom,gcc-qcs404";
 			reg = <0x01800000 0x80000>;
 			#clock-cells = <1>;
+			#reset-cells = <1>;
 
 			assigned-clocks = <&gcc GCC_APSS_AHB_CLK_SRC>;
 			assigned-clock-rates = <19200000>;
@@ -411,6 +413,21 @@
 			#interrupt-cells = <4>;
 		};
 
+		pcie_phy: phy@7786000 {
+			compatible = "qcom,qcs404-pcie2-phy", "qcom,pcie2-phy";
+			reg = <0x07786000 0xb8>;
+
+			clocks = <&gcc GCC_PCIE_0_PIPE_CLK>;
+			resets = <&gcc GCC_PCIEPHY_0_PHY_BCR>,
+				 <&gcc GCC_PCIE_0_PIPE_ARES>;
+			reset-names = "phy", "pipe";
+
+			clock-output-names = "pcie_0_pipe_clk";
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
+
 		sdcc1: sdcc@7804000 {
 			compatible = "qcom,sdhci-msm-v5";
 			reg = <0x07804000 0x1000>, <0x7805000 0x1000>;
@@ -796,6 +813,56 @@
 				status = "disabled";
 			};
 		};
+
+		pcie: pci@10000000 {
+			compatible = "qcom,pcie-qcs404", "snps,dw-pcie";
+			reg =  <0x10000000 0xf1d>,
+			       <0x10000f20 0xa8>,
+			       <0x07780000 0x2000>,
+			       <0x10001000 0x2000>;
+			reg-names = "dbi", "elbi", "parf", "config";
+			device_type = "pci";
+			linux,pci-domain = <0>;
+			bus-range = <0x00 0xff>;
+			num-lanes = <1>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+
+			ranges = <0x81000000 0 0          0x10003000 0 0x00010000>, /* I/O */
+				 <0x82000000 0 0x10013000 0x10013000 0 0x007ed000>; /* memory */
+
+			interrupts = <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "msi";
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 0x7>;
+			interrupt-map = <0 0 0 1 &intc GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
+					<0 0 0 2 &intc GIC_SPI 224 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
+					<0 0 0 3 &intc GIC_SPI 267 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
+					<0 0 0 4 &intc GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
+			clocks = <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
+				 <&gcc GCC_PCIE_0_AUX_CLK>,
+				 <&gcc GCC_PCIE_0_MSTR_AXI_CLK>,
+				 <&gcc GCC_PCIE_0_SLV_AXI_CLK>;
+			clock-names = "iface", "aux", "master_bus", "slave_bus";
+
+			resets = <&gcc GCC_PCIE_0_AXI_MASTER_ARES>,
+				 <&gcc GCC_PCIE_0_AXI_SLAVE_ARES>,
+				 <&gcc GCC_PCIE_0_AXI_MASTER_STICKY_ARES>,
+				 <&gcc GCC_PCIE_0_CORE_STICKY_ARES>,
+				 <&gcc GCC_PCIE_0_BCR>,
+				 <&gcc GCC_PCIE_0_AHB_ARES>;
+			reset-names = "axi_m",
+				      "axi_s",
+				      "axi_m_sticky",
+				      "pipe_sticky",
+				      "pwr",
+				      "ahb";
+
+			phys = <&pcie_phy>;
+			phy-names = "pciephy";
+
+			status = "disabled";
+		};
 	};
 
 	timer {
-- 
2.18.0

