Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 448AD3A8DF8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jun 2021 02:59:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231852AbhFPBBF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Jun 2021 21:01:05 -0400
Received: from relay07.th.seeweb.it ([5.144.164.168]:57661 "EHLO
        relay07.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231855AbhFPBBC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Jun 2021 21:01:02 -0400
Received: from localhost.localdomain (83.6.168.161.neoplus.adsl.tpnet.pl [83.6.168.161])
        by m-r2.th.seeweb.it (Postfix) with ESMTPA id 4559F3EE8C;
        Wed, 16 Jun 2021 02:58:53 +0200 (CEST)
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
Subject: [PATCH 6/6] arm64: dts: qcom: sm8250-edo: Add Samsung touchscreen
Date:   Wed, 16 Jun 2021 02:58:43 +0200
Message-Id: <20210616005843.79579-6-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210616005843.79579-1-konrad.dybcio@somainline.org>
References: <20210616005843.79579-1-konrad.dybcio@somainline.org>
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
index f0b595cfea51..f62ff3ce974d 100644
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
@@ -563,6 +574,14 @@ data {
 		};
 	};
 
+	ts_int_default: ts-int-default {
+		pins = "gpio39";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disabled;
+		input-enable;
+	};
+
 	sdc2_card_det_n: sd-card-det-n {
 		pins = "gpio77";
 		function = "gpio";
-- 
2.32.0

