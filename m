Return-Path: <linux-arm-msm+bounces-7740-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD22835E69
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jan 2024 10:44:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F6A4286BAA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jan 2024 09:44:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA21739ADF;
	Mon, 22 Jan 2024 09:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MghA8fCp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D88D539FE7
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jan 2024 09:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705916652; cv=none; b=B4gZVCpj+aVrvrJ1arhf9VLWbYA95apNBRsDq30nqenA5qw4Mh66W+wWr+ddo3PufjShqgFCtCFPOZOay9Pn55utzYJmdBXTWlynNHfAAsEQdSIR+srQhFgb7IYPi/NAobdUGCV6x989c83W+VISysnK+iV1IRrKFcZ1+1mJ9fM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705916652; c=relaxed/simple;
	bh=hB8g5YkR7Sld/uhp8W4eAEYyFbFhiu2UNkWnfpYjh4w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fGB3kgPqoBjVUoNv9LyvcJzq+k7o/QmqPqxWfvrY+KkAFRAH8wBNUny2D1/jy0lZsGJntl37NT5QnKD2ivRsZSHQujIuSaYY7yi9Buhcjz3F7JzqEBDzJdgDDbrIDSuZ5G1EtY/g35EnBHUgB9rzBfoBUVyLfQszSCiMoXmL75o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MghA8fCp; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-40eb0836f8dso2172085e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jan 2024 01:44:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705916649; x=1706521449; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lyskIm+mWWi2cKlcJh017DM9BpiO7GgRCHqUYIzx2oA=;
        b=MghA8fCpGFDCRDKH97bXBZz0/CLlQK0fSzY3vxB/61L5mgGjZ5yD0lvxD5kfaVrimV
         qioUQ71pOHtrrLiSPLmIuGn1L3oWfvZX4pJ7IYtfT+RBEjvGLkzALy8rJXKBvlEjnsDY
         S6VieROb8tTDfxhceWFFSEpf06imxmI0R1FbO26KI8XyeABe3WxqKSWgEoBTYvKfcau8
         GgPBuoaH7A+TysgLANOhZ2OaRZLZ/dnjSOxSd67VPQ8zvuX2tkWVQK3HiW+fADIwG4QD
         Avb2MLMveJGjoVTyNnbKnIfH+11dASHjL1k1ju4ecOgZ81tGI4b6nCxezMHHzjaOzh3I
         EX+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705916649; x=1706521449;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lyskIm+mWWi2cKlcJh017DM9BpiO7GgRCHqUYIzx2oA=;
        b=c4SIegRpTXVMBXHfczUaEGLfsr30lGjrzfxJsx/zWFSPQB2VBkv3eYQ4/bLyre+hjx
         B3gaB8Ige3wQbVTBszcad1Ic5Lt/1C7QQdmzUXTJAltv8OnXNqHnzDjV4F+9NUgy44jw
         cB1gt5a68UQoIihHhmAfnr+m5eLLSKFXFRg4kAMhTRk+p2Rxs94ADr1OkJk/0ZUxaPs6
         eZKonbPOULoKmPIyk6fp7f4glZ4S821nAbaUV+Iw6ixX/VXrYG/xwnfU9fxqeXEVsg5s
         tqRR6k8e1igEfvq7611WP6WuxBAvn9tdlIiKs0zsUJAFiPNqQ2MMGTYis3BRS8es8Y4+
         iVxA==
X-Gm-Message-State: AOJu0Yyz5Tbm0fa7wy5W1R4gTEqJWUg9uBPO1zmt369ITVUx8SX1LgEL
	fzZH/We+qDlZnH2WtWS0kqKxh4x/e/4gOQBgHfISHwIuevO+AhXc0USQ7ozUa+A=
X-Google-Smtp-Source: AGHT+IGav0UAB/Grh4y4yBbUmzGU7vmiQBDd+GRdQyMB9teQXJrum3ZAhKWom3R6HtYu2x7//yrCGg==
X-Received: by 2002:a05:600c:5491:b0:40e:a964:e6f8 with SMTP id iv17-20020a05600c549100b0040ea964e6f8mr1194790wmb.17.1705916649136;
        Mon, 22 Jan 2024 01:44:09 -0800 (PST)
Received: from krzk-bin.. ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id n21-20020a05600c3b9500b0040eaebc4e8fsm2093368wms.1.2024.01.22.01.44.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 01:44:08 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2] dt-bindings: usb: add common Type-C USB Switch schema
Date: Mon, 22 Jan 2024 10:44:06 +0100
Message-Id: <20240122094406.32198-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Several bindings implement parts of Type-C USB orientation and mode
switching, and retiming.  Keep definition of such properties in one
place, new usb-switch schema, to avoid duplicate defines.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. Fix language typos handle->handler (Luca)
2. Drop debugging left-over (Luca)
---
 .../devicetree/bindings/usb/fcs,fsa4480.yaml  | 12 ++--
 .../devicetree/bindings/usb/gpio-sbu-mux.yaml | 12 ++--
 .../devicetree/bindings/usb/nxp,ptn36502.yaml | 12 ++--
 .../bindings/usb/onnn,nb7vpq904m.yaml         | 13 ++--
 .../bindings/usb/qcom,wcd939x-usbss.yaml      | 12 ++--
 .../devicetree/bindings/usb/usb-switch.yaml   | 67 +++++++++++++++++++
 6 files changed, 92 insertions(+), 36 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/usb-switch.yaml

diff --git a/Documentation/devicetree/bindings/usb/fcs,fsa4480.yaml b/Documentation/devicetree/bindings/usb/fcs,fsa4480.yaml
index f9410eb76a62..8b25b9a01ced 100644
--- a/Documentation/devicetree/bindings/usb/fcs,fsa4480.yaml
+++ b/Documentation/devicetree/bindings/usb/fcs,fsa4480.yaml
@@ -27,13 +27,8 @@ properties:
   vcc-supply:
     description: power supply (2.7V-5.5V)
 
-  mode-switch:
-    description: Flag the port as possible handle of altmode switching
-    type: boolean
-
-  orientation-switch:
-    description: Flag the port as possible handler of orientation switching
-    type: boolean
+  mode-switch: true
+  orientation-switch: true
 
   port:
     $ref: /schemas/graph.yaml#/$defs/port-base
@@ -79,6 +74,9 @@ required:
   - reg
   - port
 
+allOf:
+  - $ref: usb-switch.yaml#
+
 additionalProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml b/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml
index d3b2b666ec2a..88e1607cf053 100644
--- a/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml
+++ b/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml
@@ -33,13 +33,8 @@ properties:
   vcc-supply:
     description: power supply
 
-  mode-switch:
-    description: Flag the port as possible handle of altmode switching
-    type: boolean
-
-  orientation-switch:
-    description: Flag the port as possible handler of orientation switching
-    type: boolean
+  mode-switch: true
+  orientation-switch: true
 
   port:
     $ref: /schemas/graph.yaml#/properties/port
@@ -54,6 +49,9 @@ required:
   - orientation-switch
   - port
 
+allOf:
+  - $ref: usb-switch.yaml#
+
 additionalProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/usb/nxp,ptn36502.yaml b/Documentation/devicetree/bindings/usb/nxp,ptn36502.yaml
index eee548ac1abe..d805dde80796 100644
--- a/Documentation/devicetree/bindings/usb/nxp,ptn36502.yaml
+++ b/Documentation/devicetree/bindings/usb/nxp,ptn36502.yaml
@@ -20,13 +20,8 @@ properties:
   vdd18-supply:
     description: Power supply for VDD18 pin
 
-  retimer-switch:
-    description: Flag the port as possible handle of SuperSpeed signals retiming
-    type: boolean
-
-  orientation-switch:
-    description: Flag the port as possible handler of orientation switching
-    type: boolean
+  orientation-switch: true
+  retimer-switch: true
 
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
@@ -49,6 +44,9 @@ required:
   - compatible
   - reg
 
+allOf:
+  - $ref: usb-switch.yaml#
+
 additionalProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/usb/onnn,nb7vpq904m.yaml b/Documentation/devicetree/bindings/usb/onnn,nb7vpq904m.yaml
index c0201da002f6..589914d22bf2 100644
--- a/Documentation/devicetree/bindings/usb/onnn,nb7vpq904m.yaml
+++ b/Documentation/devicetree/bindings/usb/onnn,nb7vpq904m.yaml
@@ -21,14 +21,8 @@ properties:
     description: power supply (1.8V)
 
   enable-gpios: true
-
-  retimer-switch:
-    description: Flag the port as possible handle of SuperSpeed signals retiming
-    type: boolean
-
-  orientation-switch:
-    description: Flag the port as possible handler of orientation switching
-    type: boolean
+  orientation-switch: true
+  retimer-switch: true
 
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
@@ -95,6 +89,9 @@ required:
   - compatible
   - reg
 
+allOf:
+  - $ref: usb-switch.yaml#
+
 additionalProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/usb/qcom,wcd939x-usbss.yaml b/Documentation/devicetree/bindings/usb/qcom,wcd939x-usbss.yaml
index 7ddfd3313a18..96346723f3e9 100644
--- a/Documentation/devicetree/bindings/usb/qcom,wcd939x-usbss.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,wcd939x-usbss.yaml
@@ -35,13 +35,8 @@ properties:
   vdd-supply:
     description: USBSS VDD power supply
 
-  mode-switch:
-    description: Flag the port as possible handle of altmode switching
-    type: boolean
-
-  orientation-switch:
-    description: Flag the port as possible handler of orientation switching
-    type: boolean
+  mode-switch: true
+  orientation-switch: true
 
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
@@ -63,6 +58,9 @@ required:
   - reg
   - ports
 
+allOf:
+  - $ref: usb-switch.yaml#
+
 additionalProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/usb/usb-switch.yaml b/Documentation/devicetree/bindings/usb/usb-switch.yaml
new file mode 100644
index 000000000000..da76118e73a5
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/usb-switch.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/usb-switch.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: USB Orientation and Mode Switches Common Properties
+
+maintainers:
+  - Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+
+description:
+  Common properties for devices handling USB mode and orientation switching.
+
+properties:
+  mode-switch:
+    description: Possible handler of altmode switching
+    type: boolean
+
+  orientation-switch:
+    description: Possible handler of orientation switching
+    type: boolean
+
+  retimer-switch:
+    description: Possible handler of SuperSpeed signals retiming
+    type: boolean
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description:
+      A port node to link the device to a TypeC controller for the purpose of
+      handling altmode muxing and orientation switching.
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Super Speed (SS) Output endpoint to the Type-C connector
+
+      port@1:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        description:
+          Super Speed (SS) Input endpoint from the Super-Speed PHY
+        unevaluatedProperties: false
+
+        properties:
+          endpoint:
+            $ref: /schemas/graph.yaml#/$defs/endpoint-base
+            unevaluatedProperties: false
+            properties:
+              data-lanes:
+                $ref: /schemas/types.yaml#/definitions/uint32-array
+                minItems: 1
+                maxItems: 8
+                uniqueItems: true
+                items:
+                  maximum: 8
+
+oneOf:
+  - required:
+      - port
+  - required:
+      - ports
+
+additionalProperties: true
-- 
2.34.1


