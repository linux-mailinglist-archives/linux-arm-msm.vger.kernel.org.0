Return-Path: <linux-arm-msm+bounces-25351-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65BF49285BA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jul 2024 11:53:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1CB20284DC2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jul 2024 09:53:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5508014A0BF;
	Fri,  5 Jul 2024 09:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WLZl4qvL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EAE3149C58
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Jul 2024 09:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720173128; cv=none; b=Ca3gj9GmYmLD3Olrutp72HyBbPryukmL1FvcBe7o+YY1z8MtyT3Zp9ILO7gXbKm4lBwVjiwCUiwVCyGtfReR4BBqRrpU/Qd97y9Sphx9Rdk580Nz4JeHqMn52Yl8Geu+7NsjVYqJK4ja5dzV/szxmYGg6UFUAG0rZB7tneBNsc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720173128; c=relaxed/simple;
	bh=0fSb5xqcGi4HKz3CDANpHnfXYtl8RCvr5qhaTQ5S2P0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JV7j/TjH3IgxuXS1gLuhoS2sXFWKGTrzTI+Ff8ZSiHdXXXm/Aw086IKpQ5hnlPcH9xYikCjw374fU2D6VfNqnjaCxwDoKb3B7+gVZN//Oos2pAvTo/KPpvxqKCcmWmfxvnqdwGEHmn8RTEgHI1f20/vtCSPh/fSql/t6Sg0Vkf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WLZl4qvL; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-425624255f3so9112255e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Jul 2024 02:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720173123; x=1720777923; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GzjIIKaoQE5SHKk2q2uAy6nqX+WGU4NAuF2D0sAZ4sQ=;
        b=WLZl4qvLy90WwQXQ2yVLfo5/sJ73stG+g9o6/L5OT9SQlBZparNNH9opjJzaeVApoK
         KJN+mDT8JVjitS6CrmvenyHCl3M2qCPupVcujQtYZfp8xFIPs/2627e1yNK3ZwsmVJKS
         n9sdlgjILYpblWhDAOy6UqZeDX1vDI1wJwzrSTkYwDWwwnWiSV6Hj9StSgLtuS9CZQGG
         wt+NdKrT8VGtP5M1iA2/VPgwwoo5ADPnqg0KYh4SK+s9LaoplIcjmQeegUU266PsIe49
         s6d5o9sT5PhG3aqXzJB/5veqUJOEIDs8+D7F2Gja4y6TREmw0vJMONVuca86VihbfiW8
         UqeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720173123; x=1720777923;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GzjIIKaoQE5SHKk2q2uAy6nqX+WGU4NAuF2D0sAZ4sQ=;
        b=X4Fi8euMBzmH1OGSanukjljgB2bjFn3XBpNOfZP5p+ittgxz/dQio9TEw1LK0tHv8Q
         xUhYv8YxQ4QW/xVSDoXhqcO2pwxDIWPSSzaxhXLL8aFtFOEb6zDyoe85G/x3X3kZyh41
         A2SQ6M13YL2c6pBM7oA0tjgS1SvC+H8l7dKohr3hPHa5aNDq4rHGlOpQP/9iBE1/VdJG
         64VVgQe8aw0tai1sQbVhFNynxU38JNiqIow25DFc6DJnT1dUwUKc4BskArkvASnU5uFN
         77XX0KSZnwJYgepre83jBwCc8LBX0t+dErWYlAWVkKPhEl97VOyzgNFAyRGMsa51rkRK
         gvJA==
X-Forwarded-Encrypted: i=1; AJvYcCVeZWLy09+fg8nM0LmyZppaHD0HXtyUAB0uB9cxU99i/x5u54R+8R0re4A/nlIVOEqIsj8Q2UDAQfTE7PCiFH5oRguWB+QooaBz9Vohow==
X-Gm-Message-State: AOJu0Yz2GmJwSmNvgoQ3+FFbRJqhMXsALXkzn6uhZBi81H/925gZ4mLg
	q5LapsmwgVnKWkGaPrrf/Nyh1qf7xwVnoN/Ar7YQkjdNK6zhcK1+YMX00lEcWgg=
X-Google-Smtp-Source: AGHT+IEQcA20h38s2g6Ses3CSWYigWtghZ46X0AMmLlWuAFBEueee78GxaQQ7J8Wp1trOqfa0lXIHg==
X-Received: by 2002:a05:600c:2d16:b0:426:5b52:84fb with SMTP id 5b1f17b1804b1-4265b528599mr450995e9.7.1720173123637;
        Fri, 05 Jul 2024 02:52:03 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d1650sm55528995e9.2.2024.07.05.02.52.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 02:52:03 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 05 Jul 2024 11:51:24 +0200
Subject: [PATCH RESEND 05/22] dt-bindings: thermal: generic-adc: reference
 thermal-sensor schema
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240705-dt-bindings-thermal-allof-v1-5-554061b52fbc@linaro.org>
References: <20240705-dt-bindings-thermal-allof-v1-0-554061b52fbc@linaro.org>
In-Reply-To: <20240705-dt-bindings-thermal-allof-v1-0-554061b52fbc@linaro.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Zhang Rui <rui.zhang@intel.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Guillaume La Roque <glaroque@baylibre.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, imx@lists.linux.dev, 
 linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Florian Fainelli <f.fainelli@gmail.com>, 
 linux-rpi-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1284;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=0fSb5xqcGi4HKz3CDANpHnfXYtl8RCvr5qhaTQ5S2P0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmh8Io7vHh9SbWP804f84WKaCS+gN67JOZDpJ41
 c7gdcSv29+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZofCKAAKCRDBN2bmhouD
 1+8WD/9874fMQJU7KMpw+RJkf1AXrSErvGZqp1YNJWcmDsOz+1Tp2k35XRBfCNDd4nDARTBW6JC
 /Xr357TKiY69Zpiz/6IcOBOXOrbsS+3sovbC8/+gW/BhEBaSTTXtHv6KmSkXSD/Nz0AlIYhZUQT
 AbIefNplxTDpH/VzarDlGXQfXRb43L6qdntvnUaECYnMZtahhPE2ejNg/PT7hEBY4GJZwwQQw2q
 uwXWuOGuU6JW/1Nrjk36mNrl0gb0RXhvPTfCp5uF9+iAwWKfwuIUN5WJUj0+jRNrJLwLjDBQ5EO
 U9xpRjZnhahvHyOAuFjy4loDCHA7X1galk/JwSl87mAZLVUaQo1uu7EfhC/8z/eyOtnDlPZePV5
 yf6clqtHUvhyzXnMnzqY4AegFT94QQ3x7RYMClqZGB6DzPFaDUqbuOtp9OUmhOyyNRfPnfG/lVH
 84Q01sbbgVEq7fUfcG7ckbBBr9FVxuTkSSLkdwiVjlzUcby0YT4gZ6ZEceVL6qEr4G2ft8xvnYS
 t1tyYn5KC0qS5ag4npu4NQUCZJ0fW4yol49RHj7Haxf5nrLnMcLD8KIwdGi16A74pjmP4JdmuPP
 fLFzRTf3fo6D6ftg7zQmYHZnAiuFZDmyEhvuBRZRo4qJTJ4bx8zqTE/LMpApxQJXMYaFm9iyj6j
 gteb/K4P/0ftdsw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Device is a thermal sensor and it requires '#thermal-sensor-cells', so
reference the thermal-sensor.yaml to simplify it and bring the
common definition of '#thermal-sensor-cells' property.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/thermal/generic-adc-thermal.yaml | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/generic-adc-thermal.yaml b/Documentation/devicetree/bindings/thermal/generic-adc-thermal.yaml
index f1fc3b0d8608..12e6418dc24d 100644
--- a/Documentation/devicetree/bindings/thermal/generic-adc-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/generic-adc-thermal.yaml
@@ -15,6 +15,8 @@ description:
   sensor resistor. The voltage read across the sensor is mapped to
   temperature using voltage-temperature lookup table.
 
+$ref: thermal-sensor.yaml#
+
 properties:
   compatible:
     const: generic-adc-thermal
@@ -44,11 +46,10 @@ properties:
 
 required:
   - compatible
-  - '#thermal-sensor-cells'
   - io-channels
   - io-channel-names
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.43.0


