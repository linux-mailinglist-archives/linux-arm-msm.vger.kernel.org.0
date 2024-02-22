Return-Path: <linux-arm-msm+bounces-12179-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 268CA85FA4F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Feb 2024 14:52:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A6D621F249D1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Feb 2024 13:52:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1EEA137C3B;
	Thu, 22 Feb 2024 13:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bpyoSqqC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16691350CA
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Feb 2024 13:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708609945; cv=none; b=YVchGrKJFx5t8rldW2czscCVQY0ISFE1zIh2J3d1gYr33yf0gDJBXI6C6/hkEkbGVRRkvTY6CqNpuJyZHtBrmqcnPu8m/GLpw3VtW499sJFICzW/UrbsBiSnb4vmVPaYqS2c+ihIpYDWu9Q9IrMvHpcUVaoR/YkRNdWGVbvCIoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708609945; c=relaxed/simple;
	bh=YamVkfgVhnxdN0nuqUEaGc7/CimD3+iO1qHB6FQRmek=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GZMKkFeUfVUuCdQHNho1+bF6lIwksuZZYVeU3Nc76vZ36zcIgQAdzY1TXyza/pguYqRI/ZDh3SqfUpaomNx1/4qHyTvUa8hWNodddF8buV61QP4EBXbUYcE1AfaAzr/vfUS+4M3F9wob954HpdaP1hCKqvpWq3m0I7HFWftKEH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bpyoSqqC; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a3e4765c86eso664458866b.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Feb 2024 05:52:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708609942; x=1709214742; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=21TlRVjoWnFJstWCWbc/kPU2iAo+CaLQkVmZjbxJqtA=;
        b=bpyoSqqCfeAjWWDl0A6gpsWer/T9xMwlhHW6UZoH7btusq1wuTG4NVKCXE88E8Bx/W
         TIg4XEbTH1dThkrfgmZAPwTmq4Jz/tvgfbacOS0O9T0yJCp3FUrxgKDi8dX1Vz7J9Und
         sjW1tvNixmgoR0zg46gzvUZ93GTlhkcXheFzrrqkR1xxNwLCp/BBimcg4rVu5h7cepnt
         IFMPUqnYFBYah6e2zXIxXX+yJPPnyiFU10Ctz9bPHV/BAMpZ0Oeo2qEha3d9XWrbXaQ0
         mQ054aKBP83rtOX5wq10/hPM/WdD0y9exXeK4spWw9V/TjIx8XGk7zO74cUZt+2ZrDEe
         ZdKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708609942; x=1709214742;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=21TlRVjoWnFJstWCWbc/kPU2iAo+CaLQkVmZjbxJqtA=;
        b=E9QHaZ8NQwxQd4L0B8YefOLUzB87CUIUUd3Pb1mI13ujmjG7gERec3qVDCqwiTzBvn
         LIB84O+n8rQu4aF+Eng6qCgbC+hI3xcjWIYAle3TkGux+KpL9XHDgmDDwl5PVvei3Jbh
         MKQzdeKbAIhL8QWf0dWRgVzwkkCjG7lPt/LWvedfjUP6c9TS1Xz6LSgJaQcwZAvLVH4b
         belYebb8sFoBLk8j4pxV+TN0zB14+jyQHSB/nxd4zwSeHqFjXWFqnveFixTcYCVwFqRe
         9gNm/jdtJSSGyY140kF4Byu/WNLc7fXBPa+57QZoWW9xETFhYm3zYcUCryony0cVAH+j
         TuOQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4jYHV3OaKH/h8zoPRcwSqc5eJspY5GUwhS6AqSvXA3x4nLW0TdiXTolJVrAs6VZEiFH/+5KLlrbA/B0CHQqrq4XtB93Xe/N0N8K+hbg==
X-Gm-Message-State: AOJu0YzrA0fuMsgnlzKcsv3ql2D6Veex9on+o4zAHzoAYZ1kAsWz0qaQ
	BeN3ZJdfHfpOAfPmuMC+sdJFmia2FIHAxkgPgr3RJr5AJvaaxdZkte8Xvm1EdOk=
X-Google-Smtp-Source: AGHT+IFdPFyrBje7sUs+QMqSsRR4mXBEgQ4gwdLmQeuQgZxbs4V5by2vRpvDN/ZESO7FqWTvQg/ehQ==
X-Received: by 2002:a17:906:48ca:b0:a3f:10:bf70 with SMTP id d10-20020a17090648ca00b00a3f0010bf70mr4975855ejt.37.1708609941995;
        Thu, 22 Feb 2024 05:52:21 -0800 (PST)
Received: from [127.0.1.1] ([188.24.162.93])
        by smtp.gmail.com with ESMTPSA id ot18-20020a170906ccd200b00a3ecdd0ba23sm3382839ejb.52.2024.02.22.05.52.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 05:52:21 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Thu, 22 Feb 2024 15:52:02 +0200
Subject: [PATCH v6 1/5] dt-bindings: spmi: Add X1E80100 SPMI PMIC ARB
 schema
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240222-spmi-multi-master-support-v6-1-bc34ea9561da@linaro.org>
References: <20240222-spmi-multi-master-support-v6-0-bc34ea9561da@linaro.org>
In-Reply-To: <20240222-spmi-multi-master-support-v6-0-bc34ea9561da@linaro.org>
To: Stephen Boyd <sboyd@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
 Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4212; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=YamVkfgVhnxdN0nuqUEaGc7/CimD3+iO1qHB6FQRmek=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBl11GNnhK0hUGx1IRjPnBlHv9T0lvkCm7Bwz7JT
 Qltoxb8PKeJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZddRjQAKCRAbX0TJAJUV
 VqHjEACxuEh80xqEDASrIjulg4ghwtGd7HRkroC5CRPYtS9B247hbzv8x4c/ADi+bVVTiRmnvU0
 rFdPQ/HGDEm898tuapdTA4p34lwNuOsPKvGR4Z0WK6OXDL8LNkC5Ee3yLpwYZg1B3uJwgW4DfRp
 iJ3/AKivBhOLY/Dqn1CZWUrEXTNFdQg+aJpALJkNKx2sXfWLsBNpglKf09RkdfXYMKzrDr+Pm/d
 cDQNNFjFzdEZev0OTdoWZCvFsUAjBBCZsC2CO1TgdtaPqTlSy23TBpSwZqj+ynMg3aLJiPOaEBk
 JrnPzd2oE7N5L7utVB883tGhfouRkba3h7kCYOHSG/NJfUzKsxm8GU4Em8lDW6+FsoxfdnBvTaE
 RcG3Pp2c3jMved/p27EQxMl7cAnMYPEFM5zuTyMGI6JboNm6sfbX0HXkCnHoKuEO9exCVpqDonu
 TtXgnzaPKptRKvTzK4shV/ASo1g7+SNNJ57E2B7WytlFNS2H7lGdEVgNxLiWb2lt/dwBEI9a+pl
 3KzyjUtVvJyCtlFZ4ZhgcibvCqHbF70NWZABW8xopoXmjkeZEkKLWPaete7b/OiUKnBTUa6nb5H
 D4DaGfjMgHljJXqiXYnD7YJNeukzSyJh5ZolBcW8FUHaZjgfzk+ioB7mYtDsJ4QHkcNUWGDnUUB
 9nKDe7pZv6j6umg==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Add dedicated schema for X1E80100 PMIC ARB (v7) as it allows multiple
buses by declaring them as child nodes.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 .../bindings/spmi/qcom,x1e80100-spmi-pmic-arb.yaml | 136 +++++++++++++++++++++
 1 file changed, 136 insertions(+)

diff --git a/Documentation/devicetree/bindings/spmi/qcom,x1e80100-spmi-pmic-arb.yaml b/Documentation/devicetree/bindings/spmi/qcom,x1e80100-spmi-pmic-arb.yaml
new file mode 100644
index 000000000000..bdf362c4a147
--- /dev/null
+++ b/Documentation/devicetree/bindings/spmi/qcom,x1e80100-spmi-pmic-arb.yaml
@@ -0,0 +1,136 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/spmi/qcom,x1e80100-spmi-pmic-arb.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm X1E80100 SPMI Controller (PMIC Arbiter v7)
+
+maintainers:
+  - Stephen Boyd <sboyd@kernel.org>
+
+description: |
+  The X1E80100 SPMI PMIC Arbiter implements HW version 7 and it's an SPMI
+  controller with wrapping arbitration logic to allow for multiple on-chip
+  devices to control up to 2 SPMI separate buses.
+
+  The PMIC Arbiter can also act as an interrupt controller, providing interrupts
+  to slave devices.
+
+properties:
+  compatible:
+    const: qcom,x1e80100-spmi-pmic-arb
+
+  reg:
+    items:
+      - description: core registers
+      - description: tx-channel per virtual slave regosters
+      - description: rx-channel (called observer) per virtual slave registers
+
+  reg-names:
+    items:
+      - const: core
+      - const: chnls
+      - const: obsrvr
+
+  ranges: true
+
+  '#address-cells':
+    const: 2
+
+  '#size-cells':
+    const: 2
+
+  qcom,ee:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 5
+    description: >
+      indicates the active Execution Environment identifier
+
+  qcom,channel:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 5
+    description: >
+      which of the PMIC Arb provided channels to use for accesses
+
+patternProperties:
+  "spmi@[a-f0-9]+$":
+    type: object
+    $ref: /schemas/spmi/spmi.yaml
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        items:
+          - description: configuration registers
+          - description: interrupt controller registers
+
+      reg-names:
+        items:
+          - const: cnfg
+          - const: intr
+
+      interrupts:
+        maxItems: 1
+
+      interrupt-names:
+        const: periph_irq
+
+      interrupt-controller: true
+
+      '#interrupt-cells':
+        const: 4
+        description: |
+          cell 1: slave ID for the requested interrupt (0-15)
+          cell 2: peripheral ID for requested interrupt (0-255)
+          cell 3: the requested peripheral interrupt (0-7)
+          cell 4: interrupt flags indicating level-sense information,
+                  as defined in dt-bindings/interrupt-controller/irq.h
+
+required:
+  - compatible
+  - reg-names
+  - qcom,ee
+  - qcom,channel
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      spmi: arbiter@c400000 {
+        compatible = "qcom,x1e80100-spmi-pmic-arb";
+        reg = <0 0x0c400000 0 0x3000>,
+              <0 0x0c500000 0 0x4000000>,
+              <0 0x0c440000 0 0x80000>;
+        reg-names = "core", "chnls", "obsrvr";
+
+        qcom,ee = <0>;
+        qcom,channel = <0>;
+
+        #address-cells = <2>;
+        #size-cells = <2>;
+        ranges;
+
+        spmi_bus0: spmi@c42d000 {
+          reg = <0 0x0c42d000 0 0x4000>,
+                <0 0x0c4c0000 0 0x10000>;
+          reg-names = "cnfg", "intr";
+
+          interrupt-names = "periph_irq";
+          interrupts-extended = <&pdc 1 IRQ_TYPE_LEVEL_HIGH>;
+          interrupt-controller;
+          #interrupt-cells = <4>;
+
+          #address-cells = <2>;
+          #size-cells = <0>;
+        };
+      };
+    };

-- 
2.34.1


