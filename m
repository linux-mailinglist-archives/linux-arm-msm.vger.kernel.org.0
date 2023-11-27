Return-Path: <linux-arm-msm+bounces-2130-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2D57FA53F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Nov 2023 16:52:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 64FE2B212EA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Nov 2023 15:52:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C28B347D3;
	Mon, 27 Nov 2023 15:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OhfiMbAS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 476D7D4C
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Nov 2023 07:52:33 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-a00b01955acso631021866b.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Nov 2023 07:52:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701100351; x=1701705151; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=47QyN1mARPQG0EF8lxrYb1VJmjeAmYEb6KvC/0GnTPA=;
        b=OhfiMbASj2LyZHj2bFCrD9V0OopmoIztmDEcoF4UGiolgSC8/XEo21WgQkyx59VRUs
         4W0PkZzP+e0vwsXe1+ru9QnPA0J+oH/lKwRHH5e+FfIh16JeVJWgYlaCsBP9BMHvIU8M
         L8icG/i42Yc3jfBLFg0oYwItJYAOczt0m2hYPPV2WxQ8t/OQf2hoO26zudVh0O4PMoe4
         5e0OBEYUjvE6su19SQmrhcSJRxs0My+Oa397zeeBwBRDFU/xyN5qh27BlrtJk2JxbYQb
         SL/fqF+CgsIrx1nQ5cYzS/mQuadoBi0N+YJt95tVgSAwqY0CyTdcjEqJmx97AboZfyf1
         rGaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701100351; x=1701705151;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=47QyN1mARPQG0EF8lxrYb1VJmjeAmYEb6KvC/0GnTPA=;
        b=XnTHL51eUAaovfifl5a/oPNfMQ49Wp3TNtuWPZ4srkXHtk3OIz7jfrWE8SG/u9m0uF
         s20X2NMQQDXMPetN4aveEgF+1Rzkxk2sMaTZsaqnO8imH2co3XNB/deLF+5H+EnUe2WV
         Ca+AMHXKopm47wtT8HMOr0sRTeWtXfylz3hbQe5P/PWM6OHX0YivVgMlY9NTgHqXKwd4
         IbVMG01Mm+o01f1Wluagv+Zre3ParPEMGH+/xa+CF3omOUMuXkVaWhNovU9YDm0+4XBn
         rKlGABb9LPfDDO0+zQ0tdpe8y6SIvn9YGGj+mUwX7qiiFmlM+EMVJOM/nXpLVx9Iq8PP
         8bSw==
X-Gm-Message-State: AOJu0YwsiUqoNBnGkTrpRTCOX1MlDHCNbHebtM+vPTFhGF+piwJEOmCn
	9s8T93i3v+auxmbtpulcGtL0ubKAqM7tGPLEIrw=
X-Google-Smtp-Source: AGHT+IHlI+2GyN+pTXPLUIHl82AsYDnLdrlfx6uE0wlcWEcsj6YRdcmqrTlbA7tiW0BFKy303dKM8g==
X-Received: by 2002:a17:906:2c4c:b0:a04:bd7c:b7f7 with SMTP id f12-20020a1709062c4c00b00a04bd7cb7f7mr8818684ejh.64.1701100351376;
        Mon, 27 Nov 2023 07:52:31 -0800 (PST)
Received: from [10.167.154.1] (178235187180.dynamic-4-waw-k-2-3-0.vectranet.pl. [178.235.187.180])
        by smtp.gmail.com with ESMTPSA id mb22-20020a170906eb1600b009fc0c42098csm5855150ejb.173.2023.11.27.07.52.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 07:52:31 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Mon, 27 Nov 2023 16:52:12 +0100
Subject: [PATCH v7 1/2] dt-bindings: interrupt-controller: mpm: Pass MSG
 RAM slice through phandle
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230328-topic-msgram_mpm-v7-1-6ee2bfeaac2c@linaro.org>
References: <20230328-topic-msgram_mpm-v7-0-6ee2bfeaac2c@linaro.org>
In-Reply-To: <20230328-topic-msgram_mpm-v7-0-6ee2bfeaac2c@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Shawn Guo <shawn.guo@linaro.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1701100347; l=3285;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=UnAJ2EWA9JR18tWPDeobMem6WcpQTcTZkHcMBc8DA5o=;
 b=6hyNFuljkC0LUFiRqT23DUyz8Mhfre8bXxB7IXiD5VbX/ZqGXggcwRPETj6PbbKE0naEU5tQV
 pzzAeZ5fIZVC3JF8oeSLTD8o3hEgLRxtDLGu96oOQmgRNVbwiEa7YTR
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Due to the wild nature of the Qualcomm RPM Message RAM, we can't really
use 'reg' to point to the MPM's slice of Message RAM without cutting into
an already-defined RPM MSG RAM node used for GLINK and SMEM.

Document passing the register space as a slice of SRAM through the
qcom,rpm-msg-ram property. This also makes 'reg' deprecated.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 .../bindings/interrupt-controller/qcom,mpm.yaml    | 52 +++++++++++++++-------
 1 file changed, 35 insertions(+), 17 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,mpm.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,mpm.yaml
index 509d20c091af..4ce7912d8047 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,mpm.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,mpm.yaml
@@ -29,6 +29,12 @@ properties:
     maxItems: 1
     description:
       Specifies the base address and size of vMPM registers in RPM MSG RAM.
+    deprecated: true
+
+  qcom,rpm-msg-ram:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the APSS MPM slice of the RPM Message RAM
 
   interrupts:
     maxItems: 1
@@ -64,33 +70,45 @@ properties:
 
 required:
   - compatible
-  - reg
   - interrupts
   - mboxes
   - interrupt-controller
   - '#interrupt-cells'
   - qcom,mpm-pin-count
   - qcom,mpm-pin-map
+  - qcom,rpm-msg-ram
 
 additionalProperties: false
 
 examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
-    mpm: interrupt-controller@45f01b8 {
-        compatible = "qcom,mpm";
-        interrupts = <GIC_SPI 197 IRQ_TYPE_EDGE_RISING>;
-        reg = <0x45f01b8 0x1000>;
-        mboxes = <&apcs_glb 1>;
-        interrupt-controller;
-        #interrupt-cells = <2>;
-        interrupt-parent = <&intc>;
-        qcom,mpm-pin-count = <96>;
-        qcom,mpm-pin-map = <2 275>,
-                           <5 296>,
-                           <12 422>,
-                           <24 79>,
-                           <86 183>,
-                           <90 260>,
-                           <91 260>;
+
+    remoteproc-rpm {
+        compatible = "qcom,msm8998-rpm-proc", "qcom,rpm-proc";
+
+        glink-edge {
+            compatible = "qcom,glink-rpm";
+
+            interrupts = <GIC_SPI 168 IRQ_TYPE_EDGE_RISING>;
+            qcom,rpm-msg-ram = <&rpm_msg_ram>;
+            mboxes = <&apcs_glb 0>;
+        };
+
+        mpm: interrupt-controller {
+            compatible = "qcom,mpm";
+            qcom,rpm-msg-ram = <&apss_mpm>;
+            interrupts = <GIC_SPI 197 IRQ_TYPE_EDGE_RISING>;
+            mboxes = <&apcs_glb 1>;
+            interrupt-controller;
+            #interrupt-cells = <2>;
+            interrupt-parent = <&intc>;
+            qcom,mpm-pin-count = <96>;
+            qcom,mpm-pin-map = <2 275>,
+                               <5 296>,
+                               <12 422>,
+                               <24 79>,
+                               <86 183>,
+                               <91 260>;
+        };
     };

-- 
2.43.0


