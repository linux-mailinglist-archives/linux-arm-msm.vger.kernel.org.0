Return-Path: <linux-arm-msm+bounces-46169-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4682CA1CEAF
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Jan 2025 22:05:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8B0BD1883421
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Jan 2025 21:05:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21D0C18C01E;
	Sun, 26 Jan 2025 21:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="l/UhuiKz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB6614B075;
	Sun, 26 Jan 2025 21:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737925505; cv=none; b=XkNLWZ3VykT5c3+8A0HCmHtYjfawIyxVP+6MzGw0L+aiQ92gVRiWrMdUO2k2qOEREIwGp0wxN5dz7Uk4W+OxFIcLYIBmd/RnwX0COikGCxuxHwSwIXV0EwRWVqvNIQb1xcNTetzg/F5Cw7mdw2TXwFhfJ+qx9VtmnaZ9JNG041M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737925505; c=relaxed/simple;
	bh=ZuzWCAT96c9XTzfHZ39aa8pD/zW38hpUy9fGIHqHdvM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J2kTCsnsuBRwb6ow0DIrMmH8uO+AvkY6sj638TKbkXMYpuz95aXhaDFepIa5MsFPtjRcDaOY2iertk30iW9gBebK23+7HSIUJ+Q0LUG4GLz9d6woS3MNM6yokjZC2EUyBHt8ADchaC5lJzu+wx59ye6mh8yfaXKn/s7C0dGzKIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=l/UhuiKz; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1737925053; bh=ZuzWCAT96c9XTzfHZ39aa8pD/zW38hpUy9fGIHqHdvM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=l/UhuiKz9SO1SGcun7kv+tOKE6NsiZyAjAsDhqce6UJKWd9hjp5hpSWLgtYYV+wGF
	 Eaf3cFOBjgB+zrpS+OAX/EiEsAdn6ydB83dUqj9KVkwtgXfl+dycQhaRNsLtm6OvGn
	 SriNlIQL7g3PnBvf3D9X/+W9Bm/2amfU5gc5zNSY=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Sun, 26 Jan 2025 21:57:21 +0100
Subject: [PATCH v2 2/9] dt-bindings: remoteproc: qcom,msm8916-mss-pil: Add
 MSM8226
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250126-msm8226-modem-v2-2-e88d76d6daff@lucaweiss.eu>
References: <20250126-msm8226-modem-v2-0-e88d76d6daff@lucaweiss.eu>
In-Reply-To: <20250126-msm8226-modem-v2-0-e88d76d6daff@lucaweiss.eu>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 =?utf-8?q?Matti_Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca@lucaweiss.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3121; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=EpEIW0oYCx/oeVDL1c/DNdH9mSKbVyuj0lLP/6OnNxw=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBnlqG1xiKxbXzRrOQtZsr/H2BHgSPhVunFnkE+d
 Q8bv7zaueGJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZ5ahtQAKCRBy2EO4nU3X
 VmqSD/4xc5Z/rYEO6ZjW4ql46n/1ZcS81ok8s7TYwtnCSArW+otS8fVJP8K0jUR+M/mOXOxjzAZ
 vv8bd6RGTOzA4Bz6Zp3fcjLuCD+AP0/nwfjylN5myL1SezI/6k6XNUT/ZnTEU877Jji9IP81T+M
 IIwWYGzm/CCXSQLhDWhKqz/ICoEn09xIBSwB3ZXT/kQItOoHKuqAOZV7Ea+uMwqQ2/iASIvno4W
 dIjItnZYCnSmELyXG7Me+rRQZLspP8NrqDzbPypvlAltb0J8ZI+EpCAVDPk82d/GYn0sZtpLlgn
 KoKU124ff4VpFoAEh/8K6quS0tjiz5haLLOPms8GI/P2ImB/RvJnoH533AKoEtDMyN0YDoVfHL0
 NxDbhcnn6qBedrJKYZyJKBhB86kPIJwfDMRO6a6vhNKMBswNc7jamigunl/OBP4H7G1FT9sd2Vl
 S1zOIbM60WRDuHlqCk4Qjm56N9YHMzqw2m7sf7YQCEYv3/AQgFlzC8rhJHZNtnij9QkAloHOxB7
 yiYXahOJRTnkf73xA2OH0qn8neYPAPut+VbAmOiYPCcOamWtKtcSxZY0Hzec0OH88tl12F9mP3F
 XY4cWaW7vaLq+/4P2pEQAuBDs6lMDbP3zyTAemRgv0IrKsT+ukP3c2lI0xRFVvENtmdDQi6WZuR
 EO0Qa0Q4ceMyGZQ==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

From: Matti Lehtimäki <matti.lehtimaki@gmail.com>

Add support for external power block headswitch (BHS) registers.
Similarly to MSM8974 also MSM8226 has the mx voltage rail exposed as
regulator and only cx voltage rail as power domain.

Signed-off-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
Changes in v2:
  - Improve description of changes
  - Require mx-supply for MSM8226
  - Disallow qcom,ext-bhs-reg for other platforms
---
 .../bindings/remoteproc/qcom,msm8916-mss-pil.yaml  | 26 ++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml
index c81364daa34b545e99261bf1f94ae2ad28d48ea7..0a3e39c55ec3dcfc9a4d4ac28f5debd77dc49b99 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - qcom,msm8226-mss-pil
           - qcom,msm8909-mss-pil
           - qcom,msm8916-mss-pil
           - qcom,msm8953-mss-pil
@@ -70,7 +71,7 @@ properties:
     items:
       - description: CX proxy power domain (control handed over after startup)
       - description: MX proxy power domain (control handed over after startup)
-                     (not valid for qcom,msm8974-mss-pil)
+                     (not valid for qcom,msm8226-mss-pil or qcom,msm8974-mss-pil)
       - description: MSS proxy power domain (control handed over after startup)
                      (only valid for qcom,msm8953-mss-pil)
     minItems: 1
@@ -78,7 +79,7 @@ properties:
   power-domain-names:
     items:
       - const: cx
-      - const: mx # not valid for qcom,msm8974-mss-pil
+      - const: mx # not valid for qcom,msm8226-mss-pil or qcom,msm8974-mss-pil
       - const: mss # only valid for qcom,msm8953-mss-pil
     minItems: 1
 
@@ -107,6 +108,15 @@ properties:
     items:
       - const: stop
 
+  qcom,ext-bhs-reg:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: External power block headswitch (BHS) register
+                 (only valid for qcom,msm8226-mss-pil)
+    items:
+      - items:
+          - description: phandle to external BHS syscon region
+          - description: offset to the external BHS register
+
   qcom,halt-regs:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     description:
@@ -230,6 +240,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,msm8226-mss-pil
               - qcom,msm8974-mss-pil
     then:
       properties:
@@ -240,6 +251,17 @@ allOf:
       required:
         - mx-supply
 
+  - if:
+      properties:
+        compatible:
+          const: qcom,msm8226-mss-pil
+    then:
+      required:
+        - qcom,ext-bhs-reg
+    else:
+      properties:
+        qcom,ext-bhs-reg: false
+
   - if:
       properties:
         compatible:

-- 
2.48.1


