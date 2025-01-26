Return-Path: <linux-arm-msm+bounces-46168-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09416A1CEA9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Jan 2025 22:05:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 62DD1166A86
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Jan 2025 21:05:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6AB218A6D7;
	Sun, 26 Jan 2025 21:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="SepZqt0j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FBBC14B087;
	Sun, 26 Jan 2025 21:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737925504; cv=none; b=PLtmgNoZ7SQlhoDbprzuTQfxYe63077MH+X/jDs7Dqa3SYy5c2Epzg3MVN5SkrByLHHuvpGWqMpX8SNoOAep8l5SRyQq+9Hqf05WkgSsZggTpx+X4RBCRhGOvEGXWNq0Rz2466Uc0KhPVZevrwZ+WfGrI44BKm/AwzyTPttz2rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737925504; c=relaxed/simple;
	bh=QB88oSJ58nRPGoid2GbZhWXQ2ne3fe4hsSh0Mxb8+xI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G5ZrPDaorEFjTo6Ma0DyxNAU5E0qiXaTMgTE4laYGEqO+W2qgt7eqruCw8HSo+kDyAmbJia57wUq7OdJP/4a/zY5MWjKt/W50ScSdLsKuB/6ZueUzLaoM4To6m5r2AJh3qVRpQ4OFKp7nP2Ip/CxgSo9NUWvnlikEBQPo0smo4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=SepZqt0j; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1737925053; bh=QB88oSJ58nRPGoid2GbZhWXQ2ne3fe4hsSh0Mxb8+xI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=SepZqt0jcyhIfoBvpyEK3EFImKnLJE+zbiz3nKUGguO0wpiOyDnNPF6BU4gXTEctC
	 lJ3NDaN9yuPPnBhuytVCADIQNIVCL3wbWSnqm0jzHHluP8uHr7hKsrHHIrc9UhYu8T
	 JXyU2ATwOMKuyto38iC7cPOjEY5pdFYM94H02Uus=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Sun, 26 Jan 2025 21:57:20 +0100
Subject: [PATCH v2 1/9] dt-bindings: remoteproc: qcom,msm8916-mss-pil:
 Support platforms with one power domain
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250126-msm8226-modem-v2-1-e88d76d6daff@lucaweiss.eu>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2648; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=+qI2c+ts+CJCqtBSLS6UHzkQMS7qXUiAtLuXbwfyhJE=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBnlqG0XJNwfawPFgepX92UoGVxbG5+/ZAPAlELx
 bIXUxuf9H2JAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZ5ahtAAKCRBy2EO4nU3X
 VsdvEACRBzCEhRjKAaUiLEozFJrhcQw/9oHB8Q4net2dgILfAo08QSfmOZpXYRYo2/TqrLIjk3Z
 LHiyJYPCMP7UOAnv8gzfeRjofjn6nDRuMs0aEfVUc4Q1xp5+7908gHt6qEF/padd02PYXHTZ1h+
 okXdfyabDQZWL9A+6vQh2sDM1HhgmzSZYf8kX8Np7NJCuhznI6WukrZRO699cI/T9XF5YwgX/PW
 z10gtPNECzbx36RoNhJGHPq3gF2kJDxvkmzLSsQq/NKymRE9BZWzUs5ZV0hxjWRHCh4xxs76Uj9
 YogCFkbT/LeifSJStXc5+uoVglr4LqVSsJLJf7MXZ25JEZlLQk6o/8h+es9FTdude/bBpoe+JFP
 n+hsjkZLTw6Uh1psTbSFrLm7+yXVjA7AWsRKox3TfxJlIg3MtDDPlrk8itp2iqGWOaXcBCvY++U
 6EZI5bJRYPuB37VGPigqIBJ0qUS5GSpyBrxb8/xWLeE8MWumfmIeRnOgzInaxSOaxDP0SHDlMRs
 /5ihUvs+DEJjLOu5v4lmm2e5c5JXaeuAwOtorIjDwRzKwsatxGtyCmjFwL7U25uwomB55DgmCHn
 LXVUmrJGpaOiAs+ZNO6kEpkN0BPKNRtEzY/7ptsz/MrO0IcTYr4lXy0kqR4RFDq31uBhmFLGo68
 FBYynAoigr//zkQ==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

From: Matti Lehtimäki <matti.lehtimaki@gmail.com>

Add support for platforms such as MSM8974 which have the mx voltage rail
exposed as regulator and only cx voltage rail as power domain.

Signed-off-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
New patch in v2 split from previous first patch
  - Improve description of changes
  - Add one power domain changes to existing MSM8974
  - Add missing minItems to other platforms
  - Require mx-supply for MSM8974
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


