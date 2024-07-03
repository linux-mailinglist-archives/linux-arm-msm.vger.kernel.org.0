Return-Path: <linux-arm-msm+bounces-25145-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F1D92602E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 14:22:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C20CAB30B5D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 12:13:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B92001741D2;
	Wed,  3 Jul 2024 12:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JXE5XhlX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E65217C218
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jul 2024 12:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720008686; cv=none; b=Qahww7GzuP4BnKnJYCLUgSZ1lA4loHHS8bg9Qo2FxnOzT4R4OnLXMJ//IKmcsgrN/VRf4FsUdN3Tw16BbMwHbM9kPyspYp/33HUTsmSovGIoarG2zTzOutVXuIfn1DAVM6QxTdEA7K0SAUwLp7nAcaeupP61eelrMq7WGo689aU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720008686; c=relaxed/simple;
	bh=PRQQy74IKpWXY3QRzTxqKhhESPCzDa1EA9BIIyylgGQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=imwPpXfd2dXKSWytqyY0yaoMvZhZs6cLMCeH2GMAHom/r7b72CGGWxiOa1FZInDRQ/jkJ0yRchlV8UeGu61cEBSCMF3WB6a1ON1AG9EHEUuRZHKhLo1jE6IBekd++VBaveNdMtoz6Z8gIQY7/YaxglXBd4ibwqi3vqgYsLlToYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JXE5XhlX; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-36796aee597so170077f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jul 2024 05:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720008683; x=1720613483; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vKX4owx3K95iTAC+SEBiaFm2gE/o+uY6tBcM1pCKsoI=;
        b=JXE5XhlXpGdYSSWjWmz4OcIsoTqLHamRpAUjunYHUg20ClujfePYILc0PRc+JEnON7
         NXJcqnsTlVdXOtZKIquHHPCbZnMnCaeZn5AmL4/fjaL8g9NrOOZuzVGSM+cte2VevK+1
         kI0xzUC2P5pufFI0Hpnu7XzN1N3RYzKpK3G9j0oX7MZkzxngi+j/SipoRItLzdEmpd1W
         alRKr/bBXgNsdxzVXV5o9LrDu7iQH7bE2qBzyAwW0gcM/TbwGkQKLUBmQlRGXLY6Gm4B
         V6ibEHvsz3Hac0bQnnYHvqa609BBCqoJFGWi8buqh+NZTFoZm9KHFiay//O4EnffQ1lE
         r7Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720008683; x=1720613483;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vKX4owx3K95iTAC+SEBiaFm2gE/o+uY6tBcM1pCKsoI=;
        b=HFi5x9C4dZOYOmuOEERG6ayq0IlqxScHhBNx4afPJLQJWSEOaVZ5koOco5L1J3+Non
         MguvPt5NQMit+frQ0UnWTqy7e6xVVKZXnAE+Y9b2Sp7JgTWliIyzw8h69Og82MLhx+wf
         7TvN125YebYVPPQZ+wAms5J49Vhd5eAbZwg621LHzvMzoDqNrKwknvcYbA6oYd8otUgK
         oC0frsysKFn/SqoUwISpsvTW3O8V8Y3spA1A/TRxPgAniYMCIyMIyJR+871IF3npFpI7
         u+Osgoo5jgukKBLeuaFG/5av8tdNvIMLOoAouxxerv+61AkWObrLslxJGt2h217XrOTw
         bTfw==
X-Forwarded-Encrypted: i=1; AJvYcCVYckEuV1hm04sOQ+QbKEZIDoIOtfQgfqkP66YZN0VlwURVD90JdrEGHdGEG+qWU59vusvejh6aLmqO9Nri7+dAN9LpY2E09+6909UR9w==
X-Gm-Message-State: AOJu0YwutO4ZaDaLn0S/V7V6kpJ23bZOHetxn0/3PbYmjAGbIyR43Yh1
	qfCoMv0eHGI8VVsvkhoAuBJxrJmmIazCILPVP6D/LlCoJQn4ao05K0/P9Z9DzUK6TiKpAy112qL
	IuPU=
X-Google-Smtp-Source: AGHT+IGqluTLxpMaeApU+pNJokz5T0F4CHd4vNq0sR19A7/Trl8lK6C+BdOafaCFJJwBIDjLYOjGRw==
X-Received: by 2002:a5d:6a8f:0:b0:367:958e:9822 with SMTP id ffacd0b85a97d-367958e9b0fmr781281f8f.14.1720008683326;
        Wed, 03 Jul 2024 05:11:23 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a10307bsm15716222f8f.94.2024.07.03.05.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 05:11:22 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 03 Jul 2024 14:11:04 +0200
Subject: [PATCH 10/11] ASoC: dapm: Simplify dapm_cnew_widget() with
 cleanup.h
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240703-asoc-cleanup-h-v1-10-71219dfd0aef@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1635;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=PRQQy74IKpWXY3QRzTxqKhhESPCzDa1EA9BIIyylgGQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmhT/aXmraSNTcjJCjdJ7G8Qpn/Wj7KF+TwsTBT
 Oivb/6xzeaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZoU/2gAKCRDBN2bmhouD
 11BgD/44ltVETo8dFBbkx5BpxYgtnLMW1PexinlwUhGnV6rJEoMiokxjT1QHF7YpnBtavF+7d56
 FXFNhVMRkgrOaP//aW+RoWhx727o7KjPurvec9Yqbhvp1fZSgP2fzfaZkPIxsUosyeSu3NzPJeB
 2gc2vIuwe4BFZnGIE7eG4w4OYiGLR/xZYb2dfRU6YpjHJZJnReLTu59NgvCR/8PhgHJ9u3Typvp
 iOxG3vJyIYvwdOpQwCX7z+GzjkFRjVVM9p1ldTLsPbdNlwQ18xcTpo39j10W8Ijc0aRgtPxhoJ6
 6NiN83X57gYY6KiJb5KPUPrpB8y8UwPcofDE2PXISKRNjtpo2juJNETaGt5+9MiI6ZcNfIoynRG
 MPDOuvZFTU15x//703SoVXViSKKdAUzZAJxx24ZW0Co308aPReIdYK3u+qIXhk+U9S1EfdLohpS
 DD3UZtxoRBJCc/CuzDASsDeacECYBxmqqJ5vmKtr8dq+biTheT1CvoNE+9xs4ZFnCoYkD0FoidO
 4MFJ3J8LH34qn1kaSjgJSK/PgutLunY0Bv/VX6r9/vHVvG2BGITpq6Z9j4qLnXQ7oj2No5WitBi
 hl+ZIAONea82+MTev2qbmrxX0F0NsGwJdELbV/zdhdvgupKk7cZLdZvlyjKaS86GO/LBpUzvhni
 7zvb8cfJn3lBucg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Allocate the memory with scoped/cleanup.h in dapm_cnew_widget() to
reduce error handling (less error paths) and make the code a bit
simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/soc-dapm.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 16dad4a45443..236aa3c8eea1 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -20,6 +20,7 @@
 #include <linux/module.h>
 #include <linux/init.h>
 #include <linux/async.h>
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/pm.h>
 #include <linux/bitops.h>
@@ -323,9 +324,9 @@ static inline struct snd_soc_dapm_widget *dapm_cnew_widget(
 	const struct snd_soc_dapm_widget *_widget,
 	const char *prefix)
 {
-	struct snd_soc_dapm_widget *w;
-
-	w = kmemdup(_widget, sizeof(*_widget), GFP_KERNEL);
+	struct snd_soc_dapm_widget *w __free(kfree) = kmemdup(_widget,
+							      sizeof(*_widget),
+							      GFP_KERNEL);
 	if (!w)
 		return NULL;
 
@@ -333,20 +334,18 @@ static inline struct snd_soc_dapm_widget *dapm_cnew_widget(
 		w->name = kasprintf(GFP_KERNEL, "%s %s", prefix, _widget->name);
 	else
 		w->name = kstrdup_const(_widget->name, GFP_KERNEL);
-	if (!w->name) {
-		kfree(w);
+	if (!w->name)
 		return NULL;
-	}
 
 	if (_widget->sname) {
 		w->sname = kstrdup_const(_widget->sname, GFP_KERNEL);
 		if (!w->sname) {
 			kfree_const(w->name);
-			kfree(w);
 			return NULL;
 		}
 	}
-	return w;
+
+	return_ptr(w);
 }
 
 struct dapm_kcontrol_data {

-- 
2.43.0


