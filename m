Return-Path: <linux-arm-msm+bounces-76419-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D625DBC55EA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 16:05:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 15B3D4F7C3E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 14:05:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 147D728BAB1;
	Wed,  8 Oct 2025 14:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VCiVyUMD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D42DB288C08;
	Wed,  8 Oct 2025 14:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759932331; cv=none; b=IDj79Sz9YmtBtMGj+M06w/Hy5eDG8zzz7vEzwvo67WxSZWkEmcVRGtDSUdRMa4ovzBHsGygrJQZZiDLvUmeLoqTLyQOy3ZXWqgm0A05YjctIPvR4WpUvRy+wjc8cwxPUwg6s9TsSzVv7XMeY0Wi819OZ0B5OZVeitgRaJKCJabE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759932331; c=relaxed/simple;
	bh=GEXR1XfdqmLYEJoVgBwwHFkz7Pt3nRzdWGKwH0JJubI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=imxtdPjXuI+XNU6YcHdxcb93gvKwINOThH6/oOms0T7gWOEtgaKTC4W1LkN/vC/6VeeIvZCcpgUz9dUQm9AVaBnNM1dTED1/ihExM1/ummRsZfQBOYmy+84Pv13uNFwaDYlowBhtHn+0Gl6eubflBVRtT7/W6IakeS0XhkZCxJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VCiVyUMD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A5372C4CEF5;
	Wed,  8 Oct 2025 14:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759932330;
	bh=GEXR1XfdqmLYEJoVgBwwHFkz7Pt3nRzdWGKwH0JJubI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=VCiVyUMDD03T5AE4NpFh4ySJrgabNMvs5hVqWtAEhw3R4dzbS3D3lLWjaQKX51nKm
	 5QNM8H2ySa8qIrr0bU2Q8BKQZuk5Tnfcd+DoTaB3oyut7S7cPix3PyvJFr7dgFMa3y
	 ObqlsEkOvPMeVll0R98a57QFW7abzKEvxAbzwHt64/foUizK+uJ+ut3p2DUryjwfYh
	 0Ull267zgtA0s4jQEAIrBBiuv8FiKjn7d/218o9ZNGoO6NoQ8UHYLafJ2PX0V97DEz
	 ZjSmjNFdnCOqNO3vhv2ggjUBKI9s6fj8I6eiLhyHhy7tay8jh4Ajg6gK09SwSyl3P5
	 wxbJsEBwuLXEg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B097CCA472;
	Wed,  8 Oct 2025 14:05:30 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Wed, 08 Oct 2025 16:05:28 +0200
Subject: [PATCH v2 1/7] dt-bindings: panel: Add Samsung S6E3FC2X01 DDIC
 with panel
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251008-s6e3fc2x01-v2-1-21eca1d5c289@ixit.cz>
References: <20251008-s6e3fc2x01-v2-0-21eca1d5c289@ixit.cz>
In-Reply-To: <20251008-s6e3fc2x01-v2-0-21eca1d5c289@ixit.cz>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Casey Connolly <casey.connolly@linaro.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3107; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=xWF4FDYS7GP/FAlELSFa0EcKNbyCn24jCri9mH8aD6Y=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBo5m+odXVxAWi8EqMDNuDXAphuiSL0+LBJfVzI/
 Or4Mght20qJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaOZvqAAKCRBgAj/E00kg
 cjRRD/4rtuPDWwyF0ycU6w5MGgohm44VbNgvutUSHo30cznOIC/hYOzvA//dx9E8pflG4L9qzA6
 VW6fbhPccyYWWrmEvXEtUiETPZovzlhYXQ0KV/US+m6y8kt197ZmlL8K6TbCm4utuwHcoBEXeWE
 sh3ULfy8tDY9SkNz8htrJEMF0G6VXKJZDSqgnMQl5d7rgP+bsuCd1jnVR4kqghRabYchUhL1X6b
 b4Y8LwINmcBkxY7XkKTc+OrdFg1lF0iOk5WEJuKuZj4wot8O6lfgVFMnT01OW+sLaQvNG8mVxBc
 8bFfc1kITYouMZBt9qN4kiBjqZhWH2S3W2BySlKnIHfn9Rudo0s4cggEBvAmYRAYZTjD2NqlX0Q
 zKghdIjelUWp9eh+vAxMbtc6NAjlyMbpuemwdDorhjhKPZXXxm83zoHIM0lxeZPtyaqq3cxG/33
 1KBDG1LdJziLYn3+czlDq8ztyThNaU0cCpgb2Vz8whcEgpHGs3fCC45BSTt3wmkpov4swruDPep
 41oEmRU2akRRIan/sSYi8kbe/E1a8T1tBn1YaLvVfqz6QzI6LkQ0qOK9fYdEDZ4dHwGm0fOjkEG
 ouhwQe4kkwGgOo2Y1JWPw2fxIhqAbm7teJS5/E4mMwvLSX0DE+WIAzEdxFgRSjds7ONA+CCUWeB
 lmw0YEyOS+Cehaw==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

Basic description for S6E3FC2X01 DDIC with attached panel AMS641RW.

Samsung AMS641RW is 6.41 inch, 1080x2340 pixels, 19.5:9 ratio panel

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 .../bindings/display/panel/samsung,s6e3fc2x01.yaml | 78 ++++++++++++++++++++++
 MAINTAINERS                                        |  5 ++
 2 files changed, 83 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6e3fc2x01.yaml b/Documentation/devicetree/bindings/display/panel/samsung,s6e3fc2x01.yaml
new file mode 100644
index 0000000000000..e74a96321f4d5
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/samsung,s6e3fc2x01.yaml
@@ -0,0 +1,78 @@
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
+    # Samsung 6.41 inch, 1080x2340 pixels, 19.5:9 ratio (~402 ppi density)
+    const: samsung,s6e3fc2x01-ams641rw
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
+            compatible = "samsung,s6e3fc2x01-ams641rw";
+            reg = <0>;
+
+            vddio-supply = <&vreg_l14a_1p88>;
+            vci-supply = <&s2dos05_buck1>;
+            poc-supply = <&s2dos05_ldo1>;
+
+            te-gpios = <&tlmm 10 GPIO_ACTIVE_HIGH>;
+            reset-gpios = <&tlmm 6 GPIO_ACTIVE_HIGH>;
+
+            pinctrl-names = "default", "sleep";
+            pinctrl-0 = <&sde_dsi_active &sde_te_active_sleep>;
+            pinctrl-1 = <&sde_dsi_suspend &sde_te_active_sleep>;
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
index 47fbc5e06808f..e5c5a19f6d710 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8052,6 +8052,11 @@ S:	Maintained
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



