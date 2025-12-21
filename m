Return-Path: <linux-arm-msm+bounces-86073-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B71A0CD46ED
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 00:34:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0AA803020376
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Dec 2025 23:32:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66DA5287259;
	Sun, 21 Dec 2025 23:32:28 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay03.th.seeweb.it (relay03.th.seeweb.it [5.144.164.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD594280033
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Dec 2025 23:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.144.164.164
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766359948; cv=none; b=jcvuDmP8krlzj1XFrknNkiDAYXGdJDAc3CyveTqjFUCWcTFFrYV1xEd+7LgV3fFGWa9yv2X5y5403l2T0mJllgxRDDtM9raXiJv4q5jKYjlS/tjlZHlrWIyxfmFay/609BRDXfuMQ1gVklm7vt4dGV3OqVrImLCe6tCmswyW5Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766359948; c=relaxed/simple;
	bh=nvkr5z8Z55u6fmmyLhYwW4pSBb8DLE4Wh0AYWIsyhXo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VH+g+WxbLphoRJkj2Ch6WrJk7ZUG0DJ5e7xpdrfH0Yx0R70wZSi1QEmYOVxqTjzg0cxDWYxjodbp7LQVgoDQJVmpD+34nyBkcboBbnd9HtpXnc+eGH7RLj1rl3rFLccsLFH13opRNg9bBZHh7XthYT3Yl2rqj7lQkhxcJ4AiB8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org; spf=pass smtp.mailfrom=somainline.org; arc=none smtp.client-ip=5.144.164.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=somainline.org
Received: from Marijn-Arch-PC.localdomain (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 551671F8DE;
	Mon, 22 Dec 2025 00:32:17 +0100 (CET)
From: Marijn Suijten <marijn.suijten@somainline.org>
Date: Mon, 22 Dec 2025 00:32:10 +0100
Subject: [PATCH v2 04/11] dt-bindings: display: panel: Describe Samsung
 SOFEF01-M DDIC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-drm-panels-sony-v2-4-82a87465d163@somainline.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4484;
 i=marijn.suijten@somainline.org; h=from:subject:message-id;
 bh=nvkr5z8Z55u6fmmyLhYwW4pSBb8DLE4Wh0AYWIsyhXo=;
 b=owEBbQKS/ZANAwAKAfFi0jHH5IZ2AcsmYgBpSIN7SIPmbL0hP9TadE2haOZSVX7GCP15AG4YR
 SO5hJZ0tbGJAjMEAAEKAB0WIQROiwG5pb6la1/WZxbxYtIxx+SGdgUCaUiDewAKCRDxYtIxx+SG
 djiTEACSoEAVhRCMT+g4BF1qeU/yQsfCshPwoeY/6gvI9SsMTmk07JuQOZL2N0lv6V8DReWM3G7
 bhNhrPs/QRfItDxiD8yXeWq7Ncu+yXAgR/EdGowhKlkzyi2ZjyNBh6BYgmcCBxmykq096lrtc/P
 ZEaGe5LEJ/ASbn+kcd/CNyZYhxByhSzjE9isqYQRzrHwCGE0UvgsWzq1nhOgE0iHDhA0KsKU4x+
 oyy7kUr2RWOV+gVp2S0Z1+GPv+rnOWncv2eoBrRUZ0UOJdBZTLYe2YPFgCzCTJtDNykjASw0SNc
 jS7X2wJG7yBjwPwihGpPnle0CiDNLtJB743RyiyEdI+19fP6D+RjqjOv9f1uRtS8p8A8vD2jB2s
 CkqfjgFYZjgOAEkKhloRz+Z6Y15uccI3CkYHi8FZf14mgKp/06RunfsdP9rl0xd1mAG1CAPMGzL
 pmFr4pPSz8VofXh9gJDuY7CxI71YFIk1ibRIjYw2+3sNNQr08RfrQ+WNnfU1bwgGkLw28mTcdYm
 5CDZV9QbQfH+C/roSEBJJaI11uoY2ZtkOx+6lEVWV6T/nGts35xt2tWlcYJ9e6Z0N4z+/P0Cmy9
 HxSXsTJpl2ihM3TkNELFaUxBJdSVbA8r2khVRE/QxOOEwy4M63ahYoXYcTFdCW67D9qyYSgDQGo
 Mf/5KjyXRtMvjWg==
X-Developer-Key: i=marijn.suijten@somainline.org; a=openpgp;
 fpr=4E8B01B9A5BEA56B5FD66716F162D231C7E48676

Document the Samsung SOFEF01-M Display-Driver-IC and 1080x2520@60Hz
command-mode DSI panels found in many Sony phones:
- Sony Xperia 5 (kumano bahamut): amb609tc01
- Sony Xperia 10 II (seine pdx201): ams597ut01
- Sony Xperia 10 III (lena pdx213): ams597ut04
- Sony Xperia 10 IV (murray pdx225): ams597ut05
- Sony Xperia 10 V (zambezi pdx235): ams605dk01
- Sony Xperia 10 VI (columbia pdx246): ams605dk01

Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
---
 .../bindings/display/panel/samsung,sofef01-m.yaml  | 120 +++++++++++++++++++++
 MAINTAINERS                                        |   5 +
 2 files changed, 125 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/samsung,sofef01-m.yaml b/Documentation/devicetree/bindings/display/panel/samsung,sofef01-m.yaml
new file mode 100644
index 000000000000..a8ff5223677c
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/samsung,sofef01-m.yaml
@@ -0,0 +1,120 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/samsung,sofef01-m.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung SOFEF01-M DDI for 1080x2520@60Hz 6.0"/6.1" OLED DSI panels
+
+maintainers:
+  - Marijn Suijten <marijn.suijten@somainline.org>
+
+description: |
+  Samsung SOFEF01-M Display-Driver-IC found in multiple Sony smartphones, paired with
+  the following panel:
+   - Sony Xperia 5 (kumano bahamut): amb609tc01
+   - Sony Xperia 10 II (seine pdx201): ams597ut01
+   - Sony Xperia 10 III (lena pdx213): ams597ut04
+   - Sony Xperia 10 IV (murray pdx225): ams597ut05
+   - Sony Xperia 10 V (zambezi pdx235): ams605dk01
+   - Sony Xperia 10 VI (columbia pdx246): ams605dk01
+
+  The assembly features a Samsung touchscreen compatible with
+  samsung,s6sy761.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+  - if:
+      properties:
+        compatible:
+          const: samsung,sofef01-m-amb609tc01
+    then:
+      properties:
+        vci-supply:
+          description: DisplayIC Operation supply (3.0V)
+
+      required:
+        - vci-supply
+
+    else:
+      properties:
+        vci-supply: false
+
+properties:
+  compatible:
+    enum:
+      - samsung,sofef01-m-amb609tc01 # 6.1"
+      - samsung,sofef01-m-ams597ut01 # 6.0"
+      - samsung,sofef01-m-ams597ut04 # 6.0"
+      - samsung,sofef01-m-ams597ut05 # 6.0"
+      - samsung,sofef01-m-ams605dk01 # 6.1"
+
+  port: true
+
+  reg:
+    maxItems: 1
+    description: DSI virtual channel
+
+  reset-gpios: true
+
+  vddio-supply:
+    description: I/O voltage supply (1.8V)
+
+required:
+  - compatible
+  - port
+  - reg
+  - reset-gpios
+  - vddio-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        panel@0 {
+            compatible = "samsung,sofef01-m-amb609tc01";
+            reg = <0>;
+
+            reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
+
+            vci-supply = <&vreg_l17a_3p0>;
+            vddio-supply = <&vreg_l14a_1p8>;
+
+            port {
+                endpoint {
+                    remote-endpoint = <&dsi0_out>;
+                };
+            };
+        };
+    };
+
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        panel@0 {
+            compatible = "samsung,sofef01-m-ams597ut01";
+            reg = <0>;
+
+            reset-gpios = <&tlmm 90 GPIO_ACTIVE_LOW>;
+
+            vddio-supply = <&pm6125_l12>;
+
+            port {
+                endpoint {
+                    remote-endpoint = <&dsi0_out>;
+                };
+            };
+        };
+    };
+
+...
+
diff --git a/MAINTAINERS b/MAINTAINERS
index fcd99a8f9c71..93468dde9df2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8194,6 +8194,11 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/display/panel/samsung,sofef00.yaml
 F:	drivers/gpu/drm/panel/panel-samsung-sofef00.c
 
+DRM DRIVER FOR SAMSUNG SOFEF01 DDIC
+M:	Marijn Suijten <marijn.suijten@somainline.org>
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/panel/samsung,sofef01-m.yaml
+
 DRM DRIVER FOR SHARP MEMORY LCD
 M:	Alex Lanzano <lanzano.alex@gmail.com>
 S:	Maintained

-- 
2.52.0


