Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8BD423D89B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Aug 2020 11:28:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729158AbgHFJ2U (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Aug 2020 05:28:20 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:29415 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729104AbgHFJZU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Aug 2020 05:25:20 -0400
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 06 Aug 2020 02:25:02 -0700
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 06 Aug 2020 02:25:00 -0700
Received: from gokulsri-linux.qualcomm.com ([10.201.2.207])
  by ironmsg02-blr.qualcomm.com with ESMTP; 06 Aug 2020 14:54:40 +0530
Received: by gokulsri-linux.qualcomm.com (Postfix, from userid 432570)
        id C335420F7C; Thu,  6 Aug 2020 14:54:38 +0530 (IST)
From:   Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        sboyd@codeaurora.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     sricharan@codeaurora.org, gokulsri@codeaurora.org
Subject: [PATCH 2/3] arm64: dts: Add board support for HK10
Date:   Thu,  6 Aug 2020 14:54:37 +0530
Message-Id: <1596705878-12385-3-git-send-email-gokulsri@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1596705878-12385-1-git-send-email-gokulsri@codeaurora.org>
References: <1596705878-12385-1-git-send-email-gokulsri@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
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
index c98bafe..ea933fb 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -4,6 +4,8 @@ dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-db820c.dtb
 dtb-$(CONFIG_ARCH_QCOM) += apq8096-ifc6640.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq6018-cp01-c1.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq8074-hk01.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= ipq8074-hk10-c1.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= ipq8074-hk10-c2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-longcheer-l8150.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-samsung-a3u-eur.dtb
diff --git a/arch/arm64/boot/dts/qcom/ipq8074-hk10-c1.dts b/arch/arm64/boot/dts/qcom/ipq8074-hk10-c1.dts
new file mode 100644
index 0000000..2bfcf42
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
index 0000000..1897e96
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
index 0000000..0827055
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

