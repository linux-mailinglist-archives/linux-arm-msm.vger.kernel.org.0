Return-Path: <linux-arm-msm+bounces-4064-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B5CB780AF2D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 22:56:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5AF3F1F2119E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 21:56:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E8A95915C;
	Fri,  8 Dec 2023 21:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HN2Axzd1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7AB41BFC
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Dec 2023 13:56:05 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-40c236624edso26707085e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Dec 2023 13:56:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702072564; x=1702677364; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UvC2I0iVSlYBpEavv2s399rriLt9p7Wi8wI8jxxuqwI=;
        b=HN2Axzd1k7d5XS15kimiPVxU/tBKxHzYrL72HmoeMTvfHdMvqvTy3M4GX9yGjcA5Wc
         sAjNH2no70KagIU9EO3dJT5PsuDzZ69p+PPNQLlJpAA5qOLd48Kga2zVZQjkWM2BFNZ+
         KVmHvcznwy1iF1fgc4x+ctb3hUuUCeC/pn43lg75gZtX56qRExyxnHfo7OiZpnLTjuCy
         e/NHCJgSbBsuI2pyvzd2q1bQwBQNUjNfoXrjIQd4X8t+XWcteR6HRIawztpzolOngQso
         rjVH40aJ5W2OBtDjZzxELvLFmsJaJJtoDhI8DSIXAQ5UWM1kk60QpW9yxAb8FvLuuVpE
         6obg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702072564; x=1702677364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UvC2I0iVSlYBpEavv2s399rriLt9p7Wi8wI8jxxuqwI=;
        b=F3R7niM5hMJpDUBYJqirxEzQDb232EP5YoPQBFpbe1S9Lyu4T3iwa4He1UDtQM+Lrs
         dO0NUD7coc3q2iKqT1K/SMwpWl32ASYucXHKHqvCaplRQBOeM3tRmY6WRwsGRNRnEFHp
         UhKAI8czIxwVRAKRdoPYA+e9TiK6xQXd7Ka4ta6xf4PxtQ/gK6/BtRMEWnVd7b3qwz2/
         i/0iV4go/SKUDW/BJzWpMzfEe2Vw6j7cCoRllD1qGC16lSCtpw/4HX/Bm1Iv3izCArtT
         Rk2/LY0uhFD5o66CyGFleiJCR5dH3+L59cUANORvbe9J2g0wtlsBfc2R1hv+kZu4Du/L
         XUZQ==
X-Gm-Message-State: AOJu0Yws9BuaRWXyyd8yivBpp2LR1McVooaBbmLy6ejrVmAvKyj7SOGS
	RdB/60AXFb02BEu0jnfBHYWblw==
X-Google-Smtp-Source: AGHT+IHLd+VpGbjg/tFEPW8k1pPQPgy1gAyO7UJpce+iYdBJ5bhqIvWJcUX+OVaIvYh3JG9cQw8pSw==
X-Received: by 2002:a05:600c:3542:b0:401:b2c7:34a8 with SMTP id i2-20020a05600c354200b00401b2c734a8mr364557wmq.7.1702072563935;
        Fri, 08 Dec 2023 13:56:03 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id r20-20020a05600c459400b0040b349c91acsm6321789wmo.16.2023.12.08.13.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 13:56:03 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Stephan Gerhold <stephan@gerhold.net>,
	Shawn Guo <shawn.guo@linaro.org>,
	Melody Olvera <quic_molvera@quicinc.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Richard Acayan <mailingradian@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	krishna Lanka <quic_vamslank@quicinc.com>,
	Rohit Agarwal <quic_rohiagar@quicinc.com>,
	Iskren Chernev <me@iskren.info>,
	Martin Botka <martin.botka@somainline.org>,
	Danila Tikhonov <danila@jiaxyga.com>,
	Abel Vesa <abel.vesa@linaro.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 10/10] dt-bindings: pinctrl: qcom: drop common properties and allow wakeup-parent
Date: Fri,  8 Dec 2023 22:55:34 +0100
Message-Id: <20231208215534.195854-10-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231208215534.195854-1-krzysztof.kozlowski@linaro.org>
References: <20231208215534.195854-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop common properties already defined in referenced common Qualcomm SoC
TLMM bindings and use "unevaluatedProperties: false".  This makes the
binding smaller and easier to review.  Additionally this allows now
"wakeup-parent" property coming from common TLMM bindings.

In few places move the "required:" block to bottom, to match convention.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/pinctrl/qcom,ipq6018-pinctrl.yaml |  8 +-------
 .../bindings/pinctrl/qcom,mdm9615-pinctrl.yaml | 18 ++++++------------
 .../bindings/pinctrl/qcom,msm8226-pinctrl.yaml |  8 +-------
 .../bindings/pinctrl/qcom,msm8953-pinctrl.yaml |  7 +------
 .../bindings/pinctrl/qcom,sdx55-pinctrl.yaml   |  8 +-------
 .../bindings/pinctrl/qcom,sdx65-tlmm.yaml      |  8 +-------
 6 files changed, 11 insertions(+), 46 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml
index 7c3e5e043f07..ed00fbaec11b 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml
@@ -22,12 +22,6 @@ properties:
   interrupts:
     maxItems: 1
 
-  interrupt-controller: true
-  "#interrupt-cells": true
-  gpio-controller: true
-  "#gpio-cells": true
-  gpio-ranges: true
-
 patternProperties:
   "-state$":
     oneOf:
@@ -100,7 +94,7 @@ required:
   - compatible
   - reg
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,mdm9615-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,mdm9615-pinctrl.yaml
index 5885aee95c98..299e0b4b0ab4 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,mdm9615-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,mdm9615-pinctrl.yaml
@@ -23,18 +23,6 @@ properties:
   interrupts:
     maxItems: 1
 
-  interrupt-controller: true
-  '#interrupt-cells': true
-  gpio-controller: true
-  '#gpio-cells': true
-  gpio-ranges: true
-
-required:
-  - compatible
-  - reg
-
-additionalProperties: false
-
 patternProperties:
   "-state$":
     oneOf:
@@ -74,6 +62,12 @@ $defs:
     required:
       - pins
 
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
 examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml
index a602bf0d27fb..68d3fa2105b8 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml
@@ -23,12 +23,6 @@ properties:
   interrupts:
     maxItems: 1
 
-  interrupt-controller: true
-  "#interrupt-cells": true
-  gpio-controller: true
-  "#gpio-cells": true
-  gpio-ranges: true
-
   gpio-reserved-ranges:
     maxItems: 1
 
@@ -82,7 +76,7 @@ required:
   - compatible
   - reg
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,msm8953-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,msm8953-pinctrl.yaml
index 798aac9e6e31..8a3a962f6c00 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,msm8953-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,msm8953-pinctrl.yaml
@@ -22,12 +22,7 @@ properties:
   interrupts:
     maxItems: 1
 
-  interrupt-controller: true
-  "#interrupt-cells": true
-  gpio-controller: true
   gpio-reserved-ranges: true
-  "#gpio-cells": true
-  gpio-ranges: true
 
 patternProperties:
   "-state$":
@@ -117,7 +112,7 @@ required:
   - compatible
   - reg
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sdx55-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sdx55-pinctrl.yaml
index 67af99dd8f14..edbcff92bbf9 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sdx55-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sdx55-pinctrl.yaml
@@ -23,12 +23,6 @@ properties:
   interrupts:
     maxItems: 1
 
-  interrupt-controller: true
-  "#interrupt-cells": true
-  gpio-controller: true
-  "#gpio-cells": true
-  gpio-ranges: true
-
   gpio-reserved-ranges:
     maxItems: 1
 
@@ -102,7 +96,7 @@ required:
   - compatible
   - reg
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sdx65-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sdx65-tlmm.yaml
index 27319782d94b..a31b638c456d 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sdx65-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sdx65-tlmm.yaml
@@ -22,12 +22,6 @@ properties:
   interrupts:
     maxItems: 1
 
-  interrupt-controller: true
-  "#interrupt-cells": true
-  gpio-controller: true
-  "#gpio-cells": true
-  gpio-ranges: true
-
   gpio-reserved-ranges:
     maxItems: 1
 
@@ -122,7 +116,7 @@ required:
   - compatible
   - reg
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.34.1


