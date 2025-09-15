Return-Path: <linux-arm-msm+bounces-73564-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0BCB577D5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 13:16:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 610CC189017C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 11:16:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9FBA2FF178;
	Mon, 15 Sep 2025 11:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="UGO9NLVl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451A72FE570
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 11:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757934939; cv=none; b=F4RuxCrNzyg7oJlESCRPqR68D1K073ImBomtdmrAo8Evi015jO4fCcn4lxPJdoKy95bg0BQz7soQiZGV6df9JrPFyw/ce7IyzFJl5WOZeeOvEZ9c79Yq9lPz8dkv7V+rrQ++0S2LcvGL6xOHqLs+R0QfUBZPZAzVhs6KsuhbXrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757934939; c=relaxed/simple;
	bh=o2SanjqHk6qnDd+wWkKmHcO5t3xD1dkqEcdLpfu6ivU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tSDSR3j0MMhfKKzGrykN4VMZ/wzRM+SqrnCt4viiUlEYKrcR70FgA4hZ5+YEaRNN4xb0fRlRxtSSsxP4THbfH7iUdbf+K0Y/F8JVQSI9L3cA7/UgCPxp7X7oCiEEmBIf3PoLupagyi4w6IqgDyZESL2n+m3u5b5OCgA/S+EhAiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=UGO9NLVl; arc=none smtp.client-ip=209.85.218.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f65.google.com with SMTP id a640c23a62f3a-b042cc39551so681469066b.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 04:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1757934935; x=1758539735; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xjVlm8rsC6PwMG44HWGJ9be5u9oyUBg4g4pdS6rOhs4=;
        b=UGO9NLVl4fTpiolqtVUSEUkwRbM+zcX6Det8rioyj1Eo0SC3CdUheQbMIgZiEHABAR
         tnMLibVcnM+Si0hjQr0BoZPzUeDvp4/mCtzo8n75GXkJlV+72/rdiElcQ9dA2EyQIxF8
         7/0btAKWczFPX/ppP71XQ4NYvgTAi9erPWd/JLSPIolxhkrP4wPy8IvGTDEcB0Aq88q4
         C9eXMWRrQyITJR+etEGWRsZRDSWvd3O6ieMBxzdDrAn2661lYZSxtItrjR8uEHokon8M
         H1hqVDNXVyEhUWTY9sKu2bD+7JrMGuq0+85fjXPwOspp+quPnNlcRacsT14SxH8HuzpZ
         jctA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757934935; x=1758539735;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xjVlm8rsC6PwMG44HWGJ9be5u9oyUBg4g4pdS6rOhs4=;
        b=WtnYEXUTgmqNSdEeq2pEpi5uZ7DuAhL0+cynOejr2I8SFX756q+cMwgNQ/WndwdQU0
         fNK1KzJk2Tc7FCfNSpls8GhSCPT7Dow80s9pQ7Tv5vO8gCy53z3fX3zskWUqPPVGiFfV
         LBdFR0OI8IeBzVCIHxpq1o4VT1TzIYYjd+zY1nQmwS1xktJwhDg+hMoc9e4raFXji8b4
         x1KnIsrx/rdhMtgSn0bNZNosIf9B2ZPHGdZYBPbze+HL0E35Jqz4OHghtEESpnlN80nm
         r4dINljaslraXjK5oUscYwfVP6j2Xcn3E9xZXsOCIm1GdfN6Mayc6of4tKBWRnWUaUeO
         cVkw==
X-Forwarded-Encrypted: i=1; AJvYcCXpS+dPdVaCHmJkcXajo6SB3GLTOJ8wB7O6/24lTJW6omjvQuxMidxgDWgPUoWeBqj8a1Dy7u0cxwP1tXa8@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo1g27ItEWEX+IJAeT8L5DDMhA6jIKYwEtRKOW9X93FCjK/lZn
	hWfJo/U+NyDPTR0P8mfHhed0iGSYWvF29aVeE+Gpe8ux+WQVxttcYlZDfQtxsAaStwU=
X-Gm-Gg: ASbGncsaNPhPa2Amm0bmXRW7JhcazBFWeYeQYWTzxWuwe6fUCfJ77cBfEqsMlyUhH4n
	8mjNtVkQE4Sy/ybWo/J1MSK7uEFSW43hfzbR/jG8phgtyfWFelvELUSq2M3K+rNzswB2MUSH46R
	n0p7V4Or8WGvnZQVZBBg/toBZXYIUz/ddTRghOG4epywxZYlc/A391E+7FZj6dVlJWaY5aNjbLV
	vQnSJ5iaE4ftR5WkUSHpIk3moYRXZ9Rthw851npilmoaXgIJ6LZPpBt7MiY0JPrFKngTEH+O/v4
	r4lD3jkDVhWKsBlBC8GFRMby6+oGiIFvyeGCe5ktfh+gEGzdiYKZ5fOXWFeOKhPBip4wDHY0QPl
	oTvT5L2xVnbOZsYMo7tbU5exu/W/kU1iOWuF9+/q+w7nWs/xX37qiMEZyEtgYtDtAJqFn/mzAEn
	AHI5yxVeMPK1sBK8g=
X-Google-Smtp-Source: AGHT+IG9t6wQqC94huNHEO0i/ACIuWHJplvCU1nOmVnPcfbVmlAzB9rL2asGA/AjFNU8hP8sFfknxA==
X-Received: by 2002:a17:907:2d0b:b0:b10:f70b:c0c9 with SMTP id a640c23a62f3a-b10f70bc355mr294908566b.55.1757934935266;
        Mon, 15 Sep 2025 04:15:35 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07d9e18c24sm561851366b.61.2025.09.15.04.15.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 04:15:35 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Mon, 15 Sep 2025 13:15:18 +0200
Subject: [PATCH v5 1/2] dt-bindings: remoteproc: qcom,milos-pas: Document
 remoteprocs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250915-sm7635-remoteprocs-v5-1-96526cac59c6@fairphone.com>
References: <20250915-sm7635-remoteprocs-v5-0-96526cac59c6@fairphone.com>
In-Reply-To: <20250915-sm7635-remoteprocs-v5-0-96526cac59c6@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757934933; l=6132;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=o2SanjqHk6qnDd+wWkKmHcO5t3xD1dkqEcdLpfu6ivU=;
 b=nuUGmYNwcFoDkaD0+pIVa7hhOkPQCTJEF3uYYpFC0kh0Vns4RDXWE2SmpnqfX2vSJIJLA0iF7
 hsbA+bU+k/tCGVyWKJzjAX2QC2uyeu4n8sN/Ut+ZNar1GPnb4HlGtzV
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the bindings for the ADSP, CDSP, MPSS and WPSS PAS on the Milos
(e.g. SM7635) SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../bindings/remoteproc/qcom,milos-pas.yaml        | 198 +++++++++++++++++++++
 1 file changed, 198 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,milos-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,milos-pas.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..c47d97004b33034be92f849c03c8cd457c8d9339
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,milos-pas.yaml
@@ -0,0 +1,198 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/remoteproc/qcom,milos-pas.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Milos SoC Peripheral Authentication Service
+
+maintainers:
+  - Luca Weiss <luca.weiss@fairphone.com>
+
+description:
+  Qualcomm Milos SoC Peripheral Authentication Service loads and boots firmware
+  on the Qualcomm DSP Hexagon cores.
+
+properties:
+  compatible:
+    enum:
+      - qcom,milos-adsp-pas
+      - qcom,milos-cdsp-pas
+      - qcom,milos-mpss-pas
+      - qcom,milos-wpss-pas
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: XO clock
+
+  clock-names:
+    items:
+      - const: xo
+
+  interrupts:
+    minItems: 6
+    maxItems: 6
+
+  interrupt-names:
+    minItems: 6
+    maxItems: 6
+
+  qcom,qmp:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Reference to the AOSS side-channel message RAM.
+
+  smd-edge: false
+
+  firmware-name:
+    minItems: 1
+    items:
+      - description: Firmware name of the Hexagon core
+      - description: Firmware name of the Hexagon Devicetree
+
+  memory-region:
+    minItems: 1
+    items:
+      - description: Memory region for core Firmware authentication
+      - description: Memory region for Devicetree Firmware authentication
+
+required:
+  - compatible
+  - reg
+  - memory-region
+
+allOf:
+  - $ref: /schemas/remoteproc/qcom,pas-common.yaml#
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,milos-adsp-pas
+            - qcom,milos-cdsp-pas
+    then:
+      properties:
+        memory-region:
+          minItems: 2
+        firmware-name:
+          minItems: 2
+    else:
+      properties:
+        memory-region:
+          maxItems: 1
+        firmware-name:
+          maxItems: 1
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,milos-adsp-pas
+    then:
+      properties:
+        power-domains:
+          items:
+            - description: LCX power domain
+            - description: LMX power domain
+        power-domain-names:
+          items:
+            - const: lcx
+            - const: lmx
+
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,milos-cdsp-pas
+            - qcom,milos-wpss-pas
+    then:
+      properties:
+        power-domains:
+          items:
+            - description: CX power domain
+            - description: MX power domain
+        power-domain-names:
+          items:
+            - const: cx
+            - const: mx
+
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,milos-mpss-pas
+    then:
+      properties:
+        power-domains:
+          items:
+            - description: CX power domain
+            - description: MSS power domain
+        power-domain-names:
+          items:
+            - const: cx
+            - const: mss
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/interconnect/qcom,icc.h>
+    #include <dt-bindings/interconnect/qcom,milos-rpmh.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/mailbox/qcom-ipcc.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    remoteproc@3000000 {
+        compatible = "qcom,milos-adsp-pas";
+        reg = <0x03000000 0x10000>;
+
+        interrupts-extended = <&pdc 6 IRQ_TYPE_EDGE_RISING>,
+                              <&smp2p_adsp_in 0 IRQ_TYPE_EDGE_RISING>,
+                              <&smp2p_adsp_in 1 IRQ_TYPE_EDGE_RISING>,
+                              <&smp2p_adsp_in 2 IRQ_TYPE_EDGE_RISING>,
+                              <&smp2p_adsp_in 3 IRQ_TYPE_EDGE_RISING>,
+                              <&smp2p_adsp_in 7 IRQ_TYPE_EDGE_RISING>;
+        interrupt-names = "wdog",
+                          "fatal",
+                          "ready",
+                          "handover",
+                          "stop-ack",
+                          "shutdown-ack";
+
+        clocks = <&rpmhcc RPMH_CXO_CLK>;
+        clock-names = "xo";
+
+        power-domains = <&rpmhpd RPMHPD_LCX>,
+                        <&rpmhpd RPMHPD_LMX>;
+        power-domain-names = "lcx",
+                             "lmx";
+
+        interconnects = <&lpass_ag_noc MASTER_LPASS_PROC QCOM_ICC_TAG_ALWAYS
+                         &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+
+        memory-region = <&adspslpi_mem>, <&q6_adsp_dtb_mem>;
+
+        firmware-name = "qcom/milos/vendor/device/adsp.mbn",
+                        "qcom/milos/vendor/device/adsp_dtb.mbn";
+
+        qcom,qmp = <&aoss_qmp>;
+
+        qcom,smem-states = <&smp2p_adsp_out 0>;
+        qcom,smem-state-names = "stop";
+
+        glink-edge {
+            interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
+                                         IPCC_MPROC_SIGNAL_GLINK_QMP
+                                         IRQ_TYPE_EDGE_RISING>;
+            mboxes = <&ipcc IPCC_CLIENT_LPASS
+                            IPCC_MPROC_SIGNAL_GLINK_QMP>;
+
+            label = "lpass";
+            qcom,remote-pid = <2>;
+
+            /* ... */
+        };
+    };

-- 
2.51.0


