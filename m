Return-Path: <linux-arm-msm+bounces-29750-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FDDA9623A0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 11:38:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D61581F25E75
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 09:38:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 756BB16B384;
	Wed, 28 Aug 2024 09:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mM3/DWTz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA6416A956
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Aug 2024 09:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724837775; cv=none; b=thT1h+v/PsLVJ/fJkmi0sjgezE5bUVRac4y5sqCPFg7S2VZz1lv9XfW2FBMh+jIQYSez2XCQIpZdVWj+msV1AXcCJR4eO4v9SYQT2/yCgoCQXcN0Jrd8cLWDI9GjbFygS2kj+XtusUWXPSrT+5JOy20I3HRwjuAkDBdwIdwcI8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724837775; c=relaxed/simple;
	bh=bfnqlyzaJpLrEgkQnghSy/QuUGq8pRc27uQrIneNjNU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MGq8ZNK93vtQw5V99EyigP6cGBHI89MOhZDlZaBkoWKa0C//Cjc6pInj3jJJgxYrPys8yvj4awez8y89AHkwZS8nG7YFU7m33UTOdT1vy2j3e3Tg5whgDMYu64HSZKNebelVRB7X6ErFhSnBjjD0nBfSDIZKgCWoRgjtwvMTyB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mM3/DWTz; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-42808a69a93so9210715e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Aug 2024 02:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724837772; x=1725442572; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Oqpgi+Ioc4Hh1q2eVNsUH6IqcMRcphlNfWp1+WCdT64=;
        b=mM3/DWTzJUBRjP3FbnyUfqg1wzvld/KhUin8/X8fxABJuehqz0eDN8zeUlmCf8BMBP
         KsTyPGzA4dX/5pR3HbP0ca7tAKaLJPVlWLPXhx7pZKs5z51IWmLSbsv14smo28kB6Ccb
         oXJ5ZXFfpWEDjsXJrnTmCLyqB/XKMRkvamOJQZbXK6GFx/m2cw7K6vjkErjUHh9+zi8m
         4ic6FPBFskutEw/7qTO8mi3xLUFiQiEpMWr5YkEEVdD3W916C0jZZO5Xv6Qwb7oZOYNa
         jiw/moBmf6Ch93qBmo/+jfvnnxp7yyeknHU/yTwD1+RprwHpR78jIrMHkfCwUtQIsmu0
         eoWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724837772; x=1725442572;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Oqpgi+Ioc4Hh1q2eVNsUH6IqcMRcphlNfWp1+WCdT64=;
        b=WwfmQNWqUdbVODFe+dA5YK1JaUsOqDbN0JrM7LRJ9EOt6gmdANLSPzj3ZlPhHTdFNo
         2v0TX1r8FQvmR3NA6+cWpMo5plFK+/UuKmMizynMT/c66pZ3oSZlyFhr9bTda61ubLeX
         IVE1jwO0LM4LxvWLZykFVmhmp6etiBbeeYEurOlvexrcnA9kQErGW7kqc6p7zddU/rHv
         P1xAcbBfZYLg8jfixwyZlrKZY7QCRKwlnO3sqlbkRDzbihnclZZzq2vk8PwLYbn4sB4S
         fs4zxm2dqH68r/z1drxjtRr8IsT9VC6SRWnHryT1tR4ZOINWNkDab1kX/A79V9DocZU2
         U0dQ==
X-Forwarded-Encrypted: i=1; AJvYcCVD3YxipfyerMlEYn3dIoOs7u1XyMO+AvXXOJSD7Wm6hhpYs+3Gn/Gy4xGonIR0NYG62E16rrZVXRSFysVz@vger.kernel.org
X-Gm-Message-State: AOJu0YyROq7HG8DxYB+fVvf+9a6MXGdK+k4HBQJhA5WK9d+uMisGvx1i
	ytzx+ZS4MNUCI0E4LY0eqWTA2ZvS89crM8lkmNiAIqluRnTq0nP6IkXYa04XvR4=
X-Google-Smtp-Source: AGHT+IETpe3b9BGv0n0aM0dnAJ8cS5Q7YY6k14fOQPDFxFj2whk1YkEA+f5mnYL+L6tMMK9TqVfI6w==
X-Received: by 2002:a5d:5889:0:b0:35f:1edb:4695 with SMTP id ffacd0b85a97d-373118b65acmr5912438f8f.6.1724837771829;
        Wed, 28 Aug 2024 02:36:11 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ba63d7d3esm15270825e9.37.2024.08.28.02.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 02:36:11 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 28 Aug 2024 11:35:59 +0200
Subject: [PATCH 3/3] dt-bindings: gpio: simplify GPIO hog nodes schema
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240828-dt-bindings-gpio-hog-v1-3-63b83e47d804@linaro.org>
References: <20240828-dt-bindings-gpio-hog-v1-0-63b83e47d804@linaro.org>
In-Reply-To: <20240828-dt-bindings-gpio-hog-v1-0-63b83e47d804@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Emanuele Ghidoli <emanuele.ghidoli@toradex.com>, 
 Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4308;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=bfnqlyzaJpLrEgkQnghSy/QuUGq8pRc27uQrIneNjNU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmzu+CXWk9x7tyzNeDQFogtsG8zjaPPskp0BUXE
 4KwHhVpHwmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZs7vggAKCRDBN2bmhouD
 11QrEACVIpIu/QhFsBa1s0ikl/l3NZcISpoVtaGfa7CO039p5WWJDGiQvU2XGHmZRqeZrfdigxy
 hORUEVKrYlwVYTYH41liiu5wW9SsB2Ezbh3mkN/zMeb4/Grug6Jv9K2V3JPGfK1+lXI7Q0INRo2
 X5Vnl5ze9n2TtBSd1RFrBBdIMiCUaNvtRGzBDVpNJPazhXLfV1yH4t/wZefomqpGP53ErB5WQBU
 OuFczEFjRPTYG9+9ZKxT5olkt9sLD1qybpcl7hujY4zObNsH3d+BdWZFF3lOyg5V8L3d17wRrqQ
 gNNMqd+BMeDirtt9VAHL/DKwG7BQOASFkKAmb8m7c6GWCNVqMzQQUoB3HVjUmJLTHBZqXqHn/+t
 iuv0CFwwMLUryCG22Bf6q3jhJ0pyoPhxhuvDcHuELlFc+B/To1bJS1vkLwQtgyxw1ijQrrANd1Z
 Hu0BNtzAGLh3VQIt1dehi98Jvi17K7XWJ4dP/bpbX0OQB0b6KyyVJta6jRZXjucgf9m3S0en5ZD
 Qj4V+q+fnifnY779vEX4TDaz4LHU1gNY7fszLKPq/9NNmlGyAVLLWITalO01t3fzxwjoeiI6PRj
 yqteXxBVHnDUnmQGqodOcQ1Hp2SLEWkTQwhKHgi5ppgZo37EwX+VVc1gDJ9bTIwWuSFv1h0runq
 zyPoznFYDtvUFmg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

The core schema in dtschema already strictly defines contents of nodes
with "gpio-hog" property (with additionalProperties: false), thus the
only thing device schema should do is: define "type: object" and
required "gpio-hog".  Make the code a bit simpler by removing redundant
parts.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/gpio/fairchild,74hc595.yaml          | 11 -----------
 Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml     | 11 -----------
 Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml     | 11 -----------
 .../devicetree/bindings/gpio/microchip,mpfs-gpio.yaml        | 12 ------------
 .../devicetree/bindings/gpio/socionext,uniphier-gpio.yaml    | 11 -----------
 5 files changed, 56 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml b/Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml
index c0ad70e66f76..e8bc9f018edb 100644
--- a/Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml
+++ b/Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml
@@ -36,19 +36,8 @@ properties:
 patternProperties:
   "^(hog-[0-9]+|.+-hog(-[0-9]+)?)$":
     type: object
-
-    properties:
-      gpio-hog: true
-      gpios: true
-      output-high: true
-      output-low: true
-      line-name: true
-
     required:
       - gpio-hog
-      - gpios
-
-    additionalProperties: false
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml b/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml
index e1fc8bb6d379..6b06609c649e 100644
--- a/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml
@@ -85,19 +85,8 @@ properties:
 patternProperties:
   "^(hog-[0-9]+|.+-hog(-[0-9]+)?)$":
     type: object
-    properties:
-      gpio-hog: true
-      gpios: true
-      input: true
-      output-high: true
-      output-low: true
-      line-name: true
-
     required:
       - gpio-hog
-      - gpios
-
-    additionalProperties: false
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml b/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
index 51e8390d6b32..7b1eb08fa055 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
+++ b/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
@@ -107,19 +107,8 @@ properties:
 patternProperties:
   "^(hog-[0-9]+|.+-hog(-[0-9]+)?)$":
     type: object
-    properties:
-      gpio-hog: true
-      gpios: true
-      input: true
-      output-high: true
-      output-low: true
-      line-name: true
-
     required:
       - gpio-hog
-      - gpios
-
-    additionalProperties: false
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml b/Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml
index d61569b3f15b..d78da7dd2a56 100644
--- a/Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml
@@ -49,20 +49,8 @@ properties:
 patternProperties:
   "^.+-hog(-[0-9]+)?$":
     type: object
-
-    additionalProperties: false
-
-    properties:
-      gpio-hog: true
-      gpios: true
-      input: true
-      output-high: true
-      output-low: true
-      line-name: true
-
     required:
       - gpio-hog
-      - gpios
 
 allOf:
   - if:
diff --git a/Documentation/devicetree/bindings/gpio/socionext,uniphier-gpio.yaml b/Documentation/devicetree/bindings/gpio/socionext,uniphier-gpio.yaml
index 228fa27ffdc3..36f5a0610471 100644
--- a/Documentation/devicetree/bindings/gpio/socionext,uniphier-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/socionext,uniphier-gpio.yaml
@@ -55,19 +55,8 @@ properties:
 patternProperties:
   "^.+-hog(-[0-9]+)?$":
     type: object
-    properties:
-      gpio-hog: true
-      gpios: true
-      input: true
-      output-high: true
-      output-low: true
-      line-name: true
-
     required:
       - gpio-hog
-      - gpios
-
-    additionalProperties: false
 
 required:
   - compatible

-- 
2.43.0


