Return-Path: <linux-arm-msm+bounces-48287-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF7EA38E84
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 23:06:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 34FA93B1C32
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 22:05:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64D591AA7BA;
	Mon, 17 Feb 2025 22:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="UBO6j8wu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A305F1A83F4;
	Mon, 17 Feb 2025 22:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739829958; cv=none; b=RwbKyBUZQHyuJwX1diqoHc+31B6uu40UO0MCnSU0I6eJxvPJqPx5h6ikvriKiB6eeUwtYN74wpYdB96awHYbBlJgFWaVBOpO5kd2eSNaNlSokD3vl9VQnVzJEN1crsgY75UpW6T/5P0ezPC6VCE6rZmduEhRslRP102F0QkFyz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739829958; c=relaxed/simple;
	bh=KM6RJ3fNafu0TIY7cIBZDDJ6AdV0OzMiHaeG4NSr7Nk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JwNv4oOMhWKBNCQSfxv5iOHAEmEB5d9Hw4pfvJ7cQgRKBQ1NJGmv7gZWCAZA2p65qitQaJt3BCP9poIMmZdYsqgc/lUkyHy31tQ7QsDgdYMbWYtEg71KnqAKcucYzb5SNZ3VCoqfNavcS0t4De6vdIV7XPU3LuSPY3fzrN+31Hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=UBO6j8wu; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1739829948; bh=KM6RJ3fNafu0TIY7cIBZDDJ6AdV0OzMiHaeG4NSr7Nk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=UBO6j8wu3MXiG4bj+FMQfDQ6gisNVxZPXfeSJj0P4RnsGA0qfYSw4ysk3x+vSMl1H
	 XlfrP95YrDuB38GytTjaLv0Hx2yrXVNpUiKm1iNtMsOW857Qy1wCEcjek9xtY5d3QU
	 IloPF1UVLflzzP+Jg3BvyyTIGWdPbMQkUAnpuFMg=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Mon, 17 Feb 2025 23:05:16 +0100
Subject: [PATCH v5 02/13] dt-bindings: remoteproc: qcom,msm8916-mss-pil:
 Add MSM8226
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250217-msm8226-modem-v5-2-2bc74b80e0ae@lucaweiss.eu>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3045; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=QOX+y9xJxQtU5fC+FAiwYeTe935qVnVO1l/TnrWDH7A=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBns7KwnGz2F99BxIg4tDY+j3yTQ2j19Bu/aiJvT
 NRluNsHxrGJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZ7OysAAKCRBy2EO4nU3X
 VmajEADHMnBT88CzWp8SYFNIs+WaivAKGNW4D70e/dKgE4aYdx8bykKi2NIZ25B4K5UoEwZ1bDn
 O8My2xHAMXJEPq++VpeNAnxYUDmPt24Xix6Gkup1ENGEy39v7zaCFQiY+W0o5diFT6AA8KmWj3t
 3HFPvUHs0RY1Er8VbF2c1leR14y0frEBPRJXXoghCQ3/gTPARGINuiIToapirUQ0Bpj4l5LoaYG
 Nr9w0blEVaOyJytpBP9oeZASsDopX1EFdABbIUXJsx4jXr3M6airCYadd3MguF2SNMTEM9qAEj/
 AkFGIoTKiJKlMHaazkcW60OEVf1ZL7IB5vhGtI8FcaITE6tVMrivf8s+bhiRk84B/sg425lsfMl
 KDG79fVlkN2aV99HkE3USklDfGC3+shUHR7WAt6VQYG41RKzBiTCkDUgN4GDuqaeH2oNt6tWNzw
 SJFjEWvoWO/s8wmuPaW8W0HhMK5klwt3vyrK8QdhlGT1hz9QEhIPCOGPybQJgm4xeQXh3IGDIBC
 t8BMtC0R7wbFpzDehFnBLe6yZd/davGPq/o/yM0w5tA+xGrpTnjZZaOmrVsh4ewGKw+EEiQ4k8+
 jOeONVB3DEnz8y3tj5kBGhl2TcXPn8t6VtyLwz3J7grxOXfKAkS/y9MpE9t7ts9QmOYoElXKyZn
 KdDBniAXAaFNjIA==
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


