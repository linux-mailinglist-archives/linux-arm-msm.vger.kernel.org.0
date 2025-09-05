Return-Path: <linux-arm-msm+bounces-72165-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B6DB44B15
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 03:09:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 230681C283ED
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 01:10:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2E721DDC35;
	Fri,  5 Sep 2025 01:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f2AmBSm8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ABFD1D6187;
	Fri,  5 Sep 2025 01:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757034579; cv=none; b=E7QGR9xyGOiWaqZmnsjgYuJdx6ma/Boy3Ep2clKoOElBi2njMdxvZTJ30h8r12C88mE0343xTIQ2RF0J8C2vPnNH8JK0AM7+eqA3Kb6toz50MvlQ2P1Prb1egA4otI+Jz/Swvtm8gx7uH1VFbKtcBcJ2wt1D8AgMuneOBAQSbhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757034579; c=relaxed/simple;
	bh=aacuTxsB1l7ADsGb1f2QWOpaKSMadCrdUyplnxNl4/g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D5wciAZ2EFE9WQKniT8LEyVNSLi8m0cmsSAOwOP4RIhDbHH/IXViffhgSxvN1kgsu8MfvkooWo1tq3nkb1xnAZcalGXmbyx0Qz8xEkjcdqHL2N/nnsdNK3K2kRizQUYC4qb2fcH09uBGTh+DCvFNWBz9OmF6+q/dtzhxEG1lwXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f2AmBSm8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5ABCC4CEF0;
	Fri,  5 Sep 2025 01:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757034578;
	bh=aacuTxsB1l7ADsGb1f2QWOpaKSMadCrdUyplnxNl4/g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=f2AmBSm8YMArcVUliSPJNz90rqjkSOBesAHIdKd4w+5u2d9vk4pvLGjZ2YJvRRX0U
	 NhBbjtQZ9xbRKN7aFU8DGnLhK5POd4noWOChDo+KQ+eEzOUqH/cUXpMCbkvqYfIN92
	 Z+O3MsxFCrWDuxde3Fl6hIrkkIdH7vG9PwwO5kp+Bd2SxV3rl2d8gOvB+9Oy1znY1a
	 kd5/7NWtcA1tsEvKPqFJ4MztVC9zhLvgyuYaW9CiIVkotgB/WzhzTwM1YdCyXWDwgU
	 /W6gGz++5wbx2Houh+SCW2asFoZBczGXloSgC20OuJm4ifXaWrMXR/xihzbuwa3fD7
	 1kPqm2Z6gOvMQ==
Received: by venus (Postfix, from userid 1000)
	id 0F6B11807F9; Fri, 05 Sep 2025 03:09:36 +0200 (CEST)
From: Sebastian Reichel <sre@kernel.org>
Date: Fri, 05 Sep 2025 03:09:31 +0200
Subject: [PATCH v2 1/3] dt-bindings: platform: Add Lenovo Thinkpad T14s EC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250905-thinkpad-t14s-ec-v2-1-7da5d70aa423@collabora.com>
References: <20250905-thinkpad-t14s-ec-v2-0-7da5d70aa423@collabora.com>
In-Reply-To: <20250905-thinkpad-t14s-ec-v2-0-7da5d70aa423@collabora.com>
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Henrique de Moraes Holschuh <hmh@hmh.eng.br>, 
 Neil Armstrong <neil.armstrong@linaro.org>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2026;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=aacuTxsB1l7ADsGb1f2QWOpaKSMadCrdUyplnxNl4/g=;
 b=owEBbQKS/ZANAwAKAdju1/PIO/qaAcsmYgBoujhOmGuixH2xpw/UqtKyc2QNtG+U/J+Hpo649
 7ksgz0ts1yJAjMEAAEKAB0WIQTvZg0HRj+Lcmp5VBPY7tfzyDv6mgUCaLo4TgAKCRDY7tfzyDv6
 mlr9D/4wUrcb6P3ZGOgFkGr3Tdl/X+CDMWImhL95PHFBxZPPJdm4zNrZOnVpW2gCGkJuX+0MwL/
 kXq8dRBQ0k/yJcjv5uPthggz77ptRciuX39RKOiFGHBJfQU8d+snFw0hM5z69MDwIdggiVoX8zC
 68gTc3AxD2wWcV2t93vDAVyAXszZRrkyL9enSPefeLrgFX2h6gGQoq60RVxfhxUruVSZHok8eJ5
 83ekeX0Z5xOwnDwX+3FsbZO/v5sFRthXTa5J3x4JQkfv0TrEjJE54U+5scMWk9LzPcKCd+a/bVP
 Yh4jsh/9na0C1ti5n38iQJuxmemSEUPjKfw0mIA852N53q7ayohOacQyf4F6QbfClVms85n4IhW
 ym2w4D5IghcC2GWVrtQuXq+ORaDBt2MKrhZguGblFVk1OO+8R/fDhrDH/gwUnbwKBRb+SlfjmHV
 ThSfrCSbDeSTMbY7VYNO3hwiW0NIgXo1I35czSi0kOGmWbKwIJ6O7cG378NzJc9WwErTTMsWL5g
 d/XK9wI4IA3xNCIL85WzwKzBnILcJMrglVgU1FciF2N09vJIoY9WYO1nOrybPyGhvO1zaqfrVmn
 iI/3/wveI9ZRMzBEXlYdUc08gLBKsFAFpZx89scMcTchEmI5iHO6nfbGa1JcU1SFELWMxGz/Unp
 dgfc12jRbPdzdqA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Add binding for the EC found in the Thinkpad T14s Gen6 Snapdragon,
which is based on the Qualcomm X1 Elite. Some of the system LEDs
and extra keys are only accessible via the EC.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Sebastian Reichel <sre@kernel.org>
---
 .../lenovo,thinkpad-t14s-ec.yaml                   | 50 ++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..c87ccb5b30868c7a616ec08b869286d627dd7406
--- /dev/null
+++ b/Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/embedded-controller/lenovo,thinkpad-t14s-ec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Lenovo Thinkpad T14s Embedded Controller
+
+maintainers:
+  - Sebastian Reichel <sre@kernel.org>
+
+description:
+  The Qualcomm Snapdragon-based Lenovo Thinkpad T14s has an Embedded Controller
+  (EC) which handles things such as keyboard backlight, LEDs or non-standard
+  keys.
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
+  wakeup-source: true
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
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        embedded-controller@28 {
+            compatible = "lenovo,thinkpad-t14s-ec";
+            reg = <0x28>;
+            interrupts-extended = <&tlmm 66 IRQ_TYPE_LEVEL_LOW>;
+            wakeup-source;
+        };
+    };
+...

-- 
2.50.1


