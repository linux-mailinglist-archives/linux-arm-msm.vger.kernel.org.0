Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1E48459C81
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Nov 2021 08:00:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233665AbhKWHD6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Nov 2021 02:03:58 -0500
Received: from m43-7.mailgun.net ([69.72.43.7]:46131 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233578AbhKWHD5 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Nov 2021 02:03:57 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1637650849; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=Xq2fLQS8tOREaVD8kWa0FzLCZPfDzuMXJcmUPetTCmM=; b=GTLuc1hWAisnTnJDfuRZ3sdwe+Er5TKmNZlKdYqf9HcVKZHUQU4szTmcGxKIvy/j5UGbSMIe
 d7i5nxtcSNXf/NZgGvPGFdboGXtHCle413c1hkxVORX/jT0YhwtrQmpxD1V5JaJA+H7B5wrO
 pPEomKpr9FKjBuU7p+58z7NmAaQ=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 619c91a06bacc185a53ddaa9 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 23 Nov 2021 07:00:48
 GMT
Sender: rnayak=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 22591C43635; Tue, 23 Nov 2021 07:00:48 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-173.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 35E91C4360C;
        Tue, 23 Nov 2021 07:00:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 35E91C4360C
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Rajendra Nayak <rnayak@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sboyd@codeaurora.org,
        dianders@chromium.org, mka@chromium.org, kgodara@codeaurora.org,
        Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH 3/4] arm64: dts: qcom: sc7280: Define EC and H1 nodes
Date:   Tue, 23 Nov 2021 12:30:12 +0530
Message-Id: <1637650813-16654-4-git-send-email-rnayak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1637650813-16654-1-git-send-email-rnayak@codeaurora.org>
References: <1637650813-16654-1-git-send-email-rnayak@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Kshitiz Godara <kgodara@codeaurora.org>

The IDP2 and CRD boards share the EC and H1 parts, so define
all related device nodes into a common file and include them
in the idp2 and crd dts files to avoid duplication.

Signed-off-by: Kshitiz Godara <kgodara@codeaurora.org>
Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sc7280-crd.dts    |   1 +
 arch/arm64/boot/dts/qcom/sc7280-ec-h1.dtsi | 110 +++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sc7280-idp2.dts   |   1 +
 3 files changed, 112 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sc7280-ec-h1.dtsi

diff --git a/arch/arm64/boot/dts/qcom/sc7280-crd.dts b/arch/arm64/boot/dts/qcom/sc7280-crd.dts
index 09d02c2..8c2aee6 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-crd.dts
+++ b/arch/arm64/boot/dts/qcom/sc7280-crd.dts
@@ -8,6 +8,7 @@
 /dts-v1/;
 
 #include "sc7280-idp.dtsi"
+#include "sc7280-ec-h1.dtsi"
 
 / {
 	model = "Qualcomm Technologies, Inc. sc7280 CRD platform";
diff --git a/arch/arm64/boot/dts/qcom/sc7280-ec-h1.dtsi b/arch/arm64/boot/dts/qcom/sc7280-ec-h1.dtsi
new file mode 100644
index 0000000..78fb5eb
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sc7280-ec-h1.dtsi
@@ -0,0 +1,110 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * sc7280 EC/H1 over SPI (common between IDP2 and CRD)
+ *
+ * Copyright (c) 2021, The Linux Foundation. All rights reserved.
+ */
+
+ap_ec_spi: &spi10 {
+	status = "okay";
+
+	pinctrl-0 = <&qup_spi10_cs_gpio_init_high>, <&qup_spi10_cs_gpio>;
+	cs-gpios = <&tlmm 43 GPIO_ACTIVE_LOW>;
+
+	cros_ec: ec@0 {
+		compatible = "google,cros-ec-spi";
+		reg = <0>;
+		interrupt-parent = <&tlmm>;
+		interrupts = <18 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&ap_ec_int_l>;
+		spi-max-frequency = <3000000>;
+
+		cros_ec_pwm: ec-pwm {
+			compatible = "google,cros-ec-pwm";
+			#pwm-cells = <1>;
+		};
+
+		i2c_tunnel: i2c-tunnel {
+			compatible = "google,cros-ec-i2c-tunnel";
+			google,remote-bus = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		typec {
+			compatible = "google,cros-ec-typec";
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			usb_c0: connector@0 {
+				compatible = "usb-c-connector";
+				reg = <0>;
+				label = "left";
+				power-role = "dual";
+				data-role = "host";
+				try-power-role = "source";
+			};
+
+			usb_c1: connector@1 {
+				compatible = "usb-c-connector";
+				reg = <1>;
+				label = "right";
+				power-role = "dual";
+				data-role = "host";
+				try-power-role = "source";
+			};
+		};
+	};
+};
+
+#include <arm/cros-ec-keyboard.dtsi>
+#include <arm/cros-ec-sbs.dtsi>
+
+ap_h1_spi: &spi14 {
+	status = "okay";
+
+	pinctrl-0 = <&qup_spi14_cs_gpio_init_high>, <&qup_spi14_cs_gpio>;
+	cs-gpios = <&tlmm 59 GPIO_ACTIVE_LOW>;
+
+	cr50: tpm@0 {
+		compatible = "google,cr50";
+		reg = <0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&h1_ap_int_odl>;
+		spi-max-frequency = <800000>;
+		interrupt-parent = <&tlmm>;
+		interrupts = <104 IRQ_TYPE_EDGE_RISING>;
+	};
+};
+
+&tlmm {
+	ap_ec_int_l: ap-ec-int-l {
+		pins = "gpio18";
+		function = "gpio";
+		input-enable;
+		bias-pull-up;
+		drive-strength = <2>;
+	};
+
+	h1_ap_int_odl: h1-ap-int-odl {
+		pins = "gpio104";
+		function = "gpio";
+		input-enable;
+		bias-pull-up;
+		drive-strength = <2>;
+	};
+
+	qup_spi10_cs_gpio_init_high: qup-spi10-cs-gpio-init-high {
+		pins = "gpio43";
+		output-high;
+		drive-strength = <2>;
+	};
+
+	qup_spi14_cs_gpio_init_high: qup-spi14-cs-gpio-init-high {
+		pins = "gpio59";
+		output-high;
+		drive-strength = <2>;
+	};
+};
+
diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp2.dts b/arch/arm64/boot/dts/qcom/sc7280-idp2.dts
index 3ae9969..208ca69 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-idp2.dts
+++ b/arch/arm64/boot/dts/qcom/sc7280-idp2.dts
@@ -8,6 +8,7 @@
 /dts-v1/;
 
 #include "sc7280-idp.dtsi"
+#include "sc7280-ec-h1.dtsi"
 
 / {
 	model = "Qualcomm Technologies, Inc. sc7280 IDP SKU2 platform";
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

