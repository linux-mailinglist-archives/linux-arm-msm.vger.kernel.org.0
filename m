Return-Path: <linux-arm-msm+bounces-67918-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B17BFB1C732
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 16:00:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 70C9C6272BF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 14:00:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BE3628C844;
	Wed,  6 Aug 2025 14:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TXRsvFVf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BBA226CE13
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Aug 2025 14:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754488835; cv=none; b=YW2/b+x6xDPwAPLLrtfegO4w5IPAiZpZh1KAkxDiC3TBs+mbNB3d2O9IQuQbQtnOcNqzADXM1aOrI2FiXmX1XktGYUObWJsY6TwuiYtreJHlAp2981GlfxgVg9gEfJ0SV4eYxhgEyI/aT1YO9ww4CeQTVDn1QqITVUvBqKE6pSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754488835; c=relaxed/simple;
	bh=1e0Vl0DLzBwJ1AEPVtS966+I1J911xIBcPy784b2oeg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kn89zpOGxN2SA9F2DG3ahc+Mm7Lm0witQy9WDg6Zi5erb8jjbuc0kmpZFVEslZQoajMIwz0gllsVS3L+ZedKkwyyowZEGR91YZaHdUx2Rn0W0eI8Cp4jKgjGZzE6rt6IaxkL150kLU0mc5TmQd9vwXNIWzPcZkv3ak1Ht07zI0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TXRsvFVf; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3b78a034f17so4897089f8f.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Aug 2025 07:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754488832; x=1755093632; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S02Ags7WvqYe7LIFO8GxG705rWR0j/aMg3rhghXyds8=;
        b=TXRsvFVfVY220CPqMlInmShETRQpmZej6tRQe3dMved5lK2YaOpiXmUaooYIoIMsbI
         7ODb5DsWIMV5skC9U1xsuLoZN5mGkmaVHxsHYjYKm5+TlQbdN0FKXZPUJbRSSg0wpPXR
         YQ6VOC3jLyQllnaOnPWXfLQJEcM6kNb4rvobZe0k/I/DCE5iIvOkgHjhGCV0L4ORCcQZ
         u4WrQbMB5g4mojXDZMhtXQ6KFCBauzYGp9kwjwu0rD5K8MhPMjZdcfpybkpmEMduMwuo
         JVECkspqS8ODh+xCaV6HPCO1O6QblxoEshYp8l3PuJINi4HXKoDrULuB3iSlhhgdFWse
         Ojxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754488832; x=1755093632;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S02Ags7WvqYe7LIFO8GxG705rWR0j/aMg3rhghXyds8=;
        b=XLy8/bLaxer3H48gRu/dA+KocT4xa8lnE8VL3jSJqn/SSRlfanQihOvaqvkWo/VIjr
         joNfBg9SlYDiqwx4MUwOPmjA/mb9+IAG2cKyFXiritpsUE7bh/mDgaPxYgDqs9kKcMqO
         XgJXm1MRHOPIVyYf6jZIH2Q+iYJSrzadd2jSJCa8ryNzSJsJctMzvpI/7b2mojD2phZS
         3BRgxFleaOM40JqpXIBtrRvw+w6l8Nin7NzmQFXQHaC83ISRpt97Hz+DfyEpWZwuMng4
         chtYI9r8y/ixMWT6hgkc3Jns8NG+fsaGrgUj1Xfh50fRml2bFFPvMTECRxDh5InBGP87
         4EtA==
X-Forwarded-Encrypted: i=1; AJvYcCXuYCHqjiRARY12J50twHn7q13VHSaK63hGmVQ4AU3cQCQxPjMQVXQfC82Whv/brXoj+eZnjxbLF07NQiAU@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3+ydBsX4x2o2gL2sNLUmNKKWtz2yyw2NeMTzhUqmJdKRVReIF
	3q8nvxeFPbDEXxhrpG24tvLj47txJplTslTgX8PP5F12vHuD/WCTik4meEnGQrsXdS4=
X-Gm-Gg: ASbGnctgDlUUtE6V5+BG2MHKaQ48JqS+QBhywWFCiAuw2Cm4t2wKvvhn1kHJsq8mTPO
	idEkXucHfd7TgAENk1i+3aiCi/BJlHaREkA7qRuwiSXOssP9oKiKF6MaOH1EPhQeE0PLFEZGTlC
	n5DlWeY2/XkgtVCGWPTjSVS98l/Zo/N3rIm0cc246m6Q3r54dO4HUzNHZU6dHwpo6xYlVRYP7yV
	FJwosLrUzrngBzvfeZgI8B4EIWwLKcYEyXAaWuLBK1scNWYt/103N4RXawRLU7NAl4rqOd4mkl4
	gKu02vX4NMxW3zFXH53rYvM/NKP+crHZF+D+lIjEh4i/i/ah99IuU+2t0rA/LXcp0g32BDZqW9x
	eqxDrvQ938VWc3A38+tRTlgCRalcxxNC1u/mfvPdbMp4=
X-Google-Smtp-Source: AGHT+IETmAlWMwJ2qjfxtHRSSLJlNaDSRStt3AyM41fvjsH5fd9IH28npg8xRcL+NtabnZE8k9FKKw==
X-Received: by 2002:a05:6000:22c7:b0:3b5:f0af:4bb0 with SMTP id ffacd0b85a97d-3b8f48e046emr2027583f8f.23.1754488831620;
        Wed, 06 Aug 2025 07:00:31 -0700 (PDT)
Received: from localhost.localdomain ([2a00:2381:fd67:101:6c39:59e6:b76d:825])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459c58ed07fsm147276365e9.22.2025.08.06.07.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 07:00:31 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: linux-sound@vger.kernel.org,
	srini@kernel.org,
	broonie@kernel.org,
	lgirdwood@gmail.com
Cc: perex@perex.cz,
	tiwai@suse.com,
	neil.armstrong@linaro.org,
	linux-arm-msm@vger.kernel.org,
	krzysztof.kozlowski@linaro.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] ASoC: codecs: tx-macro: correct tx_macro_component_drv name
Date: Wed,  6 Aug 2025 15:00:30 +0100
Message-ID: <20250806140030.691477-1-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We already have a component driver named "RX-MACRO", which is
lpass-rx-macro.c. The tx macro component driver's name should
be "TX-MACRO" accordingly. Fix it.

Cc: Srinivas Kandagatla <srini@kernel.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
---

v2:
  - added tag from Neil, corrected Srini's email;
  - changed commit description (reworded).

First version: https://lore.kernel.org/linux-sound/20241016215930.1144527-1-alexey.klimov@linaro.org/

 sound/soc/codecs/lpass-tx-macro.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
index 40d79bee4584..1da34cb3505f 100644
--- a/sound/soc/codecs/lpass-tx-macro.c
+++ b/sound/soc/codecs/lpass-tx-macro.c
@@ -2229,7 +2229,7 @@ static int tx_macro_register_mclk_output(struct tx_macro *tx)
 }
 
 static const struct snd_soc_component_driver tx_macro_component_drv = {
-	.name = "RX-MACRO",
+	.name = "TX-MACRO",
 	.probe = tx_macro_component_probe,
 	.controls = tx_macro_snd_controls,
 	.num_controls = ARRAY_SIZE(tx_macro_snd_controls),
-- 
2.47.2


