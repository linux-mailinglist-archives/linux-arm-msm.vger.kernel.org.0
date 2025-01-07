Return-Path: <linux-arm-msm+bounces-44138-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 74AF3A04020
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 13:59:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B93C188829F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 12:59:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B99B1F12FA;
	Tue,  7 Jan 2025 12:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vI7nhjo2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B74761F0E25
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jan 2025 12:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736254732; cv=none; b=qxH/Yit9CqMaKc7fCwJpWooqAOCDD9ECpKnJjNOg86GhOzm+l56JbeBQHRSgR6CjVGnPvd4n32LkjSUaLss/jiBL7ukjpgblL85HbFgEQUErUc+rHp37Rlg5AJseNG1Q5IPKR2POLMf63FIX8sTy0jBXNKzC8zeI1WTSRxwdRo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736254732; c=relaxed/simple;
	bh=wlaO3AJ9OYX0Qw7UHvKhMLm6zO8rWmjR4OwCAC6whc8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BG5x3ObCE+9RWiVy6mocu6pSkyKud5joKhdbM9lu0ix+Q/f0utZvhCdla7xn0wAQXOYZ4T36/qiGU0SCst8mFbzNlJnhuPW6sNPnAEC/9QG6pK9L1wxiHaG0K4vOUGljEV+55u6G+8SCEWGyuURRGX85TW05gDqyUjk7YatqHqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vI7nhjo2; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-385e0d47720so983511f8f.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jan 2025 04:58:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736254727; x=1736859527; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5C/sFNAXY8klp3trjE/Y4l07v3FNmgHaHglxAlB5FO4=;
        b=vI7nhjo2ultK/+6l4WypuSY6FwPnaOFAlLlCopH3I03YGE31gHbH/oJmjvLOqhkeuU
         u/4Sj+DBsmoNBriBPEoE9xpHjle41qV9kjAvCh4WtVhLjWJi5Kg2vsUAs4hP38pEaw+Q
         tkhP4kL1WpwV0WnpHMJFdmtM5ZjSLwCBxOGw/kWVdSy61qZnzbx5RNv7U1KMuwifif3n
         WiAodCktCH+IGKNwdc2/vMVWRMA2nemPLTfaXphLykfSe5dSS3nGdS0Xcm22Qbi3NTn6
         dsFutTDKXsdW2s/J/Fi6i7styn0e/zlKT5HNO2EMqbK/YiUk905CgTAC0vjNGVP7DOLv
         4vFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736254727; x=1736859527;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5C/sFNAXY8klp3trjE/Y4l07v3FNmgHaHglxAlB5FO4=;
        b=o0QVmxgwSCeU/WRCEAAZ9X/HCwmhJGvbl71wXAIT6nI8ETR7H2cjjsL0WIHvVf1TSD
         M95UFehiP+rqB4ZldQeIeeOWYsZdZyUpO550+2fTiUAjq8xW1cSNmLsmIpMZ7Ow4/ZWP
         TuqNS9xx7QQyrt4jGO/iiiUn7LN79vdqxvrqXY5wD6P9i+reeg+Fl4o0Nov8R7bqsJ31
         3GgPNqFZuULaoSME2iJCj23YpzJSfj5YoPYdqcUISJEUHHnkiD96QaMncwJfPYLDSwll
         y4E3UDk/hid3Ebhj3pee4TPcEcLZ2Oazeboj+tlc60Satdf55wcwdbRp/hA9InolFHzr
         ZIXA==
X-Forwarded-Encrypted: i=1; AJvYcCXQbi+KS5MjGChjwl9KekuEkk8h+qHSNBylGlzkbydnBdmgmitmZbeVcgt047rAr36Z2HjL9hRGZUQUKFgA@vger.kernel.org
X-Gm-Message-State: AOJu0YxbipbOfqUz5ZWdMSjl3THxqH7t0a3X0JD8/6u0HFfLtNI8eD69
	QIm7b+q3jaSVv64F6uf+RaQb4G5R9+fM9aL9i2bWPFosqyvLvFgH5FUFuICjzJg=
X-Gm-Gg: ASbGncuVfSJ4w+SAKBGtjPkMjEj0XI5JMRyGiURp+EAjxTmKofLJbuUq04Rpf4h+Dav
	GDsjaN3kRSzAEQRQDfnIbJ6cAx5NZeBC9QtSLrmSktJfkVsai+j6qWcgWjMBeYym8Y1T0Ghe+WP
	draUGTYu3ztrZ51y/ZlAzuQalrdF7zJ2RgOIKNd2YeoqjB3XYhRZm/xclth3rY5rSQ5KMHgTzuu
	VE0+e1bRBgVSmbJgFAY8CSwrmqxRaaB4tRmeIRWtg0RRc1g2K1KgmoKLk9a36t2ywxODXY=
X-Google-Smtp-Source: AGHT+IESBLWYlSIfi7wxN2DEKQk+daQDclS6+lJaW/+8/BxClMnBziT40HZf7Tg1VR2FDiFfnUZ+3g==
X-Received: by 2002:a5d:5f8f:0:b0:385:dd10:213f with SMTP id ffacd0b85a97d-38a223f5cb1mr22351728f8f.9.1736254726977;
        Tue, 07 Jan 2025 04:58:46 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b11aecsm629480935e9.23.2025.01.07.04.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 04:58:46 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Marek Vasut <marex@denx.de>,
	linux-arm-msm@vger.kernel.org,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: input: Correct indentation and style in DTS example
Date: Tue,  7 Jan 2025 13:58:43 +0100
Message-ID: <20250107125844.226466-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

DTS example in the bindings should be indented with 2- or 4-spaces and
aligned with opening '- |', so correct any differences like 3-spaces or
mixtures 2- and 4-spaces in one binding.

No functional changes here, but saves some comments during reviews of
new patches built on existing code.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/input/qcom,pm8921-keypad.yaml    | 46 +++++++++----------
 .../bindings/input/qcom,pm8921-pwrkey.yaml    | 36 +++++++--------
 .../input/touchscreen/ti,ads7843.yaml         | 30 ++++++------
 3 files changed, 56 insertions(+), 56 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/qcom,pm8921-keypad.yaml b/Documentation/devicetree/bindings/input/qcom,pm8921-keypad.yaml
index 88764adcd696..e03611eef93d 100644
--- a/Documentation/devicetree/bindings/input/qcom,pm8921-keypad.yaml
+++ b/Documentation/devicetree/bindings/input/qcom,pm8921-keypad.yaml
@@ -62,28 +62,28 @@ unevaluatedProperties: false
 
 examples:
   - |
-   #include <dt-bindings/input/input.h>
-   #include <dt-bindings/interrupt-controller/irq.h>
-   pmic {
-       #address-cells = <1>;
-       #size-cells = <0>;
+    #include <dt-bindings/input/input.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    pmic {
+        #address-cells = <1>;
+        #size-cells = <0>;
 
-       keypad@148 {
-           compatible = "qcom,pm8921-keypad";
-           reg = <0x148>;
-           interrupt-parent = <&pmicintc>;
-           interrupts = <74 IRQ_TYPE_EDGE_RISING>, <75 IRQ_TYPE_EDGE_RISING>;
-           linux,keymap = <
-               MATRIX_KEY(0, 0, KEY_VOLUMEUP)
-               MATRIX_KEY(0, 1, KEY_VOLUMEDOWN)
-               MATRIX_KEY(0, 2, KEY_CAMERA_FOCUS)
-               MATRIX_KEY(0, 3, KEY_CAMERA)
-           >;
-           keypad,num-rows = <1>;
-           keypad,num-columns = <5>;
-           debounce = <15>;
-           scan-delay = <32>;
-           row-hold = <91500>;
-       };
-   };
+        keypad@148 {
+            compatible = "qcom,pm8921-keypad";
+            reg = <0x148>;
+            interrupt-parent = <&pmicintc>;
+            interrupts = <74 IRQ_TYPE_EDGE_RISING>, <75 IRQ_TYPE_EDGE_RISING>;
+            linux,keymap = <
+                MATRIX_KEY(0, 0, KEY_VOLUMEUP)
+                MATRIX_KEY(0, 1, KEY_VOLUMEDOWN)
+                MATRIX_KEY(0, 2, KEY_CAMERA_FOCUS)
+                MATRIX_KEY(0, 3, KEY_CAMERA)
+            >;
+            keypad,num-rows = <1>;
+            keypad,num-columns = <5>;
+            debounce = <15>;
+            scan-delay = <32>;
+            row-hold = <91500>;
+        };
+    };
 ...
diff --git a/Documentation/devicetree/bindings/input/qcom,pm8921-pwrkey.yaml b/Documentation/devicetree/bindings/input/qcom,pm8921-pwrkey.yaml
index 12c74c083258..64590894857a 100644
--- a/Documentation/devicetree/bindings/input/qcom,pm8921-pwrkey.yaml
+++ b/Documentation/devicetree/bindings/input/qcom,pm8921-pwrkey.yaml
@@ -52,24 +52,24 @@ unevaluatedProperties: false
 
 examples:
   - |
-   #include <dt-bindings/interrupt-controller/irq.h>
-   ssbi {
-     #address-cells = <1>;
-     #size-cells = <0>;
+    #include <dt-bindings/interrupt-controller/irq.h>
+    ssbi {
+        #address-cells = <1>;
+        #size-cells = <0>;
 
-     pmic@0 {
-       reg = <0x0>;
-       #address-cells = <1>;
-       #size-cells = <0>;
+        pmic@0 {
+            reg = <0x0>;
+            #address-cells = <1>;
+            #size-cells = <0>;
 
-       pwrkey@1c {
-         compatible = "qcom,pm8921-pwrkey";
-         reg = <0x1c>;
-         interrupt-parent = <&pmicint>;
-         interrupts = <50 IRQ_TYPE_EDGE_RISING>, <51 IRQ_TYPE_EDGE_RISING>;
-         debounce = <15625>;
-         pull-up;
-       };
-     };
-   };
+            pwrkey@1c {
+                compatible = "qcom,pm8921-pwrkey";
+                reg = <0x1c>;
+                interrupt-parent = <&pmicint>;
+                interrupts = <50 IRQ_TYPE_EDGE_RISING>, <51 IRQ_TYPE_EDGE_RISING>;
+                debounce = <15625>;
+                pull-up;
+            };
+        };
+    };
 ...
diff --git a/Documentation/devicetree/bindings/input/touchscreen/ti,ads7843.yaml b/Documentation/devicetree/bindings/input/touchscreen/ti,ads7843.yaml
index 604921733d2c..8f6335d7da1c 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/ti,ads7843.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/ti,ads7843.yaml
@@ -164,20 +164,20 @@ examples:
         #size-cells = <0>;
 
         touchscreen@0 {
-           compatible = "ti,tsc2046";
-           reg = <0>;	/* CS0 */
-           interrupt-parent = <&gpio1>;
-           interrupts = <8 0>;	/* BOOT6 / GPIO 8 */
-           pendown-gpio = <&gpio1 8 0>;
-           spi-max-frequency = <1000000>;
-           vcc-supply = <&reg_vcc3>;
-           wakeup-source;
+            compatible = "ti,tsc2046";
+            reg = <0>;	/* CS0 */
+            interrupt-parent = <&gpio1>;
+            interrupts = <8 0>;	/* BOOT6 / GPIO 8 */
+            pendown-gpio = <&gpio1 8 0>;
+            spi-max-frequency = <1000000>;
+            vcc-supply = <&reg_vcc3>;
+            wakeup-source;
 
-           ti,pressure-max = /bits/ 16 <255>;
-           ti,x-max = /bits/ 16 <8000>;
-           ti,x-min = /bits/ 16 <0>;
-           ti,x-plate-ohms = /bits/ 16 <40>;
-           ti,y-max = /bits/ 16 <4800>;
-           ti,y-min = /bits/ 16 <0>;
-       };
+            ti,pressure-max = /bits/ 16 <255>;
+            ti,x-max = /bits/ 16 <8000>;
+            ti,x-min = /bits/ 16 <0>;
+            ti,x-plate-ohms = /bits/ 16 <40>;
+            ti,y-max = /bits/ 16 <4800>;
+            ti,y-min = /bits/ 16 <0>;
+        };
     };
-- 
2.43.0


