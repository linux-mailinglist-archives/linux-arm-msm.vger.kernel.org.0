Return-Path: <linux-arm-msm+bounces-3667-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4371B808567
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 11:28:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ED35C2840E9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 10:28:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBCB1374F3;
	Thu,  7 Dec 2023 10:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qBej4p0Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17F151AD
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Dec 2023 02:28:15 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3332e351670so697411f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Dec 2023 02:28:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701944893; x=1702549693; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qINiKytCFGh2MDywcjo0UyglJ8pj6SdN9F5fHmVcUK4=;
        b=qBej4p0Q1LfOB0BcMZnCGnp3uUX+1E2E10+aGGm0RqgioCAB00kEB51bjaJkDdHIK4
         Uy3cTP4pbqMXqY0BHF9weDY1PsjV87IeGwQSCs04dnA+QG8yd5Lzj8S+KJWpVLPm8S5t
         4eCvM6i5q8+b2rW/YcNckQPv3NzM1X5Z/RX8v9jCxVGQDG0k7vtPm4Yw68ri3Kw56PkY
         vMaWCdyqUKJpjmZNGfr2WSMOzpj4SchQ6MVUn4mn7cSINeOj5MZQ+pKh3HukBdZfy94h
         im2GFYOr9xWbr3ahOxRCMxjmep8qApQZ3J3by7cqcR888adlVeNWKr2nM7HkBtIyn9d3
         pPQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701944893; x=1702549693;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qINiKytCFGh2MDywcjo0UyglJ8pj6SdN9F5fHmVcUK4=;
        b=utG8z8Gx1FDdHv6YPJRMnN105H5j+p50kjJchUn+AZh/G+j7Krci9SwQK3qf3AE/Qy
         SbnmC4MTDWgfu2DlbEKOsH591Pif9zPpxIy6SAy+L8HItn4Wc7jI9z4V79oWUD+d6Olo
         ZvIEHYUjlMrhO3UbJ0X+A4aXQ4AsxdFaZrm2SWRvpw3gqEU41TOnX/FsBQ9tHt7uqgfq
         16FluIKu68CGyhWEQbyT5r6hQmwjXOepd4aJXiab5OQUUO59dlXVL0HJZZAMzK9dJ26U
         PfQR4oMXqCTMLWVC5uK/xu1sc1p/aoBR7pLQXi+2BDpJqG+U28DRWyyAM+RnLIHoDF57
         tHwQ==
X-Gm-Message-State: AOJu0YwiZg18Krj20K/KI7ci1oVC1VLDMDgjxDJ+GusrnQpBPmLvKTzG
	BbttmirDWmcyjtWjOpjLkxIQ9A==
X-Google-Smtp-Source: AGHT+IGz+LzfdB3Z+VkQMgb8bsIQE7a3RuyOesxZDuRGktf8lKKrisQ9Bl55npbb3XJ9pnsI7c5BtQ==
X-Received: by 2002:a05:6000:11cf:b0:333:317a:2cb1 with SMTP id i15-20020a05600011cf00b00333317a2cb1mr671338wrx.89.1701944893476;
        Thu, 07 Dec 2023 02:28:13 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id d2-20020adfe2c2000000b003333d2c6420sm1073412wrj.74.2023.12.07.02.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 02:28:12 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 07 Dec 2023 11:28:04 +0100
Subject: [PATCH v3 1/5] ASoC: dt-bindings: qcom,wcd938x: move out common
 properties
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231207-topic-sm8650-upstream-wcd939x-codec-v3-1-6df9585ec7c8@linaro.org>
References: <20231207-topic-sm8650-upstream-wcd939x-codec-v3-0-6df9585ec7c8@linaro.org>
In-Reply-To: <20231207-topic-sm8650-upstream-wcd939x-codec-v3-0-6df9585ec7c8@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org, 
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6302;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=Uglg24nZY1C7ElRVJ4NCgzh7HTGQqFA6AMsN4Ezv9Kk=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlcZ44cc+gFIPS+YSKaHuBtw4NkbwCy2QOu+LAQfs4
 hne3AhGJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZXGeOAAKCRB33NvayMhJ0QL/D/
 9LjMC0+hMP1Ej6zoI5Xftab2FP+febi82BcVwA3trkkZ5lpaDGWU5RHa3tHbLG4PKQbJZ1WoUUfP+W
 e5zlrWztCKtHZiXQWlWBcjzMRL6zU4EduqWIoUklNnDO6GhuJHDyvhShOMOyD3Osja3Cd2TbObfq3p
 dtZAmaUipGiSG1EerjMv7zPlX6kO7P787SXFvk0Dofwk8Zf6h9S13cV6kpHgtEa+CsPI5rq3vGXeAH
 s9rv3GjxSUb4UQbt+mIrC6wuAHWRlDqvPnTKmlCZui+d0pzLFBHHle+GpDCzPyU+afIWK9RE5GanJp
 J2ZkroXR3FS/vKJEk10rz+QzWLuxIUPl1H2CwOpObbZMEmLIXM1gW8AwADlTreiBWQ+HCoEee9vaFS
 wLHuLfoXjUyMd3OzBlrJ3d8AvCCji/il0iRC3CfVD6UdDnITq3Q4Nmi+gzDT5kcQzo4zJKDo37taaq
 etBS8KsO1PKdExDaO5ilBVtV6T80wuZYacYIh3MXzRlS7+ISkkLw2Zt2ZmUQgaIXpX0UKfiZK1o2fR
 AQrp6JuJ0ekkqvSaFwUpqAruGQIMGKRwfj8WZYtspH3QIGZdWm9FjkDqE0elGqvhGoZFX/zeydLqW2
 soUS8goY/VgY7shdp5QZIKVig4Iu1zXcNGBYYbWJBT3vAkswRoXXQ+9jBI0Q==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Move out common properties from qcom,wcd938x bindings in preparation
of adding Qualcomm WCD939x bindings sharing most of the properties.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../devicetree/bindings/sound/qcom,wcd938x.yaml    | 81 +-----------------
 .../bindings/sound/qcom,wcd93xx-common.yaml        | 95 ++++++++++++++++++++++
 2 files changed, 96 insertions(+), 80 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml
index 018565793a3e..de333d07d469 100644
--- a/Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml
@@ -15,6 +15,7 @@ description: |
 
 allOf:
   - $ref: dai-common.yaml#
+  - $ref: qcom,wcd93xx-common.yaml#
 
 properties:
   compatible:
@@ -22,92 +23,12 @@ properties:
       - qcom,wcd9380-codec
       - qcom,wcd9385-codec
 
-  reset-gpios:
-    description: GPIO spec for reset line to use
-    maxItems: 1
-
   us-euro-gpios:
     description: GPIO spec for swapping gnd and mic segments
     maxItems: 1
 
-  vdd-buck-supply:
-    description: A reference to the 1.8V buck supply
-
-  vdd-rxtx-supply:
-    description: A reference to the 1.8V rx supply
-
-  vdd-io-supply:
-    description: A reference to the 1.8V I/O supply
-
-  vdd-mic-bias-supply:
-    description: A reference to the 3.8V mic bias supply
-
-  qcom,tx-device:
-    $ref: /schemas/types.yaml#/definitions/phandle-array
-    description: A reference to Soundwire tx device phandle
-
-  qcom,rx-device:
-    $ref: /schemas/types.yaml#/definitions/phandle-array
-    description: A reference to Soundwire rx device phandle
-
-  qcom,micbias1-microvolt:
-    description: micbias1 voltage
-    minimum: 1800000
-    maximum: 2850000
-
-  qcom,micbias2-microvolt:
-    description: micbias2 voltage
-    minimum: 1800000
-    maximum: 2850000
-
-  qcom,micbias3-microvolt:
-    description: micbias3 voltage
-    minimum: 1800000
-    maximum: 2850000
-
-  qcom,micbias4-microvolt:
-    description: micbias4 voltage
-    minimum: 1800000
-    maximum: 2850000
-
-  qcom,hphl-jack-type-normally-closed:
-    description: Indicates that HPHL jack switch type is normally closed
-    type: boolean
-
-  qcom,ground-jack-type-normally-closed:
-    description: Indicates that Headset Ground switch type is normally closed
-    type: boolean
-
-  qcom,mbhc-headset-vthreshold-microvolt:
-    description: Voltage threshold value for headset detection
-    minimum: 0
-    maximum: 2850000
-
-  qcom,mbhc-headphone-vthreshold-microvolt:
-    description: Voltage threshold value for headphone detection
-    minimum: 0
-    maximum: 2850000
-
-  qcom,mbhc-buttons-vthreshold-microvolt:
-    description:
-      Array of 8 Voltage threshold values corresponding to headset
-      button0 - button7
-    minItems: 8
-    maxItems: 8
-
-  '#sound-dai-cells':
-    const: 1
-
 required:
   - compatible
-  - reset-gpios
-  - qcom,tx-device
-  - qcom,rx-device
-  - qcom,micbias1-microvolt
-  - qcom,micbias2-microvolt
-  - qcom,micbias3-microvolt
-  - qcom,micbias4-microvolt
-  - "#sound-dai-cells"
 
 unevaluatedProperties: false
 
diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd93xx-common.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd93xx-common.yaml
new file mode 100644
index 000000000000..f78ba148ad25
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,wcd93xx-common.yaml
@@ -0,0 +1,95 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/qcom,wcd93xx-common.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Common properties for Qualcomm WCD93xx Audio Codec
+
+maintainers:
+  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
+
+properties:
+  reset-gpios:
+    description: GPIO spec for reset line to use
+    maxItems: 1
+
+  vdd-buck-supply:
+    description: A reference to the 1.8V buck supply
+
+  vdd-rxtx-supply:
+    description: A reference to the 1.8V rx supply
+
+  vdd-io-supply:
+    description: A reference to the 1.8V I/O supply
+
+  vdd-mic-bias-supply:
+    description: A reference to the 3.8V mic bias supply
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
+  qcom,micbias4-microvolt:
+    description: micbias4 voltage
+    minimum: 1800000
+    maximum: 2850000
+
+  qcom,hphl-jack-type-normally-closed:
+    description: Indicates that HPHL jack switch type is normally closed
+    type: boolean
+
+  qcom,ground-jack-type-normally-closed:
+    description: Indicates that Headset Ground switch type is normally closed
+    type: boolean
+
+  qcom,mbhc-headset-vthreshold-microvolt:
+    description: Voltage threshold value for headset detection
+    minimum: 0
+    maximum: 2850000
+
+  qcom,mbhc-headphone-vthreshold-microvolt:
+    description: Voltage threshold value for headphone detection
+    minimum: 0
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
+  - reset-gpios
+  - qcom,tx-device
+  - qcom,rx-device
+  - qcom,micbias1-microvolt
+  - qcom,micbias2-microvolt
+  - qcom,micbias3-microvolt
+  - qcom,micbias4-microvolt
+  - "#sound-dai-cells"
+
+additionalProperties: true

-- 
2.34.1


