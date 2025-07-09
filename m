Return-Path: <linux-arm-msm+bounces-64208-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0891AAFE759
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 13:16:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4C45A7A5363
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 11:15:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB281292B37;
	Wed,  9 Jul 2025 11:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="f6/32rxl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317B12918F0
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Jul 2025 11:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752059604; cv=none; b=mCNBP88YMb/Y43Bw01QhGKDWQFbrFtzan8M2slc0jmWb42mUdXTfCduPeZFl/2G0/j9k0PsQbn7hnbyyISDWftGar718PTyZ0Wzb+oCgmhYrDZCaBrLiIgUjPrpZzS3nuN+MoCLonmAEyW9lMbSb7zT6q84WOtcH3DDsMmu6cko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752059604; c=relaxed/simple;
	bh=u0XBjtbJF25KxDSuLGxYM6cRkSK8nxPXJ6X/U1w+hJA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sABP0fez7j+C7CinJKkf3Gvld9DWeGndVFOJn/oV2iXBz1I2F3JhkZFSmiL0rkvm7P9rHpkxcR8BRvgpEHega+ww0mvgqksK0wDLNSPvMRBr92oQJ86eJj3feMKcUnR6wNdR1EvV/4JcrPi+CHn8eGBIfIyGzQCqzeBt5eT5CzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=f6/32rxl; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ae3b336e936so999478666b.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Jul 2025 04:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752059600; x=1752664400; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kzNG94wE4a3RjmtR9JyX3c7VXCy6XCLzhYazvvoigfg=;
        b=f6/32rxl1vCSr+qpA+QlsAWY21n/5e9lZmz0kcGqNYU6ZyKFABtIl1ZT0eUuAHHyrW
         Rbhw4VEkEL6nWbF/NNBdK/ljVSB1Uv5ba/EUWtzveafHNh/e6voHI+UXRKNm8sVtbSDx
         Z6Rf2NFAbqKe0Sz5DSfzn95feJzwMniFmiWHsycdsrZqd8KzU+JHbJce6xNaoqIUZAPb
         WS7DxfdSEQZ0Z+eg4kDB6KAwIQj7sRjpz5z1dkA2NMKIDvXGMlRSf/Q4J4tkWWIA5Bcu
         hTiFfjEttFl1yWS5oV3eBo4iaSkbFrfbT+a7oihKhRGtyNE4/BIduaekGgLYtAQ+Hfn1
         syHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752059600; x=1752664400;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kzNG94wE4a3RjmtR9JyX3c7VXCy6XCLzhYazvvoigfg=;
        b=tN9I4Yp4P+kTUW1982LbYR0dQyge0yFcd77Uv6FcpD72oGMttWRAIWJoJUlO/ljlWt
         p1yx7FuHJO5UZIxCN98hIlwOJLojosKtv18K1kj5+AxxzRZvzkAKVniX82HTxBY8WvKp
         7a5ss1rFdIrQyhelK9MxeQfEacH8K9i7B3jhzzB4CfOS71m3SotFyWPrfUlTInLaKbwQ
         cI0tQUd+g4wXfzHbvN+3y15pnEMCO7QskNUj2UfOU3WtxzgEFuCVhnkVdCeYt0sdMbi7
         D3RuzklXn9T7wNrXCaB2JDfCugFLG9Ec86Vdl5fihbF+/6kbU3JOL2N76YVRxpe2Qnkc
         8geg==
X-Forwarded-Encrypted: i=1; AJvYcCXIBnKm4302XNRgBICJ4KBehCTDOLJ2xHmFa/YuCE3HsguojSv2O6Zbz9nFLUDPgSJovYgux+jey480izhS@vger.kernel.org
X-Gm-Message-State: AOJu0YzP02iaZsYiCq8qPTNyEqRZmh699VO4Q7Zr+VvjwZv4IEEwbgKI
	uk9ObJQ8qio6y+6z9sk8TVVsOdwZRjanRakswgkhj1oOTt4Pw9J0le83rXFzacioEAQ=
X-Gm-Gg: ASbGncvvD63VMoeTwQtTnawE83X0qu1B6HxDFKD2Slj/zirTzSwnfcByTdcyObJVKd7
	W1PPuqwfITFhzkdxMtzbilDIGayjTB3oeYhU4lMDaG18c3WQHD+NUbDTQAQqC7OYI7ua3SZpFVD
	XSbWxBkOgByaOLgwgCoURyvj+brRi7YlWG8qVAZutH0NnV7EIU06JbyhlCMFrhqYSK04QA5Rtaz
	oxOuhGo5rtLNECF6Pa2AiG557Vb0H/MWeQDgtsu7zBkRU3+0zvb08sBpWwZblm7Wz5yge0Djbx3
	Q7+ZDoa02yJ84SZ9bS0OvUCSVI18h8BEZVW1Pgt+h2o3enqiCourdZM0lejX4nQ71qdXw1egNbc
	2iq7SAE/rGBayNkQlaYKk2ZfCaFf5re+7
X-Google-Smtp-Source: AGHT+IHp4UiHiFWoUq46z7BhawEXkWrClkMIAjMjhzDunp90YIHxLMsXVVrNH8gxYuepr42WMQvegA==
X-Received: by 2002:a17:907:d1a:b0:adf:f82f:fe0a with SMTP id a640c23a62f3a-ae6cf69cda2mr247871466b.16.1752059600300;
        Wed, 09 Jul 2025 04:13:20 -0700 (PDT)
Received: from otso.local (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6daed7d49sm27191566b.114.2025.07.09.04.13.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 04:13:19 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 09 Jul 2025 13:13:07 +0200
Subject: [PATCH v3 1/2] dt-bindings: remoteproc: qcom,milos-pas: Document
 remoteprocs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-sm7635-remoteprocs-v3-1-c943be976180@fairphone.com>
References: <20250709-sm7635-remoteprocs-v3-0-c943be976180@fairphone.com>
In-Reply-To: <20250709-sm7635-remoteprocs-v3-0-c943be976180@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752059598; l=6238;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=u0XBjtbJF25KxDSuLGxYM6cRkSK8nxPXJ6X/U1w+hJA=;
 b=zyQQIC2uNbwlCSm4zN/8X+pdADWnyFZrtjqrN5qfkckQuo+wrH9b6z0G1lxRuJuwGQgKFRaSl
 EAIbnVjx92mAmVcjRd6qwaDr8KXo3VbtNsanifkWFynCOlQbqq8wo2K
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
2.50.0


