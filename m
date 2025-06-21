Return-Path: <linux-arm-msm+bounces-61938-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 023E3AE291B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Jun 2025 15:22:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 33F603AD0B9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Jun 2025 13:21:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27D2221ADB5;
	Sat, 21 Jun 2025 13:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="LaSm2yEQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066DF1A2632;
	Sat, 21 Jun 2025 13:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750512103; cv=none; b=iG8JcbMFC173b36n3i/Zph9G8Kla2+pKRXL7pI9uNVnYsmeiPOG4jxmGWltijV6AHmdcjXzXbm+svm47y24PqJVLXHXyJQyGSlKrt+giS78SeqmRw9tlrooXC4TD2tD9XPL9ziDmDHgLdT/MWoL+3C3k13ni+rohl9PAYy9nLNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750512103; c=relaxed/simple;
	bh=XAomN/pt1rLm4ceV0UgfZIOfuOZ8BekTg53f316yM9k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qCN9OSL1/WdA54qggHkVg1ZBD7SUwIwanga3/XIqYSROtPfbVS1oX/CwW7xbMWycPVBEupcylZ+uCeyXZb6rh373i0VIcG1J4OvXdhz+qYJLXK/OvnluB7j8HryAaTp/Tx6DQl043OMfPKKiQKVQIC9uaidfx8pl7jPgaXBYtNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=LaSm2yEQ; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1750512099; bh=XAomN/pt1rLm4ceV0UgfZIOfuOZ8BekTg53f316yM9k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=LaSm2yEQKM0xVdI6PzPydeCYicBPcmIYCJnonA9qRRrthKMgKRwCC2E+icBST3Y01
	 Oy7YAT9k5wT92bDyNXjPvPu/vBfkJs5coFVchkWmESErbcG4ESf73ZJ8+WRUopju6t
	 +mFLPSmcyawADX/9xE/WrbsiDvjjIor8GJucA7/E=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Sat, 21 Jun 2025 15:19:59 +0200
Subject: [PATCH 4/4] ARM: dts: qcom: msm8974: Start using rpmpd for power
 domains
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250621-msm8974-rpmpd-switch-v1-4-0a2cb303c446@lucaweiss.eu>
References: <20250621-msm8974-rpmpd-switch-v1-0-0a2cb303c446@lucaweiss.eu>
In-Reply-To: <20250621-msm8974-rpmpd-switch-v1-0-0a2cb303c446@lucaweiss.eu>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca@lucaweiss.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=13307; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=XAomN/pt1rLm4ceV0UgfZIOfuOZ8BekTg53f316yM9k=;
 b=owEBbQKS/ZANAwAKAXLYQ7idTddWAcsmYgBoVrHhbjFCbedrNvHZkNlN9cdTJzJa1cc5udXzr
 0VPIgLOj2OJAjMEAAEKAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCaFax4QAKCRBy2EO4nU3X
 VtQBD/9xcZ6c4d7EGYNzQGpa8l8EK1CSVjMxTYuFN0r1VvkapPc0z3Wpsvb1sjkk+1o+qIquWar
 iDA3r+4qc1Hk7rjRzEHAorPRVFYu6smpB2BN/TXrXSG95RvHoRjVqiA29FrSt2JrN+0COVJ9pW6
 HCOmA2/T2O88KMy9GitlZFuvt8/lMQOBGXvLCJtBPy4CsjrVpgO3KHYCocwXf4tO81jTkAjRS0G
 2E4sY9jpwFFLGwGbkiihydCmuWteqGtFkBqCQoxqvb3WZ25RG++cZzkm1B5HhIaZw9Xxvq1bslj
 uoOz0BTaE4FAK4eSLmgVX5dFcxI9tM7Oqbn0XiILFAoISPOM7djxqGbJ/iBe+u4+KX4YNnFJ5vS
 hUQPJyucPdlMT6ZTjTYGmC3s0Infiby9VdTy1p5bZNm9ILVfJsv0j4Uw5uRr0sxxdTnUlSHGldc
 uyesoQi2lgnKjNPxR/oB9NtJPMvOHmUbTiTixMlQ6dWa7tTJm1fajWq2g3BfVGHT0GPP2Mm+xBg
 BDt8JUhnfyFSHf0orJQh6PBnUsYw9nlnEnAaZAWuIANgG5Jw5I28siUQMxT7C4u3RNWrS9b273n
 0fFl88PztjwV0lSGAgTx00+5B73hug3PuRjqHYAn3EBMT7AZ5EHeyqMrIlrEAy7pWlWEWNJXMMx
 kv0d4/+JA60d5VA==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

Due to historical reasons all msm8974 boards have used the CX power rail
as regulator instead of going through the power domain framework.

Since rpmpd has gained msm8974 support quite a bit ago, let's start
using it and replace all usages of pm8841_s2 (CX), pm8841_s4 (GFX) and
for the boards using pma8084 pma8084_s2 (CX), pma8084_s7 (GFX).

For reference, downstream is using GFX power rail as parent-supply for
mmcc's OXILI_GDSC GDSC which then is used for GPU, but nothing there is
modelled upstream.

Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 .../arm/boot/dts/qcom/qcom-apq8074-dragonboard.dts | 13 -------
 .../qcom/qcom-msm8974-lge-nexus5-hammerhead.dts    | 12 ------
 .../boot/dts/qcom/qcom-msm8974-samsung-hlte.dts    | 12 ------
 .../dts/qcom/qcom-msm8974-sony-xperia-rhine.dtsi   | 12 ------
 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi           | 44 ++++++++++++++++++++++
 .../dts/qcom/qcom-msm8974pro-fairphone-fp2.dts     |  8 ----
 arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts  | 11 ------
 .../dts/qcom/qcom-msm8974pro-oneplus-bacon.dts     |  9 -----
 .../qcom/qcom-msm8974pro-samsung-klte-common.dtsi  | 11 ++----
 ...qcom-msm8974pro-sony-xperia-shinano-common.dtsi | 12 ------
 10 files changed, 48 insertions(+), 96 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8074-dragonboard.dts b/arch/arm/boot/dts/qcom/qcom-apq8074-dragonboard.dts
index 34b0cf35fdac8b0bc34ffd27f70f900878a15ff7..d3ae6c6a6f83e2b77849eeeb0c348a8efd9464dd 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8074-dragonboard.dts
+++ b/arch/arm/boot/dts/qcom/qcom-apq8074-dragonboard.dts
@@ -198,15 +198,12 @@ &pm8941_wled {
 };
 
 &remoteproc_adsp {
-	cx-supply = <&pm8841_s2>;
-
 	firmware-name = "qcom/apq8074/adsp.mbn";
 
 	status = "okay";
 };
 
 &remoteproc_mss {
-	cx-supply = <&pm8841_s2>;
 	mss-supply = <&pm8841_s3>;
 	mx-supply = <&pm8841_s1>;
 	pll-supply = <&pm8941_l12>;
@@ -225,20 +222,10 @@ pm8841_s1: s1 {
 			regulator-max-microvolt = <1050000>;
 		};
 
-		pm8841_s2: s2 {
-			regulator-min-microvolt = <500000>;
-			regulator-max-microvolt = <1050000>;
-		};
-
 		pm8841_s3: s3 {
 			regulator-min-microvolt = <500000>;
 			regulator-max-microvolt = <1050000>;
 		};
-
-		pm8841_s4: s4 {
-			regulator-min-microvolt = <500000>;
-			regulator-max-microvolt = <1050000>;
-		};
 	};
 
 	regulators-1 {
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974-lge-nexus5-hammerhead.dts b/arch/arm/boot/dts/qcom/qcom-msm8974-lge-nexus5-hammerhead.dts
index 261044fdfee866449e9d9d62cef5aea10d88e874..b60a45f5c34193daffe982ecab132315e4b12865 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974-lge-nexus5-hammerhead.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974-lge-nexus5-hammerhead.dts
@@ -368,12 +368,10 @@ led@5 {
 };
 
 &remoteproc_adsp {
-	cx-supply = <&pm8841_s2>;
 	status = "okay";
 };
 
 &remoteproc_mss {
-	cx-supply = <&pm8841_s2>;
 	mss-supply = <&pm8841_s3>;
 	mx-supply = <&pm8841_s1>;
 	pll-supply = <&pm8941_l12>;
@@ -389,20 +387,10 @@ pm8841_s1: s1 {
 			regulator-max-microvolt = <1050000>;
 		};
 
-		pm8841_s2: s2 {
-			regulator-min-microvolt = <500000>;
-			regulator-max-microvolt = <1050000>;
-		};
-
 		pm8841_s3: s3 {
 			regulator-min-microvolt = <1050000>;
 			regulator-max-microvolt = <1050000>;
 		};
-
-		pm8841_s4: s4 {
-			regulator-min-microvolt = <815000>;
-			regulator-max-microvolt = <900000>;
-		};
 	};
 
 	regulators-1 {
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974-samsung-hlte.dts b/arch/arm/boot/dts/qcom/qcom-msm8974-samsung-hlte.dts
index 903bb4d125135771504281df50aa11c9b6576a28..214cbcbd21cd18554d83f3c8569cd788868c71b0 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974-samsung-hlte.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974-samsung-hlte.dts
@@ -152,12 +152,10 @@ touch_ldo_pin: touchscreen-ldo-state {
 };
 
 &remoteproc_adsp {
-	cx-supply = <&pm8841_s2>;
 	status = "okay";
 };
 
 &remoteproc_mss {
-	cx-supply = <&pm8841_s2>;
 	mss-supply = <&pm8841_s3>;
 	mx-supply = <&pm8841_s1>;
 	pll-supply = <&pm8941_l12>;
@@ -173,20 +171,10 @@ pm8841_s1: s1 {
 			regulator-max-microvolt = <1050000>;
 		};
 
-		pm8841_s2: s2 {
-			regulator-min-microvolt = <500000>;
-			regulator-max-microvolt = <1050000>;
-		};
-
 		pm8841_s3: s3 {
 			regulator-min-microvolt = <1050000>;
 			regulator-max-microvolt = <1050000>;
 		};
-
-		pm8841_s4: s4 {
-			regulator-min-microvolt = <815000>;
-			regulator-max-microvolt = <900000>;
-		};
 	};
 
 	regulators-1 {
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine.dtsi
index d34659ebac22e65a511994ef201fe04f12089781..02a64cea280875a91db8ee70b6b8de683327de50 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine.dtsi
@@ -216,12 +216,10 @@ &pm8941_wled {
 };
 
 &remoteproc_adsp {
-	cx-supply = <&pm8841_s2>;
 	status = "okay";
 };
 
 &remoteproc_mss {
-	cx-supply = <&pm8841_s2>;
 	mss-supply = <&pm8841_s3>;
 	mx-supply = <&pm8841_s1>;
 	pll-supply = <&pm8941_l12>;
@@ -237,20 +235,10 @@ pm8841_s1: s1 {
 			regulator-max-microvolt = <1050000>;
 		};
 
-		pm8841_s2: s2 {
-			regulator-min-microvolt = <500000>;
-			regulator-max-microvolt = <1050000>;
-		};
-
 		pm8841_s3: s3 {
 			regulator-min-microvolt = <500000>;
 			regulator-max-microvolt = <1050000>;
 		};
-
-		pm8841_s4: s4 {
-			regulator-min-microvolt = <500000>;
-			regulator-max-microvolt = <1050000>;
-		};
 	};
 
 	regulators-1 {
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
index 8459a840d9ffee9da2f9a4ad8fd5a1419a3eb5a7..2a82ddce94a28eb1b50fdaffd5ba5de86e165156 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
@@ -8,6 +8,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interconnect/qcom,msm8974.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/reset/qcom,gcc-msm8974.h>
 
 / {
@@ -146,6 +147,40 @@ rpmcc: clock-controller {
 					clocks = <&xo_board>;
 					clock-names = "xo";
 				};
+
+				rpmpd: power-controller {
+					compatible = "qcom,msm8974-rpmpd";
+					#power-domain-cells = <1>;
+					operating-points-v2 = <&rpmpd_opp_table>;
+
+					rpmpd_opp_table: opp-table {
+						compatible = "operating-points-v2";
+
+						rpmpd_opp_ret: opp1 {
+							opp-level = <1>;
+						};
+
+						rpmpd_opp_svs_krait: opp2 {
+							opp-level = <2>;
+						};
+
+						rpmpd_opp_svs_soc: opp3 {
+							opp-level = <3>;
+						};
+
+						rpmpd_opp_nom: opp4 {
+							opp-level = <4>;
+						};
+
+						rpmpd_opp_turbo: opp5 {
+							opp-level = <5>;
+						};
+
+						rpmpd_opp_super_turbo: opp6 {
+							opp-level = <6>;
+						};
+					};
+				};
 			};
 		};
 	};
@@ -743,6 +778,9 @@ pronto: remoteproc@fb204000 {
 					      <&wcnss_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
 			interrupt-names = "wdog", "fatal", "ready", "handover", "stop-ack";
 
+			power-domains = <&rpmpd MSM8974_VDDCX>;
+			power-domain-names = "cx";
+
 			qcom,smem-states = <&wcnss_smp2p_out 0>;
 			qcom,smem-state-names = "stop";
 
@@ -1545,6 +1583,9 @@ remoteproc_mss: remoteproc@fc880000 {
 			resets = <&gcc GCC_MSS_RESTART>;
 			reset-names = "mss_restart";
 
+			power-domains = <&rpmpd MSM8974_VDDCX>;
+			power-domain-names = "cx";
+
 			qcom,halt-regs = <&tcsr_mutex 0x1180 0x1200 0x1280>;
 
 			qcom,smem-states = <&modem_smp2p_out 0>;
@@ -2208,6 +2249,9 @@ remoteproc_adsp: remoteproc@fe200000 {
 			clocks = <&xo_board>;
 			clock-names = "xo";
 
+			power-domains = <&rpmpd MSM8974_VDDCX>;
+			power-domain-names = "cx";
+
 			memory-region = <&adsp_region>;
 
 			qcom,smem-states = <&adsp_smp2p_out 0>;
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974pro-fairphone-fp2.dts b/arch/arm/boot/dts/qcom/qcom-msm8974pro-fairphone-fp2.dts
index fe227fd3f908e219e20bffe3561390ca6568468e..a081aeadd1d4d9539d38588811be8ac5ba0b79a4 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974pro-fairphone-fp2.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974pro-fairphone-fp2.dts
@@ -156,7 +156,6 @@ &pronto {
 	status = "okay";
 
 	vddmx-supply = <&pm8841_s1>;
-	vddcx-supply = <&pm8841_s2>;
 	vddpx-supply = <&pm8941_s3>;
 
 	pinctrl-names = "default";
@@ -181,12 +180,10 @@ wcnss {
 
 &remoteproc_adsp {
 	status = "okay";
-	cx-supply = <&pm8841_s2>;
 };
 
 &remoteproc_mss {
 	status = "okay";
-	cx-supply = <&pm8841_s2>;
 	mss-supply = <&pm8841_s3>;
 	mx-supply = <&pm8841_s1>;
 	pll-supply = <&pm8941_l12>;
@@ -201,11 +198,6 @@ pm8841_s1: s1 {
 			regulator-max-microvolt = <1050000>;
 		};
 
-		pm8841_s2: s2 {
-			regulator-min-microvolt = <500000>;
-			regulator-max-microvolt = <1050000>;
-		};
-
 		pm8841_s3: s3 {
 			regulator-min-microvolt = <1050000>;
 			regulator-max-microvolt = <1050000>;
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts b/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts
index b896cc1ad6f7d4b3f8e70ad4460867b04519a6d9..402372834c53d6ef71a72156d1be7d30ff1feee5 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts
@@ -70,7 +70,6 @@ &pm8941_vib {
 
 &pronto {
 	vddmx-supply = <&pm8841_s1>;
-	vddcx-supply = <&pm8841_s2>;
 	vddpx-supply = <&pm8941_s3>;
 
 	pinctrl-0 = <&wcnss_pin_a>;
@@ -104,20 +103,10 @@ pm8841_s1: s1 {
 			regulator-max-microvolt = <1050000>;
 		};
 
-		pm8841_s2: s2 {
-			regulator-min-microvolt = <500000>;
-			regulator-max-microvolt = <1050000>;
-		};
-
 		pm8841_s3: s3 {
 			regulator-min-microvolt = <1050000>;
 			regulator-max-microvolt = <1050000>;
 		};
-
-		pm8841_s4: s4 {
-			regulator-min-microvolt = <815000>;
-			regulator-max-microvolt = <900000>;
-		};
 	};
 
 	regulators-1 {
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974pro-oneplus-bacon.dts b/arch/arm/boot/dts/qcom/qcom-msm8974pro-oneplus-bacon.dts
index 4c8edadea0ac63db668dbd666fbb8d92e23232b7..090774e05451e1b5c7cd6d1049760da651cc83b4 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974pro-oneplus-bacon.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974pro-oneplus-bacon.dts
@@ -213,7 +213,6 @@ &pm8941_vib {
 
 &pronto {
 	vddmx-supply = <&pm8841_s1>;
-	vddcx-supply = <&pm8841_s2>;
 	vddpx-supply = <&pm8941_s3>;
 
 	pinctrl-names = "default";
@@ -239,8 +238,6 @@ wcnss {
 };
 
 &remoteproc_adsp {
-	cx-supply = <&pm8841_s2>;
-
 	status = "okay";
 };
 
@@ -253,12 +250,6 @@ pm8841_s1: s1 {
 			regulator-max-microvolt = <1050000>;
 		};
 
-		pm8841_s2: s2 {
-			regulator-min-microvolt = <875000>;
-			regulator-max-microvolt = <1050000>;
-			regulator-always-on;
-		};
-
 		pm8841_s3: s3 {
 			regulator-min-microvolt = <1050000>;
 			regulator-max-microvolt = <1050000>;
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974pro-samsung-klte-common.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8974pro-samsung-klte-common.dtsi
index d3959741d2ea9e2a3dace149034d42353fbe9828..56a1a25f3df38bf4a9ba5ea4ad9e8a2d1d1c0a95 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974pro-samsung-klte-common.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974pro-samsung-klte-common.dtsi
@@ -453,12 +453,10 @@ ramoops@3e8e0000 {
 
 &remoteproc_adsp {
 	status = "okay";
-	cx-supply = <&pma8084_s2>;
 };
 
 &remoteproc_mss {
 	status = "okay";
-	cx-supply = <&pma8084_s2>;
 	mss-supply = <&pma8084_s6>;
 	mx-supply = <&pma8084_s1>;
 	pll-supply = <&pma8084_l12>;
@@ -474,11 +472,6 @@ pma8084_s1: s1 {
 			regulator-always-on;
 		};
 
-		pma8084_s2: s2 {
-			regulator-min-microvolt = <500000>;
-			regulator-max-microvolt = <1050000>;
-		};
-
 		pma8084_s3: s3 {
 			regulator-min-microvolt = <1300000>;
 			regulator-max-microvolt = <1300000>;
@@ -648,6 +641,10 @@ pma8084_l27: l27 {
 	};
 };
 
+&rpmpd {
+	compatible = "qcom,msm8974pro-pma8084-rpmpd";
+};
+
 &sdhc_1 {
 	status = "okay";
 
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974pro-sony-xperia-shinano-common.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8974pro-sony-xperia-shinano-common.dtsi
index 6af7c71c715847f137ec2da41d70f679a8e1c04b..3d2de30b495e6e6176eb38b95ec67634fbcb29ca 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974pro-sony-xperia-shinano-common.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974pro-sony-xperia-shinano-common.dtsi
@@ -207,12 +207,10 @@ &pm8941_vib {
 };
 
 &remoteproc_adsp {
-	cx-supply = <&pm8841_s2>;
 	status = "okay";
 };
 
 &remoteproc_mss {
-	cx-supply = <&pm8841_s2>;
 	mss-supply = <&pm8841_s3>;
 	mx-supply = <&pm8841_s1>;
 	pll-supply = <&pm8941_l12>;
@@ -228,20 +226,10 @@ pm8841_s1: s1 {
 			regulator-max-microvolt = <1050000>;
 		};
 
-		pm8841_s2: s2 {
-			regulator-min-microvolt = <500000>;
-			regulator-max-microvolt = <1050000>;
-		};
-
 		pm8841_s3: s3 {
 			regulator-min-microvolt = <500000>;
 			regulator-max-microvolt = <1050000>;
 		};
-
-		pm8841_s4: s4 {
-			regulator-min-microvolt = <500000>;
-			regulator-max-microvolt = <1050000>;
-		};
 	};
 
 	regulators-1 {

-- 
2.50.0


