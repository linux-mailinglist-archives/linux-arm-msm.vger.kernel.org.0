Return-Path: <linux-arm-msm+bounces-79212-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 010D6C15820
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 16:38:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3947D3AD52D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 15:33:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B451534676B;
	Tue, 28 Oct 2025 15:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VBNFyUFd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7906234573C
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 15:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761665546; cv=none; b=fh/nHOqp19zD5Yr2mBnyC4NVGFJfdIqvbKiek9CszwMp6p1i6sOvObd8TfASL0yEAI6TZ+3j0Yyp2oOwY2rCca3G79k0fmym5Nl5QTXyrNuijtDhnoINxBTyOta903dxfrIDCGwqnj7ZHwARQS/8pDi2vWQvt3IFLKVULeZoUmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761665546; c=relaxed/simple;
	bh=7rSGqGe5j/ajfYeyCLhr7KhXQYjjD+BB8KOQPiQ8lnM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RIPwNudQUSmrvQzJLeprfqAQqou7RRpEpAhji05ftgjNCLo9I81jl5mihRqmzPeWKsohe/HN+l1uQaO4Fps8427Dk/fWSeDhKo5bQWC8vZ5xBfjmM39GaUNz6ISpaBlFxkPKSX19hjPklTn2NzSPy3pYx6rbuir8woqs3grJBGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VBNFyUFd; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4271234b49cso813053f8f.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 08:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761665543; x=1762270343; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CsNC6YXccurarSsTb8o/0+bYujRK2YI84C73y8iXHgw=;
        b=VBNFyUFdf442uucoRudgM99wI5awz10ZCTZH2DyeJlhbYZRtYguN/CuNrrjbwwRKrZ
         dGEr/dPswmyiMjhkxhnAhzlWzAKRJ/CeNumI72OciWCsAhZYraM/CLKEHt5IbJnuyYdG
         s1DdfAXzOISPby9OPJPOxk27NLdlz5d5Lj6dPfQ1dQJa8HYjfJ3Bpuwfz8rUNpPzu2hT
         +8GwagPTdDmeJaSN8u2dUaQblmXbfYzwTPYtfp6V3kYT8LXSDS9XaJCcemDKAviWiI62
         IYGmMGTNdKLZ97QbtUTvWHrV641duPjUri3UQURtVPNnvDd7mDnDl0GS0yAEIO57DeN+
         AmqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761665543; x=1762270343;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CsNC6YXccurarSsTb8o/0+bYujRK2YI84C73y8iXHgw=;
        b=TEknLbiuH4rTzbkXLVNnHTCv8Ry8wqYUaX0HKRrGQFyUdLtXEr1+kKyqco3WWzaQUy
         dETMstB7lJJiz3HXlXvbKv4GyjaMaVoYUz5fyb6MTPodhGWkO8TylhUmoOcCo7ED62Du
         dLrnSWI9V9nTKFaDuBNLAUSMF5fb00LKfFTVuP52AHs6RvrWiGIvFcd50w8hqCRwJLry
         /YjNCdPJK5JmPHUHPMB/ckZLktNLjMSjToXvn+E3lVT95QJZI34kM400RIMLeRT9MzLC
         P2CQ/8arpiyzwdsup/MPcjp0hgFeQXJlW13GsOGFS6eWKPaOlc0zA7I+WDwEMSKaNEY7
         rmfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjE2MpkFTBWCgV69Jhmybqj86To4RN0AaiQTavzm8kslFXSqMzDYhAfYV4hU7HaW+Yx9D4+D0kJVf3k+v4@vger.kernel.org
X-Gm-Message-State: AOJu0YxOkxBfOflwDbEaOXc3fj4kflrFRabenCVPiNO1KakJtPVrhQLl
	6sjJCSshk8pYRScjiuH698zlFY+320eLhZC8Mrc9W7Rw1MmG9rGteD6H9t97/WSbZnU=
X-Gm-Gg: ASbGncv4OMOekyc93FgIX/9ZkQdVN/+WTBsDc0qSELC2eITLO0XeutXUHkVjJA9izsq
	/KfYGUH2lMs4RBWhJ2AedN9dHGb001j/2ABdTFSjRlPfgmm/+EHdV/NtrKsgZJkg/EOnX5m2Kiw
	7wXUL4X7/Z3Jt6QKlkG5k6ep3x0Cwr6gEpTloE19VQbcw3k6I0rScEFZ1aiGz2d+N1BaKKuXLtR
	yvO4d4vRxRWrS87xPhTISxwa8i+g55W5UJRxs679V7E4vdJ+ZRiACYSozh5SEJBpehun/hx8rfR
	7bEJ9aFy3MzV5DJeb8zRh13VrHi0ZSt9+Fi40pq9JCxspmD3kV6rB6XoUOg26kSFyCzChz57AmU
	7nvEk1Ng7rmyvsxRMk1Q8zwiOGpgd0fBKXR4tNouzezsNoau2pSJPmMuKiGE21sGuy6vUpnRYtX
	iVsCwusNN7yiAAV2v0V2NT6HwCRSQ=
X-Google-Smtp-Source: AGHT+IGSDPFEO84EzJhEbgPJhsjWHxZla1PTi6sHXxqFDlBLQOf82JsJ+IxGsLOGZ+ItlsDEYbcmgA==
X-Received: by 2002:a05:600c:1913:b0:475:d7b8:8505 with SMTP id 5b1f17b1804b1-47717e7f144mr17828925e9.7.1761665542485;
        Tue, 28 Oct 2025 08:32:22 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952d9e80sm20844417f8f.28.2025.10.28.08.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 08:32:21 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 28 Oct 2025 16:31:55 +0100
Subject: [PATCH 06/12] dt-bindings: bluetooth: qcom,wcn3990-bt: Split to
 separate schema
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251028-dt-bindings-qcom-bluetooth-v1-6-524a978e3cda@linaro.org>
References: <20251028-dt-bindings-qcom-bluetooth-v1-0-524a978e3cda@linaro.org>
In-Reply-To: <20251028-dt-bindings-qcom-bluetooth-v1-0-524a978e3cda@linaro.org>
To: Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
 Rocky Liao <quic_rjliao@quicinc.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4686;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=7rSGqGe5j/ajfYeyCLhr7KhXQYjjD+BB8KOQPiQ8lnM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpAOH23WY7iJvjwE7kM4BwHTiBQB+VonPPkyMkp
 /njZ6hJGUeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaQDh9gAKCRDBN2bmhouD
 184YD/9HPBaijTAfvYa3A7YrZyNE3W7JFMLrGZReWZHzu3clH2fnrrW0AlKqT3yjhD5V2+jtXQZ
 7EHBGEA+pTvz644c771GVlqTsSc3DkpaZMbJOnUjgM7/5AcJfh8E/DR0UrgCrIO1rkkGnuyCGCq
 vR2XP56gAI1amgMKp+bKPwS5Z8ZjlpnfxPKjJDVESYc++Zluj8EPJKObjYcTh+pjU+sMzIIMOYO
 htD/6xNTeqo+swnWnXaLd2PLGUTZZGsrn8Rf+4WiaWQs+Cl1b49RVAbQk1sgKSnFEFtwwmtLTax
 zFD6cCC3zOCsraWTPu6WIk0lLmaF4fT7SAD63k0VuzbgIB/vk2twldvprS6Nfdk1rWNUBwmmBaX
 zq3Uu2Ano26Jtpbobgf8Y6xp0oAXawEXPDnTyKlGDI+RAivjb9D9dgI6ddSlkpPJ/I9EWvweIhE
 CXd3Fw1lJg/EbJpDYuz5i8qwWozZlB3ZaU+os39+HiG20d/wVgV7ahA1wQvxuuLwtbPq6Wkzjy5
 N67Pf6UmLvfA/VcTp1Z9jLW4gvQRpmi8lRl7NfObbB4Zb8f0g5oclbEDRPMi6U84TV1BtIfZ3UL
 gqp3qUFjMsfT1FSxHtwa1bZ/JZpNhNjG4fokQktUr3xofX9H1mamYbxJMnnokERPlwzEC0mdiIg
 7YqpXCAJfuVciFQ==
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
 .../bindings/net/bluetooth/qcom,wcn3990-bt.yaml    | 66 ++++++++++++++++++++++
 .../bindings/net/bluetooth/qualcomm-bluetooth.yaml | 40 -------------
 2 files changed, 66 insertions(+), 40 deletions(-)

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
index 0a532144f92e..93b5e0e38c37 100644
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
@@ -42,15 +39,6 @@ properties:
   vddxo-supply:
     description: VDD_XO supply regulator handle
 
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
 
@@ -117,21 +105,6 @@ allOf:
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
@@ -181,19 +154,6 @@ examples:
   - |
     serial {
 
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
-  - |
-    serial {
-
         bluetooth {
             compatible = "qcom,wcn6750-bt";
             pinctrl-names = "default";

-- 
2.48.1


