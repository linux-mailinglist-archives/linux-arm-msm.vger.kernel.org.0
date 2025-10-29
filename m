Return-Path: <linux-arm-msm+bounces-79347-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E0848C18BFE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 08:45:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 30ADD1B22950
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 07:46:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7A7E31327F;
	Wed, 29 Oct 2025 07:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L/6nCpRE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A91AF312820
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 07:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761723862; cv=none; b=HEQSJgNuisObwkR974bju42DN3d2OrecoG9+DTU8VtcWC95RtnUByETiiQg0gNV4QScuCd1UfU7jkkPpi0CiSwPe8C7Amo86MJN2df+TXfMRWATN2nm6hpI7bYju4wlQuNAydaR2ayhCnPYFNEMY4oUdhU84zb7wrQ+u5r7C6ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761723862; c=relaxed/simple;
	bh=C6Xs4Iy/5dXWOxqcFTiKo95y2jY1WWMt19mVxeHVVvw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g8gutfEBHDZmHKFmbw5XDAzyOuDwRh7OXOdm0mwuSH7UfgFEnJh06+9ZGNYU/ZSxpemyQSYfxlITx78bdLVC2zLE3CkS9IQP2aJdk71YLnfwRSmtVSxLdS7bPnb6qpn/7Rsqh5log79npWMGrEgqkfHNocHCvS7wm7dNfzxgF6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L/6nCpRE; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-42702037a01so1224622f8f.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 00:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761723859; x=1762328659; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KG+2/wyfujZcMdyeYaaBsTn5DxLtvxGxObtqFDsrcQg=;
        b=L/6nCpREIXtsX3Libnci/XX0LmWyWKmOWKMIFiMkJk01JSfYLTLr1sziWswTEJH5r3
         j0mu2SkPhNmqzJTS7oC9naRVQPy2zEqhgboAGz6wxI9UECWroTMIJ0Yd7Rl/KpTTVm1Q
         SLSrZa5hxxLzrXMeDOGp1YF+Ox0QUT7CCuHt63YyjtFAP9Cdt4pIL7PQ0h7ytiws/ucD
         qwDyAvKyuCCj7gh80VzTtswcTL2iZQGhooqMWPdrof1L/xtq+15Yn5klpFUR6D3Htwu6
         SJhEN7C+812higegbx+0XpYiDGaVTzdHv0WMuL9zmPiUnxefHYETTuth0gCel59Aziw+
         H3JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761723859; x=1762328659;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KG+2/wyfujZcMdyeYaaBsTn5DxLtvxGxObtqFDsrcQg=;
        b=hEwLtv7Y9+dbaqLvW/WhqH/IqRzZkrBZmGYC/BqUIt1UGCrQEPnuhTSwsrdcoYC6CK
         5bTmKIXJmEliPG5tzJvVneubfjDHW4iHSYXEXGJXenbSUbnoPVPxRJfGO2AtxKbwgg8k
         8nuw1+xn/5I4a+8IPrz8d52eZEUg+9RdGQY/F1GQeeh/P4a+e2NHQ/Y5PiUA0+rCsxtd
         6EeHKEvZIH8CjrcrAbKIdnCK3dHWXy6Fdf0Gwj4+MnuC2+YKuPFJ6l5fbjb3X6YUWsR3
         rV3SRFTOxvE2ZcV1LZcRcgx6nhegJ7J7Jm7myYSC/5b6c9dEvkxshSh193jehTL84hjH
         U1tQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjNXc5hGih8FEZIRkYqz5H+lrfSjBwC5UWeBZb2xlAEABGtCF0E/6I3UsMN9cWd/mfEopi9TVgqn+HAcQf@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9h1iKPYnVLij5tzaR799297T6unA/tUpTbgPEFpTengJHiwLd
	NZGfWhcfK4FK3pVsgQkFJ7TFfc27Wib8uaMYGE3CnK3zVVy/SrWlKdNDVbeWIPb2xgs=
X-Gm-Gg: ASbGncuH8qMblD+lOJ8zs2jIHUfgSwEnguDTWi6HDNmRdh4eWLFrB9yNt3qAGcNoOMw
	zaraJHkFAwdY4onQQG1NinZMWQgsemQFDDrqptYrCSWfWWwTJJ+A4C5rIZDIhAdB95Y9veD9Z15
	w2/OLUG7WDJPO17sBGcdexJBExn5xtKp18TNyiUkRW1QCwGMftSafCdXScIaI7EAXC6Wu7GoJi5
	dpU8q/YozO2q+RfW4Ub21OrvBR98xEpLvrzRzNN3xwqhBQbd89hH6eE9HrcCM9gUZt8lJRmZK4z
	M5edillU78y22OBvPE269GVrD3kfT6HAltrvGVcp4QeSqWWEuVjw7HGJXqIapFEKQzbdtgFIWEJ
	dVnU8h1pLhOxK4gaYib2DD7F0RxnS1wVzwWexg4K0yz3ZT3mu7hYywkzqFjUZ20UPc6hgs5qpCa
	JYV8NFnzUdGHTjfFTW
X-Google-Smtp-Source: AGHT+IGmMEgEpLO20Eg//LXSsQTVQX4RLJbIH6elIGL0L0LQyLltSXdickUTZw3HG+2HKQQ3YI4x/Q==
X-Received: by 2002:a05:600c:8b35:b0:46e:36f9:c57e with SMTP id 5b1f17b1804b1-4771e1e868amr9794455e9.5.1761723858767;
        Wed, 29 Oct 2025 00:44:18 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952d5c9dsm25861146f8f.26.2025.10.29.00.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 00:44:18 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 29 Oct 2025 08:43:55 +0100
Subject: [PATCH v2 05/11] dt-bindings: bluetooth: qcom,wcn3990-bt: Split to
 separate schema
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-dt-bindings-qcom-bluetooth-v2-5-dd8709501ea1@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5052;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=C6Xs4Iy/5dXWOxqcFTiKo95y2jY1WWMt19mVxeHVVvw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpAcXEwGL9pTvLTyM1ghtxK3H96v653G9miPmzY
 ok+O91wqt2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaQHFxAAKCRDBN2bmhouD
 17rrEACLTLxRBk5Z2ysjy5NlC4gjnGyRtx2M9aiJWPCtF1XhaHfFSlU21aqyYVOaoamnZ5Tz6v8
 tSSmLXbh7vECwe6PBFQ6QDfdSe1rngRCc6+F+GJo5duao4QklzEY8BLFlD6qspvmSm2yxfS1OFg
 HTmsNH6OjnVLFC5CNUVc7Lw2B2iMNEUpIKKT6m0EU5ZnfMYemQhBDwY6YCWtYiIjEhD9brdCE+U
 ezU49ls/i1Cvu+Ir7L7VcOm1s5ln4cAomyveiSOJ2T756One2DqR2NVT3eW4wVal5xscnlOInmv
 GStrf8U5E/xSAMRa2HG4wufPqanjcwkt2M+UCd6r9vHxSsKG2/gjLylwz8W7z7NWql5bQg75duN
 /NgVJfYkaaEYA4t+1UptTuvwgoGqj1Ljb1VuTznTkLVpNDGTIHEGLFpyig1PJ4k0sqrExFkGDgy
 6XLQjpHLtC7VFqNRfxcPie7xOp4sU7auB+dHuoWX+ZtsHg1cwc4xflX3mvZqskRm4n8SDN7SNNn
 taJLji6Txio6Sfeecr2naUYsiU4wriaLp2v/mW5CYcVQha/uJPJ0fNsrvXNarF5U/e6UKuYEB1Z
 z9gpWK06RZHgVPWDfzuTJ0hu+nwsn1SRLPzti26kEseXW5C8IZe7uz4P86OTconQqg8VRdJ/eP9
 hvhQjL0rwbzo8+A==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

One big Qualcomm Bluetooth schema is hardly manageable: it lists all
possible properties (19 supplies).  Split qcom,wcn3990-bt to separate
bindings, so device schema will be easier to read/maintain and list only
relevant properties.

This binding is very similar to qcom,wcn3950-bt, however devices have
additional VDD_CH1 supply.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. Drop few supplies from qualcomm-bluetooth.yaml which are not used by
   devices left there.
---
 .../bindings/net/bluetooth/qcom,wcn3990-bt.yaml    | 66 ++++++++++++++++++++++
 .../bindings/net/bluetooth/qualcomm-bluetooth.yaml | 47 ---------------
 2 files changed, 66 insertions(+), 47 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn3990-bt.yaml b/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn3990-bt.yaml
new file mode 100644
index 000000000000..89ceb1f7def0
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn3990-bt.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/bluetooth/qcom,wcn3990-bt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm WCN3990/WCN3991/WCN3998 Bluetooth
+
+maintainers:
+  - Balakrishna Godavarthi <quic_bgodavar@quicinc.com>
+  - Rocky Liao <quic_rjliao@quicinc.com>
+
+properties:
+  compatible:
+    enum:
+      - qcom,wcn3990-bt
+      - qcom,wcn3991-bt
+      - qcom,wcn3998-bt
+
+  clocks:
+    items:
+      - description: External low-power 32.768 kHz clock input
+
+  vddch0-supply:
+    description: VDD_CH0 supply regulator handle
+
+  vddch1-supply:
+    description: VDD_CH1 supply regulator handle
+
+  vddio-supply:
+    description: VDD_IO supply regulator handle
+
+  vddrf-supply:
+    description: VDD_RF supply regulator handle
+
+  vddxo-supply:
+    description: VDD_XO supply regulator handle
+
+required:
+  - compatible
+  - vddch0-supply
+  - vddio-supply
+  - vddrf-supply
+  - vddxo-supply
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
+            compatible = "qcom,wcn3990-bt";
+            firmware-name = "crnv21.bin";
+            max-speed = <3200000>;
+            vddio-supply = <&vreg_s4a_1p8>;
+            vddch0-supply = <&vreg_l25a_3p3>;
+            vddch1-supply = <&vreg_l23a_3p3>;
+            vddrf-supply = <&vreg_l17a_1p3>;
+            vddxo-supply = <&vreg_l7a_1p8>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
index 82cce508e295..5581e810f08e 100644
--- a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
+++ b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
@@ -16,9 +16,6 @@ description:
 properties:
   compatible:
     enum:
-      - qcom,wcn3990-bt
-      - qcom,wcn3991-bt
-      - qcom,wcn3998-bt
       - qcom,wcn6750-bt
       - qcom,wcn6855-bt
       - qcom,wcn7850-bt
@@ -32,25 +29,9 @@ properties:
     description: gpio specifier is used to find status
                  of clock supply to SoC
 
-  clocks:
-    maxItems: 1
-    description: clock provided to the controller (SUSCLK_32KHZ)
-
   vddio-supply:
     description: VDD_IO supply regulator handle
 
-  vddxo-supply:
-    description: VDD_XO supply regulator handle
-
-  vddrf-supply:
-    description: VDD_RF supply regulator handle
-
-  vddch0-supply:
-    description: VDD_CH0 supply regulator handle
-
-  vddch1-supply:
-    description: VDD_CH1 supply regulator handle
-
   vddaon-supply:
     description: VDD_AON supply regulator handle
 
@@ -117,21 +98,6 @@ allOf:
   - $ref: bluetooth-controller.yaml#
   - $ref: /schemas/serial/serial-peripheral-props.yaml#
 
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - qcom,wcn3990-bt
-              - qcom,wcn3991-bt
-              - qcom,wcn3998-bt
-    then:
-      required:
-        - vddio-supply
-        - vddxo-supply
-        - vddrf-supply
-        - vddch0-supply
-
   - if:
       properties:
         compatible:
@@ -178,19 +144,6 @@ allOf:
         - vddrfa1p8-supply
 
 examples:
-  - |
-    serial {
-
-        bluetooth {
-            compatible = "qcom,wcn3990-bt";
-            vddio-supply = <&vreg_s4a_1p8>;
-            vddxo-supply = <&vreg_l7a_1p8>;
-            vddrf-supply = <&vreg_l17a_1p3>;
-            vddch0-supply = <&vreg_l25a_3p3>;
-            max-speed = <3200000>;
-            firmware-name = "crnv21.bin";
-        };
-    };
   - |
     #include <dt-bindings/gpio/gpio.h>
     serial {

-- 
2.48.1


