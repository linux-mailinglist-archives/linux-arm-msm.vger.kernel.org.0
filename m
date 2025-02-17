Return-Path: <linux-arm-msm+bounces-48288-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C38A38E86
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 23:06:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D90193B1B81
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 22:06:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7218A1AAA32;
	Mon, 17 Feb 2025 22:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="JKnSW5Ye"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A30C21A83F5;
	Mon, 17 Feb 2025 22:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739829958; cv=none; b=sQhQlkEdW79UZCeaJcA/t5bgr21NiAg1s90ZbZutzsOwBXV1kZREzWq8wK1kaNbnhjvppsBx+t4aWggyaIgCqTtVw4/BftDKlxT+WLednr/xvR+uvgnlYab36JAHOiJ/0JB1a6fB50Vieqh4OkENSrETCC3ZcxtmtSfJYPMMS7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739829958; c=relaxed/simple;
	bh=3vxlekL2NwQk9PnikoW9frxyAG29LNSo8zkvrDcJwAc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ljxso6jOrmcEgNvZ9da3lo/N1GcAO0rPPgANc2DQ1mj2xtk4Q295/ji6933e0edn2VnBC9Y1kowJYm97M5+InCs3gs5K62q4MXlQoCGrN7GGeEwhgxBpSZhVEml6yzBOLCSFzPDPeQyfqC+8bL6ZGp58/c876PmCNRdyrQyLnMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=JKnSW5Ye; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1739829948; bh=3vxlekL2NwQk9PnikoW9frxyAG29LNSo8zkvrDcJwAc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=JKnSW5Ye5n0m422Pb7oOUUC8pZkcdo6tnUiMQsW/I8skD74hHWZlR2LyZEjLUG+LL
	 9oVB8IT9MeFb5fBxG53uO4YCVvYeE3HLHKyVuewIjfHe6XpgV8BfEZNNQhPe+WhLtG
	 qc0Mmkv14ui/fzOli90X5yj2sLhwl0+qKb6k7wJc=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Mon, 17 Feb 2025 23:05:15 +0100
Subject: [PATCH v5 01/13] dt-bindings: remoteproc: qcom,msm8916-mss-pil:
 Support platforms with one power domain
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250217-msm8226-modem-v5-1-2bc74b80e0ae@lucaweiss.eu>
References: <20250217-msm8226-modem-v5-0-2bc74b80e0ae@lucaweiss.eu>
In-Reply-To: <20250217-msm8226-modem-v5-0-2bc74b80e0ae@lucaweiss.eu>
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
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBns7KvUqPkYQB5OMHRYEXaA762ULuVwMahn/bdq
 AuGVs3hvWiJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZ7OyrwAKCRBy2EO4nU3X
 VjztEACWDfLIvEMH+V29/spkxmNowVcrPtDCyj0DnUjdLsjSmaw0wRx+/bZQ6I+f/U8cFatXAEZ
 nKlfdSb7OayUnKjiZi+06N85AZB2phhqaErM6GVkWh5IJbuZnBR/ayOXZrGFBcND4pIunNoSHww
 QM0yY8iYaXwHQj+j2M48kavZGjITjO+EoT161VXhtEaxMxbrpfK/ZRht27GDY6rN+dqsl7JC9ze
 H9gVwAhTV6zJw9nPopJqSd2xBS+qWTIC92XHteDBIs4EuVtoxpOlAAckZGusqr2bfEwTHPgLq11
 scGasvGMImn056CI28hUdJykOyz2k+aUYIA/mdXYYmlC2q7Hqcqjhps0PPCBla2X8dyje2ts5XF
 AlDQ/Kd/05LD9wbObGnPR8SeXa0Yz3WCuG+NryeHtANpaEi48RozYndyH0hWt3w2kFtNkRFCt+1
 ZXnxzCrVoV3Pv3CDyCx2Dy8VcoXNCwVC+cU0oaWdcD8YvH60rj1i3P3+LsYzyYUaL3fsZOsHvTP
 vacVbnMEOzeMApQZLHEnxfmHUcnhNN4hNRO9wD/3+AcizYBcS+NMqXeBTC7GycGpTjX/YLfMLf1
 FRsSaXu9IxnMxNahJcRjDzrfYBDc4rRAv1gs98omSgjiXrI3kgeQooeBXmyp7IE/L6KYG9kFN6+
 udrxA6sR6S9CBxA==
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


