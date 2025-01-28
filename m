Return-Path: <linux-arm-msm+bounces-46427-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D45BAA21503
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 00:36:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3AAB71885538
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2025 23:36:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D6151E9B08;
	Tue, 28 Jan 2025 23:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="WbrwIg3U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A705D192D76;
	Tue, 28 Jan 2025 23:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738107388; cv=none; b=ZZ3j1xZExnCvbni0PxjrFxdeg+OkU13f4Uvr4ys5NzijVhtfgiGxKqU+/CDyworVpTij5h015D9IVmRVt6hZXJFAVVKB+nH6OiYPb1R5GxwB58sJF/GC633fhhaySoUYXCiliPV5Qkvy4uzP6V4DGExRNvV1pZLA+Y5gPxTdSls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738107388; c=relaxed/simple;
	bh=3vxlekL2NwQk9PnikoW9frxyAG29LNSo8zkvrDcJwAc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iwQZ0Zc7XSF8oUL3Kjka0br5Y2/m7srXQTYiF+F9oVEgp6i+UvwYSw1XGaFlFgJmE8qLvau8PyAB6HNvNW7ExU7iFttBQXcVOxJEUBDR4tg1yLPn7dUGJiySDE7E+N41lnrclxglVaCUXyEpdCHc1zjexvLoq5tswwuu/NTJphg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=WbrwIg3U; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1738107378; bh=3vxlekL2NwQk9PnikoW9frxyAG29LNSo8zkvrDcJwAc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=WbrwIg3U3CURSYsBxjXiF3UQ7n3dfteg/3OvznJULkj//0SHZ+iVeQd9WMGVDd1JZ
	 PJlKA6mx42mg6Kqg7IDV1B/Y+QP+h+vbCqd22MZOR77eqAe/FW38r+VNkw7sficJsF
	 B4jWx4bnvwJHq3/c7iCcY5ACCrRBZ6UyNMNkLuQg=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Wed, 29 Jan 2025 00:35:33 +0100
Subject: [PATCH v4 01/13] dt-bindings: remoteproc: qcom,msm8916-mss-pil:
 Support platforms with one power domain
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250129-msm8226-modem-v4-1-2b02ed7b7f1c@lucaweiss.eu>
References: <20250129-msm8226-modem-v4-0-2b02ed7b7f1c@lucaweiss.eu>
In-Reply-To: <20250129-msm8226-modem-v4-0-2b02ed7b7f1c@lucaweiss.eu>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 =?utf-8?q?Matti_Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca@lucaweiss.eu>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2491; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=B88zuB3EiTSe4leTz3qIgobxf2MVkyWm8XcBBZJBjxw=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBnmWnmUAzGT3lcBoCNJWgaE7uyb8LpUMaLeXKzc
 R2ARdTCSeSJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZ5lp5gAKCRBy2EO4nU3X
 Vp1bD/sF7Oe1BDzzGwwX95BBTsFINkf/4EOYpnVnSdSVopcSmCER7n2xUB+jmtx2rmMjJXLz6hP
 VolcC5eGPmbXUceNIsUh26HX/o1gpwkiYKWZqDYAfJhHbnEKurO+dz7GTNrDum+V5k8yk0lHMLj
 DVTTbzSu1yGDxwo5PVdE8h4oUhVkt/PiTf32U5jaT0SPUIQH0RpEVrZW8kSkEvb6zRF6X6K6UMo
 wM4XuS29dIeKijsVh4/1j4dGaeEHVUaMbh52pu5myv8qrkc/rhUmJW2l8qCh4R50mdg5peXfaKr
 wKUnsBn+OshVbAk9ZgzePwgNFMUdujVFoARuWBjpoSkhC1+WI4N61WlwqWDvyr9i+3iDI39iauo
 DIt1NDgYrcApRLfFd6A4e2IefoCfNxsA1yZjo1+MUa/dNiDnXzNByCqipNLadPen4SbnNlXKdX+
 uE9TjQEE5U4r5dUghe2Pfa/1whrQMNaDCgLOBwW1q0iWZCns9QxkOIhSSrzcoFyQ0VcYx7ZA9Rn
 OXud0LW7MQrGml+sblt+3IbKihfoPxtuQ1NHNq5tKgPo6GUHArec3lo9wScZ0vWwChxbqbsFBZJ
 t7+lIe9ZAnBEsgdC5cxkONzGl7vleZWT0k7IIaPbtmRCrD1SVc2yL5YuC0mF2YQ53K09fXzuGuw
 mns2t3wV01mMVGA==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

From: Matti Lehtimäki <matti.lehtimaki@gmail.com>

Add support for platforms such as MSM8974 which have the mx voltage rail
exposed as regulator and only cx voltage rail as power domain.

Signed-off-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 .../bindings/remoteproc/qcom,msm8916-mss-pil.yaml  | 34 +++++++++++++++++++---
 1 file changed, 30 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml
index 588b010b2a9e53946a615219fc1468bc700deef8..c81364daa34b545e99261bf1f94ae2ad28d48ea7 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml
@@ -70,16 +70,17 @@ properties:
     items:
       - description: CX proxy power domain (control handed over after startup)
       - description: MX proxy power domain (control handed over after startup)
+                     (not valid for qcom,msm8974-mss-pil)
       - description: MSS proxy power domain (control handed over after startup)
                      (only valid for qcom,msm8953-mss-pil)
-    minItems: 2
+    minItems: 1
 
   power-domain-names:
     items:
       - const: cx
-      - const: mx
+      - const: mx # not valid for qcom,msm8974-mss-pil
       - const: mss # only valid for qcom,msm8953-mss-pil
-    minItems: 2
+    minItems: 1
 
   pll-supply:
     description: PLL proxy supply (control handed over after startup)
@@ -207,13 +208,38 @@ allOf:
       required:
         - power-domains
         - power-domain-names
-    else:
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,msm8909-mss-pil
+              - qcom,msm8916-mss-pil
+    then:
       properties:
         power-domains:
+          minItems: 2
           maxItems: 2
         power-domain-names:
+          minItems: 2
           maxItems: 2
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,msm8974-mss-pil
+    then:
+      properties:
+        power-domains:
+          maxItems: 1
+        power-domain-names:
+          maxItems: 1
+      required:
+        - mx-supply
+
   - if:
       properties:
         compatible:

-- 
2.48.1


