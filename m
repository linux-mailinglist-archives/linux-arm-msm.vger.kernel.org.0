Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0A1E2FA626
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Jan 2021 17:29:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406097AbhARQ0f (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Jan 2021 11:26:35 -0500
Received: from relay03.th.seeweb.it ([5.144.164.164]:53889 "EHLO
        relay03.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406706AbhARQZ7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Jan 2021 11:25:59 -0500
Received: from localhost.localdomain (abaf224.neoplus.adsl.tpnet.pl [83.6.169.224])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id 77F881FD0C;
        Mon, 18 Jan 2021 17:25:15 +0100 (CET)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 10/11] arm64: dts: qcom: msm8994/8994-kitakami: Fix up the memory map
Date:   Mon, 18 Jan 2021 17:24:30 +0100
Message-Id: <20210118162432.107275-10-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210118162432.107275-1-konrad.dybcio@somainline.org>
References: <20210118162432.107275-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The previous map was wrong. Fix it up.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 .../qcom/msm8994-sony-xperia-kitakami.dtsi    | 45 +++++++------------
 arch/arm64/boot/dts/qcom/msm8994.dtsi         | 45 ++++++++++++++++++-
 2 files changed, 60 insertions(+), 30 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi b/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi
index 05155859cf6a..e962fc5f8b1b 100644
--- a/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi
@@ -72,47 +72,23 @@ button@3 {
 	};
 
 	reserved-memory {
-		#address-cells = <2>;
-		#size-cells = <2>;
-		ranges;
-
 		/* This is for getting crash logs using Android downstream kernels */
 		ramoops@1fe00000 {
 			compatible = "ramoops";
-			reg = <0x0 0x1fe00000 0x0 0x200000>;
+			reg = <0 0x1fe00000 0 0x200000>;
 			console-size = <0x100000>;
 			record-size = <0x10000>;
 			ftrace-size = <0x10000>;
 			pmsg-size = <0x80000>;
 		};
 
-		continuous_splash: framebuffer@3401000{
-			reg = <0x0 0x3401000 0x0 0x2200000>;
-			no-map;
-		};
-
-		dfps_data_mem: dfps_data_mem@3400000 {
-			reg = <0x0 0x3400000 0x0 0x1000>;
-			no-map;
-		};
-
-		peripheral_region: peripheral_region@7400000 {
-			reg = <0x0 0x7400000 0x0 0x1c00000>;
-			no-map;
-		};
-
-		modem_region: modem_region@9000000 {
-			reg = <0x0 0x9000000 0x0 0x5a00000>;
-			no-map;
-		};
-
-		tzapp: modem_region@ea00000 {
-			reg = <0x0 0xea00000 0x0 0x1900000>;
+		fb_region: fb_region@40000000 {
+			reg = <0 0x40000000 0 0x1000000>;
 			no-map;
 		};
 
-		fb_region: fb_region@40000000 {
-			reg = <0x00 0x40000000 0x00 0x1000000>;
+		tzapp: memory@c7800000 {
+			reg = <0 0xc7800000 0 0x1900000>;
 			no-map;
 		};
 	};
@@ -185,6 +161,17 @@ &blsp2_uart2 {
 	status = "okay";
 };
 
+/*
+ * Kitakami bootloader only turns cont_splash on when it detects
+ * specific downstream MDSS/backlight nodes in the active DTB.
+ * One way to use that framebuffer is to load a secondary instance of
+ * LK with the downstream DTB appended and then, only from there, load
+ * mainline Linux.
+ */
+&cont_splash_mem {
+	reg = <0 0x3401000 0 0x2200000>;
+};
+
 &pmi8994_spmi_regulators {
 	/*
 	 * Yeah, this one *is* managed by RPMPD, but also needs
diff --git a/arch/arm64/boot/dts/qcom/msm8994.dtsi b/arch/arm64/boot/dts/qcom/msm8994.dtsi
index 3dfa74085f10..7ff1dfaddd79 100644
--- a/arch/arm64/boot/dts/qcom/msm8994.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994.dtsi
@@ -169,8 +169,51 @@ reserved-memory {
 		#size-cells = <2>;
 		ranges;
 
+		dfps_data_mem: dfps_data_mem@3400000 {
+			reg = <0 0x03400000 0 0x1000>;
+			no-map;
+		};
+
+		cont_splash_mem: memory@3800000 {
+			reg = <0 0x03800000 0 0x2400000>;
+			no-map;
+		};
+
 		smem_mem: smem_region@6a00000 {
-			reg = <0x0 0x6a00000 0x0 0x200000>;
+			reg = <0 0x06a00000 0 0x200000>;
+			no-map;
+		};
+
+		mpss_mem: memory@7000000 {
+			reg = <0 0x07000000 0 0x5a00000>;
+			no-map;
+		};
+
+		peripheral_region: memory@ca00000 {
+			reg = <0 0x0ca00000 0 0x1f00000>;
+			no-map;
+		};
+
+		rmtfs_mem: memory@c6400000 {
+			compatible = "qcom,rmtfs-mem";
+			reg = <0 0xc6400000 0 0x180000>;
+			no-map;
+
+			qcom,client-id = <1>;
+		};
+
+		mba_mem: memory@c6700000 {
+			reg = <0 0xc6700000 0 0x100000>;
+			no-map;
+		};
+
+		audio_mem: memory@c7000000 {
+			reg = <0 0xc7000000 0 0x800000>;
+			no-map;
+		};
+
+		adsp_mem: memory@c9400000 {
+			reg = <0 0xc9400000 0 0x3f00000>;
 			no-map;
 		};
 	};
-- 
2.29.2

