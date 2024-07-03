Return-Path: <linux-arm-msm+bounces-25141-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EAAFD925FD6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 14:12:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 10F4928B5DC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 12:12:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6583617B42F;
	Wed,  3 Jul 2024 12:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NEWc08Jf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F6717A5A8
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jul 2024 12:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720008681; cv=none; b=ICZ9lBOZBr1d/yGIGrLo19t7L0PFqLFHsCxWeMwlkXRPtZGZ5SwmTZemz3/tNmtX3+YnpRWOycEzrYS8TlhjtYbqnO/tsJev5n+52dBSUG6+4tbdIgdezovbIavMh04KAt1OSS5iCNlqmLzUr20gU8TuwRRgEQ7Xj2uS2vvUSBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720008681; c=relaxed/simple;
	bh=DS/IDp+LqdRHE3mvtnrgUtVAz5GNkmhuj8B4aFV9euQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G66nnZBu/04QQfjJlq82+5pcZPW0fKiHWbP02Z1HjUslVF1r8CU5ucTqBSsKJ/H9p6xuMaM5D9TBkF1hEuFddRbnGmupfwK2Hl0Vm3ncUvz94/mw2eYrKk73XIpOBrl/w4UV0EOpavAKqtUXMQ9t6z7Wdm9aqJWx7XLhA/4TGXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NEWc08Jf; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-36796aee597so170026f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jul 2024 05:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720008678; x=1720613478; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V81m9R3WE5N86wntgnBniIBHNui3TaNJXIYWRSi4OAc=;
        b=NEWc08Jfo287bKYKUUiLpafzU0NJzbN/1pl6uojLyyuZqEmkw1yS+f21zDOWmYV5Bs
         ysEII2kxEdgw70FuT0uoovFsu0cqmeo8fLO1iRqlR21F7rHTsOJSnKHRP2QlOBcpCVt1
         eli2b3LQb+hWTtky7Q5K0EPTqul09nv6NNu9XUTQJaUIs9M/rkeS5GJ3D4AXL9IqJXpB
         GoCmnhDjvC+ty6XK+zE5Hi5fXqKvjZY3P4G9kwBQqaq0j6FIi3JjKLG7g+v7MXj+Jjrr
         tydPu3bl6rfxhMYbl8M1bX/ki3oTyC/tvZA+zNiSqUgmBfdbkMRQ1XoEE4znF+ltIime
         xb7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720008678; x=1720613478;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V81m9R3WE5N86wntgnBniIBHNui3TaNJXIYWRSi4OAc=;
        b=WfFZejEqdJxeg5p9ViU2BRnmULVxxwf8wyZFmvIZkGgLXs+EGndz5umgiU0jYUvi/8
         oIXjAFolWaNxeL9s8wtbhqyOU1t5O0nBWarvErc5BP2Icd22LJYA9alYCIpl8wx0b4DQ
         LVOXjU9Oi/MkPqRFEEWlVRVviDZ3/Yv1WLxnFRU2e5BzMVnUdqV8i0Y6gzYFbiM5Jk96
         5GydrWKQToSuKU0+gMWMThiEfb9VZCESEWydAl5l9Z8DRuc+qitNJsSMCK8x/HXy0LYq
         kmVh43B4cvMCWMPm0Muu5lguH9vW6ZlB3un2EOcAAQuylO6ichdoQHOk89DBMo4BztgF
         JLtg==
X-Forwarded-Encrypted: i=1; AJvYcCVAeVYbYS+9cFnCCnOI8XeWCNwvgcEUXCXfH3+R/EeGWb+WjmwKEk9kG6n4Wns/ni9NtNXbKs3ACSnHH1miRshjJhngsw/+FhwORPKb2g==
X-Gm-Message-State: AOJu0Yzg974rp/63rr7Z5+lTvmMosOknI922ese35ogQtYTkOjH98Qmr
	/nI7nfKkovsZdd6u97jCmhiNPVHqank3iPKOnJBRyhq0gDi+HAW7+K/G6liCimWZ+HwLOxfkXvF
	Zo88=
X-Google-Smtp-Source: AGHT+IEy3cvbIPXgRehmrxbeY1VP2hPk71QJIpRF5k9fYxa9g3eh0P0YLDcrqZVRfqAtmQR/bgW1Eg==
X-Received: by 2002:a5d:58c8:0:b0:367:4d9d:569e with SMTP id ffacd0b85a97d-3677573211fmr7148838f8f.71.1720008677736;
        Wed, 03 Jul 2024 05:11:17 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a10307bsm15716222f8f.94.2024.07.03.05.11.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 05:11:17 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 03 Jul 2024 14:11:00 +0200
Subject: [PATCH 06/11] ASoC: audio-graph-card: Use cleanup.h instead of
 devm_kfree()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240703-asoc-cleanup-h-v1-6-71219dfd0aef@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1357;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=DS/IDp+LqdRHE3mvtnrgUtVAz5GNkmhuj8B4aFV9euQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmhT/WXyjhdMmNo0GaMA/nQmQHmNLei7121GkMX
 9CXdHbwkg2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZoU/1gAKCRDBN2bmhouD
 1zySD/9moQASzEdIyJNIMW/1XTuG74QTsA+WHBfP/SMJNsQ14mbjd5gXLpmMxWJ5nTj2Tn3HvqP
 FGGryHmFFr3jexVUU5Ueq8LvG8EfsLNZLrGhJQdeTGo5CPdCR00RvhkIWBBzvT8r3ix7fltedvS
 KD79KoVa6+ARsgBCqGNmzmfaiUjsOTIyfzG4BX3lHtBoJ01r6g2HhjStY2Tp6xvqQlHvG8S12md
 pBW8QUI1YM+gk6L0L/wSzBMIb6C5q7aTJpRjY4rAP5267YeLa/m994LCzRcjHz8DYihyO3AlxfX
 wvrHCLk89XyUuS+LavCeHanMxHB0/AlaEeF8eE9vtudNWKrTFhQU0w26qVqWHq9lVw3C+jqqs4x
 GgpgQgl6k3QzHJQziZ05kyolA/N0hPYuPGBUGxjgJZVn4/q8FuaB4VYlJfmocBRNJe4kYJnUqXI
 5azhw7+mDi7iJSMQe1QazVFW0Q8M5JuEc6lRRggJ8ZH6+lTqnUn6UtPM4EQGzqytgduJXtaXm7z
 XWERZodnnF9NJ4B3YEaCO47KNoW/ZRxGgXAviKq7L8U4uaxuKV7Qgvk2rLNaqzOKAkPV1lzcmLO
 0s5ffkOj2vDYNcjqLFht/W2+R8i97qRsLWTf7l9GWinkLTZSaTTJYXVoK0fhKqpjTs4eM3roqP3
 SVE73xekq9kTZcA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Allocate the memory with scoped/cleanup.h, instead of devm interface, to
make the code more obvious that memory is not used outside this scope.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/generic/audio-graph-card.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
index acf7d92d21e6..3425fbbcbd7e 100644
--- a/sound/soc/generic/audio-graph-card.c
+++ b/sound/soc/generic/audio-graph-card.c
@@ -7,6 +7,7 @@
 //
 // based on ${LINUX}/sound/soc/generic/simple-card.c
 
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/device.h>
 #include <linux/gpio/consumer.h>
@@ -573,10 +574,9 @@ static int graph_get_dais_count(struct simple_util_priv *priv,
 int audio_graph_parse_of(struct simple_util_priv *priv, struct device *dev)
 {
 	struct snd_soc_card *card = simple_priv_to_card(priv);
-	struct link_info *li;
 	int ret;
 
-	li = devm_kzalloc(dev, sizeof(*li), GFP_KERNEL);
+	struct link_info *li __free(kfree) = kzalloc(sizeof(*li), GFP_KERNEL);
 	if (!li)
 		return -ENOMEM;
 
@@ -628,7 +628,6 @@ int audio_graph_parse_of(struct simple_util_priv *priv, struct device *dev)
 	if (ret < 0)
 		goto err;
 
-	devm_kfree(dev, li);
 	return 0;
 
 err:

-- 
2.43.0


