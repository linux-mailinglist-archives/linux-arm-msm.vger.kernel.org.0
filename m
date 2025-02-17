Return-Path: <linux-arm-msm+bounces-48286-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF11A38E7F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 23:06:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 61B2617171D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 22:06:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 548CD1AA78E;
	Mon, 17 Feb 2025 22:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="gxxYgQO6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A30071A5BA7;
	Mon, 17 Feb 2025 22:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739829958; cv=none; b=J0Xi1rqOcRK4cUvNgEHALOMDjXGXEyHtc9XNfBoeCv1aJR3kldGSO6l+616g7i/QDa6O34pSmv6dCevag5PMSPRWygGnPvY5uY6XbxNQyO8VFNhF3rWE1Nec+LnNJX3RExT3bX7K6vob72erGLihDHrYjA6TqHZVUUrQR4wggeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739829958; c=relaxed/simple;
	bh=iEhQRD3Keoeoouk9DWfMQfOJfESRFe9YF/R0gxoyNW8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rQM3dm0Ez8lQzGSN4isuaNteUP5+bmliylVKNAIrh3ENmmk6n6rWfILhm4hLOI63b6Icr1dDG6QrV+kukK8F8duRHsRIrLC6GHC3gCT5f2iG98cCiKCOacL4WDLESCkUHvEeT6KOaWRqcqHfu/kn6T1ugdrBqbAGa2I2WrzCZHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=gxxYgQO6; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1739829949; bh=iEhQRD3Keoeoouk9DWfMQfOJfESRFe9YF/R0gxoyNW8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=gxxYgQO6um3+XKzhor97Ikd7DDlNzVfUiis2bgxQHPijjo4qdQAZBB+W91ncMnQKJ
	 +5eB5kkC7CJU7GuOP48tI80ikzB6jIA8suOhoQW+rtHfxbWHDhqwS65VAX9k/N9Dz/
	 /OM/oClWxdyfns3TEtpE4dZ0UL/cka0Twz/Bc3ng=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Mon, 17 Feb 2025 23:05:17 +0100
Subject: [PATCH v5 03/13] dt-bindings: remoteproc: qcom,msm8916-mss-pil:
 Add MSM8926
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-msm8226-modem-v5-3-2bc74b80e0ae@lucaweiss.eu>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2475; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=iEhQRD3Keoeoouk9DWfMQfOJfESRFe9YF/R0gxoyNW8=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBns7Kx/peYKLZJ5ho16oMmSW2WyVmeDNzYDCLf9
 FG1rOwNr/uJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZ7OysQAKCRBy2EO4nU3X
 VrybEACfyRe2GsWOu1/2BtwQnISjxdRuWVLe3em3TjRqQFhzQLnPvYBijgFuN+JjIDyyPq5X2gL
 wYzjx546fUhb/B7EeX1yL8mSpQVbAhg2yiTvxGkBNEHJQA3s7CCm3+vUS/ib4CBticEFaqNhpWJ
 8KulC5Eo6fqY6nVScEPGVl2T+SpDxtAzWvS/MlN3pUWoWR1kiWRFacZrQrA/+tXY/kI5Hb9Z7BF
 rw/WXyA+H0BHvd+uwfktSTDsyhgk0oG1oV8S2IQI65etHJWALJM1QY+w76wzUQheapcqOsn4Zfv
 vu67V5UkgMS/FmQsddhE5OaU857e+uEPuaMuuDVOucqOR2Z39n3JKHD3ASmDETU25uXN+DEslcr
 3T+kcg2ZtLnhFP5nndvDHMWHckrCpZ+pzaAFuLUXdMhOeYToTAVcORXkZjYDxgQyQTEqJYAjj9k
 KchyItl5y3atKldYNw5aK/Jah8YfAwrvQPrZqzJ0r0s0rL/bfDXz0dc4V0tjjjAgryG0g0bZ+KH
 ZEbqnbjVkAKkltls8fKFJ+RnWIvGjvlQRVC0wyYi9SbFFI0HUx84aNpcCwQV8hsN3vk/6relIw+
 wkpa5U57pEhSTah8ZfQNpznTL9ZkL17SAfuui1Fo0S0bDF/q3dmeJaptx35u8NIDJ5dXna1lxwK
 tm3kWivIKzBmG0A==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

Compared to MSM8226 the LTE-capable MSM8926 requires mss-supply and
doesn't require qcom,ext-bhs-reg.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 .../devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml
index 0a3e39c55ec3dcfc9a4d4ac28f5debd77dc49b99..c179b560572b2c1aa85521e4bd01d1857530f6c4 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml
@@ -20,6 +20,7 @@ properties:
           - qcom,msm8226-mss-pil
           - qcom,msm8909-mss-pil
           - qcom,msm8916-mss-pil
+          - qcom,msm8926-mss-pil
           - qcom,msm8953-mss-pil
           - qcom,msm8974-mss-pil
 
@@ -71,7 +72,8 @@ properties:
     items:
       - description: CX proxy power domain (control handed over after startup)
       - description: MX proxy power domain (control handed over after startup)
-                     (not valid for qcom,msm8226-mss-pil or qcom,msm8974-mss-pil)
+                     (not valid for qcom,msm8226-mss-pil, qcom,msm8926-mss-pil
+                     and qcom,msm8974-mss-pil)
       - description: MSS proxy power domain (control handed over after startup)
                      (only valid for qcom,msm8953-mss-pil)
     minItems: 1
@@ -79,7 +81,7 @@ properties:
   power-domain-names:
     items:
       - const: cx
-      - const: mx # not valid for qcom,msm8226-mss-pil or qcom,msm8974-mss-pil
+      - const: mx # not valid for qcom,msm8226-mss-pil, qcom-msm8926-mss-pil and qcom,msm8974-mss-pil
       - const: mss # only valid for qcom,msm8953-mss-pil
     minItems: 1
 
@@ -241,6 +243,7 @@ allOf:
           contains:
             enum:
               - qcom,msm8226-mss-pil
+              - qcom,msm8926-mss-pil
               - qcom,msm8974-mss-pil
     then:
       properties:
@@ -265,7 +268,10 @@ allOf:
   - if:
       properties:
         compatible:
-          const: qcom,msm8974-mss-pil
+          contains:
+            enum:
+              - qcom,msm8926-mss-pil
+              - qcom,msm8974-mss-pil
     then:
       required:
         - mss-supply

-- 
2.48.1


