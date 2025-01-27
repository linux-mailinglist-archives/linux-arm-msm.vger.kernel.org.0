Return-Path: <linux-arm-msm+bounces-46295-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B94FBA200E1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 23:47:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 24C0D165D95
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 22:47:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 409DA1DDC3A;
	Mon, 27 Jan 2025 22:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="kL9FmZwn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E6B1DB127;
	Mon, 27 Jan 2025 22:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738018000; cv=none; b=FaCHOFkvp3EkNticjvaG8LKWj+E8XIrJZ50ldUVoyPGBL2o898RRV8tCct/bkuZwL03ADonlSJYhHs60aQlcWEnJr7gtviSDlu+Q6cuME+MVR1jzgnmD41IcWqZRJByuBMIDZMhtCf1IX8YjYvJRtXyMqdHPqkyB4qIVizJLRcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738018000; c=relaxed/simple;
	bh=KM6RJ3fNafu0TIY7cIBZDDJ6AdV0OzMiHaeG4NSr7Nk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T6ZcQN955hiDOt0QRWGanmRE/4xrSTqTdoZuxmNnrIBWu3cMuPynXHD74p7H2ZWa9LuHoThmpRmuYhR/EXqVYoaYRmicmWIFkyQuBRD28kcvDfwN4jcBnSwZV00IKdClrIL01q2/RSYIfkGW94Os/Nea1rWxWB6CELTEHI2B8V0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=kL9FmZwn; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1738017995; bh=KM6RJ3fNafu0TIY7cIBZDDJ6AdV0OzMiHaeG4NSr7Nk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=kL9FmZwndB5OY+kuPYpXviITDcfpuLo6q/FEE/YKSUdrZaIrDlaWtlIfq99TU2d9B
	 +PCozu23mWz5E3Ygj7OrXOQ+AbFotGGREZ8j+uwXmsSa7qLF2zblYoMwK0wVQ4ajhq
	 tZS7vvs7/4J86PISQdY3TOV1mD+3ARz/U+9QdDQs=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Mon, 27 Jan 2025 23:45:34 +0100
Subject: [PATCH v3 02/13] dt-bindings: remoteproc: qcom,msm8916-mss-pil:
 Add MSM8226
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250127-msm8226-modem-v3-2-67e968787eef@lucaweiss.eu>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3045; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=QOX+y9xJxQtU5fC+FAiwYeTe935qVnVO1l/TnrWDH7A=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBnmAy/ayEYMU7l7wa077tciYQXybO0EFZBFS0N6
 P+DUXHhCZiJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZ5gMvwAKCRBy2EO4nU3X
 Vjr4EADLkMdMOFfZWxkojYvXte42VqqBUXX8C06MD6gDW/t6SkxpszKujd/2y8nR59RPBlzA101
 y0y8V381sFMxOl986hwbr8+ArV6faYY5rHKpnBsmdJXCRNAoJrBufac2fZhp9/ibvUL/EwT2AhA
 7Ywy3pBCqylKK/IiYLF45Ds1odHQg/amuaBTVlRDOvmcSHzBKQN9rCVqKNg32jApfhF+yuHKVsM
 /ePT9Q4TfOvK0OHk+C0QtfThgbh3ALub7+6Da1X9sGgvYBkWWbxvI6l+B/JQ95sdJsfg8Mn9Qsu
 y7CxW+xz6cBx+vL9HcKlo03O6M3+LK54WYF2mqrpOKxdFiRx4VTKU6QjxoJLV5VVcZUE6fDxuVD
 OZ/SSBbmxZI5BrBSLi8evSLdbyBra+7/fusbRpYjI+NlpCkIJsmTCZizOK9qBezB0cLK02v3tUv
 J3mqIC9uYJVqaAWWibrLMzR0PAEDVGj5ZvrQYE2vEy+HMwMmom22MnrKqdGncE14HDulHTv781u
 s9IWEgG0z3CKn4qzQ2V19nX7p/nLTHsKOGYJ2wkli86/FqkjYlH0JN24zHMCsqowT5+TREJlvYu
 EXKhZIE9ybxnWQojzIdQ04YvQgEKj6v0hIrNuAITrqgho/T7JANkE0iKY/KzBdDtUbSY0rTnhg1
 1iTEdxXzQEllE3g==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

From: Matti Lehtimäki <matti.lehtimaki@gmail.com>

Add support for external power block headswitch (BHS) registers.
Similarly to MSM8974 also MSM8226 has the mx voltage rail exposed as
regulator and only cx voltage rail as power domain.

Signed-off-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
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


