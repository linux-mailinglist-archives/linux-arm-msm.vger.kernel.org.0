Return-Path: <linux-arm-msm+bounces-81211-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5ACC4D28A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 11:48:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C4B503A890E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 10:43:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A81334F482;
	Tue, 11 Nov 2025 10:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HLVPssYf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B5434F468
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 10:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762857775; cv=none; b=OwfWJVegiNuOA4ISUcLCQLvIWRRqt6xKB7QvPovWiO31BBZIF/ryscY8RJ4hnkYqdFAyVnBW4BQjS6gT7nfSsP9CNxKUhZQB7r3q2Hzk61UwvJlSz4TZFPPNFWMqe/uWd8SXNDuzx0D4Bz9/8J206D48WIrgcdJqu5hKab74FnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762857775; c=relaxed/simple;
	bh=07HBWmrT/H7zno+mG0Fc4iUEDkZr7DmZa2LvkHNFOQU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hSJ0kv+xuvDot+TlXSkI5tYk8metC7zcaN31chOxtgD7MO5Ertsaxe2zsMMFdJ9+q3dNV/ZeHh3W1WJdtGHksaEyg9FdCfmarUshHpiAIevYE9cG7YzNda0VspFgJ6skf4MoBPyYPX/rO4kNAc1f5Mr51ELWItgkkfJ5PGbWnjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HLVPssYf; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-298456bb53aso3393115ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 02:42:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762857773; x=1763462573; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fYUsDbsuuzTOSOtHBw8aAUbI3zAG5zqYtHfT8rBYa7k=;
        b=HLVPssYftnHHNoapg3S2CqXrYMBkcu5mTq50K2WuFegHFT782sdFkBgXDclUscFsEB
         FVm8iLMyj4O+navQXXvrXBFtUJ23yXKkPZxc+9aPFXYIv5yoJcBAMj5H+v+Iyrk2y0hL
         /qSUdKroU9dP3tFuq4Mxm95FgMp/RF1VaqgRDSITHREpA1c/K5ptW6ZDKFhdgxpV11n4
         OXCc/sgrI071IkdjBTplSWL5z+VuSLUmnuuxBEGieNWrVHT0cSijpUERXHBlEC8/CTJ/
         XgTEj8OujyGezYSCfYM41EktMdo7PzOi4Nf7PekP3c++X7Ms5dziSdqyKEMS7SVqhSrN
         ITPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762857773; x=1763462573;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fYUsDbsuuzTOSOtHBw8aAUbI3zAG5zqYtHfT8rBYa7k=;
        b=JPrOrLOSjbErPNCM2V63/YusUpBnbIWPPtFtsWplShsP5EfFFJ2gmlWPwFvdamHoEV
         f2uiUd2VT7/44iJ74VHNi7kwuLTzIXrNp7gF5Z6Os8MEKD+7/oWzPYRlScmAW1lbV3mb
         2D7Lh2qrEUJNXzuJWRoEqzYdzJX2PV8XKoT8ILHjLmDFEVNsw6LzHlgfBA/J4aymWN2d
         e/T/b9sEwHWrt/C+I59fKTbJZ2bvmY9/uGpKOi1bzO63dOx7zz5VHQLDaIis/2GQHkx7
         QaoB2hn6M3tKz5F2gFe4nwZV/lRnZZD+q1/FRRpwJlIwjy0G1CXdfOhf1RaWBi/ZT9K/
         tygw==
X-Forwarded-Encrypted: i=1; AJvYcCVCLYVpC4ZxLS8MRrrB6ieGeqdni5DXrFaTOe6x6v4y9s4wiFySaaAb1XeaySXCrbhwkyDSqFid76TvmMKP@vger.kernel.org
X-Gm-Message-State: AOJu0YwGHrF0m3z2PjhAa4oqhQks9ivvta+Z0bYZ7b+NffuLRGaSDlbA
	/QyBMB7Z8bXTNEBlcUEa119bYHG7pHq6S8H3z9DZcD8CmCWD6K1vAMWZUUF3Ew==
X-Gm-Gg: ASbGncvubilw4hHXzy8X86KOlyAoPqlAPt5aEM85Ppd3jRrDlb4oYD6i28M/NTIc9FK
	CKmTIIGakyGmgkieWvvLKmd6HbIHxMtV95+Yh2R4nKSvHi+M9+M5LAxMZJpkKwH1ANkD3mmtfQf
	5qIEet00LyQvci+0yydeaeeHrdtfN2miB2OZhZKYFoJR/hgJKsuT/lTqVj612OwgNKaO+r+vOs1
	LG8+IE14HXRzXaUgXO4H7OyxJ+o8Dcr/wrbTEG3fdQad447af07Bj7gz5W8GzsznWWC5pI0vs+D
	l+dVsIivyT2Defd+58PwPeFLB6JI3hWU536koss4qvULjfXFu+Ttue0OIHnsPRipRfkdD4zMvcA
	Z1rYrmD6+yd5tqoSs0ZsSbePjHau7IsqDFnNjSfoueT4AkpOUR9tpm+PstpRQZh0lPSTfcwpSN1
	QPDqWPRVzgaeXRQykeh6ehUpwFJg==
X-Google-Smtp-Source: AGHT+IHKKW8uq/mixyYVwcE/GpKbjkb15Z3bYzo5IdPyn+w9o2ptPT8ipRXj2MXgq6Fk0DjaNvvO6g==
X-Received: by 2002:a17:902:e78f:b0:28d:18d3:46ca with SMTP id d9443c01a7336-297e56df08emr157512625ad.49.1762857772692;
        Tue, 11 Nov 2025 02:42:52 -0800 (PST)
Received: from test-HP-Desktop-Pro-G3.. ([103.218.174.23])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29846334db5sm9875235ad.32.2025.11.11.02.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 02:42:52 -0800 (PST)
From: Sudarshan Shetty <tessolveupstream@gmail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sudarshan Shetty <tessolveupstream@gmail.com>
Subject: [PATCH v1 1/2] dt-bindings: arm: qcom: Add waveshare MIPI-DSI panels support
Date: Tue, 11 Nov 2025 16:12:44 +0530
Message-Id: <20251111104245.3420041-1-tessolveupstream@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Device tree bindings for Waveshare MIPI-DSI panels
of various sizes (5.0, 5.5, 7.0, 8.0, and 10.1).
These panels require proper power sequencing via an external
regulator and a backlight node for brightness control.

Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
---
 .../display/panel/waveshare,dsi-panel.yaml    | 84 +++++++++++++++++++
 ...waveshare,touchscreen-panel-regulator.yaml | 72 ++++++++++++++++
 2 files changed, 156 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/waveshare,dsi-panel.yaml
 create mode 100644 Documentation/devicetree/bindings/regulator/waveshare,touchscreen-panel-regulator.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/waveshare,dsi-panel.yaml b/Documentation/devicetree/bindings/display/panel/waveshare,dsi-panel.yaml
new file mode 100644
index 000000000000..a42ce065124f
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/waveshare,dsi-panel.yaml
@@ -0,0 +1,84 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/waveshare,dsi-panel.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Waveshare 10.1" DSI Touch Display Panel
+
+maintainers:
+  - Sudarshan Shetty <tessolveupstream@gmail.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - waveshare,12.3-dsi-touch-a,4lane
+      - waveshare,10.1-dsi-touch-a
+      - waveshare,10.1-dsi-touch-a-4lane
+      - waveshare,10.1-dsi-touch-b
+      - waveshare,10.1-dsi-touch-b,4lane
+      - waveshare,9.0-dsi-touch-b
+      - waveshare,9.0-dsi-touch-b,4lane
+      - waveshare,8.8-dsi-touch-a
+      - waveshare,8.0-dsi-touch-a
+      - waveshare,8.0-dsi-touch-a-4lane
+      - waveshare,7.0-dsi-touch-a
+      - waveshare,7.0-dsi-touch-b
+      - waveshare,5.5-dsi-touch-a
+      - waveshare,5.0-dsi-touch-a
+      - waveshare,4.0-dsi-touch-c
+      - waveshare,3.4-dsi-touch-c
+
+  reg:
+    description: DSI virtual channel
+    maxItems: 1
+
+  vdd-supply:
+    description: Power supply regulator for the panel
+
+  reset-gpios:
+    maxItems: 1
+    description: GPIO to control panel reset
+
+  enable-gpios:
+    maxItems: 1
+    description: GPIO to control panel power enable
+
+required:
+  - compatible
+  - reg
+  - vdd-supply
+  - reset-gpios
+  - enable-gpios
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi@ae94000 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@1 {
+            compatible = "waveshare,10.1-dsi-touch-a";
+            reg = <1>;
+            vdd-supply = <&vreg_l11a>;
+            reset-gpios = <&display_mcu 1 GPIO_ACTIVE_HIGH>;
+            enable-gpios = <&display_mcu 2 GPIO_ACTIVE_HIGH>;
+
+            port {
+                panel_in: endpoint {
+                    remote-endpoint = <&mdss_dsi0_out>;
+                };
+            };
+        };
+    };
+
+    mdss_dsi0_out: endpoint {
+        remote-endpoint = <&panel_in>;
+    };
diff --git a/Documentation/devicetree/bindings/regulator/waveshare,touchscreen-panel-regulator.yaml b/Documentation/devicetree/bindings/regulator/waveshare,touchscreen-panel-regulator.yaml
new file mode 100644
index 000000000000..be81be5d2d74
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/waveshare,touchscreen-panel-regulator.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/waveshare,touchscreen-panel-regulator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Waveshare Touchscreen Panel Regulator
+
+maintainers:
+  - Sudarshan Shetty <tessolveupstream@gmail.com>
+
+description: |
+  Regulator driver for Waveshare touchscreen display units.
+  This regulator enables and disables panel power and provides
+  backlight control over I2C.
+
+properties:
+  compatible:
+    const: waveshare,touchscreen-panel-regulator
+
+  reg:
+    maxItems: 1
+    description: I2C address of the regulator device
+
+  vin-supply:
+    description: Input supply regulator for the panel
+
+  enable-gpios:
+    maxItems: 1
+    description: GPIO to enable/disable regulator
+
+required:
+  - compatible
+  - reg
+  - vin-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    /dts-v1/;
+    /plugin/;
+
+    / {
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        gpio: gpio-controller {
+            compatible = "test,gpio";
+            #gpio-cells = <2>;
+        };
+
+        vdd_3v3: regulator {
+            compatible = "regulator-fixed";
+            regulator-name = "vdd_3v3";
+            regulator-min-microvolt = <3300000>;
+            regulator-max-microvolt = <3300000>;
+        };
+
+        i2c@980000 {
+            #address-cells = <1>;
+            #size-cells = <0>;
+            compatible = "test,i2c";
+
+            panel-regulator@3c {
+                compatible = "waveshare,touchscreen-panel-regulator";
+                reg = <0x3c>;
+                vin-supply = <&vdd_3v3>;
+                enable-gpios = <&gpio 2 0>; /* active high */
+            };
+        };
+    };
-- 
2.34.1


