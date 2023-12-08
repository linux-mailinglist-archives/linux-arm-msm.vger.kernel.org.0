Return-Path: <linux-arm-msm+bounces-4005-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD9A80A757
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 16:27:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8040328161F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 15:27:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3345F31586;
	Fri,  8 Dec 2023 15:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CDr8YVEl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF36E173F
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Dec 2023 07:27:29 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3333fbbeab9so2114253f8f.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Dec 2023 07:27:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702049248; x=1702654048; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lae7tAHX6/QMIJNLKkHLi6lOoTOCFprqhIkEQtSNmcg=;
        b=CDr8YVElTM9HJoal7LszHuEhLN06c6V5XelUZupRV0ujfHdLJvb5/deSNNtRImkPw1
         wDSQRjPFEUkv5uXkUo8c8TFndqyojCqKauymyPKHxwKkWLzg4buBMYXlQNBRLzNgy7Jp
         vZAxKw2v0/Ba77i39gWhbeJ+NDTIGwImuaXoeTDUO9KL8PPFiEhTRh1A7gF0c5wx9K3l
         XDH8jj6ifqhxCi/NfMjztGlKvmix/fhG6UrEkexHUYyHSp9Lk1gNX1y6ksOJ+DyZwvLf
         Sk7A2nZlzOKLoQD6mc/cCMUU/QzRU59kq38f9nqfZQx8i+WUqiwLHoUlOV+BgMw8djPx
         OtgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702049248; x=1702654048;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lae7tAHX6/QMIJNLKkHLi6lOoTOCFprqhIkEQtSNmcg=;
        b=CLyBFPIhGRDEjNOQ91vosfqT1+pQ+HQXSPxqkIyse3sfm8bqASPizVYQVUoWAyZYcT
         w/4asQS3NuEl9iOHc7oxGJ4loDdjIqWmGREybmZD+onotirSFyHNxCK3BkGFzlrqsn35
         enHAb/EXP+PsFWfkfjR1YZ6fKtWhPxN6rsM8ub7DyZXY8g/THYSdJs88bgnLnpnS9baT
         UWB1UghpswYDK2/SEuuCOtzU7jkHbwjL5NenGrhi7TVrSqqTS88MxP7VjuMB/dzWPqN9
         PMhvbW3HrTlndVMk3fLqZgVRnulLFVS08LJQf6vdMPKySoPcYohhglPH6qxSirol6Z5T
         kW7g==
X-Gm-Message-State: AOJu0YyG8G6yPK66DESOY2traXpL+QJloIQxxDtz8mClM4wjLT9FhxaC
	Id+1UHZab+y/vXUlfgKUoN97lw==
X-Google-Smtp-Source: AGHT+IG20pqYeC+4VhsC30YKgSi1OfzMVdjvl8NhYAtCdv/mRvYtrSE0poUTnko9tqwWT6rRCmn7pg==
X-Received: by 2002:a7b:c7cb:0:b0:40c:24d8:fecd with SMTP id z11-20020a7bc7cb000000b0040c24d8fecdmr91658wmk.40.1702049248128;
        Fri, 08 Dec 2023 07:27:28 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id k40-20020a05600c1ca800b0040b45356b72sm5443533wms.33.2023.12.08.07.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 07:27:27 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 08 Dec 2023 16:27:23 +0100
Subject: [PATCH 1/2] dt-bindings: usb: Document WCD939x USB SubSystem
 Altmode/Analog Audio Switch
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231208-topic-sm8650-upstream-wcd939x-usbss-v1-1-91d1ba680fe0@linaro.org>
References: <20231208-topic-sm8650-upstream-wcd939x-usbss-v1-0-91d1ba680fe0@linaro.org>
In-Reply-To: <20231208-topic-sm8650-upstream-wcd939x-usbss-v1-0-91d1ba680fe0@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3857;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=1Kw0TVGBBDfkGiiqClifUYRPTKqs6txBzg+oFiE1028=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlczXcicE2fqq08G9CJR2r+oTJofFr33IrKkpmP8Ev
 CoNDDlWJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZXM13AAKCRB33NvayMhJ0fQmEA
 C4bhhL1Z6w+Refx41+Y95IWDdXwnrGut1WyosVedXXDyV034a684LtDdRkTEDQKrqJXs8AAPAcbpD5
 +JqW/8EZXsmAtvORuszSAvwYtG2Bo+zx//PxWw84pUu9OGuZIZgX5xnrcv1MdBpz4pkKCuQLxPxuOV
 SfJzSyE+IxVLaFb61LAzq6O3B0R0LnG90ymXwmsLSTg3wqQrovqLJdXdhrP6153PRIXMgbgxxlpMWc
 OPeRyn/Qh0vJoaiLjr8pxeOu+553PCcDCSJkLG741zXN7J4gFxsxp3u+WNBI7BIzk6nHgmunmvRZus
 CsZwBJPqZFbWItwncvUqRpuMOdUM3uR2AfHYEznlvl8WsUbWXSCCQzwjRA1nZcKkhEtgUnrDOB3JGU
 uZcNDI+46X+Ue8rSxh0IR/d97mKKidzjrHHMbli5bRQqVYnYia+68HCdHXuIcQW+WWR0MBTJUiii6w
 +3R3yhiWt2h57ApHyxhCdhbdtWaF+0G8QSUzSB9TjJnS+0+TlcPghRpsrTIKKNUbj4IoUXKGtWufx6
 IRfbsHDYauiRMWor7dSDywYNKCFR/RGLgClEVUyAsuDfyY+qR8/Pn0+cQ9+INPiuEmmr1Vj11hOIuJ
 Kpjr7FhjXCoIjIOFGyskRrGUErQpprRg3pMEIxQcIC7VuDbuTHT6Xp5KhtBg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Document the Qualcomm WCD9390/WCD9395 USB SubSystem Altmode/Analog Audio Switch
which is a separate USB SubSystem for Altmode/Analog Audio Switch accessible
over an I2C interface.

Since Audio Headphone and Microphone data path between the Codec and the USB-C Mux
subsystems are external to the IC, it requires a second port to handle USB-C altmode
& orientation switching for Audio Accessory Mode to the Codec SubSystem.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../bindings/usb/qcom,wcd939x-usbss.yaml           | 99 ++++++++++++++++++++++
 1 file changed, 99 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,wcd939x-usbss.yaml b/Documentation/devicetree/bindings/usb/qcom,wcd939x-usbss.yaml
new file mode 100644
index 000000000000..da86b1d119d4
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/qcom,wcd939x-usbss.yaml
@@ -0,0 +1,99 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/qcom,wcd939x-usbss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm WCD9380/WCD9385 USB SubSystem Altmode/Analog Audio Switch
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+
+description: |
+  Qualcomm WCD9390/WCD9395 is a standalone Hi-Fi audio codec IC with a functionally
+  separate USB SubSystem for Altmode/Analog Audio Switch accessible over an I2C interface.
+  The Audio Headphone and Microphone data path between the Codec and the USB-C Mux
+  subsystems are external to the IC, thus requiring DT port-endpoint graph description
+  to handle USB-C altmode & orientation switching for Audio Accessory Mode.
+
+properties:
+  compatible:
+    oneOf:
+      - const: qcom,wcd9390-usbss
+      - items:
+          - const: qcom,wcd9395-usbss
+          - const: qcom,wcd9390-usbss
+
+  reg:
+    maxItems: 1
+
+  reset-gpios: true
+
+  vdd-supply:
+    description: USBSS VDD power supply
+
+  mode-switch:
+    description: Flag the port as possible handle of altmode switching
+    type: boolean
+
+  orientation-switch:
+    description: Flag the port as possible handler of orientation switching
+    type: boolean
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          A port node to link the WCD939x USB SubSystem to a TypeC controller for the
+          purpose of handling altmode muxing and orientation switching.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          A port node to link the WCD939x USB SubSystem to the Codec SubSystem for the
+          purpose of handling USB-C Audio Accessory Mode muxing and orientation switching.
+
+required:
+  - compatible
+  - reg
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        typec-mux@42 {
+            compatible = "qcom,wcd9390-usbss";
+            reg = <0x42>;
+
+            vdd-supply = <&vreg_bob>;
+
+            mode-switch;
+            orientation-switch;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    wcd9390_usbss_sbu: endpoint {
+                        remote-endpoint = <&typec_sbu>;
+                    };
+                };
+                port@1 {
+                    reg = <1>;
+                    wcd9390_usbss_codec: endpoint {
+                        remote-endpoint = <&wcd9390_codec_usbss>;
+                    };
+                };
+            };
+        };
+    };
+...

-- 
2.34.1


