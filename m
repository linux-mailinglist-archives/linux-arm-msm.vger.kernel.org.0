Return-Path: <linux-arm-msm+bounces-79209-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 581DAC1584A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 16:39:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id ABF714F0DA2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 15:33:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 355443451C1;
	Tue, 28 Oct 2025 15:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AWBEtfUT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E53E340A67
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 15:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761665543; cv=none; b=PEYJvxTesaAE5DYTVFJrz334OdE/c5Lb4JNRlmLH60icCa8kMWkLWaIgH0bfkui1ULYWtpM62Y6AObuhdqud3Rb/LlVM7KuMStpLimEDrs8Dgg5CME4W5BYagBpu0g03WE4ONZjfOf6nkYHzmZ06KvHON6a8ALgch3NqvV6C43s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761665543; c=relaxed/simple;
	bh=1Pa8N091q1Iwvly7uDktHtvfsY9pYF9eldQYfV3KVgg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Or11lIJ9dCPXVjfCyARxbkaa66sfbKWmnWJ2jiCOwhGPQFxvZ/4EBjf+fFlVCsFJoqd332g5kY5hxsf2nJPkYp7Qe5BUaYA7ekHQlTi8LEbuafZD/a8UvipefqfJAnnOiSnSf7kuAkDGSRCtZ194xDeFagRsUOw+pSX/+hLOnHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AWBEtfUT; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-42844985499so711567f8f.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 08:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761665538; x=1762270338; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y52k8g6s9KNZCHJowMgyK6iu0ZbWW1Jp428xl/ixOkw=;
        b=AWBEtfUTYDGgUmjRzy+ikHqXrwm1F7FePVvbjtS/MV82MtBjnwuOwBYFncu/qnl6LZ
         t+hau1kBg7DQ83xqKPF+ASFlTjSM4251ZWGsvY97LvW4Ii2XKnwJbGepezhK5iqyg8/A
         jksR6daDhnFomHPieilzObLnVT+eQXigfRtHj+X47Vzq6DbxiPFu3nPg6vG/wmOCIvbN
         QSqIkA6nbMDPMt7WavvC49Vqi1nnarPNFvDH+XvraW6gcHN3o9MEtOqLbSVue4rirEZu
         wSSWDTfUKJb8n7g3gX1s9H2uqIfMgy3uE7Gy3JUyc7MLXJTH5ERpmPSTKNEM23DMqkmF
         Nj3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761665538; x=1762270338;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y52k8g6s9KNZCHJowMgyK6iu0ZbWW1Jp428xl/ixOkw=;
        b=GNgVuUzBDK1t37mT9hDnfggtw601bOd0j4sgq2HT9Zo1rAwBkgc5RIsdre7NayyfjT
         hq6uOhM/EFk0fSl8NUgfvyPC06j5YG13Ar0mEpXt8N9b8zTU3OCmSkeHr/qq+qVlXyWK
         0j+5VmN25lY7suH6bCa4idfNP1bbupCsYZzatxxdu3zNNeuWTJZa5rDqsDD1zsVcN0wv
         ofOD34D/JAfLqDEwdZWfWCxKy9Zc5i37PF6TtxIUA735iiOFQBZXLVwzzdQk75EcNPWD
         TN3NLuMo1NrzB5yBSkyEfdO16vrF3Mr9sR0LTPLC5oa5YRn1hiloWd6Dve/GEpKvNxVr
         +J5A==
X-Forwarded-Encrypted: i=1; AJvYcCX3a8Li8Z7Id0DFjgBULO0CAs40WEhXmHfsvEGtPT6oqTQWNtjQxmNH9UH3/fjUddu7CtyaGP88hziWLtys@vger.kernel.org
X-Gm-Message-State: AOJu0YxXlIQIflOv950atTNfoGOTLSmAcd5aAbVjlR8/PnACOBZvUF9M
	xBV5I6wW5mbuZl4PfKkrlJkIjmKw/gJxhzYSZ1+T0UhDX2l5Ehixv6vIcNPqGyieuZg=
X-Gm-Gg: ASbGncsBuCHmr8Je3mxC0Jmv4oDu3Is9/wYYUFMQeMhOuT9ZR+zN9358qvVTRZyKkdK
	oe45u8JQ1FGjlc9RtYCnYOixqRy8vM21Z+BuJnLms+INmWFQ5JlwMM3YF2cYqV0ZCdvsLljarZc
	YXYccG2KNj9betYRyP6OTcIDZJI9U5yZgnDxZH9tksc1Xp4TuUIX41h0nq36jlBS9O+vKtVx2uC
	upaQX6rirOliWQpElrsBofTAdfUR5fB0+HWEVnh/yMgpcXptuJR2FADXk+uQKfXn4yV9z7CnTxC
	QA3Qs0X0VigJLyY70HbIYgA+1yx2oFMfql0lRgw/qCx7GL403vHAKyUuV4iLRdDIZnPPoXJxIRF
	14zuTO59ULuoChxBX4F9rnCEOB/tDMazPJ6z4GaEZ92/S8i7mGgxCrd6zlJvahM6u9MI4obFr3Q
	6sN9WPK/YhP73H7+bj
X-Google-Smtp-Source: AGHT+IHyi3rZRAb/GJvnuN1suTcwEaMFYGAGJ2Y96rbFsJ628WIcAr+ju+iMuPYaLm34C0lvej1qSQ==
X-Received: by 2002:a05:6000:4285:b0:429:8c97:f9c2 with SMTP id ffacd0b85a97d-429a7e892edmr1891839f8f.10.1761665538135;
        Tue, 28 Oct 2025 08:32:18 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952d9e80sm20844417f8f.28.2025.10.28.08.32.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 08:32:17 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 28 Oct 2025 16:31:52 +0100
Subject: [PATCH 03/12] dt-bindings: bluetooth: qcom,qca9377-bt: Split to
 separate schema
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251028-dt-bindings-qcom-bluetooth-v1-3-524a978e3cda@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2962;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=1Pa8N091q1Iwvly7uDktHtvfsY9pYF9eldQYfV3KVgg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpAOHzm67Hlk4zrsMlfjiXuKuQqsVq/jMgmzPDh
 swAY0w4IKuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaQDh8wAKCRDBN2bmhouD
 10gLD/0aoo1WIbSW1udGX6A46/Tu3oJuXscSyS6hCQkL+WQvVRrBfrX2AbWw0a4VqDKe8IiYMEM
 92faX3b0UIXyaxU8rzKmi6q6USfmvyfm5gzb4xdFVpdphC5jaiI2+nFqgeKdk7T8wdU7folsIcC
 A/WcOCIFAbrA/7WsbpD9a8akAiGv9izdtKoqWVrIxiUlMjCGB+NbQNHho77t+dqMQgWGFhS1Hpk
 jZvlb3DsBXI/juqrSde4t78D7Ddvj7sbcvdC0WzcbCK3z/zXj349M25n53V3l8FB7apk0o9XvqT
 xNcW8mEzkh3ERX5B7YyCFNipl2okysP7BO5riATgdn5KL7su1iXYs9fqffAe9t7I1Er9GEd0alU
 BZBqYb09qoWcSXDQgT1BsTA8IXS5hEkVDBdmPyFX+pYUpao7umOE+csgjhh6R6bago1VKaOJUx6
 LSFDZQKXeMsjEeynVm5ok2VQAsKD3g1yKuhGQGKoSM6TxENbqOXYYX9mOsMxxuqh5463HatxrtZ
 HJR8WgU4aDOASt1W97//cvk7AePbE8+DQ8Jn/63uxtq4sRg+P11XkC1a9bf9pXKBCQSSUIIrh4M
 8cwEe9GoN9a3c07ktcE+WsMsGZHMflt4t7mncDQtZMIamMf1B/vfxcDpxQ4Ja0TNbGlHl2ZVnN7
 DLuqNM7iYHFCJLw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

One big Qualcomm Bluetooth schema is hardly manageable: it lists all
possible properties (19 supplies).  Split qcom,qca9377-bt to separate
bindings, so device schema will be easier to read/maintain and list only
relevant properties.

Existing binding has incomplete and incorrect list of supplies (e.g.
there is no VDD_XO) and Linux driver does not ask for any, thus keep
this state unchanged.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/net/bluetooth/qcom,qca9377-bt.yaml    | 58 ++++++++++++++++++++++
 .../bindings/net/bluetooth/qualcomm-bluetooth.yaml |  1 -
 2 files changed, 58 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/bluetooth/qcom,qca9377-bt.yaml b/Documentation/devicetree/bindings/net/bluetooth/qcom,qca9377-bt.yaml
new file mode 100644
index 000000000000..3fe9476c1d74
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/bluetooth/qcom,qca9377-bt.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/bluetooth/qcom,qca9377-bt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm QCA9377 Bluetooth
+
+maintainers:
+  - Balakrishna Godavarthi <quic_bgodavar@quicinc.com>
+  - Rocky Liao <quic_rjliao@quicinc.com>
+
+properties:
+  compatible:
+    enum:
+      - qcom,qca9377-bt
+
+  clocks:
+    items:
+      - description: External low-power 32.768 kHz clock input
+
+  enable-gpios:
+    maxItems: 1
+
+  vddio-supply:
+    description: VDD_IO supply regulator handle
+
+  vddxo-supply:
+    description: VDD_XO supply regulator handle
+
+required:
+  - compatible
+  - clocks
+  - enable-gpios
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
+    #include <dt-bindings/gpio/gpio.h>
+
+    serial {
+        bluetooth {
+            compatible = "qcom,qca9377-bt";
+            clocks = <&rk809 1>;
+            enable-gpios = <&gpio3 5 GPIO_ACTIVE_HIGH>;
+            max-speed = <2000000>;
+            pinctrl-names = "default";
+            pinctrl-0 = <&bt_enable>;
+            vddio-supply = <&vcc_1v8>;
+            vddxo-supply = <&vcc3v3_sys>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
index 0e67abfc8528..c8c0fa52d98c 100644
--- a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
+++ b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
@@ -16,7 +16,6 @@ description:
 properties:
   compatible:
     enum:
-      - qcom,qca9377-bt
       - qcom,wcn3950-bt
       - qcom,wcn3988-bt
       - qcom,wcn3990-bt

-- 
2.48.1


