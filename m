Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45D9C3099C9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 Jan 2021 02:41:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232793AbhAaBlc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 30 Jan 2021 20:41:32 -0500
Received: from relay04.th.seeweb.it ([5.144.164.165]:53407 "EHLO
        relay04.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232771AbhAaBl3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 30 Jan 2021 20:41:29 -0500
Received: from localhost.localdomain (abaf219.neoplus.adsl.tpnet.pl [83.6.169.219])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id A10931F87F;
        Sun, 31 Jan 2021 02:40:22 +0100 (CET)
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
Subject: [PATCH 17/18] arm64: dts: qcom: msm8994-octagon: Add TAS2553 codec
Date:   Sun, 31 Jan 2021 02:38:48 +0100
Message-Id: <20210131013853.55810-18-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210131013853.55810-1-konrad.dybcio@somainline.org>
References: <20210131013853.55810-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Gustave Monce <gustave.monce@outlook.com>

Lumia 950/XL feature a TAS2553 codec. Configure it using the
TAS2552 driver.

Signed-off-by: Gustave Monce <gustave.monce@outlook.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 .../dts/qcom/msm8994-msft-lumia-octagon.dtsi  | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi b/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi
index 4aa33682f975..c0aa8cd80f7c 100644
--- a/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi
@@ -300,6 +300,26 @@ rmi4-f12@12 {
 	};
 };
 
+&blsp1_i2c2 {
+	status = "okay";
+
+	/*
+	 * This device uses the Texas Instruments TAS2553, however the TAS2552 driver
+	 * seems to work here. In the future a proper driver might need to
+	 * be written for this device.
+	 */
+	tas2553: tas2553@40 {
+		compatible = "ti,tas2552";
+		reg = <0x40>;
+
+		vbat-supply = <&vph_pwr>;
+		iovdd-supply = <&vreg_s4a_1p8>;
+		avdd-supply = <&vreg_s4a_1p8>;
+
+		enable-gpio = <&pm8994_gpios 12 GPIO_ACTIVE_HIGH>;
+	};
+};
+
 &blsp1_i2c5 {
 	status = "okay";
 
-- 
2.30.0

