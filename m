Return-Path: <linux-arm-msm+bounces-75033-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C23CB9E38B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 11:13:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 81A931BC43E1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 09:13:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E87A2877CB;
	Thu, 25 Sep 2025 09:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lp+BJrgW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA5727EC7C;
	Thu, 25 Sep 2025 09:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758791572; cv=none; b=gysfOiDitYA2o9jlmzOTfkOemA9GSNU2GOzjsqt87jmn3/WpePSynXgqyH2wtGZwRDB+9U6U1nutjwuQ9tO8FLljCyJOGlfnWOcWH4QxyqlCPduQ/TUrh15AFSeVH3f9sNQMOpAEtT9FQPN24qADDumDjo82Oud9tRTqscZfiQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758791572; c=relaxed/simple;
	bh=iqyBt01wMYPdDbm9GFK5WA0CW0KDWj88bPFEEPkrLbc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Yp7AAOUsWh0ZJBTZwI9uRHwvIhFQABM9ZUt7yP7KusDCuHaGOJ0orcyrWohXCKkyD4yO4QLWG2likl8yf7O2e2C22wCRmPznsRg7Pd8x0B5D9MiUtWfOjWjeeaRspz5zzOrP2e3VJ3BEgAXh0Un0Lb4buolGBICgu5pxSoJx1AY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lp+BJrgW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7D85FC4CEF4;
	Thu, 25 Sep 2025 09:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758791571;
	bh=iqyBt01wMYPdDbm9GFK5WA0CW0KDWj88bPFEEPkrLbc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Lp+BJrgW8l7GjTuaL3OaLhAspXg6ILOHqf4yDFGCGxBXmKmp2Mham3ijKznQnsMDk
	 K2ajWaaPC38uRneLxU/FAqSGgqgK2/wCJXzJ96plnrHfehWv8CwExjEHSbAYBULVVo
	 0vhBZs+M3als48JXkz9olfKMQcHXQj/V7KXmTmOM+Y48yruKfy9AO3xOliHFjcXnm9
	 262mJy+dWtCO5TrSHDtNtN59pVjxIdBdOZATmZkDEXuw/ACyRqt0wv/CVn4LSlFBD7
	 ceL1GHKAN8LJ5s8M3o+y4mtXGA7j8CwX2w7AndlsFJGP9yEA+DVD7l+3QCGCtv0aJk
	 0VV33PXsgC5wg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C134CAC5B0;
	Thu, 25 Sep 2025 09:12:51 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 25 Sep 2025 11:12:47 +0200
Subject: [PATCH 1/8] dt-bindings: panel: Add Samsung S6E3FC2X01 DDIC with
 panel
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-s6e3fc2x01-v1-1-9293016768f7@ixit.cz>
References: <20250925-s6e3fc2x01-v1-0-9293016768f7@ixit.cz>
In-Reply-To: <20250925-s6e3fc2x01-v1-0-9293016768f7@ixit.cz>
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
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3067; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=by2IGpA/fsa5PiFT1mv+v/aflwQh7WSaQNPfojdHElg=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBo1QeR+mlmL+bnq7ElGz14J3/TRkaprI+netvoi
 23C/zWCjC+JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaNUHkQAKCRBgAj/E00kg
 csaaEACxthclv0uC7nHPbJTuuDMbxo477Q3pBNgq9UeKlfJxnifMjV/QBn8c17OD/6TmRSrWeVa
 lVG77qDcbBhsANHaC3lIBkNzUdFv/0PzefnZy6sJyFIHYrY0tPikpRJsqN0M8y82Y8UG+sx9XRk
 oBklVH2ltuELmsTd3AI2rALJ9yuB8qKxENSZ2gCPujn4RNtMI96bJPK9oWXeGut0hbD1PP/s/UM
 2iPaP3gTa9tBQK5pl08kkF+chYq0JymV/Gtl4itPPJQQawoYBdmelP7/DF0mxad+nkXVNS9Qu0E
 JMMTyGIaWwCyEMm7Yoc0ycuigimwLjjlwbjd5diKE52cFLAfFcxRRwLGXUMDRl9dyZ5G0uDZMzA
 ohxWYZedBZGldRUSv69o8V17CqeiKDitz5dbQc7Q/Eg2noODzwlFm1VVbFcRfjjaT+mUwLDtkRI
 sz4ttTa0szO1CXMNojAPCuxyWquLpV+BM93BwAJq87tifjT5Y5O4WTfdinqfHrvzsYtDopyXmdM
 3XON2wONMdckCNM6bn3rBPhdjhQSG0Yf1n+FqzAyEUH8a/sJcA79HRPXEze5Hl9lStf8REhNyMl
 DX5YUX2GP27zgEVS8ixKsCW/iZ3uyptjwGMCazCj3UAiijgL63m+qWzLRq4iX5SsGWeE7pt3Nmu
 T+LNSDT3s0+ySoA==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

Basic description for S6E3FC2X01 DDIC with attached panel AMS641RW.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 .../bindings/display/panel/samsung,s6e3fc2x01.yaml | 77 ++++++++++++++++++++++
 MAINTAINERS                                        |  5 ++
 2 files changed, 82 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6e3fc2x01.yaml b/Documentation/devicetree/bindings/display/panel/samsung,s6e3fc2x01.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..489b6b52effe1e627ff5ef5891729c175ad71685
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/samsung,s6e3fc2x01.yaml
@@ -0,0 +1,77 @@
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
index 9955f2a87f292000fae6d5a71ae7744ceadfed05..961f472e52039932e3208f7c0eb9aa0412b7f44b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8054,6 +8054,11 @@ S:	Maintained
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



