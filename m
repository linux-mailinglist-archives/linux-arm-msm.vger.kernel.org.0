Return-Path: <linux-arm-msm+bounces-78157-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 60309BF6552
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 14:08:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E80DA501102
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 12:06:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A32823385BB;
	Tue, 21 Oct 2025 11:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K/KzvzyX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6863C333433;
	Tue, 21 Oct 2025 11:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761047588; cv=none; b=Z1rroYTVC+dkW5npH2EiaKBPwtBx+qPUuR4F1Ywm5cyB3UAOeu5pR8hBQbz0RPlqLp4qN7u4e65glf763XQvLHkJ4MFV3xKMYAY/CMfB0QblodziPXmSdwkF+Lsz2aIGazZMOfdu6PmtOg0XuqB7rKAzx6Eh2joinX5KN63sc5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761047588; c=relaxed/simple;
	bh=nmPuutRk5b32HClJ1JpF095nMvI4XlkPn7j8/55HKJc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nbKX/dt3QA3LrMwPJ6DLxLiCDzkMQJ5lSeuus1z64Yxz0thaYSsiqIxRw0fRPvDHSQu7zK3BNVzVMxeg58GpVIb8SKzaI7ijES3nLDFzsxbyQNhypEG8kjPs+yXPoWjEJ5Ej0795VjY26sL18IJV76xiO9h3UmHAF67UTaLGiww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K/KzvzyX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C5542C4CEF1;
	Tue, 21 Oct 2025 11:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761047587;
	bh=nmPuutRk5b32HClJ1JpF095nMvI4XlkPn7j8/55HKJc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=K/KzvzyXrFt23cqTkVCepl086eQIuJT1qEZxeB2hNjjDYDPFPYwPa+Lxb/eVyb6na
	 /8KqKP8aptYHnRfOryVuUx9UeruhsOqlVCIuXiswe6psMskIxERZ+5SBRboXHtWPNH
	 l/13a2t2h2CCkVGagsMqwNQ9UCdoXwMvkKPc9UyZPyuiz7Q6c+ctvMh5X6QPJG2QVh
	 skFlUaibpPj56E0QAHjxhUbA/6bv88DTeBr5Xw6fKAY6QcfJrnL2tE4vR0x5qDeI5K
	 fn2hRkwHpCgqfMRcyON6ZyJWxnb7PNjUCyuZEosWG2M/YRQoW+nG+R60EuO3vN44pK
	 oZZMgWIVoYSPA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B365CCCD184;
	Tue, 21 Oct 2025 11:53:07 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Tue, 21 Oct 2025 13:53:01 +0200
Subject: [PATCH v4 1/7] dt-bindings: panel: Add Samsung S6E3FC2X01 DDIC
 with panel
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251021-s6e3fc2x01-v4-1-5e3ee21c688a@ixit.cz>
References: <20251021-s6e3fc2x01-v4-0-5e3ee21c688a@ixit.cz>
In-Reply-To: <20251021-s6e3fc2x01-v4-0-5e3ee21c688a@ixit.cz>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3282; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=JdHXDnZheYdpaOz/cxbhwjp10b+1nHR1LCLgjicoVIo=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBo93QhIq2aimDTlf+pIpmwIXbpeLugsjz55OOsg
 L5y1AyFJoyJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaPd0IQAKCRBgAj/E00kg
 cuHuEACfs0x114XMyrWl5lWGBG4hlIY3gIUBhKzrzVmo6uQB3geQhc1D6s+UZUlyh3VJVYXOxUd
 MAd9UmyXuZ1c9amn7RoT91igzQCDM6es8HBIPdFopQKNxJAA9W5lIGFWWjrqcH/+UW8RP52gdBO
 0gV+4qTH3Nc+cxgeqvAqRGA05Fuz/TgwdJwpkv13Dri7MZ90ewcD7gUywwv0LViHbeSxOrTe9op
 8IITAi4+RvUcNDk3oUyf/VIgWpzr9k+w0e3/J8NrrNmDFBrIQGV1LEOQ2M3DS4gMDZtr9wJLide
 IR7yC0PnwBZOQEnPKsLWeJ1r03FHLPxsa2LrQh2dUdFQSYCME3PvgkkdEbdqvwl+36SwHOye6L5
 K8cFhQebeWSYdr3bbI4Lt5pKp8jwISmyCd68JqCuQwu262V2n5aqftCJzxhezSsFCU9uHMJSzTh
 ri7hnMgq0bRwOMiamHDpEk1BUOt75Hg0NA7xlEUW9i4wuFvVHLUZNLGG904kbmwuTyVj6uKIPFo
 Ssg8yiEQvaH5rLiatIoL2q1mi/Zpkdc+gJUf98woo72/NVzP8Gp1OVZuOnxavPbspI6ur0BQVvo
 Mbne+RtLLtOGge4ZCLB/ePpVFNUJuDK+WRvqa0O8pjDrIgvfWe7inRtoCyNAyX3/VP0JLISheJc
 7u/WeKFLu24fYQg==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

Basic description for S6E3FC2X01 DDIC with attached panel AMS641RW.

Samsung AMS641RW is 6.41 inch, 1080x2340 pixels, 19.5:9 ratio panel

panel-simple-dsi cannot be used because it's limited to one
power-supply, while we use three.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 .../bindings/display/panel/samsung,s6e3fc2x01.yaml | 81 ++++++++++++++++++++++
 MAINTAINERS                                        |  5 ++
 2 files changed, 86 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6e3fc2x01.yaml b/Documentation/devicetree/bindings/display/panel/samsung,s6e3fc2x01.yaml
new file mode 100644
index 0000000000000..d48354fb52ea0
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/samsung,s6e3fc2x01.yaml
@@ -0,0 +1,81 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/samsung,s6e3fc2x01.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung S6E3FC2X01 AMOLED DDIC
+
+description: The S6E3FC2X01 is display driver IC with connected panel.
+
+maintainers:
+  - David Heidelberg <david@ixit.cz>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+            # Samsung 6.41 inch, 1080x2340 pixels, 19.5:9 ratio
+          - samsung,s6e3fc2x01-ams641rw
+      - const: samsung,s6e3fc2x01
+
+  reg:
+    maxItems: 1
+
+  reset-gpios: true
+
+  port: true
+
+  vddio-supply:
+    description: VDD regulator
+
+  vci-supply:
+    description: VCI regulator
+
+  poc-supply:
+    description: POC regulator
+
+required:
+  - compatible
+  - reset-gpios
+  - vddio-supply
+  - vci-supply
+  - poc-supply
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "samsung,s6e3fc2x01-ams641rw", "samsung,s6e3fc2x01";
+            reg = <0>;
+
+            vddio-supply = <&vreg_l14a_1p88>;
+            vci-supply = <&s2dos05_buck1>;
+            poc-supply = <&s2dos05_ldo1>;
+
+            te-gpios = <&tlmm 10 GPIO_ACTIVE_HIGH>;
+            reset-gpios = <&tlmm 6 GPIO_ACTIVE_HIGH>;
+
+            pinctrl-0 = <&sde_dsi_active &sde_te_active_sleep>;
+            pinctrl-1 = <&sde_dsi_suspend &sde_te_active_sleep>;
+            pinctrl-names = "default", "sleep";
+
+            port {
+                panel_in: endpoint {
+                    remote-endpoint = <&mdss_dsi0_out>;
+                };
+            };
+        };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index be1861bd6f4e3..42be36b42c29b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8061,6 +8061,11 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/display/panel/samsung,s6d7aa0.yaml
 F:	drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
 
+DRM DRIVER FOR SAMSUNG S6E3FC2X01 DDIC
+M:	David Heidelberg <david@ixit.cz>
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/panel/samsung,s6e3fc2x01.yaml
+
 DRM DRIVER FOR SAMSUNG S6E3HA8 PANELS
 M:	Dzmitry Sankouski <dsankouski@gmail.com>
 S:	Maintained

-- 
2.51.0



