Return-Path: <linux-arm-msm+bounces-86075-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A98CD46FC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 00:34:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0701E30303AE
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Dec 2025 23:32:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11483284694;
	Sun, 21 Dec 2025 23:32:31 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it [5.144.164.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A32D52868AD;
	Sun, 21 Dec 2025 23:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.144.164.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766359950; cv=none; b=NVcqLQmmuvhKevQ+FHxMKifuJuG1DluE65wU1163BOp+xt1Q86ERAoXxRlFYgNoLK+Z29wXf/CMmE2U+aNsVeU5l2FldHwLd2nz7bLbASfQ1esVLaL+b3gu1J15+FBEnemXfaD36J0rkVxjD4OqHI4E2GPef9cRC/lB2PeVVPTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766359950; c=relaxed/simple;
	bh=CbIn+cm0JRMqqFJNAlATtGHxjleUrtur+gVF6OQUxsM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h3hqNYtWEfkum0LAYXXlEy7vnAaNACAjJh8/iuMcbhIQx3d8Iki0KgX9Sl1o46LY19XcC7fTvp5RVWDRQv5b8YlMVMPiva2FhRTMOl8FgYgyPFpkJa2FDYD3Z2hF5atdRj/J3CNXeGDn7gfQnSBgmcyVKO9JaetBfXQq4Q+D7Io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org; spf=pass smtp.mailfrom=somainline.org; arc=none smtp.client-ip=5.144.164.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=somainline.org
Received: from Marijn-Arch-PC.localdomain (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r1.th.seeweb.it (Postfix) with ESMTPSA id EA27C1F8F8;
	Mon, 22 Dec 2025 00:32:24 +0100 (CET)
From: Marijn Suijten <marijn.suijten@somainline.org>
Date: Mon, 22 Dec 2025 00:32:16 +0100
Subject: [PATCH v2 10/11] dt-bindings: display: panel: Describe Samsung
 ANA6707 DDIC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-drm-panels-sony-v2-10-82a87465d163@somainline.org>
References: <20251222-drm-panels-sony-v2-0-82a87465d163@somainline.org>
In-Reply-To: <20251222-drm-panels-sony-v2-0-82a87465d163@somainline.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Simona Vetter <simona@ffwll.ch>, Casey Connolly <casey.connolly@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: ~postmarketos/upstreaming@lists.sr.ht, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>, 
 Martin Botka <martin.botka@somainline.org>, 
 Jami Kettunen <jami.kettunen@somainline.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3646;
 i=marijn.suijten@somainline.org; h=from:subject:message-id;
 bh=CbIn+cm0JRMqqFJNAlATtGHxjleUrtur+gVF6OQUxsM=;
 b=owEBbQKS/ZANAwAKAfFi0jHH5IZ2AcsmYgBpSIN80QfbqS8RA7c2SJ16MLHnksyewvByR1pfI
 9oaN4gXNH+JAjMEAAEKAB0WIQROiwG5pb6la1/WZxbxYtIxx+SGdgUCaUiDfAAKCRDxYtIxx+SG
 dlCUD/96gKO58Sj7wdZWzXIlpTkqhJX1e0Sdgmn24hzG3pJS8TGtyQKSHwvwbGWaKNGrH0aNaz5
 2LAgEdMuaRtngdDxltWc4iG1lWzcFUGoXlhSDj1LziHMkGmffMQRMG1ceRf+Dl+kiVljkILOe1M
 rMaybuUtAWU1niEP24998yxt5TamOs3o9eWSnbuCliwHz2SRWWOlQv+8PbAoEz1joDA7Ou6LF6K
 Nrc2aJ8gUGNCzMrq3XYrY1KlAB2M5I1FQzF87T5pypNnRUgTlEfv2BmeGNaDecYhbo/8+95MW+x
 gr7elhMCMT+J63xfJGfAlMxv8jSzXBRNGbUEXNqBoi+ELmwE02oauQA1oPyLbnKE1s1GtWWTMe4
 NLrcXb4RQzUhHchYSj3ooFdy1dfc3k8+VB43HCCyR8oWeMWcQetkWNZnXNOcBu6MEw+VUdfqmaa
 Df3z39wHGOZC4J+8xLHzQjt05RNZRM9EkDpIB/AJWtqlz0gfkVgSsTYFFguwmUiD+MFXH0yp7l0
 cdKNu4VNPlkwC86yvbDJxQWMcX0EFrU7OdHuNYsBCHsnG9E39mAaeIMr5+RQHiv+fv0kWmAAUC4
 x0gK0FiNOX1qa9Or9PlyN5QFETD3hfpv5796MAQzFBuk1c90p05vKK0seDgmKpp4epUT5S5IoOW
 kFAvCzDs36vkkEw==
X-Developer-Key: i=marijn.suijten@somainline.org; a=openpgp;
 fpr=4E8B01B9A5BEA56B5FD66716F162D231C7E48676

The ANA6707 Display-Driver-IC is paired with the amb650yl01 panel in the
Sony Xperia 1 III, Sony Xperia 1 IV and Sony Xperia V smartphones.  It
uses Display Stream Compression 1.1 and requires dual DSI interfaces to
satisfy the bandwidth requirements to run at 1644x3840 at 120Hz.

Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
---
 .../bindings/display/panel/samsung,ana6707.yaml    | 91 ++++++++++++++++++++++
 MAINTAINERS                                        |  5 ++
 2 files changed, 96 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/samsung,ana6707.yaml b/Documentation/devicetree/bindings/display/panel/samsung,ana6707.yaml
new file mode 100644
index 000000000000..f627e10ca271
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/samsung,ana6707.yaml
@@ -0,0 +1,91 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/samsung,ana6707.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung ANA6707 DDI for 1644x3840@120Hz 6.5" OLED DSI panels
+
+maintainers:
+  - Marijn Suijten <marijn.suijten@somainline.org>
+
+description: |
+  Samsung ANA6707 Display-Driver-IC found in the Sony Xperia 1 III, Sony Xperia
+  1 IV and Sony Xperia 1 V smartphones, paired with the amb650yl01 panel.  It
+  is always programmed with Display Stream Compression 1.1 enabled, and requires
+  two DSI interfaces.
+
+  The assembly features a Samsung touchscreen compatible with
+  samsung,s6sy761.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: samsung,ana6707-amb650yl01
+
+  port: true
+
+  reg:
+    maxItems: 1
+    description: DSI virtual channel
+
+  reset-gpios: true
+
+  vci-supply:
+    description: DriverIC Operation supply (3.0V)
+
+  vddio-supply:
+    description: I/O voltage supply (1.8V)
+
+required:
+  - compatible
+  - port
+  - reg
+  - reset-gpios
+  - vci-supply
+  - vddio-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi0 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        panel@0 {
+            compatible = "samsung,ana6707-amb650yl01";
+            reg = <0>;
+
+            reset-gpios = <&tlmm 24 GPIO_ACTIVE_LOW>;
+
+            vci-supply = <&pm8350c_l13>;
+            vddio-supply = <&pm8350c_l12>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+
+                    panel_in_0: endpoint {
+                        remote-endpoint = <&mdss_dsi0_out>;
+                    };
+                };
+                port@1 {
+                    reg = <1>;
+
+                    panel_in_1: endpoint {
+                        remote-endpoint = <&mdss_dsi1_out>;
+                    };
+                };
+            };
+        };
+    };
+
+...
+
diff --git a/MAINTAINERS b/MAINTAINERS
index 37c5ce4b3ba5..148b1f66c98b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8146,6 +8146,11 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/display/panel/raydium,rm67191.yaml
 F:	drivers/gpu/drm/panel/panel-raydium-rm67191.c
 
+DRM DRIVER FOR SAMSUNG ANA6707 DDIC
+M:	Marijn Suijten <marijn.suijten@somainline.org>
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/panel/samsung,ana6707.yaml
+
 DRM DRIVER FOR SAMSUNG DB7430 PANELS
 M:	Linus Walleij <linusw@kernel.org>
 S:	Maintained

-- 
2.52.0


