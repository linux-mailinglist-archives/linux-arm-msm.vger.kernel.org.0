Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA8FD4058D1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Sep 2021 16:17:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239764AbhIIOSe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Sep 2021 10:18:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245640AbhIIOS0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Sep 2021 10:18:26 -0400
Received: from relay03.th.seeweb.it (relay03.th.seeweb.it [IPv6:2001:4b7a:2000:18::164])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA611C0281DB;
        Thu,  9 Sep 2021 05:38:26 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id A489D1FAB1;
        Thu,  9 Sep 2021 14:38:24 +0200 (CEST)
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
To:     bjorn.andersson@linaro.org
Cc:     agross@kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@somainline.org,
        marijn.suijten@somainline.org, martin.botka@somainline.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        paul.bouchara@somainline.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Subject: [PATCH v2 3/4] arm64: dts: qcom: msm8998-fxtec-pro1: Add Goodix GT9286 touchscreen
Date:   Thu,  9 Sep 2021 14:38:22 +0200
Message-Id: <20210909123823.368199-3-angelogioacchino.delregno@somainline.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210909123823.368199-1-angelogioacchino.delregno@somainline.org>
References: <20210909123823.368199-1-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This smartphone has a Goodix GT8296 touch IC, reachable at address
0x14 on blsp2 i2c-1.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
---
 .../boot/dts/qcom/msm8998-fxtec-pro1.dts      | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dts b/arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dts
index d44250f09965..deabb00758e3 100644
--- a/arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dts
+++ b/arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dts
@@ -122,6 +122,33 @@ ramoops@ffc00000 {
 			record-size = <0x10000>;
 		};
 	};
+
+	ts_vio_vreg: ts-vio-vreg {
+		compatible = "regulator-fixed";
+		regulator-name = "ts_vio_reg";
+		startup-delay-us = <2>;
+		enable-active-high;
+		gpio = <&tlmm 81 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&ts_vio_default>;
+		regulator-always-on;
+	};
+};
+
+&blsp2_i2c1 {
+	status = "ok";
+
+	touchscreen@14 {
+		compatible = "goodix,gt9286";
+		reg = <0x14>;
+		interrupt-parent = <&tlmm>;
+		interrupts = <125 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&tlmm 89 GPIO_ACTIVE_HIGH>;
+		AVDD28-supply = <&vreg_l28_3p0>;
+		VDDIO-supply = <&ts_vio_vreg>;
+		pinctrl-names = "active";
+		pinctrl-0 = <&ts_rst_n>, <&ts_int_n>;
+	};
 };
 
 &mmcc {
@@ -178,6 +205,20 @@ mdp_vsync_n: mdp-vsync-n {
 		drive-strength = <2>;
 	};
 
+	ts_vio_default: ts-vio-def {
+		pins = "gpio81";
+		function = "gpio";
+		bias-disable;
+		drive-strength = <2>;
+	};
+
+	ts_rst_n: ts-rst-n {
+		pins = "gpio89";
+		function = "gpio";
+		bias-pull-up;
+		drive-strength = <8>;
+	};
+
 	hall_sensor1_default: hall-sensor1-def {
 		pins = "gpio124";
 		function = "gpio";
@@ -185,6 +226,13 @@ hall_sensor1_default: hall-sensor1-def {
 		drive-strength = <2>;
 		input-enable;
 	};
+
+	ts_int_n: ts-int-n {
+		pins = "gpio125";
+		function = "gpio";
+		bias-disable;
+		drive-strength = <8>;
+	};
 };
 
 &ufshc {
-- 
2.32.0

