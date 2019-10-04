Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9108ACB8A7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2019 12:51:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726082AbfJDKvT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Oct 2019 06:51:19 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:37668 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725788AbfJDKvS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Oct 2019 06:51:18 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 27062619F8; Fri,  4 Oct 2019 10:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1570186277;
        bh=HV49UDYcx9vV6GbDfltmdOxPSBL7taXdXdyTC0caYgE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=i57Z6hf/kPqvxGmcVZYTBu7fd5vapnsRg5tH7j1C1lf2306KAd0UEozaI65aYnaQi
         xNDsJpKfkPNU7E8fKhICOALnWfOirPAQ0orNjWuhxhjhWx1pBJTWLFYL8tIUOthW5t
         ubdajj/Q91XUJetOJDoepXHLVVXQudHur4Nh70zQ=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from kgunda-linux.qualcomm.com (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: kgunda@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4FC52615C2;
        Fri,  4 Oct 2019 10:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1570186276;
        bh=HV49UDYcx9vV6GbDfltmdOxPSBL7taXdXdyTC0caYgE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=USInRJTDeyRMxdPGVMYt84yx5J+en5EUGC0T0vgzzo10krozg4sMgfJVCA8STamcP
         k8OD5HiBvIjlYUg/KxtSH2feXSPvP8XDaAfmIINjWqRlmc0S99fxKXR2Hnfos34MQO
         HGV/sve5RppBb0BGqLa+qgWvDiulNPYcO+0EYfqY=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4FC52615C2
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=kgunda@codeaurora.org
From:   Kiran Gunda <kgunda@codeaurora.org>
To:     bjorn.andersson@linaro.org, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Kiran Gunda <kgunda@codeaurora.org>
Subject: [PATCH V1 1/2] ARM: dts: qcom: pm6150: Add PM6150/PM6150L PMIC peripherals
Date:   Fri,  4 Oct 2019 16:20:56 +0530
Message-Id: <1570186257-10254-2-git-send-email-kgunda@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1570186257-10254-1-git-send-email-kgunda@codeaurora.org>
References: <1570186257-10254-1-git-send-email-kgunda@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add PM6150/PM6150L peripherals such as PON, GPIOs, ADC and other
PMIC infra modules.

Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/pm6150.dtsi  | 82 +++++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/pm6150l.dtsi | 47 ++++++++++++++++++++
 2 files changed, 129 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/pm6150.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pm6150l.dtsi

diff --git a/arch/arm64/boot/dts/qcom/pm6150.dtsi b/arch/arm64/boot/dts/qcom/pm6150.dtsi
new file mode 100644
index 0000000..c2389866
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/pm6150.dtsi
@@ -0,0 +1,82 @@
+// SPDX-License-Identifier: GPL-2.0
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
+				     <0 0xc7 0 IRQ_TYPE_NONE>;
+
+			interrupt-names = "pm6150_gpio1", "pm6150_gpio2",
+					"pm6150_gpio3", "pm6150_gpio4",
+					"pm6150_gpio5", "pm6150_gpio6",
+					"pm6150_gpio7", "pm6150_gpio8";
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
index 0000000..a262092
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/pm6150l.dtsi
@@ -0,0 +1,47 @@
+// SPDX-License-Identifier: GPL-2.0
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
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
 a Linux Foundation Collaborative Project

