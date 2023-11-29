Return-Path: <linux-arm-msm+bounces-2436-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC037FD5BC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 12:30:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D45CAB21B10
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 11:30:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBF491D544;
	Wed, 29 Nov 2023 11:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TD1HTmbm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D6E0137
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Nov 2023 03:30:26 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5484ef5e3d2so8538723a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Nov 2023 03:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701257424; x=1701862224; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FuoTW5fNts47GPp/zz/U4BPEMqSdOcRJOpgotFGXLGo=;
        b=TD1HTmbmVOmkmbeL7NASVcgXpk+ouNAYhqa6M04Du+3uMpzxq4maeXwhqrsClgsVip
         N4dhPKaWFz/ZYa1y73bmk77rxI2WyyluvtwZRuji/YYtxlWdws4Bi5awxWtdjVYD5TaT
         hYMsV8xZfXc8e4I0ZEu+Oo5wU91ODbqZDCk430YmGFyb+qmcc32vyCbnMNdvhx2bFt2O
         ikgMm0zAQXctXztxAVol+sSJQq9shT7vReFFORbaEwpIP8E9q4SlMY6K6IQucb/2u4CP
         n4ZVVkhTdYWom/IRELsQggGZzp3kJ3oluv/JJ43JzndDPmcAYfb7f6bce9ZEHeW8R6Dy
         Gupw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701257424; x=1701862224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FuoTW5fNts47GPp/zz/U4BPEMqSdOcRJOpgotFGXLGo=;
        b=O9kIf7TfQEKHmuW/DbTLuu6z0xbIFNY2bnQupDYmSK6HvuhaUQoV1Ee5SvHBbu/EAJ
         SNMoP7uOLMYcgWLieP1iCwWLKtJx7CjGfQAcQh/0QW2+tXGBhYP27PF2pT+WiRdYbgxZ
         8eoN31OO5iSdd2wH+SwPpFphFsbUsMk+2v1qCCp45riGlvSPC/aCwUIaT2+43Diim8f6
         cDbNboUuk1btmxK/JuThq5MQb07OxgNDEG2voiMPPaKwUxGchjRfMaMbmINUUVY3G0lN
         Qs7MZ2waUW8stPZ+hW1w6HaS1UNBWFh/14b4va0MlTe4CxNh9jky+HCN6l/pok+8ukHq
         q+2Q==
X-Gm-Message-State: AOJu0YyUsHCwAbJR+KHDCH1JHuzCTpXdIJtaZ6Yr7NJbRHmaIuC0AYie
	WdqYUV6tg0na25J/LmeFMMeKjw==
X-Google-Smtp-Source: AGHT+IEHx5bvhNh2IGOAE7PXOlw27mYMxj7q8yRLiaQc1GYWBHE0clKsOrSLO7MzxHMzKLVRVjkuPw==
X-Received: by 2002:aa7:df0c:0:b0:54b:52c4:68a5 with SMTP id c12-20020aa7df0c000000b0054b52c468a5mr7456394edy.39.1701257424378;
        Wed, 29 Nov 2023 03:30:24 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.109])
        by smtp.gmail.com with ESMTPSA id y5-20020a056402440500b0054af224a87bsm6213829eda.33.2023.11.29.03.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 03:30:24 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 4/4] ASoC: dt-bindings: qcom,lpass-wsa-macro: Add SM8650 LPASS WSA
Date: Wed, 29 Nov 2023 12:30:14 +0100
Message-Id: <20231129113014.38837-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231129113014.38837-1-krzysztof.kozlowski@linaro.org>
References: <20231129113014.38837-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add bindings for Qualcomm SM8650 Low Power Audio SubSystem (LPASS) WSA
macro codec, which looks like compatible with earlier SM8550.

Cc: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/sound/qcom,lpass-wsa-macro.yaml  | 21 ++++++++++++-------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
index eea7609d1b33..5fb39d35c8ec 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
@@ -11,12 +11,16 @@ maintainers:
 
 properties:
   compatible:
-    enum:
-      - qcom,sc7280-lpass-wsa-macro
-      - qcom,sm8250-lpass-wsa-macro
-      - qcom,sm8450-lpass-wsa-macro
-      - qcom,sm8550-lpass-wsa-macro
-      - qcom,sc8280xp-lpass-wsa-macro
+    oneOf:
+      - enum:
+          - qcom,sc7280-lpass-wsa-macro
+          - qcom,sm8250-lpass-wsa-macro
+          - qcom,sm8450-lpass-wsa-macro
+          - qcom,sm8550-lpass-wsa-macro
+          - qcom,sc8280xp-lpass-wsa-macro
+      - items:
+          - const: qcom,sm8650-lpass-wsa-macro
+          - const: qcom,sm8550-lpass-wsa-macro
 
   reg:
     maxItems: 1
@@ -94,8 +98,9 @@ allOf:
   - if:
       properties:
         compatible:
-          enum:
-            - qcom,sm8550-lpass-wsa-macro
+          contains:
+            enum:
+              - qcom,sm8550-lpass-wsa-macro
     then:
       properties:
         clocks:
-- 
2.34.1


