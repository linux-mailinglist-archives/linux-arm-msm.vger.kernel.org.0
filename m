Return-Path: <linux-arm-msm+bounces-23295-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB15D90F833
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 23:05:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0850D1C20A70
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 21:05:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0B2E15EFAD;
	Wed, 19 Jun 2024 21:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="oolKjNSe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA4D15B988;
	Wed, 19 Jun 2024 21:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718830991; cv=none; b=qbQXEmvkiOIf614LxfTJbL5edLToFBXZn8QHe6eKmap4I1/7ZxOiK5DQuBES3iB2dPznznC7ycuNcbRbgpv12b4weqJyuOq8sLRGKotiRs9CH1m7cVsgTlLoeEjFPS6QmYIJC5Bf/a1gZjgqMJ0XJ0aOltZLEDgNeB3ZbLtl5J8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718830991; c=relaxed/simple;
	bh=U4dGGEGpOOkzWqH8OuKBSW4honG4SMlwLIHbWnr5h9U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KUI6GiZKJzDlq7mnb1Z8jW1wrIWwe/Er4dmtmzv23rxoy71CyZkE+QDhFd9HrWwocM2B5uJ9b6Ps1k5yWP4wqJN5PAbd/A0/YBgv6pbAqpE7jh6XTraMNmTcXSs41s4kF579o97n8BJk6jo2ceb4g0LhYcr1arUZh96g65+3Qj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=oolKjNSe; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1718830986; bh=U4dGGEGpOOkzWqH8OuKBSW4honG4SMlwLIHbWnr5h9U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=oolKjNSebElawBsh7OAlqEmfXluFhJe5GlHAShc108UluEOcA+ZjzXaCiFzNc83f5
	 V2Kjy8OT/B8QYBC1f2X0QCrLTLsOdlgUodyQmnmdggvCzrCz3UIzi7+zog2ESUgnM4
	 tzvI8p3PdCZvPN7wO6yWZmjSfuI4nwpMPGyeSz/k=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Wed, 19 Jun 2024 23:02:50 +0200
Subject: [PATCH 6/7] ARM: dts: qcom: msm8226: Hook up CPU cooling
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240619-msm8226-cpufreq-v1-6-85143f5291d1@lucaweiss.eu>
References: <20240619-msm8226-cpufreq-v1-0-85143f5291d1@lucaweiss.eu>
In-Reply-To: <20240619-msm8226-cpufreq-v1-0-85143f5291d1@lucaweiss.eu>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 Luca Weiss <luca@lucaweiss.eu>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2415; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=U4dGGEGpOOkzWqH8OuKBSW4honG4SMlwLIHbWnr5h9U=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBmc0eH/VSYmnEAuPFnCi8s5pSvqXOFphEFVJYZd
 xE0/IbhiCaJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZnNHhwAKCRBy2EO4nU3X
 VofcEACv1O36gtN/ndklBVQLJvXq7HkMWQffN6xpjveK+UqyMZx/Ql90KVjk8isYjE195qqV38z
 S4o0Kysx55z7yGRoF5WH1xZ98rlaCxWlA/5lhECH1kcoLCLG865IfLyarJexxQM0Q4flTHgBp38
 NfXu/82MaTdM3UrNhXPur1KTiMazVu97lSxCqh+9g37n0ZEuXmZkbC/GR62K3Uq62sTvg25gCmu
 pyCuhGssvX7BnyUPYTV5tnxjyeB7+oXrNFSKb2FbU8v4Y3VYcgzSn7qGkp9/uHAhmvciqgU3XJH
 cd2vH+IX+hEPVd97fxONBx9z3a2jUcjG5xeOnrHmsAs/VNd26ovYRK/bV34nBDOmqoN0j2xikGa
 Msh9ac+LO3N1dAO9FHkfUS29U6YKtnQFEUYj8dxJYCEAbWB4eDFiV54k0I7lNMHuL2ETp36OxqJ
 vgBbstiX/sFuoVOzPC16/g1jlltsW3WD0a9j/TuZCe5I+MYwQ1Ebi9TSwESGr1d9sTPudirz13h
 6osYA8Njhal0PRfLKdF2m6MILoFwAyUy0U6ZTN6FzC5XjWQru4obWa7srHvAnguX3FdTGgqFAJO
 9muFnMIltnSThnohibc1/soKZ+VsHcS0jct70cGeegU5zer1bvmUFf5FNbWOh/9FHXwhIYmDR36
 vWIbLmNA1tomkMg==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

Add cooling-maps for the CPU thermal zones so the driver can actually do
something when the CPU temperature rises too much.

Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi
index 6e9fbe2e7223..9deee34fc5ca 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi
@@ -12,6 +12,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/reset/qcom,gcc-msm8974.h>
+#include <dt-bindings/thermal/thermal.h>
 
 / {
 	#address-cells = <1>;
@@ -48,6 +49,7 @@ CPU0: cpu@0 {
 			operating-points-v2 = <&cpu_opp_table>;
 			qcom,acc = <&acc0>;
 			qcom,saw = <&saw0>;
+			#cooling-cells = <2>;
 		};
 
 		CPU1: cpu@1 {
@@ -60,6 +62,7 @@ CPU1: cpu@1 {
 			operating-points-v2 = <&cpu_opp_table>;
 			qcom,acc = <&acc1>;
 			qcom,saw = <&saw1>;
+			#cooling-cells = <2>;
 		};
 
 		CPU2: cpu@2 {
@@ -72,6 +75,7 @@ CPU2: cpu@2 {
 			operating-points-v2 = <&cpu_opp_table>;
 			qcom,acc = <&acc2>;
 			qcom,saw = <&saw2>;
+			#cooling-cells = <2>;
 		};
 
 		CPU3: cpu@3 {
@@ -84,6 +88,7 @@ CPU3: cpu@3 {
 			operating-points-v2 = <&cpu_opp_table>;
 			qcom,acc = <&acc3>;
 			qcom,saw = <&saw3>;
+			#cooling-cells = <2>;
 		};
 
 		L2: l2-cache {
@@ -1256,6 +1261,16 @@ cpu0-thermal {
 
 			thermal-sensors = <&tsens 5>;
 
+			cooling-maps {
+				map0 {
+					trip = <&cpu_alert0>;
+					cooling-device = <&CPU0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&CPU1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&CPU2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&CPU3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
 			trips {
 				cpu_alert0: trip0 {
 					temperature = <75000>;
@@ -1277,6 +1292,16 @@ cpu1-thermal {
 
 			thermal-sensors = <&tsens 2>;
 
+			cooling-maps {
+				map0 {
+					trip = <&cpu_alert1>;
+					cooling-device = <&CPU0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&CPU1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&CPU2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&CPU3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
 			trips {
 				cpu_alert1: trip0 {
 					temperature = <75000>;

-- 
2.45.2


