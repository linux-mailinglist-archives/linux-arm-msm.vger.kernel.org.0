Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7AAB4200CF
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Oct 2021 10:33:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229948AbhJCIfN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 3 Oct 2021 04:35:13 -0400
Received: from mail.z3ntu.xyz ([128.199.32.197]:37964 "EHLO mail.z3ntu.xyz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229968AbhJCIdx (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 3 Oct 2021 04:33:53 -0400
Received: from g550jk.portal.nstrein.ns.nl (unknown [145.15.244.215])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id 385E8C910E;
        Sun,  3 Oct 2021 08:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1633249925; bh=5A+sleW25CkdHFJbndlf92vvIwLf7Sdoa5EtZ0V4lzo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=ds6kdI+Pe3uhtp7jkL/JFyfj6agF4cPoTk77deqnTysYVfVC3TtOVFNq/YcQmkH+O
         AcLl+7e22UPrvvCTbXx9BqsPpjmwrQ4sXOdd7wzxK/CAEmIOsvcOHpu7+5cBODGenz
         jHBvyeQv13MHXuI7aOLmIHmrZxk83SswNI2oKLrY=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, Luca Weiss <luca@z3ntu.xyz>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 06/11] arm64: dts: qcom: Add PM6350 PMIC
Date:   Sun,  3 Oct 2021 10:31:29 +0200
Message-Id: <20211003083141.613509-7-luca@z3ntu.xyz>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211003083141.613509-1-luca@z3ntu.xyz>
References: <20211003083141.613509-1-luca@z3ntu.xyz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

PM6350 is used in SM6350 and provides similar functionality to other
Qualcomm PMICs.

Add the pon node with power & volume key and the gpios.

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 arch/arm64/boot/dts/qcom/pm6350.dtsi | 54 ++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/pm6350.dtsi

diff --git a/arch/arm64/boot/dts/qcom/pm6350.dtsi b/arch/arm64/boot/dts/qcom/pm6350.dtsi
new file mode 100644
index 000000000000..c5d85064562b
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/pm6350.dtsi
@@ -0,0 +1,54 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2021, Luca Weiss <luca@z3ntu.xyz>
+ */
+
+#include <dt-bindings/spmi/spmi.h>
+
+&spmi_bus {
+	pmic@0 {
+		compatible = "qcom,pm6350", "qcom,spmi-pmic";
+		reg = <0x0 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pm6350_pon: pon@800 {
+			compatible = "qcom,pm8998-pon";
+			reg = <0x800>;
+			mode-bootloader = <0x2>;
+			mode-recovery = <0x1>;
+
+			pm6350_pwrkey: pwrkey {
+				compatible = "qcom,pm8941-pwrkey";
+				interrupts = <0x0 0x8 0x0 IRQ_TYPE_EDGE_BOTH>;
+				debounce = <15625>;
+				bias-pull-up;
+				linux,code = <KEY_POWER>;
+			};
+
+			pm6350_resin: resin {
+				compatible = "qcom,pm8941-resin";
+				interrupts = <0x0 0x8 0x1 IRQ_TYPE_EDGE_BOTH>;
+				debounce = <15625>;
+				bias-pull-up;
+				status = "disabled";
+			};
+		};
+
+		pm6350_gpios: gpios@c000 {
+			compatible = "qcom,pm6350-gpio";
+			reg = <0xc000>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	pmic@1 {
+		compatible = "qcom,pm6350", "qcom,spmi-pmic";
+		reg = <0x1 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
+};
-- 
2.33.0

