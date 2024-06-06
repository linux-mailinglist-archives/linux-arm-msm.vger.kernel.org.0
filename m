Return-Path: <linux-arm-msm+bounces-21921-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB3E8FE711
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 15:04:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D7A791C23157
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 13:04:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 199E9195F09;
	Thu,  6 Jun 2024 13:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="joPzXi64"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06AE7195B0D
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jun 2024 13:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717679055; cv=none; b=eDC57I2cnBgQmIeqvDoxuKrrr2YpaZhSF92rB8vZYJi7g+N0/0s6+8zg50OxCAg9E+7e1wvibcesWNy1b3+s6PrxX0g7cFaZf16tDj9ic1fmIe02vv4ukgxp5SI3WWb8yz9IS8UV1l+h3AlNsy+Lact+ilo1cZfJYhw1wszLd6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717679055; c=relaxed/simple;
	bh=GAPH2Z7eu9DetUGOatBhUGzqxV8I0ITlkgNM75wQwFo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bnFyqvrk9evVM5lvsaGDStjVGhOu4pGo1KI/tBvbpw8jOkUyQCIN5HEVYGYDyi2GCld+dF8jUhJcUpPMJR3fO6V5TH+nMtPRVDdnVWmwOAP6EKHlXl98cXf6lU5V/zHV0spdfZU2ItptUd5GxefG3yOKBIUzhx4szcPBFduk1rY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=joPzXi64; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-35dcc681f70so712842f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jun 2024 06:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717679050; x=1718283850; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fuSq2gEANHXtmu+UUYCavqRwPgfGh0Xr65LspIuW5Dg=;
        b=joPzXi64Z2/YLInMpaXCxdHjsOFsx0X0m43XZbLLAR5wWeNqUMENSyT8G/0yunl0N9
         S/7vQ+6rRlmFonbgJviLyIye3UQ7bPuoOS1rpb1Zb/gxmKVO9aHs8O+rGFd+t2Bpj32w
         BYawKtZriWqnQmk4XMlS1iXm1lPsfIc8FzfJFozE1KVwkQ8CpuuWMBBZYfn5Cm1Rx7os
         2x8MN8hGaipFRsjTUfm83SSWU9xhYVI/vo9VCxrRRWYm61Ioep9uhfkK6jp79Re/g+/g
         lpo1zHXqZkydXNHRkTgiIV1ijlWIrQFldND3iTVLjyDatqGicMScEMuDIgKw1SxOOc1Q
         1x3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717679050; x=1718283850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fuSq2gEANHXtmu+UUYCavqRwPgfGh0Xr65LspIuW5Dg=;
        b=ujaYvqPzY/erf4NIbZ57qsZR+jzDaw1iMjaiIs8OA8vI8hnetKD+SkmF4pztQ/vlUS
         fEEtdFUF1R8YASnYub6xbq2Vx3ymFVsoou/LvpqAABM4Rmog/fbQI8DX4UfnaNeSYIRU
         YRI87V3d9x8dGnk4nERwjz8TPiYAB+30a5bzve/mOXhLYwEKDdfR5SJDFfUVGIWtX7QX
         f/gmvpc4l1Z9Y0Sn2VCs8txIad7YBrUjJAAllzQvdahmL99EkhYooty/zHUC73ks5VBL
         oCk/DVR2V2N4fkmQImwdniIiO1GBx3n74W/l6Mc1lvZIQ4ERnvcpKPu9SkChlBALpv1x
         zidg==
X-Forwarded-Encrypted: i=1; AJvYcCVJyT6IvFHjkhu5KPPMu4xJ6JhDVvCFBj5XI92I2cvebMlDLEuuuubvQXlnECVnDcKGUIjlFF63dgIcJcymPG+osWd/EIU+Kkt8REqjeQ==
X-Gm-Message-State: AOJu0YzsC97JaZHUawg8LTZzOA3Cywtj5o5dxQKDk3h/ovnZE3nlengY
	KN3AP/8rW06fGXiufgOwEKww3oA3d7Qt0U53igmquiK8rxX39yYt/xw9C2U3oXQ=
X-Google-Smtp-Source: AGHT+IEBDu4fKjtlUvZo4xyjG0F14PxqYikC/iFEFI9pus0lvqe+VPsmEhgBpXGCH7wsIKtLVgNf9g==
X-Received: by 2002:a5d:404d:0:b0:35e:7de9:bdb1 with SMTP id ffacd0b85a97d-35e8ef77e12mr4252978f8f.53.1717679050350;
        Thu, 06 Jun 2024 06:04:10 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35ef5d49dfcsm1505286f8f.39.2024.06.06.06.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 06:04:09 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: andersson@kernel.org,
	linus.walleij@linaro.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	srinivas.kandagatla@linaro.org,
	linux-arm-msm@vger.kernel.org,
	inux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: pinctrl: qcom: Add SM4250 pinctrl
Date: Thu,  6 Jun 2024 14:03:22 +0100
Message-Id: <20240606130323.138970-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240606130323.138970-1-srinivas.kandagatla@linaro.org>
References: <20240606130323.138970-1-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Add device tree binding Documentation details for Qualcomm SM4250 LPASS
LPI(Low power Island) pinctrl device.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 .../qcom,sm4250-lpass-lpi-pinctrl.yaml        | 119 ++++++++++++++++++
 1 file changed, 119 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sm4250-lpass-lpi-pinctrl.yaml

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


