Return-Path: <linux-arm-msm+bounces-25353-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 801019285C4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jul 2024 11:54:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 061791F211B5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jul 2024 09:54:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A5CE14B064;
	Fri,  5 Jul 2024 09:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aMOWb6uw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC95714A4D6
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Jul 2024 09:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720173131; cv=none; b=WRUh4hyA80KL0uaZ0JPcAUIaLOxEnCmqmBg4/0LIEkYvrOJnz8JSsUZOR61D2lIpcoVyRKQFKzIrhUB83sdqXODfa9B+wyyjYRop/TN0GBTeCMCZ0XByLcwMehyLK/wSTJ3XZmjm3B1Nx952hMjwUsVLfIpMprhEFcIGmz3ZU0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720173131; c=relaxed/simple;
	bh=QKjpJh+Itd3QaOkFhOLn7jTwV0XWHXFDHrlmhcmh3kM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fjB9dRYFR0UcxHWh6z4Ycvz34vWB82cXgzVnRQGKhcCwe66iwjdqEsb5HXL6xx6/3NCdT8aG/mVaBxh71HjIB1WwqMxid8gr81yp2++3pI8ehEfrkPmHQ5Gp2P9SAtqQA48qe6c73uChJH0BB8+akQ4cu2b1hiAg/U3lZtWzIEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aMOWb6uw; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-424a3ccd0c0so9756505e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Jul 2024 02:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720173127; x=1720777927; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=seWL/Q2TgrdgNLDovxUhy7BtlcsTJg8tyEapQN8crDg=;
        b=aMOWb6uwrTz7ifEAGA09do4W+02BEDBKbjRRW6ozugGE+oHXWUjbabfMIXlvU635zd
         95x4kYz0hwLnbrmcLqX4Tjhnzk2yyPKyHY+Rcu80HaDhJdyDHH3qviI2qT1Xrdk8SNrh
         nB5gKNMMoqwBTh2Fu0WEpZNyzH+bOd90e/kHWHfunEn51HDcsdz724+RiZxD4fvzOxYY
         lde7netvL8zzLfQHmjoKASO1hISJE32grAnjuAZ33j80xFCQ2oOneKgxODsm3FPkjvO2
         3ZEuNYBuTZ6VOMbG1UDjRTNeTX7nEolxx31ns9HViT+1StKqCDhwSLKiSoHIQ0OxOtdn
         klbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720173127; x=1720777927;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=seWL/Q2TgrdgNLDovxUhy7BtlcsTJg8tyEapQN8crDg=;
        b=Av5E9O9Un5IYbCRhOhrvgbw1NkJgYR3fBWHRYBhlkafvhrFhk/JxdI882iMSd3z8Ks
         PcITp6m8HmhmHof/iBSEXHThevYYv8VZIETzIbLAd+ec8BmCbLkgD1J75skq5776BCY/
         6bmBdn9D0hgfo3r+RkSbYxIeSddekoPOHNh9+RgcewT5qK7/upDFuI7HTAxNCqR/HkC4
         HoA+T8NXl4twHqU6a0Rff5+1poBRgBF4prMTzsAlBfACFkuJUxxkK6+/2Vx2jfQI7nmG
         fmR+giBa6++V8xP8+GWH3McerrcUoBw7SJDC3prBJFRNBTy5s5Lz5lxB0mlPMkJBW6pB
         verA==
X-Forwarded-Encrypted: i=1; AJvYcCUkuE3C3cVuk6TDmfE8eppBLRkKKXCg2aMR3Ag5GeE6PtzDa6Wt5kGML86bgvV3AqoIjVoiiuAB/rqp5wHNvgLTF6iakjCtRCbL3ARjiA==
X-Gm-Message-State: AOJu0YxwE6Zrvasi1Jdacw4xXdHk1XHMbZ9gLAu2VCzYnaktTZfXMYaS
	tB7+0+sIrual4DWnlzGSgh25HjuAeyB0oKXsLB05bmjjY47QAuaMScZfeolQvrM=
X-Google-Smtp-Source: AGHT+IGEBHhLfiMr4qIm0/R1srxej0F/0qrIH1OjbeGblDEv/7r/CMhXzzm2X9XH36l/SG/1xVNGXg==
X-Received: by 2002:a05:600c:2046:b0:425:680b:a6a8 with SMTP id 5b1f17b1804b1-4264a3e35c5mr31734715e9.15.1720173127310;
        Fri, 05 Jul 2024 02:52:07 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d1650sm55528995e9.2.2024.07.05.02.52.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 02:52:06 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 05 Jul 2024 11:51:26 +0200
Subject: [PATCH RESEND 07/22] dt-bindings: thermal: nvidia,tegra186-bpmp:
 reference thermal-sensor schema
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240705-dt-bindings-thermal-allof-v1-7-554061b52fbc@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1603;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=QKjpJh+Itd3QaOkFhOLn7jTwV0XWHXFDHrlmhcmh3kM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmh8Ip9PUZEfgMxVf6cSppK9LOukpo7xLt3jr9o
 0uJcdEHB2uJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZofCKQAKCRDBN2bmhouD
 17ZZD/0dj5xTDsI1TIHYF81W/HLCC0nRBZviY4aQRcLsyu6u/uuIX6jib6zgtxSjNr6DD1k89ba
 y5fjcNy0XfccFGidn3nXgla0xzI+iofLrLoxC2bjqGACGVSl3sfDsRA+LRzYVqYjZF+0OjbWYxc
 5CFeecVoG1yBWECmPEkY4SqWF9o/D4NDv7aTswahqdI9UyORubSaQKv19w9vQCMC2Azsz6NrvVt
 AhBF8qOftvBPfZOfVmN5DvaDOf/F99AZO0riIAy1kyjZSwPhGVUbaK7Hu2Fdb0o9655LBk+6xBG
 HB6SFE6mUr9XNOJBF9ecjtGFfpxCfmRCkDZHAsrPmC3kdBIoAzfjJp66TGMHZEHRGkIrKh0ozlr
 rS30R2I3LnhdCW8y7p09E05Uq94KzWqSk/YEMqI2+kRtOrIRg9MK+ALz6QBqAXMTDxUdDkM5+2+
 dufjES/s+t/XmRRRZ8VRkWdTcqaEOAogEyQlpQFxpJbDqIJDhB9qPQMUd5PqE838x2nLyoQhuZv
 88MqU3LWOhe7EX/kJQlk/M6R6LxXzYKrlVhrdWbGR03O7id0TCtKS++bIBnW5ulObUeItScaSHN
 tChW6JyKWl8OKJtBzhmNgJr0PneaeKC9QlKE4aLJLll2qwIEtsxdwNo2RqI7xo5tvWH8S+2z5Ia
 JNCfZa3rc9u/i4Q==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Device is a thermal sensor and it requires '#thermal-sensor-cells', so
reference the thermal-sensor.yaml to simplify it and bring the
common definition of '#thermal-sensor-cells' property.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/thermal/nvidia,tegra186-bpmp-thermal.yaml       | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/nvidia,tegra186-bpmp-thermal.yaml b/Documentation/devicetree/bindings/thermal/nvidia,tegra186-bpmp-thermal.yaml
index c91fd07e4061..978b9e6ab8a3 100644
--- a/Documentation/devicetree/bindings/thermal/nvidia,tegra186-bpmp-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/nvidia,tegra186-bpmp-thermal.yaml
@@ -20,11 +20,7 @@ description: |
   node. See ../firmware/nvidia,tegra186-bpmp.yaml for details of the
   BPMP binding.
 
-  This node represents a thermal sensor. See
-
-    Documentation/devicetree/bindings/thermal/thermal-sensor.yaml
-
-  for details of the core thermal binding.
+$ref: thermal-sensor.yaml#
 
 properties:
   compatible:
@@ -33,10 +29,6 @@ properties:
       - nvidia,tegra194-bpmp-thermal
 
   '#thermal-sensor-cells':
-    $ref: /schemas/types.yaml#/definitions/uint32
-    description: Number of cells needed in the phandle specifier to
-      identify a given sensor. Must be 1 and the single cell specifies
-      the sensor index.
     const: 1
 
-additionalProperties: false
+unevaluatedProperties: false

-- 
2.43.0


