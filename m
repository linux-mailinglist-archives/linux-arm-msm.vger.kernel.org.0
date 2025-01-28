Return-Path: <linux-arm-msm+bounces-46426-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA412A21500
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 00:36:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 041903A2033
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2025 23:36:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71D1519E97B;
	Tue, 28 Jan 2025 23:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="d6Jlaq7j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99F3198E84;
	Tue, 28 Jan 2025 23:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738107388; cv=none; b=fTohHWhDbkAowdhtwx79AcxECwP8JAXKXyH08qmz616qRLcuFZ9ZtZCZhgPpbIONMhmzWQT4xjgm42BCaVeOM/5T6EmC1IDm344fBeRmTtpLx5abGiN88jBx/P0vhPWJbEpa8j08qhzvoF63ymGRSfwy5Uvny/SAk/ErYfajN54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738107388; c=relaxed/simple;
	bh=KM6RJ3fNafu0TIY7cIBZDDJ6AdV0OzMiHaeG4NSr7Nk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VB36xk7QdntY9y0pF07t9VUBblPgU65NYCnxrtHPSQNYUQ8aCc050rNva/HC0chbawWndAEHbPloczYgnGz5xBAyjBax/7u06oSKj4vuejTD7Tr/07eVvJykCZ0F+vlJ/MIetwp+uenyLCKnaHU8kb+isQSwtr7sLPm2jOR/8GY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=d6Jlaq7j; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1738107379; bh=KM6RJ3fNafu0TIY7cIBZDDJ6AdV0OzMiHaeG4NSr7Nk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=d6Jlaq7jrs/X0EZeAVmBnjvIxBMPnhvFkPIiYkWn875H1UnXY7/iQ/llJ2lmZWehm
	 LmTInSzQcFVrKHs7Kvbi656lxbStS6+Um/zgB15o0mCEem3ObAi/I8nsyx+lgq36il
	 qqHgEsMCxSiOLKeCM1EGENaj6wz7sCpCvKANVCD0=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Wed, 29 Jan 2025 00:35:34 +0100
Subject: [PATCH v4 02/13] dt-bindings: remoteproc: qcom,msm8916-mss-pil:
 Add MSM8226
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250129-msm8226-modem-v4-2-2b02ed7b7f1c@lucaweiss.eu>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3045; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=QOX+y9xJxQtU5fC+FAiwYeTe935qVnVO1l/TnrWDH7A=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBnmWnnihuzcX2mlQ3qZv1ElbQCQ/ENVFW+G9+5U
 hAJASbM3CCJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZ5lp5wAKCRBy2EO4nU3X
 VuTLD/9zHJC/PACLsJGxHMCwlOxzCqF6+IyhSJPwaHWamfshzOrTyUOeO2Oo4EbliAqxRyywde7
 ZstYEA3zkK5QD97KIBLW8tGUpqdlAeiMsGewK1TD0o/3GwJTP1Gj/UcEEDnWMvbcH+Qk72yMwGM
 sSxQEPQ4QDL7kthMnEjbV2eyZyLLO8baRbiv7+626AcOY6+dHoQhBpuohA+Mp52X5zNjXSGMQT7
 87V/CUjr6LQ2gtdQf2usOr2/DGh4y4993t11qoPkq8UOvwCmCadHjJbo5s+TTD8+7StxJ2zuDMz
 PenizprTaDxod6typio7U/oWxmeM2EQ/S8yIkmIOWmj+3AmVBAiY0Cf7GPZJcbCEI3mrEqt4LMF
 fWohq9Bbm4lQBOj/keZqrJtdHB08YpVoRXmCbX8Na/t2Rrv5SHiL83BZac3SWguAspySAGcuCTS
 JCVUeARsoSWTQYsx29NamW/CI25PKDi90p5D4AbIPU3g02a0j5N4TFFsoAKI4hXOSBkzSW0i5SW
 CT3iK8k+lKrFnT8TnhUfWCzbz1oHOCaTvA2GYuZpBWcNeLDo55QyNeP36yvppw4EDcL/bHVbcx0
 zC0VMcDqYB8gnR4Se4hgMO0Dk9Cv8OOxjgIQj/rWTDwy83kLBLbUXHL8GgbmantoWz9NHkwWSiP
 Vm5grgEEeATzbQg==
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


