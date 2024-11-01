Return-Path: <linux-arm-msm+bounces-36672-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 046269B8A82
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 06:33:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D4B11C20A55
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 05:33:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64B1F154BEC;
	Fri,  1 Nov 2024 05:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SmVJQzds"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 765B614A09C
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Nov 2024 05:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730439130; cv=none; b=EOQvXtGo/tXgHj75PYCclWshf7r2gOS0GR9PYV2JhpTtjNBzSinYLjjAaseJfiuTLKnE8y8fA/7m6qhtsCq0NdtbdpnD7L5vYjQ6n0CitYAcHzAPVTGRO4QZAGaZYJe1YjPSprSdAdSMxBmLFrBA/WLONidSl3mbqs6Pdxs+OIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730439130; c=relaxed/simple;
	bh=MIPfMw1YB4xU9QdBv6XJQV5NzQp8bCOrbsfDS5uWggM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MielY1c0pRzIJCqv51bYfVgChMLs1WTdCQXwgp5IvqJapIxDPMdIn0XvfrS34L9uMfD/rDIDGQOsvXtzxQTe+ouT1kIJw2B3mjpWoVmikwkO2CjFUJFmz9jM+LWLWJZ10SIJR/bYZFdjpVyhuL4Gk5HvyGD+xPZY2QhE3a65Q/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SmVJQzds; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-539fbe22ac0so1725507e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2024 22:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730439126; x=1731043926; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HXeosd2ImYqpCcg8TPqRB9Vty1rjGyQScmLaV2l8+H8=;
        b=SmVJQzdsDP+9UE22diGiE3navYLaptMB++GpRqFl17jsqeOUgal2Gmi7E+jUQ2gxb2
         Tt56VBL35X7dZDUfWu1DxiV/oHFxCpRSKLk5PdLjDpoTIj9KM8mS1hJt074vW+wp6z8u
         AmUq8iSO9ChpuNcZvZVlZcK46nnaehjWLlVYLMxmDZdVPhq+65dhkBGF4ViA5DIu9LN3
         HtWQWSkfAzsvDivLp51GuUhKo4HaIoennNYN2H15klv9/un18C+Qccp5SJI5xNbtxr3I
         pM9BZM6t2iufDQfqNzJuw9B4jOsvKNNlr4cMsmN3o/v7a1j12g/0J56FHWBb40ozVrU4
         oiow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730439126; x=1731043926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HXeosd2ImYqpCcg8TPqRB9Vty1rjGyQScmLaV2l8+H8=;
        b=w4zBkJL+AICHlQX7izdVaB3FDq865Ii33517Rh2WYhd+NB+zSvBmHlP25pvvs9v78M
         RtXb9GYF9c6Jkn9pZj9b+bUxMHDdcetM8jWmQnJXZQxhjRxcr+mcdiU42wyxx+Xg/Svu
         4tVXQ5B0V8+WdAWa6uFkEjHpmiuU3wBZ2yOr5WIWMXZUM3IL2dBzHuOIBVBQdYMHilGa
         pG7mLUT0FKBYjJzgwIwfQMBQzc7F4Gs/TTcd9RU9AdIt93wfFIorUWK3au8VlnCMKHnQ
         ajlFSbIHm2sSkobaj3EgiAQM9LP3+GIizcMZZ2ujPCNUy04qRXF0Co9mrIhyylcjLscZ
         l7jw==
X-Forwarded-Encrypted: i=1; AJvYcCVQkAmb2WvBzNcg2wFDgAhJyq9GrL1ZJVGvmBZJdCh49jCIy210vIkF0R+n2SN6nZUQFFMxxq0C8ocvIa8t@vger.kernel.org
X-Gm-Message-State: AOJu0YzWsIzbF8NhNKFC1Eo0zDaaupvCS2hSqcXRZWw0LWA9eqWSrOoj
	/3vHoW3SwaNxVsnymHoJx2AGbquCfJWoRSbhxziWnx/scxxNss5T+wkhfAsjji0=
X-Google-Smtp-Source: AGHT+IEDB9lVYwB5VsH7Tsl550C9rRY+uuA/zMGHYrtOu/zr2U+22id4jmAFoUBiWNTfptWgTpX5Ow==
X-Received: by 2002:a05:6512:3c99:b0:539:f93d:eb3d with SMTP id 2adb3069b0e04-53b34924cadmr11108056e87.46.1730439125686;
        Thu, 31 Oct 2024 22:32:05 -0700 (PDT)
Received: from localhost.localdomain ([2.222.231.247])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4327d6852fdsm46960505e9.34.2024.10.31.22.32.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 22:32:04 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: broonie@kernel.org,
	konradybcio@kernel.org,
	konrad.dybcio@oss.qualcomm.com,
	andersson@kernel.org,
	srinivas.kandagatla@linaro.org
Cc: tiwai@suse.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dmitry.baryshkov@linaro.org,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 06/10] ASoC: dt-bindings: add wsa881x-i2c binding for analog mode
Date: Fri,  1 Nov 2024 05:31:50 +0000
Message-ID: <20241101053154.497550-7-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241101053154.497550-1-alexey.klimov@linaro.org>
References: <20241101053154.497550-1-alexey.klimov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add binding document for WSA881X family of smart speaker amplifiers
that set to work in analog mode only and configurable via i2c only.
Such devices are found in Qualcomm QRB4210 RB2 boards with
SM4250/SM6115 SoCs.

Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 .../bindings/sound/qcom,wsa881x-i2c.yaml      | 103 ++++++++++++++++++
 1 file changed, 103 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wsa881x-i2c.yaml

diff --git a/Documentation/devicetree/bindings/sound/qcom,wsa881x-i2c.yaml b/Documentation/devicetree/bindings/sound/qcom,wsa881x-i2c.yaml
new file mode 100644
index 000000000000..51b040b134d2
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,wsa881x-i2c.yaml
@@ -0,0 +1,103 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/qcom,wsa881x-i2c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm WSA8810/WSA8815 Class-D Smart Speaker Amplifier in Analog mode
+
+maintainers:
+  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
+  - Alexey Klimov <alexey.klimov@linaro.org>
+
+description: |
+  WSA8810 is a class-D smart speaker amplifier and WSA8815
+  is a high-output power class-D smart speaker amplifier.
+  Their primary operating mode uses a SoundWire digital audio
+  interface however the amplifier also supports analog mode and it
+  can be controlled via I2C. This binding is for I2C interface.
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,qrb4210-wsa881x-i2c-codec
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    description: Master clock for WSA amplifier
+    maxItems: 1
+
+  clock-names:
+    description: Master clock name
+    maxItems: 1
+
+  powerdown-gpios:
+    description: GPIO spec for Powerdown/Shutdown line to use
+    maxItems: 1
+
+  mclk-gpios:
+    description: GPIO spec for mclk
+    maxItems: 1
+
+  '#sound-dai-cells':
+    const: 0
+
+required:
+  - compatible
+  - clocks
+  - reg
+  - powerdown-gpios
+  - mclk-gpios
+  - "#sound-dai-cells"
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/sound/qcom,q6afe.h>
+
+    i2c0 {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      wsa881x@e {
+        compatible = "qcom,qrb4210-wsa881x-i2c-codec";
+        reg = <0x0e>;
+        clocks = <&q6afecc LPASS_CLK_ID_MCLK_3 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+        powerdown-gpios = <&lpass_tlmm 16 GPIO_ACTIVE_LOW>;
+        mclk-gpios = <&lpass_tlmm 18 GPIO_ACTIVE_HIGH>;
+        #sound-dai-cells = <0>;
+      };
+    };
+
+    i2c1 {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+        wsa881x-right@e {
+          compatible = "qcom,qrb4210-wsa881x-i2c-codec";
+          reg = <0x0e>;
+          clocks = <&q6afecc LPASS_CLK_ID_MCLK_3 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+          powerdown-gpios = <&lpass_tlmm 16 GPIO_ACTIVE_LOW>;
+          mclk-gpios = <&lpass_tlmm 18 GPIO_ACTIVE_HIGH>;
+          sound-name-prefix = "SpkrRight";
+          #sound-dai-cells = <0>;
+        };
+
+        wsa881x-left@f {
+            compatible = "qcom,qrb4210-wsa881x-i2c-codec";
+            reg = <0x0f>;
+            clocks = <&q6afecc LPASS_CLK_ID_MCLK_2 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+            powerdown-gpios = <&lpass_tlmm 6 GPIO_ACTIVE_LOW>;
+            mclk-gpios = <&lpass_tlmm 8 GPIO_ACTIVE_HIGH>;
+            sound-name-prefix = "SpkrLeft";
+            #sound-dai-cells = <0>;
+        };
+    };
+
+...
-- 
2.45.2


