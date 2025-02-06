Return-Path: <linux-arm-msm+bounces-47054-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D168A2B2EE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2025 21:06:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1627A188ACE0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2025 20:06:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC56C1D8DE0;
	Thu,  6 Feb 2025 20:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="6fn7b+r5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D751D5AD3;
	Thu,  6 Feb 2025 20:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738872366; cv=none; b=JIOqIsn+UCsWFDZ/l8mb1Pbh0Bra4EXkt9Bky+5co1e/O15BIyHGr8x4t+LyYSRyqdQiDo6bSF5/gLJc3qtBYD3ZpZai7fnawrECtWsGOcQ3igaT6HcRJvHi5hZErfuuElwTA27n+78oKO1RxizHeOQDc/2N7p3xZc1KQSlu3bM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738872366; c=relaxed/simple;
	bh=GqzyQ80y7ToCYhmy8tAK/9KoMbBvhfh6sjp3BzYq0lQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lNPiSdjw3v8JgZMDY/vnxPvzJ72LsooSqSIXaGFC/TQyFwUaIfCyw13LzW++I6+AAQWMk9sdN05EFLiJ2f3moSCSU4c6QWa+kHaBpSt8nNL/ZPP+p7M6+FCINDev9sORC+YANhTc8i/sUYfZ8Rlt7nW05y2UceQgijM7R1HTCK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=6fn7b+r5; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1738871842; bh=GqzyQ80y7ToCYhmy8tAK/9KoMbBvhfh6sjp3BzYq0lQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=6fn7b+r5KEKbqejPzIckpvbgXUT5AUiI71zvFB+NSc0IlvENNDOcRp38EgMf8ZcD1
	 HVxt2DPWC18ln1P1zfm3REIDUl6qdGpKLWz+OlvMGlnpS8P2Rt2XUwBMBQYO0gjCkA
	 MugI0wo9o1uOX1baPHNo+RTg2Pw8J20/eaTRTxp4=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Thu, 06 Feb 2025 20:56:47 +0100
Subject: [PATCH v2 1/2] dt-bindings: remoteproc: qcom,wcnss-pil: Add
 support for single power-domain platforms
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250206-wcnss-singlepd-v2-1-9a53ee953dee@lucaweiss.eu>
References: <20250206-wcnss-singlepd-v2-0-9a53ee953dee@lucaweiss.eu>
In-Reply-To: <20250206-wcnss-singlepd-v2-0-9a53ee953dee@lucaweiss.eu>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Stephan Gerhold <stephan.gerhold@linaro.org>, 
 =?utf-8?q?Matti_Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca@lucaweiss.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3077; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=l+8YJNfDS903Eqh028X13FBAPbGMBhedBGZ2vx4lhHc=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBnpRQfRJWflBdWfa9DM5hNTEQOLB2U75zZtrHlt
 p7nd8P//h+JAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZ6UUHwAKCRBy2EO4nU3X
 VqdqD/97qaNPVI0DUfgLlFKYK3YjydeEC+06RHLDGA+PU1t6u4C2IuHpHvd8+sKwlMvg+Y3OX08
 PN/KTwFe6ifQsZRi5gnat2290yKtH7/GJ7n9R/j9AAvViqpZhSSh3JRuDHns1lOk8cvxfoxykG2
 6hGonVId3JyG+DusVSm2O9MBOQw7Nj5J4MZgHUJx7x+xPkldauAqH76BJFQYR9f9HlgWakdpUd3
 /HiqHNunDCCtfjHOw4oZ5QlGyAZcqbTTK7SkXcUNpO8GFMAlLWiutQ07WVGhVIm3KmAoTAEL7+m
 JcJLIyU/n6T5yLhVyPOvxIdX+734zbJqL3bUC2xDFr7FlWe08vxlC8773fGHnNrXa58Bfy2tyQJ
 H5Iq4+u/07AprzSXCwP+KyWPENuXsEUcYUcGZ3q8pJN+YMS/OChFaXQ/aqEpHosPEut0tmAazHM
 LVluDSOiPVFRc9fCsWDHicARQ12cj5uJM2bHwwidlDatnrAVrrgQSGo5uWxF+8NwVjnqg5XEkyG
 yJS4MmS/JFuVDBYJ5loN9l0pKcvq0rAJM99hq81q58Gs4ULrFvj9JXKdzPazAaT7OZmWeoOcvrY
 5Q29T+50LUTWSXefMUtwZ/laEDb2Y4WvhwboYfhQBFHcdzsbdkZ3SXik1t6JR3MtfJ6Yd4h5X9J
 9y9zNC7IhCMPWGQ==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

From: Matti Lehtimäki <matti.lehtimaki@gmail.com>

Support platforms such as MSM8226 and MSM8974 with only one power rail
(CX) modelled as power domain while MX and PX are regulators.

Signed-off-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
[luca: reword commit message, expand based on feedback from
 Stephan Gerhold]
Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 .../bindings/remoteproc/qcom,wcnss-pil.yaml        | 45 +++++++++++++++++-----
 1 file changed, 36 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.yaml
index 8e033b22d28cfa8203234f744b3b408e976e20c3..117fb4d0c4ad2a3fad3cfe5d49ec2223b59358b2 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.yaml
@@ -69,9 +69,11 @@ properties:
       CX regulator to be held on behalf of the booting of the WCNSS core.
 
   power-domains:
+    minItems: 1
     maxItems: 2
 
   power-domain-names:
+    minItems: 1
     items:
       - const: cx
       - const: mx
@@ -187,22 +189,43 @@ allOf:
               - qcom,pronto-v1-pil
               - qcom,pronto-v2-pil
     then:
-      properties:
-        vddmx-supply:
-          deprecated: true
-          description: Deprecated for qcom,pronto-v1/2-pil
-
-        vddcx-supply:
-          deprecated: true
-          description: Deprecated for qcom,pronto-v1/2-pil
-
+      # CX and MX must be present either as power domains or regulators
       oneOf:
+        # Both CX and MX represented as power domains
         - required:
             - power-domains
             - power-domain-names
+          properties:
+            power-domains:
+              minItems: 2
+            power-domain-names:
+              minItems: 2
+            vddmx-supply: false
+            vddcx-supply: false
+        # CX represented as power domain, MX as regulator
+        - required:
+            - power-domains
+            - power-domain-names
+            - vddmx-supply
+          properties:
+            power-domains:
+              maxItems: 1
+            power-domain-names:
+              maxItems: 1
+            vddcx-supply: false
+        # Both CX and MX represented as regulators
         - required:
             - vddmx-supply
             - vddcx-supply
+          properties:
+            power-domains: false
+            power-domain-names: false
+            vddmx-supply:
+              deprecated: true
+              description: Deprecated for qcom,pronto-v1/2-pil
+            vddcx-supply:
+              deprecated: true
+              description: Deprecated for qcom,pronto-v1/2-pil
 
   - if:
       properties:
@@ -212,6 +235,10 @@ allOf:
               - qcom,pronto-v3-pil
     then:
       properties:
+        power-domains:
+          minItems: 2
+        power-domain-names:
+          minItems: 2
         vddmx-supply: false
         vddcx-supply: false
 

-- 
2.48.1


