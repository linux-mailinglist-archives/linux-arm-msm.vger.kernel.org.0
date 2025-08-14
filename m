Return-Path: <linux-arm-msm+bounces-69087-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D55B25818
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 02:15:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BAA84623C8A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 00:15:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAA4E1BC2A;
	Thu, 14 Aug 2025 00:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WoGlq2LN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB15747F
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 00:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755130506; cv=none; b=JGPMm35jc7tViX3N/4xNTDMxc9IVvYg9ZrCyoMsVnX9f+oIT6tmpc4B2BeryddXruLMe05jMZGnRjHMm/bN3QPs5be0nwTJV8ui4z3RxqJ1INx0f1I3iNVMJh2o/zw7gwuB5ctV0lJu9riqAhTfYIqS4jvJ4pB3CYyjRWDUwROs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755130506; c=relaxed/simple;
	bh=8b57RSND6zLGcJ2xdoPxrrIGPdOukx3jz3vznV2UfaQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=inOCV2OdvnxUxoRTw1vXdsKuZ/63o7b5IzCuspnDEK1hLy61Icyk+FJ39VF+O4VmYEsuyRN76w4bDEcqk+5gbJokm3QRIFvgoWlDRERGNOiqCxQHdLd4jlp6uLJaqd7hKAiBJDS1CWnnJV9WZS0uxbyGtpodUAS8PjVnwdcd98c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WoGlq2LN; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45a1b0d231eso1695595e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 17:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755130503; x=1755735303; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=94oemMdf8kRPRCbucse05hwVcBk5HVDz51Q84sY6sJE=;
        b=WoGlq2LNcUxoisn9STfohTyBink6EpB7nRd5vU6nJDp0ZZ7u1VSMWcjBg/h9EAFm+l
         Zgrnltk0tTEh7bJMun8/XLKi801ZIhacaWuWV2ZtuShT0J+kAxKAjbPJ/dJtC5wW1CJy
         b4aCG9TQxfOctb5ChQqqxE6Kp1+EZS6db9qjAyS+hMDHwSYofhnT3Iu/a5IGmi4o4XP7
         ClDEATK5tRa8G3F5uONhNA/6SSnx9TtyhQMe/2C3Swl+vlQkPi5Ol3EDL7ZaZhkcSU0m
         W6LMeAiOjTORfYZJ+bp4HFK5QOKzjgSzFAs6l3A4TYH1RagY97TfAaXZVlhmka/O8HVU
         IwTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755130503; x=1755735303;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=94oemMdf8kRPRCbucse05hwVcBk5HVDz51Q84sY6sJE=;
        b=wCz3PBkIi589RPQVSr4SE4VvvfcGtfdn3hixidaJYFbA/Lso2cKTleIOJdnEt792vk
         sb4mdVSowNZUQMEGiwHJNQO7ezph2l3DZOh3O2Bx+7rvajAIFyCcge2P6/V7V7baG4Oz
         IbCcwECYCh5yJams03Z4JBNbS9WYbOvR+8ulTZYzargY7jtZO/kjIlRBIqG3dmhLTQby
         WJdEFSaWskHtYcFkp4tSrfmYUIZvbAtyu/DtxNuVkZFbAB5bR/UBOSSFbr23wyRlkz7x
         jay2mJnC4Wk5lxTm8d/Qm120araikCW15CGfoX1gPlVe+2mhql+EUmQbeXSYWdngq/KV
         qNrg==
X-Forwarded-Encrypted: i=1; AJvYcCXG73Dfh1z+MnSTgvnatey9ZVn9yWGuNC1DoJxuOsXbqrCz9g8/1Xjoj/DIHt8f2VOYCK40Nro8dqUFqchG@vger.kernel.org
X-Gm-Message-State: AOJu0YxgH9cnGxBwQejpDClLjwvaJxOrrUXtv8kPEHHzgCtpGZVdIGJt
	GxEGKGZu2ebaI3NGIczuSign+si/kZk8zNdh/XEc+3iYzVT/wdfub8ldIeVKH/c3qPU=
X-Gm-Gg: ASbGncshWW6jYUI/b9ENaU/8/2z447UkOUAtoxbPVwas9cGHFXL0RX3aBytuFjDVJPf
	gBR5O/JCSC1T2bfberPBfbn4I3agu3+HWODD5tbFQPt8yfdk9RaHpXVs4+Mei32WEbyngHrwAy8
	n/euvCc1It3fx1tvvwi25U/Bl8CO8lpH4XcbpK5YCdi7r/19/e7Kvsx7L7CobxDr4TNbg0e3RFI
	G8vCpT4iJQ1yWASSJyGeUDk2pc70FeGz3wwbkWZh2H7TyYz6xBX7+v6TG5QMVSnzGJQcj6qO6qS
	UwwFCgQUFGhzrz0So5AJ+C4cDmUwxL7ygRv+1tEkTvTa4jOS0wGlJMTUxBoEFCBVbPL6N2h7lxJ
	axmkpp2WJcdfVd2mxH+vPnijTTFeg
X-Google-Smtp-Source: AGHT+IEyju8MtQdpkKfvUujMX9S0qd/VeQDV2Y6JMwKekGC5z/zKQOMq+8ujQFLyCxemmWg7v4FG0w==
X-Received: by 2002:a05:600c:4f49:b0:459:d5d1:d602 with SMTP id 5b1f17b1804b1-45a1b614215mr5655265e9.3.1755130502819;
        Wed, 13 Aug 2025 17:15:02 -0700 (PDT)
Received: from orion.home ([2a02:c7c:7259:a00:7f3a:5ab2:26aa:831f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1a540e1esm18449065e9.28.2025.08.13.17.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 17:15:02 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Thu, 14 Aug 2025 01:14:47 +0100
Subject: [PATCH v3 1/3] dt-bindings: sound: add bindings for pm4125 audio
 codec
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250814-pm4125_audio_codec_v1-v3-1-31a6ea0b368b@linaro.org>
References: <20250814-pm4125_audio_codec_v1-v3-0-31a6ea0b368b@linaro.org>
In-Reply-To: <20250814-pm4125_audio_codec_v1-v3-0-31a6ea0b368b@linaro.org>
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
 christophe.jaillet@wanadoo.fr, Alexey Klimov <alexey.klimov@linaro.org>
X-Mailer: b4 0.14.2

The audio codec IC is found on Qualcomm PM4125/PM2250 PMIC.
It has TX and RX soundwire slave devices hence two files are added.

While at this, also add qcom,pm4125-codec compatible to pattern properties
in mfd qcom,spmi-pmic schema so the devicetree for this audio block of
PMIC can be validated properly.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml    |   7 +-
 .../bindings/sound/qcom,pm4125-codec.yaml          | 134 +++++++++++++++++++++
 .../devicetree/bindings/sound/qcom,pm4125-sdw.yaml |  79 ++++++++++++
 3 files changed, 219 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index 078a6886f8b1e9ceb2187e988ce7c9514ff6dc2c..068f495645f6e849bd98b226c958ad67ba521dd5 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -137,7 +137,12 @@ patternProperties:
 
   "^audio-codec@[0-9a-f]+$":
     type: object
-    $ref: /schemas/sound/qcom,pm8916-wcd-analog-codec.yaml#
+    oneOf:
+      - $ref: /schemas/sound/qcom,pm8916-wcd-analog-codec.yaml#
+      - properties:
+          compatible:
+            contains:
+              const: qcom,pm4125-codec
 
   "^battery@[0-9a-f]+$":
     type: object
diff --git a/Documentation/devicetree/bindings/sound/qcom,pm4125-codec.yaml b/Documentation/devicetree/bindings/sound/qcom,pm4125-codec.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..6e2f103be1d32479ebe3420e06d1ebedaf3bc379
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,pm4125-codec.yaml
@@ -0,0 +1,134 @@
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
+  - '#sound-dai-cells'
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/spmi/spmi.h>
+
+    spmi {
+        #address-cells = <2>;
+        #size-cells = <0>;
+
+        pmic {
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
+...
diff --git a/Documentation/devicetree/bindings/sound/qcom,pm4125-sdw.yaml b/Documentation/devicetree/bindings/sound/qcom,pm4125-sdw.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..23624f32ac305838da7b472ef25995197d42f2b6
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,pm4125-sdw.yaml
@@ -0,0 +1,79 @@
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
+description:
+  The audio codec IC found on Qualcomm PM4125/PM2250 PMICs.
+  It has RX and TX Soundwire slave devices.
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
+oneOf:
+  - required:
+      - qcom,tx-port-mapping
+  - required:
+      - qcom,rx-port-mapping
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
+...

-- 
2.47.2


