Return-Path: <linux-arm-msm+bounces-36782-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F42009B9636
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 18:03:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5F4CAB229ED
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 17:03:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A2641CC8AE;
	Fri,  1 Nov 2024 17:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hS5vwtwe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BEE21CBE95
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Nov 2024 17:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730480598; cv=none; b=nyvozAZZ8sY08LC7/nCvyzZ3hCB40axw7nwjV7Y2uHP2Vn6HD7JfV+gjwuh4fk4j/VMC2EQl1PUxW7g065lS6zWRuMDt9TfxNspSVbwZQ6WOabJuBCfO6kiMX72qOYA1sTLeltmoTCjLUI/okZilYTgNsVDPqMcCqvYqOargAyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730480598; c=relaxed/simple;
	bh=hMCCbLDioYy+Gyryrg/qDlm9Q8ImU8TUBBfa89jXyLk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U2zDhu/BO5EPO16y0XgpDNj/b8f6fwO4sp+W14Q8FHQnwMcQQwc6s4ozP5t6bmiX9SLnuwr2g6wt5i2iRobsTGSl++HpK4zkFkAx9r91iDCg3PWApeYEovESsKUSeR/d2O29X5mKoZ8Cfh8LS4+JtnVGjazkVu/mBdvHRt49CNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hS5vwtwe; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-37d5045987dso176606f8f.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Nov 2024 10:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730480592; x=1731085392; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q3NYpsGTgrceer71ppOAoBgRk89YYUeZ50Pg0gfV+Bk=;
        b=hS5vwtwemZXn2RA1q8n+A5yKbG/9BhXrrWJEZEY7lizErSQ1SQTyMWi4mK86yF3Vhw
         6um7XUf/CPCMX6LEOwSp6UKSNMETv2BtkUbJSmFipA5dLW7MNrsrltsPuEko+thPzTAD
         g7kwrE3CuFrz/uEVHcoHvGJlmksXMUfxex47G9OGFPTVWPHjSC60qKx0h4KjO7YfQ9U9
         M+X4sfedy9Vd3+hklxLII6mcRUQKdcZBy2zTZgSTm1ZwOSoC1QphMpIxclFmm0dghh0b
         Gfi4igFFRE46twprPHiXRH0TySIyQY0RjAiNVUT7YbRuU62q6IO9F8QHgFgvzlXQpt5h
         bKDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730480592; x=1731085392;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q3NYpsGTgrceer71ppOAoBgRk89YYUeZ50Pg0gfV+Bk=;
        b=HznqT65GgM9oUZMTV86+rbC8tDQ1IbZwp1U55DW+47HdpSPW1al69Yld/RXDPI1+Sv
         OHONd3Zu5VIMrWxhPA6fpLTK3+VvVZ4+dA8Fi6P9jEsDLRZvaoBOWthqcP0Mj3NBtakx
         eLDyNa7XMx1UGvVhEVnJ1pho25w3VKcBjfGj3JOVwEi+wbLYCQQQHMWb3uM2xAM3UMYV
         Focca9pSQtRKAq64zZCo1XpssGeBnxHe4rTmHYLUZx1m3wE5nSDfAgkU5y2D3bYy2/0y
         uslAadr6uFadSGdrKfk/5YEwkJu+K0SOqsZLyzkDTNBmTPbVtwEiV5PRaGMoOXCEgxl/
         tpfA==
X-Forwarded-Encrypted: i=1; AJvYcCVE2BfSmS0IzL60EreAHjUnMlOkjjl2F+4pbFZrsSqIX+/F3/4uHmybhHz7KMkqqnSLvAguXYQF+FrKvDR8@vger.kernel.org
X-Gm-Message-State: AOJu0Yw151L3v39TYTnkmge2fj1Pt6Kx+emMtHVIoAzXCfU7I2VFo0UX
	2zdqMmeP4ygqnEKL/OKSv5OgnwFVlfPwfabEQW3dHB93gdCgObD25jV3WwtvZJr3RZWksXXxB12
	A
X-Google-Smtp-Source: AGHT+IFCZ23WEBwwcLfQP4WYBJ1WQPAvLjnNpkz+Y58FV/YsX35Y9/WCJ4gXDC+pJP7nEDi262mLrg==
X-Received: by 2002:a5d:5f46:0:b0:37d:4aa2:5cfe with SMTP id ffacd0b85a97d-38061173287mr8248808f8f.6.1730480592542;
        Fri, 01 Nov 2024 10:03:12 -0700 (PDT)
Received: from krzk-bin.. ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c116ae82sm5687923f8f.93.2024.11.01.10.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 10:03:11 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Melody Olvera <quic_molvera@quicinc.com>,
	Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH] dt-bindings: remoteproc: qcom,sm8550-pas: Add SM8750 ADSP
Date: Fri,  1 Nov 2024 18:03:09 +0100
Message-ID: <20241101170309.382782-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document compatible for Qualcomm SM8750 SoC ADSP PAS which looks fully
compatible with SM8550 variant.  The only difference from bindings point
of view is one more interrupt ("shutdown-ack").  Marking devices as
compatible, using SM8550 ADSP PAS fallback, requires changing some of
the conditionals in "if:then:" to "contains".

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Cc: Melody Olvera <quic_molvera@quicinc.com>
Cc: Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 .../bindings/remoteproc/qcom,sm8550-pas.yaml  | 48 +++++++++++++------
 1 file changed, 34 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index d7fad7b3c2c6..a24cbb61bda7 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -15,16 +15,20 @@ description:
 
 properties:
   compatible:
-    enum:
-      - qcom,sdx75-mpss-pas
-      - qcom,sm8550-adsp-pas
-      - qcom,sm8550-cdsp-pas
-      - qcom,sm8550-mpss-pas
-      - qcom,sm8650-adsp-pas
-      - qcom,sm8650-cdsp-pas
-      - qcom,sm8650-mpss-pas
-      - qcom,x1e80100-adsp-pas
-      - qcom,x1e80100-cdsp-pas
+    oneOf:
+      - enum:
+          - qcom,sdx75-mpss-pas
+          - qcom,sm8550-adsp-pas
+          - qcom,sm8550-cdsp-pas
+          - qcom,sm8550-mpss-pas
+          - qcom,sm8650-adsp-pas
+          - qcom,sm8650-cdsp-pas
+          - qcom,sm8650-mpss-pas
+          - qcom,x1e80100-adsp-pas
+          - qcom,x1e80100-cdsp-pas
+      - items:
+          - const: qcom,sm8750-adsp-pas
+          - const: qcom,sm8550-adsp-pas
 
   reg:
     maxItems: 1
@@ -82,6 +86,20 @@ allOf:
           maxItems: 5
         memory-region:
           maxItems: 2
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sm8750-adsp-pas
+    then:
+      properties:
+        interrupts:
+          maxItems: 6
+        interrupt-names:
+          maxItems: 6
+        memory-region:
+          maxItems: 2
   - if:
       properties:
         compatible:
@@ -129,10 +147,12 @@ allOf:
   - if:
       properties:
         compatible:
-          enum:
-            - qcom,sm8550-adsp-pas
-            - qcom,sm8650-adsp-pas
-            - qcom,x1e80100-adsp-pas
+          contains:
+            enum:
+              - qcom,sm8550-adsp-pas
+              - qcom,sm8650-adsp-pas
+              - qcom,sm8750-adsp-pas
+              - qcom,x1e80100-adsp-pas
     then:
       properties:
         power-domains:
-- 
2.43.0


