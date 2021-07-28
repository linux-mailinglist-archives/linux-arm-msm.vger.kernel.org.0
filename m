Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 551293D98A9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jul 2021 00:27:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233399AbhG1W0z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Jul 2021 18:26:55 -0400
Received: from relay01.th.seeweb.it ([5.144.164.162]:34619 "EHLO
        relay01.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232208AbhG1W03 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Jul 2021 18:26:29 -0400
Received: from localhost.localdomain (83.6.168.174.neoplus.adsl.tpnet.pl [83.6.168.174])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id D219320068;
        Thu, 29 Jul 2021 00:26:25 +0200 (CEST)
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
Subject: [PATCH 31/39] arm64: dts: qcom: sdm630-nile: Add USB
Date:   Thu, 29 Jul 2021 00:25:34 +0200
Message-Id: <20210728222542.54269-32-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210728222542.54269-1-konrad.dybcio@somainline.org>
References: <20210728222542.54269-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable and configure DWC3 and QUSB2 PHY to enable USB
functionality on Nile and Ganges boards.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 .../dts/qcom/sdm630-sony-xperia-nile.dtsi     | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
index 34a38bff09b8..e17a0f0b1e06 100644
--- a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
@@ -148,6 +148,15 @@ removed_region@85800000 {
 			no-map;
 		};
 	};
+
+	/*
+	 * Until we hook up type-c detection, we
+	 * have to stick with this. But it works.
+	 */
+	extcon_usb: extcon-usb {
+		compatible = "linux,extcon-usb-gpio";
+		id-gpio = <&tlmm 58 GPIO_ACTIVE_HIGH>;
+	};
 };
 
 &blsp_i2c1 {
@@ -182,6 +191,14 @@ &blsp2_uart1 {
 	/* HCI Bluetooth */
 };
 
+&qusb2phy {
+	status = "okay";
+
+	vdd-supply = <&vreg_l1b_0p925>;
+	vdda-pll-supply = <&vreg_l10a_1p8>;
+	vdda-phy-dpdm-supply = <&vreg_l7b_3p125>;
+};
+
 &rpm_requests {
 	pm660l-regulators {
 		compatible = "qcom,rpm-pm660l-regulators";
@@ -536,3 +553,12 @@ cam_vdig_default: cam-vdig-default {
 		drive-strength = <2>;
 	};
 };
+
+&usb3 {
+	status = "okay";
+};
+
+&usb3_dwc3 {
+	dr_mode = "peripheral";
+	extcon = <&extcon_usb>;
+};
-- 
2.32.0

