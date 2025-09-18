Return-Path: <linux-arm-msm+bounces-74109-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 970F9B871B6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 23:23:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0D8FCB63137
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 21:21:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED7352FB967;
	Thu, 18 Sep 2025 21:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UfDSGT9M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1AA62E0905;
	Thu, 18 Sep 2025 21:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758230457; cv=none; b=uny50QiJrxYUjqyiEFUwQjWO4++Diuv37pxlVF0l4OJjb0Uv+XSPMqu/QXgYQr1yDXaQbBggotvEWZgu3PUDidQYixuMslLhVvyx5wu5LntvYjEUTS2uM0qJXD9O1+lE8+GnRX/nOW/9G9ZAlGgBCestnbVKoRVMcpNNX43IMpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758230457; c=relaxed/simple;
	bh=jvo7GR+au7e8XXiUD6Y887uMomLI0ITYe2QUQ37dR0o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MwIodkciEvUkGMaOWkoaFeVNJG936da4VzaDdqP5mI1fipxnkShNoBsn0XmORD3UVNtUvCSi19DaFFU9SG6dR8FeX0QtEBWHDvDkmEh9kOemhI9NHwMdQ8SbLWVehE6nmzUaPGP4M5Fvqn8410rGA8hrIGu3sfkFjSJ80YRKwN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UfDSGT9M; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0158C4AF0B;
	Thu, 18 Sep 2025 21:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758230457;
	bh=jvo7GR+au7e8XXiUD6Y887uMomLI0ITYe2QUQ37dR0o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=UfDSGT9MS25By2l+4BHVNoFTv6Yp7BemNbKbhBXxp+sK8iNSDni2+Vna7t2N3k8h3
	 IkWaQ6U2NV3LnNMXDwfBS20HNapWt0lO0iC5UiSjwU1Hi4U/plbye7K3wIlqnT7e+b
	 fIqvYd+VCjZ7F8fnQcDNUkJiY4qvC3nbrQb+IhyP1w2PvlnBkx7zp/+y5xgJ6UkOIY
	 0B1k3cqXTZLSqT33jP0ddvhw56RBoMKo+UfGXAe4dJZI3IitpQcj24Zw8p23b3hwoP
	 +R2fCbEQ7p4XDS8gIqp31s+IpLUzYQFoKwBGNzrBlraEWlANXmvxE/cCagZdGvLhJ2
	 M+WGfGRtXma+g==
Received: by venus (Postfix, from userid 1000)
	id 27BBD180517; Thu, 18 Sep 2025 23:20:50 +0200 (CEST)
From: Sebastian Reichel <sre@kernel.org>
Date: Thu, 18 Sep 2025 23:20:26 +0200
Subject: [PATCH v5 1/3] dt-bindings: platform: Add Lenovo Thinkpad T14s EC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250918-thinkpad-t14s-ec-v5-1-ac0bc6382c5c@collabora.com>
References: <20250918-thinkpad-t14s-ec-v5-0-ac0bc6382c5c@collabora.com>
In-Reply-To: <20250918-thinkpad-t14s-ec-v5-0-ac0bc6382c5c@collabora.com>
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
 b=owEBbQKS/ZANAwAKAdju1/PIO/qaAcsmYgBozHexaz8QqjPffUjsTNBJn39mAA8pt2632OZGQ
 T+IUjymzy+JAjMEAAEKAB0WIQTvZg0HRj+Lcmp5VBPY7tfzyDv6mgUCaMx3sQAKCRDY7tfzyDv6
 mihqD/wMQixzNzHk9GEP6s62H16iS535mnMWyLiw2s1BUufWYi7VcHyK5bBIqJZi5/M9H7Qkvw+
 LKXwykjcjDMrlXCGcZZTyz2eom6H4LX6JYBXzUci/FApnjuKmaP15LnViPqG7pVD8sBp/EDFa0k
 WSqV6c3ontg6x7IVHvFXUzWB8KguZ4otLcK7MOzpvwjfSSI2qCqFjc9V/+5JxnDPtX1YDXDpLYw
 QMLEHewhs1Bs9nMeoYitVn41EaGa8LiIyMbLazc09hCd2OftvclVYws6b+mHgTTpBnwBx5ESYEJ
 LvcH1ocx9VXG8M6Ed/2mMMkURzzZCjNSJnvGKP0csAMuBQ/tslRTw5bVugGoL0fdCbw641fDh/A
 OKFHttzOREwfMKXfm4aK6JsqOmMfVIcTB6oVtz1tiK3eF2tbLdK1uXOWL0oUQgn4FkKh2lO5XVH
 N9d/fL5rbDmFd1RRGgL7FWWUFqMbHHBOqwPdVAxw4q8Bg8LrD5peQIO53nPLfQTWNvfp5qhDXNw
 DJv9l/rWj+cE2kQ4QBCm703m/lVIF+ZllnRdjhvM1/jvLSy3tcKyeiMGiCiWIl0PCVe4yKWN2s1
 JhbW8jKHMbN2xW1Osay/qtUkXHOtuAeK0dTGpctyctyCsfLKrrgHJ+VKNqcwKLO3aS4xDG7Seuk
 THNVrTEoC+oRo4g==
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


