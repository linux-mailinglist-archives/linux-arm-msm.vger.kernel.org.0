Return-Path: <linux-arm-msm+bounces-7293-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F38BA82DF3B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jan 2024 19:21:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 78E8B1F22CB0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jan 2024 18:21:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B23251862B;
	Mon, 15 Jan 2024 18:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RtFGMwdL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5DDB182DF
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jan 2024 18:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-557e76e1bd6so8705828a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jan 2024 10:20:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705342834; x=1705947634; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Pk9BYAlXOny5vx7IIMl1r8Ckvn8t89LgHQENG37+b/I=;
        b=RtFGMwdLlpA2K61X0/3BwNSIPMZCsvQ6g8czvocxlf6ZcBG2+7dVmU54zuaI5Wj0h+
         2nf64vQBEUIj2brXPxXq+gz5eB5JjfHQTojckyYyvQiZwIrmg4rKYFmGC1HpUNw++bjA
         Z0I/+OARYDGYC8yytMmLOFiR6LiYiLavtV99iOl3y9sVENMPp5gkvmBpjV98MmI7EBbE
         BTgWuyusqzRuYIyKorazBjF7iC9zJDXw3Up3ugVQx7zqvG9g7n7CB3WBsH93iifhCj8C
         ahwePWI3pl20ZP3fnfeyWi96KNQvc5fnjM336mmFwPZumAVr+9QPISVB4cIDV/kOdsSv
         CecQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705342834; x=1705947634;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pk9BYAlXOny5vx7IIMl1r8Ckvn8t89LgHQENG37+b/I=;
        b=jqGS/VMVuMCgS0Z48x+OoLJNnPdmzaNSV/7U5hZ6fo6PnS9Acx0TWw1e+O+tMH8AY7
         R2MQ93wFEhIxFkzLY8RgU3yWLyV1aIGlFvwjbp4aB5vqb4/yxFGNc8m4XqWbW/7No3Ei
         Safcg42427nq1BioLmmz3dOopGH0Jq1gi+bFpCglo7PC14/XJMRdycIEXGFnVHyOC7/p
         /Kygo2XqgWXSZnP2XTDJmWTRixsUFZQImH7higCFn5d5irI8Jetwc0556rkAJjPA7chI
         TDRL8PYPdhpTJIVrEIUg4V37xmucwtVlz2xi5sEHg2oJLxQNEGUAjZn15iilW1EnRG9l
         xfrw==
X-Gm-Message-State: AOJu0YzKGwXoHf78SdYwI4wJQitgJMMkjIESpkgYzajoauYckuBZvioT
	RKpbegGXLV3ybt9jFhjhK5bO6cDVcXJoHQ==
X-Google-Smtp-Source: AGHT+IE8Rv7TALy6QHOmV7wneFYPZJqN4DYMVXyzwYotmqd3ln8eAYgtdWF5rpaj14WiTEjiCunTIQ==
X-Received: by 2002:a17:907:c24d:b0:a2e:49a4:fabe with SMTP id tj13-20020a170907c24d00b00a2e49a4fabemr138108ejc.16.1705342834090;
        Mon, 15 Jan 2024 10:20:34 -0800 (PST)
Received: from krzk-bin.. ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id n11-20020a170906118b00b00a2bd02d5f7asm5591970eja.148.2024.01.15.10.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jan 2024 10:20:33 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Tinghan Shen <tinghan.shen@mediatek.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bhupesh Sharma <bhupesh.sharma@linaro.org>,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: remoteproc: do not override firmware-name $ref
Date: Mon, 15 Jan 2024 19:20:31 +0100
Message-Id: <20240115182031.1610088-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dtschema package defines firmware-name as string-array, so individual
bindings should not make it a string but instead just narrow the number
of expected firmware file names.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml     | 4 ++--
 .../devicetree/bindings/remoteproc/qcom,qcs404-pas.yaml       | 2 +-
 .../devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml       | 2 +-
 .../devicetree/bindings/remoteproc/qcom,sc7280-wpss-pil.yaml  | 2 +-
 .../devicetree/bindings/remoteproc/qcom,sc8180x-pas.yaml      | 2 +-
 .../devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml       | 2 +-
 .../devicetree/bindings/remoteproc/qcom,sm6350-pas.yaml       | 2 +-
 .../devicetree/bindings/remoteproc/qcom,sm6375-pas.yaml       | 2 +-
 .../devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml       | 2 +-
 .../devicetree/bindings/remoteproc/qcom,sm8350-pas.yaml       | 2 +-
 .../devicetree/bindings/remoteproc/qcom,wcnss-pil.yaml        | 2 +-
 11 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
index 09102dda4942..507f98f73d23 100644
--- a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
@@ -47,7 +47,7 @@ properties:
     maxItems: 1
 
   firmware-name:
-    $ref: /schemas/types.yaml#/definitions/string
+    maxItems: 1
     description:
       If present, name (or relative path) of the file within the
       firmware search path containing the firmware image used when
@@ -115,7 +115,7 @@ patternProperties:
         maxItems: 1
 
       firmware-name:
-        $ref: /schemas/types.yaml#/definitions/string
+        maxItems: 1
         description:
           If present, name (or relative path) of the file within the
           firmware search path containing the firmware image used when
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,qcs404-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,qcs404-pas.yaml
index eb868a7ff4cd..ad45fd00ae34 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,qcs404-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,qcs404-pas.yaml
@@ -46,7 +46,7 @@ properties:
     description: Reference to the reserved-memory for the Hexagon core
 
   firmware-name:
-    $ref: /schemas/types.yaml#/definitions/string
+    maxItems: 1
     description: Firmware name for the Hexagon core
 
 required:
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml
index c054b84fdcd5..66b455d0a8e3 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml
@@ -45,7 +45,7 @@ properties:
   smd-edge: false
 
   firmware-name:
-    $ref: /schemas/types.yaml#/definitions/string
+    maxItems: 1
     description: Firmware name for the Hexagon core
 
 required:
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-wpss-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-wpss-pil.yaml
index b6bd33438584..9381c7022ff4 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-wpss-pil.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-wpss-pil.yaml
@@ -80,7 +80,7 @@ properties:
     description: Reference to the reserved-memory for the Hexagon core
 
   firmware-name:
-    $ref: /schemas/types.yaml#/definitions/string
+    maxItems: 1
     description:
       The name of the firmware which should be loaded for this remote
       processor.
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sc8180x-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sc8180x-pas.yaml
index 4744a37b2b5d..45ee9fbe0966 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sc8180x-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sc8180x-pas.yaml
@@ -42,7 +42,7 @@ properties:
     description: Reference to the reserved-memory for the Hexagon core
 
   firmware-name:
-    $ref: /schemas/types.yaml#/definitions/string
+    maxItems: 1
     description: Firmware name for the Hexagon core
 
 required:
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml
index 028287235912..758adb06c8dd 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml
@@ -47,7 +47,7 @@ properties:
   smd-edge: false
 
   firmware-name:
-    $ref: /schemas/types.yaml#/definitions/string
+    maxItems: 1
     description: Firmware name for the Hexagon core
 
 required:
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm6350-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm6350-pas.yaml
index f7e40fb166da..c1a3cc308bdb 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm6350-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm6350-pas.yaml
@@ -42,7 +42,7 @@ properties:
   smd-edge: false
 
   firmware-name:
-    $ref: /schemas/types.yaml#/definitions/string
+    maxItems: 1
     description: Firmware name for the Hexagon core
 
 required:
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm6375-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm6375-pas.yaml
index 3e4a03eb4532..7286b2baa19f 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm6375-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm6375-pas.yaml
@@ -36,7 +36,7 @@ properties:
     description: Reference to the reserved-memory for the Hexagon core
 
   firmware-name:
-    $ref: /schemas/types.yaml#/definitions/string
+    maxItems: 1
     description: Firmware name for the Hexagon core
 
   smd-edge: false
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml
index 238c6e5e67c5..d67386c50fa4 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml
@@ -46,7 +46,7 @@ properties:
   smd-edge: false
 
   firmware-name:
-    $ref: /schemas/types.yaml#/definitions/string
+    maxItems: 1
     description: Firmware name for the Hexagon core
 
 required:
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8350-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8350-pas.yaml
index 53cea8e53a31..4b9fb74fb9e9 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8350-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8350-pas.yaml
@@ -47,7 +47,7 @@ properties:
     description: Reference to the reserved-memory for the Hexagon core
 
   firmware-name:
-    $ref: /schemas/types.yaml#/definitions/string
+    maxItems: 1
     description: Firmware name for the Hexagon core
 
 required:
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.yaml
index 45eb42bd3c2c..8e033b22d28c 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.yaml
@@ -51,7 +51,7 @@ properties:
       - const: stop-ack
 
   firmware-name:
-    $ref: /schemas/types.yaml#/definitions/string
+    maxItems: 1
     description:
       Relative firmware image path for the WCNSS core. Defaults to
       "wcnss.mdt".
-- 
2.34.1


