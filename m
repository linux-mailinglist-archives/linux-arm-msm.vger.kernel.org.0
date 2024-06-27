Return-Path: <linux-arm-msm+bounces-24498-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EC3F691AB31
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 17:26:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A3CBD28A65D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 15:26:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46DE41991C9;
	Thu, 27 Jun 2024 15:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Hbw49NQ0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4151990D7
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jun 2024 15:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719501834; cv=none; b=Fi1xpBHY9TRdd6ViiT3mNMlbRobVXMJViAWFw2PEcWuFdN17EJsgKCyNiVLbgrxzXSlmBp21LKIey37ECEzobxsaeirfD+cM6snHxmfAzG56mW6IsautkYxmfPSWgeK2hdMyLfEOsm0xhBb18PHICYqgx/vCiiZVpUn+NSvjBC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719501834; c=relaxed/simple;
	bh=E5oOz7sdP4TDRC9ZCb7arqSJ0fJXExTXVIN5dMViRhE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JSHml2LoR790aaclc6QSVbSehdskB6oQVETll8SmqJkUAIOmZ96ukkPHDmL1s0F+ij367UrsvAl22W/V0hL1t94/kPliqIu9mjx2Ox2KbB71GeBE/Fk7vcI+6/bNQ3ZS+ogbbwyC4cqvDlLIAc/MyU0A0UYU1Nh5uXAAsah2yfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Hbw49NQ0; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4255fa23f7bso14313155e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jun 2024 08:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719501831; x=1720106631; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=13oJHL7pizeIHoUG8WVLWL5BIb0MIcpOEu5bQiczopw=;
        b=Hbw49NQ07fd5ZP6tyHkc0EukknM0hRROAFfonKv/B2kbfq/+fVD0IOPyKFNwTsTF3T
         iqMpDaJBdCqCQfw2JL0Y/OSvjpwjdnKWMBA0a6owsqOXafZ7ztpQvHQENnV1mVXaCgNI
         uV5hlTT+CuxBeAt1mvuMkyKHsS3sVxVsyRni+vaSILW2XnSs9h9QuaAiLmHGO7ZQnu5H
         Uz/dr2FV81NjvuFBPgS+YYbHh3FHFoAvZ2Iadidea9+/ItIKqINdV4iabvjKHTz8BB+U
         fo1a2mE4Z9XHQjxVyEZT9KcWmQEBOvWqy2C8wCWmervqLUl8n/KfOLQXN3dmi/qoy1wN
         x6qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719501831; x=1720106631;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=13oJHL7pizeIHoUG8WVLWL5BIb0MIcpOEu5bQiczopw=;
        b=f79WSLdSWfQubvfvtZ8FccTKAt7D9FQV7xLzhB+31ZAhA8T0PwMW3pIBNpb4Kuzs31
         1+IpfMhE4tHw1ISfck1PTPaBwS74+3xDwDy4g3rzq1vOvIdB+fRDN58K9/Sc8KWxas0F
         khipLTF54RWkoZpuqu2RX4IhsIDbN/FP/Wh4Pm6YNxttKXzNj1kMcWjwoAvu4WA0jWxS
         FurMMC85HsroQ8dRa3oEjDKnJ0lhuDFAYMJRr/+fc6bZcAmWZd7VPl1cbjYHJ7opJlvh
         y6anlBusduUoQUwJH5f9i6AW72FJ5s5wl/4jK9LxOc3s0/jLKvWf8HAd+LEJugdy13sV
         0ASA==
X-Forwarded-Encrypted: i=1; AJvYcCW3o6WoFAnIijAPFRmhS14vqRyppkZRoYoYcm5zfi7vqc4sDGgZzAbGBygi2bcc1ET6CvNG0t0EdI8EzaRPwmMmcDQmohdoLF9mF9XuQw==
X-Gm-Message-State: AOJu0YzZvgm5oT9vHlLzlJUm4zRL48P6173ZfrMbGW7qttBz9Wwzqtp4
	hkUVtaTQS2bm874FLP1Nhx+miR7aDK1rttQCKuTKd3q5HyESdLA3rM9qOZK6oJfezrVOn9RDA/A
	R
X-Google-Smtp-Source: AGHT+IG00Cg6oV6ZliCSxQJsuMusb0Dl5UMtna//eXTdeaQJXGsBIZ2HCW+7f3aUgVQQTxJYIV/R2g==
X-Received: by 2002:a05:600c:6a1a:b0:424:ac5e:eedf with SMTP id 5b1f17b1804b1-424ac5eef8emr40354185e9.16.1719501830661;
        Thu, 27 Jun 2024 08:23:50 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42564bb59b7sm32783185e9.34.2024.06.27.08.23.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 08:23:50 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 27 Jun 2024 17:23:43 +0200
Subject: [PATCH 1/4] ASoC: codecs: lpass-rx-macro: Simplify with devm
 allocations
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240627-b4-qcom-audio-lpass-codec-cleanups-v1-1-ede31891d238@linaro.org>
References: <20240627-b4-qcom-audio-lpass-codec-cleanups-v1-0-ede31891d238@linaro.org>
In-Reply-To: <20240627-b4-qcom-audio-lpass-codec-cleanups-v1-0-ede31891d238@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2547;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=E5oOz7sdP4TDRC9ZCb7arqSJ0fJXExTXVIN5dMViRhE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmfYQAe0I1btoC63u16bijpn+fzlW1AXZpq9Cd/
 Rzui/72X/yJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZn2EAAAKCRDBN2bmhouD
 19nMEACUIwhiWwj9WBEryPz80KjgFMFzDmMHT39ES+0mBv0cmrlKejxjeXPqNK+f/g/sUl9nyd0
 YcPwTb6xIA5s8+HOuO2riq5OQ/zfLOZKuPGitH+otvSFYWSVsivXsbr3iQpSuJiyrQuXf2SlSI5
 Gb1WqCbt87VGYjDY3+z0H40G+QY1e1pfXp8isc+rttY/ZGQTIwECLFeHusI8PxfV+uwPvtKHCGN
 QmBvEr5o9Y4ObFNTa4sEFxSDotDgJASIIJkwvNIje2LwPkwMUNJsJvvNNswrHUSeZiLzstB0SJA
 6pbhxTpK42pXxcFg9WpMLAf30NQ4U2I3OzDkhM/LvlCswgkAI3lGRC2gbg3eTfRXpBoxY+hQt3g
 srcPw6Ftwic71FiQUsWxlBB/IKWCrV1CJdiD5p0SpcsgyGq/dulH4M3gjv+LNkw9ZRjg29iVCD8
 SWN8P77D21K/Pf+OeF6PRA9vIKtf3YqEjqBMgCeHKJ/QJwoWxg4gHnFHbSm4H0Siegz0W26SKqx
 smaNQyORq8sx7jHRsmbpL9gd88NkcKVcJES0jBa1UMjytcMZ9AA2p2fQ4R6nLqXS3KXTtmUpq1e
 TJ7XkLyVboR7mH9h4y+FlT0QOxBFxGTrkEvBwOHCLRdxCcDiyFLjbBt/QF/lk491zDrvSpdsaQx
 bbabGG7xO10D6Ww==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Allocate the default register values array with devm interface to reduce
number of error paths.  The array is not used after initializing regmap,
so move the freeing to place right after devm_regmap_init_mmio() to make
it obvious.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/lpass-rx-macro.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index 9c4f0763675d..59fe76b13cdb 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -3817,7 +3817,9 @@ static int rx_macro_probe(struct platform_device *pdev)
 	case LPASS_CODEC_VERSION_2_1:
 		rx->rxn_reg_stride = 0x80;
 		def_count = ARRAY_SIZE(rx_defaults) + ARRAY_SIZE(rx_pre_2_5_defaults);
-		reg_defaults = kmalloc_array(def_count, sizeof(struct reg_default), GFP_KERNEL);
+		reg_defaults = devm_kmalloc_array(dev, def_count,
+						  sizeof(struct reg_default),
+						  GFP_KERNEL);
 		if (!reg_defaults) {
 			ret = -ENOMEM;
 			goto err;
@@ -3832,7 +3834,9 @@ static int rx_macro_probe(struct platform_device *pdev)
 	case LPASS_CODEC_VERSION_2_8:
 		rx->rxn_reg_stride = 0xc0;
 		def_count = ARRAY_SIZE(rx_defaults) + ARRAY_SIZE(rx_2_5_defaults);
-		reg_defaults = kmalloc_array(def_count, sizeof(struct reg_default), GFP_KERNEL);
+		reg_defaults = devm_kmalloc_array(dev, def_count,
+						  sizeof(struct reg_default),
+						  GFP_KERNEL);
 		if (!reg_defaults) {
 			ret = -ENOMEM;
 			goto err;
@@ -3853,8 +3857,9 @@ static int rx_macro_probe(struct platform_device *pdev)
 	rx->regmap = devm_regmap_init_mmio(dev, base, &rx_regmap_config);
 	if (IS_ERR(rx->regmap)) {
 		ret = PTR_ERR(rx->regmap);
-		goto err_ver;
+		goto err;
 	}
+	devm_kfree(dev, reg_defaults);
 
 	dev_set_drvdata(dev, rx);
 
@@ -3866,7 +3871,7 @@ static int rx_macro_probe(struct platform_device *pdev)
 
 	ret = clk_prepare_enable(rx->macro);
 	if (ret)
-		goto err_ver;
+		goto err;
 
 	ret = clk_prepare_enable(rx->dcodec);
 	if (ret)
@@ -3912,7 +3917,6 @@ static int rx_macro_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_clkout;
 
-	kfree(reg_defaults);
 	return 0;
 
 err_clkout:
@@ -3925,8 +3929,6 @@ static int rx_macro_probe(struct platform_device *pdev)
 	clk_disable_unprepare(rx->dcodec);
 err_dcodec:
 	clk_disable_unprepare(rx->macro);
-err_ver:
-	kfree(reg_defaults);
 err:
 	lpass_macro_pds_exit(rx->pds);
 

-- 
2.43.0


