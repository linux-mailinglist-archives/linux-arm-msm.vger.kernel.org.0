Return-Path: <linux-arm-msm+bounces-48935-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 79AE2A3FAB1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 17:18:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6985B864242
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 16:07:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20ABA21518B;
	Fri, 21 Feb 2025 16:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xOiSueHh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249291F1506
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 16:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740153644; cv=none; b=fPppTACNczj0lPqnddeTGkKg1gs9OB80CfPv7bJMw9V8WghEwQMcYmHkc2j+et524A7C33yQOncsPh1wYGjdNCw/gWf/fVVRCWAVsCxBO2sjYyy3PobwmqVwrcVCXr5hSqiFW0U26V4ROMHSoqoUOpWelZtDdzVzP0A3wtwcFik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740153644; c=relaxed/simple;
	bh=Q9/weWMqsRUAJgN7rFGcM/rDMNKtQZwTpoVO7ftqEdc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aKvCOmGprw1S4VyniY0JkXxMqnV6Ye4O/XZc7s28mflS6pbqpC1MFa1rWt2mtdVkMcIkus/sYp3VJgBD2ajb/iqBcdw/Fi1bSx50DOgpj0x3W3Zj8rzd28lOBTEla++azaDxk67zgCtk6s7RcxpFQCuHDUY9mPpufJqUoj1mUoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xOiSueHh; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ab7e08f56a0so40597266b.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 08:00:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740153640; x=1740758440; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=97064Lo4S+yLBMHfAaUS5/jSMM3joMD+alo0JyNN3fU=;
        b=xOiSueHhy8QF7hfHeYYoZQdtdv3OW1EfLtPRwYADfKK9JsViiO55gdIFwrbE87H61l
         Ly4vNSNKrvmzgubU7rU0DYhc/jqKWu56GHAjpd258AMDuFVU6Jd14lJvGQ9JlbbbK0sf
         kp6f/IV+oMCBVGvL9ywKRh5ZV5MLbf7qWgyIpEPb0ZGlbtpieuXgeLZb8RBoN8zz7bL+
         kCFAZ5lawUoy81GNK1+7VtAR6rdXmYYQkgiFvEjhKaEHrJHsj07/jW+/h+PjiVDRlQgb
         eCcE0Mo5Qoh7XxGnJGmMsj82n7sfnOpAUoGnUyG3si4HdcF1pR3c9OyaZwg9JP3nFGn8
         2k6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740153640; x=1740758440;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=97064Lo4S+yLBMHfAaUS5/jSMM3joMD+alo0JyNN3fU=;
        b=it04j5LHm8Of61d0plL7rKG4wAUVQJSKpNtYPpgEyJDJq7XUA3j6xe+0N32piN35Az
         WUW9VuOLOEYgqh3aWnNw5dRK5WYdsCA7oc0qeY3xg9K0DrT1epKAUlgMvNGgYwvBI0NP
         o6l5mL4aZh6Sj+uMtvoga7tJ4faI24VhlhKdfn/tN05TLIYxoX2s2MD7HA2JsLVPjCs6
         QjjeJ7NRQLdi9YHkqu3cAZRfBavrzzZHuqeYAw5BqBL7V1ElJBjxND2VQUI72b1I6DfX
         mmWvwr4oTel2CRE7ENVqGiHKPOIv+7k/pBoeKSuuZCQVm7tDlguJxIFtzRsk3iRfyk5k
         kiug==
X-Forwarded-Encrypted: i=1; AJvYcCWqimMiAgVcQk09GMG0cw05Iu6xIhF+uYBjaVECatGHYp29fQ2bGWrNdp3AjOw5ZxBOBVL9GxyMURLmtFK2@vger.kernel.org
X-Gm-Message-State: AOJu0YwktwTvjNbXKOeK/ahYllNyYR66zisG9iyxLlv3btZcbf2dmVME
	+N/5RA8WFDrbLJPueMvCz9IDN5pblIIxDDWeUSSREw1D4mOzYni0OFEcHiJqn9Y=
X-Gm-Gg: ASbGncslCYhz3LdT/1qCjPI/2ypJTpACHtbmsnx9fBgCxTrl+7MvNoVpGGm98ehMaLb
	Oi12QBgid/rxMfbdrWrcAU3V5HiRZMah/SCR2ba1NJ6+caK+dfsY/mIbF8sQkyJp8gKzNKY215E
	+04k+J5KvVQns942EXmFjU3XvO3BM9KUM5wyUKJ5yX4YFRjJGZV3d5MHB3DSE0a74X+WEpsp6vv
	MSBclIxf/wwnMZQU+2DVp43pcBjhTlIp++lV4bKH5qI53FyeXKkB3JDEoJZ5ysuyYs0sQ6p3R/f
	cpO93Yix4Gbqupciyu41tEUlU74O8V5bZjAD38RZZz9FqIGdZRzswdylJRNw6KZsMkZmiFoqDXA
	=
X-Google-Smtp-Source: AGHT+IHhkj9hOW37OUEtDt15pY4+O+vqnXmLkqZtiWM6bCvEaBTH0PBg3GND1eglU1hwgUThMgFgSA==
X-Received: by 2002:a17:907:2ce2:b0:ab7:cd83:98bb with SMTP id a640c23a62f3a-abc09a3c1c5mr146987666b.5.1740153640111;
        Fri, 21 Feb 2025 08:00:40 -0800 (PST)
Received: from krzk-bin.. (78-11-220-99.static.ip.netia.com.pl. [78.11.220.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb9da9f0desm983616166b.105.2025.02.21.08.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 08:00:39 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3] dt-bindings: remoteproc: Add SM8750 CDSP
Date: Fri, 21 Feb 2025 17:00:36 +0100
Message-ID: <20250221160036.159557-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add remote processor PAS loader for SM8750 CDSP processor, compatible
with earlier SM8650 with minor difference: one more sixth shutdown
interrupt.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changesin v3:
1. Split MPSS into separate patch, keep the ack.

v2: https://lore.kernel.org/all/20250220154132.199358-1-krzysztof.kozlowski@linaro.org/
---
 .../bindings/remoteproc/qcom,sm8550-pas.yaml  | 29 ++++++++++++++++---
 1 file changed, 25 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index a24cbb61bda7..8bfded3c66ef 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -29,6 +29,9 @@ properties:
       - items:
           - const: qcom,sm8750-adsp-pas
           - const: qcom,sm8550-adsp-pas
+      - items:
+          - const: qcom,sm8750-cdsp-pas
+          - const: qcom,sm8650-cdsp-pas
 
   reg:
     maxItems: 1
@@ -114,6 +117,23 @@ allOf:
         memory-region:
           minItems: 3
           maxItems: 3
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sm8750-cdsp-pas
+    then:
+      properties:
+        interrupts:
+          maxItems: 6
+        interrupt-names:
+          maxItems: 6
+        memory-region:
+          minItems: 3
+          maxItems: 3
+
   - if:
       properties:
         compatible:
@@ -184,10 +204,11 @@ allOf:
   - if:
       properties:
         compatible:
-          enum:
-            - qcom,sm8550-cdsp-pas
-            - qcom,sm8650-cdsp-pas
-            - qcom,x1e80100-cdsp-pas
+          contains:
+            enum:
+              - qcom,sm8550-cdsp-pas
+              - qcom,sm8650-cdsp-pas
+              - qcom,x1e80100-cdsp-pas
     then:
       properties:
         power-domains:
-- 
2.43.0


