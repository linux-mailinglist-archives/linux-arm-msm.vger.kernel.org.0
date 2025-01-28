Return-Path: <linux-arm-msm+bounces-46428-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B45A21506
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 00:36:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A4D071885A5E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2025 23:36:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0E3B1F1520;
	Tue, 28 Jan 2025 23:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="0rcHn1t2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D7A199EBB;
	Tue, 28 Jan 2025 23:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738107388; cv=none; b=n826QnRYo+cTn6qHSc9DAtGknSSEtcARUuqlafA0gY8p6LoVsz3kx+DR8ZXZNNe7uMz9D0wLwwO0t7SGt88dXLa/neX7XpkLARVFPTh62aiFHbmtjkYRRR4yuRHDb/DUas02UHKbikCey36r3Fa3wluCN2EB1iKhx0Hj3SxuxPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738107388; c=relaxed/simple;
	bh=iEhQRD3Keoeoouk9DWfMQfOJfESRFe9YF/R0gxoyNW8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eCJD1tRmZ/fYzed6ek6WILdu5fv28urSQP+KfJcV+/la2pWVgaytYz1uhHzf0P/gA4LM+13DQAOc6FJ42t5OIC5R+Rj8Uh/rY59pSQ0+tfoa679v5j5Wqcd9Aswk1hz3RixGaCTHLr6egliPjr8QbpS5s2eq+f2kiVNo+drRMIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=0rcHn1t2; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1738107379; bh=iEhQRD3Keoeoouk9DWfMQfOJfESRFe9YF/R0gxoyNW8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=0rcHn1t2WLj2e12yzr+4G5EY0Y0XpamR5S/wbvtVuY2UPLURdNe/TQBk2B1AGyUY/
	 OIalDvAVaOTxp91YEi7kUB6/x7mXurWZFaiYaQriBVbTPsxGItfUzngNQtRM0fZFAe
	 UROAvGB/tI6uOOEkJCs7/tvsjcjgyygTTLuCer3E=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Wed, 29 Jan 2025 00:35:35 +0100
Subject: [PATCH v4 03/13] dt-bindings: remoteproc: qcom,msm8916-mss-pil:
 Add MSM8926
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250129-msm8226-modem-v4-3-2b02ed7b7f1c@lucaweiss.eu>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2475; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=iEhQRD3Keoeoouk9DWfMQfOJfESRFe9YF/R0gxoyNW8=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBnmWnn5MwvdCbKVEkKo/5cAqtxN2S14bnxwt62Z
 P+bRX1SFyeJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZ5lp5wAKCRBy2EO4nU3X
 VqgjD/wNaHAGvIO/tnFcCqVE6lRrKZNwP4B8esM8wKzPTe5Snt6GvSNT4jKGEQaKcvPhZPjFgBT
 kM6JcMiQqU1GfJRhbZuNqKWLwUt3fLkX/M6GudmI25CAmQRnYl1MEe/nf0xUGZDHr7+IEZ2iOeN
 WqM+yKCZ9Ey9ecwIoix3cEiFEKyQm75+jlOlZxJivbMRrYQNNio4ghGeAtyOiekoz4GVKirck/j
 JMWkHmp2Rv1SMdcA2MTcn0XxuGFcFRHE79fqUxVxXbuuxzwSfNsSj/kX6JQ1EweOP23hXa3eefl
 EZDoTK0KjLDjxDSgm8cyaoGlI4iQ8Gipq53csJX/7iH2UaYb76b+J1kv0bzKCDEYDBsFhs88v6v
 kQXVjHOT3AifEPEfZFAfal2D9hY3JK9aQNper57Dgnh5P2/k2/Bpupj+QMuiR+D/Y0hqA2lLXcx
 H8juKfk0m1X8v3WK2W/63I6Mq+Pdx33qHMXvQaMXI24Hea73SJzMjkaeiLmpLU/MxqhbC6lX82n
 cfVXApDKdqfc5/gKoXCIH1r6UIA8oN1YdkbIPGt/WPraDyA0642AIWuPAHYMvlWHiigp/h5zULF
 z39OSVwVWdgAchUZ9LMMx/NMvj+Scv60a4USkwLRRBFMdyFEFIbb5QPP2FyfvbgeTN6rTtHW1Bx
 G2f+29qXtwBtd5w==
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


