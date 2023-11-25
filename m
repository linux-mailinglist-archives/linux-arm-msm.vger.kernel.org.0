Return-Path: <linux-arm-msm+bounces-1978-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9003D7F8BA4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Nov 2023 15:27:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1EACD1F20EE9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Nov 2023 14:27:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69553171DB;
	Sat, 25 Nov 2023 14:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pBEkKGji"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86E6DBC
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Nov 2023 06:27:16 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-a03a9009572so384462466b.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Nov 2023 06:27:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700922435; x=1701527235; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=47QyN1mARPQG0EF8lxrYb1VJmjeAmYEb6KvC/0GnTPA=;
        b=pBEkKGjiuwf9VEoHu490nlCZBjOBjDyL04flWWAhWC7bykcoeilUd28oOHCwAkaYKQ
         OgkSmg7UrsYe11h2n8e3Q6C2tVsOvlUEC+38tD51adMzAU27piFeWaoQZTo+wB1vAjxf
         JZnYk55hlsK8OQkuR5tKJRpTCWlqpJrb/Kpuy0GScjSn0szJJ93RG+634NuYRt3av1QW
         CS9KoRVE1n2mifXMB/O/A+T4cRkcGd0w3IlxVwIzi+R10l7I0hyOvF5G/d6Yu2E4XJKv
         O8quX7//8PmIp4qsDGcnhreANSdYYqZETX6yYN7fDM+vvHlydQoI7wjB46hOC88nE59D
         cg1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700922435; x=1701527235;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=47QyN1mARPQG0EF8lxrYb1VJmjeAmYEb6KvC/0GnTPA=;
        b=eNsOOEiYwYLcnywkTaXIZvPgczM0pA76iSY83anZlAivPvgzzjhH7vLB0HP7r/SARD
         sZDrqfp5XGm8E5ORAlR0yvxu8wLpz2HbFMQGK6CPZOjd19f/AuaXpTixavRedXmIFikZ
         OddE4kPr7+8zQkabHLKp/dCRv5T15QwwjAbHHSnULokNWbh0lTCOWAtCw9H38kRrZuE3
         IbkOTK5GnBYLBzufvdLDsDctFyCKlTyABQG60OeTLh/dlaoqvWo3FdWBwDz1qJ6TJsf9
         IboMkoIL1AlCn4tVpFFYt5IekQLoNNZbu9NUgX3FQKvtS/P87DgPpTEeMsdBfG/lsdDo
         XBWw==
X-Gm-Message-State: AOJu0YxKW/iXI2CBB+xeHwBvhTBYg2dqi6nY7gWS6xL0zhaZQ/uBQwx0
	LRvP9Fde0H/iCQyOBZXjXzHmUw==
X-Google-Smtp-Source: AGHT+IHXS1ts9rv22L6h9UkqSrfCjVQbW88nYZhMcmkD3NegVS+kQ/9FMcjMzB0/6/ofi/zH1Sa7HA==
X-Received: by 2002:a17:906:5950:b0:9bf:60f9:9b7c with SMTP id g16-20020a170906595000b009bf60f99b7cmr4361155ejr.62.1700922435080;
        Sat, 25 Nov 2023 06:27:15 -0800 (PST)
Received: from [10.167.154.1] (178235187180.dynamic-4-waw-k-2-3-0.vectranet.pl. [178.235.187.180])
        by smtp.gmail.com with ESMTPSA id cb8-20020a170906a44800b009fd4583851esm3569253ejb.178.2023.11.25.06.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Nov 2023 06:27:14 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Sat, 25 Nov 2023 15:27:03 +0100
Subject: [PATCH v6 1/2] dt-bindings: interrupt-controller: mpm: Pass MSG
 RAM slice through phandle
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230328-topic-msgram_mpm-v6-1-682e4855b7e2@linaro.org>
References: <20230328-topic-msgram_mpm-v6-0-682e4855b7e2@linaro.org>
In-Reply-To: <20230328-topic-msgram_mpm-v6-0-682e4855b7e2@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1700922431; l=3285;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=UnAJ2EWA9JR18tWPDeobMem6WcpQTcTZkHcMBc8DA5o=;
 b=2NrJMi4Wx+FGVOzYyLITnbX5suwHJ1qk4x1+EdNB/0gWA9Tu7x8Maq1745tzQFYNIqkSBMs8m
 vcFVDVq+keCDu6x+TGKskBrfJ3kSUJoxOxM+B7HB/BZ3m3sBIZRhsJC
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


