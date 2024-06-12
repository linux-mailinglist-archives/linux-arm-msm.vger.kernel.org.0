Return-Path: <linux-arm-msm+bounces-22428-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7669051B7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 13:56:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B1CA32880B0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 11:56:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CF0516F824;
	Wed, 12 Jun 2024 11:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Jrqs7qKL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECFDC16F0FD
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jun 2024 11:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718193371; cv=none; b=PQwNKzlK7y95zEiLa7WPy1b35CZ1ymEzBHqV2nP8YDcKFwKgp90qxj7HLT2sWwlmgUJBUXlf2bu5T7PsQC4TTAyKrfapKy80mWt6/cA+YJeTQTtkL/u0JK3TqyMGIDPGiGyq3g5qrzuDXo+2JgBJPyalHZ4lgMVV4lZpU/yBjec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718193371; c=relaxed/simple;
	bh=aZtdVnXYlOJKHMUmHWZfsO3wqw/EgbmLFQVlM9kELD4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M35e91R49dV+6a5Xwz1oTTypdkGej+r3enSIGAOCd5F5Hi5paMG/p3W+RT5epoUHIINfby0XacDG2FG35zJe+C39qWKbTavwxp4B+Z7aiaWEm9MvC1kmhYX3O55hp88y6GP5KMuyCj0Z6EDY67K6frVd8sezN4B97x0unEzOx/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Jrqs7qKL; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-57c83100c5fso2653592a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jun 2024 04:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718193367; x=1718798167; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UHpZ9gagK7j5wDwUyIomAVNv8cDr2aSk8hvPd70Uupw=;
        b=Jrqs7qKLHG2XCgU8evARi0/dYSAeyrJO+4I+B4PMWlYyH7oBUyBCsF1Zyfd3f3Gi/D
         Hwyh8JuliReaBsLqLpQHfjXQIo+Wl/dzA3b/nss9Nn2io9wvjTFT2LN7/isgDxaJWcgd
         /CPv4Y9sgcubIhtWDgFeL+Q7FK/EAXrNxU/SpPTVD2jdA+bIlcnKOhstoDeaQJMavoUN
         KJrqQ4BxGhKQxxUdMI4RrLrk6IjfzH6RLqVM04YxYMxQZki6U7D/v6/an1BCtWr6ZYuG
         P8zKwk1+OK6su78O5jYjzMaQnE7KeewSk+C3n0n+Fq7LzOEsvU28joIwaCpXmQCm5l2o
         fV0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718193367; x=1718798167;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UHpZ9gagK7j5wDwUyIomAVNv8cDr2aSk8hvPd70Uupw=;
        b=JMl2/p1vfgb3HdLzbSTlTN4cHOttYsAUkz3+PAEgeaCbV6O2HIeaXkff8evJWjEcdZ
         G71zGlYrbVJPkC7nW4QZqi2eJ2Y4XMGqdDaEDOj1khjBbIV2NOtcRbvivjN1hVhnYAXH
         tPMBpxUQJDACp29bE9WXwIA8cW+8bHsHo4aO1ELGbEkli59VEhUzE3WLQgzj6XyZdEpY
         XDANa955jXqRvsANpMVtJtId2vt1qFUL0NwjQKSqiblIlzkC0rzT6/Qx30jYyXMTclF0
         S6j3Lz3hw3mUjmKso7oWpylXJj0WX83eu7mrcD4cA8+KFg8cKbKONPciXgNIhxwDAGwf
         pF8w==
X-Gm-Message-State: AOJu0YwTn5fcSIsvCUgIcXjZ2OdifYipFK/UXwps0r2jmPmhm1qjtrdM
	oE+vbErU8LEV1+ANvbOlSbmPar6fFMvRsd+gaUKPhsOYw7DS+yYRrs7NUxnZSSo=
X-Google-Smtp-Source: AGHT+IHKK6Rk117/R+XENP1DQa2PVtefaSzm+bmyxBJbYeBtfuBibevHdTdhfDlvdPmQ760ZFDkcPA==
X-Received: by 2002:a17:906:f24a:b0:a6e:c5b0:b64b with SMTP id a640c23a62f3a-a6f47c7d974mr91851566b.16.1718193367099;
        Wed, 12 Jun 2024 04:56:07 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f2f8bd62esm275762266b.141.2024.06.12.04.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 04:56:06 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Date: Wed, 12 Jun 2024 12:55:44 +0100
Subject: [PATCH v2 1/2] dt-bindings: pinctrl: qcom: Add SM4250 pinctrl
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240612-sm4250-lpi-v1-1-f19c33e1cc6e@linaro.org>
References: <20240612-sm4250-lpi-v1-0-f19c33e1cc6e@linaro.org>
In-Reply-To: <20240612-sm4250-lpi-v1-0-f19c33e1cc6e@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4162;
 i=srinivas.kandagatla@linaro.org; h=from:subject:message-id;
 bh=aZtdVnXYlOJKHMUmHWZfsO3wqw/EgbmLFQVlM9kELD4=;
 b=owEBbQGS/pANAwAKAXqh/VnHNFU3AcsmYgBmaYzU5vTNqm+gXSdmuTClTGFLKe+uHY33JI5+1
 H8FoXTruNmJATMEAAEKAB0WIQQi509axvzi9vce3Y16of1ZxzRVNwUCZmmM1AAKCRB6of1ZxzRV
 N7coB/43VSrAv0NjmZdNhkMwN6/Tatqpombx5w6GwIpybpZCHH+w1RaKrjzqybpqVuIxU+MwY7e
 c69/PQ0gK3r0ZtB/se5Y8CiYPZaptP0zVSYZp6AVliWvb/rMA/L5o6T6Pa2zq1q5zJmVfKsbcXx
 my7rirn2Td8SXWC0KqjpBR5m7pRV9S/KB+wL5pV+RMRF5vU040KtxAxgMUIz/iM0oV9jIwyTb/8
 xWLM3GVMw8Lc10KJZbZ6E2VSU52wOvCytxHycCJ2enmYtfzfSGrBtNqGggTsRWGbDWUOL6mSQdl
 E4Q/Blmol9ftzN0uojcL2/1KXSQTot7yOLDdhyIuQm2J2nhP
X-Developer-Key: i=srinivas.kandagatla@linaro.org; a=openpgp;
 fpr=ED6472765AB36EC43B3EF97AD77E3FC0562560D6

Add device tree binding Documentation details for Qualcomm SM4250 LPASS
LPI(Low power Island) pinctrl device.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 .../pinctrl/qcom,sm4250-lpass-lpi-pinctrl.yaml     | 119 +++++++++++++++++++++
 1 file changed, 119 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm4250-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm4250-lpass-lpi-pinctrl.yaml
new file mode 100644
index 000000000000..3968a363aa51
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm4250-lpass-lpi-pinctrl.yaml
@@ -0,0 +1,119 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/qcom,sm4250-lpass-lpi-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SM4250 SoC LPASS LPI TLMM
+
+maintainers:
+  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
+
+description:
+  Top Level Mode Multiplexer pin controller in the Low Power Audio SubSystem
+  (LPASS) Low Power Island (LPI) of Qualcomm SM4250 SoC.
+
+properties:
+  compatible:
+    const: qcom,sm4250-lpass-lpi-pinctrl
+
+  reg:
+    maxItems: 2
+
+  clocks:
+    items:
+      - description: LPASS Audio voting clock
+
+  clock-names:
+    items:
+      - const: audio
+
+patternProperties:
+  "-state$":
+    oneOf:
+      - $ref: "#/$defs/qcom-sm4250-lpass-state"
+      - patternProperties:
+          "-pins$":
+            $ref: "#/$defs/qcom-sm4250-lpass-state"
+        additionalProperties: false
+
+$defs:
+  qcom-sm4250-lpass-state:
+    type: object
+    description:
+      Pinctrl node's client devices use subnodes for desired pin configuration.
+      Client device subnodes use below standard properties.
+    $ref: qcom,lpass-lpi-common.yaml#/$defs/qcom-tlmm-state
+    unevaluatedProperties: false
+
+    properties:
+      pins:
+        description:
+          List of gpio pins affected by the properties specified in this
+          subnode.
+        items:
+          oneOf:
+            - pattern: "^gpio([0-9]|1[0-8])$"
+        minItems: 1
+        maxItems: 19
+
+      function:
+        enum: [ gpio, dmic01_clk, dmic01_data, dmic23_clk, dmic23_data,
+                dmic4_clk, dmic4_data, ext_mclk0_a, ext_mclk0_b, ext_mclk1_a,
+                ext_mclk1_b, ext_mclk1_c, i2s1_clk, i2s1_data, i2s1_ws,
+                i2s2_clk, i2s2_data, i2s2_ws, i2s3_clk, i2s3_data, i2s3_ws,
+                qua_mi2s_data, qua_mi2s_sclk, qua_mi2s_ws, slim_clk, slim_data,
+                swr_rx_clk, swr_rx_data, swr_tx_clk, swr_tx_data, swr_wsa_clk,
+                swr_wsa_data ]
+        description:
+          Specify the alternative function to be configured for the specified
+          pins.
+
+allOf:
+  - $ref: qcom,lpass-lpi-common.yaml#
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/sound/qcom,q6afe.h>
+    lpi_tlmm: pinctrl@a7c0000 {
+        compatible = "qcom,sm4250-lpass-lpi-pinctrl";
+        reg = <0xa7c0000 0x20000>,
+              <0xa950000 0x10000>;
+        clocks = <&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+        clock-names = "audio";
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-ranges = <&lpi_tlmm 0 0 19>;
+
+        i2s2-active-state {
+            clk-pins {
+                pins = "gpio10";
+                function = "i2s2_clk";
+                drive-strength = <2>;
+                slew-rate = <1>;
+                bias-disable;
+            };
+
+            data-pins {
+                pins = "gpio12";
+                function = "i2s2_data";
+                drive-strength = <2>;
+                slew-rate = <1>;
+            };
+        };
+
+        i2s2-sleep-clk-state {
+            pins = "gpio10";
+            function = "i2s2_clk";
+            drive-strength = <2>;
+            bias-pull-down;
+        };
+    };

-- 
2.25.1


