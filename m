Return-Path: <linux-arm-msm+bounces-60866-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C394AD4201
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 20:36:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BAD7A7A9C07
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 18:34:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80947248879;
	Tue, 10 Jun 2025 18:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="5/diACix"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2FEF246797;
	Tue, 10 Jun 2025 18:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749580556; cv=none; b=uOx9EaZex5m+eFj3iVOoDDLEhXXk+HB19LQZW9kfALfJ8yeyRZKJH6n9zKe9qCrvFBtE/er+CDiSnGjByOrXle/FbN6NlMpfMPjgotHLzZ7oR+lX9i07DMvYFdha8pbqwc1VVLffxgoFe+2angptvd3WkkckVmKkbk+fNv+qe1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749580556; c=relaxed/simple;
	bh=twyQ1Ck2pvyyVyptKKyyPqS4vLJkM4xooW1eE+dWMmU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E1dmuEQmq2sTGFC30RN0tDFUeo4GJmg/tRxuxb93xooP6izSkf1XH4bBIhVvHb4eUwr2XGGp3c4YfKpggE8gI6t+07yFxGEtwHlH6I+/er/AS1kg1IUSYuHNgexydO4oVhTmFWMOR8sjegLnhSB4ePtcckxeWtGkkaka8MlTuFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=5/diACix; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1749580553; bh=twyQ1Ck2pvyyVyptKKyyPqS4vLJkM4xooW1eE+dWMmU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=5/diACix5rEpKE0/mah+wWuZYoLW9Q5EzdXuOxQZvVKYNAPsKSpHeGzUXz2P6+yr4
	 lhr00b7E4I5gF1Z2Evvfcs971+ysE2wbtSKGnWftha8y6TlGbmykwKC2p3Ao4sGbF0
	 88PA2qGy9p6jalzSrnHVi55uiiOQhcCM+GgxzavQ=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Tue, 10 Jun 2025 20:34:55 +0200
Subject: [PATCH v2 4/4] ARM: dts: qcom: Add initial support for Sony Xperia
 Z Ultra (togari)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-togari-v2-4-10e7b53b87c1@lucaweiss.eu>
References: <20250610-togari-v2-0-10e7b53b87c1@lucaweiss.eu>
In-Reply-To: <20250610-togari-v2-0-10e7b53b87c1@lucaweiss.eu>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Kevin Widjaja <kevin.widjaja21@gmail.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca@lucaweiss.eu>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2604; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=BZaA/IhwpGD0dVjtQKfZc3IZ16GBCMIFbqjS7QQEkJ4=;
 b=owEBbQKS/ZANAwAKAXLYQ7idTddWAcsmYgBoSHsH8065XTNz+dpdUTRTVTX0tlM9YTv9oiCS9
 MOH+iZCrvCJAjMEAAEKAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCaEh7BwAKCRBy2EO4nU3X
 Vvw8EACgxYS9+1bsmWWFNSFFbm0QFyJFRecUosYnMJzgW7aDxEXFg+SH8s2v8myFaBHVo19zxk7
 ddgR+XPaqBDT/hqdSrGrQosdVY9dRFjsp0gP53Uj7L2LyULW8tl2cykDwSXF4uzrC17m1nJDbMD
 Lxr1usOLquiu6pJPphFlssYhXVMOkuU2kBxGh/yBynEslDVn2Ttt87fCAFjsPSMOhmSsAfWjGAV
 Mqd8huBsmjLiEB4zxnH/zjfo8DXKAQYyFgsToPopnNvF0nRENpLnGMfOdx4V1Xzx6pMnOAPK/u/
 VqF7QmEZwTPCONA3+TGi98IMfm/LQ3JhAS+GMOcxHZhqJWYmxFKESFdMuPXwf7YZNh6dJFUgTy3
 qvwW9uQHqxhyZmTg6FzVSQKqzIh0N3h9wqdcJvsrSw2rwHO/SMbK0akC7+Pz36NZsz+/oP93kj9
 c9w4a2Zl7Ax+/kTtjb+rKwDL5ojyWdh9gGBnhl4o3Zo7zC9yD1uuXYjOYsmIkMBSywPpRGPT5u2
 KIjJO5Tfge21VuiaPJo609nzAaVYOgC7dm5MTG+6Cf+dQF3mvWnRKr95v6Wi4xeds3aKEhzeELd
 wnspfkoU5RheN3dE4536hIbpzin+aQVuefDLVwuQAFO1pWtRo4pRmtcZOp5WMjj0aSToxs2QebW
 qmU4+o6bghtiZQA==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

From: Kevin Widjaja <kevin.widjaja21@gmail.com>

Add the dts for the Z Ultra. This is currently almost the same as Z1
Compact (amami) and Z1 (honami) as they share almost the same hardware.

Only USB Networking and volume button are confirmed working.

Signed-off-by: Kevin Widjaja <kevin.widjaja21@gmail.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 arch/arm/boot/dts/qcom/Makefile                          |  1 +
 .../dts/qcom/qcom-msm8974-sony-xperia-rhine-togari.dts   | 16 ++++++++++++++++
 .../boot/dts/qcom/qcom-msm8974-sony-xperia-rhine.dtsi    |  2 +-
 3 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom/Makefile b/arch/arm/boot/dts/qcom/Makefile
index 0c1d116f6e84f76994aa8c8286350bdcd1657a42..e875b5d25e8421fe16c94a1526ff401638ff01ab 100644
--- a/arch/arm/boot/dts/qcom/Makefile
+++ b/arch/arm/boot/dts/qcom/Makefile
@@ -47,6 +47,7 @@ dtb-$(CONFIG_ARCH_QCOM) += \
 	qcom-msm8974-samsung-hlte.dtb \
 	qcom-msm8974-sony-xperia-rhine-amami.dtb \
 	qcom-msm8974-sony-xperia-rhine-honami.dtb \
+	qcom-msm8974-sony-xperia-rhine-togari.dtb \
 	qcom-msm8974pro-fairphone-fp2.dtb \
 	qcom-msm8974pro-htc-m8.dtb \
 	qcom-msm8974pro-oneplus-bacon.dtb \
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine-togari.dts b/arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine-togari.dts
new file mode 100644
index 0000000000000000000000000000000000000000..f60f7304d35e1e534bb350078dae900ec54700d4
--- /dev/null
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine-togari.dts
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: GPL-2.0
+#include "qcom-msm8974-sony-xperia-rhine.dtsi"
+
+/* Togari uses a different touchscreen compared to other rhine devices */
+/delete-node/ &touchscreen;
+
+/ {
+	model = "Sony Xperia Z Ultra";
+	compatible = "sony,xperia-togari", "qcom,msm8974";
+	chassis-type = "handset";
+};
+
+&pm8941_l23 {
+	regulator-min-microvolt = <2600000>;
+	regulator-max-microvolt = <2600000>;
+};
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine.dtsi
index bf539e741ec060de67e7cb656a597abbc16650fe..f973ff65733242a243a850b99821967ccc582567 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine.dtsi
@@ -84,7 +84,7 @@ &blsp1_i2c2 {
 	status = "okay";
 	clock-frequency = <355000>;
 
-	synaptics@2c {
+	touchscreen: synaptics@2c {
 		compatible = "syna,rmi4-i2c";
 		reg = <0x2c>;
 

-- 
2.49.0


