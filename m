Return-Path: <linux-arm-msm+bounces-8797-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE7D840121
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jan 2024 10:16:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6E7B41F23198
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jan 2024 09:16:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2025354FBE;
	Mon, 29 Jan 2024 09:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Gohl4MEJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0228454F9F
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jan 2024 09:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706519804; cv=none; b=eIdypTwZZA+lHIJ49DVldMYeCW/x1KwgaoWXUcdkQbodtMgzaUY4e6u70k+qhOKzQHQlTOa91kv7ec1q89D168ek/Apqgql0EUGsEvSAjEINlHSy2I3K4QMcn8c7h2ZbD9MaAu6s9doiIrl7VIK6HqNiTn6Ec27E76VJS8iox+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706519804; c=relaxed/simple;
	bh=sfk9uxvNPIwk9f8d5iBn9m2N4nTZgMQFpRmAil1gnVU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OXFBzaBFfq0+Cjm9zs7+BszNrU1kAWMmZCUTmTqIQdTYqfwV1/tszbmMB7/1lwz/QP8s6kRBPEPkbLdU/q2i9+25EfXNAfNl6vj8zYzlZWhZ4ernz3jpoFxLZvsQDrdSdKyFI+Z07097yNm4VWaY6t4TxNeOEAJYEaG5CPPqseU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Gohl4MEJ; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-33ae51f8111so1049289f8f.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jan 2024 01:16:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706519800; x=1707124600; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=31dDSPmTEwAk2xBEYscYsgGP3NvqtS1pbeFP7C1NdB4=;
        b=Gohl4MEJ1wLaXfhRCstcd9o+zZYxyPCDy5wfkkf14TYL8eTUB6UPbT8obfYCtcrB07
         zXcu9CMHWqqEz3tMlBhpRbTS5MIeEF5ldMDfcjLJaggk5z2+LkXnzKQQQQC8lA2IQE3e
         H/IwbCIhZowWE+OvIc8Np/AQXQK+4uMF7ek94xH+t7F0RxFwTRrTCHmaMSd1dynpwTtP
         GTiroX3xCCjoTuucUfSfB1OAHMQviXQynWoBQDLE+PnRsNUXGij7J+7dfb9zvuv8MwH6
         1b3jjajbdkNbri8OC1k2M+WpfCaMlOE04Dcj5F3wOBZAIuxACRNTULMD6hHp4mbQHzYx
         Msxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706519800; x=1707124600;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=31dDSPmTEwAk2xBEYscYsgGP3NvqtS1pbeFP7C1NdB4=;
        b=m8rxwLn39c1kMftLoc67bEyOUoPUmBrFOir90wEeDGhFyKKuRQ9AJTbMd6SxsuNNdO
         ckQmRCvSUmuTZj8aMCOtjCy0yefPT5qqJH/j13prOH/Dp7Ptu9YV6PPcq94VVgkBQCUB
         f8s9c5s/RtDuU5JbTikYKAx+njVng4NRSMhmVDXYb+/ZRmFfaYB4PgPpCyXwOcwhk0S4
         v7bLxKkr13fmKcaIz75Rjt3O9qRLn2zsDAVFW+uiOIPZFWhlGb0Q8b3xo0hhOhPY1945
         fKaebB+p06MerRFW1kBkkl0OTfjseqYH1dGo6IJCSnX3t2L8kCZkTLd91Q5/RJ5PB0hw
         Z6hw==
X-Gm-Message-State: AOJu0Yw1JLFUZkwQ096ioXmgKS8njfuOyN/cXYPzvWixXBSnn6hx2eK5
	shdOmQBSRnXIiK4fVASqF+ULGcWS/8IO4DXjU0N9zv1e2vJDP+dYhNWQe9c3Bcg=
X-Google-Smtp-Source: AGHT+IH+eedCDhIoIGezbPQMLLaP+RRaKCkk22bZNI0sIzzYq+Mu4gSqDnNnJ7z94dcUpePMMobwyQ==
X-Received: by 2002:adf:a446:0:b0:33a:e6f2:4a37 with SMTP id e6-20020adfa446000000b0033ae6f24a37mr2588040wra.63.1706519800276;
        Mon, 29 Jan 2024 01:16:40 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id b7-20020adfee87000000b0033aebf727b2sm2818198wro.60.2024.01.29.01.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 01:16:39 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 29 Jan 2024 10:16:35 +0100
Subject: [PATCH v15 1/4] dt-bindings: input: document Goodix Berlin
 Touchscreen IC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240129-topic-goodix-berlin-upstream-initial-v15-1-6f7d096c0a0a@linaro.org>
References: <20240129-topic-goodix-berlin-upstream-initial-v15-0-6f7d096c0a0a@linaro.org>
In-Reply-To: <20240129-topic-goodix-berlin-upstream-initial-v15-0-6f7d096c0a0a@linaro.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 linux-input@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bastien Nocera <hadess@hadess.net>, 
 Hans de Goede <hdegoede@redhat.com>, Henrik Rydberg <rydberg@bitmath.org>, 
 Jeff LaBundy <jeff@labundy.com>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=3093;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=sfk9uxvNPIwk9f8d5iBn9m2N4nTZgMQFpRmAil1gnVU=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlt2z0gsr0SD/Kp48MRda2uW4w6aGAyHQFVSFBhvp5
 /2+B6HyJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZbds9AAKCRB33NvayMhJ0Ua5D/
 9QQuGi0utHJMhmHSJkz+xlzV2PQTRs2tsxXsj3lyBcSQW/Y1Pa3ewATPTDTpFReuqcpgTcmbHXVci8
 CS6ywQl5cZrKYNoRCCj8Woq1Kgn4760k1WHonfHVXusdeT7AaiXARktGN3M73LM7sfIOVzTThNTDVo
 WUChfV/I9ElVJNQNO42O5/PmoG6is0lgJDisjN4qTx21i0jVxFWaBqLT+KNiGgyqyiQMXogkkMaZDH
 1iFgeHkpEgo0aWpsvn7RfPIyqMZMNfbBLlAnRBBODwhP19Yr++IL4qixQj6WLbBVAnQFm7SftvNyxl
 zJ7jMjeebn+m9rlCe6b5etvv6IKGISuucxNn3G5C2u7X9lXo7Kdr9/ouwb7Dq+mG8d/TdJfQJYmpXR
 O7l4ziEYukqAs0fuRRo76TK9LkyyLFgKKWJinOG1pZ9zbLBK+0jDbIm7tgLPCyT1M65H0n4zKyoP1X
 WwK9qzSsm27Vd4swbsQGMwC50nzFqPV2AkLleTBw5F95BERWPDi2vtvG+7ESf9uywNj2i8jtfGuvc1
 6a2fkVA3PMMVwMtiv6IrczvM5r9zHpjKWwamruBx3Q2XSught7SD/eDA1S9q/5yz9UfBzZj7Tbjw6k
 J79Nz2k064GJRoyH9Kr6afNKs5cRTh1VMSEymWgMp9DLQQjf6KXEzedvI9Iw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Document the Goodix GT9916 wich is part of the "Berlin" serie
of Touchscreen controllers IC from Goodix.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../bindings/input/touchscreen/goodix,gt9916.yaml  | 95 ++++++++++++++++++++++
 1 file changed, 95 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/goodix,gt9916.yaml b/Documentation/devicetree/bindings/input/touchscreen/goodix,gt9916.yaml
new file mode 100644
index 000000000000..d90f045ac06c
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/goodix,gt9916.yaml
@@ -0,0 +1,95 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/goodix,gt9916.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Goodix Berlin series touchscreen controller
+
+description: The Goodix Berlin series of touchscreen controllers
+  be connected to either I2C or SPI buses.
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+
+allOf:
+  - $ref: touchscreen.yaml#
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+properties:
+  compatible:
+    enum:
+      - goodix,gt9916
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+
+  avdd-supply:
+    description: Analog power supply regulator on AVDD pin
+
+  vddio-supply:
+    description: power supply regulator on VDDIO pin
+
+  spi-max-frequency: true
+  touchscreen-inverted-x: true
+  touchscreen-inverted-y: true
+  touchscreen-size-x: true
+  touchscreen-size-y: true
+  touchscreen-swapped-x-y: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - avdd-supply
+  - touchscreen-size-x
+  - touchscreen-size-y
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/gpio/gpio.h>
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      touchscreen@5d {
+        compatible = "goodix,gt9916";
+        reg = <0x5d>;
+        interrupt-parent = <&gpio>;
+        interrupts = <25 IRQ_TYPE_LEVEL_LOW>;
+        reset-gpios = <&gpio1 1 GPIO_ACTIVE_LOW>;
+        avdd-supply = <&ts_avdd>;
+        touchscreen-size-x = <1024>;
+        touchscreen-size-y = <768>;
+      };
+    };
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/gpio/gpio.h>
+    spi {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      num-cs = <1>;
+      cs-gpios = <&gpio 2 GPIO_ACTIVE_HIGH>;
+      touchscreen@0 {
+        compatible = "goodix,gt9916";
+        reg = <0>;
+        interrupt-parent = <&gpio>;
+        interrupts = <25 IRQ_TYPE_LEVEL_LOW>;
+        reset-gpios = <&gpio1 1 GPIO_ACTIVE_LOW>;
+        avdd-supply = <&ts_avdd>;
+        spi-max-frequency = <1000000>;
+        touchscreen-size-x = <1024>;
+        touchscreen-size-y = <768>;
+      };
+    };
+
+...

-- 
2.34.1


