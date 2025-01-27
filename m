Return-Path: <linux-arm-msm+bounces-46294-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D1591A200DC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 23:46:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 145681882F36
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 22:47:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65D681DD874;
	Mon, 27 Jan 2025 22:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="a1PXokrc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70351990B7;
	Mon, 27 Jan 2025 22:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738017999; cv=none; b=ges4V8OugBEPIf6YX1TUxqWBgFvTTwKThjar1f1UT7zQUS9OQ8stp1KFoSHSGA4Ty++M9/07iVFAcSme4dTdiJVskTNX8L7/UEy3upLCJ3/aXPC+oDvJ6VfnQlZTePFIHt3ryLyeTb8u9SPUdiGey9eZKmMGvU2SJvjRL1D8xUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738017999; c=relaxed/simple;
	bh=3vxlekL2NwQk9PnikoW9frxyAG29LNSo8zkvrDcJwAc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sSutHbsR++RkvSPH/UWMWt3FImXsHkH4SeMaeSbKvIMqUOyD911JqShW0/y3SRKyVmmofeHAF+x7hhL2wle4hUXY2DZ/9bviJvSl3hSfWzzmSPQpZcsCofzKosyYoJhxgiIGg5smLKX/zEU8gskbp1ZQYwaDIRac2ZmP+K4e52g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=a1PXokrc; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1738017995; bh=3vxlekL2NwQk9PnikoW9frxyAG29LNSo8zkvrDcJwAc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=a1PXokrcsQXHUjr0hjGhVxWX7MmWFwnz4e6ky/6jGBZSUDqIE7oxIxNuDcG0kgK6Y
	 v7JsckuU0CIwziCIIeq/fFQfX3WmEuTFF3upkOXUG2qqw8b9DQqvWax6PaDi6bkGqV
	 HnT1OkdvoIVJk1Lu9eOGhk6Yk9jtAkwXn/gu88fU=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Mon, 27 Jan 2025 23:45:33 +0100
Subject: [PATCH v3 01/13] dt-bindings: remoteproc: qcom,msm8916-mss-pil:
 Support platforms with one power domain
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250127-msm8226-modem-v3-1-67e968787eef@lucaweiss.eu>
References: <20250127-msm8226-modem-v3-0-67e968787eef@lucaweiss.eu>
In-Reply-To: <20250127-msm8226-modem-v3-0-67e968787eef@lucaweiss.eu>
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
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBnmAy+59Qct4/WK4mu2K27IykEC7zQBjLOHTAmA
 u89Bf+w8rKJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZ5gMvgAKCRBy2EO4nU3X
 Vi8CD/4mXCIy1fqhfLfWKANE7M3x4rKvnks1u6+X6NHuloHYWWU4Bon695k2uR99sCAYJ1faZD7
 loHs5WkCwrJ0SCksOeTSazaHmQKhEte9YcJvGkjB/3O4O59NMHOp7ZWmLEy4aBussRlCdJnOEm+
 VFHSgPK2n5eon61BulcLnZ4+RQ/hj+rG4Z0qkYA04dwriXlakRBgJOFifazuSunF+2IphIJjXy+
 mDPMjIANi9cKnQQufuzltHdasBNn2TqwYGifWUY2EX2t8h3otmddfo7VKZ8hvlXa0RTi9YW5Rix
 htXcfoibOEW5NnM/7B7J9S0eNLLcx7K7/UXJf7aKdfvmxnvbZ4r6Ehm1wLbrynl7goMLUFituyb
 c0/qSP3fAcRBL8kcUzMhMFNWVUGOVvOtsw6Jp2mT+Q6PgzR5wUyqN8hqH0BSmaaAUPnCH/9p5du
 WWV2l/p+Z9aF+053o67JLc51kZjlGW1LsqkLoE/EcoOqUUSa0QvrAFOrL/PHgYsEYKhjJ2jVWBl
 e3Pzn6d2RKooG6dskE5eCtiW7hAtMzNoP4uJaEL/paUmcVcjFGwrGJCx2oCF4GsSbCH98eE3Iu2
 9+Z3uVb9BNPiqWuD5N6YcztxKUByEYlgTw8sCNObrDV/gdHhoLmHHY88Vk0PdfhTU3ewiqNClkY
 ypeQ5jLbMC/SaPg==
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


