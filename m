Return-Path: <linux-arm-msm+bounces-72238-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CC309B45351
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 11:37:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F5A53A779A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 09:37:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 500D627B32C;
	Fri,  5 Sep 2025 09:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="117F2ch/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A602F2580ED
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Sep 2025 09:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757065035; cv=none; b=hLbIaqXHpzkgCXXqatSjk/JFw+XBeRexAnFHZdf0PYNqffg4v7aPrp3MXqGtG9tWWY5ElXwQA9eGfUW5FOuzJDAQ+5L5IkshlVqXJ3KYn4qpVb+u0C62/fIhpjA85fhbNBVqkbSm3H1OJnPoV0n4RYMkkfuEPL9RGLrJ2sZ7vDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757065035; c=relaxed/simple;
	bh=WanJed64TSNwNGZNhu7PllxnSri4C0kCk0vjp8eirmg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jqXWwDHzbI2zJfvpOPa9PHiQZCJ4h6dAtZ+kXK0mZQAY8JWBLH1J1f71/hvIRGugk88Wx+EzXnySqAN6hduqCpKbykypKl2qH6RAGRStv5+kbAMTFDq82g8R+Ap2/IAVXTAYNIMD44gH+6I1CLEDcsFbT8B9RYaGIx8pueFyGbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=117F2ch/; arc=none smtp.client-ip=209.85.218.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f65.google.com with SMTP id a640c23a62f3a-b042ec947e4so262698866b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 02:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1757065031; x=1757669831; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1gxHPJln64uaPKAQBsFUXX+sYbTr+DxuaR2UtObdr64=;
        b=117F2ch/FHzZewcdumhADXfCEgiooXV+9TPunyEgxq05vfVf41u7hpHA1X/Yitjf/U
         vgJfLS/b8yLU+Abgvc4PrpNZNenwtbX+UnGLhtWNtDfiGaDrvnd3YLwqV819w+VVNBQ4
         rz+72+fX80J7wTn3c1Oyqi33DL2zdFdROlmgYQm8sNjWlrWU/8FpAU8ou7uvyTp68XLN
         WFFartOz9F3Qkv6NQh7lo5yuflcErtOY7MoI1sfmKE+tL6r5SorroSYvuuOGbH7tB3J1
         UrL6fqSHmx0xyZaaf16GwC76sjbqzHr5kd23bnTE/3C7EjctKFlAMscr/cL/yzfQYNUg
         S3aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757065031; x=1757669831;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1gxHPJln64uaPKAQBsFUXX+sYbTr+DxuaR2UtObdr64=;
        b=fzGMnCii0Ccu+IMebxZlt2+wewljfUuGk8WmjENa4WhHG0s1+tPzN1EMADAQ633C3e
         50XKmjaZoUuj8cts9hExkyOGU8qhlDiR3LCKqeNuv/VnjxZR3PShSpN9jVMpaYDBjnF8
         6PEYhD37pftbkI/+z49AOoMZeX95+pgIO+VWrCKCahjTftTntr7i1MiDzaseVgyiCRsz
         oZnowBLt4XQEIwoElZEZl5SyIHsU//WJz3eg8CH7gts8579N/UCGZOqgrjX/TH7LkpY/
         jgZ7inunXo2YfPwz9UyP8uEQRzOkTKoTbzaayYqQs5mcOViuIVCOTLxVhJcRKjBy0lUx
         F7tg==
X-Forwarded-Encrypted: i=1; AJvYcCXnpyC48x6cfPwWbZN4s5DIWLzQDWUlYH7slNCECqk5rKNgrCYu4Yil4FPvlj/gTY2ASZ6LgoWvqIbZsLNN@vger.kernel.org
X-Gm-Message-State: AOJu0YzOPRmp6JQdMudi+1tX7ysg+NpqqEc4MH6MWLWmleAzGlZOBDeA
	E2qtCSIgh+k/Qg4KA44VJgxa982Onx3mKZjIYp5ciwF2LpHVuln87kT72oLLOfs3poY=
X-Gm-Gg: ASbGnctou4yC6ly+s87QyiAAijQEboCLZaI+b788DI1QYHYDlLhrPA86dIq3KcYgi71
	ij7FvdEMfF7HEn01lPROpCPM9nknSZJEOt1BCOzFdEbCOEO9zvXy21lsewqF+KqL5T24vtlyRcz
	MCMEsADmFpqmJVb2lH3hTRgQvP9vCbS3GdvTVlkyQ/FIcOMsViM1KZM298sAfl50u+gqzXmotE5
	K7y84BkOhsv4aBRx4s6Uct2a2QaCVeNAY37N6xa07t8FRLWWNS86ZlPFMZMStHKTVAGwUJNwhe/
	paXa8+tBTDJb+bRbE2Femczf6XLtyP9zNRLdhNlafrkBEx6On3ci1RlvmxsuLtGcR0/oQ+yekVt
	Mfv2L9IgbWysPuB0br5kGdq6ibm/c0pETltOvzkLVKsJ1Drj+H0b0IJiu+kSgcas9IkJxvcC2HC
	Cd6S+oHpeBJkafUoPv8N5pfz2kd4HdQQ==
X-Google-Smtp-Source: AGHT+IEjE3/kdcdoU0TRHnFqVVC+QkaRMtcUEY7t9i41zivu24QfXLZpgNR88N0OT0jPXc1Q+7Nymg==
X-Received: by 2002:a17:907:94c9:b0:b04:32ff:5d1e with SMTP id a640c23a62f3a-b0432ffd0abmr1598272566b.60.1757065030867;
        Fri, 05 Sep 2025 02:37:10 -0700 (PDT)
Received: from [172.18.170.139] (ip-185-104-138-158.ptr.icomera.net. [185.104.138.158])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0416842ffasm1361597866b.38.2025.09.05.02.37.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 02:37:10 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 05 Sep 2025 11:37:04 +0200
Subject: [PATCH v4 1/2] dt-bindings: remoteproc: qcom,milos-pas: Document
 remoteprocs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250905-sm7635-remoteprocs-v4-1-9e24febcb246@fairphone.com>
References: <20250905-sm7635-remoteprocs-v4-0-9e24febcb246@fairphone.com>
In-Reply-To: <20250905-sm7635-remoteprocs-v4-0-9e24febcb246@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757065028; l=6238;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=WanJed64TSNwNGZNhu7PllxnSri4C0kCk0vjp8eirmg=;
 b=zOvwwfh6cAKkgMS9/Xi8oJWQ+IbFNSt1BFUv7GQV/8XipSepdOKb5qU7WlgaG680B8K2OybUo
 6HExOnBAlx6D0cX12Qo5hJR1sfz0MJrPgr3Km5qpYb24qMarfuUcyeq
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the bindings for the ADSP, CDSP, MPSS and WPSS PAS on the Milos
(e.g. SM7635) SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../bindings/remoteproc/qcom,milos-pas.yaml        | 201 +++++++++++++++++++++
 1 file changed, 201 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,milos-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,milos-pas.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..790ad38a0330bf81f6333e887522ddb97690edbc
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,milos-pas.yaml
@@ -0,0 +1,201 @@
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
+    $ref: /schemas/types.yaml#/definitions/string-array
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
+          maxItems: 2
+        firmware-name:
+          minItems: 2
+          maxItems: 2
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


