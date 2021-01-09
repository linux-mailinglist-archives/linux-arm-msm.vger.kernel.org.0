Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42E832F0188
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Jan 2021 17:31:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725872AbhAIQbD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 9 Jan 2021 11:31:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726460AbhAIQbC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 9 Jan 2021 11:31:02 -0500
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it [IPv6:2001:4b7a:2000:18::166])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CB9DC0617A3
        for <linux-arm-msm@vger.kernel.org>; Sat,  9 Jan 2021 08:30:22 -0800 (PST)
Received: from localhost.localdomain (abaf53.neoplus.adsl.tpnet.pl [83.6.169.53])
        by m-r2.th.seeweb.it (Postfix) with ESMTPA id CB02E3E84E;
        Sat,  9 Jan 2021 17:30:19 +0100 (CET)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] arm64: dts: qcom: msm8998: Merge in msm8998-pins.dtsi to msm8998.dtsi
Date:   Sat,  9 Jan 2021 17:29:55 +0100
Message-Id: <20210109163001.146867-2-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210109163001.146867-1-konrad.dybcio@somainline.org>
References: <20210109163001.146867-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This is the usual way of handling pin configuration upstream now, so
align to it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
---
 arch/arm64/boot/dts/qcom/msm8998-pins.dtsi | 108 ---------------------
 arch/arm64/boot/dts/qcom/msm8998.dtsi      | 106 +++++++++++++++++++-
 2 files changed, 104 insertions(+), 110 deletions(-)
 delete mode 100644 arch/arm64/boot/dts/qcom/msm8998-pins.dtsi

diff --git a/arch/arm64/boot/dts/qcom/msm8998-pins.dtsi b/arch/arm64/boot/dts/qcom/msm8998-pins.dtsi
deleted file mode 100644
index 7c222cbf19d9..000000000000
--- a/arch/arm64/boot/dts/qcom/msm8998-pins.dtsi
+++ /dev/null
@@ -1,108 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/* Copyright (c) 2018, The Linux Foundation. All rights reserved. */
-
-&tlmm {
-	sdc2_clk_on: sdc2_clk_on {
-		config {
-			pins = "sdc2_clk";
-			bias-disable;           /* NO pull */
-			drive-strength = <16>;  /* 16 mA */
-		};
-	};
-
-	sdc2_clk_off: sdc2_clk_off {
-		config {
-			pins = "sdc2_clk";
-			bias-disable;           /* NO pull */
-			drive-strength = <2>;   /* 2 mA */
-		};
-	};
-
-	sdc2_cmd_on: sdc2_cmd_on {
-		config {
-			pins = "sdc2_cmd";
-			bias-pull-up;           /* pull up */
-			drive-strength = <10>;  /* 10 mA */
-		};
-	};
-
-	sdc2_cmd_off: sdc2_cmd_off {
-		config {
-			pins = "sdc2_cmd";
-			bias-pull-up;           /* pull up */
-			drive-strength = <2>;   /* 2 mA */
-		};
-	};
-
-	sdc2_data_on: sdc2_data_on {
-		config {
-			pins = "sdc2_data";
-			bias-pull-up;           /* pull up */
-			drive-strength = <10>;  /* 10 mA */
-		};
-	};
-
-	sdc2_data_off: sdc2_data_off {
-		config {
-			pins = "sdc2_data";
-			bias-pull-up;           /* pull up */
-			drive-strength = <2>;   /* 2 mA */
-		};
-	};
-
-	sdc2_cd_on: sdc2_cd_on {
-		mux {
-			pins = "gpio95";
-			function = "gpio";
-		};
-
-		config {
-			pins = "gpio95";
-			bias-pull-up;           /* pull up */
-			drive-strength = <2>;   /* 2 mA */
-		};
-	};
-
-	sdc2_cd_off: sdc2_cd_off {
-		mux {
-			pins = "gpio95";
-			function = "gpio";
-		};
-
-		config {
-			pins = "gpio95";
-			bias-pull-up;           /* pull up */
-			drive-strength = <2>;   /* 2 mA */
-		};
-	};
-
-	blsp1_uart3_on: blsp1_uart3_on {
-		tx {
-			pins = "gpio45";
-			function = "blsp_uart3_a";
-			drive-strength = <2>;
-			bias-disable;
-		};
-
-		rx {
-			pins = "gpio46";
-			function = "blsp_uart3_a";
-			drive-strength = <2>;
-			bias-disable;
-		};
-
-		cts {
-			pins = "gpio47";
-			function = "blsp_uart3_a";
-			drive-strength = <2>;
-			bias-disable;
-		};
-
-		rfr {
-			pins = "gpio48";
-			function = "blsp_uart3_a";
-			drive-strength = <2>;
-			bias-disable;
-		};
-	};
-};
diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index ebdaaf1dfca4..699bd67efcd0 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -1073,6 +1073,110 @@ tlmm: pinctrl@3400000 {
 			#gpio-cells = <0x2>;
 			interrupt-controller;
 			#interrupt-cells = <0x2>;
+
+			sdc2_clk_on: sdc2_clk_on {
+				config {
+					pins = "sdc2_clk";
+					bias-disable;
+					drive-strength = <16>;
+				};
+			};
+
+			sdc2_clk_off: sdc2_clk_off {
+				config {
+					pins = "sdc2_clk";
+					bias-disable;
+					drive-strength = <2>;
+				};
+			};
+
+			sdc2_cmd_on: sdc2_cmd_on {
+				config {
+					pins = "sdc2_cmd";
+					bias-pull-up;
+					drive-strength = <10>;
+				};
+			};
+
+			sdc2_cmd_off: sdc2_cmd_off {
+				config {
+					pins = "sdc2_cmd";
+					bias-pull-up;
+					drive-strength = <2>;
+				};
+			};
+
+			sdc2_data_on: sdc2_data_on {
+				config {
+					pins = "sdc2_data";
+					bias-pull-up;
+					drive-strength = <10>;
+				};
+			};
+
+			sdc2_data_off: sdc2_data_off {
+				config {
+					pins = "sdc2_data";
+					bias-pull-up;
+					drive-strength = <2>;
+				};
+			};
+
+			sdc2_cd_on: sdc2_cd_on {
+				mux {
+					pins = "gpio95";
+					function = "gpio";
+				};
+
+				config {
+					pins = "gpio95";
+					bias-pull-up;
+					drive-strength = <2>;
+				};
+			};
+
+			sdc2_cd_off: sdc2_cd_off {
+				mux {
+					pins = "gpio95";
+					function = "gpio";
+				};
+
+				config {
+					pins = "gpio95";
+					bias-pull-up;
+					drive-strength = <2>;
+				};
+			};
+
+			blsp1_uart3_on: blsp1_uart3_on {
+				tx {
+					pins = "gpio45";
+					function = "blsp_uart3_a";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				rx {
+					pins = "gpio46";
+					function = "blsp_uart3_a";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				cts {
+					pins = "gpio47";
+					function = "blsp_uart3_a";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				rfr {
+					pins = "gpio48";
+					function = "blsp_uart3_a";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
 		};
 
 		remoteproc_mss: remoteproc@4080000 {
@@ -2110,5 +2214,3 @@ wifi: wifi@18800000 {
 		};
 	};
 };
-
-#include "msm8998-pins.dtsi"
-- 
2.29.2

