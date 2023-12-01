Return-Path: <linux-arm-msm+bounces-2895-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE71800E08
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 16:09:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7566B281CD7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 15:09:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E614482DB;
	Fri,  1 Dec 2023 15:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XcV0XUQp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C75F10DE
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Dec 2023 07:09:02 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-50bc8e37b5fso3194208e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Dec 2023 07:09:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701443341; x=1702048141; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qINiKytCFGh2MDywcjo0UyglJ8pj6SdN9F5fHmVcUK4=;
        b=XcV0XUQpZWsKaHDI4uH2dKIKyfp0hX6Qw6eb5P3f+c6qcD4br53oCdxSipIutoxCHP
         R2BSTKT29reN49gulp6h7oSkFL8vQDGNOMHGyjcigOaZ5LiD5GyDJZ7iHVZsYo48I7kl
         8b06VUNkSNdu44mBHVTV4rP98agZDXcDjLxulFrTaJivvDxnoPuNfgaoXPnTjGeSCJz5
         LWFn6hqMTodU478PjSaWlHF86Xb5SIHyQ1nzAGMn36USGB6KFgh1nru8AArROVq021Dk
         Jf921Wjt0vayOi4EJ6HBfpFH48nbKyAVJEg0JkgQX9KeK9qTH2Y2BeacBMYzEubZa//V
         IkZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701443341; x=1702048141;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qINiKytCFGh2MDywcjo0UyglJ8pj6SdN9F5fHmVcUK4=;
        b=O89mNTtyTZR4j32W3fWu0kMF6nbSJaCe8vFDcUi9SiFoyNb+4qgXPZJdQ4vxzQzzip
         P5K4vjwpUTzPE6BO0GXyiRShcFycgi+zjdQVf/R7iM/q9MEhNIyBo6+QZpZaw2DERExj
         PdUTeeF9R2/HtLIhWV5GSqTyomRQ2bVucU5amZgfT8iFadnXkLEveL6jjmY5b2COVX3r
         uQAnBrMhMa5FuBoEFzS469k8xVOa7brChNzfET9l+KE2I6YpAKZz/APXZwDZ7wC3o6Et
         TGLoCCcyVDsRGVRcJt0COWBwkub86PO5Q2jsRAfXoaQolI6jrRv3foXLlMfw5XoB5PTZ
         weSA==
X-Gm-Message-State: AOJu0YxE975zt52wb2HQ0QjlwQmoq1ApLoPCN/5LGqDHAYs21f4RzJCx
	KGJib75KCP2UjcopvbCph23y4A==
X-Google-Smtp-Source: AGHT+IGHOPx3B0lJnuEJxE+A1iPYVcIo65FUUu5Hufal2K09q0kYkzSqSA9rbKAvK2xS1blzox1Y8A==
X-Received: by 2002:a05:6512:1246:b0:50b:d174:56cc with SMTP id fb6-20020a056512124600b0050bd17456ccmr1219711lfb.21.1701443340699;
        Fri, 01 Dec 2023 07:09:00 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id fs20-20020a05600c3f9400b0040b5517ae31sm8569539wmb.6.2023.12.01.07.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 07:09:00 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 01 Dec 2023 16:08:54 +0100
Subject: [PATCH v2 1/5] ASoC: dt-bindings: qcom,wcd938x: move out common
 properties
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231201-topic-sm8650-upstream-wcd939x-codec-v2-1-94ed814b25aa@linaro.org>
References: <20231201-topic-sm8650-upstream-wcd939x-codec-v2-0-94ed814b25aa@linaro.org>
In-Reply-To: <20231201-topic-sm8650-upstream-wcd939x-codec-v2-0-94ed814b25aa@linaro.org>
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
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlafcI4Ga7OWPE8BXAb9PIogtXejM+uW+T/MI/2m1o
 FGTYhZeJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZWn3CAAKCRB33NvayMhJ0VGGD/
 0c7jnn7TDI6xr5iGFu7eIbI7AMIL8aH0+Z/0raMGJ6OFUQl7hhYQ7t1woKKo+F9ljKMVOaF3ZObEqB
 j8RZPBObxZF+iTb982sixL4tz7NHkjIO+4ScYxLLTAJKpa3+WQh5E+GDfjuvjpvAzPhpgwnXMfEApm
 KI/9F1vQDmE8/e5wP8XAqh/rGjwkaU1GAnX9Fogbtgliwb+9/oG60W9cLLjXJvbF1KruymiPl9+205
 aolB3tAXvCf84Kt/E5nimEa80UzrgDS7irOonN12iFip75liCPcRPmMqAOoCuuvKPoxKfRlZZwi8uf
 6x7uPyV9ozDnJRlFcftx+fCNnCZ1Ufiv8+kPZzdMthiAnTz9fwrGQkWsnj1g38Y/M+b0gfneT6LMIv
 WitZZLi4141bwbqzcNZGI/QNOEmii0vxrxs+XlZxRFSffGhl4qik9hCJ1WVOBlrUI74Q4d35MVkdJK
 tJzvZTc0qNUq07C7n98I0fsouztQ4Du0oFiBhSIVNgROSi4HqQC9V58FX3Eviocfk+J4DEu1HRfgrs
 l6RYwE3QCzZ6gIOY9qhKcHiz+F/BW/X/J2aHEtWErapmRzWP6CBW9+tuootL4ISDCL9r+jtaLjqpQ8
 pNUqGRpXVDB2L3ml+B/yJAg+k/9PZIwrKOGZSSAp0cXU5ugFIXdHkv82d0pA==
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


