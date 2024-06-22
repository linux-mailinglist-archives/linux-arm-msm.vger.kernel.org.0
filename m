Return-Path: <linux-arm-msm+bounces-23707-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ABDFF913534
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Jun 2024 18:49:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 37E241F22624
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Jun 2024 16:49:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EA8B15E85;
	Sat, 22 Jun 2024 16:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d9XrB5pY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21CC4BE7F
	for <linux-arm-msm@vger.kernel.org>; Sat, 22 Jun 2024 16:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719074985; cv=none; b=WNxw72xOOjIxB4R/ASv7/wFzmed835pWvON41bs6yxgs5t8dBwaeMma0Sf53HTw50gmKueDC5/u0w8ZS83zuvUVs5Z+yJo31NAQZfm1DKjExaV8FWX2Llz8Ut8D5PGyszkiyyrSm8rb5Fe985oQhtCuhgETwYc+Q/TNEmfOqhKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719074985; c=relaxed/simple;
	bh=Sf0QTJR/Hu7OukemVEkC1P6CQSycyXAXifh7MOryd9E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FYlFDkvJKiQIMDW52y69BrHxVUbpTQMVTZMxn83yXUbkFCB76rb7JSfGB0WcO3WzP79OhFSTwULcq38BzhEefDy5OZHhCsqXtkjUxMuVgF+je2i7wNEA6JMUfTkxCFcxGzoc0vsd+nm+dthZV+QLtG/y3m90AVNTaapQpOpRhY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d9XrB5pY; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3608e6d14b6so1969536f8f.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 22 Jun 2024 09:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719074981; x=1719679781; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Aln+eminEX0kpiO1aOrLC8R1kxsbuGPbt/Mp1hkWtRo=;
        b=d9XrB5pY9uKmD+KY+Y9qjIHNIdgqKLiKOFP2FjrvUwwueKp9uM2eYeRZZ5p9br8oFY
         5C+kK36K1SGZI9CgF9ACNc1Q0Kr3WyI/jf21sm+AtuNQ3Q/K/g5wXxAbAhG33/HyQh1m
         RYN06roNehXPekhbHDHmqkeY0SwPFYG8Lpb9grb7d+M14Dza9N1dA9fnr7Au65otXOZg
         HUzh9K+E7K/yMFToCuoKgng1p2y2sJVJ2CZtHuvQ3ZF7RAEgqA3du/Y33yiQgZueNarD
         x5mB8F3IPlERaDBvOYkG1eZToRwXyYbm2QApwZbXPW0SD62XrMvawPer9Q4ZD0VKHisP
         38fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719074981; x=1719679781;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Aln+eminEX0kpiO1aOrLC8R1kxsbuGPbt/Mp1hkWtRo=;
        b=D+s48MQkDatso9hJNNFHmy4oym2nE/vfXNQbQVMCXHs1Doo85CSyr1Q2pcDYx7HKSx
         dISBgrI1DjHqS7417tWJadrBLncAicW9JojzHn+ofEykh5Dl/rKdG/oE+Avt509l7s81
         bElW1E0y/0nMpXsHxeNdWEZoaPBdke5TlM5dQLs+kWy97whAZ9JhweDBmyOnvH8d2JgA
         IOSnpa3xC5Z8at/MeJiVS+P+63doOIhwqehmDatDcm4t10h2p01t/iTNJshv5YqsvHda
         Q4wp0u+Lax6vQGEYjRdPSGbR0QE4XHJ9tX9OWbgDa1FsEmx9FWAekoqiHyGYgA+Mr3HZ
         AOgg==
X-Gm-Message-State: AOJu0YyiQ3FAy7RLTqBIk3RoWFIPRamyyeANfXDVfYvy50gcGIf0O1u0
	qaORSw59hZSK1NkkvWSSuFiFhgVoKOJQ0JdKgHdNJB6zTGuSNtOTyPpLem4J4n8=
X-Google-Smtp-Source: AGHT+IHGyaQuNel3rRyyzaXIhTQ0TuAMuKWZlPhXZMrPiDA3IPzWBySMuiKr86UqNkxtt9dV6QBxiA==
X-Received: by 2002:a05:6000:1bd1:b0:35f:20da:e1a2 with SMTP id ffacd0b85a97d-366e94d165fmr147813f8f.30.1719074981459;
        Sat, 22 Jun 2024 09:49:41 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3663a8c8b27sm5030730f8f.104.2024.06.22.09.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jun 2024 09:49:41 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Date: Sat, 22 Jun 2024 17:49:30 +0100
Subject: [PATCH v2 v4 1/2] dt-bindings: pinctrl: qcom: Add SM4250 pinctrl
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240612-sm4250-lpi-v4-1-a0342e47e21b@linaro.org>
References: <20240612-sm4250-lpi-v4-0-a0342e47e21b@linaro.org>
In-Reply-To: <20240612-sm4250-lpi-v4-0-a0342e47e21b@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 alexey.klimov@linaro.org, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4210;
 i=srinivas.kandagatla@linaro.org; h=from:subject:message-id;
 bh=Sf0QTJR/Hu7OukemVEkC1P6CQSycyXAXifh7MOryd9E=;
 b=owEBbQGS/pANAwAKAXqh/VnHNFU3AcsmYgBmdwCiJoBdNttQui4uzT9TJ8TFykAyihd5AICOf
 5F904RW6cCJATMEAAEKAB0WIQQi509axvzi9vce3Y16of1ZxzRVNwUCZncAogAKCRB6of1ZxzRV
 NzxWCACWKw/Hv8bZevHaWtWYOUqrqSdlhxaPdxdMR5jlqsEtg9npKJi1cf206tw0Z9j0En2LH/B
 KP43H51nCtqYNR/gPpHnZDu4nFwJYZ89SprY9VmzdFk2u4y4gEgC8E45o2kq9nPQmhiBars8Fzv
 wUjNnI+QyT9O6+K8Fk6pgJuraaroTKS9BBF71Reyj2utNqnXs99iqX+u6Dj2h1WdPzy28Do24sF
 Hw0IZyXHs0p15XQk5nIRDgiBLPYG0M5rTaCT9CIIufdxqZmLueIp0UrlnbFlS5mHscDjpTJM+9j
 vC58dpSkynIFBM3SgaIXdjJJofFU+2H9gtFll/dcR0rO6OCf
X-Developer-Key: i=srinivas.kandagatla@linaro.org; a=openpgp;
 fpr=ED6472765AB36EC43B3EF97AD77E3FC0562560D6

Add device tree binding Documentation details for Qualcomm SM4250 LPASS
LPI(Low power Island) pinctrl device.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 .../pinctrl/qcom,sm4250-lpass-lpi-pinctrl.yaml     | 118 +++++++++++++++++++++
 1 file changed, 118 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm4250-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm4250-lpass-lpi-pinctrl.yaml
new file mode 100644
index 000000000000..9612e21183fa
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm4250-lpass-lpi-pinctrl.yaml
@@ -0,0 +1,118 @@
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
+    items:
+      - description: LPASS LPI TLMM Control and Status registers
+      - description: LPASS LPI MCC registers
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
+          pattern: "^gpio([0-9]|1[0-9]|2[0-6])$"
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


