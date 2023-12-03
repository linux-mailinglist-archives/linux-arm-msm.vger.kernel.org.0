Return-Path: <linux-arm-msm+bounces-3160-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B955802875
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 23:38:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 578CF1C2094F
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 22:38:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1F1D182AA;
	Sun,  3 Dec 2023 22:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=z3ntu.xyz header.i=@z3ntu.xyz header.b="fgQGzSbl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A11C3C8;
	Sun,  3 Dec 2023 14:38:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=z3ntu.xyz; s=s1;
	t=1701643113; bh=ZXImSee1040m6vOmaaU/BKx1+hi5aIqaEquWy17f6DE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=fgQGzSblF9Yb28DXySBw5+lW01uS1JddYjg3NjXgZExpzYly9v1P1qF2ZecgwRe6a
	 CcgZifnA+pFs2Qb9blRcZ+HcUScZOhngBvWLq6l7S/WbNoYHQJvaOC7A0GaYPaADjY
	 2noswpiIFwY6fRmcZ3nD75dRJYKmCI/qV7T4uwFA=
From: Luca Weiss <luca@z3ntu.xyz>
Date: Sun, 03 Dec 2023 23:38:18 +0100
Subject: [PATCH 2/2] ARM: dts: qcom: msm8226: Add CPU and SAW/ACC nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231203-msm8226-cpu-v1-2-d18e83340b32@z3ntu.xyz>
References: <20231203-msm8226-cpu-v1-0-d18e83340b32@z3ntu.xyz>
In-Reply-To: <20231203-msm8226-cpu-v1-0-d18e83340b32@z3ntu.xyz>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca@z3ntu.xyz>, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=3104; i=luca@z3ntu.xyz;
 h=from:subject:message-id; bh=K8oNPyYoh95lxlCaNrRZ4BbJh5I78RzGRE/djtKa5AE=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBlbQNnlpGEDrhxMsLcfteE5SsQznX/CWXv4W+z4
 Kxn9WjE4aCJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZW0DZwAKCRBy2EO4nU3X
 VnfaD/95qJ9lWfmpkoNQ/PGuXOAVO2/jRkaARw3B7LxXIeYlP2Slc59CoYNMo/Ap4RvEqZz3Hkc
 0N2vUzic/X43TVrePWBKR8elWrMBAAhNgvOBBqVfoOJSdghFSwA47cVPelLrp2XDecjmdBZfPjJ
 HIgrg9gIe41ObPIp0U3LZyxbPC72kMY5fT5FipUzJzEkG/MEi88zVoru0v74hmoZAl8RICuQRiU
 4kQQku31VXdgiBFJzpep4jqEMEFlV5qpA/jPzkgOoBuISdrHIVc6RqHMzP5M5XPuVrksJKFJB/j
 CTuoWC14K7xLpRgY2oTIRgk1sk9uh9AvNdJLP2IMhpkFrRzrVtEEbrBXyEQgPbGZszINs8uMyn8
 DGq9ZxdBlI9SQrZnMR3grIS95nX4AloWOaWIlrGNcABfNMCH927JMSx/LKIQooPVVVEI0MnWO9w
 8WNDKi09zgR0llHr9uxnGSpFrdhaGffE93aqIW1gJB8uedq6WtXYz5ThFy7Ldf1GRCnEN7+IeCn
 Vgk0Kj5w5t9JEdDMeLJH8UDtVxr6CyF3vNMteYKdrJ7BEtlbLHlvVZn6D4Nv3BTCkF+/RY3huvk
 6oMVKUjLLn8y0uOiS1V3phnfTfWuithGVlLTbt4D+ND45i3o8EkGU5PrAzx1Rrcwdg0QX0wTU2z
 Ft/t2yUUY/StDNQ==
X-Developer-Key: i=luca@z3ntu.xyz; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>

Add CPU and SAW/ACC nodes to enable SMP on MSM8226.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
[luca: update some nodes to fix dtbs_check errors, reorder, cleanup]
Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi | 91 ++++++++++++++++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi
index 8757bc0c8a0f..28abaed4dd08 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi
@@ -34,6 +34,57 @@ sleep_clk: sleep_clk {
 		};
 	};
 
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		CPU0: cpu@0 {
+			compatible = "arm,cortex-a7";
+			enable-method = "qcom,msm8226-smp";
+			device_type = "cpu";
+			reg = <0>;
+			next-level-cache = <&L2>;
+			qcom,acc = <&acc0>;
+			qcom,saw = <&saw0>;
+		};
+
+		CPU1: cpu@1 {
+			compatible = "arm,cortex-a7";
+			enable-method = "qcom,msm8226-smp";
+			device_type = "cpu";
+			reg = <1>;
+			next-level-cache = <&L2>;
+			qcom,acc = <&acc1>;
+			qcom,saw = <&saw1>;
+		};
+
+		CPU2: cpu@2 {
+			compatible = "arm,cortex-a7";
+			enable-method = "qcom,msm8226-smp";
+			device_type = "cpu";
+			reg = <2>;
+			next-level-cache = <&L2>;
+			qcom,acc = <&acc2>;
+			qcom,saw = <&saw2>;
+		};
+
+		CPU3: cpu@3 {
+			compatible = "arm,cortex-a7";
+			enable-method = "qcom,msm8226-smp";
+			device_type = "cpu";
+			reg = <3>;
+			next-level-cache = <&L2>;
+			qcom,acc = <&acc3>;
+			qcom,saw = <&saw3>;
+		};
+
+		L2: l2-cache {
+			compatible = "cache";
+			cache-level = <2>;
+			cache-unified;
+		};
+	};
+
 	firmware {
 		scm {
 			compatible = "qcom,scm-msm8226", "qcom,scm";
@@ -243,6 +294,46 @@ frame@f9028000 {
 			};
 		};
 
+		acc0: power-manager@f9088000 {
+			compatible = "qcom,kpss-acc-v2";
+			reg = <0xf9088000 0x1000>, <0xf9008000 0x1000>;
+		};
+
+		saw0: power-manager@f9089000 {
+			compatible = "qcom,msm8226-saw2-v2.1-cpu", "qcom,saw2";
+			reg = <0xf9089000 0x1000>;
+		};
+
+		acc1: power-manager@f9098000 {
+			compatible = "qcom,kpss-acc-v2";
+			reg = <0xf9098000 0x1000>, <0xf9008000 0x1000>;
+		};
+
+		saw1: power-manager@f9099000 {
+			compatible = "qcom,msm8226-saw2-v2.1-cpu", "qcom,saw2";
+			reg = <0xf9099000 0x1000>;
+		};
+
+		acc2: power-manager@f90a8000 {
+			compatible = "qcom,kpss-acc-v2";
+			reg = <0xf90a8000 0x1000>, <0xf9008000 0x1000>;
+		};
+
+		saw2: power-manager@f90a9000 {
+			compatible = "qcom,msm8226-saw2-v2.1-cpu", "qcom,saw2";
+			reg = <0xf90a9000 0x1000>;
+		};
+
+		acc3: power-manager@f90b8000 {
+			compatible = "qcom,kpss-acc-v2";
+			reg = <0xf90b8000 0x1000>, <0xf9008000 0x1000>;
+		};
+
+		saw3: power-manager@f90b9000 {
+			compatible = "qcom,msm8226-saw2-v2.1-cpu", "qcom,saw2";
+			reg = <0xf90b9000 0x1000>;
+		};
+
 		sdhc_1: mmc@f9824900 {
 			compatible = "qcom,msm8226-sdhci", "qcom,sdhci-msm-v4";
 			reg = <0xf9824900 0x11c>, <0xf9824000 0x800>;

-- 
2.43.0


