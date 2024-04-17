Return-Path: <linux-arm-msm+bounces-17746-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4381C8A8C67
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Apr 2024 22:01:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE4B22855D7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Apr 2024 20:01:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C433F39850;
	Wed, 17 Apr 2024 20:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RdrfT+eb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A5137703
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Apr 2024 20:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713384086; cv=none; b=O2CIqtiYmd/iU5at7qBojhc1fnXu/TkSUMHQAQNK+JGq6WYuPODcxop6ByHAt3SDYsR7m8gMmMxAG+TayEUF22ytUxwRftQbx4ZAxUXeKO21yuhrr1n4Obnx8Pvcp1JOWbNs2W4QxGI0gicilL6IhEKkhiO+isDwievC5iyWFVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713384086; c=relaxed/simple;
	bh=HsBWA6C5yW4IIcnCtqxAW2pot9IPKHCnHQDO4UZ05LQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T1ABL9RLalUqyee17Vm7wvPyXFD08GwWtykLrrtbEzUBrUe4XUZ2kK/cxj5T8dE8Lefc4lGrZ3QrCLQgWWTd9yJxkNlwSwV17ZFION4A+dne+KQrz6FKPHudGDfEN2YDneVk3GZL0IHEduV9GRGyWEzFPkaEpT7GQlm27kjilDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RdrfT+eb; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5700a9caee0so76129a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Apr 2024 13:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713384082; x=1713988882; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=43HApKIj0WdLuJWJQYaWKBO78pu58Pa0oGQOq0HzDlg=;
        b=RdrfT+ebLJDw8G726WsBHSLSGYxvFWfpA/VpsW4qLXZ94TxUs9H78rjM+9o31A23li
         AJm4U/yenhJ8Zeta0pRZ1XZ+nbC6IqJShTT4LcwKYDNSgjANW1f6zwHkvO86qp5y/07U
         Jn/sv7wEsy51GLtRM2lq5A2irwpOt+hP/GnLl5w3Qfp3HwzfXbKJJgAiOUvkRyvLzvgi
         wo5zLsL/NDVXVFSyUJ5pjFuTqzJhf+vCAh570yV6bOePwzqXb/FhTreiLiRsxeZTdUPM
         wCX1nsbf8sqjIJH4FmAl7dFFxvbd4NTln76+qw4fLJTFQlup+ONGxhLaCLXTPk647Ixx
         bKAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713384082; x=1713988882;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=43HApKIj0WdLuJWJQYaWKBO78pu58Pa0oGQOq0HzDlg=;
        b=cojylIqLXRyAH/1GdTl2T18TcrL4kPWgoi2HO3oZcZAFBQ0tIK8/G8lzT+7xMh8cHX
         4mNY8w4qLvqhXL85WA6qzhUKEgnzJ6rTUkiNrdfs6YFsMloVgfJkRzokuQ57r9pI5t0i
         5ZzdqBMkFmUVpJkYuyolqNKSZcitnJuU7LapMbOCrY2oLBmZJDvbK9LLIohsPkOtJsy2
         E5rKcevr1TIWh7a3JB5Mkr/g+lItDxeTreDz18SudMiB7VpgRj56QARC5Q/6TFqDX+X+
         CzrI/GFlgrgNiY/efpefZr88CBpSawiaZW8agSuzUDjk9K8QbBUmyVii5zcUy8HWLbBe
         nNng==
X-Forwarded-Encrypted: i=1; AJvYcCXd15bEkynLE9o6jCB8gfFWNOoyZ8OqNL4LKFqKOtXRYZ4x0hYEJ1A4OgON+kX9ofkXH31kborBAeQmuQr0V+jQG3ekI9gaD/6jG9L/OQ==
X-Gm-Message-State: AOJu0YygQQcVgBdoS4xABYXyE/tmj9E/o74pdznc9sDAuLL8R6m7jFSA
	ji+WJnv3elQlGr1Ac7PBtUkV34btCdPhhmZ3SQBugIPxYylW/iBbEZQTwCvHudQ=
X-Google-Smtp-Source: AGHT+IEfVAP5icOIVHJw1Nv4oEkeMlkL7zZzTHle4C/+UhATBDRNfzsaHY3+L+kT5HHxQ7ufCStNAw==
X-Received: by 2002:a17:906:710c:b0:a51:d1f6:3938 with SMTP id x12-20020a170906710c00b00a51d1f63938mr334650ejj.42.1713384082165;
        Wed, 17 Apr 2024 13:01:22 -0700 (PDT)
Received: from [127.0.1.1] ([79.114.172.194])
        by smtp.gmail.com with ESMTPSA id gs6-20020a170906f18600b00a555ef55ab5sm939981ejb.218.2024.04.17.13.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 13:01:21 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Wed, 17 Apr 2024 23:00:53 +0300
Subject: [PATCH v10 1/7] dt-bindings: spmi: Add X1E80100 SPMI PMIC ARB
 schema
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240417-spmi-multi-master-support-v10-1-5bc6d322e266@linaro.org>
References: <20240417-spmi-multi-master-support-v10-0-5bc6d322e266@linaro.org>
In-Reply-To: <20240417-spmi-multi-master-support-v10-0-5bc6d322e266@linaro.org>
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
 Johan Hovold <johan@kernel.org>, David Collins <quic_collinsd@quicinc.com>, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4635; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=HsBWA6C5yW4IIcnCtqxAW2pot9IPKHCnHQDO4UZ05LQ=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBmICp9ePv3z5MxN9myqCZrbWFYyyjC2N+0AXUP+
 rnmj1nqV3uJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZiAqfQAKCRAbX0TJAJUV
 VsIID/4gHIr6dpPvTMMMBeRmFAHO1zvty/TqrFp+m6l6gWxhD2Qkb66EXd9QiXrSPi9kbk7efzp
 rmEE6Lp1yN9Ej29G8D23jhfYeGD/YUOgeZqSOTNrRK8JXA+WSFLb7EqhtURcZ1Dd+vHatcN3iTe
 6PaDkaW31SxskM6BXRp8HG6J0oPbBdNwqQUwbiBIspDPLl9UnvPfKgw5gH9wuN79uCcztcwVuJW
 MNtTrfuXUIaH3pD5nqDM26tH7qGgbu9gUIw0zwdgfvMqPgHDjM6Km/HMUIDUPLIk7XlBLXkd2xf
 NyZ+iyPlXqFbSLKm+peHBIE+hR2n1Po3RS4hpHzg1WhHC+EeF04Ej1Rm5pN8rHo+1xj8cC6L3LP
 8jE9L6BLrxVCNC6G+cQKU1kTuzlFmhPkbmuZqQMrka0LmrbsRFG1w1zNd94FLclk+zWHaKcBz/Y
 jOGxGOB3j35MxcD8CSy38pYuIYRZQLGoBAKPG2oU+Zj99JhPoiD9m0p6QC2IfWgiBP1xWu3b2vM
 ClU7nZ0NHDsMIYOvRhbRbVojil9ANAUF1IpartwU82DdeIIoCNGns3zEG4RfkfIxbhDWbJFjy33
 5ngENGI1Nt70oXFcFrDHKp9bc4Gk8rVXBa+4l/tdhSx9Pt4mc5+3S7ekziujk7ZtX9PEt6kubPq
 GAh0pyuUBzVvdFA==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Add dedicated schema for X1E80100 PMIC ARB. This is not the first
platform to introduce multiple buses. In fact, all platforms that
implement the version 7 for the SPMI PMIC arbiter have multiple buses.
Since the compatible should not be version based, the platform specific
one is used. The X1E80100 platform is the first platform to really need
the second master, as all the available boards have the PMICs that
provide the eUSB2 repeater on the second bus.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 .../bindings/spmi/qcom,x1e80100-spmi-pmic-arb.yaml | 136 +++++++++++++++++++++
 1 file changed, 136 insertions(+)

diff --git a/Documentation/devicetree/bindings/spmi/qcom,x1e80100-spmi-pmic-arb.yaml b/Documentation/devicetree/bindings/spmi/qcom,x1e80100-spmi-pmic-arb.yaml
new file mode 100644
index 000000000000..a28b70fb330a
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
+      - description: tx-channel per virtual slave registers
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


