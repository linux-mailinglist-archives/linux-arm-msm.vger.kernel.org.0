Return-Path: <linux-arm-msm+bounces-71324-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF45B3D54A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 Aug 2025 23:29:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7BBB11898F11
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 Aug 2025 21:29:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A97A524336D;
	Sun, 31 Aug 2025 21:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="al8MyXvM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 754F3233134;
	Sun, 31 Aug 2025 21:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756675757; cv=none; b=IaxM1r27HdBb55vNAeP2+lMNM2o5E8CcOwKD5vg89fG9VcYMpcAo6vddARUYx1/WNfagOAXDp3f0KI5ghOICn3DI7lHN0MfzAjT9c6lTwJ+kxyVseqnc4Wfept2zObwSPfRtjHLZnhboHDSJPM7raDehhoF4rIK1mOz3FnJPsfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756675757; c=relaxed/simple;
	bh=tT9wHpn3fL9Y6ZAf1s6A6OzTllaHVj5mhZqflcT5lIg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U8CvPygPjJJdxvp6nTeK50jOs9/p7Y1eH3LOW7EJ4QyJwbrtJ1SJzGBzoTggMoBWPaRtTtaLCdH64ptZccwbuXrYUVNOrsgj8O/5coVebuFv1qs5tR1odJVA0uhXecmGXgkYbtpaWeWRrflVYNo4s6WtxYNa1YUdUjuJdN8VVww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=al8MyXvM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D37F9C4CEF7;
	Sun, 31 Aug 2025 21:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756675757;
	bh=tT9wHpn3fL9Y6ZAf1s6A6OzTllaHVj5mhZqflcT5lIg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=al8MyXvMi0h6MWtYECAFXRmMnOjab2rZT7JfD0GHXdfGazFvu0D8oFtUX2FaAIFV1
	 0YAKxBBDSHzKz1HXBxPxWWsLRFYBJGsr2UfKng6w85SN9xqkTH97ynmPdwnvaiz++0
	 9oD51v27npxGt5XAva41G5ei6K5A7PQ3RYdUO0CzSp8sZbzMySA7HT2cE/91uJuGx8
	 aP3FoM4vA5OVZt/NACqUkxRGu0wam1mjmr7NVcXRljuW9HRKkuugDDuiVrSAXSDsWu
	 UDheMXmshoXtsfWfUh0C2KYM3TiN2B5OgYSx0TW7lNCKPe4vxL008LuTVEf68Jzazy
	 AKu3LMZoHtvPg==
Received: by venus (Postfix, from userid 1000)
	id AC00D180FA8; Sun, 31 Aug 2025 23:29:14 +0200 (CEST)
From: Sebastian Reichel <sre@kernel.org>
Date: Sun, 31 Aug 2025 23:28:31 +0200
Subject: [PATCH 1/3] dt-bindings: platform: Add Lenovo Thinkpad T14s EC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250831-thinkpad-t14s-ec-v1-1-6e06a07afe0f@collabora.com>
References: <20250831-thinkpad-t14s-ec-v1-0-6e06a07afe0f@collabora.com>
In-Reply-To: <20250831-thinkpad-t14s-ec-v1-0-6e06a07afe0f@collabora.com>
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Henrique de Moraes Holschuh <hmh@hmh.eng.br>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1974;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=tT9wHpn3fL9Y6ZAf1s6A6OzTllaHVj5mhZqflcT5lIg=;
 b=owEBbQKS/ZANAwAKAdju1/PIO/qaAcsmYgBotL6pdyYx08kQ4ljGnnfQu7NUKLUn2MDz+joMF
 WY8Ghhef2CJAjMEAAEKAB0WIQTvZg0HRj+Lcmp5VBPY7tfzyDv6mgUCaLS+qQAKCRDY7tfzyDv6
 mkGsD/9Hqy7oDnBSXICnBwK1avgecaXz3Cs4l0P/DnGb3hwbhEgLkAT5eh6PvK7g2eAMubjf1/m
 Q/5u2ZUcOkKuduvw1dqJINuKfmSJwJ0ksVSE2KMyBvB0KtVmICZFBKBx2JM/SbyfVVP6p5jyNGI
 aieUvWOPEgSwiiPKyJAgsLrZUlprZLnQQWu65XGasB7OUf7Ed4fsFK/Q12lIbh75i75CpIjsrBS
 qgaeHUy58PtNz8pGEELXqODfNd/XY3sW4cia8/iD+WVYTjmFz1LaeKW27ZWe+pa8Xv67uN1gjGu
 ZjqMPlXE2m147YEIJP76Ap4Jzmz6/2UE7KWrOBE80zTEjogHeVdKRAatF3PSGfe5zUyhGtFojbE
 YA+ABeCrwAMfz7ZkH91CyvuouOrS+2lQPa/GmGn5eeGwwrtb+I7JmFYSvlRB/B8ouOl4fZVQbEP
 TnNoAad7kvnvt8j/fxgBupH6fQr1RiFm7XFI+A1BPAtheYcMpsoiW6KAGu3gukJ/MWRGzbt508Z
 /+2VBSp1HdMdN4g1fwY6TK9dcDMPMhR+DwNv0ZzjdkSbrk4Tf14h6yRTPYl9uxGYo0mTgE6RdYA
 YngHH1L224GwXc5UJFVV8Fe+P76eV5A3fvWBdYmWbv/AFQN70s4lrZKQ/ePEmNJDkn2UlW8A0L4
 /uj3rXALLDH1Dsw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Add binding for the EC found in the Thinkpad T14s Gen6 Snapdragon,
which is based on the Qualcomm X1 Elite. Some of the system LEDs
and extra keys are only accessible via the EC.

Signed-off-by: Sebastian Reichel <sre@kernel.org>
---
 .../bindings/platform/lenovo,thinkpad-t14s-ec.yaml | 49 ++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/Documentation/devicetree/bindings/platform/lenovo,thinkpad-t14s-ec.yaml b/Documentation/devicetree/bindings/platform/lenovo,thinkpad-t14s-ec.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..bab20df2d9ede9a3cb0359944b26b3d18ff7d9b8
--- /dev/null
+++ b/Documentation/devicetree/bindings/platform/lenovo,thinkpad-t14s-ec.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/platform/lenovo,thinkpad-t14s-ec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Lenovo Thinkpad T14s Embedded Controller.
+
+maintainers:
+  - Sebastian Reichel <sre@kernel.org>
+
+description:
+  The Qualcomm Snapdragon-based Lenovo Thinkpad T14s has an Embedded Controller
+  (EC) which handles things such as keyboard backlight, LEDs or non-standard keys.
+  This binding describes the interface, on an I2C bus, to this EC.
+
+properties:
+  compatible:
+    const: lenovo,thinkpad-t14s-ec
+
+  reg:
+    const: 0x28
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |+
+    #include <dt-bindings/interrupt-controller/irq.h>
+    i2c1 {
+        clock-frequency = <400000>;
+
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        embedded-controller@28 {
+            compatible = "lenovo,thinkpad-t14s-ec";
+            reg = <0x28>;
+            interrupts-extended = <&tlmm 66 IRQ_TYPE_LEVEL_LOW>;
+        };
+    };
+...

-- 
2.50.1


