Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75E573099C0
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 Jan 2021 02:41:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232604AbhAaBkd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 30 Jan 2021 20:40:33 -0500
Received: from relay01.th.seeweb.it ([5.144.164.162]:42259 "EHLO
        relay01.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232585AbhAaBka (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 30 Jan 2021 20:40:30 -0500
Received: from localhost.localdomain (abaf219.neoplus.adsl.tpnet.pl [83.6.169.219])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id 930C01F87C;
        Sun, 31 Jan 2021 02:39:46 +0100 (CET)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gustave Monce <gustave.monce@outlook.com>
Subject: [PATCH 09/18] arm64: dts: qcom: msm8994-octagon: Add QCA6174 bluetooth
Date:   Sun, 31 Jan 2021 02:38:40 +0100
Message-Id: <20210131013853.55810-10-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210131013853.55810-1-konrad.dybcio@somainline.org>
References: <20210131013853.55810-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Gustave Monce <gustave.monce@outlook.com>

Configure and enable QCA6174 Bluetooth and required pins.

Signed-off-by: Gustave Monce <gustave.monce@outlook.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 .../dts/qcom/msm8994-msft-lumia-octagon.dtsi  | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi b/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi
index b8d89d64e2f1..78443f5a3881 100644
--- a/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi
@@ -45,6 +45,21 @@ chosen {
 		ranges;
 	};
 
+	clocks {
+		compatible = "simple-bus";
+
+		divclk4: divclk4 {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+
+			clock-frequency = <32768>;
+			clock-output-names = "divclk4";
+
+			pinctrl-names = "default";
+			pinctrl-0 = <&divclk4_pin_a>;
+		};
+	};
+
 	gpio-keys {
 		compatible = "gpio-keys";
 		input-name = "gpio-keys";
@@ -291,6 +306,35 @@ &blsp1_uart2 {
 
 &blsp2_uart2 {
 	status = "okay";
+
+	qca6174_bt: bluetooth {
+		compatible = "qcom,qca6174-bt";
+
+		enable-gpios = <&pm8994_gpios 19 GPIO_ACTIVE_HIGH>;
+		clocks = <&divclk4>;
+	};
+};
+
+&pm8994_gpios {
+	bt_en_gpios: bt_en_gpios {
+		pinconf {
+			pins = "gpio19";
+			function = PMIC_GPIO_FUNC_NORMAL;
+			output-low;
+			power-source = <PM8994_GPIO_S4>;
+			qcom,drive-strength = <PMIC_GPIO_STRENGTH_LOW>;
+			bias-pull-down;
+		};
+	};
+
+	divclk4_pin_a: divclk4 {
+		pinconf {
+			pins = "gpio18";
+			function = PMIC_GPIO_FUNC_FUNC2;
+			power-source = <PM8994_GPIO_S4>;
+			bias-disable;
+		};
+	};
 };
 
 &pmi8994_spmi_regulators {
-- 
2.30.0

