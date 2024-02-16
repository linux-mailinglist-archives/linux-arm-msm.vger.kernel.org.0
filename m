Return-Path: <linux-arm-msm+bounces-11308-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1AF8579FF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Feb 2024 11:11:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 464B4282A40
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Feb 2024 10:11:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A3611CD24;
	Fri, 16 Feb 2024 10:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="TQvFmFoj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF821CD16
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Feb 2024 10:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708078256; cv=none; b=WX9Q6MqtvPN91QO8YbBhTf5cT/Mc4xwqwa2LjQ2Kw4BShA1tMXFJhpXGQbzhPLN/WQynC0OhRCcy/FH276d8Z56RM8c7c7uLwLsTeNKuQuIm7hfdV3zRqtSlr+Mkt2zacv+RmE0jB9hEG1Mo4QcrLivMv5RUPDVxr3lBzAdeSxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708078256; c=relaxed/simple;
	bh=ibncrYSMoUQ3CoKZDrifhpZ0i3VODGcZmC6xuCZUXbc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n/tajE5bztYRUmq/kYhL99HI95fHFNtYdbDjSAIFFJ1we/WlDodQescFQH0iXgUe85m1PohYkQOYcMCHbNBHlKXq5CKU+vKdmeHCWz+jDEPAVSkK2+HG5VZzQz0RQ4MH58t3fZlnBU63K5ylf6a2p63/10v6mMFJm1rDlG3E1k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=TQvFmFoj; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5116ec49365so671802e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Feb 2024 02:10:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1708078252; x=1708683052; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ytAhWz1L3xYxXELaLgaUujOMD+Gva0kVPECBIzo4HAQ=;
        b=TQvFmFojycJeF2Z2j79M23GDp/vPI6XhPa2c2/LCyYN7oEG1a+Dtv8ZMfVoc8iai2u
         MQuQknk8LilwVKYoSM1himwn75nr5j0AOOtNr8biRMlA8MGIyiF2UkbvfOYRC/OqqPTz
         5XzVIstRB4eLQFf1y/p/t6UgDjM3Ve1GdbpD4rbTlbVn4dwbX9S+lZAQnVkMr/ZEPARV
         km/2k5LHCVOb1/SNg5BRrRPpwScyNe2bXAZeXowIyqofODV7I/DVIFDOlXxVFLYHRJvJ
         8HuJm8cSpVXReIipQqCDJsWSHxc5iJ5aUfzdYZcObcblndA8ZSQE/gauFKeb9KOiK/uJ
         uc3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708078252; x=1708683052;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ytAhWz1L3xYxXELaLgaUujOMD+Gva0kVPECBIzo4HAQ=;
        b=pxp/dIsHYOnu53FeJxIfGIBINASgL+F3Tyo+sWEG6v+SN/mZiOHUdBzUy5gJf5WRfJ
         lB9dISES2/ba7f33FCWtp6oJ7jAw6R4Y5jkWZBpKpQmmq368GD2nJD/ynM1jhwaS77ny
         YYjL75yiEjR6O8cNezeSTEL9wUu8LuRUc4lNQAybNF5gY6rL0sRBVda5xZwHmuFiVWUv
         OQ2ZXTjmJeiYbAMe4yGLDussCNnLxQfGLNgY3/N3lsjjzz1GBKq27eYLtO+DnkVT1NzD
         WapPGUcz7H0EqXDGCCKCx54gLySL2mJ1EQLmrIzG1S1DBVqfDEj6S99IC3773RNAPyH/
         XK2A==
X-Forwarded-Encrypted: i=1; AJvYcCWy3I3AfM2y9O/fabmAN457q7OAEFcqDORWG9CDY/Noe7mvcdPUJhkQOwg8AiIJmPYN7NvD9y1LrB4My3BG1FXJipPPhpRmo9mjyIodyA==
X-Gm-Message-State: AOJu0Yx4rVrIODxGCHw4ohD/JK3lYEiG5D+zQv7NCfu9VKBNxtjbVtsZ
	7za007mcdGxrDjimb8T1vfruAJm3mW6BbXWdpDFf/r0tbD0qxponpDak5Yofz6s=
X-Google-Smtp-Source: AGHT+IEVJIPqjDwlWe58ZAZjaPzBTQECJYMTp+kbNtQLru1WjXV8FTBd2JXmb4czZQII9OWQJ0sxpw==
X-Received: by 2002:ac2:4db7:0:b0:511:dc62:7f95 with SMTP id h23-20020ac24db7000000b00511dc627f95mr3369194lfe.15.1708078252249;
        Fri, 16 Feb 2024 02:10:52 -0800 (PST)
Received: from otso.luca.vpn.lucaweiss.eu (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id s18-20020a170906169200b00a3d1897ab68sm1398019ejd.113.2024.02.16.02.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 02:10:51 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 16 Feb 2024 11:10:48 +0100
Subject: [PATCH v3 1/4] dt-bindings: display: panel: Add Himax HX83112A
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240216-fp4-panel-v3-1-a556e4b79640@fairphone.com>
References: <20240216-fp4-panel-v3-0-a556e4b79640@fairphone.com>
In-Reply-To: <20240216-fp4-panel-v3-0-a556e4b79640@fairphone.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Andy Gross <agross@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.4

Himax HX83112A is a display driver IC used to drive LCD DSI panels.
Describe it and the DJN 9A-3R063-1102B using it.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../bindings/display/panel/himax,hx83112a.yaml     | 74 ++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/himax,hx83112a.yaml b/Documentation/devicetree/bindings/display/panel/himax,hx83112a.yaml
new file mode 100644
index 000000000000..174661d13811
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/himax,hx83112a.yaml
@@ -0,0 +1,74 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/himax,hx83112a.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Himax HX83112A-based DSI display panels
+
+maintainers:
+  - Luca Weiss <luca.weiss@fairphone.com>
+
+description:
+  The Himax HX83112A is a generic DSI Panel IC used to control
+  LCD panels.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    contains:
+      const: djn,9a-3r063-1102b
+
+  vdd1-supply:
+    description: Digital voltage rail
+
+  vsn-supply:
+    description: Positive source voltage rail
+
+  vsp-supply:
+    description: Negative source voltage rail
+
+  reg: true
+  port: true
+
+required:
+  - compatible
+  - reg
+  - reset-gpios
+  - vdd1-supply
+  - vsn-supply
+  - vsp-supply
+  - port
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
+            compatible = "djn,9a-3r063-1102b";
+            reg = <0>;
+
+            backlight = <&pm6150l_wled>;
+            reset-gpios = <&pm6150l_gpios 9 GPIO_ACTIVE_LOW>;
+
+            vdd1-supply = <&vreg_l1e>;
+            vsn-supply = <&pm6150l_lcdb_ncp>;
+            vsp-supply = <&pm6150l_lcdb_ldo>;
+
+            port {
+                panel_in_0: endpoint {
+                    remote-endpoint = <&dsi0_out>;
+                };
+            };
+        };
+    };
+
+...

-- 
2.43.2


