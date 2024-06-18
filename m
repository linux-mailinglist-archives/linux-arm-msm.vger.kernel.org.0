Return-Path: <linux-arm-msm+bounces-23014-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B12390CB4F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 14:11:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CDC4CB25D18
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 12:06:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01E2813C81B;
	Tue, 18 Jun 2024 12:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W3m96ncq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A7913C661
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2024 12:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718712099; cv=none; b=Eghow7gZpiWumqdqLO1xvsJFNz/uEjY/kKBLdDf+lS7yypEL2RaGbByjgxRARg414Cys3KWV+2H+ep5o3kG90LALQNZmw/7kWaqsf1pj+4WkxFHgivhDswQiotSAuMMkx3iikfT4uY6QPt4axlb0Qp5NZVOHTRgrAD5gIPFc4Ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718712099; c=relaxed/simple;
	bh=sprlGxql51p3vP7xPN/KykixmQSi8IE2wkzigzDtwYM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UPe5l3GYuYj6wMP9CoLVed6MRrpAFdcz/q5KKH5YZ0ecdp2mN2f+zIFyGBQgHJMhkq2cqeIgpW4JykhNVe394nZnJnhZXPE0s1Jb3Upa8djpVn9tgI0dA3DCBqtaE3L9RQUcpIcDtS4i+txkl3LcGYaMtadmb7vvQAvDtN9+dbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W3m96ncq; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-57d044aa5beso269620a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2024 05:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718712096; x=1719316896; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0if+cIm9sucvkEuvbfSoyHEmF9Mwgxaw53ijaLKi6/A=;
        b=W3m96ncqgabmfAdFsbkWRuq3nWyJw6r24p7Nj7l1X+QSbko4GvsPg2rOOOR0aOZlDR
         Jci9PE5FiWVqfUngbfrAq+dAUoH+RCNAtwVNxoU/WQaPwu5snYTdax0XceE0mjTGN0PS
         OIuH7VtZCBYZ2N/ouq6+Am4/pVdUvbBb1zZuhnzNbXLcFc79M36lEZEvp3Ic0DfdOPFk
         M7IiSUXMt09NrIzrHi4HDry0UNcupY0F/PtkHhakY6h3ZJOaT7pUFY73sO3GSTc/18Np
         YptyAhPMFkkisGnqXuNhi1l4iGv9zNUwUKXPfZITR72qeJDIfs4naHafBoaJLb9DLrub
         HbaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718712096; x=1719316896;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0if+cIm9sucvkEuvbfSoyHEmF9Mwgxaw53ijaLKi6/A=;
        b=GzNLG05JQ5LbFkPNsrB8iWbnnMhatSXbt3jOS1krz29zSKLS2gfLDfgFK7EHIYJOUs
         5cMQFMNFfS+k40Yo/KsWWpQ6t2Sobm2IA+1Ig23stAjfjp92GYdy232NwJPeVS2oLrXL
         ekz9N9jfwXyQ2UZqZBu8Wlj8GWPjbnh7RlEon6CBhkQO104EQp16fvxkxdvWCQ3m9JC8
         VvInQHuec6V8qrgUU2XwSe4cUQWw7EpjhdGvkJmsTnnmWrSSWVL+UuXcW3KhLUGR+Iba
         z1dAxUUNiA/U8OoUWdPyklyuiET9MEA0ZxhWgLCPapYihktzi5j8QyBz8UD3jOIYU7kk
         WuhQ==
X-Gm-Message-State: AOJu0YxSJjaPXulsdpQ/HAo/EwLVn+W/qYlblHC5wBHxfqWKQFrcl8I9
	PQswYthHQXp4U7Kf6WE3G3rXQ5pQvkQQd4T0mmBee245lnK26klX8S6AgSX0op8=
X-Google-Smtp-Source: AGHT+IG63+i18RVFdPkkxzMFOfiDNY4zsFur1aNU8LngxqGTqnhLAvd3E7C2ZHGGKSmuMjepH5W4sQ==
X-Received: by 2002:a50:9e43:0:b0:57c:6d89:eaf0 with SMTP id 4fb4d7f45d1cf-57cbd67c291mr7604139a12.14.1718712096354;
        Tue, 18 Jun 2024 05:01:36 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57cbbb5576csm7062638a12.89.2024.06.18.05.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jun 2024 05:01:35 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Date: Tue, 18 Jun 2024 13:01:24 +0100
Subject: [PATCH v2 v3 1/2] dt-bindings: pinctrl: qcom: Add SM4250 pinctrl
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240612-sm4250-lpi-v3-1-a8dce28f20a2@linaro.org>
References: <20240612-sm4250-lpi-v3-0-a8dce28f20a2@linaro.org>
In-Reply-To: <20240612-sm4250-lpi-v3-0-a8dce28f20a2@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 alexey.klimov@linaro.org, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4271;
 i=srinivas.kandagatla@linaro.org; h=from:subject:message-id;
 bh=sprlGxql51p3vP7xPN/KykixmQSi8IE2wkzigzDtwYM=;
 b=owGbwMvMwMVYtfBv5HGTUHPG02pJDGmF5bKCFzK/LZzptuxk30R97yOCJwP5ebRaJqmvOR8p9
 TaoYnV/J6MxCwMjF4OsmCKL0nP/qGN/Hn37Lne3F2YQKxPIFAYuTgGYSEYj+29W7shVm5qlGSV1
 DA9PV8iocM5bGDRXegEbz6sd4t+1lEqzxGbc4z9j9Dqt6/INXf3dZwSSFP/vrdx8pK60zjneeYt
 J3s03L23ExHp879f8rV8n+rRVMbJQ58VL3ymtUs0FPd9fVegwpShn5XbObP1ok/x96pp2t791XM
 uXLvqe+Ox7yimJliTe0KdprqqvjjnNrfp3y6xkyRv3cNdNEgf7uz2PZXx3FS4u+xWh0nnhzwHZy
 48+71Nq/+mr73W9IfHHSyPn5Ss6vtVvCXxXaXrYc6+25Y2203uurk/TV+Y15Y1P/zvpR8/MVEk7
 xuTla7LS45L4nR46BrhPfr8kWCdOeIMBk3zx7jUuylwVAA==
X-Developer-Key: i=srinivas.kandagatla@linaro.org; a=openpgp;
 fpr=ED6472765AB36EC43B3EF97AD77E3FC0562560D6

Add device tree binding Documentation details for Qualcomm SM4250 LPASS
LPI(Low power Island) pinctrl device.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 .../pinctrl/qcom,sm4250-lpass-lpi-pinctrl.yaml     | 121 +++++++++++++++++++++
 1 file changed, 121 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm4250-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm4250-lpass-lpi-pinctrl.yaml
new file mode 100644
index 000000000000..28230f63f015
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm4250-lpass-lpi-pinctrl.yaml
@@ -0,0 +1,121 @@
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


