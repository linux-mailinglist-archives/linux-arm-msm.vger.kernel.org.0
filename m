Return-Path: <linux-arm-msm+bounces-25140-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4570D92606A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 14:33:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9417DB2B682
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 12:12:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 018DB17A5BB;
	Wed,  3 Jul 2024 12:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YlUDUCNA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 236BA178CFA
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jul 2024 12:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720008679; cv=none; b=KuWrJ7xuYQDcvM/r+bP/BYSt8mo21UWwo0ABNpmDcXb1pel9igCt38rl3V9krfSd3yJK7jAy8GMy1Brafi/3rfl5BHO7TTot5yxVT9VkvtN8InDiEbIdvuBUr1MopIV6jDVyC2BX1IrNxLN8OOLS21ZgWWbA5m1WUAWQB3Upp+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720008679; c=relaxed/simple;
	bh=5n2U7Ii8u9qpjNSh5gTMMpFE3U1zzbLfE0z6dwMWgWY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e8yWXxuvcSh1zlz6zu7cW5LIEftm0Qr+RWZAci1RDD6gQQKwrmwAZJnKjV0KHWX37xHPofBqXCGjo6dda9jiirD45w8LuAiMeTD3Zj2402A+sFscvCmWEeK2DHT22AAN4HgS0JvsvjoYep/F6cUwHdt8ffHu5fHAMFNrMmT8exU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YlUDUCNA; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-36796d2e5a9so172278f8f.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jul 2024 05:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720008676; x=1720613476; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=voPxYQD0gS+6s0oE8RPo9jZsqMZNTCeTe5vHHnILF0s=;
        b=YlUDUCNA5DW9JzmyxXROL5pYYoM5+FyfaJRxN+RdRaWzIzSI8O7UnyHgxcIkTwlvl0
         4Dvo8THa0eovczK4bWodvyf6/EYD/betLmWTR/8q2tWv5efpsJHtmPoTy8EV3YrKg6qr
         +4+w731Y4TJEejUd9Vu26WTWAHitTljqve8gyfzcg/pL+xvOqYyFFery/9Bx8BnRYhB1
         YwGJ99nVjq9Ca9go9BywHWlIu3iSz/rWrkf8CdZypsyFPrXglrtWtTSmRNnTCfNE9vQK
         vBlSwR5MLrC8/uAg5JPtfG9sltgTHK6aDQKJkNc2cTINS6JPQt8SUzUlp2K0M5d6O7ZS
         zdtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720008676; x=1720613476;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=voPxYQD0gS+6s0oE8RPo9jZsqMZNTCeTe5vHHnILF0s=;
        b=r0YXVZ7i0aU/VX3/W9otYcbb9Nb593JPLN+lnZJfWujr4SIrhlfG4C1YMQdkIeKYGy
         qExUASU4PSqIvr+fOmfJdlvdR6JvoTcgnfln2VqEo+kseyzgtrCW2RfEiMGPjko0f8hL
         MLahgBut3DFpXbhB8tX3Gzs3Zr1OGGRm9WCqDkmVg6cgeY2cQ0BabWX4xdpLRMQTv0zB
         cNl7rQP36Pf6ucQ9CcPgC87g3wRlD7i77l/411VkfeABT/E7uQMcZDBFXP5dlCkWn44d
         /jEyUrSSjdnm67Kr3pOyQVFj4AzLMQrFOL4/423b1l54GQ8S77VZGCUNyvzUv5UftFgp
         g9sw==
X-Forwarded-Encrypted: i=1; AJvYcCXUbv77vKuCCNMwWbuTKmHG3vzQsUEvWpi925AmCXy9svl1SU+fbtY0Ge2XpqASi/mgvoKpjfkMJ6O65DGo4fAZYU7CPVH+pvIH+xP6ZA==
X-Gm-Message-State: AOJu0YzUinLVMgPCC9Q2Z4F2beQRY1Nrx6RVoCOQraZNPefmailBmqJa
	rWKX0i7aqqKRWEsx8S5lOIH+hfS/6LltIYPOTEVHELmaXiJaTzGKiuIM8XDxY6xdjefw2n/TNPl
	p0is=
X-Google-Smtp-Source: AGHT+IHUpJv09c/tX0BJoWGcywOs1/igC2JtMah//K7mGQHmsYLuuC/hM6I4L59TczjXLvEdh4+MWg==
X-Received: by 2002:adf:fe88:0:b0:364:aafb:5fd7 with SMTP id ffacd0b85a97d-36775725e0bmr7848385f8f.45.1720008676185;
        Wed, 03 Jul 2024 05:11:16 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a10307bsm15716222f8f.94.2024.07.03.05.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 05:11:15 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 03 Jul 2024 14:10:59 +0200
Subject: [PATCH 05/11] ASoC: simple-card-utils: Simplify with cleanup.h
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240703-asoc-cleanup-h-v1-5-71219dfd0aef@linaro.org>
References: <20240703-asoc-cleanup-h-v1-0-71219dfd0aef@linaro.org>
In-Reply-To: <20240703-asoc-cleanup-h-v1-0-71219dfd0aef@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1989;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=5n2U7Ii8u9qpjNSh5gTMMpFE3U1zzbLfE0z6dwMWgWY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmhT/VpH4b1lQMWfJeGjQDjMJ4k7DARxOdBMzRK
 YzljfxO+aqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZoU/1QAKCRDBN2bmhouD
 172hEACWQQu3Q5imqmfhy2Da+4TNTvqC5znQ4ArWh4RI66hNVDgTQHmyb+N0fxWIL3qrevl8eSr
 0AN3N1lmd6D7W5upGGqIks/nPJgFiEe7VqIhy13tVhA7ebEYCWp88sNtgOYg55zmOJh5E+Bsf5H
 DlSPHhaaDgKoFK6wwXe9XGHUMDnSuuortUIxpQeiKT7U1DKNHYHfeUsKuB1y1miIV0ZO2F+15Uw
 Ek5WblZNHEWX5C9PS9z6mW8epDNRqFh6wuCZNXx7UnVD7845z5wO6Kq6etIlVxVi2m3wzdPh2ED
 URWvk1er5OxmQgbjwYoZlZTHY5Na/xooBuKB9bywJATWbzltzlE1RHlcJJT4JsHMnd62Gf7/bGq
 Y1yeVYjgi2LV2ocil3//TPQItf1LRV/odPQ8BLUssFP3BLg1gfFLfZq+bZ/sb2wny8cLVE2Zm/T
 /xX4nd0/068uemcuJIOOrzOv6RFH5u71oP3Pw5WhhqPybcpXw/KhztBlBBNv79PtO5MOjH86s3E
 hVzSxSqHUtzRB0nvkkPw+Z/7uV0sovANZSF25ogEV8Yb92eQg+KNfeS5pbHryj2Lhzekufvp6wD
 5uEgE8Og4+VCN28mAw2TKrmk1fGO+0o8ETKvaYlPlWTUghUVwV0O0pu8xEnjXMiNB3MSf0ZwV7w
 rA74nq0PkFkfJyA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Allocate the memory with scoped/cleanup.h to reduce error handling (less
error paths) and make the code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/generic/simple-card-utils.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index a18de86b3c88..fedae7f6f70c 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -5,6 +5,7 @@
 // Copyright (c) 2016 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
 
 #include <dt-bindings/sound/audio-graph.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
@@ -135,8 +136,8 @@ EXPORT_SYMBOL_GPL(simple_util_parse_daifmt);
 int simple_util_parse_tdm_width_map(struct device *dev, struct device_node *np,
 				    struct simple_util_dai *dai)
 {
-	u32 *array_values, *p;
 	int n, i, ret;
+	u32 *p;
 
 	if (!of_property_read_bool(np, "dai-tdm-slot-width-map"))
 		return 0;
@@ -151,14 +152,15 @@ int simple_util_parse_tdm_width_map(struct device *dev, struct device_node *np,
 	if (!dai->tdm_width_map)
 		return -ENOMEM;
 
-	array_values = kcalloc(n, sizeof(*array_values), GFP_KERNEL);
+	u32 *array_values __free(kfree) = kcalloc(n, sizeof(*array_values),
+						  GFP_KERNEL);
 	if (!array_values)
 		return -ENOMEM;
 
 	ret = of_property_read_u32_array(np, "dai-tdm-slot-width-map", array_values, n);
 	if (ret < 0) {
 		dev_err(dev, "Could not read dai-tdm-slot-width-map: %d\n", ret);
-		goto out;
+		return ret;
 	}
 
 	p = array_values;
@@ -169,11 +171,8 @@ int simple_util_parse_tdm_width_map(struct device *dev, struct device_node *np,
 	}
 
 	dai->n_tdm_widths = i;
-	ret = 0;
-out:
-	kfree(array_values);
 
-	return ret;
+	return 0;
 }
 EXPORT_SYMBOL_GPL(simple_util_parse_tdm_width_map);
 

-- 
2.43.0


