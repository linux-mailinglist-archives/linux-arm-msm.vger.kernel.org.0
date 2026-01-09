Return-Path: <linux-arm-msm+bounces-88176-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CDCED07249
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 05:36:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 82684304F164
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 04:34:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B8B729D26C;
	Fri,  9 Jan 2026 04:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vt8sm4tb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A0642DEA70
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jan 2026 04:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767933254; cv=none; b=Gusbkrqt2FVYY0r7+I95wflplLHjtCJ+ZWUtRnGh5bp0j4OlSL7tYzoOe5rmauC266blnKsRvgZcWlGgdbPexyWTpMHLM05a/LtZX70cI2opaP8OzHAlIngAoufsxVRxsSMjgWqGDZNVw1LV/j5Kov903qMAgvNxczUAV+QRnYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767933254; c=relaxed/simple;
	bh=LhJaa2EqMb5zW7D+67KHtimJSY7IGXFH2uVklgbAO1c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HrZsD56ckLHYHp1PGA0ZpP2k/vPczlytUcOcj7Iz16Ww3xzQB9DRPNgNQV+hsd26QGQrB0khv0oMDpcDIPypW4uup/1DJc+5bM6z5IPr5a9xZ23QyqVMUT3JL0j2VHIEQ4zyemiquBszIHzchi+etzuS6erg5uocJXyv80HBJq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vt8sm4tb; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-3e80c483a13so2449853fac.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 20:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767933249; x=1768538049; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ZyuZP5Wvq2lu1NK8tZ306A4v+hSioBXOaeCovmmUS4=;
        b=Vt8sm4tb+SxfK7P1II24mvskPWhyyi3LFvoAb1mUKwiLc04bgmhfl1GtgcjJZ3Ckan
         nzO8zpqdUmdC3Du8iVWPo4O6fa0KOFQWhKPbKyu3CbgaYZ5YCJsIume0WOy+Wcd25P3P
         fK/O4Yv4qf1zXFyHcN+3nbU0hg/6L2CRHCRsdBgQROORGwy/Xt7ymp/JoCJoBcUt5jlV
         LAFtE3xJ/ZVGJKLvXSI/rKxOd9TO3BmNk7Cr/2BmKk8mX3X80CEDQW2AIOLHmb76QCin
         8nZG6bpgVDmPrPrXCU3xCll5iBCgMOaUmrh5Q/ulU023n2L44rfkLsS9OJb9iVyzHIbl
         LXoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767933249; x=1768538049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+ZyuZP5Wvq2lu1NK8tZ306A4v+hSioBXOaeCovmmUS4=;
        b=ow45P3JoGtA4q9egLBwlI08DRQbtduJs71qhNzfyOrAsNnissePuOjGorzE0QzaUMu
         ye7GNg2uM9mxGkcHqAhzRWqyhaJxldgkKsF3oDoTkB1R0L4izUu1CSMPSIlScExBK002
         qJ/re+J7YzNVlHAcMQNmBgUsrCDF9AdFHQC67AVczvwme3lyukJdRnm2sUK1vhKwGUCe
         3oCp+BMHh2O0FuMImJvlp7NGeUQQO8MiaqPWIqxVBKJCjGCcsmOopRQwtMcU5bWmU7BS
         JAiXGi3Z0+RA2HJ4yHgngVfsiN28LcKNXiyemgy/VDc13serD80qhDs37DTrXmuSjcdl
         Y+3A==
X-Forwarded-Encrypted: i=1; AJvYcCWY4wps1oApjUHNvgyShuF9jhPrkFtigoIJ9+J1BfY2PE75ko2IW4oAb+B2JPPyQUhW1yX85DsMKMn72EJo@vger.kernel.org
X-Gm-Message-State: AOJu0YxFsk3OWfvCqjkUyZVg7wMiWBlBQdugQ6kYMl048A/bh6YGowW0
	8UHuGy46wX/fTZvbdeCXBmfkt9Nltb0f4xm0qOh5FmVQL2Wb18d1nJRK
X-Gm-Gg: AY/fxX5fcalTX71MTEqaVlc/bI/23Czvz6CtOmmepDz2nAx/5eH72BUxNmKHV+YUpVp
	zo44qeMVfIlXf0EuQ8wsD7iwqBUIXS3uCmpO8ZkWIkWZ+qGQrCo8ew0Tn3AuEIIeB9/8UKjRux0
	VS0x1bvsiE8+iHBX3qCK+wCirvIhL2QSX5q03rbXMTdjLrXDO9eNp6Lq8KfzvpLDD1QKQwahfYQ
	U9Yv4U+jsC76f9x5DiWL2hUGDWjctZ1hdBaKNyHHmj4BnZ2trdwUsSgfcr27PAMhpRpzKJw10BH
	53c9UValr5WMgG+YikVoefcNHr5SXmHlk1z3iD6lYj2HOrRnqYCHOjroeFMn1btspGZi/7Z7tch
	z1agmH/HbLe8n4TOnRH2PYNcev2zsQpVnZuvq55aBFAeaxpvkD2aZHSrr0fbLya0TwbDsqVRHjD
	KnuLBysdDlqxXRFYx2mtaz+sznbKIT2v/QTaihocICh2Ix2iSog7OrPxmIaH8u/wlyvpkDmmgs8
	AnCtQEilkWrolPwjfoy0aqzlIoldePuHXD7+mg=
X-Google-Smtp-Source: AGHT+IG42nYET+oAEeyex5Lzv/1BoWn0YgdOYIjQB8kYL7Gk9E5M2tIrz3ZjMHML9QGGDUPQUmBFlA==
X-Received: by 2002:a05:6871:e6:b0:3ec:3dbd:d4cc with SMTP id 586e51a60fabf-3ffc08ff16dmr4184456fac.8.1767933249275;
        Thu, 08 Jan 2026 20:34:09 -0800 (PST)
Received: from nukework.lan (c-98-57-15-22.hsd1.tx.comcast.net. [98.57.15.22])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-3ffa515f4dasm6274421fac.21.2026.01.08.20.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 20:34:07 -0800 (PST)
From: Alexandru Gagniuc <mr.nuke.me@gmail.com>
To: andersson@kernel.org,
	krzk+dt@kernel.org,
	mturquette@baylibre.com,
	linux-remoteproc@vger.kernel.org,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandru Gagniuc <mr.nuke.me@gmail.com>
Cc: konradybcio@kernel.org,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v2 4/9] dt-bindings: remoteproc: qcom: add IPQ9574 image loader
Date: Thu,  8 Jan 2026 22:33:39 -0600
Message-ID: <20260109043352.3072933-5-mr.nuke.me@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20260109043352.3072933-1-mr.nuke.me@gmail.com>
References: <20260109043352.3072933-1-mr.nuke.me@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the IPQ9574 native (non-PAS) WCSS image loader. It is similar
to IPQ8074 WCSS, but requires several new clocks. These clocks must be
enabled by the host in non-PAS mode, and are not optional.

This binding did not have an example, so add one which uses the
"qcom,ipq9574-wcss-pil" binding.

Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
---
Changes since v1:
 - Fixed order of clock-names
 - Also use minItems: for clocks and clock-names
 - Explained why example is added to binding.
---
 .../remoteproc/qcom,ipq8074-wcss-pil.yaml     | 116 +++++++++++++++++-
 1 file changed, 114 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,ipq8074-wcss-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,ipq8074-wcss-pil.yaml
index c9bdd46fc745..865c11ee6d0c 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,ipq8074-wcss-pil.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,ipq8074-wcss-pil.yaml
@@ -19,6 +19,7 @@ properties:
   compatible:
     enum:
       - qcom,ipq8074-wcss-pil
+      - qcom,ipq9574-wcss-pil
       - qcom,qcs404-wcss-pil
 
   reg:
@@ -50,10 +51,12 @@ properties:
       - const: wcss_q6_reset
 
   clocks:
-    maxItems: 10
+    minItems: 10
+    maxItems: 13
 
   clock-names:
-    maxItems: 10
+    minItems: 10
+    maxItems: 13
 
   cx-supply:
     description:
@@ -121,6 +124,44 @@ allOf:
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
+            - const: q6_ahb
+            - const: q6_ahb_s
+            - const: q6_axim
+            - const: q6ss_boot
+            - const: mem_noc_q6_axi
+            - const: sys_noc_wcss_ahb
+            - const: wcss_acmt
+            - const: wcss_ecahb
+            - const: wcss_q6_tbu
+            - const: q6_axim2
+            - const: wcss_ahb_s
+            - const: wcss_axi_m
+        qcom,smem-states:
+          items:
+            - description: Shutdown Q6
+            - description: Stop Q6
+        qcom,smem-state-names:
+          items:
+            - const: shutdown
+            - const: stop
+
+      required:
+        - clocks
+        - clock-names
+
   - if:
       properties:
         compatible:
@@ -155,3 +196,74 @@ allOf:
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


