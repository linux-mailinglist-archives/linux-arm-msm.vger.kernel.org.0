Return-Path: <linux-arm-msm+bounces-17336-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A65E78A2FEB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Apr 2024 15:53:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 10114B24554
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Apr 2024 13:53:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A00A8593A;
	Fri, 12 Apr 2024 13:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K3UGL19g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C81DE8564A
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Apr 2024 13:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712930010; cv=none; b=pQ1+URxKhti2ZnZtuNUZMFxyagkSCu9d2hrKfUJl8SxtFP/wJOv7i+e1PU4owbz63hGQr10Xo0NkchklPJ7M/w6IAZmHr9LlZDCmrM8qwYJ2kKxePNRYo28PDwbgLsFUgARsxgRC5flnM90TqYgx10ro1JZvbg7AcnOrGjKra14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712930010; c=relaxed/simple;
	bh=iGOYThuLmTpzb3Utxn5kuIV3NqKWOFg7MoLvVpWZBbw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=F533vOTETJ75dH4iZat7ZpiiASHgkcG54UCIckiwXjMy6IzLXtZDctas3oiLADrWLtzdVknNSAv20+5QWHVyZFLDYtaSxnk6jZmQDn91PD5AOTvvFognRnx6ROFJEoYjjxyGu8TUse6/0NZFEAodobvFaVN7D7OCJ4mRRyabTqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K3UGL19g; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3458b699d6cso433830f8f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Apr 2024 06:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712930007; x=1713534807; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CnwqkibrxM7stLHpO8eWZ/pH05GDjY5J+7dkB5B9riY=;
        b=K3UGL19gFZy8qbcs5tEg++HkdG6MqsYsWIsAfZ+wfJ1TIuhe1fzBRI3aZnU9mUu8PY
         VAK8RP2nEgMUs5sS/Xx1g3gfyRgnzjnwQhmk0GrbPB0M2H56HrKTDzyFQUOUVURWBGx3
         zNDhCstqpODx4q1LHf8Rwjc3X77A9EQHn4JOlKoORQ8KWuOXBT3ClKm6KyBqNlj+tXO2
         gCa3fEYWFfYbR0xYAo4RIVirfnwQcElPELGnrw+rTJUXBSN2vuEUHqHAd201ypVoNgQ7
         x7r3+m1sX2igwdWyZ1mRfgFoFYd4Y2Qj7JGkBIVJ7j0XRlvTqLPWBwYhMwAGRCK4/ldd
         MzuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712930007; x=1713534807;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CnwqkibrxM7stLHpO8eWZ/pH05GDjY5J+7dkB5B9riY=;
        b=KLHApS0o4M9tEs9SpWunlw999JDNGuUVR17J7V3WI+K6nhPrRGMsLd4lFRWUFpOosB
         e9CNu7gKH7w1AfvYo6sgJ4pKIx6PBMQ3yH2yv6NKMQh14oTMNKr3K0TUUS1t8HRMa7Ep
         DRtYXkJ55n3bhXd6CiQVXSOlf26Qs0vPj0Exjafd7jDQSA57nZ/vEAfd6j7Qu5VbWIJy
         w3JhiZn4ga6eTNNtJ/+AGZtB1QtEPIA6+Ghv84RFC3+vwBesbCRaa+FdVfdGR1fVzFaY
         rf+XquWJBBz77XQ3QS+YsPFVvUJXXIn9sIWLxK6pgLlkcj1H8Ca1pyIpVKYQ1krGhqqx
         BUvw==
X-Forwarded-Encrypted: i=1; AJvYcCXyGACoFXd+ZXcUCEUo9J7bdzLldCnG8etTZfgV4Jm2WbuRW+83XAOgEHdMGNHZBJMbMDC8p+bfM4tyC2IXKonM2PhGYrPapZkVha5aeQ==
X-Gm-Message-State: AOJu0YxudFx/S3VKocrRXzXO8JlY8IuprnETGrtfw8PIEcdr4ewVX1ie
	MzSgySBlSICAa7P9TU4zsJwifJNK22MTz1UjX3zc/txBD1hmD7Sr2efxq+LMqIA=
X-Google-Smtp-Source: AGHT+IGdbKal5eg4HHJJ5LTvNAhmcUz8lIulEbWZRD6lhJ9ZX2jWJVpnS5+KyYZ1PxxKUq7i0HgG5A==
X-Received: by 2002:a5d:5482:0:b0:347:2077:53f2 with SMTP id h2-20020a5d5482000000b00347207753f2mr775710wrv.2.1712930007134;
        Fri, 12 Apr 2024 06:53:27 -0700 (PDT)
Received: from [127.0.1.1] ([176.61.106.68])
        by smtp.gmail.com with ESMTPSA id h18-20020a5d4312000000b003455e5d2569sm4423521wrq.0.2024.04.12.06.53.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 06:53:26 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Fri, 12 Apr 2024 14:53:25 +0100
Subject: [PATCH] dt-bindings: i2c: qcom-cci: Document sc8280xp compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240412-linux-next-24-04-11-sc8280xp-cci-compat-string-fix-v1-1-7dbafff36932@linaro.org>
X-B4-Tracking: v=1; b=H4sIANQ8GWYC/x2NwQrCMBAFf6Xs2QfJmkP0V8RDWbd1QdOQRAmU/
 rvB48xhZqeqxbTSddqp6NeqbWmAP00kzzmtCnsMJnYcXPCMl6VPR9LewAEuwHtUiRxdzxAxyPb
 Oc0NtxdKKxTqUeXZ6UYnnhUY4Fx36P73dj+MHFiMxS4QAAAA=
To: wsa@kernel.org, Loic Poulain <loic.poulain@linaro.org>, 
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14-dev

Add sc8280xp compatible consistent with recent CAMSS CCI interfaces.

sc8280xp has the following clock list and so requires its own compat
string and sc8280xp specific clock definition in the yaml.

- const: camnoc_axi
- const: slow_ahb_src
- const: cpas_ahb
- const: cci

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
Initially I added a compat string to yaml and driver for sc8280xp but, it
was incomplete and wrong so I asked for a revert.

Subsequent to posting the compat string I had posted dtsi changes to
sc8280xp to add in the CCI, forgetting to follow up on the compat revert.

I then completely forgot about the compat string and worse still
misremembered the whole reasoning behind it.

This one patch series cleans up the mess.

- The fallback compat qcom,msm8916-cci hooks the driver.
  Since there are no driver changes specific to sc8280xp we don't
  need to add yet another entry to the CCI driver.

- The compat string qcom,sc8280xp-cci is additionally declared in
  the dts -> compat = "qcom,msm8916-cci", "qcom,sc8280xp-cci";
  The sc8280xp-cci will match the yaml and enforce constraints.

- The yaml entry for qcom,sc8280xp-cci constrains the list of
  clocks which is specific to sc8280xp-cci

Result:

- No new redundant compat string in the CCI driver

- DTS is unchanged

- YAML expanded to capture missing string

- BOD suitably contrite

Link: https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/linux-next-24-04-11-sc8280xp-cci-compat-string-fix?ref_type=heads
---
 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml         | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index f0eabff863106..daf4e71b8e7f9 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
@@ -26,6 +26,7 @@ properties:
       - items:
           - enum:
               - qcom,sc7280-cci
+              - qcom,sc8280xp-cci
               - qcom,sdm845-cci
               - qcom,sm6350-cci
               - qcom,sm8250-cci
@@ -176,6 +177,24 @@ allOf:
             - const: cci
             - const: cci_src
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sc8280xp-cci
+    then:
+      properties:
+        clocks:
+          minItems: 4
+          maxItems: 4
+        clock-names:
+          items:
+            - const: camnoc_axi
+            - const: slow_ahb_src
+            - const: cpas_ahb
+            - const: cci
+
 additionalProperties: false
 
 examples:

---
base-commit: 4118d9533ff3a5d16efb476a0d00afceecd92cf5
change-id: 20240412-linux-next-24-04-11-sc8280xp-cci-compat-string-fix-e22a0e9ec83f

Best regards,
-- 
Bryan O'Donoghue <bryan.odonoghue@linaro.org>


