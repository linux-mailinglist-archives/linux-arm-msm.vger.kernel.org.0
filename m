Return-Path: <linux-arm-msm+bounces-20556-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 72AB58CFC00
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 10:46:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DBF1E1F21DF1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 08:46:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7462413A86E;
	Mon, 27 May 2024 08:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="CREjDOIe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855DC6BB5C
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 08:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716799455; cv=none; b=uOMFS7uwMyRPipEGd8A89mz9352k/d+QRHNjYQP+xYQupf6vjOtHBZlAD08/PJSB3srVLstR3Js4H+5gpSNd6r9SbKPDmnhAGxcyTRGBcgYh6mMpdlWYhJemSqlM7TXqoUVD0LY0o1wWNNHwxm7khMOSw22oLXHBMWDI03k3ddw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716799455; c=relaxed/simple;
	bh=7DF5HwF7p6U8Nx8Na6sa5PgjqUlkBVILFpybaxwEmk8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dh0S+Ze6n99l1Gb0TEHQvu2j3DiBaR0UR/O6QxOCynMEuj+aENjjXyATGlPJuwRqXZLcBcLAaPbl/UAzqU9p/jVLvvA/dQF24ShfthUQRJclGbdlFT98MmXk1yOaegmrVA6LPRD8kaxLwi+TCKyBUNJTM99X1pLg3aKGm3SgIUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=CREjDOIe; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-420180b58c5so44581465e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 01:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1716799452; x=1717404252; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tgkx0eCP4rrk+JD+2W4qCpUZmtiCMe6qIUFxLraX3gw=;
        b=CREjDOIef1XntHsMNXuCgGK//HFVq67MYbCtmXnUjgKk5Z2XMTcyof3f7uKULMr3o4
         kTniaA++QpF7i4izCrhXb6I1hL2HmbnSdU1kopKkYUOp8MzgR59eZp7gFQfd6/JMyQVO
         eeCEOqotoTrl/Dayf0A/pHL+G1VzET5vN8OwqnEvfWTk62c1H1tffTDPGp8/vsuSTNq3
         AiQGFn6o0SlOVOL8Ln5XmoEJGR9rzm6M+6wK0m336H91PTqI3V8Sv1GwNECUANWF8OLc
         Xi95hOw/N83ixJUxM8gS7zuxZlmzOT8TZXUyghG3tBoM2W1mKgy1ndwX0Oqyjf2HOowf
         r+uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716799452; x=1717404252;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tgkx0eCP4rrk+JD+2W4qCpUZmtiCMe6qIUFxLraX3gw=;
        b=xMCTuB/oyymfdv8Z9H+EGYGZ+5Lb3yhUgx7OM4Z1tUK1APiXuhODAswKXN/t/harR2
         8Y+kQVwAkWc35SaOl3rEx/PHPlD/xfaELYBQgGimouSDzWdq0K1wUU8MXySaqZSAux6r
         SxXnkJtZIrOhg3cX75EKcgys0W/2hCToH660W0v4py6k620q9VBXY1mWrzTAbdbuMczQ
         jbRok2dGS36Tp0PAsuMzWmRL9F/ZtmZapj88vNOCKOkFmwRls+5lOnkMIb7QGD1GMNAH
         Iop+Tgzlxb3mXmQwheQPugUzaP6PuoBgc/t2dBxhCBoVc7LGr1tlF7hswEO2lzw9XLTS
         nt4w==
X-Forwarded-Encrypted: i=1; AJvYcCVWI6Ui/6ZdzulvDVSc1Tx6gTk+yUB1IbCtv1v40O1j5ickH1EAwqFmkpN801nOG9oipu4p1RdevqVvIA/d+4kbQncdyM6MkokMvDQk/Q==
X-Gm-Message-State: AOJu0YwpFgHSe0IHIewhCo1ZwgsNtliQCpz+dhI+QMM2voppgCcWMAiS
	aMLqlVhjXUmw8+EX5EOu3LDFPv1PJfcHtxAa+fwAkGzsKIk9yhIoGpZNtkt9Vqg=
X-Google-Smtp-Source: AGHT+IEJoX7+tUcPr/AjtrU1kkpAaWkjeV8h5mr32bTS32MycTKwC2XhxrDWVyrN/rAtxoJFxk7vSw==
X-Received: by 2002:a7b:cd94:0:b0:41a:f76f:3362 with SMTP id 5b1f17b1804b1-421089d3927mr60081775e9.21.1716799451943;
        Mon, 27 May 2024 01:44:11 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:75a:e000:c322:131e:ff9d:ef41])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42108966682sm101365575e9.2.2024.05.27.01.44.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 01:44:11 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 27 May 2024 10:43:48 +0200
Subject: [PATCH v2 1/5] dt-bindings: remoteproc: qcom,sa8775p-pas: Document
 the SA8775p ADSP, CDSP and GPDSP
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240527-topic-lemans-iot-remoteproc-v2-1-8d24e3409daf@linaro.org>
References: <20240527-topic-lemans-iot-remoteproc-v2-0-8d24e3409daf@linaro.org>
In-Reply-To: <20240527-topic-lemans-iot-remoteproc-v2-0-8d24e3409daf@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Jassi Brar <jassisinghbrar@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tengfei Fan <quic_tengfan@quicinc.com>, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
 Alex Elder <elder@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5544;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=leIKa/UcmJaFYJmvDmKOwmxkj/TaQjJErtw/XziYiaA=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmVEfY6nwdfzrqX8cHFFoaGHLnzqVJU/+XYmdGa
 UphrjRvxQGJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZlRH2AAKCRARpy6gFHHX
 cmBcD/0bv1CgoCxlmxwCDDkrweb13DNecIupZMc6hBdxEg8fHluwWV7gPV2/z+yxd79BK3gIW1i
 fk3unXUef9GCePd5rHWlIatX5TMeBD2TjInGEEVxAt6d73BcaEhZevMk7BQgIUEsi0z8FRGSvOp
 1rE+mz96Z/gybygAvPEop3avY8PMXkohUmgI9rD7k67GtLmwDtrIDIktx+9heR/h4j1yVI9N00g
 x30++JLjwJZTecrxBRe9XEhn7ifleW8wNpfGapvymIHis0k68N8qEP5g2XLu0ZorSZbX5pO+vTU
 nDwudyO8DMYGZVm6m67ZcryZGca9QjmesnmpKAuhK8Yz2E/grLUjO5EL0mP0b+Lzu1NKMbomZdd
 QzvoVWaWL3eDdOF9iIhGmHdm8zbbxMNLRkaxvvP1uvSn9R3pBv5ir0ynHfi8VzG88LmtMUtFfAW
 Yk3gfUUQo/cjaaY6LqD0iK8f3nNSpPqdSku7nP2PPo0EUBdj4Qh+HwtKyASCJ4nO5Ff/AFxl4Nc
 Va/j2QZQHpArIIlCAMctsvvO4cSgY92qCVshbhHSrTc5Neivi6ms9ZeQw5juFzRdCpbAyjsrwLo
 sXofb0kWnJioLQpQyDH21cmmuRxYzNexpWYF/IfLUMqYhJgJAagmEGX1Kd8ww8RXADK8et/paY4
 CYiAbsVCzykEIvA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Document the components used to boot the ADSP, CDSP0, CDSP1, GPDSP0 and
GPDSP1 on the SA8775p SoC.

Co-developed-by: Tengfei Fan <quic_tengfan@quicinc.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../bindings/remoteproc/qcom,sa8775p-pas.yaml      | 177 +++++++++++++++++++++
 1 file changed, 177 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml
new file mode 100644
index 000000000000..77a5e11555de
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml
@@ -0,0 +1,177 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SA8775p Peripheral Authentication Service
+
+maintainers:
+  - Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+description:
+  Qualcomm SA8775p SoC Peripheral Authentication Service loads and boots firmware
+  on the Qualcomm DSP Hexagon cores.
+
+properties:
+  compatible:
+    enum:
+      - qcom,sa8775p-adsp-pas
+      - qcom,sa8775p-cdsp0-pas
+      - qcom,sa8775p-cdsp1-pas
+      - qcom,sa8775p-gpdsp0-pas
+      - qcom,sa8775p-gpdsp1-pas
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
+  qcom,qmp:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Reference to the AOSS side-channel message RAM.
+
+  firmware-name:
+    $ref: /schemas/types.yaml#/definitions/string-array
+    items:
+      - description: Firmware name of the Hexagon core
+
+  memory-region:
+    items:
+      - description: Memory region for main Firmware authentication
+
+  interrupts:
+    maxItems: 5
+
+  interrupt-names:
+    maxItems: 5
+
+required:
+  - compatible
+  - reg
+  - memory-region
+
+allOf:
+  - $ref: /schemas/remoteproc/qcom,pas-common.yaml#
+
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,sa8775p-adsp-pas
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
+            - qcom,sa8775p-cdsp-pas
+    then:
+      properties:
+        power-domains:
+          items:
+            - description: CX power domain
+            - description: MXC power domain
+            - description: NSP0 power domain
+        power-domain-names:
+          items:
+            - const: cx
+            - const: mxc
+            - const: nsp0
+
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,sa8775p-cdsp1-pas
+    then:
+      properties:
+        power-domains:
+          items:
+            - description: CX power domain
+            - description: MXC power domain
+            - description: NSP1 power domain
+        power-domain-names:
+          items:
+            - const: cx
+            - const: mxc
+            - const: nsp1
+
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,sa8775p-gpdsp0-pas
+            - qcom,sa8775p-gpdsp1-pas
+    then:
+      properties:
+        power-domains:
+          items:
+            - description: CX power domain
+            - description: MXC power domain
+        power-domain-names:
+          items:
+            - const: cx
+            - const: mxc
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/interconnect/qcom,sa8775p-rpmh.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/mailbox/qcom-ipcc.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    remoteproc@30000000 {
+        compatible = "qcom,sa8775p-adsp-pas";
+        reg = <0x30000000 0x100>;
+
+        interrupts-extended = <&pdc 6 IRQ_TYPE_EDGE_RISING>,
+                              <&smp2p_adsp_in 0 IRQ_TYPE_EDGE_RISING>,
+                              <&smp2p_adsp_in 2 IRQ_TYPE_EDGE_RISING>,
+                              <&smp2p_adsp_in 1 IRQ_TYPE_EDGE_RISING>,
+                              <&smp2p_adsp_in 3 IRQ_TYPE_EDGE_RISING>;
+        interrupt-names = "wdog", "fatal", "ready", "handover", "stop-ack";
+
+        clocks = <&rpmhcc RPMH_CXO_CLK>;
+        clock-names = "xo";
+
+        power-domains = <&rpmhpd RPMHPD_LCX>, <&rpmhpd RPMHPD_LMX>;
+        power-domain-names = "lcx", "lmx";
+
+        interconnects = <&lpass_ag_noc MASTER_LPASS_PROC 0 &mc_virt SLAVE_EBI1 0>;
+
+        memory-region = <&pil_adsp_mem>;
+
+        qcom,qmp = <&aoss_qmp>;
+
+        qcom,smem-states = <&smp2p_adsp_out 0>;
+        qcom,smem-state-names = "stop";
+
+        glink-edge {
+            interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
+                                   IPCC_MPROC_SIGNAL_GLINK_QMP
+                                   IRQ_TYPE_EDGE_RISING>;
+            mboxes = <&ipcc IPCC_CLIENT_LPASS IPCC_MPROC_SIGNAL_GLINK_QMP>;
+
+            label = "lpass";
+            qcom,remote-pid = <2>;
+        };
+    };

-- 
2.43.0


