Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 789999835E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Aug 2019 20:44:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728896AbfHUSoX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Aug 2019 14:44:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:40064 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727795AbfHUSoW (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Aug 2019 14:44:22 -0400
Received: from localhost.localdomain (unknown [106.201.100.47])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 36916214DA;
        Wed, 21 Aug 2019 18:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1566413061;
        bh=lA7mFEKysJjHKo4nB5lYSbTCshSJwNxXj0rtmarFzok=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=u8+MgHcm2wea77yRMXB5nTVO7V00jgDGVTh9Z4yii5vcyvhLC2ZEh/rCbORcUSs2p
         4oKg0xN0CwSmFBTiC2zaAPSRnQbn4nlXmEXHo2PpjH5iqQVN0kEIKGogw2aI+1TrK5
         udGudYdtpUPfLR3a+lzMTWnX5hPU2D5GOAn/rrHo=
From:   Vinod Koul <vkoul@kernel.org>
To:     Andy Gross <agross@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sibi Sankar <sibis@codeaurora.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Niklas Cassel <niklas.cassel@linaro.org>
Subject: [PATCH v4 4/8] arm64: dts: qcom: pm8150l: Add base dts file
Date:   Thu, 22 Aug 2019 00:12:35 +0530
Message-Id: <20190821184239.12364-5-vkoul@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190821184239.12364-1-vkoul@kernel.org>
References: <20190821184239.12364-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

PMIC pm8150l is a slave pmic and this adds base DTS file for pm8150l
with power-on, adc and gpio nodes

Signed-off-by: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Niklas Cassel <niklas.cassel@linaro.org>
---
 arch/arm64/boot/dts/qcom/pm8150l.dtsi | 80 +++++++++++++++++++++++++++
 1 file changed, 80 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/pm8150l.dtsi

diff --git a/arch/arm64/boot/dts/qcom/pm8150l.dtsi b/arch/arm64/boot/dts/qcom/pm8150l.dtsi
new file mode 100644
index 000000000000..eb0e9a090e42
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/pm8150l.dtsi
@@ -0,0 +1,80 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2017-2019, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2019, Linaro Limited
+ */
+
+#include <dt-bindings/iio/qcom,spmi-vadc.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/spmi/spmi.h>
+
+&spmi_bus {
+	pmic@4 {
+		compatible = "qcom,pm8150l", "qcom,spmi-pmic";
+		reg = <0x4 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		power-on@800 {
+			compatible = "qcom,pm8916-pon";
+			reg = <0x0800>;
+
+			status = "disabled";
+		};
+
+		adc@3100 {
+			compatible = "qcom,spmi-adc5";
+			reg = <0x3100>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#io-channel-cells = <1>;
+			interrupts = <0x4 0x31 0x0 IRQ_TYPE_EDGE_RISING>;
+
+			status = "disabled";
+
+			ref-gnd@0 {
+				reg = <ADC5_REF_GND>;
+				qcom,pre-scaling = <1 1>;
+				label = "ref_gnd";
+			};
+
+			vref-1p25@1 {
+				reg = <ADC5_1P25VREF>;
+				qcom,pre-scaling = <1 1>;
+				label = "vref_1p25";
+			};
+
+			die-temp@6 {
+				reg = <ADC5_DIE_TEMP>;
+				qcom,pre-scaling = <1 1>;
+				label = "die_temp";
+			};
+		};
+
+		pm8150l_gpios: gpio@c000 {
+			compatible = "qcom,pm8150l-gpio";
+			reg = <0xc000>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupts = <0x4 0xc0 0x0 IRQ_TYPE_NONE>,
+				     <0x4 0xc1 0x0 IRQ_TYPE_NONE>,
+				     <0x4 0xc2 0x0 IRQ_TYPE_NONE>,
+				     <0x4 0xc3 0x0 IRQ_TYPE_NONE>,
+				     <0x4 0xc4 0x0 IRQ_TYPE_NONE>,
+				     <0x4 0xc5 0x0 IRQ_TYPE_NONE>,
+				     <0x4 0xc6 0x0 IRQ_TYPE_NONE>,
+				     <0x4 0xc7 0x0 IRQ_TYPE_NONE>,
+				     <0x4 0xc8 0x0 IRQ_TYPE_NONE>,
+				     <0x4 0xc9 0x0 IRQ_TYPE_NONE>,
+				     <0x4 0xca 0x0 IRQ_TYPE_NONE>,
+				     <0x4 0xcb 0x0 IRQ_TYPE_NONE>;
+		};
+	};
+
+	pmic@5 {
+		compatible = "qcom,pm8150l", "qcom,spmi-pmic";
+		reg = <0x5 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
+};
-- 
2.20.1

