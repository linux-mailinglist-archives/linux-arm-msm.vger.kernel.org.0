Return-Path: <linux-arm-msm+bounces-72666-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB5AB49CEE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 00:36:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 54D5E1BC01F2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 22:37:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F0592ED16D;
	Mon,  8 Sep 2025 22:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f9I350wd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEAF22EB879;
	Mon,  8 Sep 2025 22:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757370960; cv=none; b=ij+wgIsZR42uJQ7LamP+GynU3hl3l7hdeGadFjJsRxwcZgDJNtmQ18g2AUOJJLIJroIwlkNj4K6FsKPMi2DxrgHLJzR6zsnGi79PJG2Y1AnTkrYqc9ppzMC6cAWdACA22euBiTGQ5yaSfB6ySGtqIBxJEWrof9CjsDTv3X+DjZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757370960; c=relaxed/simple;
	bh=jvo7GR+au7e8XXiUD6Y887uMomLI0ITYe2QUQ37dR0o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lLEYVkzxW6znopvY1+pVc5MqMagEvFvZK3tKNc3Jls93/BoNxyBdK7lNxqBLsChyjEDmnUPWSs3cpOMlK3u+wakXwWdYEo+GUBey2SisjnEm2FtHsAuY+NMXLewzFhk/un77pjndj+2HQ1Wt/chsNlxNUW7xf7+hzHGf1J8ixZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f9I350wd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73B20C4AF09;
	Mon,  8 Sep 2025 22:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757370959;
	bh=jvo7GR+au7e8XXiUD6Y887uMomLI0ITYe2QUQ37dR0o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=f9I350wd78Fr5gwaeyN/SzocdApzb/NdTcCfxJMlXAcdSW7o5FlftTp93MQQ2IXaz
	 3v5KL0/RhzUNrxsqOAoq6l02M4yjHWI71e9oFSRJ1c7+1eYpSJrhYwGrWs+TwJvvXU
	 RrxSIM4jnlgCLB2qSakmGBS/yyjVjqcoU29BUWkbvmyT8BAk9VSr5naucX5aFFU632
	 3czDUafpnbKceqZ2Qb9mgetTjiyBEJE0waVK19AGd4t+YrgGz0sTmOElhqzQ84P2d2
	 yF+8aqzgGH+2uFQNKUnh+/pbvhWBDv8EcOoa9DzKPd0uCeOJ6AxKYILjcB/5sV5R31
	 L7GO1pOiHbE0w==
Received: by venus (Postfix, from userid 1000)
	id 90F43180644; Tue, 09 Sep 2025 00:35:57 +0200 (CEST)
From: Sebastian Reichel <sre@kernel.org>
Date: Tue, 09 Sep 2025 00:35:50 +0200
Subject: [PATCH v4 1/3] dt-bindings: platform: Add Lenovo Thinkpad T14s EC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-thinkpad-t14s-ec-v4-1-caf6159daaee@collabora.com>
References: <20250909-thinkpad-t14s-ec-v4-0-caf6159daaee@collabora.com>
In-Reply-To: <20250909-thinkpad-t14s-ec-v4-0-caf6159daaee@collabora.com>
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
 linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2093;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=jvo7GR+au7e8XXiUD6Y887uMomLI0ITYe2QUQ37dR0o=;
 b=owEBbQKS/ZANAwAKAdju1/PIO/qaAcsmYgBov1pMir9Op9qRrz8Bi1rKFPqNJBrjqtfkNJRuK
 howxO7fHPuJAjMEAAEKAB0WIQTvZg0HRj+Lcmp5VBPY7tfzyDv6mgUCaL9aTAAKCRDY7tfzyDv6
 mrAKD/9nqPRb+FwFSfgTgnv/zlhAIuVQ6kBVtvsLKD5GcKLHFbV4hk6wT6WWzDhX5HJXTa8cDnw
 fyTnZeCIH/Y8ltCoVZTEwLz44fy2wqK176WgcU9eTRcwH/qbzja9G0TkvO5o6wP/paDlZBQCFq0
 NnOtixbFzSVoxlV0X0rhnqew/OtXWJ/NRjvyoWLB4SwkpjA64u/Kete59mITxjsRZ0UDRunVMKk
 p3vOstsc4xA1IN5c3o0QvCjW/whbXVY6lyBmCcZTFbXpaBM5OEhishDEfdQPFV8Dkx8PjE5AzZl
 kfg/Wg7t7VH7dazs3eXoTHMKm73cb6bo8PfzviBt7A3HUwtATOKAda+YyuHECRmMAFKiTaSN8kc
 1DT7Ebi1gVolYTH6hi7S/SCdTaMaZyMMrvDQnH9kfe5XSkV2UwhVz3oPt6wGAskp2fGyKleF2lk
 jDDp4OqkTcJLWLCEGAcFwNYV5jcPPfa+s10af3LPehWTopWab5jvc4btm+B7mjtFR+EuRDfEMwe
 gKyfaXHKNhwtwSp2ueBgzV7ZelCBRAoF6DzBKlb8KO2eM7X1bnwnChQS/wJGIFmBRmUBtLsSUP6
 oLE4OQ4PlWcLDKltq25BXekF5kmUguD6jzyLtlKOQj2MAD11b/T4++bMMdJf2YlGtK7qLpmsfTk
 +NgnPvgq4Om3ZaQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Add binding for the EC found in the Thinkpad T14s Gen6 Snapdragon,
which is based on the Qualcomm X1 Elite. Some of the system LEDs
and extra keys are only accessible via the EC.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
2.51.0


