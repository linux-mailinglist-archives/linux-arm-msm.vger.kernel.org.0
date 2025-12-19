Return-Path: <linux-arm-msm+bounces-85769-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF6FCCE726
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 05:34:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A784C303BE12
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 04:34:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E386C288535;
	Fri, 19 Dec 2025 04:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XLkzui5O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043402773DE
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 04:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766118874; cv=none; b=VH5yO6fJvAnw0HrT5/sjc9EDeXSypbFQEzX2zrUIWacIhXbsM9nTPfB4btjZ9PEQrP0pW3H+tAIngS8KM+EP68hc+kcqBW+g5xTlrjMUWGqliD2jOBLYF1iDLcBketD5+Mj5vSMceNt3yTWFua5fSX+07TZeshiD869HVOsjJBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766118874; c=relaxed/simple;
	bh=uS25iiIBULzLR/bicorlfOWYxX0KcwvIYLellnMXyT0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r7f0fidkJBm6dBdla8el9DzIimrNtUUrPFcwmJqeLcUs2nvZ9KafieP6Yj51uHvwr1Y8JklySNsBVo92gZnOW+u7VhI67Hkdz8IuEfWwnvb+fKqJl+/X4Y0/ihK+hv7N/9zdHWSFRHmCFYJtHDseRbptoUrEfnGXYlnjPXBgTPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XLkzui5O; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-78d6dc596eeso10648387b3.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 20:34:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766118872; x=1766723672; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GkDoBo0u4yTaxJuA5ect/89iZITmA1fXY8ywU/lXSCY=;
        b=XLkzui5OKYpGgm5Ov6jchx4MpdkbaxQYV1zdnvV3GQg+oX8BfLEfYIKiXcNl0XWcri
         4Gh7kc4REHGD/YMKz/MCjJefVsPM0ckJuzzEl3Q+FnxmmZ8YHKBqTGq6Q22G+H0l3c2d
         iSDXygNDEWgJymQsL53aqzZx8+9donI1VkTfOpQdJFMJ03rmPtTc6BegxHeSHX/BJR/N
         mi9rW8QWBKTU/pZac5agKktzLl3L4Y60at7DcPYcyiFM5RkDfLoZHDm/qZhauxMPEJWY
         hwzhfg3nA/vrC4IRFVFeG7qSK3T7rOO0zVmyvOC86zsjVXgz1U8j7aURLdmDBIbL4Mex
         w2cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766118872; x=1766723672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GkDoBo0u4yTaxJuA5ect/89iZITmA1fXY8ywU/lXSCY=;
        b=lmpBMQypyOAVhK0rOjfp20+M1W2yLtgxp1EgAmhTA1VOQu+q/dqonrBfUsaBrlsLce
         koWGFuv79yRedPOKOLVfXIM6KFYK3HfVEjh0OyAsuy9ECuhSFPUL9u1CXZD2bBaJkg6G
         Bad6ez4O0dPEKVoAWp4jkVD2xnYJvi1M14qbTtCeGp2IJBUf6woa+5UNXPkmNI3j/rln
         hQZZFzfB0fyzSYdtHZC+FdMNJ0gWVDMOmPCblyDrrfIdgLLqIQfNI4+43tqgAZZ2Nzbg
         UTYDmF7+w3L6Pl3vEefIfaUNPKYXO268RWMRdJhplI12ZuVX9+xPWHwKh1KRKEDJH3Tw
         f8rA==
X-Gm-Message-State: AOJu0YxpzV/FDBMQyW4JBA4cN0zIAfEZUIOSFTFNCD2KXKY5zvOVZyk9
	dXDsycLO7LsFkpqjjecRWfYa35if1pV5+HdLGbjLvjFhfUvvTbA/Hb7e
X-Gm-Gg: AY/fxX74EkBAhL9dAG9eQEzNlKUj/rm1R9csXHs7fgnYFAN+UMCkFdHkdUVYh52ucUa
	PHAJDNBQPtZZWNKxoJqYAsrdyt+8j6FFmH4PWhU286YT+Bb+pa84tzjr8KgBD1OkS8MrRqtmf05
	qsi3zu1j78tFxBzB1uXC3iX2ri2CaMnoKmw8M8D8YF888nkmXLP5HJg2AFak9lK2Z1ghqiQB5xe
	irjyjcqlBRtVItpgmeKVrHRCblNtZvWGQBIErZdV0kb6WnBGamC6yfb//c0kRwZdkLuIsWuVWGc
	DdKlohHeq9i1G8CMdFO3O/eUazwg+zVmY46yOtruquArVwlNCuH8AaWEUbFjgLGQRNdVFu3lJ4o
	jEjRlywtsBmo94Wv24okf9QHbx3DA92iE3EDIKH/cUOLQqqM27PgL90J0MCnYhL5QeEG7f1T3Ij
	nHSSa5hG51XW3YxdbflXgAUig0x57Qvl3xXPzpv82SkhioeFc/Sy77kCevxHw9QjRLIhTXXWXqw
	CheTub99e4JOOhKI2Ao6uYKbhZJ
X-Google-Smtp-Source: AGHT+IGM1SMDbe3sHrZGTZf74Bt/piR+JdXn3DQjoBMNtZBMw/3vgaIyr/E7kBtMXp25QqgPYbQf5A==
X-Received: by 2002:a05:690c:4809:b0:787:f545:c353 with SMTP id 00721157ae682-78fb3f10a2bmr15330047b3.16.1766118871987;
        Thu, 18 Dec 2025 20:34:31 -0800 (PST)
Received: from nukework.lan (c-98-57-15-22.hsd1.tx.comcast.net. [98.57.15.22])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78fb452c441sm5610227b3.46.2025.12.18.20.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 20:34:31 -0800 (PST)
From: Alexandru Gagniuc <mr.nuke.me@gmail.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org,
	krzk+dt@kernel.org,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandru Gagniuc <mr.nuke.me@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/9] dt-bindings: remoteproc: qcom: add IPQ9574 image loader
Date: Thu, 18 Dec 2025 22:34:10 -0600
Message-ID: <20251219043425.888585-2-mr.nuke.me@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20251219043425.888585-1-mr.nuke.me@gmail.com>
References: <20251219043425.888585-1-mr.nuke.me@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the IPQ9574 native (non-PAS) WCSS image loader. It is similar
to IPQ8074 WCSS, but requires several new clocks. These clocks must be
enabled by the host in non-PAS mode, and are not optional. Add an
example that uses the "qcom,ipq9574-wcss-pil" binding.

Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
---
 .../remoteproc/qcom,ipq8074-wcss-pil.yaml     | 115 +++++++++++++++++-
 1 file changed, 113 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,ipq8074-wcss-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,ipq8074-wcss-pil.yaml
index dea46cb9f93fe..a665b704a835f 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,ipq8074-wcss-pil.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,ipq8074-wcss-pil.yaml
@@ -18,6 +18,7 @@ properties:
   compatible:
     enum:
       - qcom,ipq8074-wcss-pil
+      - qcom,ipq9574-wcss-pil
       - qcom,qcs404-wcss-pil
 
   reg:
@@ -49,10 +50,10 @@ properties:
       - const: wcss_q6_reset
 
   clocks:
-    maxItems: 10
+    maxItems: 13
 
   clock-names:
-    maxItems: 10
+    maxItems: 13
 
   cx-supply:
     description:
@@ -107,6 +108,7 @@ allOf:
           contains:
             enum:
               - qcom,ipq8074-wcss-pil
+              - qcom,ipq9574-wcss-pil
     then:
       properties:
         qcom,smem-states:
@@ -117,9 +119,47 @@ allOf:
           items:
             - const: shutdown
             - const: stop
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,ipq8074-wcss-pil
+    then:
+      properties:
         clock-names: false
         clocks: false
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,ipq9574-wcss-pil
+    then:
+      properties:
+        clocks:
+          minItems: 13
+        clock-names:
+          items:
+            - const: anoc_wcss_axi_m
+            - const: wcss_ahb_s
+            - const: wcss_ecahb
+            - const: wcss_acmt
+            - const: wcss_axi_m
+            - const: q6_axim
+            - const: q6_axim2
+            - const: q6_ahb
+            - const: q6_ahb_s
+            - const: q6ss_boot
+            - const: mem_noc_q6_axi
+            - const: wcss_q6_tbu
+            - const: sys_noc_wcss_ahb
+      required:
+        - clocks
+        - clock-names
+
   - if:
       properties:
         compatible:
@@ -154,3 +194,74 @@ allOf:
         - cx-supply
 
 additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,ipq9574-gcc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/reset/qcom,ipq9574-gcc.h>
+
+    q6v5_wcss: remoteproc@cd00000 {
+        compatible = "qcom,ipq9574-wcss-pil";
+        reg = <0x0cd00000 0x4040>,
+              <0x004ab000 0x20>;
+        reg-names = "qdsp6", "rmb";
+
+        interrupts-extended = <&intc GIC_SPI 325 IRQ_TYPE_EDGE_RISING>,
+                              <&wcss_smp2p_in 0 IRQ_TYPE_NONE>,
+                              <&wcss_smp2p_in 1 IRQ_TYPE_NONE>,
+                              <&wcss_smp2p_in 2 IRQ_TYPE_NONE>,
+                              <&wcss_smp2p_in 3 IRQ_TYPE_NONE>;
+        interrupt-names = "wdog", "fatal", "ready",
+                          "handover", "stop-ack";
+
+        resets = <&gcc GCC_WCSSAON_RESET>,
+                 <&gcc GCC_WCSS_BCR>,
+                 <&gcc GCC_WCSS_Q6_BCR>;
+        reset-names = "wcss_aon_reset",
+                      "wcss_reset",
+                      "wcss_q6_reset";
+
+        clocks = <&gcc GCC_ANOC_WCSS_AXI_M_CLK>,
+                 <&gcc GCC_Q6_AHB_CLK>,
+                 <&gcc GCC_Q6_AHB_S_CLK>,
+                 <&gcc GCC_Q6_AXIM_CLK>,
+                 <&gcc GCC_Q6SS_BOOT_CLK>,
+                 <&gcc GCC_MEM_NOC_Q6_AXI_CLK>,
+                 <&gcc GCC_SYS_NOC_WCSS_AHB_CLK>,
+                 <&gcc GCC_WCSS_ACMT_CLK>,
+                 <&gcc GCC_WCSS_ECAHB_CLK>,
+                 <&gcc GCC_WCSS_Q6_TBU_CLK>,
+                 <&gcc GCC_WCSS_AHB_S_CLK>,
+                 <&gcc GCC_Q6_AXIM2_CLK>,
+                 <&gcc GCC_WCSS_AXI_M_CLK>;
+
+        clock-names = "anoc_wcss_axi_m",
+                      "q6_ahb",
+                      "q6_ahb_s",
+                      "q6_axim",
+                      "q6ss_boot",
+                      "mem_noc_q6_axi",
+                      "sys_noc_wcss_ahb",
+                      "wcss_acmt",
+                      "wcss_ecahb",
+                      "wcss_q6_tbu",
+                      "q6_axim2",
+                      "wcss_ahb_s",
+                      "wcss_axi_m";
+
+        qcom,halt-regs = <&tcsr 0x18000 0x1b000 0xe000>;
+
+        qcom,smem-states = <&wcss_smp2p_out 0>,
+                           <&wcss_smp2p_out 1>;
+        qcom,smem-state-names = "shutdown",
+                                "stop";
+        memory-region = <&q6_region>;
+
+        glink-edge {
+            interrupts = <GIC_SPI 321 IRQ_TYPE_EDGE_RISING>;
+            label = "rtr";
+            qcom,remote-pid = <1>;
+            mboxes = <&apcs_glb 8>;
+        };
+    };
-- 
2.45.1


