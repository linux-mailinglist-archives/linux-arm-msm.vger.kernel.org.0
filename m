Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8B5B3099CA
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 Jan 2021 02:41:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232797AbhAaBli (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 30 Jan 2021 20:41:38 -0500
Received: from relay02.th.seeweb.it ([5.144.164.163]:41053 "EHLO
        relay02.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232781AbhAaBlb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 30 Jan 2021 20:41:31 -0500
Received: from localhost.localdomain (abaf219.neoplus.adsl.tpnet.pl [83.6.169.219])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id 61E821F6CF;
        Sun, 31 Jan 2021 02:40:27 +0100 (CET)
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
Subject: [PATCH 18/18] arm64: dts: qcom: msm8994-octagon: Add AD7147 and APDS9930 sensors
Date:   Sun, 31 Jan 2021 02:38:49 +0100
Message-Id: <20210131013853.55810-19-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210131013853.55810-1-konrad.dybcio@somainline.org>
References: <20210131013853.55810-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Gustave Monce <gustave.monce@outlook.com>

Add and configure AD7147 grip sensor and APDS9930 proximity sensor.

Signed-off-by: Gustave Monce <gustave.monce@outlook.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 .../dts/qcom/msm8994-msft-lumia-octagon.dtsi  | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi b/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi
index c0aa8cd80f7c..0b2a4afb34d6 100644
--- a/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi
@@ -376,6 +376,42 @@ &blsp1_uart2 {
 	status = "okay";
 };
 
+&blsp2_i2c1 {
+	status = "okay";
+
+	sideinteraction: ad7147_captouch@2c {
+		compatible = "ad,ad7147_captouch";
+		reg = <0x2c>;
+
+		pinctrl-names = "default", "sleep";
+		pinctrl-0 = <&grip_default>;
+		pinctrl-1 = <&grip_sleep>;
+
+		interrupts = <&tlmm 96 IRQ_TYPE_EDGE_FALLING>;
+
+		button_num = <8>;
+		touchpad_num = <0>;
+		wheel_num = <0>;
+		slider_num = <0>;
+
+		vcc-supply = <&vreg_l18a_2p85>;
+	};
+
+	/*
+	 * The QPDS-T900/QPDS-T930 is a customized part built for Nokia
+	 * by Avago. It is very similar to the Avago APDS-9930 with some
+	 * minor differences. In the future a proper driver might need to
+	 * be written for this device. For now this works fine.
+	 */
+	qpdst900: qpdst900@39 {
+		compatible = "avago,apds9930";
+		reg = <0x39>;
+
+		interrupt-parent = <&tlmm>;
+		interrupts = <40 IRQ_TYPE_EDGE_FALLING>;
+	};
+};
+
 &blsp2_i2c5 {
 	status = "okay";
 
@@ -843,6 +879,20 @@ &sdhc2 {
 };
 
 &tlmm {
+	grip_default: grip-default {
+		pins = "gpio39";
+		function = "gpio";
+		drive-strength = <6>;
+		bias-pull-down;
+	};
+
+	grip_sleep: grip-sleep {
+		pins = "gpio39";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
 	hall_front_default: hall-front-default {
 		pins = "gpio42";
 		function = "gpio";
-- 
2.30.0

