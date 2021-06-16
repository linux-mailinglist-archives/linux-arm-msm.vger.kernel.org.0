Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 709C23A9A3D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jun 2021 14:27:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232933AbhFPM3e (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Jun 2021 08:29:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232893AbhFPM32 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Jun 2021 08:29:28 -0400
Received: from m-r1.th.seeweb.it (m-r1.th.seeweb.it [IPv6:2001:4b7a:2000:18::170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59D6CC0617AE;
        Wed, 16 Jun 2021 05:27:20 -0700 (PDT)
Received: from localhost.localdomain (83.6.168.10.neoplus.adsl.tpnet.pl [83.6.168.10])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id C8B4D1FC51;
        Wed, 16 Jun 2021 14:27:17 +0200 (CEST)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     ~postmarketos/upstreaming@lists.sr.ht
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/6] arm64: dts: qcom: sm8250-edo: Add Samsung touchscreen
Date:   Wed, 16 Jun 2021 14:27:08 +0200
Message-Id: <20210616122708.144770-6-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210616122708.144770-1-konrad.dybcio@somainline.org>
References: <20210616122708.144770-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add Samsung touchscreen node and relevant pin configuration to make the phones
actually interactable with.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 .../boot/dts/qcom/sm8250-sony-xperia-edo.dtsi | 21 ++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi b/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi
index 3f08802100ca..8f2417db4a99 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi
@@ -462,7 +462,18 @@ &i2c13 {
 	status = "okay";
 	clock-frequency = <400000>;
 
-	/* Samsung touchscreen @ 48 */
+	touchscreen@48 {
+		compatible = "samsung,s6sy761";
+		reg = <0x48>;
+		interrupt-parent = <&tlmm>;
+		interrupts = <39 0x2008>;
+		/* It's "vddio" downstream but it works anyway! */
+		vdd-supply = <&vreg_l1c_1p8>;
+		avdd-supply = <&vreg_l10c_3p3>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&ts_int_default>;
+	};
 };
 
 &i2c15 {
@@ -570,6 +581,14 @@ mdm2ap_default: mdm2ap-default {
 		bias-disable;
 	};
 
+	ts_int_default: ts-int-default {
+		pins = "gpio39";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disabled;
+		input-enable;
+	};
+
 	ap2mdm_default: ap2mdm-default {
 		pins = "gpio56", "gpio57";
 		function = "gpio";
-- 
2.32.0

