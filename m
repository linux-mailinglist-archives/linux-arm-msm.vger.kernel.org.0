Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F60A3099CD
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 Jan 2021 02:42:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232829AbhAaBmJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 30 Jan 2021 20:42:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232776AbhAaBlW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 30 Jan 2021 20:41:22 -0500
Received: from m-r1.th.seeweb.it (m-r1.th.seeweb.it [IPv6:2001:4b7a:2000:18::170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28CE6C06178A
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Jan 2021 17:40:20 -0800 (PST)
Received: from localhost.localdomain (abaf219.neoplus.adsl.tpnet.pl [83.6.169.219])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id 28B761F6C5;
        Sun, 31 Jan 2021 02:40:18 +0100 (CET)
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
Subject: [PATCH 16/18] arm64: dts: qcom: msm8994-octagon: Add sensors on blsp1_i2c5
Date:   Sun, 31 Jan 2021 02:38:47 +0100
Message-Id: <20210131013853.55810-17-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210131013853.55810-1-konrad.dybcio@somainline.org>
References: <20210131013853.55810-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Gustave Monce <gustave.monce@outlook.com>

Add AK09912 magnetometer, ZPA2326 barometer and MPU6500 accelerometer
nodes.

Signed-off-by: Gustave Monce <gustave.monce@outlook.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 .../dts/qcom/msm8994-msft-lumia-octagon.dtsi  | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi b/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi
index e01c9dce187c..4aa33682f975 100644
--- a/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi
@@ -300,6 +300,42 @@ rmi4-f12@12 {
 	};
 };
 
+&blsp1_i2c5 {
+	status = "okay";
+
+	ak09912: magnetometer@c {
+		compatible = "asahi-kasei,ak09912";
+		reg = <0xc>;
+
+		interrupt-parent = <&tlmm>;
+		interrupts = <26 IRQ_TYPE_EDGE_RISING>;
+
+		vdd-supply = <&vreg_l18a_2p85>;
+		vid-supply = <&vreg_lvs2a_1p8>;
+	};
+
+	zpa2326: barometer@5c {
+		compatible = "murata,zpa2326";
+		reg = <0x5c>;
+
+		interrupt-parent = <&tlmm>;
+		interrupts = <74 IRQ_TYPE_EDGE_RISING>;
+
+		vdd-supply = <&vreg_lvs2a_1p8>;
+	};
+
+	mpu6050: accelerometer@68 {
+		compatible = "invensense,mpu6500";
+		reg = <0x68>;
+
+		interrupt-parent = <&tlmm>;
+		interrupts = <64 IRQ_TYPE_EDGE_RISING>;
+		
+		vdd-supply = <&vreg_lvs2a_1p8>;
+		vddio-supply = <&vreg_lvs2a_1p8>;
+	};
+};
+
 &blsp1_i2c6 {
 	status = "okay";
 
-- 
2.30.0

