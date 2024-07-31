Return-Path: <linux-arm-msm+bounces-27553-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 919EE943340
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 17:27:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1EA301F262F6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 15:27:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 951CE1BD503;
	Wed, 31 Jul 2024 15:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jfYV8nqR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D249B1BD034;
	Wed, 31 Jul 2024 15:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722439575; cv=none; b=K9HvJtASY88LjzhP7finGy/1v/VkZt+TJ9rI0GyY7bDt0huhM8dCpOMw+DXxfG0XRvlleOZ+4zdzzbGtBPWtQdOWyOfAHr6wWp1A1F93rc9e+0TJaiccHytHbt7Io0vHYULCcBaB1MMPvNQFrIxrifIrwSnveNW2FK0Yg4n64Tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722439575; c=relaxed/simple;
	bh=ub3FOT3N4vnIxLUsFS2HSpg9K4GlOZ+9OZbF4CeT7Fo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uh5bjDt1Vgkq82bG8HtpCPoeCJp7PpgMmSFZDYQxdteruSF9Wv97Wy09E7P28NRx+56TglY2r3pJp3hwTw58kGhOu3ggi0fFLii/zIh7QEj7vrm8Ecfi+srXLMfPGvjItfVtB97QPFKuzYR9aiUEXYOvMf2tcHfFl9I/vTU32Do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jfYV8nqR; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4281e3b2f72so28813775e9.1;
        Wed, 31 Jul 2024 08:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722439572; x=1723044372; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+1Cyu5R+oW5fffURVcJfSnNMpwp4wHNtRUsf1XeMFf4=;
        b=jfYV8nqR6U92Sde3OCgCuqRcRI7zowIv8ByB2apWqo7/FdyAuZrIX37gjjNSlDOK5l
         cfSwtiu17JwUxpv7625AWpvlnCxJnVm2Ur7s/jpu/SeH3ZLR68MaflhjPdFr8kSjWPjO
         iy6bDJRsVjyO1zv6Mbt5hr2n9ZwGcQtaPcly0R3b0WmKwVDjbVdF9xLOyX5r2yPz5nuv
         ZPnTEwCCA/0A43bSifdKLBNg3si252C14AFIn4cKWmXnjFxOZ5o9ohEuJodjM6pE01js
         SR2kvTJLSwnledjQhXUA9irtKSSokW7hYY49jJAg2+8Ir0mji+yeCQeum19USl6vLncD
         zYrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722439572; x=1723044372;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+1Cyu5R+oW5fffURVcJfSnNMpwp4wHNtRUsf1XeMFf4=;
        b=dPE6Wxf889N6PqFQG6FpwF54iGHGzfT/1Qgo1ouEJCUxxtH7AZeXMqUJIshTeBihfW
         g43tIONPwm5dB3qAbaU/p+7TeYKDtRor0rsYpF3NBEZRVIYVJIivo5KVAp3rbAOXl89D
         5gC19gQkw0w8QNUEqUz+ezYbT6asE87liBpbPwNjCI33IECBabpUiYP6wegb2bg+/FrL
         UATxZ58x2w5zxFNFN5zd1xTfGRL+ZfzQRyMG/TO8ubCpn4zTJ55yIApsOVOSj+pZcCnn
         0b5iZaKRC03JbV7mBegFEoXFf9yhwJtgWfAihWso/7ExsbP9AC5Y0hNbty1QLcGkKoMw
         xkeA==
X-Forwarded-Encrypted: i=1; AJvYcCVCOy2Dfr8XjD+bqB4wLCQsfnrxc2Likr7uyQxt+GZeiSRlr/TbrZNpxT6O9L5zH3H3jSzKHpaNCNonqPNpudlXL4cRKnY5sUqplvJV+gp43BsVMcIV23zEoJatw4RG3cAwXUYS3GPr/MO0DmH+84S3EN3zOuQBMOzK2hA0XZhJosCPaNtISBO54815uthiIywLSSEVO8skS8nq9PrJmSh9FgfqDQ==
X-Gm-Message-State: AOJu0YzXCjP5yHeTHoXigq1ddp5eXSEMJAAOSURn7grNhczaH3Hsrf/X
	TrEFJVTIMI+4qoY+H5gQc+/klInePCKyLB0gjtIw8u+YxfOBBujBvs1UuQ==
X-Google-Smtp-Source: AGHT+IE4tWC1HMsu8ewKdcCzKf9d3rockdZHaoPstllb0YXHMBWMItwOq1au+xKA5f8sl27YWu529w==
X-Received: by 2002:a05:600c:3547:b0:426:5f8f:51a4 with SMTP id 5b1f17b1804b1-42811d89f99mr87663815e9.12.1722439572060;
        Wed, 31 Jul 2024 08:26:12 -0700 (PDT)
Received: from [127.0.1.1] (byv161.neoplus.adsl.tpnet.pl. [83.30.41.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4282bb64755sm25430985e9.36.2024.07.31.08.26.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 08:26:11 -0700 (PDT)
From: Adam Skladowski <a39.skl@gmail.com>
Date: Wed, 31 Jul 2024 17:25:29 +0200
Subject: [PATCH v3 5/8] ASoC: dt-bindings: apq8016-sbc: Add
 msm8953/msm8976-qdsp6-sndcard
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240731-msm8953-msm8976-asoc-v3-5-163f23c3a28d@gmail.com>
References: <20240731-msm8953-msm8976-asoc-v3-0-163f23c3a28d@gmail.com>
In-Reply-To: <20240731-msm8953-msm8976-asoc-v3-0-163f23c3a28d@gmail.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Stephan Gerhold <stephan@gerhold.net>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Adam Skladowski <a39.skl@gmail.com>
X-Mailer: b4 0.14.0

Document MSM8953/MSM8976 QDSP6 cards.

Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
---
 .../bindings/sound/qcom,apq8016-sbc-sndcard.yaml   | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,apq8016-sbc-sndcard.yaml b/Documentation/devicetree/bindings/sound/qcom,apq8016-sbc-sndcard.yaml
index 6ad451549036..43db5ad65d75 100644
--- a/Documentation/devicetree/bindings/sound/qcom,apq8016-sbc-sndcard.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,apq8016-sbc-sndcard.yaml
@@ -15,16 +15,22 @@ properties:
     enum:
       - qcom,apq8016-sbc-sndcard
       - qcom,msm8916-qdsp6-sndcard
+      - qcom,msm8953-qdsp6-sndcard
+      - qcom,msm8976-qdsp6-sndcard
 
   reg:
+    minItems: 2
     items:
       - description: Microphone I/O mux register address
       - description: Speaker I/O mux register address
+      - description: Quinary Mi2S I/O mux register address
 
   reg-names:
+    minItems: 2
     items:
       - const: mic-iomux
       - const: spkr-iomux
+      - const: quin-iomux
 
   audio-routing:
     $ref: /schemas/types.yaml#/definitions/non-unique-string-array
@@ -106,6 +112,27 @@ required:
   - reg-names
   - model
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,apq8016-sbc-sndcard
+              - qcom,msm8916-qdsp6-sndcard
+    then:
+      properties:
+        reg:
+          maxItems: 2
+        reg-names:
+          maxItems: 2
+    else:
+      properties:
+        reg:
+          minItems: 3
+        reg-names:
+          minItems: 3
+
 additionalProperties: false
 
 examples:

-- 
2.45.2


