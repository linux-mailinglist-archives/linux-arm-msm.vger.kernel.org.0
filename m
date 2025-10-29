Return-Path: <linux-arm-msm+bounces-79343-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84554C18C2C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 08:47:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 496BE404CC3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 07:44:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 271EA2FB08F;
	Wed, 29 Oct 2025 07:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CIalLULP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8FE8310644
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 07:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761723858; cv=none; b=T71H4Ed5PLqelTyrpHpft0AykEASxGWzDyM/ev/yU7hN8HJJKz3nh2DAdH4H6m9a6+2PMasMQxr05EoyTnPI0q0s4w31GYJnQnY/MuArAzCW3KArnNcmuj93tyP9OWpOKlxJfcYD/N5qDUE1ms6GBnsXFsTw/b2Fbeqjh3X9K8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761723858; c=relaxed/simple;
	bh=1OEKBZd3Pxcn4NWZEVyg+zU+HrcwKqhnbfIn7kZHpl0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OV5rp48VH2lpHteVlcv7UvUmVanj4LJcB5zz9n5aoJ7ChfCAnv/5O6/QXKp/5Mp2CiAZO5SNWHTFZp8MTEg8S0A/FUjNnGHf5pgV/ExTCfz9+FL8/La3Hq0rk1n6PkajhVIXpX/V1KBi1wTZGgnrqufMaOwyQzpWomwKYuF6gHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CIalLULP; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3f4319b8c03so828838f8f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 00:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761723853; x=1762328653; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qQtkl382GI6bqhRyQP3r46W9x6QHG1RVELos4Msr/bw=;
        b=CIalLULPyB5JyiNdjEHfukgAQKRY6cK+HLGVVUNPWYfalASlfuev0XwVEKVptIxa0k
         ezkMdbOPL4V7eOfwQAouG7dROfCWmNOmnpUtcUNY5j1NR2cuL34HGGK4Y3lsGkL9TuXl
         LO4ocA9DwsX0rhRX/MIpULzji06/P2pTiAdCcahcauds+ROlEzCg/Y19ROiDHdU2wjK1
         9h3CXbWDWKpjOG4JGTkiP0ZmHWcjsdSo5ld8sY2aN9GFGeVqyW26EmabFu1tIhJavyS/
         3dazMLtXhYblT1w20FHld6MhXgmf9tPgQOTngYU8qrlSrTXeKN+B1w00sxRk9cmdCGWV
         HygQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761723853; x=1762328653;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qQtkl382GI6bqhRyQP3r46W9x6QHG1RVELos4Msr/bw=;
        b=Gfn6iFzpcdTg9prMeAloT4a5OPzxwsMSCqGzaIl1Z8jK34DsyMEYUIU1U/My0k4dL3
         eP0MeikkeNpvH1iPTxz/JbhNtqDIpf2nzuqSIc9ZRKDcqBnzP63S4S+eicxnz9yop6er
         fgP/9oHsc0yyrNNDDf1CnrQE2xwI5SGW8Rjv+cBuDYnHlo3MpVGtiYuP45TvHRHQ+Ih/
         SnKPdDGAxn0fami+n3sX8/ppN+hoA4X9aQyXYAqKwOM7NS5e1fUBb/RXv0Lvm+1NcLrX
         86Ovvrhcu8wIInV3ocbqRQ9F/LlEqy8CYA5eydNuEYf+mAlWTOyBUtVuLrR19J7CzPsw
         8Y9g==
X-Forwarded-Encrypted: i=1; AJvYcCX3/PM1OnalNsnyfIm8l4P3PimDDDF4wXVATc6nXFRQU1O+W5Qx2rhsvA8HwmNn2aal5P2rdcv4muqrjBpd@vger.kernel.org
X-Gm-Message-State: AOJu0YzhqL3uQp5kBN1+Eanxv/guEOUJplBGz708oCdyaLxnVv7zcNIp
	38XUsctZf7tze8AJ/i05tdUQzp2NKph/64Ciug7Y7ec9JWkTljxT5JnD2ebe/Hw0Buk=
X-Gm-Gg: ASbGncsf6Wrn4mP/SMng7Yua6uK4wdS+pPndtQ9MjvrtAKen6B4/jlt7f2AUBI9M+Oy
	6HEqxa3nZaRcd+2u/Hcf1riUkNGS9auJlvCAws14neBqbnT27OlP2mSJlKDnwXRCCY2B0jIgome
	+6xY5b/21N5N2B3mm2TjhzE2hYXn55mbglQ6U+E7GRp5AnuNHInHKZnD9A4Nop5p+H4S8YQIq5n
	j3Cfkrqn+UwxhdEv+5omutJNGlGtpXG4Lmk6YbtASAbYDU3QH83YkajE4VSzMv1+z0zsmOa7yjI
	hFZbGczBPpM7hE4WxpdyDRbSgYzUY6mL31aaj1N8mdz55aKBIHC1o0yPE5Pk9zRO+9zyJ8/cseV
	/waWFwk+jY0slEgOPLBpWjkA53EQTT0uxg+6I0cxwjdfwx7AdUCKuBQFJbwWP2hzqdxkVlTKoiN
	zCRsX8kl11ri+UfZ8lghJ6Dy2J79U=
X-Google-Smtp-Source: AGHT+IF9tlp/gUwLaREffjpNOYFLqhCz/Qylsj2r8Gi1EKpFbT8FWh3U1tckMm7cYLoHyHP8MkC/GQ==
X-Received: by 2002:a05:6000:2203:b0:3f3:1be5:ecbf with SMTP id ffacd0b85a97d-429aefc04f4mr704992f8f.7.1761723853136;
        Wed, 29 Oct 2025 00:44:13 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952d5c9dsm25861146f8f.26.2025.10.29.00.44.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 00:44:12 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 29 Oct 2025 08:43:51 +0100
Subject: [PATCH v2 01/11] dt-bindings: bluetooth: qcom,qca2066-bt: Split to
 separate schema
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-dt-bindings-qcom-bluetooth-v2-1-dd8709501ea1@linaro.org>
References: <20251029-dt-bindings-qcom-bluetooth-v2-0-dd8709501ea1@linaro.org>
In-Reply-To: <20251029-dt-bindings-qcom-bluetooth-v2-0-dd8709501ea1@linaro.org>
To: Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
 Rocky Liao <quic_rjliao@quicinc.com>, Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5731;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=1OEKBZd3Pxcn4NWZEVyg+zU+HrcwKqhnbfIn7kZHpl0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpAcXAvOHjKIUVmIOeDNC6Pf4ysOIRtaQO34r3a
 UrMms5k+tSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaQHFwAAKCRDBN2bmhouD
 1+tEEACAd2hnuYTluizIay3kgFgSStdHc2cu0LRGX2HUqZNNnLehz+eLNhGgROe5dgTnL28A9ha
 q6mi8Fe4370ACxcXkQbb3vSJHCcYEVS4X7r0VDZIChz54pGH8fwR6ps0VP8tzQ7QYbuxoEhiPrz
 FtyJVKzV1OsWFL9iq+FvvqReK+TCr4D93BCk2Ew/rhqqErmMbYy+t7GfEQ0/XcT/R5rOVcoQDA/
 FZRILv8UmAyzWTCX2QBLYRKnCEI8OZSgzRrdloPefeNDGUkZufLaHfL9SEnyyAexQpK8uo4/2td
 HCTtegnIKGvWpApCVkEKSZbwBtDVT75AMy02JXopFJKs3ej9tt/0p2emPlv4V0e/pzz7U04ma2o
 wx7ybY/FqAHKUlAaP1bGPYXVsKVPepC3RR6wxUODPSTdKRAEG9Q1NGuWNXZj3io+Gy1YOc1ZvCo
 d+Vt1VtH9n0yeDKBcU8hf5YCauxeAMtlZ9yfa721zBf9RtQvvoccre5QBxoED2fU+ehjXEzrjjZ
 fONOZqtb2WpIEHav4xYZ/Qn+wPFrjdT61kfCMfo2lzSU9kpz08vn73RrdQ7325R0gdX5/8RIUJx
 2tk+kCYzLhbtoecnomXeSa9FWeRULLgxWT8psemcNmsT0rr7XzuOSjqn+/xHTm7veCCvPv/jm/g
 2/2oWB7XX9sOffg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

One big Qualcomm Bluetooth schema is hardly manageable: it lists all
possible properties (19 supplies).  Split common part and
qcom,qca2066-bt to separate bindings, so each schema will be easier to
read/maintain and list only relevant properties.

The existing bindings do not mention interrupts, but
am335x-sancloud-bbe-extended-wifi.dts already defines such.  This issue
is not being fixed here.

Existing binding also did not mention any supplies (which do exist as
confirmed in datasheet) and Linux driver does not ask for any, thus keep
this state unchanged.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Expected warnings:
arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-extended-wifi.dts

Changes in v2:
1. Keep gpio.h header include for rest of the examples (fix build
   failure)
---
 .../net/bluetooth/qcom,bluetooth-common.yaml       | 25 +++++++++++
 .../bindings/net/bluetooth/qcom,qca2066-bt.yaml    | 49 ++++++++++++++++++++++
 .../bindings/net/bluetooth/qualcomm-bluetooth.yaml | 25 +----------
 MAINTAINERS                                        |  1 +
 4 files changed, 76 insertions(+), 24 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/bluetooth/qcom,bluetooth-common.yaml b/Documentation/devicetree/bindings/net/bluetooth/qcom,bluetooth-common.yaml
new file mode 100644
index 000000000000..c8e9c55c1afb
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/bluetooth/qcom,bluetooth-common.yaml
@@ -0,0 +1,25 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/bluetooth/qcom,bluetooth-common.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Bluetooth Common Properties
+
+maintainers:
+  - Balakrishna Godavarthi <quic_bgodavar@quicinc.com>
+  - Rocky Liao <quic_rjliao@quicinc.com>
+
+properties:
+  firmware-name:
+    minItems: 1
+    items:
+      - description: specify the name of nvm firmware to load
+      - description: specify the name of rampatch firmware to load
+
+  qcom,local-bd-address-broken:
+    type: boolean
+    description:
+      boot firmware is incorrectly passing the address in big-endian order
+
+additionalProperties: true
diff --git a/Documentation/devicetree/bindings/net/bluetooth/qcom,qca2066-bt.yaml b/Documentation/devicetree/bindings/net/bluetooth/qcom,qca2066-bt.yaml
new file mode 100644
index 000000000000..d4f167c9b7e1
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/bluetooth/qcom,qca2066-bt.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/bluetooth/qcom,qca2066-bt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm QCA2006 Bluetooth
+
+maintainers:
+  - Balakrishna Godavarthi <quic_bgodavar@quicinc.com>
+  - Rocky Liao <quic_rjliao@quicinc.com>
+
+properties:
+  compatible:
+    enum:
+      - qcom,qca2066-bt
+      - qcom,qca6174-bt
+
+  clocks:
+    items:
+      - description: External low-power 32.768 kHz clock input
+
+  enable-gpios:
+    maxItems: 1
+
+required:
+  - compatible
+  - clocks
+  - enable-gpios
+
+allOf:
+  - $ref: bluetooth-controller.yaml#
+  - $ref: qcom,bluetooth-common.yaml
+  - $ref: /schemas/serial/serial-peripheral-props.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    serial {
+        bluetooth {
+            compatible = "qcom,qca6174-bt";
+            clocks = <&divclk4>;
+            enable-gpios = <&pm8994_gpios 19 GPIO_ACTIVE_HIGH>;
+            firmware-name = "nvm_00440302.bin";
+        };
+    };
diff --git a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
index 6353a336f382..85d10d94700f 100644
--- a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
+++ b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
@@ -16,8 +16,6 @@ description:
 properties:
   compatible:
     enum:
-      - qcom,qca2066-bt
-      - qcom,qca6174-bt
       - qcom,qca9377-bt
       - qcom,wcn3950-bt
       - qcom,wcn3988-bt
@@ -122,17 +120,6 @@ additionalProperties: false
 allOf:
   - $ref: bluetooth-controller.yaml#
   - $ref: /schemas/serial/serial-peripheral-props.yaml#
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - qcom,qca2066-bt
-              - qcom,qca6174-bt
-    then:
-      required:
-        - enable-gpios
-        - clocks
 
   - if:
       properties:
@@ -211,17 +198,6 @@ allOf:
         - vddrfa1p7-supply
 
 examples:
-  - |
-    #include <dt-bindings/gpio/gpio.h>
-    serial {
-
-        bluetooth {
-            compatible = "qcom,qca6174-bt";
-            enable-gpios = <&pm8994_gpios 19 GPIO_ACTIVE_HIGH>;
-            clocks = <&divclk4>;
-            firmware-name = "nvm_00440302.bin";
-        };
-    };
   - |
     serial {
 
@@ -236,6 +212,7 @@ examples:
         };
     };
   - |
+    #include <dt-bindings/gpio/gpio.h>
     serial {
 
         bluetooth {
diff --git a/MAINTAINERS b/MAINTAINERS
index 8a2c5fb0ba55..c1889de94ad9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21148,6 +21148,7 @@ QUALCOMM BLUETOOTH DRIVER
 M:	Bartosz Golaszewski <brgl@bgdev.pl>
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
+F:	Documentation/devicetree/bindings/net/bluetooth/qcom,*
 F:	drivers/bluetooth/btqca.[ch]
 F:	drivers/bluetooth/btqcomsmd.c
 F:	drivers/bluetooth/hci_qca.c

-- 
2.48.1


