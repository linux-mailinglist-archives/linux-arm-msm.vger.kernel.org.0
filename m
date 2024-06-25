Return-Path: <linux-arm-msm+bounces-24132-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E027B916E9B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 18:57:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1CD831C2307A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 16:57:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46F1F176246;
	Tue, 25 Jun 2024 16:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m9Uh+AZo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 993A317623E
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jun 2024 16:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719334664; cv=none; b=Sd6F75nCTQY1Jt0Dnp+QfBUWCROTU9KodskUOkEOsbODoLviSJ3U50fhowFRSUm1Ait5Wjr22uLEe6mLoFJgtpKRaAwpciic7obDqkVspQpv6eRUrIm+YeTflyCCI/xTNGYvZtoOzUapLilc80v4Lq8rz4vcrxuJiRHVF7xyCBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719334664; c=relaxed/simple;
	bh=LPxzSDIC0bWWiTuwSNjSkbPq6ilg698BH/kDijwxfsY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Zorc5Q28KFO/JbUUeNAR9YAIskWjjPEjcWwgrHqJ9ATeJpFb9XlIo19KQ+2OkXAKkkW4VX11VH8ya140bI2zrHd3UyTUCLI3Gxi2iECg/hdiMCsdbrau2Xe1rxJpMy3EhEhg7E9zRNWe9W5Y0OzPy5iT4DhcnzFgIIhWdOUF/fY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m9Uh+AZo; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-52d259dbe3cso351834e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jun 2024 09:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719334661; x=1719939461; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j1XpUiv8RRrKO5F/X4U0smbjR19Jj8NAdavi9RRkoig=;
        b=m9Uh+AZoEdKJWRjAx+4MpBDYGAueiw2gAx9wDXgS5/dfbm6npOgaIZgZVD4be+wspD
         sr/uxY99mbwX+/oiDQs/WBocrY1U/OOfTx1pk9u6FmX2nzsX3xHUlmdDpwVqqH01bV3V
         EtCaO2j5ZW3sKOedFS2W4lC95j98lzpUUiHWR0yOttVLpNHEMF/92p4o+X4wQfxUlYpm
         iLjKlqOktIhWYM50/QgAsTW9baoZuXaRWgCnLay2vy7rQCVfdVXZPUzKtZYOY38b9P2g
         fvjqRKoyYNAXFTUpqmjTttrmB69IDZicPOrcJMiE7uOYxOSXYfbS37t9elj5a4EoeZx5
         v95A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719334661; x=1719939461;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j1XpUiv8RRrKO5F/X4U0smbjR19Jj8NAdavi9RRkoig=;
        b=wChUw9YtL09DU67mYegf8aQjIGmzx7JDuI0/4tQGpzl4Uk2aNCrmWhrIzp5oHjBCe0
         sMR7ouMeqODhD8XOCgMHSp/kAAnpwTjBkgp4BWKBmk5t8S/IHdQSLF1LMHz+FiL8CIU0
         wt1H/gKngiNxJWTYmFhNdW7nSPEI8S68d0eiTsKF4AFYD0uubpPpLgTgf9bYairIEGUo
         DN2b/w1rO9NqAsALIB+fHrXQ/bPnEzDwj4nG+gciNU/Oocrz8+aGeAOvLgf7fQs+EEnk
         Eo2jSCQkIkshicG6XZwebv8igEEPbQ4YPZ3AEHuqhAzcbWH3dnwSIlsA0z8PSxDoTLr3
         /hAw==
X-Forwarded-Encrypted: i=1; AJvYcCVVNXuBRIwmnRwCVQZrA9aDCGoLMkvMQfarElrVggTwWG742Ac6jaWZrg41yNwJ/qiN8vflIfcBSog777sfB6XJV9r6mP89fkMYXGDPWA==
X-Gm-Message-State: AOJu0Yx9E2lOIsweqLWrWs46tzZq19U2mn3ACwaKQA1vKe07/69CGIF0
	NnM+eMpQATFgA+CIjp8ESkeQqFHV1uq5IbRxHAfrBiVy5FRAztR9qCCpNY36eRk=
X-Google-Smtp-Source: AGHT+IF+dVYgyh8tXVU2XlGCKPydiP8H7EHqIFJAhnmGeg7Yj/64VIHLGroClHUHimYmWRgI8KJmSQ==
X-Received: by 2002:a05:6512:70c:b0:52c:e054:4149 with SMTP id 2adb3069b0e04-52ce0619798mr5410849e87.15.1719334660778;
        Tue, 25 Jun 2024 09:57:40 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3663a8cb6d2sm13360519f8f.111.2024.06.25.09.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 09:57:40 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] ASoC: codecs: lpass-macro: Gracefully handle unknown version
Date: Tue, 25 Jun 2024 18:57:35 +0200
Message-ID: <20240625165736.722106-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Qualcomm LPASS macro codec driver parses registers in order to
detect version of the codec.  It recognizes codecs v2.0 - v2.8, however
we know that there are earlier versions and 'enum lpass_codec_version'
has also v1.0, v1.1 and v1.2.  If by any chance we run on unrecognized
version, driver will use random value from the stack as the codec
version.

Fix it by mapping such cases to an enum of value 0:
LPASS_CODEC_VERSION_UNKNOWN.

Fixes: 378918d59181 ("ASoC: codecs: lpass-macro: add helpers to get codec version")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/lpass-macro-common.h | 3 ++-
 sound/soc/codecs/lpass-va-macro.c     | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/lpass-macro-common.h b/sound/soc/codecs/lpass-macro-common.h
index f6f1bfe8eb77..94697d0ba8c9 100644
--- a/sound/soc/codecs/lpass-macro-common.h
+++ b/sound/soc/codecs/lpass-macro-common.h
@@ -19,7 +19,8 @@ enum lpass_version {
 };
 
 enum lpass_codec_version {
-	LPASS_CODEC_VERSION_1_0 = 1,
+	LPASS_CODEC_VERSION_UNKNOWN,
+	LPASS_CODEC_VERSION_1_0,
 	LPASS_CODEC_VERSION_1_1,
 	LPASS_CODEC_VERSION_1_2,
 	LPASS_CODEC_VERSION_2_0,
diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
index ae80865cd459..f9262d7d2c26 100644
--- a/sound/soc/codecs/lpass-va-macro.c
+++ b/sound/soc/codecs/lpass-va-macro.c
@@ -1463,7 +1463,8 @@ static int va_macro_validate_dmic_sample_rate(u32 dmic_sample_rate,
 
 static void va_macro_set_lpass_codec_version(struct va_macro *va)
 {
-	int core_id_0 = 0, core_id_1 = 0, core_id_2 = 0, version;
+	int core_id_0 = 0, core_id_1 = 0, core_id_2 = 0;
+	int version = LPASS_CODEC_VERSION_UNKNOWN;
 
 	regmap_read(va->regmap, CDC_VA_TOP_CSR_CORE_ID_0, &core_id_0);
 	regmap_read(va->regmap, CDC_VA_TOP_CSR_CORE_ID_1, &core_id_1);
-- 
2.43.0


