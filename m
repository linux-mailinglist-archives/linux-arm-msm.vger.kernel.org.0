Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43A01DE4FA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2019 08:56:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727474AbfJUG4d (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Oct 2019 02:56:33 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:35514 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726480AbfJUG4c (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Oct 2019 02:56:32 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id DC47360610; Mon, 21 Oct 2019 06:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571640990;
        bh=Q/SbXN4t4P3qEsV5Q7KG/xDcIs4jorA6XRtE91+xWNU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=clkroPqaW8+G5vEbaaJAbbWozO8RDkjNdny8XmOhCxu+kftA1YaRY/I1OY6zhuHR+
         E0+Ntp8G0QyeqGymDKwKXDgjfIbsMdUqz6CxxBUqMCkhOoWWQMxmijp4mLpULJPKUc
         wqz98jqJE7WhFFPnvYqp7VuIR9Siybxd83qfTCjQ=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from blr-ubuntu-173.qualcomm.com (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1863160610;
        Mon, 21 Oct 2019 06:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571640989;
        bh=Q/SbXN4t4P3qEsV5Q7KG/xDcIs4jorA6XRtE91+xWNU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=N+W5bGkOBhg1NTfxFFP2i2uRXCq9x2czBQGuWVUObkE2HcNrPcPSctSVmTQKy2psQ
         44hrMgCr8RYi1LHmNPYxnA0trXsfnMNqrC6huEpJcptmMntE3dQT519nkr49+iCQgk
         qltoSJGBWldSw85wzJbtGgpdnFJwl9D269DpXZ0g=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1863160610
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
From:   Rajendra Nayak <rnayak@codeaurora.org>
To:     agross@kernel.org, robh+dt@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Kiran Gunda <kgunda@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH v2 08/13] arm64: dts: qcom: pm6150: Add PM6150/PM6150L PMIC peripherals
Date:   Mon, 21 Oct 2019 12:25:17 +0530
Message-Id: <20191021065522.24511-9-rnayak@codeaurora.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191021065522.24511-1-rnayak@codeaurora.org>
References: <20191021065522.24511-1-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Kiran Gunda <kgunda@codeaurora.org>

Add PM6150/PM6150L peripherals such as PON, GPIOs, ADC and other
PMIC infra modules.

Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
v2:
* Changed to BSD-3-Clause licence
* Included headers in sc7180-idp.dts

 arch/arm64/boot/dts/qcom/pm6150.dtsi    | 85 +++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/pm6150l.dtsi   | 47 ++++++++++++++
 arch/arm64/boot/dts/qcom/sc7180-idp.dts |  2 +
 3 files changed, 134 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/pm6150.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pm6150l.dtsi

diff --git a/arch/arm64/boot/dts/qcom/pm6150.dtsi b/arch/arm64/boot/dts/qcom/pm6150.dtsi
new file mode 100644
index 000000000000..20eb928e5ce3
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/pm6150.dtsi
@@ -0,0 +1,85 @@
+// SPDX-License-Identifier: BSD-3-Clause
+// Copyright (c) 2019, The Linux Foundation. All rights reserved.
+
+#include <dt-bindings/iio/qcom,spmi-vadc.h>
+#include <dt-bindings/input/linux-event-codes.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/spmi/spmi.h>
+#include <dt-bindings/thermal/thermal.h>
+
+&spmi_bus {
+	pm6150_lsid0: pmic@0 {
+		compatible = "qcom,pm6150", "qcom,spmi-pmic";
+		reg = <0x0 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pm6150_pon: pon@800 {
+			compatible = "qcom,pm8998-pon";
+			reg = <0x800>;
+			mode-bootloader = <0x2>;
+			mode-recovery = <0x1>;
+
+			pwrkey {
+				compatible = "qcom,pm8941-pwrkey";
+				interrupts = <0x0 0x8 0 IRQ_TYPE_EDGE_BOTH>;
+				debounce = <15625>;
+				bias-pull-up;
+				linux,code = <KEY_POWER>;
+			};
+		};
+
+		pm6150_temp: temp-alarm@2400 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0x2400>;
+			interrupts = <0x0 0x24 0x0 IRQ_TYPE_EDGE_RISING>;
+			io-channels = <&pm6150_adc ADC5_DIE_TEMP>;
+			io-channel-names = "thermal";
+			#thermal-sensor-cells = <0>;
+		};
+
+		pm6150_adc: adc@3100 {
+			compatible = "qcom,spmi-adc5";
+			reg = <0x3100>;
+			interrupts = <0x0 0x31 0x0 IRQ_TYPE_EDGE_RISING>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#io-channel-cells = <1>;
+
+			adc-chan@ADC5_DIE_TEMP {
+				reg = <ADC5_DIE_TEMP>;
+				label = "die_temp";
+			};
+		};
+
+		pm6150_gpio: gpios@c000 {
+			compatible = "qcom,pm6150-gpio", "qcom,spmi-gpio";
+			reg = <0xc000 0xa00>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupts = <0 0xc0 0 IRQ_TYPE_NONE>,
+				     <0 0xc1 0 IRQ_TYPE_NONE>,
+				     <0 0xc2 0 IRQ_TYPE_NONE>,
+				     <0 0xc3 0 IRQ_TYPE_NONE>,
+				     <0 0xc4 0 IRQ_TYPE_NONE>,
+				     <0 0xc5 0 IRQ_TYPE_NONE>,
+				     <0 0xc6 0 IRQ_TYPE_NONE>,
+				     <0 0xc7 0 IRQ_TYPE_NONE>,
+				     <0 0xc8 0 IRQ_TYPE_NONE>,
+				     <0 0xc9 0 IRQ_TYPE_NONE>;
+
+			interrupt-names = "pm6150_gpio1", "pm6150_gpio2",
+					"pm6150_gpio3", "pm6150_gpio4",
+					"pm6150_gpio5", "pm6150_gpio6",
+					"pm6150_gpio7", "pm6150_gpio8",
+					"pm6150_gpio9", "pm6150_gpio10";
+		};
+	};
+
+	pm6150_lsid1: pmic@1 {
+		compatible = "qcom,pm6150", "qcom,spmi-pmic";
+		reg = <0x1 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/pm6150l.dtsi b/arch/arm64/boot/dts/qcom/pm6150l.dtsi
new file mode 100644
index 000000000000..b17bb1af9367
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/pm6150l.dtsi
@@ -0,0 +1,47 @@
+// SPDX-License-Identifier: BSD-3-Clause
+// Copyright (c) 2019, The Linux Foundation. All rights reserved.
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/spmi/spmi.h>
+
+&spmi_bus {
+	pm6150l_lsid4: pmic@4 {
+		compatible = "qcom,pm6150l", "qcom,spmi-pmic";
+		reg = <0x4 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pm6150l_gpios: gpios@c000 {
+			compatible = "qcom,pm6150l-gpio", "qcom,spmi-gpio";
+			reg = <0xc000 0xc00>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupts = <4 0xc0 0 IRQ_TYPE_NONE>,
+				     <4 0xc1 0 IRQ_TYPE_NONE>,
+				     <4 0xc2 0 IRQ_TYPE_NONE>,
+				     <4 0xc3 0 IRQ_TYPE_NONE>,
+				     <4 0xc4 0 IRQ_TYPE_NONE>,
+				     <4 0xc5 0 IRQ_TYPE_NONE>,
+				     <4 0xc6 0 IRQ_TYPE_NONE>,
+				     <4 0xc7 0 IRQ_TYPE_NONE>,
+				     <4 0xc8 0 IRQ_TYPE_NONE>,
+				     <4 0xc9 0 IRQ_TYPE_NONE>,
+				     <4 0xca 0 IRQ_TYPE_NONE>,
+				     <4 0xcb 0 IRQ_TYPE_NONE>;
+
+			interrupt-names = "pm6150l_gpio1", "pm6150l_gpio2",
+					"pm6150l_gpio3", "pm6150l_gpio4",
+					"pm6150l_gpio5", "pm6150l_gpio6",
+					"pm6150l_gpio7", "pm6150l_gpio8",
+					"pm6150l_gpio9", "pm6150l_gpio10",
+					"pm6150l_gpio11", "pm6150l_gpio12";
+		};
+	};
+
+	pm6150l_lsid5: pmic@5 {
+		compatible = "qcom,pm6150l", "qcom,spmi-pmic";
+		reg = <0x5 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
index f8b7e098f5b4..1ba389f1fea9 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
@@ -8,6 +8,8 @@
 /dts-v1/;
 
 #include "sc7180.dtsi"
+#include "pm6150.dtsi"
+#include "pm6150l.dtsi"
 
 / {
 	model = "Qualcomm Technologies, Inc. SC7180 IDP";
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

