Return-Path: <linux-arm-msm+bounces-79348-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97AB7C18C41
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 08:48:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 86FA4423063
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 07:45:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4938D30F803;
	Wed, 29 Oct 2025 07:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L9hy4/u7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD9B63128CC
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 07:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761723864; cv=none; b=u8/BTNWQKUbVNOScXwij3Sv/FdIhSQM34lTHT0ZOToV5rUUF98SKfjUgaPhp5CWSyRGRX2Rjb1/gMBgVH7B3an7oemsPGMqe01rJJKzC1pj3M28OQ4RWbaM+1cBCFAizDB5gieIvaMYuw/JRrbsBTXVtJskdZrnlQ1rvyV+WII8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761723864; c=relaxed/simple;
	bh=k6aalskgjOKn9O2x3yn1Mpa2jylxp+lXSeo6dZYlgJc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RUj0ji0l7xRJ+WjYy8VdMe+TQd2FAw78KosZazIdp7E8MXOtvCEjjzybA4H10LIjMq56VnyKA3k2AAA2pxPTYc6/4ryhjmBay5+i/ZbXGFeSEI8a2Uxj+fnrxiNAV9nkJsciYBy06YVzDGNI9FrXE0+k+wa/EY/6JtkLxJB6IuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L9hy4/u7; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-475dfb5f8e2so1133265e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 00:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761723860; x=1762328660; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0CjHNyP9Ym8Cyn4IY7hYsCKrN1ou0EO6Ivetm9/DPuQ=;
        b=L9hy4/u7Je2OaVzcWWxUWvcFsWI+TiMdc5ZeK5NHGlHnYica6pTumabsB9EiPK8mNx
         3ukHlHUmD10AtMLZBzTvfSWxLvKIAzbUYJYyhAErjyIKiBTr/D4RD+7B2ip2HVaU7OzD
         V+ekPMTbMblbe8XmyojpRl41Nx0j9WJkQgLyH0ftaq7CEewd5wRto5Jw+e/F9G+HDe6Q
         R3pmMm7zmJaz17kUxrV2gTbWDRIBERzIL7fYFYtrWhf49OEj9BJ/iC4Fo6zJvRLqKGCp
         VDlBSRFWw0+1eWwaACYfYF+2SycLhcSP/19mpTz7DVS6Sxh/IS3SGMB50UI/yeZd2XYT
         1TWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761723860; x=1762328660;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0CjHNyP9Ym8Cyn4IY7hYsCKrN1ou0EO6Ivetm9/DPuQ=;
        b=IeNap8EJJheuO57aKsSzpUizj3T8L3QSbv1GJIsGmYqq8nhnqxI0GmGb2xuinOSExs
         tS0hlD/h8p38Go6fxC6DKdLA3J1lLmRvFX52J7MXQi2D/2S3/4K0Fm+JFRXas5XpMBLf
         o/xzXBjrDh5bYVM5xeGJAXAHmzLg4BEultqAjBDFH0Q+Qo9djPRZpa1YWspd/D6BzKZj
         a3GTowWWh5choaR4a1J1OjHSRJLhJTZHMR93AHbjT7ZkzNtUdItv7FSTvBVLM2OfNMLc
         Qa2/9c1S7A8LDgYS3b5YBvUy0Kd6HW5Pv/uHa69Aa5LQns8dOrRdaQYEQilas7JnF18X
         /erA==
X-Forwarded-Encrypted: i=1; AJvYcCVoIrc9eSnq2+cN2RKukBDien2Lfa5xjWINBuBluKk41gKc35zeMKEVTjtF2et+5hOlbIdccs+vJo+ujbXX@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq97Cs4S5wtQykZPhhsnnkz0jeT94fr6C6J2pPUPvhm6uvfwBv
	UkgeEryVBS67KIaUtsOrHePh/fOsf2sHK4ZZ9sqHv84S/wkh+3tkdsv+7nRuLNM4s4g=
X-Gm-Gg: ASbGncujXCIC0Ou7H7p4Mk9S00uABUbf0pH/AgX/bYrRHxQ24mMlpqyO25z5JAHnle5
	0gcPqJkD94wim4mfGZnUJ2vsiLv0GzBH9S3cNFrWn3vROV6aHpVprKZIrQJKWuEbbEoloPfYI65
	BgTWHdXw14BJqx0S8KVhGGuR95p90V0NnX4Ikmd8S4jAs9dQfYqCmzroXSIzI7DTcDQMg1l4As8
	DoL8E+VKrX7SxPLbYE3nZW9M4waFQuV9mRgEmvH+9geRTQ1RcRndXALa3em1NgycykNwms80uak
	cZs7svG7yiRasi2wvOnRjRxgj1KmAXM/m5li04VqndKK0aq70+T3QFo5Gxxj+TtDfuo0Qq44ADP
	9n4nwsOJcXe45zk5WxG7wWinMQ3tvvfToqLjw0todydAkFxRrxX57uXukAu6vhrTLPiP9S+U2xQ
	W0ENGm3VuV29g4E5Hr
X-Google-Smtp-Source: AGHT+IHnHiXXw+lcRq/mD5rq4kH/nIUgha/kU9ZWzMi/pRoyw+lpZpOPeFHyUslBgfot99kStvPw+g==
X-Received: by 2002:a05:600c:8b35:b0:46e:36f9:c57e with SMTP id 5b1f17b1804b1-4771e1e868amr9794785e9.5.1761723860139;
        Wed, 29 Oct 2025 00:44:20 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952d5c9dsm25861146f8f.26.2025.10.29.00.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 00:44:19 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 29 Oct 2025 08:43:56 +0100
Subject: [PATCH v2 06/11] dt-bindings: bluetooth: qcom,wcn6750-bt: Split to
 separate schema
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-dt-bindings-qcom-bluetooth-v2-6-dd8709501ea1@linaro.org>
References: <20251029-dt-bindings-qcom-bluetooth-v2-0-dd8709501ea1@linaro.org>
In-Reply-To: <20251029-dt-bindings-qcom-bluetooth-v2-0-dd8709501ea1@linaro.org>
To: Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
 Rocky Liao <quic_rjliao@quicinc.com>, Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5443;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=k6aalskgjOKn9O2x3yn1Mpa2jylxp+lXSeo6dZYlgJc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpAcXF3HqShDOUk5sEHjx8jwrdnADiow0KChAWS
 u50/TXVNxeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaQHFxQAKCRDBN2bmhouD
 1+YjD/9Qv5ezDKB/l7an92bV3UspxPb976SYWFV7eohGY6GLd/uooYLvfzISyESdLX4HiERfhib
 u3A7byJvSP103SHZOpp769PIs5uSSToRRWL34IhzW/wwfBaEL1IahtQ84uZEME7RUpsxfBrVoWH
 oNSUcuAiUEr3LjkwoSPCBiB9BGrCWN5t/brGVIlR2itUL23azoJcqIF3QRjRll4EXRPk2dB9Pez
 zL9T/4GrTABdl12200DxUQiS0VeJXp5CN8peAm3lm+YCZClcUTrc6lnMxo0atti+xxGs+Fxtd9K
 SrAZ0GIMDm4QBQVszr9ecfoFaGY04iDDY7K7pt6xSPl0yBMPUjwqaRLLfuBAbXm3S73Ntp7cjmc
 yHDNem8zeGrqT5kiERbdDELIGYHTZLriZuDIrDhUQE+zU/LECsOUwj4YhmMFR2Km2vp+kHLJX0q
 3e8jq3toVkWFs+wBEd80Zyfvv3Yt+gg0FGG6gnmf8ogCaUCFXxPf+zlImQwtVAdNWgIS0qJWEaT
 xy+7xY3w9XHisd/4euFdHGxLwPeVW7hD9a4ugHgWQsjd5vt6Dds5nfGGldYwpzp8o2kUXdneVRf
 YoJeIvQUB+nrdUibHdOfn2A03cDceU5zpZGAU9ViYR0P70iT/3MiCFJgNfciMuj6CIatcaB4bs5
 cRVL9YBbrCC7J/A==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

One big Qualcomm Bluetooth schema is hardly manageable: it lists all
possible properties (19 supplies).  Split qcom,wcn6750-bt to separate
bindings, so device schema will be easier to read/maintain and list only
relevant properties.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/net/bluetooth/qcom,wcn6750-bt.yaml    | 86 ++++++++++++++++++++++
 .../bindings/net/bluetooth/qualcomm-bluetooth.yaml | 45 -----------
 2 files changed, 86 insertions(+), 45 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn6750-bt.yaml b/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn6750-bt.yaml
new file mode 100644
index 000000000000..f11d12c205fa
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn6750-bt.yaml
@@ -0,0 +1,86 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/bluetooth/qcom,wcn6750-bt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm WCN6750 Bluetooth
+
+maintainers:
+  - Balakrishna Godavarthi <quic_bgodavar@quicinc.com>
+  - Rocky Liao <quic_rjliao@quicinc.com>
+
+properties:
+  compatible:
+    enum:
+      - qcom,wcn6750-bt
+
+  enable-gpios:
+    maxItems: 1
+
+  swctrl-gpios:
+    maxItems: 1
+    description: gpio specifier is used to find status
+                 of clock supply to SoC
+
+  vddaon-supply:
+    description: VDD_AON supply regulator handle
+
+  vddasd-supply:
+    description: VDD_ASD supply regulator handle
+
+  vddbtcmx-supply:
+    description: VDD_BT_CMX supply regulator handle
+
+  vddbtcxmx-supply:
+    description: VDD_BT_CXMX supply regulator handle
+
+  vddio-supply:
+    description: VDD_IO supply regulator handle
+
+  vddrfa0p8-supply:
+    description: VDD_RFA_0P8 supply regulator handle
+
+  vddrfa1p2-supply:
+    description: VDD_RFA_1P2 supply regulator handle
+
+  vddrfa1p7-supply:
+    description: VDD_RFA_1P7 supply regulator handle
+
+  vddrfa2p2-supply:
+    description: VDD_RFA_2P2 supply regulator handle
+
+  vddrfacmn-supply:
+    description: VDD_RFA_CMN supply regulator handle
+
+required:
+  - compatible
+  - vddaon-supply
+  - vddrfa0p8-supply
+  - vddrfa1p2-supply
+  - vddrfa1p7-supply
+  - vddrfacmn-supply
+
+allOf:
+  - $ref: bluetooth-controller.yaml#
+  - $ref: qcom,bluetooth-common.yaml
+  - $ref: /schemas/serial/serial-peripheral-props.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    serial {
+        bluetooth {
+            compatible = "qcom,wcn6750-bt";
+
+            firmware-name = "msnv11.bin";
+            max-speed = <3200000>;
+            vddaon-supply = <&vreg_pmu_aon_0p59>;
+            vddbtcmx-supply = <&vreg_pmu_btcmx_0p85>;
+            vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+            vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+            vddrfa1p7-supply = <&vreg_pmu_rfa_1p7>;
+            vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
index 5581e810f08e..1ee97089e1d5 100644
--- a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
+++ b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
@@ -16,7 +16,6 @@ description:
 properties:
   compatible:
     enum:
-      - qcom,wcn6750-bt
       - qcom,wcn6855-bt
       - qcom,wcn7850-bt
 
@@ -62,12 +61,6 @@ properties:
   vddrfa1p9-supply:
     description: VDD_RFA_1P9 supply regulator handle
 
-  vddrfa2p2-supply:
-    description: VDD_RFA_2P2 supply regulator handle
-
-  vddasd-supply:
-    description: VDD_ASD supply regulator handle
-
   vddwlcx-supply:
     description: VDD_WLCX supply regulator handle
 
@@ -98,19 +91,6 @@ allOf:
   - $ref: bluetooth-controller.yaml#
   - $ref: /schemas/serial/serial-peripheral-props.yaml#
 
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - qcom,wcn6750-bt
-    then:
-      required:
-        - vddaon-supply
-        - vddrfacmn-supply
-        - vddrfa0p8-supply
-        - vddrfa1p7-supply
-        - vddrfa1p2-supply
   - if:
       properties:
         compatible:
@@ -142,28 +122,3 @@ allOf:
         - vddrfa0p8-supply
         - vddrfa1p2-supply
         - vddrfa1p8-supply
-
-examples:
-  - |
-    #include <dt-bindings/gpio/gpio.h>
-    serial {
-
-        bluetooth {
-            compatible = "qcom,wcn6750-bt";
-            pinctrl-names = "default";
-            pinctrl-0 = <&bt_en_default>;
-            enable-gpios = <&tlmm 85 GPIO_ACTIVE_HIGH>;
-            swctrl-gpios = <&tlmm 86 GPIO_ACTIVE_HIGH>;
-            vddio-supply = <&vreg_l19b_1p8>;
-            vddaon-supply = <&vreg_s7b_0p9>;
-            vddbtcxmx-supply = <&vreg_s7b_0p9>;
-            vddrfacmn-supply = <&vreg_s7b_0p9>;
-            vddrfa0p8-supply = <&vreg_s7b_0p9>;
-            vddrfa1p7-supply = <&vreg_s1b_1p8>;
-            vddrfa1p2-supply = <&vreg_s8b_1p2>;
-            vddrfa2p2-supply = <&vreg_s1c_2p2>;
-            vddasd-supply = <&vreg_l11c_2p8>;
-            max-speed = <3200000>;
-            firmware-name = "msnv11.bin";
-        };
-    };

-- 
2.48.1


