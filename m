Return-Path: <linux-arm-msm+bounces-62568-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD90AE92F7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 01:50:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 28C7C7A8C56
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 23:49:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 217332D3ED0;
	Wed, 25 Jun 2025 23:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ahRrBFt4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB5572F1FC8
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 23:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750895444; cv=none; b=EspU4HPZGPfm6lPUUO5GXR+fkKq/8DUYvyvmnaaIGe7VnB++3+nERXeoXJyAog8PuVIrLfY4E6Az1saDX5d3E/axDh54qftFLkAOu8R8W9qrjR13evZaOf5Sffn1fe4EPg34EffuLczl0EkSXQ1gHCq8zL1UpNXSjqYNEQWoFZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750895444; c=relaxed/simple;
	bh=Fl+Fcmp8mz0LRfZc8oHYvXZaL4ihlM0sMQO1BXpZYbk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AqbR0CSccbzEDId0BdtW3CwIAKxM0sgMIWenPOWFuxYLqO2iMPalQ8BL8lW7Z67w4gGOriuPp8Y1PXpeaZ5BzZ66RG+f2p2qwhMEiCuXjEJHgdWs71HgMuZDxUvembdQcQBeOLkYF/yBGOMcOGC4ogKxV9nO1VxdzMpB946SuTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ahRrBFt4; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a588da60dfso216417f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 16:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750895440; x=1751500240; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YGuBjw/4XXCZvZaNsmrF9k0KyGZ7Z9vYK6pokbmxxu4=;
        b=ahRrBFt4ZZcwJa9aSdhOQCHoZhRNkEKXFOUczZ/WcRHzaaDpM1SmTXXfVoWiojdw7w
         2mNhYzvzgzWNBr6cF8SwbcODKFfjDVZ28vjgf5kK8GmoriNhED3043/lqVXZHNO2Df+C
         /jMbtSvNRr7bdUJBdzKxZmeNipmprad6IACET8y38RmsGckKrP0wqO5T3Ds8hFBkxbrE
         BXhBFFAAQ6nP4+iDUrtb9lkrnZfArzE5IXE9JpuxNOpZXQkPrRy5DTxLr1KzUEhtpL21
         NwK10T8+0qRvlNyklju3tzgmGgAHQYl9dV9jbZUrflQrcQdbtQ82+/YTMFGEwC8xrmM1
         gtww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750895440; x=1751500240;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YGuBjw/4XXCZvZaNsmrF9k0KyGZ7Z9vYK6pokbmxxu4=;
        b=Dds2DLa+l54gfIZUF7eRyFqmFeOyr7OUnR14AjEUa6b5ogFbgXjJHX44qIKCP9Xz5C
         iDMGLlA1khk7jKU4JY9RXHElg8/HjZ5N4aRtFy6DsPSlCI9TYZp195T+buqxhZp/Os3G
         DfQY537NvgzD0lPL29zu3Lt7OUn7gPfo6vOu/J+Q2JCaN+inhp3VEypM4Vvg7gnthHOm
         t5WtK4XWAH5cn8GWHCYVVVMVDDHKzrYdVsZyWsY9UyL69L/dOn57POJr+5t7hNM2DC16
         b5BmNKltotxXR6UUlbMOO/cjwf74XP4LJ+hNonhGJ7hTd9sR3ATLGJmDt9FEfodGxPQi
         Wr/g==
X-Forwarded-Encrypted: i=1; AJvYcCXWJ68H+JPH7XVQ+U0DYhBwW7egjeo+rlL9FNjAfKSLgFAEpK4rN4hpUynH0qOFxSCP71trKpI5IMj7EAMA@vger.kernel.org
X-Gm-Message-State: AOJu0YxrmnUb0ovTMxrHHuP2Cl7vSyuzGYNxl34O/3ZGeQaGE8L4VK41
	0z5f/3tqCMgm37GC6+8gaaspap7K2bs1bcNNStfiXs1IS/SblPGtjbmBjAICYz2LRCQ=
X-Gm-Gg: ASbGncv3wJd2huNc1zbP/T5MhztnUeeUzSLpGvTOpKxjDZgygGIFspjkE7Dtr4vo/RX
	3NnGRzY2TrUKoiN6zp/5DOdl4tRW4WmcWDwPgBsQjp8K07DK91brTjd1Wms5sY+9ajYZ1giDXnV
	ZcV7l2nel7vefLdr3viptvL3kpr8p9l1QrsQX4fYvjd+ZdW6BomnRn8Eh93m3t0rEcZRV/r/1o1
	vQm1j5ayVAT2AgsqPOpaRFhyHYYM5z/0QFqOijN6lwDlnDsls9nmiJ+OCwmtJVcdRcnFKpV2B17
	rs8CjlfsePjsbf0jY9ZqvfDOb6n8xtkCfn1RmGkrCaW3I8HgOJFSZwkdDq3BnWMZUaDm7g==
X-Google-Smtp-Source: AGHT+IEpDjYIrpImqHE+8RAtmzTF+CgQ1xyNtUnwpicY1ay2kJ/QqhSHjsjJ1ZptkucOZFRnPfleOg==
X-Received: by 2002:a05:6000:2204:b0:3a3:6a9a:5ebf with SMTP id ffacd0b85a97d-3a6ed61033dmr3619620f8f.20.1750895440230;
        Wed, 25 Jun 2025 16:50:40 -0700 (PDT)
Received: from orion.home ([2a02:c7c:7213:c700:1417:1313:3884:915e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e805dc32sm5636300f8f.29.2025.06.25.16.50.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 16:50:39 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Thu, 26 Jun 2025 00:50:29 +0100
Subject: [PATCH 1/3] dt-bindings: sound: add bindings for pm4125 audio
 codec
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250626-pm4125_audio_codec_v1-v1-1-e52933c429a0@linaro.org>
References: <20250626-pm4125_audio_codec_v1-v1-0-e52933c429a0@linaro.org>
In-Reply-To: <20250626-pm4125_audio_codec_v1-v1-0-e52933c429a0@linaro.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org, 
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, 
 Alexey Klimov <alexey.klimov@linaro.org>
X-Mailer: b4 0.14.2

The audio codec IC is found on Qualcomm PM4125/PM2250 PMIC.
It has TX and RX soundwire slave devices hence two files
are added.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 .../bindings/sound/qcom,pm4125-codec.yaml          | 147 +++++++++++++++++++++
 .../devicetree/bindings/sound/qcom,pm4125-sdw.yaml |  86 ++++++++++++
 2 files changed, 233 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,pm4125-codec.yaml b/Documentation/devicetree/bindings/sound/qcom,pm4125-codec.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..1b6ce8d4397b4c1c048899bd2cc4d02318cc46c9
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,pm4125-codec.yaml
@@ -0,0 +1,147 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/qcom,pm4125-codec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm PM4125 Audio Codec
+
+maintainers:
+  - Alexey Klimov <alexey.klimov@linaro.org>
+
+description:
+  The audio codec IC found on Qualcomm PM4125/PM2250 PMIC.
+  It has RX and TX Soundwire slave devices.
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,pm4125-codec
+
+  reg:
+    description:
+      Specifies the SPMI base address for the audio codec peripherals. The
+      address space contains reset register needed to power-on the codec.
+    maxItems: 1
+
+  reg-names:
+    maxItems: 1
+
+  vdd-io-supply:
+    description: A reference to the 1.8V I/O supply
+
+  vdd-cp-supply:
+    description: A reference to the charge pump I/O supply
+
+  vdd-mic-bias-supply:
+    description: A reference to the 3.3V mic bias supply
+
+  vdd-pa-vpos-supply:
+    description: A reference to the PA VPOS supply
+
+  qcom,tx-device:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: A reference to Soundwire tx device phandle
+
+  qcom,rx-device:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: A reference to Soundwire rx device phandle
+
+  qcom,micbias1-microvolt:
+    description: micbias1 voltage
+    minimum: 1800000
+    maximum: 2850000
+
+  qcom,micbias2-microvolt:
+    description: micbias2 voltage
+    minimum: 1800000
+    maximum: 2850000
+
+  qcom,micbias3-microvolt:
+    description: micbias3 voltage
+    minimum: 1800000
+    maximum: 2850000
+
+  qcom,mbhc-buttons-vthreshold-microvolt:
+    description:
+      Array of 8 Voltage threshold values corresponding to headset
+      button0 - button7
+    minItems: 8
+    maxItems: 8
+
+  '#sound-dai-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - vdd-io-supply
+  - vdd-cp-supply
+  - vdd-mic-bias-supply
+  - vdd-pa-vpos-supply
+  - qcom,tx-device
+  - qcom,rx-device
+  - qcom,micbias1-microvolt
+  - qcom,micbias2-microvolt
+  - qcom,micbias3-microvolt
+  - "#sound-dai-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/spmi/spmi.h>
+
+    spmi {
+        #address-cells = <2>;
+        #size-cells = <0>;
+
+        pmic@0 {
+            compatible = "qcom,pm8916", "qcom,spmi-pmic";
+            reg = <0x0 SPMI_USID>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            audio-codec@f000 {
+                compatible = "qcom,pm4125-codec";
+                reg = <0xf000>;
+                vdd-io-supply = <&pm4125_l15>;
+                vdd-cp-supply = <&pm4125_s4>;
+                vdd-pa-vpos-supply = <&pm4125_s4>;
+                vdd-mic-bias-supply = <&pm4125_l22>;
+                qcom,micbias1-microvolt = <1800000>;
+                qcom,micbias2-microvolt = <1800000>;
+                qcom,micbias3-microvolt = <1800000>;
+                qcom,rx-device = <&pm4125_rx>;
+                qcom,tx-device = <&pm4125_tx>;
+                #sound-dai-cells = <1>;
+            };
+        };
+    };
+
+    /* ... */
+
+    soundwire@a610000 {
+        reg = <0x0a610000 0x2000>;
+        #address-cells = <2>;
+        #size-cells = <0>;
+        pm4125_rx: audio-codec@0,4 {
+            compatible = "sdw20217010c00";
+            reg = <0 4>;
+            qcom,rx-port-mapping = <1 3>;
+        };
+    };
+
+    soundwire@a740000 {
+        reg = <0x0a740000 0x2000>;
+        #address-cells = <2>;
+        #size-cells = <0>;
+        pm4125_tx: audio-codec@0,3 {
+            compatible = "sdw20217010c00";
+            reg = <0 3>;
+            qcom,tx-port-mapping = <1 1>;
+        };
+    };
+...
diff --git a/Documentation/devicetree/bindings/sound/qcom,pm4125-sdw.yaml b/Documentation/devicetree/bindings/sound/qcom,pm4125-sdw.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..7241d2ab5dcf4a0d5f25a75acb33a335f93d3b5e
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,pm4125-sdw.yaml
@@ -0,0 +1,86 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/qcom,pm4125-sdw.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SoundWire Slave devices on PM4125/PM2250 PMIC audio codec.
+
+maintainers:
+  - Alexey Klimov <alexey.klimov@linaro.org>
+
+description: |
+  The audio codec IC found on Qualcomm PM4125/PM2250 PMICs.
+  It has RX and TX Soundwire slave devices. This bindings is for the
+  slave devices.
+
+properties:
+  compatible:
+    const: sdw20217010c00
+
+  reg:
+    maxItems: 1
+
+  qcom,tx-port-mapping:
+    description: |
+      Specifies static port mapping between device and host tx ports.
+      In the order of the device port index which are adc1_port, adc23_port,
+      dmic03_mbhc_port, dmic46_port.
+      Supports maximum 2 tx soundwire ports.
+
+      PM4125 TX Port 1 (ADC1,2 & DMIC0 & MBHC)    <=> SWR0 Port 1
+      PM4125 TX Port 2 (ADC1 & DMIC0,1,2 & MBHC)  <=> SWR0 Port 2
+
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 2
+    maxItems: 2
+    items:
+      enum: [1, 2, 3, 4]
+
+  qcom,rx-port-mapping:
+    description: |
+      Specifies static port mapping between device and host rx ports.
+      In the order of device port index which are hph_port, clsh_port,
+      comp_port, lo_port, dsd port.
+      Supports maximum 2 rx soundwire ports.
+
+      PM4125 RX Port 1 (HPH_L/R)       <==>    SWR1 Port 1 (HPH_L/R)
+      PM4125 RX Port 2 (COMP_L/R)      <==>    SWR1 Port 3 (COMP_L/R)
+
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 2
+    maxItems: 2
+    items:
+      enum: [1, 2, 3, 4, 5]
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    soundwire@a610000 {
+        reg = <0x0a610000 0x2000>;
+        #address-cells = <2>;
+        #size-cells = <0>;
+        pm4125_rx: codec@0,1 {
+            compatible = "sdw20217010c00";
+            reg = <0 1>;
+            qcom,rx-port-mapping = <1 3>;
+        };
+    };
+
+    soundwire@a740000 {
+        reg = <0x0a740000 0x2000>;
+        #address-cells = <2>;
+        #size-cells = <0>;
+        pm4125_tx: codec@0,1 {
+            compatible = "sdw20217010c00";
+            reg = <0 1>;
+            qcom,tx-port-mapping = <1 1>;
+        };
+    };
+
+...

-- 
2.47.2


