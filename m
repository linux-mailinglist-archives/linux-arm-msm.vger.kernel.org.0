Return-Path: <linux-arm-msm+bounces-46305-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 922B7A20108
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 23:48:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E392C161E32
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 22:48:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B4B21E3DE3;
	Mon, 27 Jan 2025 22:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="OUi6LzPC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AAD31DE3DD;
	Mon, 27 Jan 2025 22:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738018004; cv=none; b=O/a66sydGiUX2q53+6tXpa86TwDes9mAV32Ej2elNEAWOVUW58UwyhoB7rCilZ5pWqtwh7G1Nh6oKv4ooLJ/ExCH+Y3OPSPrDl1mQ82VgTJClEUHQj+h6Z0uBOI5XmZKw7Vcn7gBGkijB2MXGSp42AP8AH+kbnpt78H4J5o23Lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738018004; c=relaxed/simple;
	bh=pdaxfgjjHXzyoe6ybtvzaf87CMaY9p1zuRDSarIthKo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XpA6tRrkDvWTz87sAFg9WfkUiIn5bpvrUdpFx88w+PW3pjRbXSfNYUQkuN8xw06URFeTmvUcGPWrsFCx+q+EPRYrel6l9l7sixpXg+5IsU/geE0bOxONol8dpItvdSm+2o/OXvhvpDIdfJZ3kE+WwZQ+nIiJpQQh9DOUo52vtaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=OUi6LzPC; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1738017998; bh=pdaxfgjjHXzyoe6ybtvzaf87CMaY9p1zuRDSarIthKo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=OUi6LzPCwoKJHMZ2yaWAMhi/AeIboYqn3gAPJYteYVT60DITPvcU6EEMd0TA8zdIM
	 rGMLad3M21IyFqdyigrArjSd6VnHhHOZd9EE1StvU4exPkUijVkMi6kUuhazjkYVbs
	 7IGvanKbDJ8BWcdLalPP+mdHniImUUoKCWxN5fP8=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Mon, 27 Jan 2025 23:45:43 +0100
Subject: [PATCH v3 11/13] ARM: dts: qcom: Introduce dtsi for LTE-capable
 MSM8926
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250127-msm8226-modem-v3-11-67e968787eef@lucaweiss.eu>
References: <20250127-msm8226-modem-v3-0-67e968787eef@lucaweiss.eu>
In-Reply-To: <20250127-msm8226-modem-v3-0-67e968787eef@lucaweiss.eu>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 =?utf-8?q?Matti_Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca@lucaweiss.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7889; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=pdaxfgjjHXzyoe6ybtvzaf87CMaY9p1zuRDSarIthKo=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBnmAzIZCoZuMCrhyFl6Lvl+qhlcm946OeCBbFhZ
 qFdlzgS5i2JAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZ5gMyAAKCRBy2EO4nU3X
 VrabD/wL2lkA2ZjwT0X1w93daruEpQATQCwL1Z8mkex5G7S+ehUvzYmley/lj86OID69Xhuf1CI
 3MXquB8g6+nVIj+TT/c9ZEr8jzBBnBSAXZZMRunhMx6ptRmlP+XJtaP3m9FvabXLIMNf/Kwg/G9
 UN63QOf7RpPbdkTtKonFnhHOURpYSHDtuGW0hlui4KpAkmEsL7bHqx9BOBQ8+ekc0y17Ao1TUPZ
 mf8pD76lYDGoDeBB+wiB1EZH6CjFnpZxV++lT1uB8mlrvjP0ny015vRkIw+xmkwBtDzA5zxGyli
 us5ouQOQFLctje3lHPUIzTQUZK/f6ZgQmdO3cmIJBj81urKN2DXnr4i11H2o5PpcPV0DBfotCsl
 EGlHHk7noZr3vjKsSNEKCcTilb664zj0yQoCG1AYsbJmKKgS/mJLJ259TkCzMCWAFSNMkpJ0XEs
 u1mXhglQ6o+SAjeG0IorSMemazVIvhbpDfLT/2krLUm6b1SgeWHZjtIDlWcDCcvOoUzMZo63b7c
 6url5nIOwaIHwthp4ZmDPAT08TJUlfh4cc8kEK3/QAmdGf252KuZIQKnPcrnzust6Mu10A6I39i
 Ra2MEzXNnCljxQr7lXKCwga2HdxpwG+r1QsiqZHYe+NlyfAZtB7XKdsKGq0FPNvILSPDUwgSYoc
 E59drhdHSSvc2UA==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

MSM8926, while being 'just' an LTE-capable variant of MSM8226, the dts
needs to slightly change since the modem doesn't use the ext-bhs-reg and
needs mss-supply, therefore it gets a new compatible.

Since we already have two -common.dtsi files which are used on both
APQ8026/MSM8226 and MSM8926 devices, change the setup a bit by removing
the SoC include from those and requiring the device dts to pick the
correct one.

Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 arch/arm/boot/dts/qcom/msm8926.dtsi                           | 11 +++++++++++
 arch/arm/boot/dts/qcom/qcom-apq8026-samsung-matisse-wifi.dts  |  1 +
 arch/arm/boot/dts/qcom/qcom-msm8226-microsoft-common.dtsi     |  6 +++++-
 arch/arm/boot/dts/qcom/qcom-msm8226-microsoft-dempsey.dts     |  1 +
 arch/arm/boot/dts/qcom/qcom-msm8226-microsoft-makepeace.dts   |  1 +
 arch/arm/boot/dts/qcom/qcom-msm8226-microsoft-moneypenny.dts  |  1 +
 .../boot/dts/qcom/qcom-msm8226-samsung-matisse-common.dtsi    |  6 +++++-
 arch/arm/boot/dts/qcom/qcom-msm8926-htc-memul.dts             |  2 +-
 .../arm/boot/dts/qcom/qcom-msm8926-microsoft-superman-lte.dts |  1 +
 arch/arm/boot/dts/qcom/qcom-msm8926-microsoft-tesla.dts       |  1 +
 arch/arm/boot/dts/qcom/qcom-msm8926-motorola-peregrine.dts    |  2 +-
 arch/arm/boot/dts/qcom/qcom-msm8926-samsung-matisselte.dts    |  1 +
 12 files changed, 30 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/msm8926.dtsi b/arch/arm/boot/dts/qcom/msm8926.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..629654c525b4bf415e41dca7b3d9fc60a5ee75fd
--- /dev/null
+++ b/arch/arm/boot/dts/qcom/msm8926.dtsi
@@ -0,0 +1,11 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025, Luca Weiss <luca@lucaweiss.eu>
+ */
+
+#include "qcom-msm8226.dtsi"
+
+&modem {
+	compatible = "qcom,msm8926-mss-pil";
+	/delete-property/ qcom,ext-bhs-reg;
+};
diff --git a/arch/arm/boot/dts/qcom/qcom-apq8026-samsung-matisse-wifi.dts b/arch/arm/boot/dts/qcom/qcom-apq8026-samsung-matisse-wifi.dts
index da3be658e822fb6408738e7e79453b87c39478e1..4546fa8beba46d31345da1ee3eded20e8a853f6b 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8026-samsung-matisse-wifi.dts
+++ b/arch/arm/boot/dts/qcom/qcom-apq8026-samsung-matisse-wifi.dts
@@ -5,6 +5,7 @@
 
 /dts-v1/;
 
+#include "qcom-msm8226.dtsi"
 #include "qcom-msm8226-samsung-matisse-common.dtsi"
 
 / {
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8226-microsoft-common.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8226-microsoft-common.dtsi
index ca76bf8af75e463bc3a2a5cfc1c2b574f0ac17f5..d4a32af0ef8f1ca6c0926261d7756a4d6bfba23f 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8226-microsoft-common.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8226-microsoft-common.dtsi
@@ -8,7 +8,11 @@
  * Copyright (c) 2023, Rayyan Ansari <rayyan@ansari.sh>
  */
 
-#include "qcom-msm8226.dtsi"
+/*
+ * The .dts should first include qcom-msm8226.dtsi or msm8926.dtsi depending on
+ * the SoC on the given device.
+ */
+
 #include "pm8226.dtsi"
 #include <dt-bindings/input/input.h>
 
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8226-microsoft-dempsey.dts b/arch/arm/boot/dts/qcom/qcom-msm8226-microsoft-dempsey.dts
index 2c664b5934ec54b7d53a2e3a8d86a1df864d33a9..f448c908841610bc53cccccb431d5ce50d205fc1 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8226-microsoft-dempsey.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8226-microsoft-dempsey.dts
@@ -8,6 +8,7 @@
 
 /dts-v1/;
 
+#include "qcom-msm8226.dtsi"
 #include "qcom-msm8226-microsoft-common.dtsi"
 
 / {
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8226-microsoft-makepeace.dts b/arch/arm/boot/dts/qcom/qcom-msm8226-microsoft-makepeace.dts
index 731c5c3756784677580f09fad31ba28b0533145d..94bf3b1ad1bd1fb926ac5bb7174394965d52609c 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8226-microsoft-makepeace.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8226-microsoft-makepeace.dts
@@ -8,6 +8,7 @@
 
 /dts-v1/;
 
+#include "qcom-msm8226.dtsi"
 #include "qcom-msm8226-microsoft-common.dtsi"
 
 / {
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8226-microsoft-moneypenny.dts b/arch/arm/boot/dts/qcom/qcom-msm8226-microsoft-moneypenny.dts
index a28a83cb534055a36a55f907094b34f48b6266be..d8cdb75dfbb8bdafd8bb8fecfe3b9ab3f42b41e4 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8226-microsoft-moneypenny.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8226-microsoft-moneypenny.dts
@@ -8,6 +8,7 @@
 
 /dts-v1/;
 
+#include "qcom-msm8226.dtsi"
 #include "qcom-msm8226-microsoft-common.dtsi"
 
 /* This device has no magnetometer */
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8226-samsung-matisse-common.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8226-samsung-matisse-common.dtsi
index fbd568c7d6b7415d240aa1a2329d07cf9135274c..0a3147656f36ca2616e0e3cc7c1dd808b55f3a88 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8226-samsung-matisse-common.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8226-samsung-matisse-common.dtsi
@@ -3,8 +3,12 @@
  * Copyright (c) 2022, Matti Lehtimäki <matti.lehtimaki@gmail.com>
  */
 
+/*
+ * The .dts should first include qcom-msm8226.dtsi or msm8926.dtsi depending on
+ * the SoC on the given device.
+ */
+
 #include <dt-bindings/input/input.h>
-#include "qcom-msm8226.dtsi"
 #include "pm8226.dtsi"
 
 /delete-node/ &adsp_region;
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8926-htc-memul.dts b/arch/arm/boot/dts/qcom/qcom-msm8926-htc-memul.dts
index 18396623a91dd4bf4b66f01c1d983c391722f3b5..d6eaa82cee4daf6a1386902f537f1351811d4a06 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8926-htc-memul.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8926-htc-memul.dts
@@ -5,7 +5,7 @@
 
 /dts-v1/;
 
-#include "qcom-msm8226.dtsi"
+#include "msm8926.dtsi"
 #include "pm8226.dtsi"
 
 /delete-node/ &adsp_region;
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8926-microsoft-superman-lte.dts b/arch/arm/boot/dts/qcom/qcom-msm8926-microsoft-superman-lte.dts
index 9b48661d69c53829c30ece8544ffff97f3032a59..eea4fd8cd9725f1ef629aae446ff7aa6c49fb2fa 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8926-microsoft-superman-lte.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8926-microsoft-superman-lte.dts
@@ -8,6 +8,7 @@
 
 /dts-v1/;
 
+#include "msm8926.dtsi"
 #include "qcom-msm8226-microsoft-common.dtsi"
 
 /* This device has touchscreen on i2c3 instead */
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8926-microsoft-tesla.dts b/arch/arm/boot/dts/qcom/qcom-msm8926-microsoft-tesla.dts
index 55077a5f2e34f84857ee35d22157362759151c5a..f23bbb94cc5e4343f667e53d66bc289228a85134 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8926-microsoft-tesla.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8926-microsoft-tesla.dts
@@ -8,6 +8,7 @@
 
 /dts-v1/;
 
+#include "msm8926.dtsi"
 #include "qcom-msm8226-microsoft-common.dtsi"
 
 /* This device has touchscreen on i2c1 instead */
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8926-motorola-peregrine.dts b/arch/arm/boot/dts/qcom/qcom-msm8926-motorola-peregrine.dts
index 376a33125941028a3977e76373ee96959b08ee3e..db3273c755c2b5480b9c00336314b63900a74cbd 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8926-motorola-peregrine.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8926-motorola-peregrine.dts
@@ -2,7 +2,7 @@
 
 /dts-v1/;
 
-#include "qcom-msm8226.dtsi"
+#include "msm8926.dtsi"
 #include "pm8226.dtsi"
 
 /delete-node/ &smem_region;
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8926-samsung-matisselte.dts b/arch/arm/boot/dts/qcom/qcom-msm8926-samsung-matisselte.dts
index d0e1bc39f8ef700aa648148ac070f59062d049d7..772827cad972ad4ff032cfb9310568c5d2f0170f 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8926-samsung-matisselte.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8926-samsung-matisselte.dts
@@ -6,6 +6,7 @@
 
 /dts-v1/;
 
+#include "msm8926.dtsi"
 #include "qcom-msm8226-samsung-matisse-common.dtsi"
 
 / {

-- 
2.48.1


