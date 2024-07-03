Return-Path: <linux-arm-msm+bounces-25143-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 824BD926067
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 14:33:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 11034B2FF95
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 12:13:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36EF917BB35;
	Wed,  3 Jul 2024 12:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Lqjeo5kW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92EBC17B509
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jul 2024 12:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720008684; cv=none; b=lv7qxMdWpnDSKskDnoMATA7k8ccqnw8UgGgKlrubSh5L4vschp9EpXkCSHDf0TY4VUQSyUCcNxHXzEdM3asmqajm/R12HsRNptOQBWXNgGp/2nPZ684a6LFw1beRK4S9kXlEfWIEkWZZrhvLPVr1c7pB07EAgKG06MG3//HKM4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720008684; c=relaxed/simple;
	bh=X9RGNO5wB0C8KAI2bKN+Sff6tTbKWBwR8b9RYI6jmJE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Wy4VkiFtVUdViuHmavY1bo5mcvwbVzRUTBB4/r3UjDhsdPave43fLM1TR2xyDLEvp/g+01nbzyqxwKZ7StHyJhViS1tsvd1HYrokA7WfIPcLO3u2q+C8bAw54VctNNrOTc73RBe1aC9MUlEJyc4+CVG6aip/Hyr+fJdTNAL+PG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Lqjeo5kW; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-36794da7c96so272803f8f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jul 2024 05:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720008680; x=1720613480; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=30H4wuVh6MTN8EFct4l0si8PnCcJgk04g6gE9lXf/C0=;
        b=Lqjeo5kWdS5KIKjk2O0hYJtYZ0JXhOiOhcntMD5j+5oxkatTpfwbM6SOpT+mkzuepq
         +dEEBwuxqBRu1AGQEgbGwDglox/XSc0T2eoK0dupi9sztwq/H+NaN5sa/EPgmgCd/L25
         UYAnJIOnhLWPvL/HbhRVWC29j3ZRYKDX1ZPZFqeRv7B/1KnVtpk3zNevg7jPqk7S9QNY
         cduNkKUCl8JqU/ZFvaaLtCY66KlFEAFHctCflW2ZiBPlheztfBsBWwMHWCX1oFSbgjgS
         veJABVaa8W0UiPoGzScpJvajsJ+lFYTm5rzFew6JcrWrErW8LyNJTWGNh/QAJp4jZ0bo
         YT9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720008680; x=1720613480;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=30H4wuVh6MTN8EFct4l0si8PnCcJgk04g6gE9lXf/C0=;
        b=TbajeNwCBOiaGWwW6lVL5IYidCoK/yet/Tr5GmE8wlZjk7cqViab0qzXWxdgAqI/kk
         B7D5iXxAsHIggqdniFXI3rvCbXu6Cu0hZ5jdwB/A9FHSvHp4xpLp9UDoJmhG9FfvqFRE
         esFAd9VZeGoT2KR2yjeN6PR7mCzo8KXjO4RITt6vc8B2SrKF4sGa+XuZaLysNDUU9UtE
         9RA+VyZxIVJD1vJeBsNcS6VvLiLTurlYAHRR1IBRmABKS7K6h68K19zUO7Ea+xIP0O29
         SUohE+VvUgxZy+zZ5mebRgNGbSRBhX/d7SWqzhZKuzSVEDFvDFS1H/3OklLycbUAbH9c
         i4rg==
X-Forwarded-Encrypted: i=1; AJvYcCWSadgV/vkpM8Gb7fH61ihH41XBTyTmSCzzxqzR7khwXd7VlSIxH4YqxEriCNSfgOWuB+ik9OqU30iqFLICcnihJKcSsNZYwLswFlxV1A==
X-Gm-Message-State: AOJu0YzLtTcW7BreYOQU8RmSibUlxVNm5YVJ3vsKogLLpUzVXIuYNRZa
	bY5sC29TotTvVXS40K9+o+lHX1R1d3CbNOYowx/PJ2gramEoT8AgOdyFKvIR63oNVI6Rvp4ZeGd
	UcN8=
X-Google-Smtp-Source: AGHT+IEDsnzvMssWW12W73oyc5NjjqnLZ9RF8bwCkjxaj+IHTX4GIR6Mw8E9wybObB/fyceJvM28mQ==
X-Received: by 2002:a05:6000:156a:b0:366:e508:c7d7 with SMTP id ffacd0b85a97d-36775696c9emr9653713f8f.7.1720008680569;
        Wed, 03 Jul 2024 05:11:20 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a10307bsm15716222f8f.94.2024.07.03.05.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 05:11:20 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 03 Jul 2024 14:11:02 +0200
Subject: [PATCH 08/11] ASoC: simple-card: Use cleanup.h instead of
 devm_kfree()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240703-asoc-cleanup-h-v1-8-71219dfd0aef@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1558;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=X9RGNO5wB0C8KAI2bKN+Sff6tTbKWBwR8b9RYI6jmJE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmhT/YMEj7J9NvFTYv5P+4OQRpfot2iJsqj4iuF
 QE/7PDROlCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZoU/2AAKCRDBN2bmhouD
 1yMlD/9U1tGNEULLbx4K0Qb3ti9u79wPsPOGSVTGfeT4IvhdfTtElmd6RNSsJxBuhTXESGpgNLM
 BmhcGaYslhtTD5iwD6vr/ytTPHZHB6olK1Q7+BMin5qZfeFVIf+rFICGdJy6UZnvy5491siZ1qq
 NUSYVGoY0JPq8xa0CdB7vTiKEUFofiWfIr9DEqxJG1LsbA1goDvah5Iu2alGtaZmmDojm0CJwjL
 O1MmfJx/7mxQvCrYj1gdENaI3q7b4DPDa+QDqY5HG5MIfBAad0EaANQSaKQRABSpZs9aagn+oF+
 ucjzTD3VGG4Bv7rzp8mDddiADe0ew/umdLAkcFACuAfDXntAsYA08R4Ers9+7B2RbreeFEU9yQw
 i/aMefqRpMeMYEjd/Gmb+KMUHt28mbk7P92iIOTTNB99yxn662j1EjY2tDC2bZWSeD2XAgMwDja
 hBd4XutXGRhK4PL3sRvKWiJnJByM0ybhTpTzKsE/AxF5YWiADGrXrPeGBOktP0/+J+gmwmBQHQL
 9qDUp++viikr3mnx++adqlVaRCg1x4A3qp7c6O3GO8hfSWn2DUGjnJE1kVFGQql/5IlIUQy0mEm
 UbiTrZ86Sg9n836zL7qIJHai2oZrfWzs2Gd8wq57VVVUOZ8clFwJDeQfcznZ9kBlY0hE5UTqm0N
 R6WtkzOurrfY+yw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Allocate the memory with scoped/cleanup.h, instead of devm interface, to
make the code more obvious that memory is not used outside this scope.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/generic/simple-card.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index edbb6322e9be..d2588f1ea54e 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -5,6 +5,7 @@
 // Copyright (C) 2012 Renesas Solutions Corp.
 // Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
 
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/device.h>
 #include <linux/module.h>
@@ -727,7 +728,6 @@ static int simple_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
 	struct snd_soc_card *card;
-	struct link_info *li;
 	int ret;
 
 	/* Allocate the private data and the DAI link array */
@@ -741,7 +741,7 @@ static int simple_probe(struct platform_device *pdev)
 	card->probe		= simple_soc_probe;
 	card->driver_name       = "simple-card";
 
-	li = devm_kzalloc(dev, sizeof(*li), GFP_KERNEL);
+	struct link_info *li __free(kfree) = kzalloc(sizeof(*li), GFP_KERNEL);
 	if (!li)
 		return -ENOMEM;
 
@@ -818,7 +818,6 @@ static int simple_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto err;
 
-	devm_kfree(dev, li);
 	return 0;
 err:
 	simple_util_clean_reference(card);

-- 
2.43.0


