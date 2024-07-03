Return-Path: <linux-arm-msm+bounces-25142-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 39FD4925FD9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 14:13:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4F86F1C2155F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 12:13:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 187EA17B51F;
	Wed,  3 Jul 2024 12:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UElA+R2b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5538417B42D
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jul 2024 12:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720008683; cv=none; b=P0/FhTEtWPFmxZFXf+uzBO9jgbjRqUWAGtEOjPbOmRe3Lt0vGmf2gDCS7MA4Z07gThnOnYwgY9Q+1/nPLWqJOejj6ehG6XSPSrTQhymr7Lb5bZGeMwC4jfnd/Ts4oeOrGxifsNEzTHAN3itpdd8c1p/DPfGEX493kFkcTnU7PgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720008683; c=relaxed/simple;
	bh=S5zvkzQpDxgR0YGwGmmFBfehEAbVxpQY2x0q3BNuI2o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uwfkikIxCLbn2BANkCkiusAzl4byGVC+4MUGMT2NQt+jD0LnHv34Y1YOAA+zKuN7/ZNFzj1cFCPg3CMKVgbgsFRSxO4MNcTfoPazVIOeu6/me9fB3mWIIqKiTu0E272cG7p78qCIVe6lVnneWvqAY7TdhE+mCiTwyw8cc+wLYu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UElA+R2b; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-42565697036so3613555e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jul 2024 05:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720008679; x=1720613479; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aJVuVtK10DRmUdGmaG4/PmO6Oec2LjszDDiQAZFkSrc=;
        b=UElA+R2beYATP/RTfSx9YbCDRbDaXISBOW/cpqE9zJCqaDHyOHGzGKy4PXigUQWKfi
         MFVovwQ4pFHIw+k4PZp3VSlRNbvUcL9IM30mviYLbCTWa/pm8M+ll4eDBXX4NPOtUj73
         3a6343VTaazZ9TaCpX4MnDzvaDA9a+Z8/s9iy0zqEy9zjJedj5Mn5Jtu7ntwsz7FlDQR
         gQOlYlFSgIlB9bjDgPiiuwd5+9ZocIDMONjwDRUUhLst7xFNLghvl2qlSBzhooxLbLtT
         NHyLJ+u+f7ckPz5cnfvt94kx7pYn9WQ+Pt8GAb94ufvUJmIHTWUEnVmj3yZA6Td3GVkb
         mlxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720008679; x=1720613479;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aJVuVtK10DRmUdGmaG4/PmO6Oec2LjszDDiQAZFkSrc=;
        b=KA27QkLLIDXiK3pjIaInyGq1P0EOAO8yOcTo96IcQDQcQ9stzGg7IzuDYdAEBPimFt
         XdFkpm5x+7ZRw1q3DVhnPtC9rT6hVMvySuEEG2bannqI4CFN/nRyab2xe1kbEqltkI4v
         1vL3qFLg30q6uL7j4Uv6gq2SeCuFLN+wloC5bGHTFaI1BOecABOX4n80esU56JpIaKTW
         gnS8gr2iaEFRLstaQ1jbya3CHJuXpDbHXoNRLdyGvlDvim9chokzaigCTTcjeNggntH4
         2twWtAw6C4fLtqShspsi2n/z5ZabZ62vI+UbkSqb8xSf1cfGufp+5h+P/A19s6giNrvr
         QCQg==
X-Forwarded-Encrypted: i=1; AJvYcCUxDcHqcQAhoZeRXozq/Eq1D4pmqG9Vw6KbRa+hAiJMIEXoBpmBTJV3k5OhyojSvL63o9BYW7qRMAmxKaibw09++nPp5jBgT318csGkqw==
X-Gm-Message-State: AOJu0YxL6boKqwHw9LzgBla2Cl2R6mh126qhpwk2drOn7h394e/X/0B1
	y9Y/8GbxGqv0Ntw0GzDl7wNgdjvOlFo5hXRynkMEHmJWE11zP+/xoclwmF3EnxcNdhbR9UdOhjQ
	HpBU=
X-Google-Smtp-Source: AGHT+IGxHphf5D82gF71UP89obxHtvR4jIfjhlOvTO3r6ArO5pT2ywt5RlxUaNm4CuKeT17LcvrrIA==
X-Received: by 2002:a05:600c:4506:b0:425:7c42:d24b with SMTP id 5b1f17b1804b1-4264093f010mr12776955e9.18.1720008679207;
        Wed, 03 Jul 2024 05:11:19 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a10307bsm15716222f8f.94.2024.07.03.05.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 05:11:18 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 03 Jul 2024 14:11:01 +0200
Subject: [PATCH 07/11] ASoC: audio-graph-card2: Use cleanup.h instead of
 devm_kfree()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240703-asoc-cleanup-h-v1-7-71219dfd0aef@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1217;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=S5zvkzQpDxgR0YGwGmmFBfehEAbVxpQY2x0q3BNuI2o=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmhT/XW0SWctuZtJUcXCPlhsiWx2TNOffJ8CK/G
 W7SJVqOCxqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZoU/1wAKCRDBN2bmhouD
 1wwmD/9/pdf7GwTIbhrVdNSj8ifQJAxH/unze4Doo1292r/QQqP/NTi6JIM9k11NGv/KmT68EbP
 wNtd2gHNAOILhJhnS83opBMJfoZWYjEguTMZtaD5RevZ2UuufFqvZRID1ikULZVGwuayXjCUebq
 BahUAoPu1hzTYOwToTFdCJYnTQAl+dg/umhIGuC7Hhsf8n9votw1LG7D0XJUEiCYC88xcT1Z/IR
 fRuzt1+eHyDSkSEFF3AtQlns1pVsDFe6IAGb9HDG24oLwD2glp+UmzdaXtlpTXAYPqmwXkFhe7r
 tBE7PSWWyGH3HgldHG0CDe8lVhj2yl9Gf3eqXWDUv7NsxrsbwRpVuaumm6BBXG4YbGnfTiyjXPQ
 b3qJY1g7ko5/Q2b0I8EXPh/Ca6yJ/+XwWZg4tjnEld0PBCtT+AOXhYgdZuQ3jODb4qMC0H6yvEI
 buwQeuR5d/DgsJAIUSRGIyGYKrUOyb97fJrDuk3VYDTflh9kwMw8Kn2qQrhp7aBDOC1pndwf5xG
 7RJduqVwRtVICBdGI0bP22ckUVhXToXgc6XnOlbQznn3Eakd+Qn2gsKlRw5jQdIfPnQrYVnVupW
 8sZ5WMY69SEMC0YZsiAMkSP+HfRvZcK+xH2NasIDubd2B2TuMG+zKFQKNndW03d/Ur2KJuIvmE4
 4mikRl8ItjzC1gQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Allocate the memory with scoped/cleanup.h, instead of devm interface, to
make the code more obvious that memory is not used outside this scope.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/generic/audio-graph-card2.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/sound/soc/generic/audio-graph-card2.c b/sound/soc/generic/audio-graph-card2.c
index 93d9d045587b..56f7f946882e 100644
--- a/sound/soc/generic/audio-graph-card2.c
+++ b/sound/soc/generic/audio-graph-card2.c
@@ -1350,10 +1350,9 @@ int audio_graph2_parse_of(struct simple_util_priv *priv, struct device *dev,
 			  struct graph2_custom_hooks *hooks)
 {
 	struct snd_soc_card *card = simple_priv_to_card(priv);
-	struct link_info *li;
 	int ret;
 
-	li = devm_kzalloc(dev, sizeof(*li), GFP_KERNEL);
+	struct link_info *li __free(kfree) = kzalloc(sizeof(*li), GFP_KERNEL);
 	if (!li)
 		return -ENOMEM;
 
@@ -1417,8 +1416,6 @@ int audio_graph2_parse_of(struct simple_util_priv *priv, struct device *dev,
 
 	ret = devm_snd_soc_register_card(dev, card);
 err:
-	devm_kfree(dev, li);
-
 	if (ret < 0)
 		dev_err_probe(dev, ret, "parse error\n");
 

-- 
2.43.0


