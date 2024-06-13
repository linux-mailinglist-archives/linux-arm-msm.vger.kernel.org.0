Return-Path: <linux-arm-msm+bounces-22663-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD56907FB1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2024 01:44:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9501A28495B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 23:44:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC7D2155CB7;
	Thu, 13 Jun 2024 23:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aXeQyaTH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A18D114D6F9
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2024 23:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718322227; cv=none; b=sMGJhQe2ptav0PY6GBDdx2jKpwCZLNOLfRXqKuwtZjnnCrCY/H9Y2g4Jjmvsfv9Q1ZQ2uePmZ/fnWXJwMCgXxO5CRzr92xDK0mi6gnvMeWRTNcsRWEfa+X6Mtz3alXKMGIH0WbxrGXkG+WqJilp3rqD63mV8GnxHiKgvcWt/J9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718322227; c=relaxed/simple;
	bh=lzuWmQsRHevIFSOU8fqsv8TO85dYE8vzaNEi5gArVS8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bF5jYrUF0g8A2fyN0f8FIzg6uhY0oHRJHXZOqkovwP+Mmatj+tMceBTjnTTUkTSEHjmnhByJwlbxy7Pi4UzmD6kQ9RA6gSknNDZCsWyK3CgJsiwb0QVjpAD6ABJBZFy3D4rtC08FuDGMIY5VLwE9gMtAefdZ+7P73rnr/6rpc3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aXeQyaTH; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2eabd22d3f4so17359551fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2024 16:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718322224; x=1718927024; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sp42j2u8rigijiuxzVvZ7hagCwbbwAjC3ss3o2b1CDw=;
        b=aXeQyaTHc5z4J94m+eXou/tb8xOx2sI+5xBW5vKxze0dSMu6RTl0KE4DTB9rvFm6AV
         ja//TkoaEZUxIAKY0IGMmkIH+3E5oI1HmzbNpCGsZ1wqePH4QzQ/AZ5LQ7UxzrHj9j0Y
         IAXaLgBQjaX6eJEvakM1amgwtLnaaBERJMcr8nx6SnweA99QIxLH7AvhoQ+cbT+enZOu
         mfVCYslscSgK5etBmp6baZi0ZuoXlXoSnIVQLrMpOX2R0xhFuSq+eAO8tT3Ve9vmBtku
         HGpRLIYK8/rRMIBV/tNFgUfA/XsjIn0PttX2D7c5+fArB5L15IVasE+u90E9v1FcnVHx
         qPcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718322224; x=1718927024;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sp42j2u8rigijiuxzVvZ7hagCwbbwAjC3ss3o2b1CDw=;
        b=Z/yoYx/RpREruMc1NTxuSdQ/gRrZf7gNL9Ss+gOAz61QMn1bZLBG2CJ9+7WTGeLruj
         3zIRS619FVxAlcoH9LXHNPZfQhcyiOPhNYBDhg3pa0lf23ImED7bQbMQtTKP0EDwMD+4
         kbeh9ROzKUk0DfHtkMHBcg2szjH/x8dhCxiHyGrrum8eigaZE3ffOPpqaGH7vwCCmdX3
         zlpG0YwySVS/yyVmFirhnU1MTiBYZBguwqdVSoBsG+xUz4L4VsLYzy4uz0U7JUqxtnPP
         IZu9UQyRR7vmZTkinAELtLZ13DMhVeWytyCF3X0CetjcO5X34rYOqtQymqdcy8I40eh4
         txZQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1/vemgF3DPwWoHCdc+3PnEtBu9GdvU/1peixJUTGUoUChCM2BzaX40Z3HM22CHP5r8H6aAVGE5bDiSL/T2dGPt5hzllVndYPqaq6oHg==
X-Gm-Message-State: AOJu0Yy7S14U17rVe7dIHmA0eiMkK/198y3W+UciFcXmjJtpfJI877DB
	clTzUQwgh7y67K77EQ6LW0ng30pVfMtgFeV0XQDjtP1U1ROOISAXd34NVOsbh14=
X-Google-Smtp-Source: AGHT+IEuNwbJD7OzTca/dZTlJpYpULKGk9SL5E9qN7fs6pIOTgq/C1WAMUXhyOWFRGuJtdtCWtntrQ==
X-Received: by 2002:a05:6512:114a:b0:52c:a809:62e9 with SMTP id 2adb3069b0e04-52ca80963f5mr537317e87.0.1718322223573;
        Thu, 13 Jun 2024 16:43:43 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca2872260sm359298e87.142.2024.06.13.16.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 16:43:43 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 14 Jun 2024 02:43:38 +0300
Subject: [PATCH v7 1/6] dt-bindings: platform: Add Lenovo Yoga C630 EC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240614-yoga-ec-driver-v7-1-9f0b9b40ae76@linaro.org>
References: <20240614-yoga-ec-driver-v7-0-9f0b9b40ae76@linaro.org>
In-Reply-To: <20240614-yoga-ec-driver-v7-0-9f0b9b40ae76@linaro.org>
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Nikita Travkin <nikita@trvn.ru>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2676;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=C9Lg3cE1aC1zyYeo+0Q2DO6EQOTcK4wvIXQyDKOKakY=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ1p2i0420+5arVd6Bh9/Lpy954vINjbmUwln425MNlZZy
 rzcsP95J6MxCwMjF4OsmCKLT0HL1JhNyWEfdkythxnEygQyhYGLUwAmUj+Jg6Ghrj3c5+JCjXM6
 OeuDvrO1Zl1ZKcsSKpKxar9XYFfUY7a6i6mCiqo+aTUXdG4bf7yQFc85a8L3sB/lWVynmsIf3Tt
 ZOv1Jv2USx91uhxbzkLWnH62oKD3r9enySZavEnldwVPW1D6RVnins7GG/Y3j88PZP1jaX5SnLF
 yeKyH8u+FU8mYBgYmOJQXc1jc55UzuWh5Z/CPFJmfezCe8yS774gS/T/R82JyqyC/fJfBd3+utz
 Zd3r57Gyl6c+MIz7/yqY4J8cTtYtvaWCO+Ldc2a5JosWxzaG3+aN6zDltFR3aml74xV3noDLpWD
 jBO3uyduYJv1doqXsF9zq+jh554b54uxNV9Nnz9jzs9NAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

From: Bjorn Andersson <andersson@kernel.org>

Add binding for the Embedded Controller found in the Qualcomm
Snapdragon-based Lenovo Yoga C630.

Signed-off-by: Bjorn Andersson <andersson@kernel.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/platform/lenovo,yoga-c630-ec.yaml     | 83 ++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/Documentation/devicetree/bindings/platform/lenovo,yoga-c630-ec.yaml b/Documentation/devicetree/bindings/platform/lenovo,yoga-c630-ec.yaml
new file mode 100644
index 000000000000..3180ce1a22d4
--- /dev/null
+++ b/Documentation/devicetree/bindings/platform/lenovo,yoga-c630-ec.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/platform/lenovo,yoga-c630-ec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Lenovo Yoga C630 Embedded Controller.
+
+maintainers:
+  - Bjorn Andersson <andersson@kernel.org>
+
+description:
+  The Qualcomm Snapdragon-based Lenovo Yoga C630 has an Embedded Controller
+  (EC) which handles things such as battery and USB Type-C. This binding
+  describes the interface, on an I2C bus, to this EC.
+
+properties:
+  compatible:
+    const: lenovo,yoga-c630-ec
+
+  reg:
+    const: 0x70
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+  interrupts:
+    maxItems: 1
+
+patternProperties:
+  '^connector@[01]$':
+    $ref: /schemas/connector/usb-connector.yaml#
+
+    properties:
+      reg:
+        maxItems: 1
+
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |+
+    #include <dt-bindings/interrupt-controller/irq.h>
+    i2c1 {
+        clock-frequency = <400000>;
+
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        embedded-controller@70 {
+            compatible = "lenovo,yoga-c630-ec";
+            reg = <0x70>;
+
+            interrupts-extended = <&tlmm 20 IRQ_TYPE_LEVEL_HIGH>;
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            connector@0 {
+                compatible = "usb-c-connector";
+                reg = <0>;
+                power-role = "source";
+                data-role = "host";
+            };
+
+            connector@1 {
+                compatible = "usb-c-connector";
+                reg = <1>;
+                power-role = "source";
+                data-role = "host";
+            };
+        };
+    };
+...

-- 
2.39.2


