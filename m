Return-Path: <linux-arm-msm+bounces-22465-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9939058BA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 18:26:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B772DB2810F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 16:17:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94A2E1836C2;
	Wed, 12 Jun 2024 16:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T6BIKQ0d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1FE218307C
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jun 2024 16:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718208957; cv=none; b=gky9lTXZlcb80+xIImtC0uTw6rjX46in2k5AtdS0CSeUKgx2Yw9h5es4/Kn63vp8C+RDm7X7wyOS2wesg9kJneBLXWh4iQiZSgGe/cMch5Bh9L5IXv0bX6fyYa9Lij99LXuRDLnxHHWlC2+2HbT2MO12JT7Yin4u5nGwf1GaIg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718208957; c=relaxed/simple;
	bh=EX2ahL6J6gVjXyyMMyKCJVoPSigpcf+psbFgYuluYwk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=go2fE6oE69M3VzRm7ZL+U2oH6vFpZFPSkLANMSA8dHzN6FoeOHnPomlIoimC8WDlF6IvYbwbJFem4St9n26Nh30L0XWwmTvPtmM7dOlRf1zVdL1nIc7Zqp8Pkwz0ZVLTy0cEGXyNZtpAsp9v9pq3TxgfjyoANoP1NTJKd61RPb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=T6BIKQ0d; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a6efae34c83so9382766b.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jun 2024 09:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718208954; x=1718813754; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SEKGICqGgE2b6uDcqkkwK9UClcAb7dqdvvSEbvTTj0M=;
        b=T6BIKQ0dQX/9/HvM471t1RXkxTg1nYsGgD1DWd6Ury9Aszb74oZyEoXMDBwDWZYeK3
         2n297O7bu9E9ghrgbNXipqq4FX0+u823aGV/HVCUh2KdwLHe+vvPQGcj9cBSghD8SMdS
         0lDXHpyDOoKNAVVm7y/t6JqxZb5WQtI7qsIPj/haWJ3Sb+w/scSMEAme8hvQ2j3Ikwsw
         HlV17t6QEIFeqw336OXJBY2VQ+k1MulcWCLAEgoH38zJ+rFpGmr9ctA5QcPOHcAZNH8F
         FfonT7WEmGu7c0bYrKe/1TKrLV/HbZ5c+xnIH89S+fS0FhCSCuev24rhYJH6OqdRzCne
         4ASQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718208954; x=1718813754;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SEKGICqGgE2b6uDcqkkwK9UClcAb7dqdvvSEbvTTj0M=;
        b=kv/RoRFfibiB9gCi9vMid3sWhGPZXdVSjHOVvNLUP4T0SqPqX4iiZ11MQJpJL2baVE
         eUB+1pgzGEI3WGSyb8bSrS7p7W+MB0knSg7ZKG3M5RdgFjrmSjWthZzLucRoyW73wu7c
         lU3c9c2DdvNdc3oQqNSEneONlrbesCtYFwka1GCu0aUDVqKMEg2tVv3s7Kh0ArQ/HxwM
         XuAcMhv0U8NMgDXCNx7dUbkKrBMGzguWnYZUfKSX9ns2vpJpT19kjU7Iy6EFqF4hPo7k
         g8xVl63bZ4subgCpwAVVTIyVw57Fl0PfIVT8VBCvwCu8F4urUv7ginrHEkkRGRVlde1K
         KRAA==
X-Forwarded-Encrypted: i=1; AJvYcCWQ7/BkLgzhqJO0X+chb4XxhFT/3lyFSWuFE4yc0gVrD7sLmRQLF8krLKVVCl+yhTqzGSW9ExVdSOlkycsx+Fqkm9nCXQhS0Fh7yNPb/A==
X-Gm-Message-State: AOJu0YysvhTeHTElLQYqv7ZGi4gs3MmVeb2vk0faOmJxVqYfHA1YzhPK
	eapARE1aoNiOI/BEusntTIHNwh/gXyM5zmSNSUvkzSCoVhoUFP5IR4LshXrc31I=
X-Google-Smtp-Source: AGHT+IHYEtQvDVbT6uJNSotzJaByqehhuWhxlB0O63Bn7wSy9KpB96B9a+ukyvZ1xgkh0eq0/z6n5w==
X-Received: by 2002:a17:906:480a:b0:a66:c338:65cc with SMTP id a640c23a62f3a-a6f47d3593emr150992266b.19.1718208954195;
        Wed, 12 Jun 2024 09:15:54 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6efd6cfb74sm624815866b.20.2024.06.12.09.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 09:15:53 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 12 Jun 2024 18:15:22 +0200
Subject: [PATCH 09/23] ASoC: codecs: wcd934x: Drop unused mic bias voltage
 fields
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240612-asoc-wcd9xxx-wide-cleanups-v1-9-0d15885b2a06@linaro.org>
References: <20240612-asoc-wcd9xxx-wide-cleanups-v1-0-0d15885b2a06@linaro.org>
In-Reply-To: <20240612-asoc-wcd9xxx-wide-cleanups-v1-0-0d15885b2a06@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1979;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=EX2ahL6J6gVjXyyMMyKCJVoPSigpcf+psbFgYuluYwk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmacmfUq+jhizaLbMXoUgIxvDCzWGZrgeZdF/wf
 dfrMV1SHqKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZmnJnwAKCRDBN2bmhouD
 19N0EACMZdzHK7kT5jfHO+OLl2KWwObwFoTIuOxIp2z/nCRwkYmmH02uCrwaLRwMC6fTy1HAoV5
 mfunts6Spsg3P9FcQyJQGg8nYTIsxsVy+76SMxhR3+F0lU6QPwy24A7K6gvXK3L5T5mhY0iZ7Ln
 gGqf2XlV7tReFlQKp7SFtIEi8FZ+A1HBuzZocEhH4DFdPEeOOdWRq7O5Zv2HdPb2dFEraohL+Xx
 /xJ13ZPSYAImCF+qofa7m6k1Fq2+FuZrHKxveVRX/qy2VsvfKZAo+XacZhfvGej+IXLKEIFtlWJ
 LpJlJPDhXm8TKBo/vCpFQBB6Sqk78qzISUt039KpyOrDbJ8JbZUBHK5X1WZYJFWp5f64KQC9wQw
 yDoAA3RRn0HGVc+zEyQVaglLLK4wInPzEG6wzctKEGfOyiaFa4ew4T2ZU/qraojlEcG4We+AqVD
 2Mvi37jqLcoso6oojXPIE35B1mCBrLQJdVKGi0hHknqu2lJ7VKmxFiYPdSrDBYjKkHTmqEUB9Mn
 xh6pzZXWYHKq7oBOs7U0CITuH41NACzebveNzxkOI7XSrEprZ5NYGUNgGMjXnCpYULn3n6HtVKH
 9XYfNS2QTNaT0PeJY3NT+B8PV/pW0R+drWRPTh0QcsGSbs6GYuomsDLx/39b/kdxI4ttJS0Rgzw
 7STZMgm9Urff5nw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Driver stores the voltage of mic bias in fields in state container
structure, but actually never reads them - except for the mic2 bias
(micb2_mv field).  Drop the fields from the structure so the code will
be a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wcd934x.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/wcd934x.c b/sound/soc/codecs/wcd934x.c
index 7885aa423886..2a5fb4370ba3 100644
--- a/sound/soc/codecs/wcd934x.c
+++ b/sound/soc/codecs/wcd934x.c
@@ -566,10 +566,7 @@ struct wcd934x_codec {
 	struct mutex micb_lock;
 	u32 micb_ref[WCD934X_MAX_MICBIAS];
 	u32 pullup_ref[WCD934X_MAX_MICBIAS];
-	u32 micb1_mv;
 	u32 micb2_mv;
-	u32 micb3_mv;
-	u32 micb4_mv;
 };
 
 #define to_wcd934x_codec(_hw) container_of(_hw, struct wcd934x_codec, hw)
@@ -2203,7 +2200,8 @@ static int wcd934x_get_micbias_val(struct device *dev, const char *micbias,
 		mv = WCD934X_DEF_MICBIAS_MV;
 	}
 
-	*micb_mv = mv;
+	if (micb_mv)
+		*micb_mv = mv;
 
 	return (mv - 1000) / 50;
 }
@@ -2215,17 +2213,14 @@ static int wcd934x_init_dmic(struct snd_soc_component *comp)
 	u32 def_dmic_rate, dmic_clk_drv;
 
 	vout_ctl_1 = wcd934x_get_micbias_val(comp->dev,
-					     "qcom,micbias1-microvolt",
-					     &wcd->micb1_mv);
+					     "qcom,micbias1-microvolt", NULL);
 	vout_ctl_2 = wcd934x_get_micbias_val(comp->dev,
 					     "qcom,micbias2-microvolt",
 					     &wcd->micb2_mv);
 	vout_ctl_3 = wcd934x_get_micbias_val(comp->dev,
-					     "qcom,micbias3-microvolt",
-					     &wcd->micb3_mv);
+					     "qcom,micbias3-microvolt", NULL);
 	vout_ctl_4 = wcd934x_get_micbias_val(comp->dev,
-					     "qcom,micbias4-microvolt",
-					     &wcd->micb4_mv);
+					     "qcom,micbias4-microvolt", NULL);
 
 	snd_soc_component_update_bits(comp, WCD934X_ANA_MICB1,
 				      WCD934X_MICB_VAL_MASK, vout_ctl_1);

-- 
2.43.0


