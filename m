Return-Path: <linux-arm-msm+bounces-512-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 691117E8CAC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Nov 2023 21:49:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D45F9B20A6B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Nov 2023 20:49:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA3CD1D6BA;
	Sat, 11 Nov 2023 20:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Knht1UNn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA7621D6B6
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Nov 2023 20:49:29 +0000 (UTC)
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5A4630D1
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Nov 2023 12:49:27 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-40790b0a224so23886155e9.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Nov 2023 12:49:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699735766; x=1700340566; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dw1ndMUKXNlOHoymKchXozvXFQJ/Nc6du3K0pUpN4dE=;
        b=Knht1UNnnReKyyOUyIxQYPEiqrYAMZTAS8ABU8k4wryRg2P4WLUuVSYQNs9qCbmClg
         eodUBLtzMI84C+U9JtcgWq0JjAiriuUP851fx/jSXZxIw3JjyIKi/CP7IuwNqzN5PQIf
         WPk0njd+uzxtoHA2p660/JL5MLihqyRlkunZlIsWLU4FFWEMOtm75+6ouHcIyeN/a4z7
         OcKQ8tEqiVAv6PiJBu9MOQzvXXSAVekfNtZHbDwwWTsEaka54hRYcf1KHpwWuaSTv5mp
         VoXCBBZCxC6taKZq9rv2lEGozfAP/B9dJJaG9chVBfcb4irhpG1Wqfifz0dHoHeD+Sd9
         o96A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699735766; x=1700340566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dw1ndMUKXNlOHoymKchXozvXFQJ/Nc6du3K0pUpN4dE=;
        b=KacTVYPgXgO81QGPGEIfZV1Sr9d6OE0ilZnfjnLATGWkhkKugJnX3Ki4NIacuJYIRD
         LGzFdUW4a89ndm6J9zlTWoEEGaVKVFI/7Qb0njTFJFvA/kaHzB0LFT/8MZ6j9RDKcB9S
         3FMVbOC1E6Iw2vOdDZeCndWaYh61506tL3t11PUSeKz+GLMPejmvgQGT/JNs9NfjtnpX
         3WJrjlV9h7WTaPfOtwo4PzFtP9vYdBW9gGLfztT8EtgbrSUCawQpuuUJZRyrYg9Kb8yc
         QgOfYUWEE5NYoyxbl1UCVUE340P3bPm71IgIe7fkoHgGuouAE1SvqbngkS1gqWf1ErMa
         OP7w==
X-Gm-Message-State: AOJu0YzvKVDBQ5Qgb2GY0IWe24jQQHR5UR2EEsRexSRTDjAeV/tXvTqC
	5K2wcEI+psXqvy4ODnZ/hiEHGg==
X-Google-Smtp-Source: AGHT+IHwyADDQ32c2vAVYWbY0ldc5G22Q5ofdEvFs0Khl5+4IjTJkGO1Xg5TMvnTF2kdHAE5FFay9g==
X-Received: by 2002:a05:600c:4689:b0:408:37aa:4766 with SMTP id p9-20020a05600c468900b0040837aa4766mr2219387wmo.5.1699735766179;
        Sat, 11 Nov 2023 12:49:26 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id t9-20020a05600c198900b00407752bd834sm3121226wmq.1.2023.11.11.12.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Nov 2023 12:49:25 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v5 2/3] dt-bindings: mailbox: qcom,apcs-kpss-global: use fallbacks
Date: Sat, 11 Nov 2023 21:49:15 +0100
Message-Id: <20231111204916.35835-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231111204916.35835-1-krzysztof.kozlowski@linaro.org>
References: <20231111204916.35835-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rework the compatibles and group devices which have similar interface
(same from Linux driver point of view) as compatible.  This allows
smaller of_device_id table in the Linux driver and smaller
allOf:if:then: constraints.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../mailbox/qcom,apcs-kpss-global.yaml        | 61 +++++++++++++------
 1 file changed, 43 insertions(+), 18 deletions(-)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
index a22c8640dc0e..79eb523b8436 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
@@ -23,6 +23,24 @@ properties:
               - qcom,ipq8074-apcs-apps-global
               - qcom,ipq9574-apcs-apps-global
           - const: qcom,ipq6018-apcs-apps-global
+      - items:
+          - enum:
+              - qcom,qcs404-apcs-apps-global
+          - const: qcom,msm8916-apcs-kpss-global
+          - const: syscon
+      - items:
+          - enum:
+              - qcom,msm8976-apcs-kpss-global
+          - const: qcom,msm8994-apcs-kpss-global
+          - const: syscon
+      - items:
+          - enum:
+              - qcom,msm8998-apcs-hmss-global
+              - qcom,sdm660-apcs-hmss-global
+              - qcom,sm4250-apcs-hmss-global
+              - qcom,sm6115-apcs-hmss-global
+              - qcom,sm6125-apcs-hmss-global
+          - const: qcom,msm8994-apcs-kpss-global
       - items:
           - enum:
               - qcom,sc7180-apss-shared
@@ -34,21 +52,14 @@ properties:
               - qcom,msm8916-apcs-kpss-global
               - qcom,msm8939-apcs-kpss-global
               - qcom,msm8953-apcs-kpss-global
-              - qcom,msm8976-apcs-kpss-global
               - qcom,msm8994-apcs-kpss-global
-              - qcom,qcs404-apcs-apps-global
               - qcom,sdx55-apcs-gcc
           - const: syscon
       - enum:
           - qcom,ipq6018-apcs-apps-global
           - qcom,msm8996-apcs-hmss-global
-          - qcom,msm8998-apcs-hmss-global
           - qcom,qcm2290-apcs-hmss-global
-          - qcom,sdm660-apcs-hmss-global
           - qcom,sdm845-apss-shared
-          - qcom,sm4250-apcs-hmss-global
-          - qcom,sm6115-apcs-hmss-global
-          - qcom,sm6125-apcs-hmss-global
 
   reg:
     maxItems: 1
@@ -79,10 +90,9 @@ allOf:
   - if:
       properties:
         compatible:
-          enum:
-            - qcom,msm8916-apcs-kpss-global
-            - qcom,msm8939-apcs-kpss-global
-            - qcom,qcs404-apcs-apps-global
+          contains:
+            enum:
+              - qcom,msm8916-apcs-kpss-global
     then:
       properties:
         clocks:
@@ -94,6 +104,25 @@ allOf:
             - const: pll
             - const: aux
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,msm8939-apcs-kpss-global
+    then:
+      properties:
+        clocks:
+          items:
+            - description: primary pll parent of the clock driver
+            - description: auxiliary parent
+            - description: reference clock
+        clock-names:
+          items:
+            - const: pll
+            - const: aux
+            - const: ref
+
   - if:
       properties:
         compatible:
@@ -112,6 +141,7 @@ allOf:
             - const: ref
             - const: pll
             - const: aux
+
   - if:
       properties:
         compatible:
@@ -136,16 +166,10 @@ allOf:
         compatible:
           enum:
             - qcom,msm8953-apcs-kpss-global
-            - qcom,msm8976-apcs-kpss-global
             - qcom,msm8994-apcs-kpss-global
             - qcom,msm8996-apcs-hmss-global
-            - qcom,msm8998-apcs-hmss-global
             - qcom,qcm2290-apcs-hmss-global
-            - qcom,sdm660-apcs-hmss-global
             - qcom,sdm845-apss-shared
-            - qcom,sm4250-apcs-hmss-global
-            - qcom,sm6115-apcs-hmss-global
-            - qcom,sm6125-apcs-hmss-global
     then:
       properties:
         clocks: false
@@ -191,7 +215,8 @@ examples:
     #define GCC_APSS_AHB_CLK_SRC  1
     #define GCC_GPLL0_AO_OUT_MAIN 123
     apcs: mailbox@b011000 {
-        compatible = "qcom,qcs404-apcs-apps-global", "syscon";
+        compatible = "qcom,qcs404-apcs-apps-global",
+                     "qcom,msm8916-apcs-kpss-global", "syscon";
         reg = <0x0b011000 0x1000>;
         #mbox-cells = <1>;
         clocks = <&apcs_hfpll>, <&gcc GCC_GPLL0_AO_OUT_MAIN>;
-- 
2.34.1


