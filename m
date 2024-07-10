Return-Path: <linux-arm-msm+bounces-25835-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A5792D0DA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jul 2024 13:40:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8FA9C1F243F3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jul 2024 11:40:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 645AF190688;
	Wed, 10 Jul 2024 11:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bSdt83b+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 192A319048F
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jul 2024 11:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720611594; cv=none; b=UABOR4wvoO7DgWHDzCHIHocZ0EHVW6sB+GGNI3O7Wtx5ffDb+03QLtox5y30v+OZRFbf8HBApiD6Qos8u87YXFdL2rWcUTDrOVujhwIzkys7I05asM8C6a4KnARAj6O1FUC2ehiKwP7o9BgZIQXThaRwDkH35CUVyOnUBEL4JiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720611594; c=relaxed/simple;
	bh=kXcXQlQw8cCu7vUhvQQqw7fNx9k+D9plQJiW4hesxaI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jrQTLKAwoyIHFYppCIiEF4gR1yktWIieci/sw63U+WNiFa3/nu1AUV8XANKxGI+iYtusmZ9C4zuyng3JWYGJ455R9tJ9+wijKQN4/mky2qxXMv1ICXfeMe1zrahrQaqffA5gHL3/Su15tp9lhhnLLGOHoIr5i/NxqOWEne+xE6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bSdt83b+; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-52e9f788e7bso6443516e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jul 2024 04:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720611589; x=1721216389; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lrw0KmyxDKt0z/+5CdGnxoQjpcekSUdd2Exq++60Pok=;
        b=bSdt83b+STqv3sRkm97i6CNTLb5vmyIPPBOtsDdCeR9q504OtYvtUZpnjR43P6rpQW
         QAKQGboF/VDP7rEtJ2hO307qIW7qFcTaQzOiqM1Yv6Q/lqFaa67Cu3RB+5RnPr4/Ey/T
         3BFXhJP4/k/B226e01Ve03cAXIZsoH1efsb56+VHOh3wNF60vZUwGm0MoaofXw7Pkrmt
         SzCQh1LFyalLhqpZsptgfkRM3vYiK736Ktu+nflInnVeg3jZC335nISUbCn/xJdK2D1V
         zAzsX9+VQEOPdGSJady+UoCoHQPirJgDQZPhMazvZROwz3SOKemvlMPdWcUR/4ttnfCo
         v4xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720611589; x=1721216389;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lrw0KmyxDKt0z/+5CdGnxoQjpcekSUdd2Exq++60Pok=;
        b=Bq/kYa8iZj7kT2N0Y3Fu3R2JRxWlK2mZ5ybUhgnNrto6d8icLB7nbEfwAwo2bfr1kD
         0D57Vti/vSw9CDNA290cRK5ZKFD9JaLI+nqCiFFB/ntJi1wKVrw+j7mo7daJSg0vYwtF
         MIQUk/OaGy3lsxCGFUGLuZSCjdhVA601ajYHiK3hxtdpSOUfqBMQOvnFaLmRfJSzzgwl
         0kg8szzhPFPu2c5L05z+U/etxvkE7gZj3AmoheiSCMeSHjyxno+seFz4WNY0UTw/S/b3
         niQcy4JpqDJ4InqR1czEoGUdSGQxDszUp4cbdD4o/UORbq4Le/paJ1HixgHx1r3kK5F2
         yG4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWrn6wQWEyDwFpW3LF5XFkrTDgM30TTAH9hGkZ9CgHXmr0J7PIdbcGMcupeglpJ4SSlqIH+Gx8iVHtfGABetlbkPTT4gWuwJcouFLM1QQ==
X-Gm-Message-State: AOJu0YxwJ/jQUPs17s3xJ597XcK5oV6m93SnRLP4SbNfJcDcD7r/cl4f
	gOo5AFkelXPdSMAsP9NJgCl7mfQig/AUVNtIALa+1TAs9lkwprb5BR2EOXCIEsc=
X-Google-Smtp-Source: AGHT+IGCIfQQFWizC9oYA0R7wEwIwKOXXTqvLbF5U7LfpTs+Ls/Zyvmg+QDt0ocqWOmzblGuzvrQSA==
X-Received: by 2002:a05:6512:b0b:b0:52c:a724:5ae3 with SMTP id 2adb3069b0e04-52eb99cb0admr3854086e87.51.1720611589220;
        Wed, 10 Jul 2024 04:39:49 -0700 (PDT)
Received: from rayyan-pc.broadband ([2a0a:ef40:ee7:2401:197d:e048:a80f:bc44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4266f7361b5sm78602875e9.29.2024.07.10.04.39.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 04:39:48 -0700 (PDT)
From: Rayyan Ansari <rayyan.ansari@linaro.org>
To: devicetree@vger.kernel.org
Cc: Rayyan Ansari <rayyan.ansari@linaro.org>,
	alsa-devel@alsa-project.org,
	Banajit Goswami <bgoswami@quicinc.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 1/2] ASoC: dt-bindings: qcom,msm8916-wcd-digital-codec: convert to dtschema
Date: Wed, 10 Jul 2024 12:36:06 +0100
Message-ID: <20240710113833.39859-2-rayyan.ansari@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240710113833.39859-1-rayyan.ansari@linaro.org>
References: <20240710113833.39859-1-rayyan.ansari@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Qualcomm MSM8916 WCD Digital Audio Codec bindings from text
to yaml dt schema format.
Make bindings complete by adding #sound-dai-cells.

Signed-off-by: Rayyan Ansari <rayyan.ansari@linaro.org>
---
v1 -> v2: removed unneeded minItems, added ref to dai-common.yaml

 .../sound/qcom,msm8916-wcd-digital-codec.yaml | 55 +++++++++++++++++++
 .../sound/qcom,msm8916-wcd-digital.txt        | 20 -------
 2 files changed, 55 insertions(+), 20 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,msm8916-wcd-digital-codec.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/qcom,msm8916-wcd-digital.txt

diff --git a/Documentation/devicetree/bindings/sound/qcom,msm8916-wcd-digital-codec.yaml b/Documentation/devicetree/bindings/sound/qcom,msm8916-wcd-digital-codec.yaml
new file mode 100644
index 000000000000..a899c4e7c1c9
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,msm8916-wcd-digital-codec.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/qcom,msm8916-wcd-digital-codec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm MSM8916 WCD Digital Audio Codec
+
+maintainers:
+  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
+
+description:
+  The digital WCD audio codec found on Qualcomm MSM8916 LPASS.
+
+properties:
+  compatible:
+    const: qcom,msm8916-wcd-digital-codec
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: ahbix-clk
+      - const: mclk
+
+  '#sound-dai-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - '#sound-dai-cells'
+
+allOf:
+  - $ref: dai-common.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-msm8916.h>
+    audio-codec@771c000 {
+        compatible = "qcom,msm8916-wcd-digital-codec";
+        reg = <0x0771c000 0x400>;
+        clocks = <&gcc GCC_ULTAUDIO_AHBFABRIC_IXFABRIC_CLK>,
+                 <&gcc GCC_CODEC_DIGCODEC_CLK>;
+        clock-names = "ahbix-clk", "mclk";
+        #sound-dai-cells = <1>;
+    };
diff --git a/Documentation/devicetree/bindings/sound/qcom,msm8916-wcd-digital.txt b/Documentation/devicetree/bindings/sound/qcom,msm8916-wcd-digital.txt
deleted file mode 100644
index 1c8e4cb25176..000000000000
--- a/Documentation/devicetree/bindings/sound/qcom,msm8916-wcd-digital.txt
+++ /dev/null
@@ -1,20 +0,0 @@
-msm8916 digital audio CODEC
-
-## Bindings for codec core in lpass:
-
-Required properties
- - compatible = "qcom,msm8916-wcd-digital-codec";
- - reg: address space for lpass codec.
- - clocks: Handle to mclk and ahbclk
- - clock-names: should be "mclk", "ahbix-clk".
-
-Example:
-
-audio-codec@771c000{
-	compatible = "qcom,msm8916-wcd-digital-codec";
-	reg = <0x0771c000 0x400>;
-	clocks = <&gcc GCC_ULTAUDIO_AHBFABRIC_IXFABRIC_CLK>,
-		 <&gcc GCC_CODEC_DIGCODEC_CLK>;
-	clock-names = "ahbix-clk", "mclk";
-	#sound-dai-cells = <1>;
-};
-- 
2.45.2


