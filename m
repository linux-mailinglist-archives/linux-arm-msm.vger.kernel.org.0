Return-Path: <linux-arm-msm+bounces-61937-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A20EAE2916
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Jun 2025 15:21:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE85D178342
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Jun 2025 13:21:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCF17219A8D;
	Sat, 21 Jun 2025 13:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="OQ6D3R78"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 824AA847B;
	Sat, 21 Jun 2025 13:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750512102; cv=none; b=tsRKIulDOPbI+C67P9FNJMKzi5KDWC5wJV9h/i9om6HwGwJVMEmC+zD6Orx9fc5lt0OyCyzmYJKZUAivKM9N/uBwKSMMy6pv9T6dP6KZnz6tBPkAkvxIb0gLX1boIApAJbiTps+Yh6s0/+Bn2ig3qLrMeHUY0UHBAM/Qwjyfbqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750512102; c=relaxed/simple;
	bh=OY9fA1pP8V0UyOWOBA8+2zh3+veBzlu89j1Vg+fIh4w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f6nfAe9bSTQTkGdb6rabl3V5WMWkJNre2yXvpMWEa+hFKdllK2U8CITxmXb/exhb8d+5h37loDbkfFU2DJWRFLAtEcL/d/Jn+zNFSOqqglf/2g3iS0VhlEHSiMzBz6H6sr7Dzq/z9HBvluQ54KpFji+m/pYystYwI6dNzSAhH48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=OQ6D3R78; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1750512098; bh=OY9fA1pP8V0UyOWOBA8+2zh3+veBzlu89j1Vg+fIh4w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=OQ6D3R78qq6W11NekZID7S2uZg+/Hlz+MkSljjxUcZkW40kQ/U33YubDMn21hafdu
	 DI0x1HMdjCEZ3Rpy/f2lEUAfG5G/ES2gYHBmXboD42cu0ZYp9wRugzspYSs7vO/jiA
	 /4/uhNUZPykD4jbTOpgst/8v8v722Px7nMi38sdc=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Sat, 21 Jun 2025 15:19:56 +0200
Subject: [PATCH 1/4] dt-bindings: remoteproc: qcom,adsp: Make msm8974 use
 CX as power domain
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250621-msm8974-rpmpd-switch-v1-1-0a2cb303c446@lucaweiss.eu>
References: <20250621-msm8974-rpmpd-switch-v1-0-0a2cb303c446@lucaweiss.eu>
In-Reply-To: <20250621-msm8974-rpmpd-switch-v1-0-0a2cb303c446@lucaweiss.eu>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca@lucaweiss.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2041; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=OY9fA1pP8V0UyOWOBA8+2zh3+veBzlu89j1Vg+fIh4w=;
 b=owEBbQKS/ZANAwAKAXLYQ7idTddWAcsmYgBoVrHeQf5clqB8TDJHe+W0eckb/5LyNYS2aSw7u
 kPt4Fpnun2JAjMEAAEKAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCaFax3gAKCRBy2EO4nU3X
 VqXiD/0ZshgT6VrrXgQ7JzCylYPcb+4jLALDmgF6rFJgQdSj3MVkkqXhh61XlNZupVFL0MxMyox
 3EpLciZHsVY7b9FW7vWOshZXG7gfKs9C0Z9ZaPQph7CHRCpUnnb6M4ddNcjQ4k3vfFVhbXn4+DK
 XkGaEonfVgmiVY1J4jbrDKHhcmoywBeF/RjIas0E2Who4EaB27h0rAZjrym59TbrJ3MGt0/JPlu
 uFPdqhO+oR/jreYsGRcow9HEZ3TXMwUGuqmfC9t/XuzuAIyZbRGAVZE2MLdPGwj7iiyXhwUgN5b
 639QkqyzHT0xF6VqNHID2lk4p8ZSpIOvIivA3h4xmLAeIcBpU7xHAOCqUadXVwb+M8g+IjEacNB
 NRB6XdODlYNt0hQAmeby4iMgMKfnW2a/X9b0NYYkC+XApFT66YWwTJaKstgwvaEJn9jLEHSl58g
 aIg8sO359/ynwsh2O3DRSnGvbZW9l2IJt0S6a6AIzHDP166IUiGb5JW5dnf02mvjL26XsRpmtQC
 9GVByY0iY/T6X/r3SnWxM+xJXXd0i78sH0pUN/Tf9lAqPOnI8NuBHv7GDv+02RtkM8XMB3nAA5c
 H21ql3phApUFi6NfcJmNxLv0RnOv5cp0fWd25o1TpSDjR6GJL7qgCIQi7btBoEkwYP9WMXR19lp
 9z6lb8R+M3jY1Tg==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

Using CX as a regulator is an artifact of earlier times. Instead use CX
power rail as power domain from rpmpd.

Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 .../devicetree/bindings/remoteproc/qcom,adsp.yaml      | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
index 661c2b425da35c3756965fd1c47a485fe15a3f83..03e28d77da50912fe0e3106aef26cb93eb2d4142 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
@@ -31,9 +31,6 @@ properties:
   reg:
     maxItems: 1
 
-  cx-supply:
-    description: Phandle to the CX regulator
-
   px-supply:
     description: Phandle to the PX regulator
 
@@ -103,16 +100,6 @@ allOf:
         interrupt-names:
           maxItems: 5
 
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - qcom,msm8974-adsp-pil
-    then:
-      required:
-        - cx-supply
-
   - if:
       properties:
         compatible:
@@ -120,6 +107,7 @@ allOf:
             enum:
               - qcom,msm8226-adsp-pil
               - qcom,msm8953-adsp-pil
+              - qcom,msm8974-adsp-pil
               - qcom,msm8996-adsp-pil
               - qcom,msm8998-adsp-pas
     then:
@@ -187,6 +175,7 @@ examples:
     #include <dt-bindings/clock/qcom,rpmcc.h>
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
     adsp {
         compatible = "qcom,msm8974-adsp-pil";
 
@@ -204,7 +193,8 @@ examples:
         clocks = <&rpmcc RPM_CXO_CLK>;
         clock-names = "xo";
 
-        cx-supply = <&pm8841_s2>;
+        power-domains = <&rpmpd MSM8974_VDDCX>;
+        power-domain-names = "cx";
 
         memory-region = <&adsp_region>;
 

-- 
2.50.0


