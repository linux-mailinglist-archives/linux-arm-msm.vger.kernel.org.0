Return-Path: <linux-arm-msm+bounces-15747-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E29C58923A2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Mar 2024 19:54:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 18C971C222B7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Mar 2024 18:54:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4057712FB12;
	Fri, 29 Mar 2024 18:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RDssbNz2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B864AEED
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Mar 2024 18:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711738488; cv=none; b=ZOWUtqkj5YZ1QZcKcMLm1o9UosMw1E7WPRrloYHngAAvmI0locM1jTCxveACd0zK0ZkfQmCX711VsNh7tGhBIsAXXegwEpGDVkRF68XuuyBrqMbCMzqIwN0843+3QqxHeWjiTs/9MTz8GExuOu0Xjrb02DAF6VM2Slx60fFHnAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711738488; c=relaxed/simple;
	bh=H2L6hk3BSbGZWXsaMqnOwDhN0rNiIn1lAFbUz+5zVTU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qWaX8Mu+sM9xuXdewbEV9sdpcJqlDSvpLLrGGNfVmPZKrFn9xjQYSMGyGedlU5sKZH64A4oK7ZdyGhBcqbXT3Lf2REvWWzXjG11IVndYVq54X4QqcYsTT+jzlBSFwk3NVvAQ9DM8DfVhL17DvUyA73PyasIzfKGsCKONPir3qek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RDssbNz2; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a470d7f77eeso293468266b.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Mar 2024 11:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711738484; x=1712343284; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e0l9XqgR5rgZt/McZ1+LYeV2+Ae3g0xUIEFWoqdq9PI=;
        b=RDssbNz2J3uJEtJ3lf66dp0WCYc68c5qeRaY9YRqcI81LwayKmV926s6ebu8A4XrWM
         MMhxjaMjuQefia2bQR49igXp970+vS+sjceUk9FbZINiE4MSClmJFnIMo+I4yks/t/ph
         RJjXvKKJXwQT8qdeZiweATNnJsDUAPxPwibNyA/geJurLU0V0LU4Rwi+whYmJe+BtWc1
         2Etd5OhyAqtPt2j9Ny/zpnA08vr/2N5QbRUoIDZa2rg1T+G5krQKtMZQV0U5cbnaChTs
         cwk7TmzqiQk8xszijMBMrNopQqNnJ9KOp4CGfY2CpMtgvz+9B/WXyWAH+hRUYf2dwfQU
         RluA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711738484; x=1712343284;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e0l9XqgR5rgZt/McZ1+LYeV2+Ae3g0xUIEFWoqdq9PI=;
        b=hyAJ6bg27BSpzH6Ik0OzQPSVZDzP46SApoKPJUH4tjXSJDzoIwMjkVLJj2Z4XjYnFt
         GTyaAnorMTRRkr4t/c93piXN3bFEfvKOMEtV7E3f4ONCuxTZWacYLujclZ73+vQyy0s9
         HfUauRsA1BVlq+zfN9w/Bv32sQKWBNvHmWWqOGDhpPVAN3bei5XtW31bAXnr7M4GW5Bt
         ZT7eza8b+kJbADkNclPy+vOjR6sKGJGWYtc+jL34UoHmfxlN49REjN5E+PGCMbA4tFh6
         q1eNnz1SfKrTNs7+TUp/2has2uhCfYuYcyqTGmzE0cl65u7YBY2zyF2H6UxdM+C2RUte
         QGGg==
X-Forwarded-Encrypted: i=1; AJvYcCXnTK3Bsoff7Yp5q+zsdCcWT+Us5izL1kSQWr5Zac9rLuBDlLrF/UrjsoZr0pBzGwU8CTwp9WSV/BxOnac9+jIRZeoUvWKRPE58NM5/ZQ==
X-Gm-Message-State: AOJu0YxibPL1cFngK3WbNf7DB19XkIP+/ffmYfs8NQfOZRaFMUvbCOAw
	pkVDMo7e/74oBCtwOR7I6fI6FKpnS1VHbHKNU9njJpFwgKKw1VYLI1n3dEs+td8=
X-Google-Smtp-Source: AGHT+IEvez3gnbfE1h985nyrZbf3lwtS5MK1xcBVKx0GUJnsoq87hfeTZGXxgOag0cR9v/4ebdQxYw==
X-Received: by 2002:a17:907:9877:b0:a4e:1c3d:89a0 with SMTP id ko23-20020a170907987700b00a4e1c3d89a0mr2367909ejc.4.1711738484378;
        Fri, 29 Mar 2024 11:54:44 -0700 (PDT)
Received: from [127.0.1.1] ([79.114.172.194])
        by smtp.gmail.com with ESMTPSA id gl20-20020a170906e0d400b00a46c39e6a47sm2235618ejb.148.2024.03.29.11.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 11:54:44 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Fri, 29 Mar 2024 20:54:18 +0200
Subject: [PATCH v7 1/6] dt-bindings: spmi: Add X1E80100 SPMI PMIC ARB
 schema
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240329-spmi-multi-master-support-v7-1-7b902824246c@linaro.org>
References: <20240329-spmi-multi-master-support-v7-0-7b902824246c@linaro.org>
In-Reply-To: <20240329-spmi-multi-master-support-v7-0-7b902824246c@linaro.org>
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
 Abel Vesa <abel.vesa@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4280; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=H2L6hk3BSbGZWXsaMqnOwDhN0rNiIn1lAFbUz+5zVTU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBmBw5p2QmwCkKqbzyOMMbpOWoF0qvc0ARyq+X+6
 7dr0j/S0MGJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZgcOaQAKCRAbX0TJAJUV
 VszXEAC7xyiA34AfEV+TDkvZPPpgeAtVDPvwKYKFPF3hrkY3F0SNCyutBXWPsZ7dENoGccze8U0
 7kCiz7fwqH0tnQV4rqcWaKO7cbWzczKlGSlxVVDYElSZ8a0zGf9WxWwzYDOKMkJjad9+eD+Xzex
 VZKu9Utt06TL/e8lfdjrAInA7X/Ck+RrxxzU7XVz5bKQE5WeKpQf5gth7xUsvcNBcfdk0sRq5iK
 VflDiQ2y44YfO7Xuj/CLbOtUeORzhUHJl4L45OHG2UoFE+oNpD2jCSFWHLf3d01gnINHUYDrSJz
 47qnj+g26WRZwhTI/I/C/s+cYbpDvlP/rrmTy9fE7a5El/h69oOXt4ScbzOU9SyDIqJE8N9yZTs
 95P5VyxPlfzlykS13ZWttrlVU7s5Lf4m5Vr0j3JRTp5AmW2sZAf+UOwr1xhnMzzkVh/UM1UVe4e
 LbkV130Tk5QEfBSg++abtl+qjr0cogYZfYGAxH2GMVOQcTFEqVohDWou6hxuGxXtSA45hP+vzoV
 3wn41LNj9CsGULuLON5/HvbBG0VZCHBS40ZP01hft0uBYPsXXksiSn18m/NLojuBXl130tp8oQF
 W3eFMnDjO+bGm4CwZsmi4lKQYHk6UJJLeyzSh0qKzO0mDFPcDKYlOcuxWONbDlTkDpQuAbblx3Y
 9QJj0ZUb51A+sGQ==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Add dedicated schema for X1E80100 PMIC ARB (v7) as it allows multiple
buses by declaring them as child nodes.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 .../bindings/spmi/qcom,x1e80100-spmi-pmic-arb.yaml | 136 +++++++++++++++++++++
 1 file changed, 136 insertions(+)

diff --git a/Documentation/devicetree/bindings/spmi/qcom,x1e80100-spmi-pmic-arb.yaml b/Documentation/devicetree/bindings/spmi/qcom,x1e80100-spmi-pmic-arb.yaml
new file mode 100644
index 000000000000..f32a7ae33b4b
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
+  "^spmi@[a-f0-9]+$":
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


