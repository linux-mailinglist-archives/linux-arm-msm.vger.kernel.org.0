Return-Path: <linux-arm-msm+bounces-25851-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B5192D36B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jul 2024 15:53:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D8297B243E5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jul 2024 13:53:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F392C194094;
	Wed, 10 Jul 2024 13:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EanqgV4F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EFD6193454
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jul 2024 13:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720619567; cv=none; b=NZZoobqr5SQbsfCuiqHXd6aHaYJvBGiJO16wLUIGyLpPdtC66Xq/4xaa5BANBwQp0y3v0rBpsDbl9T+e3ByCTqkWpfZ3Ci+BXdQN7Bxkp4o2kIe6jTIWSd0o2JZyGzBgBKCepTfnrbLghR6EafNfBvgWKnWfbXI16TZqY2o7IE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720619567; c=relaxed/simple;
	bh=y1tKqfTQODlGyfn1SRpCW1SmdAuFgMAc1xdfgaUEBtw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Cc/ZZo3EJ1iBoKHrDlOjT3WBkST+AdqFytlr+BQRE75Kb1LtUQPbdrBVu4ItqxB9l6KbgEbaspbzeKjxMficYGH+gaBJmf67z8Saw2megMarbBgtAyKifNwPdNK1qX3Te9m/VBfmFIfybwpzBZA2C9BQa9AfzvMOW/Xb8s7Z0b8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EanqgV4F; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2eea8ea8bb0so57138511fa.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jul 2024 06:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720619564; x=1721224364; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gLywJr+VNuRQ+9S3fLtdyBw83gsTKbfJTEcv1fSuZtY=;
        b=EanqgV4Fm+7bg5ZdS5LF+G35e/tD6sZuvgrII6B+tajuZA4yqgiE6vidDuzYgC30OQ
         3geWcgaKlN4+H7fPJ+W+12JeUes/nnJ0w0sm0W4mR7IqET+fMg85d5hjdqwoFCF/SHMj
         x0wXmfmu3RN/fGjEb6iGqUl4s6+wsIKNC3NL23/ZOgr9WPrdLcmoB6JeTTa77H9xrEbq
         A5tvnuvxXHrScbfzpVfFkQ3rIP4MMDbwTW1f6OkK7hpagPF1tsbZ/3BDdjpYwo+kPXeE
         Q0B4o8ATdKDh0B8eqbx4mavUOJSzUXLrfY01iou+KirkbPjxLxrfac3c5JuZ7yJ2l7oQ
         Ty6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720619564; x=1721224364;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gLywJr+VNuRQ+9S3fLtdyBw83gsTKbfJTEcv1fSuZtY=;
        b=LEazxeDuSkICdlPH4Ky0W4YCP81Rqh4Pe5KCrzzMmoODmhzUwI5AVMd1BTj+FPLjQZ
         4qn6S1wah2jVg32wXUintbXFzosJZUvio/8mNQEIJgSYgsRLhnONLWtsHLkJoXEq0Wgp
         Qf2W73amRfoD8kmntnWjx/SK5wZ9EZWTMaUSwR50HHXh781Z5kSD+EmTPOwrXeAyhGFA
         DNKbwq96LfLyySHlDWuM4DWbzRTe1KHp16U0CPi/cMHTq5wv73P1tejxuifhvvZFR1Em
         5E+H+8Mk2cuJpUuIkyIIrXzJVFg0GcasJinIJMLODAsmXDmcb3OhT08PnaD3djcQM7z9
         P7xA==
X-Forwarded-Encrypted: i=1; AJvYcCXHPSRQkqgSEzJQW5mtPwePulA3MaLuPu+alsojjzQhMHPs6AQHXIqsfcqiTXxoBI0Z6dgWiuvmEywjfH2czlgaaqN6yLSr8UePLDYTzw==
X-Gm-Message-State: AOJu0YyOEsQVe2xleQrx2c1j8GhmW9l62b/P7wbnZupygUIs5KuqAkfY
	W050zLo3HQ9v5cXjpvkso+oYX+th/PlvuR99pt9HAd2O1x3BlU0l9hqpRjT0410jVR1LBpAJQNs
	U
X-Google-Smtp-Source: AGHT+IFqsU+9eqU1waHlBXBgmqcGfO+uxS9Acg7qmmXJvRuEpZxNjPxpb/48w2Lrj9d7Bgw79lvchA==
X-Received: by 2002:a05:651c:23b:b0:2ec:56b9:258b with SMTP id 38308e7fff4ca-2eeb316b00amr44160151fa.33.1720619563982;
        Wed, 10 Jul 2024 06:52:43 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a780a8551afsm160440366b.166.2024.07.10.06.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 06:52:43 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 10 Jul 2024 15:52:31 +0200
Subject: [PATCH 2/4] ASoC: codecs: wsa883x: Handle reading version failure
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240710-asoc-wsa88xx-version-v1-2-f1c54966ccde@linaro.org>
References: <20240710-asoc-wsa88xx-version-v1-0-f1c54966ccde@linaro.org>
In-Reply-To: <20240710-asoc-wsa88xx-version-v1-0-f1c54966ccde@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1944;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=y1tKqfTQODlGyfn1SRpCW1SmdAuFgMAc1xdfgaUEBtw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmjpIkh3GaGP31lPefvm22QfD6kHlnJErM6N9g1
 wYvWVt/ubaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZo6SJAAKCRDBN2bmhouD
 15bWEACAaf3dT5VsD8GZ8Rbqic9br3Rncjy5nt82JwTLjCKlaG0ZWMvXtguF9r6P9t4oFBNtwbP
 lf7vdP6ZNULbwxGP8b154ZMSIhTMCuTV6GXPdinTz1xspQbsy7YYqBPwUZT9eY8hpNbDHlIsoAa
 XXxJ7rhTj+u0fhCC7i+vhYJi0HB2MAg0PulIKW15FmingqlbFYokHmI2ubPcylDYCkk9V160icV
 1fxrRCOpVs5aYqaov5AfVsvqZjQHgQiVLqpRNdOWSUKxok/UoaRmQR2Y4ONBvx1+SeZaWw/g7K6
 l5nYzrfHx/yECm7CGdS5Zujm44tCpyWfOU6pUL1F+ryg5i5EFr7s//ehL+9xyOB4EkfXq5HHK++
 zO0H/b7+zdMW7wyryHpgr828JNlLDnhDRpz8zYCpUHKIMGUe4LKyRcC7p7LoyYT69J7H6OpZqcU
 cJXusUwEjdcjB7dYqcnAUHCnnWSIFkGTNcOe8zEsSxkxJ0QP4CcElnC51P+BmfDcB0nUDVjLp4r
 Z7ZAFhzeKCgHbYvGoaZ51gci/dsjh2b49QtT4MzP3SE3+LL+rIo2Dwd7wsxu4AXt/BX8h372/od
 sAZl0TU1JekeEyLxykRCRpG6DIB3+gZKI9An/uMIDnAkhNB29jZcPI7l96LzybL+bTDmV4mxf3p
 jJKcqTrxGtdYbPg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

If reading version and variant from registers fails (which is unlikely
but possible, because it is a read over bus), the driver will proceed
and perform device configuration based on uninitialized stack variables.
Handle it a bit better - bail out without doing any init and failing the
update status Soundwire callback.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wsa883x.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
index f5a15f0e891e..60b78560f4b7 100644
--- a/sound/soc/codecs/wsa883x.c
+++ b/sound/soc/codecs/wsa883x.c
@@ -997,15 +997,19 @@ static const struct reg_sequence reg_init[] = {
 	{WSA883X_GMAMP_SUP1, 0xE2},
 };
 
-static void wsa883x_init(struct wsa883x_priv *wsa883x)
+static int wsa883x_init(struct wsa883x_priv *wsa883x)
 {
 	struct regmap *regmap = wsa883x->regmap;
-	int variant, version;
+	int variant, version, ret;
 
-	regmap_read(regmap, WSA883X_OTP_REG_0, &variant);
+	ret = regmap_read(regmap, WSA883X_OTP_REG_0, &variant);
+	if (ret)
+		return ret;
 	wsa883x->variant = variant & WSA883X_ID_MASK;
 
-	regmap_read(regmap, WSA883X_CHIP_ID0, &version);
+	ret = regmap_read(regmap, WSA883X_CHIP_ID0, &version);
+	if (ret)
+		return ret;
 	wsa883x->version = version;
 
 	switch (wsa883x->variant) {
@@ -1040,6 +1044,8 @@ static void wsa883x_init(struct wsa883x_priv *wsa883x)
 				   WSA883X_DRE_OFFSET_MASK,
 				   wsa883x->comp_offset);
 	}
+
+	return 0;
 }
 
 static int wsa883x_update_status(struct sdw_slave *slave,
@@ -1048,7 +1054,7 @@ static int wsa883x_update_status(struct sdw_slave *slave,
 	struct wsa883x_priv *wsa883x = dev_get_drvdata(&slave->dev);
 
 	if (status == SDW_SLAVE_ATTACHED && slave->dev_num > 0)
-		wsa883x_init(wsa883x);
+		return wsa883x_init(wsa883x);
 
 	return 0;
 }

-- 
2.43.0


