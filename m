Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B86F0325F12
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Feb 2021 09:33:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230112AbhBZIbG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Feb 2021 03:31:06 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:60875 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbhBZIbD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Feb 2021 03:31:03 -0500
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 26 Feb 2021 00:30:02 -0800
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 26 Feb 2021 00:29:59 -0800
X-QCInternal: smtphost
Received: from gokulsri-linux.qualcomm.com ([10.201.2.207])
  by ironmsg01-blr.qualcomm.com with ESMTP; 26 Feb 2021 13:59:52 +0530
Received: by gokulsri-linux.qualcomm.com (Postfix, from userid 432570)
        id 65E5F20E0E; Fri, 26 Feb 2021 13:59:51 +0530 (IST)
From:   Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
To:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        manivannan.sadhasivam@linaro.org, robh+dt@kernel.org,
        sboyd@kernel.org, sricharan@codeaurora.org,
        Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
Subject: [PATCH v5] arm64: dts: Add board support for HK10
Date:   Fri, 26 Feb 2021 13:58:30 +0530
Message-Id: <1614328110-28866-2-git-send-email-gokulsri@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1614328110-28866-1-git-send-email-gokulsri@codeaurora.org>
References: <1614328110-28866-1-git-send-email-gokulsri@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add initial support for IPQ8074 SoC based HK10-C1
and HK10-C2 evaluation boards.

Signed-off-by: Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/Makefile            |  2 +
 arch/arm64/boot/dts/qcom/ipq8074-hk10-c1.dts | 11 ++++
 arch/arm64/boot/dts/qcom/ipq8074-hk10-c2.dts | 14 +++++
 arch/arm64/boot/dts/qcom/ipq8074-hk10.dtsi   | 76 ++++++++++++++++++++++++++++
 4 files changed, 103 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/ipq8074-hk10-c1.dts
 create mode 100644 arch/arm64/boot/dts/qcom/ipq8074-hk10-c2.dts
 create mode 100644 arch/arm64/boot/dts/qcom/ipq8074-hk10.dtsi

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 5113fac..4098c5e 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -4,6 +4,8 @@ dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-db820c.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-ifc6640.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq6018-cp01-c1.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq8074-hk01.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= ipq8074-hk10-c1.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= ipq8074-hk10-c2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-longcheer-l8150.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-samsung-a3u-eur.dtb
diff --git a/arch/arm64/boot/dts/qcom/ipq8074-hk10-c1.dts b/arch/arm64/boot/dts/qcom/ipq8074-hk10-c1.dts
new file mode 100644
index 00000000..2bfcf42
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/ipq8074-hk10-c1.dts
@@ -0,0 +1,11 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Copyright (c) 2020 The Linux Foundation. All rights reserved.
+ */
+/dts-v1/;
+
+#include "ipq8074-hk10.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. IPQ8074/AP-HK10-C1";
+	compatible = "qcom,ipq8074-hk10-c1", "qcom,ipq8074";
+};
diff --git a/arch/arm64/boot/dts/qcom/ipq8074-hk10-c2.dts b/arch/arm64/boot/dts/qcom/ipq8074-hk10-c2.dts
new file mode 100644
index 00000000..1897e96
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/ipq8074-hk10-c2.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/dts-v1/;
+/* Copyright (c) 2020 The Linux Foundation. All rights reserved.
+ */
+#include "ipq8074-hk10.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. IPQ8074/AP-HK10-C2";
+	compatible = "qcom,ipq8074-hk10-c2", "qcom,ipq8074";
+};
+
+&q6v5_wcss {
+	status = "disabled";
+};
diff --git a/arch/arm64/boot/dts/qcom/ipq8074-hk10.dtsi b/arch/arm64/boot/dts/qcom/ipq8074-hk10.dtsi
new file mode 100644
index 00000000..0827055
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/ipq8074-hk10.dtsi
@@ -0,0 +1,76 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2020, The Linux Foundation. All rights reserved.
+ */
+/dts-v1/;
+
+#include "ipq8074.dtsi"
+
+/ {
+	#address-cells = <0x2>;
+	#size-cells = <0x2>;
+
+	interrupt-parent = <&intc>;
+
+	aliases {
+		serial0 = &blsp1_uart5;
+	};
+
+	chosen {
+		stdout-path = "serial0";
+	};
+
+	memory {
+		device_type = "memory";
+		reg = <0x0 0x40000000 0x0 0x20000000>;
+	};
+};
+
+&blsp1_spi1 {
+	status = "ok";
+
+	m25p80@0 {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <50000000>;
+	};
+};
+
+&blsp1_uart5 {
+	status = "ok";
+};
+
+&pcie0 {
+	status = "ok";
+	perst-gpio = <&tlmm 58 0x1>;
+};
+
+&pcie1 {
+	status = "ok";
+	perst-gpio = <&tlmm 61 0x1>;
+};
+
+&qmp_pcie_phy0 {
+	status = "ok";
+};
+
+&qmp_pcie_phy1 {
+	status = "ok";
+};
+
+&qpic_bam {
+	status = "ok";
+};
+
+&qpic_nand {
+	status = "ok";
+
+	nand@0 {
+		reg = <0>;
+		nand-ecc-strength = <4>;
+		nand-ecc-step-size = <512>;
+		nand-bus-width = <8>;
+	};
+};
-- 
2.7.4

