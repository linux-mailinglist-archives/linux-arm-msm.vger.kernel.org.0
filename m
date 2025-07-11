Return-Path: <linux-arm-msm+bounces-64484-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E127B0116F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 05:00:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3E8C2567A43
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 03:00:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C283F199949;
	Fri, 11 Jul 2025 03:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ClMo5xNN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB301442E8
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 03:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752202819; cv=none; b=kDmH7MEE/xy4GSvPBHieHQykTQTNyVE3NqC4SvKrwdkip6Cat8S3jC4cV/6TEpzcA3gBOqUD0GHL4TSfFA3TkUPD5MK8NNmsdrxjwxOO3jdXPvg9yhWy+gs2XPCh4ileIqghXLJOhHliw4Ex3Itry2DnuZO6iarogut57GeyStk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752202819; c=relaxed/simple;
	bh=G4NYxUKRZfXH7902qx/49HSjFpRVXfsPxo0LQVrbO2I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nCEwumavYJsZ4GYdZtU8PdoRq46xsAMOX20oG5o2D/7hPN94gmU3RRXiknsxvVlVwwnG/gcBCtBJj9DHsMIcD8eSisg2nu+c4FNjUW8uYFewJhtMI4Yin2BumClkw05UEA4/LyNGvUjwy3A2+CWAZ6I94Bxivry0C5q3rAi0kq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ClMo5xNN; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-451e2f0d9c2so14394205e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 20:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752202816; x=1752807616; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SuUx/cSiIpkOf+Y2nSY0Y7cfJ5ep+sgyhm/gSQYHFfc=;
        b=ClMo5xNNBO3oM8AfEGHep74vi99hx88tq86R/vujuqQwumiRAB5DRRqYQqncjHuDD5
         A+dwRrA5oOF1Y9GivGFzBlp+98b60zn6c6Ea6WrNI7ax+krttHdq0P8U9nWtkxrhgyTf
         HhGkk61VPVLqdShodZIHti9Rb8OjvsK2xA/Wjf8Isy8NZl4zuo1jvgcpZCsCTGmgxjFQ
         399D/CPEy9vv9e4ejwsc6nSsXXvtdPk1w3Fezm11jqey3HX48Yr4E0mkm/mB+ybvSj9r
         13w9I8Cd/fULGbelIyxEA0PBU92xlz33d0t4ESJpmGugw9LAZdYBLgIdUhOTtljrSFKU
         e81Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752202816; x=1752807616;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SuUx/cSiIpkOf+Y2nSY0Y7cfJ5ep+sgyhm/gSQYHFfc=;
        b=mpSu1kBKMiCEbRsOa/GcbNuhLYnKbVJ9VeOBsYblEz3VZoQcDt+pq4XMx4Bus4u5I+
         V7CdjY9LM2M8nVr5eAGKvRgLMOuZOUThkKfnLbTI6kPFgUreoc6x37f1ilma7SHvC1fD
         bH6cmln/7RA4FwZ0SSGUjnEKsrfEbo5jKoihNljSD2ysTTuL6TZdnDuwqNhfU5EtAub2
         JD+qEW0izVtW6igrbJiZZ78xaOEoThIunS30LIM4yLAj0/DPZjOoYcjK5HE4MZ5jic7v
         mtQf9z+KUPfzvLGkkvSPBolMtE4qKZm1FF8f0sjfZ0kTVXqYWr+XjyOYntu+WEuhwrt5
         e+PA==
X-Forwarded-Encrypted: i=1; AJvYcCUdOfJcT6B6edbzwSkc/WaHYJmKvoepuTfVapjrHUKz163ElEVzsDEmx8X6giXF9sDwhoTL2FrCE0E8hmHU@vger.kernel.org
X-Gm-Message-State: AOJu0YxiiBhYIy8N+kA2ky7zGogFZ0VAwgMQ8ZRfPW7xzjV0uwKqhyeO
	C1q1kzAtme2NtD7oRbOzqwa8dtLTjQ9m4IHhwQgkkaeYMG3dHs0eza/RUXsEkBmfSAE=
X-Gm-Gg: ASbGncs7ONoc1Y7gNWdmNkUOoLvW8szhqmQYoM4mTzC0kEjxAAYqv6sM4JOidy9Kmin
	I11EHr3YWNFa+tW4/zdOHZbo0bWaAIMtnwz6rCftpZq7JCWu0RIqp/HWMn1lEdlQ4176XUwFkZw
	i2wVKssX3DCa0ZPx0ceg0NUoPA+wH8dXFR5NeDFbvb5MdtMyhzzQjvt3O5b8Supw49A0dryDVuK
	vjMwIC0omnC1hWQxuu16w2hMPVSpnd+DhwqdpkEG/E3nBQ69hXOuZ5at6sFvsxXJp1Cr2sJvgou
	ndo3zwwFdYeDEMj1hDTrz/K5mWitjF7bFGuLnzyBoVxYUmL0fv2k4/0pMZOl+qLhXHd1KyM3Hfp
	k+JRTbBVMpne1cOm0MPkMlkLdznFYWgB12XuRV7Td
X-Google-Smtp-Source: AGHT+IFUWlnzU4aT/S192JcS8SDGM44q1bKbSAbCykxqFvgL9Wgx2Lrs1mnsclMIHB0LtiXbSWC1QA==
X-Received: by 2002:a05:600c:4746:b0:453:7713:476c with SMTP id 5b1f17b1804b1-455bd8e63aemr2195755e9.2.1752202815691;
        Thu, 10 Jul 2025 20:00:15 -0700 (PDT)
Received: from orion.home ([2a02:c7c:7213:c700:e4ad:f2d9:9dd9:cbf2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454d50fa9b4sm75424355e9.27.2025.07.10.20.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 20:00:15 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Fri, 11 Jul 2025 04:00:10 +0100
Subject: [PATCH v2 1/3] dt-bindings: sound: add bindings for pm4125 audio
 codec
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250711-pm4125_audio_codec_v1-v2-1-13e6f835677a@linaro.org>
References: <20250711-pm4125_audio_codec_v1-v2-0-13e6f835677a@linaro.org>
In-Reply-To: <20250711-pm4125_audio_codec_v1-v2-0-13e6f835677a@linaro.org>
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
It has TX and RX soundwire slave devices hence two files are added.

While at this, also add pattern for respecive node in mfd
qcom,spmi-pmic schema so the devicetree for this audio block of
PMIC can be validated properly.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml    |   4 +-
 .../bindings/sound/qcom,pm4125-codec.yaml          | 134 +++++++++++++++++++++
 .../devicetree/bindings/sound/qcom,pm4125-sdw.yaml |  79 ++++++++++++
 3 files changed, 216 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index 078a6886f8b1e9ceb2187e988ce7c9514ff6dc2c..5718cfe7f4c2b696ee2700fafe8dc071c70a6476 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -137,7 +137,9 @@ patternProperties:
 
   "^audio-codec@[0-9a-f]+$":
     type: object
-    $ref: /schemas/sound/qcom,pm8916-wcd-analog-codec.yaml#
+    oneOf:
+      - $ref: /schemas/sound/qcom,pm8916-wcd-analog-codec.yaml#
+      - $ref: /schemas/sound/qcom,pm4125-codec.yaml#
 
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


